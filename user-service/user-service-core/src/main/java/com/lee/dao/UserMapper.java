package com.lee.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lee.domain.User;

public interface UserMapper extends BaseMapper<User> {

    public User getUserByUsername(String username);
}
