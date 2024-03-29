package com.lee.article.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.ObjUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.api.AuthFeignService;
import com.lee.article.dao.BlogMapper;
import com.lee.article.service.BlogService;
import com.lee.article.service.BlogSortService;
import com.lee.article.service.CommentService;
import com.lee.article.service.TagService;
import com.lee.common.Request.BlogAddRequest;
import com.lee.common.Request.BlogEditRequest;
import com.lee.common.Request.BlogRequest;
import com.lee.common.Request.CommentAddRequest;
import com.lee.common.ThreadHolder.UserThreadHolder;
import com.lee.common.bo.BlogListRecordBO;
import com.lee.common.entity.*;
import com.lee.common.message.PlacePayEvent;
import com.lee.common.message.PlacePayEventMessage;
import com.lee.common.utils.UUidUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

/**
 * @Author: liyansong
 * @Date: 2022/12/24 15:33
 * @Version: 1.0
 */
@Service("blogService")
@Slf4j
public class BlogServiceImpl extends ServiceImpl<BlogMapper, Blog> implements BlogService {

    // 观察者模式
    @Autowired
    private ApplicationEventPublisher applicationEventPublisher;

    @Autowired
    private BlogMapper blogMapper;

    @Autowired
    private TagService tagService;

    @Autowired
    private BlogSortService blogSortService;

    @Autowired
    private AuthFeignService userService;

    @Autowired
    @Lazy
    private CommentService commentService;

    @Override
    public List<BlogListRecordBO> getBlogList(BlogRequest blogRequest) throws ClassNotFoundException, NoSuchFieldException {
        QueryWrapper<Blog> wrapper = new QueryWrapper<>();
        wrapper.eq("status", 1);
        if (StrUtil.isNotBlank(blogRequest.getTagUid())) {
            wrapper.eq("tag_uid", blogRequest.getTagUid());
        }
        if (StrUtil.isNotBlank(blogRequest.getBlogSortUid())) {
            wrapper.eq("blog_sort_uid", blogRequest.getBlogSortUid());
        }
        if (StrUtil.isNotEmpty(blogRequest.getIsOriginal())) {
            wrapper.eq("is_original", blogRequest.getIsOriginal());
        }
        if (StrUtil.isNotEmpty(blogRequest.getIsPublish())) {
            wrapper.eq("is_publish", blogRequest.getIsPublish());
        }
        if (StrUtil.isNotBlank(blogRequest.getLevelKeyword())) {
            wrapper.eq("level", blogRequest.getLevelKeyword());
        }
        if (StrUtil.isNotBlank(blogRequest.getOrderByAscColumn())) {
            final String orderByAscColumn = blogRequest.getOrderByAscColumn();
            blogOrderBy(wrapper, orderByAscColumn, true);
        }
        if (StrUtil.isNotBlank(blogRequest.getOrderByDescColumn())) {
            final String orderByDescColumn = blogRequest.getOrderByDescColumn();
            blogOrderBy(wrapper, orderByDescColumn, false);
        }
        Page<Blog> page = new Page<>(blogRequest.getCurrentPage(), blogRequest.getPageSize());
        List<Blog> blogList = page(page, wrapper).getRecords();
        return getRecordBO(blogList);
    }

