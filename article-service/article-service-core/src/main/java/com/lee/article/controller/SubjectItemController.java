package com.lee.article.controller;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.lee.article.service.BlogService;
import com.lee.article.service.SubjectItemService;
import com.lee.article.service.SubjectService;
import com.lee.common.Request.BaseRequest;
import com.lee.common.Request.BlogRequest;
import com.lee.common.Request.SubjectItemRequest;
import com.lee.common.api.CommonResult;
import com.lee.common.bo.BlogListRecordBO;
import com.lee.common.bo.SubjectItemBO;
import com.lee.common.entity.Blog;
import com.lee.common.entity.SubjectItem;
import com.lee.common.vo.BlogListVO;
import com.lee.common.vo.SubjectItemListVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * @Author: liyansong
 * @Date: 2022/12/30 15:49
 * @Version: 1.0
 */
@RestController
@RequestMapping("/subjectItem")
public class SubjectItemController {

    @Autowired
    private SubjectItemService subjectItemService;

    @Autowired
    private BlogService blogService;

    @PostMapping("/getList")
    public CommonResult getSubjectList(@RequestBody SubjectItemRequest subjectItemRequest) {
        final String subjectUid = subjectItemRequest.getSubjectUid();
        LambdaQueryWrapper<SubjectItem> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(SubjectItem::getSubjectUid, subjectUid);
        final List<SubjectItem> subjectItems = subjectItemService.list(wrapper);
        if (CollUtil.isEmpty(subjectItems)) {
            return CommonResult.success("无相关主题博客");
        }
        List<String> blogUids = subjectItems.stream().map(SubjectItem::getBlogUid).collect(Collectors.toList());
        final List<BlogListRecordBO> blogList = blogService.getBlogListByUids(blogUids, subjectItemRequest.getCurrentPage(), subjectItemRequest.getPageSize());
        List<SubjectItemBO> subjectItemBOS = new ArrayList<>();
        for(SubjectItem subjectItem : subjectItems) {
            SubjectItemBO subjectItemBO = new SubjectItemBO();
            BeanUtils.copyProperties(subjectItem, subjectItemBO);
            final Optional<BlogListRecordBO> first = blogList.stream().filter(blogListRecordBO -> subjectItem.getBlogUid().equals(blogListRecordBO.getUid())).findFirst();
            subjectItemBO.setBlog(first.orElse(null));
            subjectItemBOS.add(subjectItemBO);
        }
        final SubjectItemListVO subjectItemListVO = new SubjectItemListVO();
        subjectItemListVO.setCurrent(subjectItemRequest.getCurrentPage());
        subjectItemListVO.setSize(subjectItemRequest.getPageSize());
        subjectItemListVO.setTotal(subjectItemService.count());
        subjectItemListVO.setRecords(subjectItemBOS);
        subjectItemListVO.setIsSearchCount(true);
        subjectItemListVO.setOptimizeCountsql(true);
        return CommonResult.success(subjectItemListVO);
    }
}
