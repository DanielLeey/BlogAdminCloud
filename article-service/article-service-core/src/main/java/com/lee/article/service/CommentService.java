package com.lee.article.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lee.common.Request.CommentRequest;
import com.lee.common.bo.CommentBO;
import com.lee.common.entity.Comment;

import java.util.List;

public interface CommentService extends IService<Comment> {

    List<CommentBO> getList(CommentRequest commentRequest);

    Integer getSize(CommentRequest commentRequest);
}
