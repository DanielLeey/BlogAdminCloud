package com.lee.article.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.article.dao.BlogSortMapper;
import com.lee.article.service.BlogSortService;
import com.lee.common.entity.BlogSort;
import org.springframework.stereotype.Service;

/**
 * @Author: liyansong
 * @Date: 2022/12/24 17:05
 * @Version: 1.0
 */
@Service("blogSortService")
public class BlogSortServiceImpl extends ServiceImpl<BlogSortMapper, BlogSort> implements BlogSortService {

}

