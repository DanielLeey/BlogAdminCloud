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
        List<BlogListRecordBO> blogList = blogService.getBlogList(blogQuery);
        final BlogListVO blogListVO = new BlogListVO();
        blogListVO.setCurrent(blogQuery.getCurrentPage());
        blogListVO.setSize(blogQuery.getPageSize());
        blogListVO.setTotal(blogList.size());
        blogListVO.setRecords(blogList);
        blogListVO.setIsSearchCount(true);
        blogListVO.setOptimizeCountsql(true);
        return CommonResult.success(blogListVO);
    }
}
