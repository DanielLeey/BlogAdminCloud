package com.lee.article.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lee.common.bo.BlogCountByBlogSortBO;
import com.lee.common.entity.Article;

import java.util.List;

public interface ArticleMapper extends BaseMapper<Article> {

    List<BlogCountByBlogSortBO> getBlogCountByBlogSort();
}
