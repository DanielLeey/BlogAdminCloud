package com.lee.common.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.io.Serializable;

/**
 * 标签表(TTag)实体类
 *
 * @author makejava
 * @since 2022-12-21 11:10:29
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("t_tag")
public class Tag implements Serializable {
    private static final long serialVersionUID = -43022277470502597L;
    /**
    * 唯一uid
    */
    @TableId(type = IdType.INPUT)
    private String uid;
    /**
    * 标签内容
    */
    private String content;
    /**
    * 状态
    */
    private Integer status;
    /**
    * 点击数
    */
    @TableField("click_count")
    private Integer clickCount;
    /**
    * 创建时间
    */
    @TableField("create_time")
    private Date createTime;
    /**
    * 更新时间
    */
    @TableField("update_time")
    private Date updateTime;
    /**
    * 排序字段，越大越靠前
    */
    @TableField("sort")
    private Integer sort;
}