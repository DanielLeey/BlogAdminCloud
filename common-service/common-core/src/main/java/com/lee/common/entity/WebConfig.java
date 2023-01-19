package com.lee.common.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.io.Serializable;

/**
 * 系统管理 网站配置(TWebConfig)实体类
 *
 * @author makejava
 * @since 2023-01-17 10:14:34
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("t_web_config")
public class WebConfig implements Serializable {
    private static final long serialVersionUID = 393081126663339462L;
    /**
    * 主键
    */
    @TableId
    private String uid;
    /**
    * logo(文件UID)
    */
    private String logo;
    /**
    * 网站名称
    */
    private String name;
    /**
    * 介绍
    */
    private String summary;
    /**
    * 关键字
    */
    private String keyword;
    /**
    * 作者
    */
    private String author;
    /**
    * 备案号
    */
    private String recordNum;
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
    * 标题
    */
    private String title;
    /**
    * 支付宝收款码FileId
    */
    private String aliPay;
    /**
    * 微信收款码FileId
    */
    private String weixinPay;
    /**
    * github地址
    */
    private String github;
    /**
    * gitee地址
    */
    private String gitee;
    /**
    * QQ号
    */
    private String qqNumber;
    /**
    * QQ群
    */
    private String qqGroup;
    /**
    * 微信号
    */
    private String weChat;
    /**
    * 邮箱
    */
    private String email;
    /**
    * 显示的列表（用于控制邮箱、QQ、QQ群、Github、Gitee、微信是否显示在前端）
    */
    private String showList;
    /**
    * 登录方式列表（用于控制前端登录方式，如账号密码,码云,Github,QQ,微信）
    */
    private String loginTypeList;
    /**
    * 是否开启评论(0:否 1:是)
    */
    private String openComment;
    /**
    * 是否开启移动端评论(0:否， 1:是)
    */
    private String openMobileComment;
    /**
    * 是否开启赞赏(0:否， 1:是)
    */
    private String openAdmiration;
    /**
    * 是否开启移动端赞赏(0:否， 1:是)
    */
    private String openMobileAdmiration;
    /**
    * 友链申请模板,添加友链申请模板格式
    */
    private String linkApplyTemplate;

}