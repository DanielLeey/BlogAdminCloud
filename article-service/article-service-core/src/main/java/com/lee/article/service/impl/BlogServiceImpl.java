package com.lee.article.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.article.dao.BlogMapper;
import com.lee.article.service.BlogService;
import com.lee.article.service.BlogSortService;
import com.lee.article.service.TagService;
import com.lee.common.Query.BlogQuery;
import com.lee.common.bo.BlogListRecordBO;
import com.lee.common.entity.Blog;
import com.lee.common.entity.BlogSort;
import com.lee.common.entity.Tag;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/24 15:33
 * @Version: 1.0
 */
@Service("blogService")
public class BlogServiceImpl extends ServiceImpl<BlogMapper, Blog> implements BlogService {

    @Autowired
    private TagService tagService;

    @Autowired
    private BlogSortService blogSortService;

    @Override
    public List<BlogListRecordBO> getBlogList(BlogQuery blogQuery) {
        LambdaQueryWrapper<Blog> wrapper = new LambdaQueryWrapper<>();
        if (StrUtil.isNotBlank(blogQuery.getBlogSortUid())) {
            wrapper.eq(Blog::getBlogSortUid, blogQuery.getBlogSortUid());
        }
        if (StrUtil.isNotBlank(blogQuery.getTagUid())) {
            wrapper.eq(Blog::getTagUid, blogQuery.getTagUid());
        }
        if (StrUtil.isNotBlank(blogQuery.getBlogSortUid())) {
            wrapper.eq(Blog::getBlogSortUid, blogQuery.getBlogSortUid());
        }
        if (StrUtil.isNotEmpty(blogQuery.getIsOriginal())) {
            wrapper.eq(Blog::getIsOriginal, blogQuery.getIsOriginal());
        }
        if (StrUtil.isNotEmpty(blogQuery.getIsPublish())) {
            wrapper.eq(Blog::getIsPublish, blogQuery.getIsPublish());
        }
        if (StrUtil.isNotBlank(blogQuery.getLevelKeyword())) {
            wrapper.eq(Blog::getLevel, blogQuery.getLevelKeyword());
        }
        Page<Blog> page = new Page<>(blogQuery.getCurrentPage(), blogQuery.getPageSize());
        List<Blog> blogList = page(page, wrapper).getRecords();
        List<BlogListRecordBO> blogListVOList = new ArrayList<>(blogList.size());
        for (Blog blog : blogList) {
            String blogSortUid = blog.getBlogSortUid();
            String tagUid = blog.getTagUid();
            BlogSort blogSort = null;
            if (StrUtil.isNotBlank(blogSortUid)) {
                LambdaQueryWrapper<BlogSort> blogSortWrapper = new LambdaQueryWrapper<>();
                blogSortWrapper.eq(BlogSort::getUid, blogSortUid);
                blogSort = blogSortService.getOne(blogSortWrapper);
            }
            List<Tag> tagList = null;
            if (StrUtil.isNotBlank(tagUid)) {
                LambdaQueryWrapper<Tag> tagWrapper = new LambdaQueryWrapper<>();
                tagWrapper.eq(Tag::getUid, tagUid);
                tagList = tagService.list(tagWrapper);
            }
            BlogListRecordBO blogListRecordBO = BlogListRecordBO.builder().blogSort(blogSort).tagList(tagList).build();
            BeanUtils.copyProperties(blog, blogListRecordBO);
            blogListVOList.add(blogListRecordBO);
        }
        return blogListVOList;
    }
}
