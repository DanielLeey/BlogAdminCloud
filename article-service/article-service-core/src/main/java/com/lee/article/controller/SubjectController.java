package com.lee.article.controller;

import com.lee.article.service.SubjectService;
import com.lee.common.Request.BaseRequest;
import com.lee.common.Request.SubjectRequest;
import com.lee.common.api.CommonResult;
import com.lee.common.bo.SubjectBO;
import com.lee.common.vo.SubjectListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
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
}
