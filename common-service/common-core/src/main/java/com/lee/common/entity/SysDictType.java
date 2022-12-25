package com.lee.common.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.io.Serializable;

/**
 * 字典类型表(TSysDictType)实体类
 *
 * @author makejava
 * @since 2022-12-25 10:50:06
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("t_sys_dict_type")
public class SysDictType implements Serializable {
    private static final long serialVersionUID = -34599145430558258L;
    /**
    * 主键
    */
    @TableId
    private String uid;
    /**
    * 自增键oid
    */
    private Integer oid;
    /**
    * 字典名称
    */
    private String dictName;
    /**
    * 字典类型
    */
    private String dictType;
    /**
    * 创建人UID
    */
    private String createByUid;
    /**
    * 最后更新人UID
    */
    private String updateByUid;
    /**
    * 备注
    */
    private String remark;
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
    * 是否发布(1:是，0:否)
    */
    private String isPublish;
    /**
    * 排序字段
    */
    private Integer sort;

}