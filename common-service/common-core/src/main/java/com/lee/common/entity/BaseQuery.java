package com.lee.common.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author: liyansong
 * @Date: 2022/12/25 16:42
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BaseQuery {

    private Integer currentPage;

    private Integer pageSize;
}
