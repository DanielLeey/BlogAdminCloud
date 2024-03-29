package com.lee.common.Request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author: liyansong
 * @Date: 2023/1/11 20:44
 * @Version: 1.0
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DictDataRequest {
    private Integer currentPage;

    private Integer pageSize;

    private String dictLabel;

    private String dictTypeUid;
}
