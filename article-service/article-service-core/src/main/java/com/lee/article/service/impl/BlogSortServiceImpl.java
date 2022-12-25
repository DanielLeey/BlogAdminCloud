package com.lee.article.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.article.dao.BlogSortMapper;
import com.lee.article.service.BlogSortService;
import com.lee.common.bo.BlogSortListRecordBO;
import com.lee.common.entity.BaseQuery;
import com.lee.common.entity.BlogSort;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/24 17:05
 * @Version: 1.0
 */
@Service("blogSortService")
public class BlogSortServiceImpl extends ServiceImpl<BlogSortMapper, BlogSort> implements BlogSortService {

    @Override
    public List<BlogSortListRecordBO> getBlogSortList(BaseQuery baseQuery) {
        Page<BlogSort> page = new Page<>(baseQuery.getCurrentPage(), baseQuery.getPageSize());
        List<BlogSort> blogList = page(page).getRecords();
        List<BlogSortListRecordBO> list = new ArrayList<>(blogList.size());
        blogList.forEach(blogSort -> {
            BlogSortListRecordBO blogSortListRecordBO = new BlogSortListRecordBO();
            BeanUtils.copyProperties(blogSort, blogSortListRecordBO);
            list.add(blogSortListRecordBO);
        });
        return list;
    }
}

