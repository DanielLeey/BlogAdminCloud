package com.lee.controller;

import com.lee.common.api.CommonResult;
import com.lee.common.bo.WebNavbarBO;
import com.lee.service.WebNavbarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2023/1/18 10:54
 * @Version: 1.0
 * 导航栏管理
 */
@RestController
@RequestMapping("/webNavbar")
public class WebNavbarController {

    @Autowired
    private WebNavbarService webNavbarService;

    @GetMapping("/getAllList")
    public CommonResult getAllList() {
        List<WebNavbarBO> webNavbarList = webNavbarService.getAllList();
        return CommonResult.success(webNavbarList);
    }
}
