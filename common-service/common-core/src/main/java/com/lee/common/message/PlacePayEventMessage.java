package com.lee.common.message;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @Author: liyansong
 * @Date: 2023/1/31 21:09
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PlacePayEventMessage implements Serializable {
    private static final long serialVersionUID = 8562416844980178294L;
    /**
     * 博客编号
     */
    private String blogId;
    /**
     * 博客状态
     */
    private Integer blogStatus;
    /**
     * 用户ID
     */
    private String userId;
}
