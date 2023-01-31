package com.lee.common.bo;

import com.lee.common.entity.Blog;
import com.lee.common.entity.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @Author: liyansong
 * @Date: 2023/1/21 10:49
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CommentBO {
    private String uid;
    /**
     * 用户uid
     */
    private String userUid;
    /**
     * 回复某条评论的uid
     */
    private String toUid;
    /**
     * 回复某个人的uid
     */
    private String toUserUid;
    /**
     * 评论内容
     */
    private String content;
    /**
     * 博客uid
     */
    private String blogUid;
    /**
     * 状态
     */
    private Integer status;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 更新时间
     */
    private Date updateTime;
    /**
     * 评论来源： MESSAGE_BOARD，ABOUT，BLOG_INFO 等
     */
    private String source;
    /**
     * 评论类型 1:点赞 0:评论
     */
    private Integer type;
    /**
     * 一级评论UID
     */
    private String firstCommentUid;

    private Blog blog;

    private User user;
}
