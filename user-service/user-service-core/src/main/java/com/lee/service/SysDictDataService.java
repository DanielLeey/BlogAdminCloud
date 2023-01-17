package com.lee.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lee.common.Request.DictDataRequest;
import com.lee.common.Request.SysDictDataAddRequest;
import com.lee.common.Request.SysDictDataRequest;
import com.lee.common.bo.SysDictDataBO;
import com.lee.common.entity.SysDictData;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2023/1/11 20:46
 * @Version: 1.0
 */
public interface SysDictDataService extends IService<SysDictData> {

    List<SysDictDataBO> getListByDictTypeId(DictDataRequest dictDataRequest);

    Boolean editDictData(SysDictDataRequest sysDictDataRequest);

    Boolean deleteBatch(List<String> uids);

    Boolean addSysDictData(SysDictDataAddRequest sysDictDataAddRequest);
}
