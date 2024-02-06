package com.lee.article.controller;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.lee.article.service.ArticleService;
import com.lee.article.service.TagService;
import com.lee.common.api.CommonResult;
import com.lee.common.bo.BlogCountByBlogSortBO;
import com.lee.common.bo.BlogCountByTagBO;
import com.lee.common.dto.ArticleDTO;
import com.lee.common.dto.BlogCountByBlogSortDTO;
import com.lee.common.dto.BlogCountByTagDTO;
import com.lee.common.entity.Article;
import com.lee.domain.constant.ArticleConstant;
import lombok.extern.slf4j.Slf4j;
import org.redisson.api.RBloomFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Slf4j
@RestController
@RequestMapping("/article")
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private TagService tagService;

    @Resource(name = "articleBloomFilter")
    private RBloomFilter<String> articleBloomFilter;

    @Resource
    private RedisTemplate<String, Object> redisTemplate;

    @RequestMapping("/getArticle/{id}")
    public CommonResult<ArticleDTO> getArticleById(@PathVariable(value = "id") String id) {
        if (articleBloomFilter.contains(id)) {
            log.info("文章{}不存在,不进行查询", id);
        }
        final ArticleDTO article = (ArticleDTO) redisTemplate.opsForValue().get(ArticleConstant.GET_ARTICLE + id);
        if (ObjectUtil.isNotEmpty(article)) {
            return CommonResult.success(article);
        }
        final CommonResult<ArticleDTO> articleById = articleService.getArticleById(id);
        redisTemplate.opsForValue().set(ArticleConstant.GET_ARTICLE + id, articleById.getData());
        return articleById;
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

    @GetMapping("/recorderVisitPage")
    public List<Article> recorderVisitPage() {
        LambdaQueryWrapper<Article> wrapper = new LambdaQueryWrapper<>();
        wrapper.orderByDesc(Article::getCreateTime);
        return articleService.list(wrapper);
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
