package com.lee.article.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lee.common.Request.BaseRequest;
import com.lee.common.Request.CommentAddRequest;
import com.lee.common.Request.CommentDeleteRequest;
import com.lee.common.Request.CommentRequest;
import com.lee.common.bo.CommentBO;
import com.lee.common.bo.CommentListBO;
import com.lee.common.bo.PraiseBO;
import com.lee.common.entity.Comment;
import com.lee.common.vo.CommentListByUserVO;

import java.util.List;

public interface CommentService extends IService<Comment> {

    List<CommentBO> getList(CommentRequest commentRequest);

    Integer getSize(CommentRequest commentRequest);

    Boolean addComment(CommentAddRequest commentAddRequest);

    List<CommentListBO> getReplyList(CommentRequest commentRequest);

    Boolean deleteComment(CommentDeleteRequest commentDeleteRequest);

    Integer getUserReceiveCommentCount(String userId);

    CommentListByUserVO getListByUser(BaseRequest baseRequest);

    List<PraiseBO> getPraiseListByUser(BaseRequest baseRequest);
}
