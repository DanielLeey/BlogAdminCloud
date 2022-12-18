package com.lee.controller;

import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import com.lee.api.ArticleFeignService;
import com.lee.api.CommentFeignService;
import com.lee.common.api.CommonResult;
import com.lee.common.bo.VisitByWeekBO;
import com.lee.common.entity.User;
import com.lee.common.vo.InitVO;
import com.lee.domain.BlogContributeCountBO;
import com.lee.domain.BlogContributeCountVO;
import com.lee.domain.UserThreadHolder;
import com.lee.service.UserService;
import com.lee.service.WebVisitService;
import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/12 16:56
 * @Version: 1.0
 */
@RestController
@RequestMapping("/index")
public class IndexController {

    @Autowired
    private UserService userService;

    @Autowired
    private WebVisitService webVisitService;

    @Autowired
    private CommentFeignService commentFeignService;

    @Autowired
    private ArticleFeignService articleFeignService;

    @RequestMapping("/init")
    public CommonResult init() {
        int userCount = userService.count();
        int commentCount = commentFeignService.getCommentCount();
        int blogCount = articleFeignService.getArticleCount();
        int visitCount = 0;
        InitVO initVO = InitVO.builder().blogCount(blogCount).visitCount(visitCount).commentCount(commentCount).userCount(userCount).build();
        return CommonResult.success(initVO);
    }

    @GetMapping(value = "/getVisitByWeek")
    public CommonResult getVisitByWeek() {
        VisitByWeekBO visitByWeekBO = webVisitService.getVisitByWeek();
        return CommonResult.success(visitByWeekBO);
    }

    /**
     * contributeDate: 日历的起止日
     * blogContributeCount： 数组，arr[0]日期，arr[1]写文章的数量
     * @return
     */
    @GetMapping(value = "/getBlogContributeCount")
    public CommonResult getBlogContributeCount() {
        // 1.获取日历起止日期
        DateTime curDate = DateUtil.date();
        DateTime startDate = DateUtil.offset(curDate, DateField.MONTH, -12);
        List<String> contributeDate = new ArrayList<>(2);
        contributeDate.add(startDate.toString());
        contributeDate.add(curDate.toString());
        // 2.获取访问用户一年内的文章数量
        User user = UserThreadHolder.get();
        BlogContributeCountBO blogContributeCount = webVisitService.getBlogContributeCount(user.getId(), startDate, curDate);
        BlogContributeCountVO blogContributeCountVO = BlogContributeCountVO.builder()
                                                                            .contributeDate(contributeDate)
                                                                            .blogContributeCount(blogContributeCount.getBlogContributeCount())
                                                                            .build();
        return CommonResult.success(blogContributeCountVO);
    }
}