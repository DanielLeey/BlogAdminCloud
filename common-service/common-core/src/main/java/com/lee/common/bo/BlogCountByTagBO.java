package com.lee.common.bo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author: liyansong
 * @Date: 2022/12/21 11:05
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BlogCountByTagBO {

    private String name;

    private Integer value;

    private String tagUid;
}
