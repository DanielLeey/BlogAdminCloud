package com.lee.common.vo;

import com.lee.common.entity.DictType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/25 10:37
 * @Version: 1.0
 * blog搜索
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DictTypeListVO implements Serializable {

    private static final long serialVersionUID = 2571299149892237458L;

    private String defaultValue;

    private List<DictType> list;
}