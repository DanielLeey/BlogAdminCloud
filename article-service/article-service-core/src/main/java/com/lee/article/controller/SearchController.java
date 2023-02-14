package com.lee.article.controller;

import com.lee.article.service.BlogService;
import com.lee.common.Request.BlogRequest;
import com.lee.common.api.CommonResult;
import com.lee.common.bo.BlogListRecordBO;
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
 * @Date: 2023/2/3 16:04
 * @Version: 1.0
 */
@RestController
@RequestMapping("/search")
public class SearchController {

    @Autowired
    private BlogService blogService;

    @GetMapping("/getSearchModel")
    public CommonResult getSearchModel() {
        return CommonResult.success(0);
    }

    @GetMapping("/searchBlogByTag")
    public CommonResult searchBlogByTag(@PathParam("tagUid") String tagUid,
                                        @PathParam("currentPage") Integer currentPage,
                                        @PathParam("pageSize") Integer pageSize) throws NoSuchFieldException, ClassNotFoundException {
        final BlogRequest blogRequest = BlogRequest.builder().tagUid(tagUid).build();
        blogRequest.setCurrentPage(currentPage == null? 1 : currentPage);
        blogRequest.setPageSize(pageSize == null? 10 : pageSize);
        List<BlogListRecordBO> blogList = blogService.getBlogList(blogRequest);
        final BlogListVO blogListVO = new BlogListVO(blogList);
        blogListVO.setCurrent(blogRequest.getCurrentPage());
        blogListVO.setSize(blogRequest.getPageSize());
        blogListVO.setTotal(blogService.count());
        blogListVO.setIsSearchCount(true);
        blogListVO.setOptimizeCountsql(true);
        return CommonResult.success(blogListVO);
    }
}
