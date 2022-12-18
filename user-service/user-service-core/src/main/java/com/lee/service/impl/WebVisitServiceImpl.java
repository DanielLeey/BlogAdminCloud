package com.lee.service.impl;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUnit;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.ObjUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.api.ArticleFeignService;
import com.lee.common.bo.VisitByWeekBO;
import com.lee.common.entity.Article;
import com.lee.common.entity.WebVisit;
import com.lee.dao.WebVisitMapper;
import com.lee.domain.BlogContributeCountBO;
import com.lee.service.WebVisitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.function.BiConsumer;
import java.util.function.Consumer;
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

    @Autowired
    private ArticleFeignService articleFeignService;

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

    @Override
    public BlogContributeCountBO getBlogContributeCount(Long id, DateTime startDate, DateTime endDate) {
        List<Article> articleList = articleFeignService.getArticleByUserId(id.toString(), startDate.toString(), endDate.toString());
        // 记录每天 写的 文章数量
        Map<String, Integer> articleDateMap = new LinkedHashMap<>();
        long days = DateUtil.between(startDate, endDate, DateUnit.DAY);
        Stream.iterate(startDate, day -> DateUtil.offsetDay(day, 1))
                .limit(days + 1)
                .map(day -> DateUtil.format(day, "yyyy-MM-dd"))
                .forEach(new Consumer<String>() {
                    @Override
                    public void accept(String date) {
                        articleDateMap.put(date, 0);
                    }});
        for (Article article : articleList) {
            String articleDate = DateUtil.format(article.getCreateTime(), "yyyy-MM-dd");
            Integer dateCount = articleDateMap.getOrDefault(articleDate, 0);
            articleDateMap.put(articleDate, ++dateCount);
        }
        List<List<Object>> res = new ArrayList<>();
        articleDateMap.forEach(new BiConsumer<String, Integer>() {
            @Override
            public void accept(String date, Integer count) {
                List<Object> list = new ArrayList<>();
                list.add(date);
                list.add(count);
                res.add(list);
            }
        });
        return BlogContributeCountBO.builder().blogContributeCount(res).build();
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
