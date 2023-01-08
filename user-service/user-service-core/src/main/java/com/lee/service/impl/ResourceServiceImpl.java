package com.lee.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.common.bo.ResourceBO;
import com.lee.common.entity.Resource;
import com.lee.dao.ResourceMapper;
import com.lee.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ResourceServiceImpl extends ServiceImpl<ResourceMapper, Resource> implements ResourceService {

    @Autowired
    private ResourceMapper resourceMapper;

    @Override
    public List<Resource> getResourcesByUserId(Long id) {
        return resourceMapper.getResourcesByUserId(id);
    }

    @Override
    public List<Resource> getResourcesByRoleId(Long uid) {
        return resourceMapper.getResourcesByRoleId(uid);
    }

    @Override
    public List<Resource> getResourcesByUserIdAndLevel(Long userId, int level) {
        return resourceMapper.getResourcesByUserIdAndLevel(userId, level);
    }

    @Override
    public List<ResourceBO> getAllResource() {
        LambdaQueryWrapper<Resource> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Resource::getStatus, 1);
        wrapper.orderByDesc(Resource::getSort);
        //所有的resource
        final List<Resource> resources = list(wrapper);
        final List<ResourceBO> levelOneResources = resources.stream().filter(resource -> resource.getMenuLevel().equals(1))
                .map(ResourceBO::new).collect(Collectors.toList());
        levelOneResources.forEach(resource -> getSubResource(resource, resources));
        return levelOneResources;
    }

    @Override
    public List<ResourceBO> getButtonAll() {
        LambdaQueryWrapper<Resource> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Resource::getStatus, 1);
        wrapper.orderByDesc(Resource::getSort);
        wrapper.in(Resource::getMenuLevel, 2, 3);
        //所有的resource
        final List<Resource> resources = list(wrapper);
        final List<ResourceBO> levelTwoResources = resources.stream().filter(resource -> resource.getMenuLevel().equals(2))
                .map(ResourceBO::new).collect(Collectors.toList());
        levelTwoResources.forEach(resource -> getSubResource(resource, resources));
        return levelTwoResources;
    }

    private void getSubResource(ResourceBO resource, List<Resource> resources) {
        final String uid = resource.getUid();
        final List<Resource> subResources = resources.stream().filter(oneResource -> uid.equals(oneResource.getParentUid())).collect(Collectors.toList());
        if (CollUtil.isEmpty(subResources)) {
            return;
        }
        List<ResourceBO> resourceBOList = subResources.stream().map(ResourceBO::new).collect(Collectors.toList());
        for (ResourceBO resourceBO : resourceBOList) {
            getSubResource(resourceBO, resources);
        }
        resource.setChildCategoryMenu(resourceBOList);
    }

}
