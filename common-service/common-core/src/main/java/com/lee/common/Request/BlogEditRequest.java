package com.lee.common.Request;

import com.lee.common.entity.BlogSort;
import com.lee.common.entity.Tag;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/27 9:44
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BlogEditRequest implements Serializable {
    private static final long serialVersionUID = 6418396383532622558L;

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
    //private String userUid;
    /**
     * 文章来源【0 后台添加，1 用户投稿】
     */
    //private Integer articleSource;

    /**
     * 标签list
     */
    private List<Tag> tagList;

    /**
     * 图片地址
     */
    private List<String> photoList;

    /**
     * 博客分类list
     */
    private BlogSort blogSort;
}
