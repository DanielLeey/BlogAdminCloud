package com.lee.controller;

import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import com.lee.api.ArticleFeignService;
import com.lee.api.CommentFeignService;
import com.lee.common.api.CommonResult;
import com.lee.common.bo.VisitByWeekBO;
import com.lee.common.dto.BlogCountByBlogSortDTO;
import com.lee.common.dto.BlogCountByTagDTO;
import com.lee.common.entity.User;
import com.lee.common.vo.InitVO;
import com.lee.domain.BlogContributeCountBO;
import com.lee.domain.BlogContributeCountVO;
import com.lee.common.ThreadHolder.UserThreadHolder;
import com.lee.service.UserService;
import com.lee.service.WebVisitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
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
     * contributeDate: ??????????????????
     * blogContributeCount??? ?????????arr[0]?????????arr[1]??????????????????
     *
     * @return
     */
    @GetMapping(value = "/getBlogContributeCount")
    public CommonResult getBlogContributeCount() {
        // 1.????????????????????????
        DateTime curDate = DateUtil.date();
        DateTime startDate = DateUtil.offset(curDate, DateField.MONTH, -12);
        List<String> contributeDate = new ArrayList<>(2);
        contributeDate.add(startDate.toString());
        contributeDate.add(curDate.toString());
        // 2.??????????????????????????????????????????
        User user = UserThreadHolder.get();
        BlogContributeCountBO blogContributeCount = webVisitService.getBlogContributeCount(user.getId(), startDate, curDate);
        BlogContributeCountVO blogContributeCountVO = BlogContributeCountVO.builder()
                .contributeDate(contributeDate)
                .blogContributeCount(blogContributeCount.getBlogContributeCount())
                .build();
        return CommonResult.success(blogContributeCountVO);
    }

    /**
     * ?????????????????????????????????
     *
     * @return
     */
    @GetMapping(value = "/getBlogCountByBlogSort")
    public CommonResult getBlogCountByBlogSort() {
        BlogCountByBlogSortDTO blogCountByBlogSortDTO = webVisitService.getBlogCountByBlogSort();
                return CommonResult.success(blogCountByBlogSortDTO.getList());
    }

    /**
     * ?????????????????????????????????
     * @return
     */
    @GetMapping(value = "/getBlogCountByTag")
    public CommonResult getBlogCountByTag() {
        BlogCountByTagDTO blogCountByTagDTO = webVisitService.getBlogCountByTag();
        return CommonResult.success(blogCountByTagDTO.getList());
    }
}
