package com.lee.controller;

import com.lee.common.api.CommonResult;
import com.lee.common.bo.DictSysTypeBO;
import com.lee.service.SysDictTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Handler;

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

    @RequestMapping(value = "/getListByDictTypeList", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult getListByDictTypeList(@RequestBody List<String> sysList) {
        final Map<String, Object> listByDictTypeList = sysDictTypeService.getListByDictTypeList(sysList);
        return CommonResult.success(listByDictTypeList);
    }
}
