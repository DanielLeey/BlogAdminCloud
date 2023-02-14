package com.lee.article.controller;

import com.lee.article.service.BlogService;
import com.lee.common.api.CommonResult;
import com.lee.common.bo.BlogListRecordBO;
import com.lee.common.entity.Blog;
import com.lee.common.vo.BlogListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.websocket.server.PathParam;
import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2023/2/6 10:27
 * @Version: 1.0
 * 文章创建的月份
 */
@RestController
@RequestMapping("/sort")
public class SortController {

    @Autowired
    private BlogService blogService;

    @GetMapping("/getSortList")
    public CommonResult getSortList() {
        List<String> dateList = blogService.getSortList();
        return CommonResult.success(dateList);
    }

    @GetMapping("/getArticleByMonth")
    public CommonResult getArticleByMonth(@PathParam("monthDate") String monthDate) {
        List<BlogListRecordBO> blogList = blogService.getArticleByMonth(monthDate);
        return CommonResult.success(blogList);
    }
}
