package com.lee.common.Request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @Author: liyansong
 * @Date: 2023/1/3 20:41
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SubjectItemEditRequest implements Serializable {
    private static final long serialVersionUID = 753078735536999139L;
    /**
     * 主键
     */
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
     * 排序字段
     */
    private Integer sort;
}
