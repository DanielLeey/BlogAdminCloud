package com.lee.common.vo;

import com.lee.common.entity.SysDictType;
import com.lee.common.entity.SysParams;
import lombok.*;

import java.io.Serializable;
import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2023/1/14 16:24
 * @Version: 1.0
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SysParamsVO extends BaseVO implements Serializable {

    private static final long serialVersionUID = 287263608726503306L;

    private List<SysParams> records;
}
