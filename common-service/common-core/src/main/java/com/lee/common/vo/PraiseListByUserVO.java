package com.lee.common.vo;

import com.lee.common.bo.PraiseBO;
import lombok.*;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2023/2/11 17:07
 * @Version: 1.0
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PraiseListByUserVO extends BaseVO {

    private List<PraiseBO> records;
}
