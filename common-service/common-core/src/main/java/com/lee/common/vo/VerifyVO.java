package com.lee.common.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author : liyansong
 * @Date : 2023/2/8 20:58
 * @Version : 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class VerifyVO {
    private String avatar;
    private String birthday;
    private String browser;
    private Integer commentStatus;
    private String createTime;
    private String email;
    private String gender;
    private String lastLoginIp;
    private String lastLoginTime;
    private Integer loginCount;
    private String nickName;
    private String os;
    private String password;
    private String photoUrl;
    private String source;
    private Integer startEmailNotification;
    private Integer status;
    private String summary;
    private String uid;
    private String updateTime;
    private String userName;
    private Integer userTag;
}
