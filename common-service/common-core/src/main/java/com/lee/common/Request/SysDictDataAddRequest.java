package com.lee.common.Request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author: liyansong
 * @Date: 2023/1/12 19:17
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SysDictDataAddRequest {
    private String dictLabel;

    private String dictTypeUid;

    private String dictValue;

    private Integer isDefault;
    /**
     * 是否发布(1:是，0:否)
     */
    private String isPublish;
    /**
     * 样式属性（其他样式扩展）
     */
    private String cssClass;
    /**
     * 表格回显样式
     */
    private String listClass;

    private Integer sort;
    /**
     * 备注
     */
    private String remark;
}
