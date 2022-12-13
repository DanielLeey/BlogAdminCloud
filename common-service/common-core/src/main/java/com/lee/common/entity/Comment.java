package com.lee.common.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.io.Serializable;

/**
 * 评论表，替换sg_comment(TComment)实体类
 *
 * @author makejava
 * @since 2022-12-13 09:59:00
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("t_comment")
public class Comment implements Serializable {
    private static final long serialVersionUID = -58883858764444123L;
    /**
    * 唯一uid
    */
    @TableId
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

}