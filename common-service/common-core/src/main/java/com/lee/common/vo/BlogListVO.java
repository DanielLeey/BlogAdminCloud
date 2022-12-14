package com.lee.common.vo;

import com.lee.common.bo.BlogListRecordBO;
import lombok.*;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/24 17:41
 * @Version: 1.0
 * blog展示
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BlogListVO extends BaseVO {

    private List<BlogListRecordBO> records;

}
