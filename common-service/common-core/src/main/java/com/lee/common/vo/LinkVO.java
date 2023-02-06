package com.lee.common.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @Author: liyansong
 * @Date: 2023/2/2 19:42
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class LinkVO {
    /**
     * 唯一uid
     */
    private String uid;
    /**
     * 友情链接标题
     */
    private String title;
    /**
     * 友情链接介绍
     */
    private String summary;
    /**
     * 友情链接URL
     */
    private String url;
    /**
     * 点击数
     */
    private Integer clickCount;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 更新时间
     */
    private Date updateTime;
    /**
     * 状态
     */
    private Integer status;
    /**
     * 排序字段，越大越靠前
     */
    private Integer sort;
    /**
     * 友链状态： 0 申请中， 1：已上线，  2：已下架
     */
    private Integer linkStatus;
    /**
     * 申请用户UID
     */
    private String userUid;


}
