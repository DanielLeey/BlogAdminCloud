package com.lee.article.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.article.dao.TagMapper;
import com.lee.article.service.TagService;
import com.lee.common.Request.TagRequest;
import com.lee.common.bo.BlogCountByTagBO;
import com.lee.common.bo.TagListRecordBO;
import com.lee.common.entity.Tag;
import com.lee.common.utils.UUidUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

/**
 * @Author: liyansong
 * @Date: 2022/12/21 11:12
 * @Version: 1.0
 */
@Service("tagService")
public class TagServiceImpl extends ServiceImpl<TagMapper, Tag> implements TagService {

    @Autowired
    private TagMapper tagMapper;

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
    public List<TagListRecordBO> getTagList(TagRequest tagRequest) throws NoSuchFieldException, ClassNotFoundException {
        QueryWrapper<Tag> wrapper = new QueryWrapper<>();
        if (StrUtil.isNotBlank(tagRequest.getOrderByAscColumn())) {
            final String orderByAscColumn = tagRequest.getOrderByAscColumn();
            tagOrderBy(wrapper, orderByAscColumn, true);
        }
        if (StrUtil.isNotBlank(tagRequest.getOrderByDescColumn())) {
            final String orderByDescColumn = tagRequest.getOrderByDescColumn();
            tagOrderBy(wrapper, orderByDescColumn, false);
        }
        Page<Tag> page = new Page<>(tagRequest.getCurrentPage(), tagRequest.getPageSize());
        List<Tag> blogList = page(page, wrapper).getRecords();
        List<TagListRecordBO> list = new ArrayList<>(blogList.size());
        blogList.forEach(tag -> {
            TagListRecordBO tagListRecordBO = new TagListRecordBO();
            BeanUtils.copyProperties(tag, tagListRecordBO);
            list.add(tagListRecordBO);
        });
        return list;
    }

    private void tagOrderBy(QueryWrapper<Tag> wrapper, String column, boolean isAsc) throws ClassNotFoundException, NoSuchFieldException {
        final Class<?> clazz = Class.forName("com.lee.common.entity.Tag");
        final Optional<TableField> tableFieldAnnotation = Arrays.stream(clazz.getDeclaredField(column).getAnnotationsByType(TableField.class)).findFirst();
        final TableField tableField = tableFieldAnnotation.get();
        wrapper.orderBy(true, isAsc, tableField.value());
    }

    @Override
    public Boolean addTagList(TagRequest tagRequest) {
        Tag tag = new Tag();
        BeanUtils.copyProperties(tagRequest, tag);
        tag.setUid(UUidUtils.getUUId());
        final Date date = new Date();
        tag.setCreateTime(date);
        tag.setUpdateTime(date);
        tag.setStatus(1);
        tag.setClickCount(0);
        final int count = tagMapper.insert(tag);
        return count > 0;
    }

    @Override
    public Boolean stick(String uid) {
        int count = tagMapper.stick(uid);
        return count > 0;
    }

    @Override
    public Boolean editTag(TagRequest tagRequest) {
        Tag tag = new Tag();
        BeanUtils.copyProperties(tagRequest, tag);
        final int count = tagMapper.updateById(tag);
        return count > 0;
    }

    @Override
    public Boolean deleteBatch(List<String> uids) {
        final int count = tagMapper.deleteBatch(uids);
        return count > 0;
    }

    @Override
    public Boolean tagSortByClickCount() {
        int count = tagMapper.updateSortByClickCount();
        return count > 0;
    }

    @Override
    public List<TagListRecordBO> getHotTag() {
        LambdaQueryWrapper<Tag> wrapper = new LambdaQueryWrapper<>();
        wrapper.orderByDesc(Tag::getClickCount);
        Page<Tag> page = new Page<>(1, 10);
        List<Tag> blogList = page(page, wrapper).getRecords();
        List<TagListRecordBO> list = new ArrayList<>(blogList.size());
        blogList.forEach(tag -> {
            TagListRecordBO tagListRecordBO = new TagListRecordBO();
            BeanUtils.copyProperties(tag, tagListRecordBO);
            list.add(tagListRecordBO);
        });
        return list;
    }
}
