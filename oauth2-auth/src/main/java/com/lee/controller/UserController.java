package com.lee.controller;


import com.lee.api.CommonResult;
import com.lee.domain.User;
import com.lee.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Value("${jwt.tokenHeader}")
    private String tokenHeader;
    @Value("${jwt.tokenHead}")
    private String tokenHead;

    /**
     * 登录以后返回token
     * @param
     * @param result
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult login(@RequestBody User user) {
        String token = userService.login(user.getUserName(), user.getPassword());
        if (token == null) {
            return CommonResult.validateFailed("用户名或密码错误");
        }
        Map<String, String> tokenMap = new HashMap<>();
        tokenMap.put("token", tokenHead + token);
        return CommonResult.success(tokenMap);
    }

    @RequestMapping(value = "/test", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult test() {
        return CommonResult.success("test");
    }
}
