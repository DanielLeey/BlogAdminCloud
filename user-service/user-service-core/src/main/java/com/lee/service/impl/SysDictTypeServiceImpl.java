package com.lee.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.common.Request.BaseRequest;
import com.lee.common.Request.SysDictTypeAddRequest;
import com.lee.common.Request.SysDictTypeRequest;
import com.lee.common.ThreadHolder.UserThreadHolder;
import com.lee.common.bo.DictSysTypeBO;
import com.lee.common.entity.DictType;
import com.lee.common.entity.SysDictData;
import com.lee.common.entity.SysDictType;
import com.lee.common.entity.User;
import com.lee.common.utils.UUidUtils;
import com.lee.dao.SysDictTypeMapper;
import com.lee.service.SysDictTypeService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

/**
 * @Author: liyansong
 * @Date: 2022/12/25 10:53
 * @Version: 1.0
 */
@Service("sysDictTypeService")
public class SysDictTypeServiceImpl extends ServiceImpl<SysDictTypeMapper, SysDictType> implements SysDictTypeService {

    @Autowired
    private SysDictTypeMapper sysDictTypeMapper;

    @Override
    public Map<String, DictSysTypeBO> getListByDictTypeList(List<String> sysList) {
        List<DictType> list = sysDictTypeMapper.getListByDictTypeList(sysList);
        Map<String, DictSysTypeBO> map = new HashMap<>(sysList.size());
        for (String sysDictType : sysList) {
            List<DictType> dictTypes = list.stream().filter(dictType -> sysDictType.equals(dictType.getDictType())).collect(Collectors.toList());
            final Optional<DictType> defaultDictType = dictTypes.stream().filter(dictType -> dictType.getIsDefault() == 1).findFirst();
            final String defaultValue = defaultDictType.orElseGet(() -> {
                DictType dictType = new DictType();
                dictType.setDictValue("");
                return dictType;
            }).getDictValue();
            final DictSysTypeBO dictSysTypeBO = DictSysTypeBO.builder().defaultValue(defaultValue).list(dictTypes).build();
            map.put(sysDictType, dictSysTypeBO);
        }
        return map;
    }

    @Override
    public List<SysDictData> getListByDictType(String dictType) {
        return sysDictTypeMapper.getListByDictType(dictType);
    }

    @Override
    public List<SysDictType> getSysDictTypeList(BaseRequest baseRequest) {
        LambdaQueryWrapper<SysDictType> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(SysDictType::getStatus, 1);
        Page<SysDictType> page = new Page<>(baseRequest.getCurrentPage(), baseRequest.getPageSize());
        return page(page).getRecords();
    }

    @Override
    public Boolean editDictType(SysDictTypeRequest sysDictTypeRequest) {
        SysDictType sysDictType = new SysDictType();
        BeanUtils.copyProperties(sysDictTypeRequest, sysDictType);
        return updateById(sysDictType);
    }

    @Override
    public Boolean deleteBatch(List<String> uids) {
        Integer count = sysDictTypeMapper.deleteBatch(uids);
        return count > 0;
    }

    @Override
    public Boolean addSysDictType(SysDictTypeAddRequest sysDictTypeAddRequest) {
        SysDictType sysDictType = new SysDictType();
        BeanUtils.copyProperties(sysDictTypeAddRequest, sysDictType);
        User user = UserThreadHolder.get();
        sysDictType.setUid(UUidUtils.getUUId());
        sysDictType.setCreateByUid(user.getId()+"");
        sysDictType.setUpdateByUid(user.getId()+"");
        sysDictType.setStatus(1);
        Date date = new Date();
        sysDictType.setCreateTime(date);
        sysDictType.setUpdateTime(date);
        final int count = sysDictTypeMapper.insert(sysDictType);
        return count > 0;
    }
}
