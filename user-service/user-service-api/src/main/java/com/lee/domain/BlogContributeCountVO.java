package com.lee.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BlogContributeCountVO {
    // 日历的起止日
    private List<String> contributeDate;
    // 数组，arr[0]日期，arr[1]写文章的数量
    private List<List<Object>> blogContributeCount;
}
