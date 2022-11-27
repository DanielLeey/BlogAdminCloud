package com.lee.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.dao.ResourceMapper;
import com.lee.domain.Resource;
import com.lee.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ResourceServiceImpl extends ServiceImpl<ResourceMapper, Resource> implements ResourceService {

    @Autowired
    private ResourceMapper resourceMapper;

    @Override
    public List<Resource> getResourcesByUserId(Long id) {
        return resourceMapper.getResourcesByUserId(id);
    }
}
