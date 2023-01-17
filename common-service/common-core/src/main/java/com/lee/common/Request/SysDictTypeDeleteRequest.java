package com.lee.common.Request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @Author: liyansong
 * @Date: 2023/1/12 19:51
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SysDictTypeDeleteRequest implements Serializable {

    private static final long serialVersionUID = 3613409056166171035L;

    private String uid;
}
