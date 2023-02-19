package com.lee.common.bo;

import com.lee.common.entity.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2023/1/5 17:10
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AdminBO {

    private String avatar;

    private Date createTime;

    private Integer gender;

    private String gitee;

    private String github;

    private String lastLoginIp;

    private Date lastLoginTime;

    private Integer loginCount;

    private Long maxStorageSize;

    private String nickName;

    private List<String> photoList;

    private List<RoleBO> roles;

    private List<String> roleUids;

    //账号状态（0正常 1停用）
    private Integer status;

    private Long storageSize;

    private String uid;

    private Date updateTime;

    private String userName;
    //密码
    private String password;

    private String email;

    private String mobile;

    public AdminBO(User user) {
        this.uid = user.getUid();
        this.avatar = user.getAvatar();
        this.createTime = user.getCreateTime();
        this.nickName = user.getNickName();
        this.password = user.getPassword();
        this.gender = user.getGender();
        this.status = user.getStatus();
        this.updateTime = user.getUpdateTime();
        this.userName = user.getUserName();
        this.email = user.getEmail();
        this.mobile = user.getMobile();
    }
}
