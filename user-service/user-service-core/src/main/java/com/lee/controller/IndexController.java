package com.lee.controller;

import com.lee.common.api.CommonResult;
import com.lee.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: liyansong
 * @Date: 2022/12/12 16:56
 * @Version: 1.0
 */
@RestController
@RequestMapping("/index")
public class IndexController {

    @Autowired
    private UserService userService;

    @RequestMapping("/init")
    public CommonResult init() {
        int userCount = userService.count();

        return null;
    }
}
