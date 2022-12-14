package com.lee.common.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.io.Serializable;

/**
 * Web访问记录表(TWebVisit)实体类
 *
 * @author makejava
 * @since 2022-12-13 14:37:38
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@TableName("t_web_visit")
public class WebVisit implements Serializable {
    private static final long serialVersionUID = 462772650506295435L;
    /**
    * 主键
    */
    private String uid;
    /**
    * 用户uid
    */
    private String userUid;
    /**
    * 访问ip地址
    */
    private String ip;
    /**
    * 用户行为
    */
    private String behavior;
    /**
    * 模块uid（文章uid，标签uid，分类uid）
    */
    private String moduleUid;
    /**
    * 附加数据(比如搜索内容)
    */
    private String otherData;
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
    * 操作系统
    */
    private String os;
    /**
    * 浏览器
    */
    private String browser;
    /**
    * ip来源
    */
    private String ipSource;

}