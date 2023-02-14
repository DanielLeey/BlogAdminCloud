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

    List<BlogListRecordBO> getBlogList(BlogRequest blogRequest) throws ClassNotFoundException, NoSuchFieldException;

    Boolean editBlog(BlogEditRequest blogEditRequest);

    Boolean addBlog(BlogAddRequest blogAddRequest);

    Boolean deleteBlog(String uid);

    Boolean deleteBatch(List<String> uids);

    List<BlogListRecordBO> getBlogListByUids(List<String> blogUids, Integer currentPage, Integer pageSize);

    Boolean pay(String id);

    List<BlogListRecordBO> getBlogByLevel(Integer currentPage, Integer pageSize, Integer level, Integer useSort);

    List<BlogListRecordBO> getNewBlog(Integer currentPage, Integer pageSize);

    List<BlogListRecordBO> getHotBlog();

    BlogListRecordBO getBlogByUid(String uid, String oid);

    List<BlogListRecordBO> getSameBlogByBlogUid(String blogUid);

    List<String> getSortList();

    List<BlogListRecordBO> getArticleByMonth(String monthDate);
}
