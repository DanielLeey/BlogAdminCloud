package com.lee.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lee.common.entity.DictType;
import com.lee.common.entity.SysDictType;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/25 10:52
 * @Version: 1.0
 */
public interface SysDictTypeMapper extends BaseMapper<SysDictType> {

    List<DictType> getListByDictTypeList(@Param("sysList") List<String> sysList);
}
