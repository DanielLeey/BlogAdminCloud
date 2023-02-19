package com.lee.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.common.Request.RoleAddRequest;
import com.lee.common.Request.RoleEditRequest;
import com.lee.common.entity.Role;
import com.lee.common.entity.SysRoleResourceRelation;
import com.lee.dao.RoleMapper;
import com.lee.service.RoleService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public List<Role> getByUserId(String id) {
        return roleMapper.getRoleByUserId(id);
    }

    @Override
    public List<String> getResourcesByRoleId(Long id) {
        return roleMapper.getResourcesByRoleId(id);
    }

    @Override
    @Transactional
    public Boolean editRoleResource(RoleEditRequest roleEditRequest) {
        // 更新角色信息
        Role role = new Role();
        BeanUtils.copyProperties(roleEditRequest, role);
        Date date = new Date();
        role.setUpdateTime(date);
        updateById(role);
        // 更新角色资源表sys_role_resource_relation
        //  1.删除角色拥有的所有资源
        final Long roleId = roleEditRequest.getUid();
        roleMapper.deleteRoleResourceByRoleId(roleId);
        //  2.插入参数传入资源
        final List<String> categoryMenuUids = roleEditRequest.getCategoryMenuUids();
        final List<SysRoleResourceRelation> roleResourceRelations = categoryMenuUids.stream().map(categoryMenuUid -> SysRoleResourceRelation.builder().roleId(roleId).resourceId(categoryMenuUid).build()).collect(Collectors.toList());
        roleMapper.insertBatch(roleResourceRelations);
        return true;
    }

    @Override
    @Transactional
    public Boolean addRoleResource(RoleAddRequest roleAddRequest) {
        Role role = new Role();
        BeanUtils.copyProperties(roleAddRequest, role);
        Date date = new Date();
        role.setCreateTime(date);
        role.setUpdateTime(date);
        role.setStatus(1);
        roleMapper.insert(role);
        final Long uid = role.getUid();
        //  2.插入参数传入资源
        final List<String> categoryMenuUids = roleAddRequest.getCategoryMenuUids();
        final List<SysRoleResourceRelation> roleResourceRelations = categoryMenuUids.stream().map(categoryMenuUid -> SysRoleResourceRelation.builder().roleId(uid).resourceId(categoryMenuUid).build()).collect(Collectors.toList());
        roleMapper.insertBatch(roleResourceRelations);
        return true;
    }

    @Override
    @Transactional
    public Boolean deleteRoleResource(Integer uid) {
        roleMapper.deleteById(uid);
        roleMapper.deleteRoleResourceByRoleId((long) uid);
        return true;
    }
}
