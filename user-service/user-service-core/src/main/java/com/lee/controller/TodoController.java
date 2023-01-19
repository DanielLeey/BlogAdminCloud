package com.lee.controller;

import com.lee.common.api.CommonResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: liyansong
 * @Date: 2023/1/19 16:32
 * @Version: 1.0
 */
@RestController
@RequestMapping("/todo")
public class TodoController {

    @PostMapping("getList")
    public CommonResult getList() {
        return CommonResult.success(null);
    }
}
