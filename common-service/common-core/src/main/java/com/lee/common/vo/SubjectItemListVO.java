package com.lee.common.vo;

import com.lee.common.bo.SubjectItemBO;
import lombok.*;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/30 16:48
 * @Version: 1.0
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SubjectItemListVO extends BaseVO {

    private List<SubjectItemBO> records;
}
