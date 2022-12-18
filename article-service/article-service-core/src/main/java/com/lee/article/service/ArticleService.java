package com.lee.article.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lee.common.api.CommonResult;
import com.lee.common.dto.ArticleDTO;
import com.lee.common.entity.Article;

import java.util.List;

public interface ArticleService extends IService<Article> {

    public CommonResult<ArticleDTO> getArticleById(String id);

    public List<Article> getArticleByUserId(String uid, String startDate, String endDate);
}
