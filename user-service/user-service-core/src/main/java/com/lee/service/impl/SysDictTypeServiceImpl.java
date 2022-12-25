package com.lee.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.common.bo.DictSysTypeBO;
import com.lee.common.entity.DictType;
import com.lee.common.entity.SysDictType;
import com.lee.dao.SysDictTypeMapper;
import com.lee.service.SysDictTypeService;
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
    public Map<String, Object> getListByDictTypeList(List<String> sysList) {
        List<DictType> list = sysDictTypeMapper.getListByDictTypeList(sysList);
        //List<DictSysTypeBO> dictSysTypeBOList = new ArrayList<>(sysList.size());
        Map<String, Object> map = new HashMap<>(sysList.size());
        for (String sysDictType : sysList) {
            List<DictType> dictTypes = list.stream().filter(dictType -> sysDictType.equals(dictType.getDictType())).collect(Collectors.toList());
            final Optional<DictType> defaultDictType = dictTypes.stream().filter(dictType -> dictType.getIsDefault() == 1).findFirst();
            final String defaultValue = defaultDictType.get().getDictValue();
            final DictSysTypeBO dictSysTypeBO = DictSysTypeBO.builder().defaultValue(defaultValue).list(dictTypes).build();
            //dictSysTypeBOList.add(dictSysTypeBO);
            map.put(sysDictType, dictSysTypeBO);
        }
        return map;
    }
}
