package com.lee.common.utils;

import cn.hutool.core.util.IdUtil;

/**
 * @Author: liyansong
 * @Date: 2022/12/27 14:41
 * @Version: 1.0
 */
public class UUidUtils {

    public static String getUUId() {
        return IdUtil.simpleUUID();
    }
}
