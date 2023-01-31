package com.lee.common.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.io.Serializable;

/**
 * 反馈表(TFeedback)实体类
 *
 * @author makejava
 * @since 2023-01-21 10:19:50
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("t_feedback")
public class Feedback implements Serializable {
    private static final long serialVersionUID = -36907345288543265L;
    /**
    * 唯一uid
    */
    @TableId
    private String uid;
    /**
    * 用户uid
    */
    private String userUid;
    /**
    * 反馈的内容
    */
    private String content;
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
    /**
    * 管理员uid
    */
    private String adminUid;

}