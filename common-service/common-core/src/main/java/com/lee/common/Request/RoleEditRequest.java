package com.lee.common.Request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2023/1/8 11:50
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class RoleEditRequest {

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
}
