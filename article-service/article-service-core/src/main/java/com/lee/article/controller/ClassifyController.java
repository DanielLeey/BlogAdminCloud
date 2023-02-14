package com.lee.article.controller;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.lee.article.service.BlogService;
import com.lee.article.service.BlogSortService;
import com.lee.common.Request.BlogRequest;
import com.lee.common.api.CommonResult;
import com.lee.common.bo.BlogListRecordBO;
import com.lee.common.bo.BlogSortListRecordBO;
import com.lee.common.entity.Blog;
import com.lee.common.entity.BlogSort;
import com.lee.common.vo.BlogListVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.websocket.server.PathParam;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @Author: liyansong
 * @Date: 2023/2/6 14:58
 * @Version: 1.0
 */
@RestController
@RequestMapping("/classify")
public class ClassifyController {

    @Autowired
    private BlogService blogService;

    @Autowired
    private BlogSortService blogSortService;

    @GetMapping("/getBlogSortList")
    public CommonResult getBlogSortList() {
        LambdaQueryWrapper<BlogSort> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(BlogSort::getStatus, 1).orderByDesc(BlogSort::getSort);
        final List<BlogSort> blogSorts = blogSortService.list(wrapper);
        if (CollUtil.isNotEmpty(blogSorts)) {
            List<BlogSortListRecordBO> list = blogSorts.stream().map(blogSort -> {
                BlogSortListRecordBO blogSortListRecordBO = new BlogSortListRecordBO();
                BeanUtils.copyProperties(blogSort, blogSortListRecordBO);
                return blogSortListRecordBO;
            }).collect(Collectors.toList());
            return CommonResult.success(list);
        }
        return CommonResult.success(new ArrayList<>());
    }

    @GetMapping("/getArticleByBlogSortUid")
    public CommonResult getArticleByBlogSortUid(@PathParam("blogSortUid") String blogSortUid, @PathParam("currentPage") Integer currentPage) throws NoSuchFieldException, ClassNotFoundException {
        final BlogRequest blogRequest = BlogRequest.builder().blogSortUid(blogSortUid).build();
        blogRequest.setCurrentPage(currentPage == null? 1 : currentPage);
        blogRequest.setPageSize(10);
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
