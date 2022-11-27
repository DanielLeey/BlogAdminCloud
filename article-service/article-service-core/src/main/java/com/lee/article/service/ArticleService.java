package com.lee.article.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lee.common.api.CommonResult;
import com.lee.dto.ArticleDTO;
import com.lee.entity.Article;

public interface ArticleService extends IService<Article> {

    public CommonResult<ArticleDTO> getArticleById(String id);
}
