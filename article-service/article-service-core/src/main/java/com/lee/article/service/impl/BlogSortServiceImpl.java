package com.lee.article.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.article.dao.BlogSortMapper;
import com.lee.article.service.BlogSortService;
import com.lee.common.Request.BlogSortRequest;
import com.lee.common.bo.BlogSortListRecordBO;
import com.lee.common.Request.BaseRequest;
import com.lee.common.entity.BlogSort;
import com.lee.common.utils.UUidUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
    public List<BlogSortListRecordBO> getBlogSortList(BaseRequest baseRequest) {
        Page<BlogSort> page = new Page<>(baseRequest.getCurrentPage(), baseRequest.getPageSize());
        LambdaQueryWrapper<BlogSort> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(BlogSort::getStatus, 1);
        wrapper.orderByDesc(BlogSort::getSort);
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
}

