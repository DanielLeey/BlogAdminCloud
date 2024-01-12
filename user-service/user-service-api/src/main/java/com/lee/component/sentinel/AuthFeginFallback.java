package com.lee.component.sentinel;

import com.lee.api.AuthFeignService;
import com.lee.common.entity.User;
import org.springframework.stereotype.Component;

/**
 * @Author: liyansong
 * @Date: 2024/1/11 20:30
 * @Version: 1.0
 */
@Component
public class AuthFeginFallback implements AuthFeignService {
    @Override
    public User getUserByUsername(String username) {
        return new User();
    }

    @Override
    public String getAdminUid() {
        return "null";
    }
}
