package com.lee.common.Request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @Author: liyansong
 * @Date: 2022/12/25 16:42
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BaseRequest implements Serializable {

    private static final long serialVersionUID = 1893953681770510431L;

    private String keyword;

    private Integer currentPage;

    private Integer pageSize;

    private String orderByDescColumn;

    private String orderByAscColumn;
}
