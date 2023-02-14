package com.lee.article.controller;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.lee.article.service.BlogService;
import com.lee.article.service.TagService;
import com.lee.common.Request.BlogRequest;
import com.lee.common.Request.BlogSortRequest;
import com.lee.common.Request.TagRequest;
import com.lee.common.api.CommonResult;
import com.lee.common.bo.BlogListRecordBO;
import com.lee.common.bo.TagListRecordBO;
import com.lee.common.Request.BaseRequest;
import com.lee.common.entity.Tag;
import com.lee.common.vo.BlogListVO;
import com.lee.common.vo.TagListVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.websocket.server.PathParam;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @Author: liyansong
 * @Date: 2022/12/25 17:11
 * @Version: 1.0
 */
@RestController
@RequestMapping("/tag")
public class TagController {

    @Autowired
    private TagService tagService;

    @Autowired
    private BlogService blogService;

    @PostMapping("/getList")
    public CommonResult getTagList(@RequestBody TagRequest tagRequest) throws NoSuchFieldException, ClassNotFoundException {
        List<TagListRecordBO> blogList = tagService.getTagList(tagRequest);
        TagListVO tagListVO = new TagListVO();
        tagListVO.setCurrent(tagRequest.getCurrentPage());
        tagListVO.setSize(tagRequest.getPageSize());
        tagListVO.setTotal(tagService.count());
        tagListVO.setRecords(blogList);
        tagListVO.setIsSearchCount(true);
        tagListVO.setOptimizeCountsql(true);
        return CommonResult.success(tagListVO);
    }

    @PostMapping("/add")
    public CommonResult addTagList(@RequestBody TagRequest tagRequest) {
        Boolean flag = tagService.addTagList(tagRequest);
        if (flag) {
            return CommonResult.success("添加成功");
        } else {
            return CommonResult.failed();
        }
    }
    /**
     * 置顶
     *
     * @param
     * @return
     */
    @PostMapping("/stick")
    public CommonResult stick(@RequestBody Map<String, String> map) {
        Boolean flag = tagService.stick(map.get("uid"));
        if (flag) {
            return CommonResult.success("置顶成功");
        } else {
            return CommonResult.failed();
        }
    }

    @PostMapping("/edit")
    public CommonResult editTag(@RequestBody TagRequest tagRequest) {
        Boolean flag = tagService.editTag(tagRequest);
        if (flag) {
            return CommonResult.success("编辑成功");
        } else {
            return CommonResult.failed();
        }
    }

    @PostMapping("/deleteBatch")
    public CommonResult deleteBatchTag(@RequestBody List<TagRequest> list) {
        final List<String> uids = list.stream().map(tag -> tag.getUid()).collect(Collectors.toList());
        Boolean flag = tagService.deleteBatch(uids);
        if (flag) {
            return CommonResult.success("批量删除成功");
        }else {
            return CommonResult.failed();
        }
    }


    @PostMapping("/tagSortByClickCount")
    public CommonResult tagSortByClickCount() {
        Boolean flag = tagService.tagSortByClickCount();
        if (flag) {
            return CommonResult.success("操作成功");
        }else {
            return CommonResult.failed();
        }
    }

    @GetMapping("/getHotTag")
    public CommonResult getHotTag() {
        List<TagListRecordBO> blogList = tagService.getHotTag();
        return CommonResult.success(blogList);
    }

    @GetMapping("/getTags")
    public CommonResult getTags() {
        LambdaQueryWrapper<Tag> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Tag::getStatus, 1).orderByDesc(Tag::getSort);
        final List<Tag> tags = tagService.list(wrapper);
        List<TagListRecordBO> list = new ArrayList<>(tags.size());
        if (CollUtil.isNotEmpty(tags)) {
            tags.forEach(tag -> {
                TagListRecordBO tagListRecordBO = new TagListRecordBO();
                BeanUtils.copyProperties(tag, tagListRecordBO);
                list.add(tagListRecordBO);
            });
        }
        return CommonResult.success(list);
    }

    @GetMapping("/getArticleByTagUid")
    public CommonResult getArticleByTagUid(@PathParam("tagUid") String tagUid, @PathParam("currentPage") Integer currentPage) throws NoSuchFieldException, ClassNotFoundException {
        final BlogRequest blogRequest = BlogRequest.builder().tagUid(tagUid).build();
        blogRequest.setCurrentPage(currentPage == null? 1 : currentPage);
        blogRequest.setPageSize(10);
        List<BlogListRecordBO> blogList = blogService.getBlogList(blogRequest);
        final BlogListVO blogListVO = new BlogListVO(blogList);
        blogListVO.setCurrent(blogRequest.getCurrentPage());
        blogListVO.setSize(blogRequest.getPageSize());
        blogListVO.setTotal(blogService.count());
        blogListVO.setIsSearchCount(true);
        blogListVO.setOptimizeCountsql(true);
        return CommonResult.success(blogListVO);
    }
}
