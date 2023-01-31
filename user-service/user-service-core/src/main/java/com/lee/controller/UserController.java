package com.lee.controller;

import com.lee.common.Request.UserListRequest;
import com.lee.common.api.CommonResult;
import com.lee.common.bo.UserBO;
import com.lee.common.entity.User;
import com.lee.common.vo.UserListVO;
import com.lee.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2023/1/8 16:41
 * @Version: 1.0
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/getList")
    public CommonResult getUsers(@RequestBody UserListRequest userListRequest) {
        List<UserBO> userBOList = userService.getUsers(userListRequest);
        final UserListVO userListVO = new UserListVO(userBOList);

        userListVO.setCurrent(userListRequest.getCurrentPage());
        userListVO.setSize(userListRequest.getPageSize());
        userListVO.setTotal(userService.count());
        userListVO.setIsSearchCount(true);
        userListVO.setOptimizeCountsql(true);
        return CommonResult.success(userListVO);
    }

    @PostMapping("/getUsersByIds")
    public List<User> getUsersByIds(@RequestBody List<String> userIds) {
        return userService.getUsersByIds(userIds);
    }
}
