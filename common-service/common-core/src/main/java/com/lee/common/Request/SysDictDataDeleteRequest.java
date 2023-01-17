package com.lee.common.Request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @Author: liyansong
 * @Date: 2023/1/12 18:13
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SysDictDataDeleteRequest implements Serializable {

    private static final long serialVersionUID = 3322376702272786136L;

    private String uid;
}
