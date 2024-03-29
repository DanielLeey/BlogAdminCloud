package com.lee.common.vo;

import com.lee.common.entity.SysDictType;
import lombok.*;

import java.io.Serializable;
import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/25 10:37
 * @Version: 1.0
 * blog搜索
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DictTypeListVO extends BaseVO implements Serializable {

    private static final long serialVersionUID = 2571299149892237458L;

    private List<SysDictType> records;
}