package com.lee.common.Request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @Author: liyansong
 * @Date: 2023/1/14 16:35
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SysParamsRequest {

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
