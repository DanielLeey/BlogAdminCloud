package com.lee.article.controller;

import com.lee.article.service.BlogService;
import com.lee.article.utils.RedisUtils;
import com.lee.common.Request.BlogAddRequest;
import com.lee.common.Request.BlogDeleteRequest;
import com.lee.common.Request.BlogEditRequest;
import com.lee.common.Request.BlogRequest;
import com.lee.common.api.CommonResult;
import com.lee.common.bo.BlogListRecordBO;
import com.lee.common.vo.BlogListVO;
import lombok.extern.slf4j.Slf4j;
import org.redisson.api.RBloomFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.websocket.server.PathParam;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @Author: liyansong
 * @Date: 2022/12/21 16:29
 * @Version: 1.0
 */
@Slf4j
@RestController
@RequestMapping("/blog")
public class BlogController {

    @Autowired
    private BlogService blogService;

    @Resource(name = "blogBloomFilter")
    private RBloomFilter<String> blogBloomFilter;

    @Autowired
    private RedisUtils redisUtils;

    // 初始化布隆过滤器
    @PostConstruct
    public void initBlogBloomFilter() {
        // 把所有的博客信息放进布隆过滤器中
        blogService.list().parallelStream().forEach(blog -> {
            blogBloomFilter.add(blog.getUid());
            blogBloomFilter.add(blog.getOid() + "");
        });
        log.info("***********博客布隆过滤器初始化数据成功  当前数量：{} ***********", blogBloomFilter.count());
    }


    /**
     * 根据条件查询博客
     *
     * @param blogRequest
     * @return
     */
    @PostMapping("/getList")
    public CommonResult getBlogList(@RequestBody BlogRequest blogRequest) throws ClassNotFoundException, NoSuchFieldException {
        List<BlogListRecordBO> blogList = blogService.getBlogList(blogRequest);
        final BlogListVO blogListVO = new BlogListVO(blogList);
        blogListVO.setCurrent(blogRequest.getCurrentPage());
        blogListVO.setSize(blogRequest.getPageSize());
        blogListVO.setTotal(blogService.count());
        blogListVO.setIsSearchCount(true);
        blogListVO.setOptimizeCountsql(true);
        return CommonResult.success(blogListVO);
    }

    @PostMapping("/edit")
    public CommonResult editBlog(@RequestBody BlogEditRequest blogEditRequest) {
        final Boolean flag = blogService.editBlog(blogEditRequest);
        if (flag) {
            return CommonResult.success("编辑成功");
        } else {
            return CommonResult.failed();
        }
    }

    @PostMapping("/add")
    public CommonResult addBlog(@RequestBody BlogAddRequest blogAddRequest) {
        final Boolean flag = blogService.addBlog(blogAddRequest);
        if (flag) {
            blogBloomFilter.add(blogAddRequest.getUid());
            return CommonResult.success("新增成功");
        } else {
            return CommonResult.failed();
        }
    }

    @PostMapping("/delete")
    public CommonResult deleteBlog(@RequestBody Map<String, String> map) {
        final Boolean flag = blogService.deleteBlog(map.get("uid"));
        if (flag) {
            return CommonResult.success("删除成功");
        } else {
            return CommonResult.failed();
        }
    }

    @PostMapping("/deleteBatch")
    public CommonResult deleteBlogBatch(@RequestBody List<BlogDeleteRequest> list) {
        final List<String> uids = list.stream().map(blog -> blog.getUid()).collect(Collectors.toList());
        Boolean flag = blogService.deleteBatch(uids);
        if (flag) {
            return CommonResult.success("批量删除成功");
        } else {
            return CommonResult.failed();
        }
    }

    @GetMapping("/pay/{id}")
    public CommonResult pay(@PathVariable("id") String id) {
        Boolean flag = blogService.pay(id);
        if (flag) {
            return CommonResult.success("支付成功");
        } else {
            return CommonResult.failed();
        }
    }

    @GetMapping("/getBlogByLevel")
    public CommonResult getBlogByLevel(@PathParam("currentPage") Integer currentPage, @PathParam("pageSize") Integer pageSize,
                                       @PathParam("level") Integer level, @PathParam("useSort") Integer useSort) {
        currentPage = currentPage == null ? 1 : currentPage;
        pageSize = pageSize == null ? 10 : pageSize;
        List<BlogListRecordBO> blogList = blogService.getBlogByLevel(currentPage, pageSize, level, useSort);
        final BlogListVO blogListVO = new BlogListVO(blogList);
        blogListVO.setCurrent(currentPage);
        blogListVO.setSize(pageSize);
        blogListVO.setTotal(blogList.size());
        blogListVO.setIsSearchCount(true);
        blogListVO.setOptimizeCountsql(true);
        return CommonResult.success(blogListVO);
    }

    @GetMapping("/getNewBlog")
    public CommonResult getNewBlog(@PathParam("currentPage") Integer currentPage, @PathParam("pageSize") Integer pageSize) {
        List<BlogListRecordBO> blogList = blogService.getNewBlog(currentPage, pageSize);
        final BlogListVO blogListVO = new BlogListVO(blogList);
        blogListVO.setCurrent(currentPage);
        blogListVO.setSize(pageSize);
        blogListVO.setTotal(blogList.size());
        blogListVO.setIsSearchCount(true);
        blogListVO.setOptimizeCountsql(true);
        return CommonResult.success(blogListVO);
    }

    /**
     * 点击量最高的5条博客
     *
     * @return
     */
    @GetMapping("/getHotBlog")
    public CommonResult getHotBlog() {
        List<BlogListRecordBO> blogList = blogService.getHotBlog();
        final BlogListVO blogListVO = new BlogListVO(blogList);
        blogListVO.setCurrent(1);
        blogListVO.setSize(5);
        blogListVO.setTotal(blogList.size());
        blogListVO.setIsSearchCount(true);
        blogListVO.setOptimizeCountsql(true);
        return CommonResult.success(blogListVO);
    }
}
