package com.lee.controller;

import com.lee.common.api.CommonResult;
import com.lee.common.vo.SystemConfigVO;
import org.springframework.web.bind.annotation.GetMapping;
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

    @GetMapping("getSystemConfig")
    public CommonResult getSystemConfig() {
        return CommonResult.success(new SystemConfigVO());
    }
}
