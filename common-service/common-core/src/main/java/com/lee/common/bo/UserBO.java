package com.lee.common.bo;

import com.lee.common.entity.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @Author: liyansong
 * @Date: 2023/1/8 16:44
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserBO {

    //浏览器信息
    private String browser;
    //评论状态
    private Integer commentStatus;

    private Date createTime;

    private String email;

    private String lastLoginIp;

    private Date lastLoginTime;

    private Integer loginCount;

    private String nickName;
    //操作系统
    private String os;

    private String passWord;
    //账号来源
    private String source;

    private Integer status;

    private String uid;

    private Date updateTime;

    private String userName;
    //用户标签
    private Integer userTag;

    public UserBO(User user) {
        this.createTime = user.getCreateTime();
        this.updateTime = user.getUpdateTime();
        this.uid = user.getId()+"";
        this.userName = user.getUserName();
        this.nickName = user.getNickName();
        this.passWord = user.getPassword();
        this.status = Integer.parseInt(user.getStatus());
        this.email = user.getEmail();
    }
}
