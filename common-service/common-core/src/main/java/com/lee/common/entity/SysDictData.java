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
 * 字典数据表(TSysDictData)实体类
 *
 * @author makejava
 * @since 2023-01-07 11:17:09
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("t_sys_dict_data")
public class SysDictData implements Serializable {
    private static final long serialVersionUID = -8629731848350205760L;
    /**
    * 主键
    */
    @TableId(type = IdType.INPUT)
    private String uid;
    /**
    * 自增键oid
    */
    private Integer oid;
    /**
    * 样式属性（其他样式扩展）
    */
    private String cssClass;
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
    * 是否发布(1:是，0:否)
    */
    private String isPublish;
    /**
     * 表格回显样式
     */
    private String listClass;
    /**
     * 是否默认（1是 0否）,默认为0
     */
    private Integer isDefault;
    /**
    * 排序字段
    */
    private Integer sort;

}