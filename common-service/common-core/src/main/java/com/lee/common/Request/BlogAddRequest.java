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
 * @Date: 2022/12/27 14:24
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BlogAddRequest implements Serializable {

    private static final long serialVersionUID = 1067863204441987254L;

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
     * 标题图片uid
     */
    private String fileUid;
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
     * 是否开启评论(0:否 1:是)
     */
    private Integer openComment;
    /**
     * 类型【0 博客， 1：推广】
     */
    private Integer type;


}
