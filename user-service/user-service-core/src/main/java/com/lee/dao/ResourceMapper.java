package com.lee.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lee.common.entity.Resource;

import java.util.List;

public interface ResourceMapper extends BaseMapper<Resource> {
    List<Resource> getResourcesByUserId(Long id);

    List<Resource> getResourcesByRoleId(Long uid);
}
