package com.lee.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lee.domain.Role;

import java.util.List;

public interface RoleMapper extends BaseMapper<Role> {
    /**
     * 通过用户id获取用户的角色
     * @param id
     * @return
     */
    List<Role> getRoleByUserId(Long id);
}
