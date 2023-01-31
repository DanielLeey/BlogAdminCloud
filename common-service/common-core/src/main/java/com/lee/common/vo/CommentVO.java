package com.lee.common.vo;

import com.lee.common.bo.CommentBO;
import lombok.*;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2023/1/21 11:30
 * @Version: 1.0
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CommentVO extends BaseVO {

    private List<CommentBO> records;
}
