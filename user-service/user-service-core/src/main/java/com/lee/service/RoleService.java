package com.lee.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lee.common.entity.Role;

import java.util.List;

public interface RoleService extends IService<Role> {

    List<Role> getByUserId(Long id);
}
