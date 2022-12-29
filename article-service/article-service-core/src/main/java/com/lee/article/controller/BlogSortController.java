package com.lee.article.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lee.article.service.BlogSortService;
import com.lee.common.Request.BaseRequest;
import com.lee.common.Request.BlogSortRequest;
import com.lee.common.api.CommonResult;
import com.lee.common.bo.BlogSortListRecordBO;
import com.lee.common.entity.BlogSort;
import com.lee.common.vo.BlogSortListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
    public CommonResult getBlogSortList(@RequestBody BlogSortRequest blogSortRequest) throws NoSuchFieldException, ClassNotFoundException {
        List<BlogSortListRecordBO> blogList = blogSortService.getBlogSortList(blogSortRequest);
        BlogSortListVO blogSortListVO = new BlogSortListVO();
        blogSortListVO.setCurrent(blogSortRequest.getCurrentPage());
        blogSortListVO.setSize(blogSortRequest.getPageSize());
        blogSortListVO.setTotal(blogSortService.count());
        blogSortListVO.setRecords(blogList);
        blogSortListVO.setIsSearchCount(true);
        blogSortListVO.setOptimizeCountsql(true);
        return CommonResult.success(blogSortListVO);
    }


    @PostMapping("/add")
    public CommonResult addBlogSortList(@RequestBody BlogSortRequest blogSortRequest) {
        Boolean flag = blogSortService.addBlogSortList(blogSortRequest);
        if (flag) {
            return CommonResult.success("添加成功");
        } else {
            return CommonResult.failed();
        }
    }
    /**
     * 置顶
     *
     * @param
     * @return
     */
    @PostMapping("/stick")
    public CommonResult stick(@RequestBody Map<String, String> map) {
        Boolean flag = blogSortService.stick(map.get("uid"));
        if (flag) {
            return CommonResult.success("置顶成功");
        } else {
            return CommonResult.failed();
        }
    }

    @PostMapping("/edit")
    public CommonResult editBLogSort(@RequestBody BlogSortRequest blogSortRequest) {
        Boolean flag = blogSortService.editBLogSort(blogSortRequest);
        if (flag) {
            return CommonResult.success("编辑成功");
        } else {
            return CommonResult.failed();
        }
    }

    @PostMapping("/deleteBatch")
    public CommonResult deleteBatchBlogSort(@RequestBody List<BlogSortRequest> list) {
        final List<String> uids = list.stream().map(blogSort -> blogSort.getUid()).collect(Collectors.toList());
        Boolean flag = blogSortService.deleteBatch(uids);
        if (flag) {
            return CommonResult.success("批量删除成功");
        }else {
            return CommonResult.failed();
        }
    }


    @PostMapping("/blogSortByClickCount")
    public CommonResult blogSortByClickCount() {
        Boolean flag = blogSortService.blogSortByClickCount();
        if (flag) {
            return CommonResult.success("操作成功");
        }else {
            return CommonResult.failed();
        }
    }

}
