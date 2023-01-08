package com.lee.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lee.common.entity.Role;
import com.lee.common.entity.SysRoleResourceRelation;
import org.apache.ibatis.annotations.Options;

import java.util.List;

public interface RoleMapper extends BaseMapper<Role> {
    /**
     * 通过用户id获取用户的角色
     *
     * @param id
     * @return
     */
    List<Role> getRoleByUserId(Long id);

    List<String> getResourcesByRoleId(Long roleId);

    int deleteRoleResourceByRoleId(Long roleId);

    int insertBatch(List<SysRoleResourceRelation> roleResourceRelations);
}
