package com.lee.common.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 后台角色资源关系表(SysRoleResourceRelation)实体类
 *
 * @author makejava
 * @since 2023-01-08 12:09:58
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@TableName("sys_role_resource_relation")
public class SysRoleResourceRelation implements Serializable {
    private static final long serialVersionUID = 320583609474534551L;
    
    private Long id;
    /**
    * 角色ID
    */
    private Long roleId;
    /**
    * 资源ID
    */
    private String resourceId;
}