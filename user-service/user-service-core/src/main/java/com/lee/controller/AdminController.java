package com.lee.controller;

import com.lee.common.Request.BaseRequest;
import com.lee.common.api.CommonResult;
import com.lee.common.bo.AdminBO;
import com.lee.common.vo.AdminListVO;
import com.lee.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2023/1/5 16:28
 * @Version: 1.0
 */

@RestController
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private UserService userService;

    /**
     * 获取超级用户
     * @param baseRequest
     * @return
     */
    @PostMapping("/getList")
    public CommonResult getAdminList(@RequestBody BaseRequest baseRequest) {
        List<AdminBO> adminBOList = userService.getAdminUsers();
        final AdminListVO adminListVO = new AdminListVO(adminBOList);
        adminListVO.setCurrent(baseRequest.getCurrentPage());
        adminListVO.setSize(baseRequest.getPageSize());
        adminListVO.setTotal(adminBOList.size());
        adminListVO.setIsSearchCount(true);
        adminListVO.setOptimizeCountsql(true);
        return CommonResult.success(adminListVO);
    }
}
