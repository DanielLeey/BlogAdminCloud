package com.lee.common.Request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author: liyansong
 * @Date: 2023/2/10 15:39
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CommentDeleteRequest {

    private String uid;

    private String userUid;
}
