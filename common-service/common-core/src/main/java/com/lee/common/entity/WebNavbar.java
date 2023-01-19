package com.lee.common.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.io.Serializable;

/**
 * (TWebNavbar)实体类
 *
 * @author makejava
 * @since 2023-01-18 14:38:13
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("t_web_navbar")
public class WebNavbar implements Serializable {
    private static final long serialVersionUID = 596531573773257902L;
    
    private String uid;
    
    private String name;
    
    private Integer navbarLevel;
    
    private String summary;
    
    private String parentUid;
    
    private String url;
    
    private String icon;
    
    private Integer isShow;
    
    private Integer isJumpExternalUrl;
    
    private Integer sort;
    
    private Integer status;
    
    private Date createTime;
    
    private Date updateTime;

}