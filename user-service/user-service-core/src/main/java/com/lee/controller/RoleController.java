package com.lee.controller;

import com.lee.common.Request.BaseRequest;
import com.lee.common.Request.RoleAddRequest;
import com.lee.common.Request.RoleEditRequest;
import com.lee.common.api.CommonResult;
import com.lee.common.bo.RoleBO;
import com.lee.common.entity.Role;
import com.lee.common.vo.RoleListVO;
import com.lee.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    /**
     * 获取所有角色
     *
     * @param baseRequest
     * @return
     */
    @PostMapping("/getList")
    public CommonResult getRoleList(@RequestBody BaseRequest baseRequest) {
        final List<Role> roles = roleService.list();
        final List<RoleBO> roleBOList = roles.stream().map(role -> {
            RoleBO roleBO = new RoleBO(role);
            roleBO.setCategoryMenuUids(roleService.getResourcesByRoleId(role.getUid()));
            return roleBO;
        }).collect(Collectors.toList());
        final RoleListVO roleListVO = new RoleListVO(roleBOList);
        roleListVO.setCurrent(baseRequest.getCurrentPage());
        roleListVO.setSize(baseRequest.getPageSize());
        roleListVO.setTotal(roles.size());
        roleListVO.setIsSearchCount(true);
        roleListVO.setOptimizeCountsql(true);
        return CommonResult.success(roleListVO);
    }

    @PostMapping("/edit")
    public CommonResult editRoleResource(@RequestBody RoleEditRequest roleEditRequest) {
        Boolean flag = roleService.editRoleResource(roleEditRequest);
        if (flag) {
            return CommonResult.success("编辑成功");
        }else {
            return CommonResult.failed();
        }
    }

    @PostMapping("/add")
    public CommonResult addRoleResource(@RequestBody RoleAddRequest roleAddRequest) {
        Boolean flag = roleService.addRoleResource(roleAddRequest);
        if (flag) {
            return CommonResult.success("添加成功");
        }else {
            return CommonResult.failed();
        }
    }

    @PostMapping("/delete")
    public CommonResult deleteRoleResource(@RequestBody Map<String, Integer> map) {
        final Integer uid = map.get("uid");
        Boolean flag = roleService.deleteRoleResource(uid);
        if (flag) {
            return CommonResult.success("删除成功");
        }else {
            return CommonResult.failed();
        }
    }
}
