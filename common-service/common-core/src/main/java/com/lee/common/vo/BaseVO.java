package com.lee.common.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/25 16:45
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BaseVO {

    private Integer current;

    private Boolean isSearchCount;

    private Boolean optimizeCountsql;

    private List<Object> orders;

    private Integer size;

    private Integer total;
}
