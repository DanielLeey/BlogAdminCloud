package com.lee.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lee.common.entity.WebVisit;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @Author: liyansong
 * @Date: 2022/12/13 14:40
 * @Version: 1.0
 */
public interface WebVisitMapper extends BaseMapper<WebVisit> {

    List<Map<String, Object>> getPVByWeek(@Param("startDate") String startDate,@Param("endDate") String endDate);

    List<Map<String, Object>> getUVByWeek(@Param("startDate") String startDate,@Param("endDate") String endDate);
}
