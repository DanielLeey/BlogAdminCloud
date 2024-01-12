package com.lee.article.config;

import com.lee.component.sentinel.ArticleFeignServiceFallback;
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
    public ArticleFeignServiceFallback articleFeignServiceFallback() {
        log.info("ArticleFeignServiceFallback installed");
        return new ArticleFeignServiceFallback();
    }
}
