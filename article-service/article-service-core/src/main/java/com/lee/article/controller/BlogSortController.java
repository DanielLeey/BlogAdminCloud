package com.lee.article.controller;

import com.lee.article.service.BlogSortService;
import com.lee.common.api.CommonResult;
import com.lee.common.bo.BlogSortListRecordBO;
import com.lee.common.entity.BaseQuery;
import com.lee.common.vo.BlogSortListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/25 16:40
 * @Version: 1.0
 */
@RestController
@RequestMapping("/blogSort")
public class BlogSortController {

    @Autowired
    private BlogSortService blogSortService;

    @PostMapping("/getList")
    public CommonResult getBlogSortList(@RequestBody BaseQuery baseQuery) {
        List<BlogSortListRecordBO> blogList = blogSortService.getBlogSortList(baseQuery);
        BlogSortListVO blogSortListVO = new BlogSortListVO();
        blogSortListVO.setCurrent(baseQuery.getCurrentPage());
        blogSortListVO.setSize(baseQuery.getPageSize());
        blogSortListVO.setTotal(blogList.size());
        blogSortListVO.setRecords(blogList);
        blogSortListVO.setIsSearchCount(true);
        blogSortListVO.setOptimizeCountsql(true);
        return CommonResult.success(blogSortListVO);
    }
}
