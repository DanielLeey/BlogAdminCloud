package com.lee.article.controller;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.lee.article.service.CommentService;
import com.lee.common.Request.BaseRequest;
import com.lee.common.Request.CommentAddRequest;
import com.lee.common.Request.CommentDeleteRequest;
import com.lee.common.Request.CommentRequest;
import com.lee.common.ThreadHolder.UserThreadHolder;
import com.lee.common.api.CommonResult;
import com.lee.common.bo.CommentBO;
import com.lee.common.bo.CommentListBO;
import com.lee.common.bo.PraiseBO;
import com.lee.common.entity.Comment;
import com.lee.common.entity.User;
import com.lee.common.vo.CommentListByUserVO;
import com.lee.common.vo.CommentListVO;
import com.lee.common.vo.CommentVO;
import com.lee.common.vo.PraiseListByUserVO;
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
        wrapper.ne(Comment::getStatus, 0);
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

    @PostMapping("/getReplyList")
    private CommonResult getReplyList(@RequestBody CommentRequest commentRequest) {
        List<CommentListBO> commentBOList = commentService.getReplyList(commentRequest);
        final CommentListVO commentListVO = new CommentListVO(commentBOList);
        commentListVO.setCurrent(commentRequest.getCurrentPage());
        commentListVO.setSize(commentRequest.getPageSize());
        commentListVO.setTotal(commentService.getSize(commentRequest));
        commentListVO.setIsSearchCount(true);
        commentListVO.setOptimizeCountsql(true);
        return CommonResult.success(commentListVO);
    }

    @PostMapping("/add")
    public CommonResult addComment(@RequestBody CommentAddRequest commentAddRequest) {
        Boolean flag = commentService.addComment(commentAddRequest);
        if (flag) {
            return CommonResult.success("添加成功");
        } else {
            return CommonResult.failed();
        }
    }

    @PostMapping("/delete")
    public CommonResult deleteComment(@RequestBody CommentDeleteRequest commentDeleteRequest) {
        Boolean flag = commentService.deleteComment(commentDeleteRequest);
        if (flag) {
            return CommonResult.success("删除成功");
        } else {
            return CommonResult.failed();
        }
    }

    /**
     * 获取用户的未读消息
     *
     * @return
     */
    @GetMapping("/getUserReceiveCommentCount")
    public CommonResult getUserReceiveCommentCount() {
        User user = UserThreadHolder.get();
        if (user == null) {
            return CommonResult.success(0);
        }
        final String userId = user.getUid();
        Integer count = commentService.getUserReceiveCommentCount(userId);
        return CommonResult.success(count);
    }

    /**
     * 获取用户的自己评论 和 回复
     *
     * @return
     */
    @PostMapping("/getListByUser")
    public CommonResult getListByUser(@RequestBody BaseRequest baseRequest) {
        CommentListByUserVO commentListByUserVO = commentService.getListByUser(baseRequest);
        return CommonResult.success(commentListByUserVO);
    }

    @PostMapping("/getPraiseListByUser")
    public CommonResult getPraiseListByUser(@RequestBody BaseRequest baseRequest) {
        List<PraiseBO> praiseBOList = commentService.getPraiseListByUser(baseRequest);
        final PraiseListByUserVO praiseListByUserVO = new PraiseListByUserVO(praiseBOList);
        praiseListByUserVO.setCurrent(baseRequest.getCurrentPage());
        praiseListByUserVO.setSize(baseRequest.getPageSize());
        praiseListByUserVO.setTotal(baseRequest.getPageSize());
        praiseListByUserVO.setIsSearchCount(true);
        praiseListByUserVO.setOptimizeCountsql(true);
        return CommonResult.success(praiseListByUserVO);
    }

}
