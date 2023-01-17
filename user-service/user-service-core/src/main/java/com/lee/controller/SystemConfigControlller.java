package com.lee.controller;

import com.lee.common.Request.SystemConfigRequest;
import com.lee.common.api.CommonResult;
import com.lee.common.entity.SystemConfig;
import com.lee.common.vo.SystemConfigVO;
import com.lee.service.SystemConfigService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: liyansong
 * @Date: 2022/12/27 9:20
 * @Version: 1.0
 */
@RestController
@RequestMapping("/systemConfig")
public class SystemConfigControlller {

    @Autowired
    private SystemConfigService systemConfigService;

    @GetMapping("getSystemConfig")
    public CommonResult getSystemConfig() {
        SystemConfig systemConfig = systemConfigService.getSystemConfigInstance();
        SystemConfigVO systemConfigVO = new SystemConfigVO();
        BeanUtils.copyProperties(systemConfig, systemConfigVO);
        return CommonResult.success(systemConfigVO);
    }

    @GetMapping("editSystemConfig")
    public CommonResult editSystemConfig(@RequestBody SystemConfigRequest systemConfigRequest) {
        return null;
    }

}
