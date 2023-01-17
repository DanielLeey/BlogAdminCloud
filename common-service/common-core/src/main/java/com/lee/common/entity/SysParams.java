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
 * 参数配置表(TSysParams)实体类
 *
 * @author makejava
 * @since 2023-01-14 16:14:47
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("t_sys_params")
public class SysParams implements Serializable {
    private static final long serialVersionUID = 963398523896245960L;
    /**
    * 主键
    */
    @TableId(type = IdType.INPUT)
    private String uid;
    /**
    * 配置类型 是否系统内置(1:，是 0:否)
    */
    private String paramsType;
    /**
    * 参数名称
    */
    private String paramsName;
    /**
    * 参数键名
    */
    private String paramsKey;
    /**
    * 备注
    */
    private String remark;
    /**
    * 参数键值
    */
    private String paramsValue;
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
    * 排序字段
    */
    private Integer sort;

}