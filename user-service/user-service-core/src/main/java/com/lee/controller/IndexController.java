package com.lee.controller;

import com.lee.api.ArticleFeignService;
import com.lee.api.CommentFeignService;
import com.lee.common.api.CommonResult;
import com.lee.common.bo.VisitByWeekBO;
import com.lee.common.vo.InitVO;
import com.lee.service.UserService;
import com.lee.service.WebVisitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
}
