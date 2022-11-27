package com.lee;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * 授权服务启动类
 * @author Lee
 */
@SpringBootApplication
@EnableDiscoveryClient
@MapperScan("com.lee.dao")
public class Oauth2AuthApplication {
    public static void main(String[] args) {
        SpringApplication.run(Oauth2AuthApplication.class, args);
    }
}