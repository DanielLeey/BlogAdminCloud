package com.lee.common.vo;

import com.lee.common.bo.BlogSortListRecordBO;
import lombok.*;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/25 16:49
 * @Version: 1.0
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BlogSortListVO extends BaseVO {

    private List<BlogSortListRecordBO> records;
}
