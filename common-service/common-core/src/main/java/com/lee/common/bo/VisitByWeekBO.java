package com.lee.common.bo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/13 14:59
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class VisitByWeekBO {

    List<String> date;

    /**
     * 用户
     */
    List<Integer> uv;

    /**
     * 访问量
     */
    List<Integer> pv;
}
