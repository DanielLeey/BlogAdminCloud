package com.lee.common.vo;

import com.lee.common.bo.AdminBO;
import lombok.*;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2023/1/5 17:19
 * @Version: 1.0
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AdminListVO extends BaseVO {

    private List<AdminBO> records;
}
