package com.lee.article.controller;

import com.lee.common.api.CommonResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: liyansong
 * @Date: 2023/2/3 16:04
 * @Version: 1.0
 */
@RestController
@RequestMapping("/search")
public class SearchController {

    @GetMapping("/getSearchModel")
    public CommonResult getSearchModel() {
        return CommonResult.success(0);
    }
}
