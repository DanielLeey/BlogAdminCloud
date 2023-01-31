package com.lee.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lee.common.Request.UserListRequest;
import com.lee.common.bo.AdminBO;
import com.lee.common.bo.UserBO;
import com.lee.common.entity.User;

import java.util.List;

public interface UserService extends IService<User> {

    User getUserByUsername(String username);

    String getAdminUid();

    List<AdminBO> getAdminUsers();

    List<UserBO> getUsers(UserListRequest userListRequest);

    List<User> getUsersByIds(List<String> userIds);
}
