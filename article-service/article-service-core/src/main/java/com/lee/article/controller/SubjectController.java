package com.lee.article.controller;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.lee.article.service.BlogService;
import com.lee.article.service.SubjectItemService;
import com.lee.article.service.SubjectService;
import com.lee.common.Request.BaseRequest;
import com.lee.common.Request.SubjectItemRequest;
import com.lee.common.Request.SubjectRequest;
import com.lee.common.api.CommonResult;
import com.lee.common.bo.BlogListRecordBO;
import com.lee.common.bo.SubjectBO;
import com.lee.common.bo.SubjectItemBO;
import com.lee.common.entity.SubjectItem;
import com.lee.common.vo.SubjectItemListVO;
import com.lee.common.vo.SubjectListVO;
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
 * @Date: 2022/12/29 17:08
 * @Version: 1.0
 * 专题管理
 */
@RestController
@RequestMapping("/subject")
public class SubjectController {

    @Autowired
    private SubjectService subjectService;

    @Autowired
    private SubjectItemService subjectItemService;

    @Autowired
    private BlogService blogService;

    @PostMapping("/getList")
    public CommonResult getSubjectList(@RequestBody BaseRequest baseRequest) {
        List<SubjectBO> subjectList = subjectService.getList(baseRequest);
        SubjectListVO subjectListVO = new SubjectListVO();
        subjectListVO.setCurrent(baseRequest.getCurrentPage());
        subjectListVO.setSize(baseRequest.getPageSize());
        subjectListVO.setTotal(subjectService.count());
        subjectListVO.setRecords(subjectList);
        subjectListVO.setIsSearchCount(true);
        subjectListVO.setOptimizeCountsql(true);
        return CommonResult.success(subjectListVO);
    }

    @PostMapping("/edit")
    public CommonResult editSubject(@RequestBody SubjectRequest subjectRequest) {
        final Boolean flag = subjectService.editSubject(subjectRequest);
        if (flag) {
            return CommonResult.success("编辑成功");
        } else {
            return CommonResult.failed();
        }
    }

    @PostMapping("/add")
    public CommonResult addBlog(@RequestBody SubjectRequest subjectRequest) {
        final Boolean flag = subjectService.addSubject(subjectRequest);
        if (flag) {
            return CommonResult.success("新增成功");
        } else {
            return CommonResult.failed();
        }
    }

    @PostMapping("/deleteBatch")
    public CommonResult deleteBlogBatch(@RequestBody List<SubjectRequest> list) {
        final List<String> uids = list.stream().map(subject -> subject.getUid()).collect(Collectors.toList());
        Boolean flag = subjectService.deleteBatch(uids);
        if (flag) {
            return CommonResult.success("批量删除成功");
        } else {
            return CommonResult.failed();
        }
    }

    @PostMapping("/getItemList")
    public CommonResult getItemList(@RequestBody SubjectItemRequest subjectItemRequest) {
        final String subjectUid = subjectItemRequest.getSubjectUid();
        LambdaQueryWrapper<SubjectItem> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(SubjectItem::getSubjectUid, subjectUid);
        wrapper.eq(SubjectItem::getStatus, 1);
        wrapper.orderByAsc(SubjectItem::getSort);
        final List<SubjectItem> subjectItems = subjectItemService.list(wrapper);
        if (CollUtil.isEmpty(subjectItems)) {
            final SubjectItemListVO subjectItemListVO = new SubjectItemListVO();
            subjectItemListVO.setCurrent(subjectItemRequest.getCurrentPage());
            subjectItemListVO.setSize(subjectItemRequest.getPageSize());
            subjectItemListVO.setTotal(subjectItemService.count());
            subjectItemListVO.setRecords(new ArrayList<>());
            subjectItemListVO.setIsSearchCount(true);
            subjectItemListVO.setOptimizeCountsql(true);
            return CommonResult.success(subjectItemListVO);
        }
        List<String> blogUids = subjectItems.stream().map(SubjectItem::getBlogUid).collect(Collectors.toList());
        final List<BlogListRecordBO> blogList = blogService.getBlogListByUids(blogUids, subjectItemRequest.getCurrentPage(), subjectItemRequest.getPageSize());
        List<SubjectItemBO> subjectItemBOS = new ArrayList<>();
        for (SubjectItem subjectItem : subjectItems) {
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
