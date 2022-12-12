package com.lee.article.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.article.dao.ArticleMapper;
import com.lee.article.service.ArticleService;
import com.lee.common.api.CommonResult;
import com.lee.common.entity.ArticleDTO;
import com.lee.common.entity.Article;
import org.springframework.stereotype.Service;

@Service("articleService")
public class ArticleServiceImpl extends ServiceImpl<ArticleMapper, Article> implements ArticleService {


    @Override
    public CommonResult<ArticleDTO> getArticleById(String id) {
        LambdaQueryWrapper<Article> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Article::getId, id);
        Article article = getOne(wrapper);
        ArticleDTO articleDTO = new ArticleDTO(article.getId(), article.getTitle());
        return CommonResult.success(articleDTO);
    }
}
