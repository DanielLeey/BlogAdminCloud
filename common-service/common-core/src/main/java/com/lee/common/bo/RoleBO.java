package com.lee.common.bo;

import com.lee.common.entity.Role;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2023/1/5 16:51
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class RoleBO {

    private Long uid;

    //创建时间
    private Date createTime;
    //启用状态：0->禁用；1->启用
    private Integer status;
    //名称
    private String roleName;
    //修改时间
    private Date updateTime;
    //描述
    private String summary;
    //角色拥有菜单
    private List<String> categoryMenuUids;

    public RoleBO(Role role) {
        this.uid = role.getUid();
        this.roleName = role.getRoleName();
        this.status = role.getStatus();
        this.summary = role.getSummary();
        this.createTime = role.getCreateTime();
        this.updateTime = role.getUpdateTime();
    }
}
