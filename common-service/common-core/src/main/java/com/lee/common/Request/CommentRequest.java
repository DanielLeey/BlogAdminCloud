package com.lee.common.Request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @Author: liyansong
 * @Date: 2023/1/21 10:31
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CommentRequest implements Serializable {
    private static final long serialVersionUID = -2535529667137266852L;

    private Integer currentPage;

    private Integer pageSize;

    private String keyword;

    private String source;

    private String blogUid;

    private String type;

    private String userName;
}
