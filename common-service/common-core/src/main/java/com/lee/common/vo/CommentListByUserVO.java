package com.lee.common.vo;

import com.lee.common.bo.CommentBO;
import lombok.*;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2023/2/11 16:14
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CommentListByUserVO{

    private List<CommentBO> commentList;

    private List<CommentBO> replyList;

}
