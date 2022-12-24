package com.lee.common.bo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author: liyansong
 * @Date: 2022/12/20 18:49
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BlogCountByBlogSortBO {
    private String blogSortUid;

    private String name;

    private Integer value;

}
