package com.lee.article.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lee.common.api.CommonResult;
import com.lee.common.entity.ArticleDTO;
import com.lee.common.entity.Article;

public interface ArticleService extends IService<Article> {

    public CommonResult<ArticleDTO> getArticleById(String id);
}
