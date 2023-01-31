package com.lee.api;

import com.lee.common.entity.User;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2023/1/21 11:41
 * @Version: 1.0
 */
@FeignClient(value = "user-service", path = "/user")
public interface UserFeignService {

    @PostMapping("/getUsersByIds")
    public List<User> getUsersByIds(@RequestBody List<String> userIds);
}
