package com.lee.common.vo;

import com.lee.common.entity.SysDictData;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2023/1/7 11:30
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class DictDataVO {

    private String defaultValue;

    private List<SysDictData> list;
}
