package com.lee.component.sentinel;

import com.lee.api.ArticleFeignService;
import com.lee.common.api.CommonResult;
import com.lee.common.dto.ArticleDTO;
import com.lee.common.dto.BlogCountByBlogSortDTO;
import com.lee.common.dto.BlogCountByTagDTO;
import com.lee.common.entity.Article;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2024/1/12 10:48
 * @Version: 1.0
 */
@Component
public class ArticleFeignServiceFallback implements ArticleFeignService {
    @Override
    public CommonResult<ArticleDTO> getArticleById(String id) {
        return CommonResult.failed("熔断中");
    }

    @Override
    public int getArticleCount() {
        return 0;
    }

    @Override
    public List<Article> getArticleByUserId(String uid, String startDate, String endDate) {
        return new ArrayList<>();
    }

    @Override
    public BlogCountByBlogSortDTO getBlogCountByBlogSort() {
        return new BlogCountByBlogSortDTO();
    }

    @Override
    public BlogCountByTagDTO getBlogCountByTag() {
        return new BlogCountByTagDTO();
    }

    @Override
    public List<Article> recorderVisitPage() {
        return new ArrayList<>();
    }

    @Override
    public CommonResult<Article> testSeataInsertArtile() {
        return CommonResult.failed("熔断中");
    }

    @Override
    public CommonResult<Article> testSentinel() {
        return CommonResult.failed("熔断中");
    }
}
