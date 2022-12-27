package com.lee.article.controller;

import com.lee.article.service.BlogService;
import com.lee.common.Request.BlogAddRequest;
import com.lee.common.Request.BlogEditRequest;
import com.lee.common.Request.BlogRequest;
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

    /**
     * 根据条件查询博客
     * @param blogRequest
     * @return
     */
    @PostMapping("/getList")
    public CommonResult getBlogList(@RequestBody BlogRequest blogRequest) {
        List<BlogListRecordBO> blogList = blogService.getBlogList(blogRequest);
        final BlogListVO blogListVO = new BlogListVO();
        blogListVO.setCurrent(blogRequest.getCurrentPage());
        blogListVO.setSize(blogRequest.getPageSize());
        blogListVO.setTotal(blogList.size());
        blogListVO.setRecords(blogList);
        blogListVO.setIsSearchCount(true);
        blogListVO.setOptimizeCountsql(true);
        return CommonResult.success(blogListVO);
    }

    @PostMapping("/edit")
    public CommonResult editBlog(@RequestBody BlogEditRequest blogEditRequest) {
        final Boolean flag = blogService.editBlog(blogEditRequest);
        if (flag) {
            return CommonResult.success("编辑成功");
        }else {
            return CommonResult.failed();
        }
    }

    @PostMapping("/add")
    public CommonResult addBlog(@RequestBody BlogAddRequest blogAddRequest) {
        final Boolean flag = blogService.addBlog(blogAddRequest);
        if (flag) {
            return CommonResult.success("新增成功");
        }else {
            return CommonResult.failed();
        }
    }
}
