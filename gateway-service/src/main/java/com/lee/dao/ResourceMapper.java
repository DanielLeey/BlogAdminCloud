package com.lee.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lee.domain.Resource;
import com.lee.domain.User;

import java.util.List;

public interface ResourceMapper extends BaseMapper<Resource> {
    List<Resource> getResourcesByUserId(Long id);
}
