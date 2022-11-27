package com.lee.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lee.domain.Resource;

import java.util.List;

public interface ResourceService extends IService<Resource> {

    List<Resource> getResourcesByUserId(Long id);
}
