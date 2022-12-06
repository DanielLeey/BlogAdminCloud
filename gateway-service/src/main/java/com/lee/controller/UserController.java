package com.lee.controller;


import com.lee.api.CommonResult;
import com.lee.domain.*;
import com.lee.service.ResourceService;
import com.lee.service.RoleService;
import com.lee.service.UserService;
import org.checkerframework.checker.units.qual.C;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.ReactiveSecurityContextHolder;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Mono;

import java.util.*;
import java.util.function.Consumer;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/auth")
public class UserController {

    @Value("${jwt.tokenHeader}")
    private String tokenHeader;
    @Value("${jwt.tokenHead}")
    private String tokenHead;

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private ResourceService resourceService;

    /**
     * Content-Type 为 x-www-form-urlencoded
     * 实体类接收 或者 @RequestParam接收（接收表单）
     * Content-Type 为 application/json
     * 使用@RequestBody接收json
     * @param userQuery
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public CommonResult login(UserQuery userQuery) {
        String token = userService.login(userQuery.getUsername(), userQuery.getPassword());
        if (token == null) {
            return CommonResult.validateFailed("用户名或密码错误");
        }
        Map<String, String> tokenMap = new HashMap<>();
        tokenMap.put("token", tokenHead + token);
        return CommonResult.success(tokenMap);
    }

    /**
     * 获取网站名称
     * @return
     */
    @RequestMapping(value = "/getWebSiteName", method = RequestMethod.GET)
    public CommonResult getWebSiteName() {
        return CommonResult.success("Lee Blog Admin");
    }

    /**
     * 获取token返回用户的信息
     * @return
     */
    @RequestMapping(value = "/info", method = RequestMethod.GET)
    public CommonResult info(@RequestHeader HttpHeaders httpHeaders) {
        String username = Objects.requireNonNull(httpHeaders.get("USERNAME")).get(0);
        final User user = userService.getUserByUsername(username);
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

    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public CommonResult test() {
        return CommonResult.success("test");
    }
}
