package com.lee.common.Query;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author: liyansong
 * @Date: 2022/12/21 16:34
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BlogQuery {

    private String keyword;

    private String blogSortUid;

    private String tagUid;

    private String levelKeyword;

    private Boolean isPublish;

    private Boolean isOriginal;

    private String type;

    private Integer currentPage;

    private Integer pageSize;

    private String orderByDescColumn;

    private String orderByAscColumn;
}
