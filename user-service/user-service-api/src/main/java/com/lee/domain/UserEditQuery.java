package com.lee.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @Author: liyansong
 * @Date: 2024/2/4 20:25
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserEditQuery {

    private String avatar;

    @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
    private Date birthday;

    private String browser;

    private Integer commentStatus;

    private Date createTime;

    private String email;

    private Integer gender;

    private String lastLoginIp;

    @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
    private Date lastLoginTime;

    private Integer loginCount;

    private String nickName;

    private String os;

    private String source;

    private Integer startEmailNotification;

    private Integer status;

    private String summary;

    @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
    private Date updateTime;

    private String uid;

    private String userName;

    private Integer userTag;

}
