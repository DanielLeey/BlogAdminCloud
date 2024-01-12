package com.lee;

import com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceAutoConfigure;
import io.seata.spring.annotation.datasource.EnableAutoDataSourceProxy;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceTransactionManagerAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * @Author: liyansong
 * @Date: 2022/12/7 10:52
 * @Version: 1.0
 */
@SpringBootApplication(scanBasePackages = {"com.lee"})
@EnableDiscoveryClient
@MapperScan("com.lee.dao")
@EnableFeignClients(basePackages = {"com.lee.api"})
public class UserServiceApplication {
    public static void main(String[] args) {
        SpringApplication.run(UserServiceApplication.class, args);
    }

}
