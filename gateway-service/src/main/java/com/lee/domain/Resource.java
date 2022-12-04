package com.lee.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("t_sys_resource")
public class Resource {
    //主键
    @TableId
    //唯一uid@TableId
    private String uid;

    //菜单名称
    private String name;
    //菜单级别
    private Integer menuLevel;
    //简介
    private String summary;
    //父uid
    private String parentUid;
    //url地址
    private String url;
    //图标
    private String icon;
    //排序字段，越大越靠前
    private Integer sort;
    //状态
    private Integer status;
    //创建时间
    private Date createTime;
    //更新时间
    private Date updateTime;
    //是否显示 1:是 0:否
    private Integer isShow;
    //菜单类型 0: 菜单   1: 按钮
    private Integer menuType;
    //是否跳转外部链接 0：否，1：是
    private Integer isJumpExternalUrl;
}
