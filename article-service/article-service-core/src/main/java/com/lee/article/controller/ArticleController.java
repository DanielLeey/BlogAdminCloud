package com.lee.article.controller;

import com.lee.article.service.ArticleService;
import com.lee.common.api.CommonResult;
import com.lee.common.entity.ArticleDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/article")
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @RequestMapping("/getArticle/{id}")
    public CommonResult<ArticleDTO> getArticleById(@PathVariable(value = "id") String id) {
        return articleService.getArticleById(id);
    }
}
