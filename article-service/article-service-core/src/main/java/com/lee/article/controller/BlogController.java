package com.lee.article.controller;

import com.lee.article.service.BlogService;
import com.lee.common.Query.BlogQuery;
import com.lee.common.api.CommonResult;
import com.lee.common.bo.BlogListRecordBO;
import com.lee.common.vo.BlogListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/21 16:29
 * @Version: 1.0
 */
@RestController
@RequestMapping("/blog")
public class BlogController {

    @Autowired
    private BlogService blogService;

    @PostMapping("/getList")
    public CommonResult getBlogList(@RequestBody BlogQuery blogQuery) {
        final int count = blogService.count();
        List<BlogListRecordBO> blogList = blogService.getBlogList(blogQuery);
        BlogListVO blogListVO = BlogListVO.builder().current(blogQuery.getCurrentPage())
                .size(blogQuery.getPageSize()).total(count).records(blogList).isSearchCount(true).optimizeCountsql(true).build();
        return CommonResult.success(blogListVO);
    }
}
