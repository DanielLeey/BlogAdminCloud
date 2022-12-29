package com.lee.common.Request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author: liyansong
 * @Date: 2022/12/28 10:26
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BlogSortRequest implements Serializable {
    private static final long serialVersionUID = -1825691936237927543L;

    private String uid;
    /**
     * 分类内容
     */
    private String sortName;
    /**
     * 分类简介
     */
    private String content;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 更新时间
     */
    private Date updateTime;
    /**
     * 状态
     */
    private Integer status;
    /**
     * 排序字段，越大越靠前
     */
    private Integer sort;
    /**
     * 点击数
     */
    private Integer clickCount;
}
