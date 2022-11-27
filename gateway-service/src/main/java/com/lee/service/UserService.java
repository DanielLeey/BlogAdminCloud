package com.lee.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lee.domain.User;

public interface UserService extends IService<User> {

    User getUserByUsername(String username);

    String login(String username, String password);
}
