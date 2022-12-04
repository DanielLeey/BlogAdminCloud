package com.lee.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserInfoVO {

    // 头像
    private String avatar;

    // 角色
    private List<RoleDTO> roles;
}
