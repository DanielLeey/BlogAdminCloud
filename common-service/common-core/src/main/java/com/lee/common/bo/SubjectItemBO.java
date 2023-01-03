package com.lee.common.bo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author: liyansong
 * @Date: 2022/12/30 16:50
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SubjectItemBO implements Serializable {

    private static final long serialVersionUID = -837323681890033500L;

    private String uid;
    /**
     * 专题uid
     */
    private String subjectUid;
    /**
     * 博客uid
     */
    private String blogUid;
    /**
     * 状态
     */
    private Integer status;
    /**
     * 排序字段
     */
    private Integer sort;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 更新时间
     */
    private Date updateTime;

    private BlogListRecordBO blog;
}
