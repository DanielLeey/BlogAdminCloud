package com.lee.article.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.lee.article.service.CommentService;
import com.lee.common.entity.Article;
import com.lee.common.entity.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
}
