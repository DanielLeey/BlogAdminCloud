package com.lee.article.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.article.dao.BlogSortMapper;
import com.lee.article.service.BlogSortService;
import com.lee.common.Request.BlogSortRequest;
import com.lee.common.bo.BlogSortListRecordBO;
import com.lee.common.entity.BlogSort;
import com.lee.common.utils.UUidUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * @Author: liyansong
 * @Date: 2022/12/24 17:05
 * @Version: 1.0
 */
@Service("blogSortService")
public class BlogSortServiceImpl extends ServiceImpl<BlogSortMapper, BlogSort> implements BlogSortService {

    @Autowired
    private BlogSortMapper blogSortMapper;

    @Override
    public List<BlogSortListRecordBO> getBlogSortList(BlogSortRequest blogSortRequest) throws NoSuchFieldException, ClassNotFoundException {
        Page<BlogSort> page = new Page<>(blogSortRequest.getCurrentPage(), blogSortRequest.getPageSize());
        QueryWrapper<BlogSort> wrapper = new QueryWrapper<>();
        if (StrUtil.isNotBlank(blogSortRequest.getOrderByAscColumn())) {
            final String orderByAscColumn = blogSortRequest.getOrderByAscColumn();
            blogSortOrderBy(wrapper, orderByAscColumn, true);
        }
        if (StrUtil.isNotBlank(blogSortRequest.getOrderByDescColumn())) {
            final String orderByDescColumn = blogSortRequest.getOrderByDescColumn();
            blogSortOrderBy(wrapper, orderByDescColumn, false);
        }
        List<BlogSort> blogList = page(page, wrapper).getRecords();
        List<BlogSortListRecordBO> list = new ArrayList<>(blogList.size());
        blogList.forEach(blogSort -> {
            BlogSortListRecordBO blogSortListRecordBO = new BlogSortListRecordBO();
            BeanUtils.copyProperties(blogSort, blogSortListRecordBO);
            list.add(blogSortListRecordBO);
        });
        return list;
    }

    @Override
    public Boolean stick(String uid) {
        int count = blogSortMapper.stick(uid);
        return count > 0;
    }

    @Override
    public Boolean editBLogSort(BlogSortRequest blogSortRequest) {
        BlogSort blogSort = new BlogSort();
        BeanUtils.copyProperties(blogSortRequest, blogSort);
        final int count = blogSortMapper.updateById(blogSort);
        return count > 0;
    }

    @Override
    public Boolean deleteBatch(List<String> uids) {
        final int count = blogSortMapper.deleteBatch(uids);
        return count > 0;
    }

    @Override
    public Boolean blogSortByClickCount() {
        int count = blogSortMapper.updateSortByClickCount();
        return count > 0;
    }

    @Override
    public Boolean addBlogSortList(BlogSortRequest blogSortRequest) {
        BlogSort blogSort = new BlogSort();
        BeanUtils.copyProperties(blogSortRequest, blogSort);
        blogSort.setUid(UUidUtils.getUUId());
        final Date date = new Date();
        blogSort.setCreateTime(date);
        blogSort.setUpdateTime(date);
        blogSort.setStatus(1);
        blogSort.setClickCount(0);
        final int count = blogSortMapper.insert(blogSort);
        return count > 0;
    }

    private void blogSortOrderBy(QueryWrapper<BlogSort> wrapper, String column, Boolean isAsc) throws ClassNotFoundException, NoSuchFieldException {
        final Class<?> clazz = Class.forName("com.lee.common.entity.BlogSort");
        final Optional<TableField> tableFieldAnnotation = Arrays.stream(clazz.getDeclaredField(column).getAnnotationsByType(TableField.class)).findFirst();
        final TableField tableField = tableFieldAnnotation.get();
        wrapper.orderBy(true, isAsc, tableField.value());
    }
}

