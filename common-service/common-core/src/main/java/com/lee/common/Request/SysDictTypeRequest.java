package com.lee.common.Request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @Author: liyansong
 * @Date: 2023/1/12 19:48
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SysDictTypeRequest {
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
