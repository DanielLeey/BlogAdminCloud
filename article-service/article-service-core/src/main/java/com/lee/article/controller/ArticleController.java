package com.lee.article.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.lee.api.UserFeignService;
import com.lee.article.service.ArticleService;
import com.lee.article.service.TagService;
import com.lee.common.api.CommonResult;
import com.lee.common.bo.BlogCountByBlogSortBO;
import com.lee.common.bo.BlogCountByTagBO;
import com.lee.common.dto.BlogCountByBlogSortDTO;
import com.lee.common.dto.BlogCountByTagDTO;
import com.lee.common.entity.Article;
import com.lee.common.dto.ArticleDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/article")
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private TagService tagService;

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
    @GetMapping("/getBlogCountByBlogSort")
    public BlogCountByBlogSortDTO getBlogCountByBlogSort() {
        List<BlogCountByBlogSortBO> list = articleService.getBlogCountByBlogSort();
        final List<Map<String, Object>> maps = list.stream().map(blogCountByBlogSortBO -> {
            Map<String, Object> map = new HashMap<>();
            map.put("blogSortUid", blogCountByBlogSortBO.getBlogSortUid());
            map.put("name", blogCountByBlogSortBO.getName());
            map.put("value", blogCountByBlogSortBO.getValue());
            return map;
        }).collect(Collectors.toList());
        return BlogCountByBlogSortDTO.builder().list(maps).build();
    }

    @GetMapping("/getBlogCountByTag")
    public BlogCountByTagDTO getBlogCountByTag() {
        List<BlogCountByTagBO> list = tagService.getBlogCountByTag();
        final List<Map<String, Object>> mapList = list.stream().map(blogCountByTagBO -> {
            Map<String, Object> map = new HashMap<>(3);
            map.put("tagUid", blogCountByTagBO.getTagUid());
            map.put("name", blogCountByTagBO.getName());
            map.put("value", blogCountByTagBO.getValue());
            return map;
        }).collect(Collectors.toList());
        return BlogCountByTagDTO.builder().list(mapList).build();
    }

    @PostMapping("/insert")
    CommonResult<Article> testSeataInsertArtile() throws Exception {
        LambdaQueryWrapper<Article> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Article::getId, 1L);
        Article article = articleService.getOne(wrapper);
        article.setId(1000L);
        articleService.addArticle(article);
        return CommonResult.success(article);
    }

    @PostMapping("/testSentinel")
    CommonResult<Article> testSentinel() throws Exception {
        LambdaQueryWrapper<Article> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Article::getId, 1L);
        Article article = articleService.getOne(wrapper);
        Thread.sleep(60);
        return CommonResult.success(article);
    }
}
