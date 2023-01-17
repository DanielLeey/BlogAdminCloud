package com.lee.domain;

import com.lee.common.entity.Resource;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/12 15:08
 * @Version: 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MenuVO {

    private List<Resource> parentList;

    private List<Resource> sonList;
    //用户拥有的按钮
    private List<Resource> buttonList;
}
