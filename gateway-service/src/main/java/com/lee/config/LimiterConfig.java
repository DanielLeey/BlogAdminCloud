package com.lee.config;

import com.lee.component.resolver.HostAddrKeyResolver;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 限流配置类
 *   注入获取请求的Ip来限流的Resolver
 *   在yml中配置：要限流的服务，配置过滤器的key-resolver
 * @author Lee
 */
@Configuration
public class LimiterConfig {

    @Bean
    public HostAddrKeyResolver hostAddrKeyResolver() {
        return new HostAddrKeyResolver();
    }

/*    @Bean
    public UriKeyResolver uriKeyResolver() {
        return new UriKeyResolver();
    }*/
}
