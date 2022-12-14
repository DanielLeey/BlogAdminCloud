package com.lee.common.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author: liyansong
 * @Date: 2022/12/24 15:31
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("t_blog")
public class Blog implements Serializable {
    private static final long serialVersionUID = -74772318443268076L;
    /**
     * 唯一uid
     */
    @TableId(type = IdType.INPUT)
    private String uid;
    /**
     * 博客标题
     */
    private String title;
    /**
     * 博客简介
     */
    private String summary;
    /**
     * 博客内容
     */
    private String content;
    /**
     * 标签uid
     */
    private String tagUid;
    /**
     * 博客点击数
     */
    @TableField("click_count")
    private Integer clickCount;
    /**
     * 博客收藏数
     */
    private Integer collectCount;
    /**
     * 标题图片uid
     */
    private String fileUid;
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
     * 管理员uid
     */
    private String adminUid;
    /**
     * 是否原创（0:不是 1：是）
     */
    @TableField("is_original")
    private String isOriginal;
    /**
     * 作者
     */
    private String author;
    /**
     * 文章出处
     */
    private String articlesPart;
    /**
     * 博客分类UID
     */
    private String blogSortUid;
    /**
     * 推荐等级(0:正常)
     */
    @TableField("level")
    private Integer level;
    /**
     * 是否发布：0：否，1：是
     */
    private String isPublish;
    /**
     * 排序字段
     */
    private Integer sort;
    /**
     * 是否开启评论(0:否 1:是)
     */
    private Integer openComment;
    /**
     * 类型【0 博客， 1：推广】
     */
    private Integer type;
    /**
     * 外链【如果是推广，那么将跳转到外链】
     */
    private String outsideLink;
    /**
     * 唯一oid
     */
    private Integer oid;
    /**
     * 投稿用户UID
     */
    private String userUid;
    /**
     * 文章来源【0 后台添加，1 用户投稿】
     */
    private Integer articleSource;
}
