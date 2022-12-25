package com.lee.article.controller;

import com.lee.article.service.TagService;
import com.lee.common.api.CommonResult;
import com.lee.common.bo.BlogSortListRecordBO;
import com.lee.common.bo.TagListRecordBO;
import com.lee.common.entity.BaseQuery;
import com.lee.common.vo.BlogSortListVO;
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
    public CommonResult getTagList(@RequestBody BaseQuery baseQuery) {
        List<TagListRecordBO> blogList = tagService.getTagList(baseQuery);
        TagListVO tagListVO = new TagListVO();
        tagListVO.setCurrent(baseQuery.getCurrentPage());
        tagListVO.setSize(baseQuery.getPageSize());
        tagListVO.setTotal(blogList.size());
        tagListVO.setRecords(blogList);
        tagListVO.setIsSearchCount(true);
        tagListVO.setOptimizeCountsql(true);
        return CommonResult.success(tagListVO);
    }
}
