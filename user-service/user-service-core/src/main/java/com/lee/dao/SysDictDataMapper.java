package com.lee.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lee.common.entity.SysDictData;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2023/1/11 20:49
 * @Version: 1.0
 */
public interface SysDictDataMapper extends BaseMapper<SysDictData> {

    Integer deleteBatch(@Param("uids") List<String> uids);
}
