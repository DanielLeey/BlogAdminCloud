package com.lee.api;

import com.lee.common.api.CommonResult;
import com.lee.common.dto.ArticleDTO;
import com.lee.common.dto.BlogCountByBlogSortDTO;
import com.lee.common.dto.BlogCountByTagDTO;
import com.lee.common.entity.Article;
import com.lee.component.sentinel.ArticleFeignServiceFallback;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@FeignClient(value = "article-service", path = "/article", fallback = ArticleFeignServiceFallback.class)
public interface ArticleFeignService {

    @RequestMapping(value = "/getArticle/{id}", method = RequestMethod.GET)
    CommonResult<ArticleDTO> getArticleById(@PathVariable(value = "id") String id);

    @GetMapping("/count")
    public int getArticleCount();

    @GetMapping("/getArticleByUserId/{uid}/{startDate}/{endDate}")
    public List<Article> getArticleByUserId(@PathVariable(value = "uid") String uid, @PathVariable(value = "startDate") String startDate, @PathVariable(value = "endDate") String endDate);

    @GetMapping("/getBlogCountByBlogSort")
    public BlogCountByBlogSortDTO getBlogCountByBlogSort();

    @GetMapping("/getBlogCountByTag")
    public BlogCountByTagDTO getBlogCountByTag();

    @GetMapping("/recorderVisitPage")
    public List<Article> recorderVisitPage();

    @PostMapping("/insert")
    CommonResult<Article>  testSeataInsertArtile();

    @PostMapping("/testSentinel")
    CommonResult<Article> testSentinel();
}
