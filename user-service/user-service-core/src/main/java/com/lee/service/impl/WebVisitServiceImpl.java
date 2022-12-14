package com.lee.service.impl;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUnit;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.ObjUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.common.bo.VisitByWeekBO;
import com.lee.common.entity.WebVisit;
import com.lee.dao.WebVisitMapper;
import com.lee.service.WebVisitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.function.Consumer;
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
        DateTime curDate = DateUtil.offsetDay(DateUtil.date(), 1);
        DateTime offsetDate = DateUtil.offsetDay(curDate, -7);
        String endDate = DateUtil.format(curDate, "yyyy-MM-dd");
        String startDate = DateUtil.format(offsetDate, "yyyy-MM-dd");
        List<String> date = getWeek(offsetDate, curDate);
        //getPVByWeek 访问量
        List<Map<String, Object>> pvByWeekList = webVisitMapper.getPVByWeek(startDate, endDate);
        //getUVByWeek 用户数
        List<Map<String, Object>> uvByWeekList = webVisitMapper.getUVByWeek(startDate, endDate);
        Map<String, Integer> pvByWeekMap = new HashMap<>(7);
        Map<String, Integer> uvByWeekMap = new HashMap<>(7);
        pvByWeekList.forEach(pvByWeek -> {
            String day = (String) pvByWeek.get("DATE");
            int count = ((Long) pvByWeek.get("COUNT")).intValue();
            pvByWeekMap.put(day, count);
        });
        uvByWeekList.forEach(uvByWeek -> {
            String day = (String) uvByWeek.get("DATE");
            int count = ((Long) uvByWeek.get("COUNT")).intValue();
            uvByWeekMap.put(day, count);
        });
        List<Integer> pvList = new ArrayList<>(7);
        List<Integer> uvList = new ArrayList<>(7);
        if (ObjUtil.isNotEmpty(pvByWeekList) && ObjUtil.isNotEmpty(uvByWeekList)) {
            long days = DateUtil.between(offsetDate, curDate, DateUnit.DAY);
            List<Integer> finalPvList = new ArrayList<>(7);
            List<Integer> finalUvList = new ArrayList<>(7);
            Stream.iterate(offsetDate, day -> DateUtil.offsetDay(day, 1))
                    .limit(days)
                    .map(day -> DateUtil.format(day, "yyyy-MM-dd"))
                    .forEach(new Consumer<String>() {
                        @Override
                        public void accept(String day) {
                            finalPvList.add(pvByWeekMap.getOrDefault(day, 0));
                            finalUvList.add(uvByWeekMap.getOrDefault(day, 0));
                        }
                    });
            pvList = finalPvList;
            uvList = finalUvList;
        }
        return VisitByWeekBO.builder().date(date).pv(pvList).uv(uvList).build();
    }

    private List<String> getWeek(DateTime startDate, DateTime endDate) {
        long days = DateUtil.between(startDate, endDate, DateUnit.DAY);
        final List<String> list = Stream.iterate(startDate, day -> DateUtil.offsetDay(day, 1))
                .limit(days)
                .map(day -> DateUtil.format(day, "MM-dd"))
                .collect(Collectors.toList());
        return list;
    }
}
