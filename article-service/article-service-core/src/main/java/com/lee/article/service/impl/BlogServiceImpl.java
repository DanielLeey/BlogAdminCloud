package com.lee.article.service.impl;

import cn.hutool.core.lang.UUID;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.api.UserFeignService;
import com.lee.article.dao.BlogMapper;
import com.lee.article.service.BlogService;
import com.lee.article.service.BlogSortService;
import com.lee.article.service.TagService;
import com.lee.common.Request.BlogAddRequest;
import com.lee.common.Request.BlogEditRequest;
import com.lee.common.Request.BlogRequest;
import com.lee.common.ThreadHolder.UserThreadHolder;
import com.lee.common.bo.BlogListRecordBO;
import com.lee.common.entity.Blog;
import com.lee.common.entity.BlogSort;
import com.lee.common.entity.Tag;
import com.lee.common.entity.User;
import com.lee.common.utils.UUidUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/24 15:33
 * @Version: 1.0
 */
@Service("blogService")
public class BlogServiceImpl extends ServiceImpl<BlogMapper, Blog> implements BlogService {

    @Autowired
    private BlogMapper blogMapper;

    @Autowired
    private TagService tagService;

    @Autowired
    private BlogSortService blogSortService;

    @Autowired
    private UserFeignService userService;

    @Override
    public List<BlogListRecordBO> getBlogList(BlogRequest blogRequest) {
        LambdaQueryWrapper<Blog> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Blog::getStatus, 1);
        if (StrUtil.isNotBlank(blogRequest.getBlogSortUid())) {
            wrapper.eq(Blog::getBlogSortUid, blogRequest.getBlogSortUid());
        }
        if (StrUtil.isNotBlank(blogRequest.getTagUid())) {
            wrapper.eq(Blog::getTagUid, blogRequest.getTagUid());
        }
        if (StrUtil.isNotBlank(blogRequest.getBlogSortUid())) {
            wrapper.eq(Blog::getBlogSortUid, blogRequest.getBlogSortUid());
        }
        if (StrUtil.isNotEmpty(blogRequest.getIsOriginal())) {
            wrapper.eq(Blog::getIsOriginal, blogRequest.getIsOriginal());
        }
        if (StrUtil.isNotEmpty(blogRequest.getIsPublish())) {
            wrapper.eq(Blog::getIsPublish, blogRequest.getIsPublish());
        }
        if (StrUtil.isNotBlank(blogRequest.getLevelKeyword())) {
            wrapper.eq(Blog::getLevel, blogRequest.getLevelKeyword());
        }
        Page<Blog> page = new Page<>(blogRequest.getCurrentPage(), blogRequest.getPageSize());
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

    @Override
    public Boolean editBlog(BlogEditRequest blogEditRequest) {
        Blog blog = new Blog();
        BeanUtils.copyProperties(blogEditRequest, blog);
        blog.setUpdateTime(new Date());
        return updateById(blog);
    }

    @Override
    public Boolean addBlog(BlogAddRequest blogAddRequest) {
        User user = UserThreadHolder.get();
        Blog blog = new Blog();
        BeanUtils.copyProperties(blogAddRequest, blog);
        blog.setUid(UUidUtils.getUUId());
        blog.setClickCount(0);
        blog.setCollectCount(0);
        blog.setStatus(1);
        Date date = new Date();
        blog.setCreateTime(date);
        blog.setUpdateTime(date);
        blog.setAdminUid(userService.getAdminUid());
        blog.setSort(0);
        blog.setUserUid(user.getId()+"");
        blog.setArticleSource(0);
        final int count = blogMapper.insert(blog);
        return count > 0;
    }

    @Override
    public Boolean deleteBlog(String uid) {
        UpdateWrapper<Blog> updateWrapper = new UpdateWrapper();
        updateWrapper.lambda().eq(Blog::getUid, uid).set(Blog::getStatus, 0);
        return update(null, updateWrapper);
    }

    @Override
    public Boolean deleteBatch(List<String> uids) {
        final int count = blogMapper.deleteBatch(uids);
        return count > 0;
    }
}
