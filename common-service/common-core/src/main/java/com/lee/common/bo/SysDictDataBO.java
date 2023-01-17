package com.lee.common.bo;

import com.lee.common.entity.SysDictData;
import com.lee.common.entity.SysDictType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author: liyansong
 * @Date: 2023/1/11 21:07
 * @Version: 1.0
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SysDictDataBO implements Serializable {
    private static final long serialVersionUID = -979770380016180134L;

    /**
     * 主键
     */
    private String uid;
    /**
     * 自增键oid
     */
    private Integer oid;
    /**
     * 字典类型UID
     */
    private String dictTypeUid;
    /**
     * 字典标签
     */
    private String dictLabel;
    /**
     * 字典键值
     */
    private String dictValue;
    /**
     * 是否默认（1是 0否）,默认为0
     */
    private Integer isDefault;
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

    private SysDictType sysDictType;

    public SysDictDataBO(SysDictData sysDictData, SysDictType sysDictType) {
        this.createByUid = sysDictData.getCreateByUid();
        this.createTime = sysDictData.getCreateTime();
        this.dictLabel = sysDictData.getDictLabel();
        this.dictTypeUid = sysDictData.getDictTypeUid();
        this.dictValue = sysDictData.getDictValue();
        this.isDefault = sysDictData.getIsDefault();
        this.isPublish = sysDictData.getIsPublish();
        this.oid = sysDictData.getOid();
        this.remark = sysDictData.getRemark();
        this.sort = sysDictData.getSort();
        this.status = sysDictData.getStatus();
        this.uid = sysDictData.getUid();
        this.updateByUid = sysDictData.getUpdateByUid();
        this.updateTime = sysDictData.getUpdateTime();
        this.sysDictType = sysDictType;
    }
}
