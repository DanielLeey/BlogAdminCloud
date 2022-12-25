package com.lee.common.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author: liyansong
 * @Date: 2022/12/25 11:03
 * @Version: 1.0
 * 封装SysDictType 和 SysDictData
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DictType implements Serializable {

    private static final long serialVersionUID = -3553077254853845524L;
    /**
     * 主键
     */
    private String uid;
    /**
     * 自增键oid
     */
    private Integer oid;
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
    /**
     * 字典类型
     */
    private String dictType;

    private String dictLabel;

    private String dictValue;

    private String listClass;

    private Integer isDefault;
}
