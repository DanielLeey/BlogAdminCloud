package com.lee.common.vo;

import com.lee.common.bo.RoleBO;
import lombok.*;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2023/1/7 10:48
 * @Version: 1.0
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class RoleListVO extends BaseVO {

    private List<RoleBO> records;
}
