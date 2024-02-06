package com.lee.controller;

import cn.hutool.core.util.ObjectUtil;
import com.lee.common.Request.BaseRequest;
import com.lee.common.ThreadHolder.UserThreadHolder;
import com.lee.common.api.CommonResult;
import com.lee.common.api.ResultCode;
import com.lee.common.entity.User;
import com.lee.domain.GetMeVO;
import com.lee.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: liyansong
 * @Date: 2024/2/4 16:53
 * @Version: 1.0
 */
@RestController
public class AboutController {

    @Autowired
    private UserService userService;

    /**
     * 获取关于我
     * @param
     * @return
     */
    @GetMapping("/about/getMe")
    public CommonResult getAdminList() {
        User user = UserThreadHolder.get();
        if (ObjectUtil.isEmpty(user)) {
            return CommonResult.failed(ResultCode.UNAUTHORIZED, "您还未登录，请登录！");
        }
        final GetMeVO getMeVO = GetMeVO.builder().personResume(user.getSummary()).nickName(user.getNickName()).occupation(user.getOccupation())
                .summary(user.getSummary()).build();
        return CommonResult.success(getMeVO);
    }
}
