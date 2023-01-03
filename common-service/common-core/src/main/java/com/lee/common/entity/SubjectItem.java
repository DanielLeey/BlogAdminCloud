package com.lee.common.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.io.Serializable;

/**
 * 专题Item表(TSubjectItem)实体类
 *
 * @author makejava
 * @since 2022-12-30 16:17:47
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("t_subject_item")
public class SubjectItem implements Serializable {
    private static final long serialVersionUID = 265476663073864287L;
    /**
    * 主键
    */
    private String uid;
    /**
    * 专题uid
    */
    private String subjectUid;
    /**
    * 博客uid
    */
    private String blogUid;
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