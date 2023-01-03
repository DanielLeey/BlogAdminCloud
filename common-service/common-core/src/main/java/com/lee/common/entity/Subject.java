package com.lee.common.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.io.Serializable;

/**
 * 专题表(TSubject)实体类
 *
 * @author makejava
 * @since 2022-12-30 09:58:14
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("t_subject")
public class Subject implements Serializable {
    private static final long serialVersionUID = -36937370855720764L;
    /**
    * 主键
    */
    @TableId(type = IdType.INPUT)
    private String uid;
    /**
    * 专题名称
    */
    private String subjectName;
    /**
    * 简介
    */
    private String summary;
    /**
    * 封面图片UID
    */
    private String fileUid;
    /**
    * 专题点击数
    */
    private Integer clickCount;
    /**
    * 专题收藏数
    */
    private Integer collectCount;
    /**
    * 状态
    */
    private Integer status;
    /**
    * 排序字段
    */
    private Integer sort;
    /**
    * 创建时间
    */
    private Date createTime;
    /**
    * 更新时间
    */
    private Date updateTime;

}