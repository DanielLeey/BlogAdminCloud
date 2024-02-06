package com.lee.article.controller;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.lee.article.service.BlogService;
import com.lee.common.api.CommonResult;
import com.lee.common.bo.BlogListRecordBO;
import com.lee.common.vo.BlogListVO;
import org.redisson.api.RBloomFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
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

    @Resource(name = "blogBloomFilter")
    private RBloomFilter<String> blogBloomFilter;


    @GetMapping("/getBlogByUid")
    public CommonResult getBlogByUid(@PathParam("uid") String uid, @PathParam("oid") String oid) {
        if (ObjectUtil.isNotEmpty(uid) && !blogBloomFilter.contains(uid)) {
            return CommonResult.failed("没有该文章！");
        }
        BlogListRecordBO blog = blogService.getBlogByUid(uid, oid);
        return CommonResult.success(blog);
    }

    @GetMapping("/getSameBlogByBlogUid")
    public CommonResult getSameBlogByBlogUid(@PathParam("blogUid") String blogUid) {
        if (!blogBloomFilter.contains(blogUid)) {
            return CommonResult.failed("没有该文章！");
        }
        List<BlogListRecordBO> blogList = blogService.getSameBlogByBlogUid(blogUid);
        final BlogListVO blogListVO = new BlogListVO(blogList);
        blogListVO.setCurrent(1);
        blogListVO.setSize(10);
        blogListVO.setTotal(blogService.count());
        blogListVO.setIsSearchCount(true);
        blogListVO.setOptimizeCountsql(true);
        return CommonResult.success(blogListVO);
    }

    /**
     * 点赞按钮
     * 插入comment评论表一条数据，更新blog表的点赞数，返回blog的点赞数
     * 重复点赞，插入失败
     * @return
     */
    @GetMapping("/praiseBlogByUid")
    public CommonResult praiseBlogByUid(@PathParam("uid") String uid) {
        if (StrUtil.isBlank(uid)) {
            return CommonResult.failed("点赞失败");
        }
        //文章点赞数量
        Integer praiseCount = blogService.praiseBlogByUid(uid);
        if (praiseCount == -1) {
            return CommonResult.failed("您已经点赞过了!");
        }
        return CommonResult.success(praiseCount);
    }
}
