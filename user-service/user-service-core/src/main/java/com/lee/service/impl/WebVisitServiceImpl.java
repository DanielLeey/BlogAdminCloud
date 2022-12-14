package com.lee.service.impl;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUnit;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.ObjUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.common.bo.VisitByWeekBO;
import com.lee.common.entity.WebVisit;
import com.lee.dao.WebVisitMapper;
import com.lee.service.WebVisitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * @Author: liyansong
 * @Date: 2022/12/13 14:39
 * @Version: 1.0
 */
@Service
public class WebVisitServiceImpl extends ServiceImpl<WebVisitMapper, WebVisit> implements WebVisitService {

    @Autowired
    private WebVisitMapper webVisitMapper;

    @Override
    public VisitByWeekBO getVisitByWeek() {
        DateTime curDate = DateUtil.date();
        DateTime offsetDate = DateUtil.offsetDay(curDate, -7);
        String endDate = DateUtil.format(curDate, "yyyy-MM-dd");
        String startDate = DateUtil.format(offsetDate, "yyyy-MM-dd");
        List<String> date = getWeek(offsetDate, curDate);
        //getPVByWeek 访问量
        List<Map<String, Object>> pvByWeek = webVisitMapper.getPVByWeek(startDate, endDate);
        //getUVByWeek 用户数
        List<Map<String, Object>> uvByWeek = webVisitMapper.getUVByWeek(startDate, endDate);

        List<Integer> pvList = new ArrayList<>(7);
        List<Integer> uvList = new ArrayList<>(7);
        if (ObjUtil.isNotEmpty(pvByWeek)) {
            pvList = pvByWeek.stream().map(pv -> (Integer) pv.get("COUNT")).collect(Collectors.toList());
        }
        if (ObjUtil.isNotEmpty(uvByWeek)) {
            uvList = uvByWeek.stream().map(pv -> (Integer) pv.get("COUNT")).collect(Collectors.toList());
        }
        return VisitByWeekBO.builder().date(date).pv(pvList).uv(uvList).build();
    }

    private List<String> getWeek(DateTime startDate, DateTime endDate) {
        long days = DateUtil.between(startDate, endDate, DateUnit.DAY);
        final List<String> list = Stream.iterate(startDate, day -> DateUtil.offsetDay(day, 1))
                .limit(days)
                .map(day -> DateUtil.format(day, "yyyy-MM-dd"))
                .collect(Collectors.toList());
        return list;
    }
}
