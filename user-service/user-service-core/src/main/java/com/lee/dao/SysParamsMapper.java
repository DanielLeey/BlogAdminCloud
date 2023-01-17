package com.lee.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lee.common.entity.SysParams;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2023/1/14 16:20
 * @Version: 1.0
 */
public interface SysParamsMapper extends BaseMapper<SysParams> {

    Integer deleteBatch(@Param("uids") List<String> uids);
}
