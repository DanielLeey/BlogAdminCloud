package com.lee.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lee.common.Request.BaseRequest;
import com.lee.common.Request.SysParamsAddRequest;
import com.lee.common.Request.SysParamsRequest;
import com.lee.common.entity.SysParams;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2023/1/14 16:19
 * @Version: 1.0
 */
public interface SysParamsService extends IService<SysParams> {
    List<SysParams> getSysParamsList(BaseRequest baseRequest);

    Boolean editSysParams(SysParamsRequest sysParamsRequest);

    Boolean deleteBatch(List<String> uids);

    Boolean addSysParams(SysParamsAddRequest sysParamsAddRequest);
}
