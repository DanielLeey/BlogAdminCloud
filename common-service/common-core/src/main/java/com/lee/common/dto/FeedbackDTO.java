package com.lee.common.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Date;

/**
 * @Author: liyansong
 * @Date: 2024/2/5 20:12
 * @Version: 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class FeedbackDTO {

    private String uid;
    /**
     * 反馈的内容
     */
    private String content;
    /**
     * 状态
     */
    private Integer status;
    /**
     * 标题
     */
    private String title;
    /**
     * 反馈状态： 0：已开启  1：进行中  2：已完成  3：已拒绝
     */
    private Integer feedbackStatus;
    /**
     * 回复
     */
    private String reply;

    private Date createTime;
}
