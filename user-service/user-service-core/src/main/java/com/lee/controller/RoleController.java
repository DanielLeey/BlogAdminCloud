package com.lee.controller;

import com.lee.common.api.CommonResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/role")
public class RoleController {

    @RequestMapping(value = "/test", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult test() {
        return CommonResult.success("test");
    }
}
