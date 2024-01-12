package com.lee.config;

import com.lee.component.sentinel.ArticleFeignServiceFallback;
import com.lee.component.sentinel.AuthFeginFallback;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 * @Author: liyansong
 * @Date: 2024/1/12 15:41
 * @Version: 1.0
 */
//@Configuration
//@ComponentScan("com.lee.component.sentinel")
@Slf4j
public class SentinelConfig {

    @Bean
    public AuthFeginFallback authFeginFallback() {
        log.info("AuthFeginFallback installed");
        return new AuthFeginFallback();
    }
}
