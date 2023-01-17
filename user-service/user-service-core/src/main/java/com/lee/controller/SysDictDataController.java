package com.lee.controller;

import com.lee.common.Request.DictDataRequest;
import com.lee.common.Request.SysDictDataAddRequest;
import com.lee.common.Request.SysDictDataDeleteRequest;
import com.lee.common.Request.SysDictDataRequest;
import com.lee.common.api.CommonResult;
import com.lee.common.bo.DictSysTypeBO;
import com.lee.common.bo.SysDictDataBO;
import com.lee.common.entity.SysDictData;
import com.lee.common.vo.DictDataListVO;
import com.lee.common.vo.DictDataVO;
import com.lee.service.SysDictDataService;
import com.lee.service.SysDictTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @Author: liyansong
 * @Date: 2022/12/25 10:57
 * @Version: 1.0
 */
@RestController
@RequestMapping("/sysDictData")
public class SysDictDataController {

    @Autowired
    private SysDictTypeService sysDictTypeService;

    @Autowired
    private SysDictDataService sysDictDataService;

    @RequestMapping(value = "/getListByDictTypeList", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult getListByDictTypeList(@RequestBody List<String> sysList) {
        final Map<String, DictSysTypeBO> listByDictTypeList = sysDictTypeService.getListByDictTypeList(sysList);
        return CommonResult.success(listByDictTypeList);
    }

    @PostMapping("/getListByDictType")
    public CommonResult getListByDictType(@RequestParam("dictType") String dictType) {
        List<SysDictData> sysDictDataList = sysDictTypeService.getListByDictType(dictType);
        final DictDataVO dictDataVO = new DictDataVO("1", sysDictDataList);
        return CommonResult.success(dictDataVO);
    }

    @PostMapping("/getList")
    public CommonResult getListByDictTypeId(@RequestBody DictDataRequest dictDataRequest) {
        final List<SysDictDataBO> list = sysDictDataService.getListByDictTypeId(dictDataRequest);
        final DictDataListVO dictDataListVO = new DictDataListVO(list);
        dictDataListVO.setCurrent(dictDataRequest.getCurrentPage());
        dictDataListVO.setSize(list.size());
        dictDataListVO.setIsSearchCount(true);
        dictDataListVO.setOptimizeCountsql(true);
        return CommonResult.success(dictDataListVO);
    }

    @PostMapping("/edit")
    public CommonResult editDictData(@RequestBody SysDictDataRequest sysDictDataRequest) {
        Boolean flag = sysDictDataService.editDictData(sysDictDataRequest);
        if (flag) {
            return CommonResult.success("编辑成功");
        } else {
            return CommonResult.failed();
        }
    }

    @PostMapping("/deleteBatch")
    public CommonResult deleteSysDictDataBatch(@RequestBody List<SysDictDataDeleteRequest> list) {
        final List<String> uids = list.stream().map(sysDictData -> sysDictData.getUid()).collect(Collectors.toList());
        Boolean flag = sysDictDataService.deleteBatch(uids);
        if (flag) {
            return CommonResult.success("批量删除成功");
        } else {
            return CommonResult.failed();
        }
    }

    //add
    @PostMapping("/add")
    public CommonResult addSysDictData(@RequestBody SysDictDataAddRequest sysDictDataAddRequest) {
        Boolean flag = sysDictDataService.addSysDictData(sysDictDataAddRequest);
        if (flag) {
            return CommonResult.success("添加成功");
        } else {
            return CommonResult.failed();
        }
    }
}
