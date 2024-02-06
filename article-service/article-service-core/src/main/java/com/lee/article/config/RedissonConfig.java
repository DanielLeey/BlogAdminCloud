package com.lee.article.config;

import org.redisson.Redisson;
import org.redisson.api.RedissonClient;
import org.redisson.config.Config;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @Author: liyansong
 * @Date: 2024/2/6 17:36
 * @Version: 1.0
 */

@Configuration
public class RedissonConfig {

 /*   @Value("${redis.host}")
    private String host;

    @Value("${redis.port}")
    private String port;

    @Value("${redis.password}")
    private String password;*/

    @Bean(destroyMethod="shutdown")
    public RedissonClient redissonClient(){
        // 创建配置 指定redis地址及节点信息
        Config config = new Config();
        config.useSingleServer().setAddress("redis://47.96.151.225" + ":" + "6379");

        // 根据config创建出RedissonClient实例
        RedissonClient redissonClient = Redisson.create(config);
        return redissonClient;
    }

}
