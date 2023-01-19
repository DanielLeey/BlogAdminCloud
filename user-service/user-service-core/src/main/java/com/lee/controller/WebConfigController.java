package com.lee.controller;

import com.lee.common.api.CommonResult;
import com.lee.common.entity.WebConfig;
import com.lee.service.WebConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: liyansong
 * @Date: 2023/1/17 10:12
 * @Version: 1.0
 */
@RestController
@RequestMapping("/webConfig")
public class WebConfigController {

    @Autowired
    private WebConfigService webConfigService;

    @GetMapping("getWebConfig")
    public CommonResult getWebConfig() {
        final WebConfig webConfig = webConfigService.list().get(0);
        return CommonResult.success(webConfig);
    }
}
