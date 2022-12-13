package com.lee.article.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.article.dao.CommentMapper;
import com.lee.article.service.CommentService;
import com.lee.common.entity.Comment;
import org.springframework.stereotype.Service;

/**
 * @Author: liyansong
 * @Date: 2022/12/13 10:01
 * @Version: 1.0
 */
@Service("commentService")
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements CommentService {

}
