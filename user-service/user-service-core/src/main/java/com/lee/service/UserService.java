package com.lee.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lee.common.entity.User;

public interface UserService extends IService<User> {

    User getUserByUsername(String username);

}
