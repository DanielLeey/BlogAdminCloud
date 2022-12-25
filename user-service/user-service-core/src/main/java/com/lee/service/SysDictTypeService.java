package com.lee.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lee.common.bo.DictSysTypeBO;
import com.lee.common.entity.SysDictType;

import java.util.List;
import java.util.Map;

/**
 * @Author: liyansong
 * @Date: 2022/12/25 10:52
 * @Version: 1.0
 */
public interface SysDictTypeService extends IService<SysDictType> {
    Map<String, Object> getListByDictTypeList(List<String> sysList);
}
