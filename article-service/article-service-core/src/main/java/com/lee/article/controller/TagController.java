package com.lee.article.controller;

import com.lee.article.service.TagService;
import com.lee.common.Request.BlogSortRequest;
import com.lee.common.Request.TagRequest;
import com.lee.common.api.CommonResult;
import com.lee.common.bo.TagListRecordBO;
import com.lee.common.Request.BaseRequest;
import com.lee.common.vo.TagListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
}
