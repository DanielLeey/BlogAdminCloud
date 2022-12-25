package com.lee.common.bo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @Author: liyansong
 * @Date: 2022/12/25 16:46
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BlogSortListRecordBO {

    private Integer clickCount;

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
     * 排序字段
     */
    private Integer sort;

    private String sortName;
    /**
     * 状态
     */
    private Integer status;

    private String uid;

}
