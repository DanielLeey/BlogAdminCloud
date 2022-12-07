package com.lee.api;

import com.lee.domain.User;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

/**
 * @Author: liyansong
 * @Date: 2022/12/7 9:27
 * @Version: 1.0
 */
@FeignClient(value = "user-service", path = "/auth")
public interface UserFeignService {

    @GetMapping(value = "/getUserByUsername/{username}")
    public User getUserByUsername(@PathVariable("username") String username);
}