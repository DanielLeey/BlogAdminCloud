package com.lee.common.bo;

import com.lee.common.entity.Blog;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @Author: liyansong
 * @Date: 2023/2/11 17:04
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PraiseBO {
    private String uid;
    /**
     * 用户uid
     */
    private String userUid;
    /**
         * 创建时间
     */
    private Date createTime;
    /**
     * 更新时间
     */
    private Date updateTime;
    /**
     * 评论来源： MESSAGE_BOARD，ABOUT，BLOG_INFO 等
     */
    private String source;
    /**
     * 评论类型 1:点赞 0:评论
     */
    private Integer type;
    /**
     * 状态
     */
    private Integer status;
    /**
     * 博客uid
     */
    private String blogUid;

    private Blog blog;
}
