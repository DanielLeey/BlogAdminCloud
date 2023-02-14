package com.lee.common.bo;

import com.lee.common.entity.Blog;
import com.lee.common.entity.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2023/2/10 9:49
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CommentListBO {
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

    private User user;

    private User toUser;

    private List<CommentListBO> replyList;
}
