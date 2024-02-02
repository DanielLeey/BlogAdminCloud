package com.lee.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.reactive.CorsWebFilter;
import org.springframework.web.cors.reactive.UrlBasedCorsConfigurationSource;


import java.util.Arrays;

/**
 * @Author: liyansong
 * @Date: 2024/2/1 20:35
 * @Version: 1.0
 */


@Configuration
public class CorsWebFilterConfiguration {

    @Bean("myCorsWebFilter")
    public CorsWebFilter corsFilter() {
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        CorsConfiguration configuration = new CorsConfiguration();
        // 配置跨域的信息
        configuration.addAllowedHeader("*");
        configuration.addAllowedMethod("*");
        // SpringBoot升级到2.4.0 之后需要使用该配置
        configuration.addAllowedOriginPattern("*");
        configuration.setAllowCredentials(true);
        source.registerCorsConfiguration("/**", configuration);
        return new CorsWebFilter(source);
    }
}
