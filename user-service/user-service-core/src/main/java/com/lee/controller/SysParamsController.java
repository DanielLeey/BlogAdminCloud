package com.lee.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.lee.common.Request.*;
import com.lee.common.api.CommonResult;
import com.lee.common.entity.SysParams;
import com.lee.common.vo.SysParamsVO;
import com.lee.service.SysParamsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @Author: liyansong
 * @Date: 2023/1/14 16:17
 * @Version: 1.0
 */
@RestController
@RequestMapping("/sysParams")
public class SysParamsController {

    @Autowired
    private SysParamsService sysParamsService;

    @PostMapping("getList")
    public CommonResult getSysParamsList(@RequestBody BaseRequest baseRequest) {
        List<SysParams> sysParamsList = sysParamsService.getSysParamsList(baseRequest);
        SysParamsVO sysParamsVO = new SysParamsVO(sysParamsList);
        sysParamsVO.setCurrent(baseRequest.getCurrentPage());
        sysParamsVO.setSize(baseRequest.getPageSize());
        LambdaQueryWrapper<SysParams> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(SysParams::getStatus, 1);
        sysParamsVO.setTotal(sysParamsService.count(wrapper));
        sysParamsVO.setIsSearchCount(true);
        sysParamsVO.setOptimizeCountsql(true);
        return CommonResult.success(sysParamsVO);
    }

    @PostMapping("edit")
    public CommonResult editSysParams(@RequestBody SysParamsRequest sysParamsRequest) {
        Boolean flag = sysParamsService.editSysParams(sysParamsRequest);
        if (flag) {
            return CommonResult.success("编辑成功");
        } else {
            return CommonResult.failed();
        }
    }

    @PostMapping("/deleteBatch")
    public CommonResult deleteSysParamsBatch(@RequestBody List<SysParamsDeleteRequest> list) {
        final List<String> uids = list.stream().map(sysParams -> sysParams.getUid()).collect(Collectors.toList());
        Boolean flag = sysParamsService.deleteBatch(uids);
        if (flag) {
            return CommonResult.success("批量删除成功");
        } else {
            return CommonResult.failed();
        }
    }

    //add
    @PostMapping("/add")
    public CommonResult addSysParams(@RequestBody SysParamsAddRequest sysParamsAddRequest) {
        Boolean flag = sysParamsService.addSysParams(sysParamsAddRequest);
        if (flag) {
            return CommonResult.success("添加成功");
        } else {
            return CommonResult.failed();
        }
    }
}