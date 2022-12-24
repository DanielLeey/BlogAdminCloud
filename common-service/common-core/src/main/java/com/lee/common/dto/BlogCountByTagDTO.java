package com.lee.common.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Map;

/**
 * @Author: liyansong
 * @Date: 2022/12/21 11:01
 * @Version: 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BlogCountByTagDTO {

    private List<Map<String, Object>> list;
}
