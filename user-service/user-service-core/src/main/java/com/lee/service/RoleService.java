package com.lee.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lee.common.Request.RoleAddRequest;
import com.lee.common.Request.RoleEditRequest;
import com.lee.common.entity.Role;

import java.util.List;

public interface RoleService extends IService<Role> {

    List<Role> getByUserId(Long id);

    List<String> getResourcesByRoleId(Long id);

    Boolean editRoleResource(RoleEditRequest roleEditRequest);

    Boolean addRoleResource(RoleAddRequest roleAddRequest);

    Boolean deleteRoleResource(Integer uid);
}
