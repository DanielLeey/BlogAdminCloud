package com.lee.common.bo;

import com.lee.common.entity.DictType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/25 11:13
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DictSysTypeBO implements Serializable {

    private static final long serialVersionUID = 4756762958314500353L;

    private String defaultValue;

    private List<DictType> list;
}
