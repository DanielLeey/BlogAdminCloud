package com.lee.controller;

import com.lee.common.api.CommonResult;
import com.lee.common.vo.VerifyVO;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: liyansong
 * @Date: 2023/2/8 20:55
 * @Version: 1.0
 */
@RestController
@RequestMapping("/oauth")
public class OauthController {

    /**
     * 返回用户信息，通过vuex的mutations存入setters
     * TODO:返回用户信息
     * @param token
     * @return
     */
    @GetMapping(value = "/verify/{token}")
    public CommonResult verify(@PathVariable("token") String token) {
        VerifyVO verifyVO = new VerifyVO();
        return CommonResult.success(verifyVO);
    }
}
