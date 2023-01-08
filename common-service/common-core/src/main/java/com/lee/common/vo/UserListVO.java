package com.lee.common.vo;

import com.lee.common.bo.UserBO;
import lombok.*;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2023/1/8 17:03
 * @Version: 1.0
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserListVO extends BaseVO {

    private List<UserBO> records;
}
