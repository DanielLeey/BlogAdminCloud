package com.lee.article.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lee.common.Request.TagRequest;
import com.lee.common.bo.BlogCountByTagBO;
import com.lee.common.bo.TagListRecordBO;
import com.lee.common.Request.BaseRequest;
import com.lee.common.entity.Tag;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/21 11:09
 * @Version: 1.0
 */
public interface TagService extends IService<Tag> {

    List<BlogCountByTagBO> getBlogCountByTag();

    List<TagListRecordBO> getTagList(TagRequest baseRequest) throws NoSuchFieldException, ClassNotFoundException;

    Boolean addTagList(TagRequest tagRequest);

    Boolean stick(String uid);

    Boolean editTag(TagRequest tagRequest);

    Boolean deleteBatch(List<String> uids);

    Boolean tagSortByClickCount();

    List<TagListRecordBO> getHotTag();
}
