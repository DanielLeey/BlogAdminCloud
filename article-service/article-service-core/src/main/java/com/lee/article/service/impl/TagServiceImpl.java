package com.lee.article.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.article.dao.TagMapper;
import com.lee.article.service.TagService;
import com.lee.common.bo.BlogCountByTagBO;
import com.lee.common.bo.BlogSortListRecordBO;
import com.lee.common.bo.TagListRecordBO;
import com.lee.common.entity.BaseQuery;
import com.lee.common.entity.BlogSort;
import com.lee.common.entity.Tag;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @Author: liyansong
 * @Date: 2022/12/21 11:12
 * @Version: 1.0
 */
@Service("tagService")
public class TagServiceImpl extends ServiceImpl<TagMapper, Tag> implements TagService {

    @Override
    public List<BlogCountByTagBO> getBlogCountByTag() {
        LambdaQueryWrapper<Tag> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Tag::getStatus, 1);
        List<Tag> tags = list(wrapper);
        final List<BlogCountByTagBO> list = tags.stream().map(tag -> BlogCountByTagBO.builder()
                .tagUid(tag.getUid()).name(tag.getContent()).value(tag.getClickCount()).build()).collect(Collectors.toList());
        return list;
    }

    @Override
    public List<TagListRecordBO> getTagList(BaseQuery baseQuery) {
        Page<Tag> page = new Page<>(baseQuery.getCurrentPage(), baseQuery.getPageSize());
        List<Tag> blogList = page(page).getRecords();
        List<TagListRecordBO> list = new ArrayList<>(blogList.size());
        blogList.forEach(tag -> {
            TagListRecordBO tagListRecordBO = new TagListRecordBO();
            BeanUtils.copyProperties(tag, tagListRecordBO);
            list.add(tagListRecordBO);
        });
        return list;
    }
}
