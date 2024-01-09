package com.lee.article.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.article.dao.ArticleMapper;
import com.lee.article.service.ArticleService;
import com.lee.common.api.CommonResult;
import com.lee.common.bo.BlogCountByBlogSortBO;
import com.lee.common.dto.ArticleDTO;
import com.lee.common.entity.Article;
import io.seata.spring.annotation.GlobalTransactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("articleService")
public class ArticleServiceImpl extends ServiceImpl<ArticleMapper, Article> implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public CommonResult<ArticleDTO> getArticleById(String id) {
        LambdaQueryWrapper<Article> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Article::getId, id);
        Article article = getOne(wrapper);
        ArticleDTO articleDTO = new ArticleDTO(article.getId(), article.getTitle());
        return CommonResult.success(articleDTO);
    }

    @Override
    public List<Article> getArticleByUserId(String uid, String startDate, String endDate) {
        LambdaQueryWrapper<Article> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Article::getCreateBy, uid);
        wrapper.between(Article::getCreateTime, startDate, endDate);
        return articleMapper.selectList(wrapper);
    }

    @Override
    public List<BlogCountByBlogSortBO> getBlogCountByBlogSort() {
        return articleMapper.getBlogCountByBlogSort();
    }

    @Override
    @GlobalTransactional(rollbackFor = Exception.class)
    public boolean addArticle(Article article) throws Exception {
        int count = articleMapper.insert(article);
        return count > 0;
    }


}
