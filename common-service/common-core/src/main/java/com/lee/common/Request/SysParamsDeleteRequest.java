package com.lee.common.Request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @Author: liyansong
 * @Date: 2023/1/14 16:40
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SysParamsDeleteRequest implements Serializable {

    private static final long serialVersionUID = 9042855554982929479L;

    private String uid;
}
