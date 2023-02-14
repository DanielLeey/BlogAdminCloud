package com.lee.common.vo;

import com.lee.common.bo.CommentListBO;
import lombok.*;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2023/2/10 10:56
 * @Version: 1.0
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CommentListVO extends BaseVO {

    private List<CommentListBO> records;
}
