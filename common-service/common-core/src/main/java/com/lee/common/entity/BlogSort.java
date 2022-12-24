package com.lee.common.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author: liyansong
 * @Date: 2022/12/24 16:45
 * @Version: 1.0
 * 文章分类
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("t_blog_sort")
public class BlogSort implements Serializable {
    private static final long serialVersionUID = 733117657482976435L;
    /**
     * 唯一uid
     */
    @TableId
    private String uid;
    /**
     * 分类内容
     */
    private String sortName;
    /**
     * 分类简介
     */
    private String content;
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
     * 点击数
     */
    private Integer clickCount;
}
