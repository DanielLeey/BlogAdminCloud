package com.lee.common.Request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author: liyansong
 * @Date: 2022/12/30 15:34
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SubjectRequest extends BaseRequest implements Serializable {

    private static final long serialVersionUID = -3523687095101189626L;

    private String uid;
    /**
     * 专题名称
     */
    private String subjectName;
    /**
     * 简介
     */
    private String summary;
    /**
     * 封面图片UID
     */
    private String fileUid;
    /**
     * 专题点击数
     */
    private Integer clickCount;
    /**
     * 专题收藏数
     */
    private Integer collectCount;
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
}
