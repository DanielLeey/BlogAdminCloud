package com.lee.component.reactiveRedis;

import com.alibaba.fastjson.support.spring.GenericFastJsonRedisSerializer;
import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.jsontype.impl.LaissezFaireSubTypeValidator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.ReactiveRedisConnectionFactory;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;
import org.springframework.data.redis.core.ReactiveRedisTemplate;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializationContext;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

@Configuration
public class RedisConfig {
    @Bean
    public RedisSerializer<Object> redisSerializer() {
        //创建JSON序列化器
        Jackson2JsonRedisSerializer<Object> serializer = new Jackson2JsonRedisSerializer<>(Object.class);
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
        //必须设置，否则无法将JSON转化为对象，会转化成Map类型
        objectMapper.activateDefaultTyping(LaissezFaireSubTypeValidator.instance,ObjectMapper.DefaultTyping.NON_FINAL);
        serializer.setObjectMapper(objectMapper);
        return serializer;
    }
/*    @Bean
    public RedisSerializationContext redisSerializationContext() {
        RedisSerializationContext.RedisSerializationContextBuilder builder = RedisSerializationContext.newSerializationContext();
        builder.key(StringRedisSerializer.UTF_8);
        builder.value(RedisSerializer.json());
        builder.hashKey(StringRedisSerializer.UTF_8);
        builder.hashValue(StringRedisSerializer.UTF_8);

        return builder.build();
    }*/
    @Bean
    public RedisSerializationContext redisSerializationContext() {
        RedisSerializer<Object> serializer = redisSerializer();
        RedisSerializationContext.RedisSerializationContextBuilder builder = RedisSerializationContext.newSerializationContext();
        builder.key(new StringRedisSerializer());
        builder.value(RedisSerializer.json());
        builder.hashKey(new StringRedisSerializer());
        builder.hashValue(RedisSerializer.json());

        return builder.build();
    }

    @Bean
    public ReactiveRedisTemplate reactiveRedisTemplate(ReactiveRedisConnectionFactory connectionFactory) {
        RedisSerializationContext serializationContext = redisSerializationContext();
        ReactiveRedisTemplate reactiveRedisTemplate = new ReactiveRedisTemplate(connectionFactory,serializationContext);
        return reactiveRedisTemplate;
    }
}
