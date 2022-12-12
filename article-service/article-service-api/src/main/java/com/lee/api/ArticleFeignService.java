package com.lee.api;

import com.lee.common.api.CommonResult;
import com.lee.common.entity.ArticleDTO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@FeignClient(value = "article-service", path = "/api/article")
public interface ArticleFeignService {

    @RequestMapping(value = "/getArticle/{id}", method = RequestMethod.GET)
    CommonResult<ArticleDTO> getArticleById(@PathVariable(value = "id") String id);
}
