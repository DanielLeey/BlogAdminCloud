package com.lee.common.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.io.Serializable;

/**
 * 友情链接表(TLink)实体类
 *
 * @author makejava
 * @since 2023-02-02 19:36:39
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("t_link")
public class Link implements Serializable {
    private static final long serialVersionUID = -14130969250509737L;
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
    /**
    * 操作管理员UID
    */
    private String adminUid;
    /**
    * 站长邮箱
    */
    private String email;
    /**
    * 网站图标
    */
    private String fileUid;

}