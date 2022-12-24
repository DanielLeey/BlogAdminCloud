package com.lee.article.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lee.common.bo.BlogCountByTagBO;
import com.lee.common.entity.Tag;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/21 11:09
 * @Version: 1.0
 */
public interface TagService extends IService<Tag> {

    List<BlogCountByTagBO> getBlogCountByTag();
}
