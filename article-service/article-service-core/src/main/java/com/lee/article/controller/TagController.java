package com.lee.article.controller;

import com.lee.article.service.TagService;
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
    public CommonResult getTagList(@RequestBody BaseRequest baseRequest) {
        List<TagListRecordBO> blogList = tagService.getTagList(baseRequest);
        TagListVO tagListVO = new TagListVO();
        tagListVO.setCurrent(baseRequest.getCurrentPage());
        tagListVO.setSize(baseRequest.getPageSize());
        tagListVO.setTotal(blogList.size());
        tagListVO.setRecords(blogList);
        tagListVO.setIsSearchCount(true);
        tagListVO.setOptimizeCountsql(true);
        return CommonResult.success(tagListVO);
    }
}
