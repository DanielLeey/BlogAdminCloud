package com.lee.controller;

import com.lee.api.ArticleFeignService;
import com.lee.common.api.CommonResult;
import com.lee.dto.ArticleDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("user")
public class UserArticleController {

    @Autowired
    private ArticleFeignService articleService;

    @RequestMapping(value = "/api/article/getArticle/{id}", method = RequestMethod.GET)
    public CommonResult<ArticleDTO> getArticleById(@PathVariable(value = "id") String id) {
        return articleService.getArticleById(id);
    }

    @RequestMapping("/test")
    public String test() {
        return "test";
    }

}
