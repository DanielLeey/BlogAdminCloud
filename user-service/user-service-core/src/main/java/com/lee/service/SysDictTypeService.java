package com.lee.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lee.common.Request.BaseRequest;
import com.lee.common.Request.SysDictTypeAddRequest;
import com.lee.common.Request.SysDictTypeRequest;
import com.lee.common.bo.DictSysTypeBO;
import com.lee.common.entity.SysDictData;
import com.lee.common.entity.SysDictType;

import java.util.List;
import java.util.Map;

/**
 * @Author: liyansong
 * @Date: 2022/12/25 10:52
 * @Version: 1.0
 */
public interface SysDictTypeService extends IService<SysDictType> {
    Map<String, DictSysTypeBO> getListByDictTypeList(List<String> sysList);

    List<SysDictData> getListByDictType(String dictType);

    List<SysDictType> getSysDictTypeList(BaseRequest baseRequest);

    Boolean editDictType(SysDictTypeRequest sysDictDataRequest);

    Boolean deleteBatch(List<String> uids);

    Boolean addSysDictType(SysDictTypeAddRequest sysDictDataAddRequest);
}
