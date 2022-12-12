package com.lee.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lee.common.entity.Resource;

import java.util.List;

public interface ResourceService extends IService<Resource> {

    List<Resource> getResourcesByUserId(Long id);

    List<Resource> getResourcesByRoleId(Long uid);

    List<Resource> getResourcesByUserIdAndLevel(Long id, int level);
}
