package com.lee.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.common.Request.BaseRequest;
import com.lee.common.Request.SysParamsAddRequest;
import com.lee.common.Request.SysParamsRequest;
import com.lee.common.entity.SysParams;
import com.lee.common.utils.UUidUtils;
import com.lee.dao.SysParamsMapper;
import com.lee.service.SysParamsService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2023/1/14 16:19
 * @Version: 1.0
 */
@Service("sysParamsService")
public class SysParamsServiceImpl extends ServiceImpl<SysParamsMapper, SysParams> implements SysParamsService {

    @Autowired
    private SysParamsMapper sysParamsMapper;

    @Override
    public List<SysParams> getSysParamsList(BaseRequest baseRequest) {
        LambdaQueryWrapper<SysParams> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(SysParams::getStatus, 1);
        wrapper.orderByAsc(SysParams::getCreateTime);
        Page<SysParams> page = new Page<>(baseRequest.getCurrentPage(), baseRequest.getPageSize());
        return page(page, wrapper).getRecords();
    }

    @Override
    public Boolean editSysParams(SysParamsRequest sysParamsRequest) {
        SysParams sysParams = new SysParams();
        BeanUtils.copyProperties(sysParamsRequest, sysParams);
        sysParams.setUpdateTime(new Date());
        return updateById(sysParams);
    }

    @Override
    public Boolean deleteBatch(List<String> uids) {
        Integer count = sysParamsMapper.deleteBatch(uids);
        return count > 0;
    }

    @Override
    public Boolean addSysParams(SysParamsAddRequest sysParamsAddRequest) {
        SysParams sysParams = new SysParams();
        BeanUtils.copyProperties(sysParamsAddRequest, sysParams);
        sysParams.setUid(UUidUtils.getUUId());
        sysParams.setStatus(1);
        Date date = new Date();
        sysParams.setCreateTime(date);
        sysParams.setUpdateTime(date);
        final int count = sysParamsMapper.insert(sysParams);
        return count > 0;
    }
}
