package com.lee.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lee.common.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper extends BaseMapper<User> {

    public User getUserByUsername(String username);

    User getAdminUid();

    List<User> getAdminUser();

    List<User> getUsersByIds(@Param("userIds") List<String> userIds);
}
