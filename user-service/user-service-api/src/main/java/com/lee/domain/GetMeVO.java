package com.lee.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2024/2/4 17:05
 * @Version: 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GetMeVO {
    private String personResume;

    private List<String> photoList;

    private String nickName;

    private String occupation;

    private String summary;

}
