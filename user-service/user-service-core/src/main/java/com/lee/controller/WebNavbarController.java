package com.lee.controller;

import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.lee.common.Request.WebNavbarEditRequest;
import com.lee.common.api.CommonResult;
import com.lee.common.bo.WebNavbarBO;
import com.lee.common.entity.WebNavbar;
import com.lee.service.WebNavbarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

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

    @PostMapping("/edit")
    public CommonResult edit(@RequestBody WebNavbarEditRequest webNavbarEditRequest) {
        Boolean flag = webNavbarService.edit(webNavbarEditRequest);
        if (flag) {
            return CommonResult.success("编辑成功");
        } else {
            return CommonResult.failed();
        }
    }

    @PostMapping("/delete")
    public CommonResult delete(@RequestBody Map<String, String> map) {
        final String uid = map.get("uid");
        LambdaUpdateWrapper<WebNavbar> wrapper = new LambdaUpdateWrapper<>();
        wrapper.eq(WebNavbar::getUid, uid);
        wrapper.set(WebNavbar::getStatus, 0);
        boolean flag = webNavbarService.update(wrapper);
        if (flag) {
            return CommonResult.success("删除成功");
        } else {
            return CommonResult.failed();
        }
    }

}
