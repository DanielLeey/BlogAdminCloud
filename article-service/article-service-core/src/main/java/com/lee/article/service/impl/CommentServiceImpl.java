package com.lee.article.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.ObjUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.api.AuthFeignService;
import com.lee.api.UserFeignService;
import com.lee.article.dao.CommentMapper;
import com.lee.article.service.BlogService;
import com.lee.article.service.CommentService;
import com.lee.common.Request.BaseRequest;
import com.lee.common.Request.CommentAddRequest;
import com.lee.common.Request.CommentDeleteRequest;
import com.lee.common.Request.CommentRequest;
import com.lee.common.ThreadHolder.UserThreadHolder;
import com.lee.common.bo.CommentBO;
import com.lee.common.bo.CommentListBO;
import com.lee.common.bo.PraiseBO;
import com.lee.common.entity.Blog;
import com.lee.common.entity.Comment;
import com.lee.common.entity.User;
import com.lee.common.entity.User;
import com.lee.common.utils.UUidUtils;
import com.lee.common.vo.CommentListByUserVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
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

    @Autowired
    private CommentMapper commentMapper;

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
        if (StrUtil.isNotBlank(commentRequest.getUserName())) {
            User commentUser = authFeignService.getUserByUsername(commentRequest.getUserName());
            wrapper.eq(Comment::getUserUid, commentUser.getUid());
        }
        Page<Comment> page = new Page<>(commentRequest.getCurrentPage(), commentRequest.getPageSize());
        final List<Comment> commentList = page(page, wrapper).getRecords();

        return covertCommentBOList(commentList);
    }

    private List<CommentBO> covertCommentBOList(List<Comment> commentList) {
        if (CollUtil.isEmpty(commentList)) {
            return new ArrayList<CommentBO>();
        }
        Map<String, Blog> blogMap = new HashMap<>();
        Map<String, User> userMap = new HashMap<>();
        if (CollUtil.isNotEmpty(commentList)) {
            // 得到所有评论的 文章id，放入map
            final List<String> blogIdList = commentList.stream().map(Comment::getBlogUid).distinct().collect(Collectors.toList());
            final List<Blog> blogList = blogService.listByIds(blogIdList);
            blogList.forEach(blog -> blogMap.put(blog.getUid(), blog));
            // 得到所有评论的 用户id，放入map
            List<String> userIdList = commentList.stream().map(Comment::getUserUid).distinct().collect(Collectors.toList());
            List<User> userList = userFeignService.getUsersByIds(userIdList);
            userList.forEach(user -> userMap.put(user.getUid(), user));
        }
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
            wrapper.eq(Comment::getUserUid, commentUser.getUid());
        }
        Page<Comment> page = new Page<>(commentRequest.getCurrentPage(), commentRequest.getPageSize());
        return (int) page(page, wrapper).getSize();
    }

    /**
     * 新添加的消息为未读消息 status 2
     *
     * @param commentAddRequest
     * @return
     */
    @Override
    public Boolean addComment(CommentAddRequest commentAddRequest) {
        final Comment comment = new Comment();
        BeanUtils.copyProperties(commentAddRequest, comment);
        comment.setUid(UUidUtils.getUUId());
        comment.setStatus(2);
        Date date = new Date();
        comment.setCreateTime(date);
        comment.setUpdateTime(date);
        final int count = commentMapper.insert(comment);
        return count > 0;
    }

    @Override
    public List<CommentListBO> getReplyList(CommentRequest commentRequest) {
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
        wrapper.orderByAsc(Comment::getCreateTime);
        //博客下所有的评论
        final List<Comment> allComments = list(wrapper);
        wrapper.isNull(Comment::getToUserUid);
        Page<Comment> page = new Page<>(commentRequest.getCurrentPage(), commentRequest.getPageSize());
        //每一页的所有评论
        final List<Comment> commentList = page(page, wrapper).getRecords();

        // 得到所有评论的 user_uid，放入map
        List<User> UserList = new ArrayList<>();
        List<String> userIdList = allComments.stream().map(Comment::getUserUid).distinct().collect(Collectors.toList());
        UserList = userFeignService.getUsersByIds(userIdList);
        Map<String, User> userMap = new HashMap<>(UserList.size());
        UserList.forEach(user -> userMap.put(user.getUid(), user));
        // 得到所有评论的 to_user_uid，放入map
        List<User> toUserList = new ArrayList<>();
        List<String> toUserIdList = allComments.stream().map(Comment::getToUserUid).distinct().collect(Collectors.toList());
        toUserList = userFeignService.getUsersByIds(toUserIdList);
        Map<String, User> toUserMap = new HashMap<>(toUserList.size());
        toUserList.forEach(user -> toUserMap.put(user.getUid(), user));

        // 如果request中不包含userName，需要查找所有user
        List<CommentListBO> allCommentListBOs = allComments.stream().map(comment -> {
            final CommentListBO commentBO = new CommentListBO();
            BeanUtils.copyProperties(comment, commentBO);
            commentBO.setUser(userMap.get(comment.getUserUid()));
            commentBO.setToUser(toUserMap.get(comment.getToUid()));
            return commentBO;
        }).collect(Collectors.toList());
        List<CommentListBO> firstLevelCommentListBOs = commentList.stream().map(comment -> {
            final CommentListBO commentBO = new CommentListBO();
            BeanUtils.copyProperties(comment, commentBO);
            commentBO.setUser(userMap.get(comment.getUserUid()));
            commentBO.setToUser(toUserMap.get(comment.getToUid()));
            return commentBO;
        }).collect(Collectors.toList());
        // toUid uid
        for (CommentListBO commentListBO : firstLevelCommentListBOs) {
            getSubCommentListBO(commentListBO, allCommentListBOs);
        }
        return firstLevelCommentListBOs;
    }

    @Override
    public Boolean deleteComment(CommentDeleteRequest commentDeleteRequest) {
        LambdaUpdateWrapper<Comment> updateWrapper = new LambdaUpdateWrapper();
        updateWrapper.eq(Comment::getUid, commentDeleteRequest.getUid()).set(Comment::getStatus, 0);
        return update(null, updateWrapper);
    }

    @Override
    public Integer getUserReceiveCommentCount(String userId) {
        LambdaQueryWrapper<Comment> wrapper = new LambdaQueryWrapper<>();
        //TODO: 添加评论的枚举值：0 删除； 1 正常； 2 未读；
        wrapper.eq(Comment::getToUserUid, userId).eq(Comment::getStatus, 2);
        return count(wrapper);
    }

    /**
     * 获取用户自己的评论 和 所有回复评论
     *
     * @param baseRequest
     * @return
     */
    @Override
    public CommentListByUserVO getListByUser(BaseRequest baseRequest) {
        User User = UserThreadHolder.get();
        final String userId = User.getUid();
        //获取用户自己的评论
        LambdaQueryWrapper<Comment> commentListWrapper = new LambdaQueryWrapper<>();
        commentListWrapper.eq(Comment::getUserUid, userId).ne(Comment::getStatus, 0).orderByDesc(Comment::getCreateTime);
        Page<Comment> page = new Page<>(baseRequest.getCurrentPage(), baseRequest.getPageSize());
        final List<Comment> commentList = page(page, commentListWrapper).getRecords();
        //获取用户所有回复评论
        LambdaQueryWrapper<Comment> replyListWrapper = new LambdaQueryWrapper<>();
        replyListWrapper.eq(Comment::getToUserUid, userId).ne(Comment::getStatus, 0).orderByDesc(Comment::getCreateTime);
        final List<Comment> replyList = page(page, replyListWrapper).getRecords();
        final List<CommentBO> commentBOList = covertCommentBOList(commentList);
        final List<CommentBO> replyBOList = covertCommentBOList(replyList);
        return new CommentListByUserVO(commentBOList, replyBOList);
    }

    @Override
    public List<PraiseBO> getPraiseListByUser(BaseRequest baseRequest) {
        User User = UserThreadHolder.get();
        final String userId = User.getUid();
        LambdaQueryWrapper<Comment> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Comment::getUserUid, userId).eq(Comment::getType, 1).ne(Comment::getStatus, 0).orderByDesc(Comment::getCreateTime);
        final List<Comment> commentList = list(wrapper);
        if (CollUtil.isEmpty(commentList)) {
            return new ArrayList<PraiseBO>();
        }
        Map<String, Blog> blogMap = new HashMap<>();
        // 得到所有评论的 文章id，放入map
        final List<String> blogIdList = commentList.stream().map(Comment::getBlogUid).distinct().collect(Collectors.toList());
        final List<Blog> blogList = blogService.listByIds(blogIdList);
        blogList.forEach(blog -> blogMap.put(blog.getUid(), blog));
        return commentList.stream().map(comment -> {
            final PraiseBO praiseBO = new PraiseBO();
            BeanUtils.copyProperties(comment, praiseBO);
            praiseBO.setBlog(blogMap.get(comment.getBlogUid()));
            return praiseBO;
        }).collect(Collectors.toList());
    }

    //递归
    private void getSubCommentListBO(CommentListBO commentListBO, List<CommentListBO> allComments) {
        final String uid = commentListBO.getUid();
        final List<CommentListBO> subCommentListBOs = allComments.stream().filter(comment -> uid.equals(comment.getToUid())).collect(Collectors.toList());
        if (CollUtil.isNotEmpty(subCommentListBOs)) {
            for (CommentListBO subCommentListBO : subCommentListBOs) {
                getSubCommentListBO(subCommentListBO, allComments);
            }
            commentListBO.setReplyList(subCommentListBOs);
        }
    }
}
