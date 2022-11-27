package com.lee.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/nacos/config")
@RefreshScope   // 注解方式读取配置，如果需要动态更新，需要加上此注解
public class NacosConfigController {

    @Value("${config.gender}")
    private String gender;

    @Value("${config.appName}")
    private String appName;

    @Value("${test.name}")
    private String name;



    @RequestMapping("/test")
    public String test2() {
        return name + ", " + appName + ", " + gender;
    }
}

