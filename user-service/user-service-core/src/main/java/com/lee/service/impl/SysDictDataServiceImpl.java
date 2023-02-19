package com.lee.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.common.Request.DictDataRequest;
import com.lee.common.Request.SysDictDataAddRequest;
import com.lee.common.Request.SysDictDataRequest;
import com.lee.common.ThreadHolder.UserThreadHolder;
import com.lee.common.bo.SysDictDataBO;
import com.lee.common.entity.SysDictData;
import com.lee.common.entity.SysDictType;
import com.lee.common.entity.User;
import com.lee.common.utils.UUidUtils;
import com.lee.dao.SysDictDataMapper;
import com.lee.service.SysDictDataService;
import com.lee.service.SysDictTypeService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @Author: liyansong
 * @Date: 2023/1/11 20:47
 * @Version: 1.0
 */
@Service("sysDictDataService")
public class SysDictDataServiceImpl extends ServiceImpl<SysDictDataMapper, SysDictData> implements SysDictDataService {

    @Autowired
    private SysDictDataMapper sysDictDataMapper;

    @Autowired
    private SysDictTypeService sysDictTypeService;

    @Override
    public List<SysDictDataBO> getListByDictTypeId(DictDataRequest dictDataRequest) {
        LambdaQueryWrapper<SysDictData> wrapper = new LambdaQueryWrapper<>();
        if (ObjectUtil.isNotNull(dictDataRequest.getDictTypeUid())) {
            wrapper.eq(SysDictData::getDictTypeUid, dictDataRequest.getDictTypeUid());
        }
        wrapper.orderByDesc(SysDictData::getSort);
        wrapper.eq(SysDictData::getStatus, 1);
        Page<SysDictData> page = new Page<>(dictDataRequest.getCurrentPage(), dictDataRequest.getPageSize());
        final List<SysDictData> sysDictDataList = page(page, wrapper).getRecords();
        final SysDictType sysDictType = sysDictTypeService.getById(dictDataRequest.getDictTypeUid());
        return sysDictDataList.stream().map(sysDictData -> new SysDictDataBO(sysDictData, sysDictType)).collect(Collectors.toList());
    }

    @Override
    public Boolean editDictData(SysDictDataRequest sysDictDataRequest) {
        SysDictData sysDictData = new SysDictData();
        BeanUtils.copyProperties(sysDictDataRequest, sysDictData);
        return updateById(sysDictData);
    }

    @Override
    public Boolean deleteBatch(List<String> uids) {
        Integer count = sysDictDataMapper.deleteBatch(uids);
        return count > 0;
    }

    @Override
    public Boolean addSysDictData(SysDictDataAddRequest sysDictDataAddRequest) {
        SysDictData sysDictData = new SysDictData();
        BeanUtils.copyProperties(sysDictDataAddRequest, sysDictData);
        sysDictData.setUid(UUidUtils.getUUId());
        User user = UserThreadHolder.get();
        sysDictData.setCreateByUid(user.getUid());
        sysDictData.setUpdateByUid(user.getUid());
        sysDictData.setStatus(1);
        Date date = new Date();
        sysDictData.setCreateTime(date);
        sysDictData.setUpdateTime(date);
        final int count = sysDictDataMapper.insert(sysDictData);
        return count > 0;
    }
}
