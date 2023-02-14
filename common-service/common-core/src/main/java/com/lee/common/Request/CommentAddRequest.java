package com.lee.common.Request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author: liyansong
 * @Date: 2023/2/9 20:06
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CommentAddRequest {

    private String blogUid;

    private String content;

    private String source;

    private String userUid;

    private String toUserUid;

    private String toUid;
}
