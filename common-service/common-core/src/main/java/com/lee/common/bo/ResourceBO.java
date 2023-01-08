package com.lee.common.bo;

import com.lee.common.entity.Resource;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2023/1/7 15:57
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ResourceBO {

    private String uid;

    //菜单名称
    private String name;
    //菜单级别
    private Integer menuLevel;
    //简介
    private String summary;
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
    //子资源菜单
    private List<ResourceBO> childCategoryMenu;

    public ResourceBO(Resource resource) {
        this.uid = resource.getUid();
        this.name = resource.getName();
        this.menuLevel = resource.getMenuLevel();
        this.summary = resource.getSummary();
        this.url = resource.getUrl();
        this.icon = resource.getIcon();
        this.sort = resource.getSort();
        this.status = resource.getStatus();
        this.createTime = resource.getCreateTime();
        this.updateTime = resource.getUpdateTime();
        this.isShow = resource.getIsShow();
        this.menuType = resource.getMenuType();
        this.isJumpExternalUrl = resource.getIsJumpExternalUrl();
    }
}
