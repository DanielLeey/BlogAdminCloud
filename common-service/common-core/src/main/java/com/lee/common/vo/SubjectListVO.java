package com.lee.common.vo;

import com.lee.common.bo.SubjectBO;
import lombok.*;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/30 10:06
 * @Version: 1.0
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SubjectListVO extends BaseVO {

    private List<SubjectBO> records;
}