    private void blogOrderBy(QueryWrapper<Blog> wrapper, String column, Boolean isAsc) throws ClassNotFoundException, NoSuchFieldException {
        final Class<?> clazz = Class.forName("com.lee.common.entity.Blog");
        final Optional<TableField> tableFieldAnnotation = Arrays.stream(clazz.getDeclaredField(column).getAnnotationsByType(TableField.class)).findFirst();
        final TableField tableField = tableFieldAnnotation.get();
        wrapper.orderBy(true, isAsc, tableField.value());
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
        blog.setUserUid(user.getUid());
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

    @Override
    public List<BlogListRecordBO> getBlogListByUids(List<String> blogUids, Integer currentPage, Integer pageSize) {
        if (CollUtil.isEmpty(blogUids)) {
            return null;
        }
        LambdaQueryWrapper<Blog> wrapper = new LambdaQueryWrapper<>();
        wrapper.in(Blog::getUid, blogUids);
        Page<Blog> page = new Page<>(currentPage, pageSize);
        List<Blog> blogList = page(page, wrapper).getRecords();
        return getRecordBO(blogList);
    }

    @Override
    public Boolean pay(String id) {
        log.info("[placePay] start.");
        //消息
        PlacePayEventMessage eventMessage = new PlacePayEventMessage();
        User user = UserThreadHolder.get();
        eventMessage.setBlogId(id);
        eventMessage.setUserId(user.getUid());
        //发布事件
        applicationEventPublisher.publishEvent(new PlacePayEvent(eventMessage));
        log.info("[placeOrder] end.");
        return true;
    }

    @Override
    public List<BlogListRecordBO> getBlogByLevel(Integer currentPage, Integer pageSize, Integer level, Integer useSort) {
        QueryWrapper<Blog> wrapper = new QueryWrapper<>();
        if (ObjUtil.isNotEmpty(level)) {
            wrapper.eq("level", level);
        }
        if (ObjUtil.isNotEmpty(useSort)) {
            wrapper.eq("sort", useSort);
        }
        Page<Blog> page = new Page<>(currentPage, pageSize);
        List<Blog> blogList = page(page, wrapper).getRecords();
        return getRecordBO(blogList);
    }

    @Override
    public List<BlogListRecordBO> getNewBlog(Integer currentPage, Integer pageSize) {
        LambdaQueryWrapper<Blog> wrapper = new LambdaQueryWrapper<>();
        wrapper.orderByDesc(Blog::getCreateTime);
        Page<Blog> page = new Page<>(currentPage, pageSize);
        List<Blog> blogList = page(page, wrapper).getRecords();
        return getRecordBO(blogList);
    }

    @Override
    public List<BlogListRecordBO> getHotBlog() {
        LambdaQueryWrapper<Blog> wrapper = new LambdaQueryWrapper<>();
        wrapper.orderByDesc(Blog::getClickCount);
        Page<Blog> page = new Page<>(1, 5);
        List<Blog> blogList = page(page, wrapper).getRecords();
        return getRecordBO(blogList);
    }

    @Override
    public BlogListRecordBO getBlogByUid(String uid, String oid) {
        LambdaQueryWrapper<Blog> wrapper = new LambdaQueryWrapper<>();
        if (StrUtil.isNotBlank(uid)) {
            wrapper.eq(Blog::getUid, uid);
        }
        if (StrUtil.isNotBlank(oid)) {
            wrapper.eq(Blog::getOid, oid);
        }
        Blog blog = getOne(wrapper);
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
        BlogListRecordBO blogListRecordBO = new BlogListRecordBO();
        blogListRecordBO.setBlogSort(blogSort);
        blogListRecordBO.setTagList(tagList);
        BeanUtils.copyProperties(blog, blogListRecordBO);
        return blogListRecordBO;
    }

    @Override
    public List<BlogListRecordBO> getSameBlogByBlogUid(String blogUid) {
        List<Blog> blogList = blogMapper.getSameBlogByBlogUid(blogUid);
        return getRecordBO(blogList);
    }

    @Override
    public List<String> getSortList() {
        List<String> dateList = blogMapper.getSortList();
        if (CollUtil.isNotEmpty(dateList)) {
            return dateList.stream().map(date -> {
                date.replace("-", "年");
                date.concat("月");
                return date;
            }).collect(Collectors.toList());
        }
        return new ArrayList<>();
    }

    @Override
    public List<BlogListRecordBO> getArticleByMonth(String monthDate) {
        if (StrUtil.isBlank(monthDate)) {
            return new ArrayList<>();
        }
        String begDate = monthDate + "-01";
        final DateTime endDateTime = DateUtil.offsetMonth(DateUtil.parse(begDate), 1);
        String endDate = DateUtil.formatDate(endDateTime);
        List<Blog> blogs = blogMapper.getArticleByMonth(begDate, endDate);
        return getRecordBO(blogs);
    }

    /**
     * 插入comment评论表一条数据，更新blog表的点赞数，返回blog的点赞数
     * 重复点赞，插入失败
     * @param uid
     * @return
     */
    @Override
    public Integer praiseBlogByUid(String uid) {
        final User user = UserThreadHolder.get();
        final String userUid = user.getUid();
        LambdaQueryWrapper<Comment> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Comment::getUserUid, userUid)
                .eq(Comment::getBlogUid, uid);
        final Comment comment = commentService.getOne(wrapper);
        //已经点过赞了
        if(ObjUtil.isNotEmpty(comment)) {
            return -1;
        }
        //没点过赞，则插入一条点赞评论，更新文章点赞数
        CommentAddRequest addRequest = CommentAddRequest.builder().blogUid(uid).userUid(userUid).source("BLOG_INFO").build();
        commentService.addComment(addRequest);
        blogMapper.addBlogCollectCount(uid);
        Blog blog = blogMapper.selectById(uid);
        return blog.getCollectCount();
    }


    private List<BlogListRecordBO> getRecordBO(List<Blog> blogList) {
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
            BlogListRecordBO blogListRecordBO = new BlogListRecordBO();
            blogListRecordBO.setBlogSort(blogSort);
            blogListRecordBO.setTagList(tagList);
            BeanUtils.copyProperties(blog, blogListRecordBO);
            blogListVOList.add(blogListRecordBO);
        }
        return blogListVOList;
    }

}
