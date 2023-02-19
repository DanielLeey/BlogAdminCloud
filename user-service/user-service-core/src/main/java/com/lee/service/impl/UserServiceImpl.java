package com.lee.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.common.Request.UserListRequest;
import com.lee.common.bo.AdminBO;
import com.lee.common.bo.RoleBO;
import com.lee.common.bo.UserBO;
import com.lee.common.entity.Role;
import com.lee.common.entity.User;
import com.lee.dao.UserMapper;
import com.lee.service.RoleService;
import com.lee.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    private static final Logger LOGGER = LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private RoleService roleService;


    @Override
    public User getUserByUsername(String username) {
        LambdaQueryWrapper<User> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(User::getUserName, username);
        return getOne(wrapper);
    }

    @Override
    public String getAdminUid() {
        User admin = userMapper.getAdminUid();
        return admin.getUid();
    }

    @Override
    public List<AdminBO> getAdminUsers() {
        List<User> adminUsers = userMapper.getAdminUser();
        return adminUsers.stream().map(adminUser -> {
            final List<Role> roles = roleService.getByUserId(adminUser.getUid());
            AdminBO adminBO = new AdminBO(adminUser);
            adminBO.setRoles(roles.stream().map(role -> {
                RoleBO roleBO = new RoleBO(role);
                roleBO.setCategoryMenuUids(roleService.getResourcesByRoleId(role.getUid()));
                return roleBO;
            }).collect(Collectors.toList()));
            adminBO.setRoleUids(roles.stream().map(role -> role.getUid() + "").collect(Collectors.toList()));
            return adminBO;
        }).collect(Collectors.toList());
    }

    @Override
    public List<UserBO> getUsers(UserListRequest userListRequest) {
        Page<User> page = new Page<>(userListRequest.getCurrentPage(), userListRequest.getPageSize());
        LambdaQueryWrapper<User> wrapper = new LambdaQueryWrapper<>();
        final List<User> users = page(page, wrapper).getRecords();
        return users.stream().map(user -> new UserBO(user)).collect(Collectors.toList());
    }

    @Override
    public List<User> getUsersByIds(List<String> userIds) {
        return userMapper.getUsersByIds(userIds);
    }
}
