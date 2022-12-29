package com.lee.common.Request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author: liyansong
 * @Date: 2022/12/29 10:33
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TagRequest extends BaseRequest implements Serializable {

    private static final long serialVersionUID = -5144935186008267101L;

    private String uid;
    /**
     * 标签内容
     */
    private String content;
    /**
     * 状态
     */
    private Integer status;
    /**
     * 标签简介
     */
    private Integer clickCount;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 更新时间
     */
    private Date updateTime;
    /**
     * 排序字段，越大越靠前
     */
    private Integer sort;
}
