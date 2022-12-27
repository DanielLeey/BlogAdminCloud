package com.lee.article.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lee.common.Request.BlogAddRequest;
import com.lee.common.Request.BlogEditRequest;
import com.lee.common.Request.BlogRequest;
import com.lee.common.bo.BlogListRecordBO;
import com.lee.common.entity.Blog;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/24 15:30
 * @Version: 1.0
 */
public interface BlogService extends IService<Blog> {

    List<BlogListRecordBO> getBlogList(BlogRequest blogRequest);

    Boolean editBlog(BlogEditRequest blogEditRequest);

    Boolean addBlog(BlogAddRequest blogAddRequest);
}
