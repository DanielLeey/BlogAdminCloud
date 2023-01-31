package com.lee.article.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.lee.article.service.CommentService;
import com.lee.common.Request.CommentRequest;
import com.lee.common.api.CommonResult;
import com.lee.common.bo.CommentBO;
import com.lee.common.entity.Comment;
import com.lee.common.vo.CommentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/13 10:07
 * @Version: 1.0
 */
@RestController
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    private CommentService commentService;


    @GetMapping("/count")
    public int getCommentCount() {
        LambdaQueryWrapper<Comment> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Comment::getStatus, 1);
        return commentService.count(wrapper);
    }

    @PostMapping("/getList")
    public CommonResult getList(@RequestBody CommentRequest commentRequest) {
        List<CommentBO> commentBOList = commentService.getList(commentRequest);
        final CommentVO commentVO = new CommentVO(commentBOList);
        commentVO.setCurrent(commentRequest.getCurrentPage());
        commentVO.setSize(commentRequest.getPageSize());
        commentVO.setTotal(commentService.getSize(commentRequest));
        commentVO.setIsSearchCount(true);
        commentVO.setOptimizeCountsql(true);
        return CommonResult.success(commentVO);
    }
}
