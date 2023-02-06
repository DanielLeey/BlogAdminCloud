package com.lee.article.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.ObjUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.api.AuthFeignService;
import com.lee.api.UserFeignService;
import com.lee.article.dao.CommentMapper;
import com.lee.article.service.BlogService;
import com.lee.article.service.CommentService;
import com.lee.common.Request.CommentRequest;
import com.lee.common.bo.CommentBO;
import com.lee.common.entity.Blog;
import com.lee.common.entity.Comment;
import com.lee.common.entity.User;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @Author: liyansong
 * @Date: 2022/12/13 10:01
 * @Version: 1.0
 */
@Service("commentService")
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements CommentService {

    @Autowired
    private AuthFeignService authFeignService;

    @Autowired
    private UserFeignService userFeignService;

    @Autowired
    private BlogService blogService;

    public static String SourceType = "all";

    @Override
    public List<CommentBO> getList(CommentRequest commentRequest) {
        LambdaQueryWrapper<Comment> wrapper = new LambdaQueryWrapper<>();
        if (StrUtil.isNotBlank(commentRequest.getSource()) && !SourceType.equals(commentRequest.getSource())) {
            wrapper.eq(Comment::getSource, commentRequest.getSource());
        }
        // 0：评论；1：点赞
        if (ObjUtil.isNotEmpty(commentRequest.getType())) {
            wrapper.eq(Comment::getType, commentRequest.getType());
        }
        // 博客Uid
        if (ObjUtil.isNotEmpty(commentRequest.getBlogUid())) {
            wrapper.eq(Comment::getBlogUid, commentRequest.getBlogUid());
        }
        User commentUser = null;
        if (StrUtil.isNotBlank(commentRequest.getUserName())) {
            commentUser = authFeignService.getUserByUsername(commentRequest.getUserName());
            wrapper.eq(Comment::getUserUid, commentUser.getId());
        }
        Page<Comment> page = new Page<>(commentRequest.getCurrentPage(), commentRequest.getPageSize());
        final List<Comment> commentList = page(page, wrapper).getRecords();
        Map<String, Blog> blogMap = new HashMap<>();
        if (CollUtil.isNotEmpty(commentList)) {
            // 得到所有评论的 文章id，放入map
            final List<String> blogIdList = commentList.stream().map(Comment::getBlogUid).distinct().collect(Collectors.toList());
            final List<Blog> blogList = blogService.listByIds(blogIdList);
            blogList.forEach(blog -> blogMap.put(blog.getUid(), blog));
        }

        // 得到所有评论的 用户id，放入map
        List<User> userList = new ArrayList<>();
        if (ObjUtil.isEmpty(commentUser)) {
            List<String> userIdList = commentList.stream().map(Comment::getUserUid).distinct().collect(Collectors.toList());
            userList = userFeignService.getUsersByIds(userIdList);
        } else {
            userList.add(commentUser);
        }
        Map<String, User> userMap = new HashMap<>(userList.size());
        userList.forEach(user -> userMap.put(user.getId() + "", user));
        // 如果request中不包含userName，需要查找所有user
        return commentList.stream().map(comment -> {
            final CommentBO commentBO = new CommentBO();
            BeanUtils.copyProperties(comment, commentBO);
            commentBO.setBlog(blogMap.get(comment.getBlogUid()));
            commentBO.setUser(userMap.get(comment.getUserUid()));
            return commentBO;
        }).collect(Collectors.toList());
    }

    @Override
    public Integer getSize(CommentRequest commentRequest) {
        LambdaQueryWrapper<Comment> wrapper = new LambdaQueryWrapper<>();
        if (StrUtil.isNotBlank(commentRequest.getSource()) && !SourceType.equals(commentRequest.getSource())) {
            wrapper.eq(Comment::getSource, commentRequest.getSource());
        }
        // 0：评论；1：点赞
        wrapper.eq(Comment::getType, commentRequest.getType());
        User commentUser = null;
        if (StrUtil.isNotBlank(commentRequest.getUserName())) {
            commentUser = authFeignService.getUserByUsername(commentRequest.getUserName());
            wrapper.eq(Comment::getUserUid, commentUser.getId());
        }
        Page<Comment> page = new Page<>(commentRequest.getCurrentPage(), commentRequest.getPageSize());
        return (int) page(page, wrapper).getSize();
    }
}
