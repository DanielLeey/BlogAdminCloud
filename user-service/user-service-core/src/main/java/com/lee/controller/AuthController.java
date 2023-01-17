package com.lee.controller;


import cn.hutool.core.util.ObjUtil;
import com.lee.common.ThreadHolder.UserThreadHolder;
import com.lee.common.api.CommonResult;
import com.lee.common.entity.Resource;
import com.lee.common.entity.Role;
import com.lee.common.dto.SecurityUserDTO;
import com.lee.common.entity.User;
import com.lee.domain.*;
import com.lee.service.ResourceService;
import com.lee.service.RoleService;
import com.lee.service.UserService;
import com.lee.utils.RedisUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private ResourceService resourceService;

    @Autowired
    private RedisUtils redisUtils;

    /**
     * Content-Type 为 x-www-form-urlencoded
     * 实体类接收 或者 @RequestParam接收（接收表单）
     * Content-Type 为 application/json
     * 使用@RequestBody接收json
     *
     * @param userQuery
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public CommonResult login(UserQuery userQuery) {
        String aaa = (String) redisUtils.get("aaa");
        return CommonResult.success("ok");
    }

    @GetMapping(value = "/getUserByUsername/{username}")
    public User getUserByUsername(@PathVariable("username") String username) {
        return userService.getUserByUsername(username);
    }

    /**
     * 获取网站名称
     *
     * @return
     */
    @RequestMapping(value = "/getWebSiteName", method = RequestMethod.GET)
    public CommonResult getWebSiteName() {
        return CommonResult.success("Lee Blog Admin");
    }

    /**
     * 获取token返回用户的信息
     * @RequestHeader HttpHeaders httpHeaders
     * @return
     */
    @RequestMapping(value = "/info", method = RequestMethod.GET)
    public CommonResult info() {
        User user = UserThreadHolder.get();
        List<Role> roles = roleService.getByUserId(user.getId());
        final List<RoleDTO> roleDTOS = roles.stream().map(role -> {
            List<Resource> resources = resourceService.getResourcesByRoleId(role.getUid());
            List<String> categoryMenuUids = resources.stream().map(Resource::getUid).collect(Collectors.toList());
            return RoleDTO.builder().uid(role.getUid()).createTime(role.getCreateTime()).updateTime(role.getUpdateTime())
                    .roleName(role.getRoleName()).status(role.getStatus()).summary(role.getSummary()).categoryMenuUids(categoryMenuUids).build();
        }).collect(Collectors.toList());
        UserInfoVO userInfoVO = new UserInfoVO("", roleDTOS);
        return CommonResult.success(userInfoVO);
    }

    /**
     * 从请求头中获取username
     * @param httpHeaders
     * @return
     */
    private User getUser(HttpHeaders httpHeaders) {
        String username = Objects.requireNonNull(httpHeaders.get("USERNAME")).get(0);
        SecurityUserDTO securityUserDTO = (SecurityUserDTO) redisUtils.get("USERNAME:" + username);
        if (ObjUtil.isNotEmpty(securityUserDTO)) {
            return securityUserDTO.getUser();
        }
        return userService.getUserByUsername(username);
    }

    /**
     * 获取用户的 一二级菜单 权限 和 三级按钮 权限
     * @return
     */
    @GetMapping("/getMenu")
    public CommonResult getMenu() {
        User user = UserThreadHolder.get();
        List<Resource> parentList = resourceService.getResourcesByUserIdAndLevel(user.getId(), 1);
        List<Resource> sonList = resourceService.getResourcesByUserIdAndLevel(user.getId(), 2);
        List<Resource> buttonList = resourceService.getResourcesByUserIdAndLevel(user.getId(), 3);
        MenuVO data = MenuVO.builder()
                            .parentList(parentList)
                            .sonList(sonList)
                            .buttonList(buttonList)
                            .build();
        return CommonResult.success(data);
    }

    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public CommonResult test() {
        return CommonResult.success("test");
    }

    @GetMapping(value = "/getAdminUid")
    public String getAdminUid() {
        return userService.getAdminUid();
    }
}
