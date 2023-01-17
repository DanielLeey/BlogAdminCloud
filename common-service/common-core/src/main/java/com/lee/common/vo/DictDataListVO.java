package com.lee.common.vo;

import com.lee.common.bo.SysDictDataBO;
import lombok.*;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2023/1/11 20:53
 * @Version: 1.0
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DictDataListVO extends BaseVO {

    private List<SysDictDataBO> records;
}
