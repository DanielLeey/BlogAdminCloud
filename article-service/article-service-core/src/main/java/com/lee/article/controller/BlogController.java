package com.lee.article.controller;

import com.lee.article.service.BlogService;
import com.lee.common.Request.BlogAddRequest;
import com.lee.common.Request.BlogDeleteRequest;
import com.lee.common.Request.BlogEditRequest;
import com.lee.common.Request.BlogRequest;
import com.lee.common.api.CommonResult;
import com.lee.common.bo.BlogListRecordBO;
import com.lee.common.vo.BlogListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
    public CommonResult getBlogList(@RequestBody BlogRequest blogRequest) throws ClassNotFoundException, NoSuchFieldException {
        List<BlogListRecordBO> blogList = blogService.getBlogList(blogRequest);
        final BlogListVO blogListVO = new BlogListVO();
        blogListVO.setCurrent(blogRequest.getCurrentPage());
        blogListVO.setSize(blogRequest.getPageSize());
        blogListVO.setTotal(blogService.count());
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
    @PostMapping("/delete")
    public CommonResult deleteBlog(@RequestBody Map<String, String> map) {
        final Boolean flag = blogService.deleteBlog(map.get("uid"));
        if (flag) {
            return CommonResult.success("删除成功");
        }else {
            return CommonResult.failed();
        }
    }

    @PostMapping("/deleteBatch")
    public CommonResult deleteBlogBatch(@RequestBody List<BlogDeleteRequest> list) {
        final List<String> uids = list.stream().map(blog -> blog.getUid()).collect(Collectors.toList());
        Boolean flag = blogService.deleteBatch(uids);
        if (flag) {
            return CommonResult.success("批量删除成功");
        }else {
            return CommonResult.failed();
        }
    }
}
