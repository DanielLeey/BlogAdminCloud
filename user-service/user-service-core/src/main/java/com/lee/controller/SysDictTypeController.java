package com.lee.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.lee.common.Request.*;
import com.lee.common.api.CommonResult;
import com.lee.common.entity.SysDictType;
import com.lee.common.vo.AdminListVO;
import com.lee.common.vo.DictTypeListVO;
import com.lee.service.SysDictTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @Author: liyansong
 * @Date: 2023/1/11 20:01
 * @Version: 1.0
 */
@RestController
@RequestMapping("/sysDictType")
public class SysDictTypeController {

    @Autowired
    private SysDictTypeService sysDictTypeService;

    @PostMapping("getList")
    public CommonResult getSysDictTypeList(@RequestBody BaseRequest baseRequest) {
        List<SysDictType> sysDictTypeList = sysDictTypeService.getSysDictTypeList(baseRequest);
        final DictTypeListVO dictTypeListVO = new DictTypeListVO(sysDictTypeList);
        dictTypeListVO.setCurrent(baseRequest.getCurrentPage());
        dictTypeListVO.setSize(baseRequest.getPageSize());
        LambdaQueryWrapper<SysDictType> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(SysDictType::getStatus, 1);
        dictTypeListVO.setTotal(sysDictTypeService.count(wrapper));
        dictTypeListVO.setIsSearchCount(true);
        dictTypeListVO.setOptimizeCountsql(true);
        return CommonResult.success(dictTypeListVO);
    }

    //edit
    @PostMapping("/edit")
    public CommonResult editDictType(@RequestBody SysDictTypeRequest sysDictDataRequest) {
        Boolean flag = sysDictTypeService.editDictType(sysDictDataRequest);
        if (flag) {
            return CommonResult.success("编辑成功");
        } else {
            return CommonResult.failed();
        }
    }

    @PostMapping("/deleteBatch")
    public CommonResult deleteSysDictTypeBatch(@RequestBody List<SysDictTypeDeleteRequest> list) {
        final List<String> uids = list.stream().map(sysDictData -> sysDictData.getUid()).collect(Collectors.toList());
        Boolean flag = sysDictTypeService.deleteBatch(uids);
        if (flag) {
            return CommonResult.success("批量删除成功");
        } else {
            return CommonResult.failed();
        }
    }

    //add
    @PostMapping("/add")
    public CommonResult addSysDictType(@RequestBody SysDictTypeAddRequest sysDictDataAddRequest) {
        Boolean flag = sysDictTypeService.addSysDictType(sysDictDataAddRequest);
        if (flag) {
            return CommonResult.success("添加成功");
        } else {
            return CommonResult.failed();
        }
    }
}
