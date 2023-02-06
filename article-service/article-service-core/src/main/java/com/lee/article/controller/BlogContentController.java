package com.lee.article.controller;

import com.lee.article.service.BlogService;
import com.lee.common.api.CommonResult;
import com.lee.common.bo.BlogListRecordBO;
import com.lee.common.entity.Blog;
import com.lee.common.vo.BlogListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.websocket.server.PathParam;
import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2023/2/4 16:28
 * @Version: 1.0
 */
@RestController
@RequestMapping("/content")
public class BlogContentController {

    @Autowired
    private BlogService blogService;

    @GetMapping("/getBlogByUid")
    public CommonResult getBlogByUid(@PathParam("oid") String oid) {
        BlogListRecordBO blog = blogService.getBlogByUid(oid);
        return CommonResult.success(blog);
    }

    @GetMapping("/getSameBlogByBlogUid")
    public CommonResult getSameBlogByBlogUid(@PathParam("blogUid") String blogUid) {
        List<BlogListRecordBO> blogList = blogService.getSameBlogByBlogUid(blogUid);
        final BlogListVO blogListVO = new BlogListVO(blogList);
        blogListVO.setCurrent(1);
        blogListVO.setSize(10);
        blogListVO.setTotal(blogService.count());
        blogListVO.setIsSearchCount(true);
        blogListVO.setOptimizeCountsql(true);
        return CommonResult.success(blogListVO);
    }
}
