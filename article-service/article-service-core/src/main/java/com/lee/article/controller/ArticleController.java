package com.lee.article.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.lee.article.service.ArticleService;
import com.lee.common.api.CommonResult;
import com.lee.common.entity.Article;
import com.lee.common.dto.ArticleDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/article")
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @RequestMapping("/getArticle/{id}")
    public CommonResult<ArticleDTO> getArticleById(@PathVariable(value = "id") String id) {
        return articleService.getArticleById(id);
    }

    @GetMapping("/count")
    public int getArticleCount() {
        LambdaQueryWrapper<Article> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Article::getStatus, 0);
        return articleService.count(wrapper);
    }

    @GetMapping("/getArticleByUserId/{uid}/{startDate}/{endDate}")
    public List<Article> getArticleByUserId(@PathVariable(value = "uid") String uid, @PathVariable(value = "startDate") String startDate, @PathVariable(value = "endDate") String endDate) {
        return articleService.getArticleByUserId(uid, startDate, endDate);
    }
}
