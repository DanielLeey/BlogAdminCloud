package com.lee.component.handler;

import cn.hutool.core.util.StrUtil;
import com.lee.utils.JwtTokenUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.ReactiveRedisTemplate;
import org.springframework.http.HttpCookie;
import org.springframework.http.HttpHeaders;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.server.WebFilterExchange;
import org.springframework.security.web.server.authentication.logout.ServerLogoutHandler;
import org.springframework.stereotype.Component;
import reactor.core.publisher.Mono;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2024/1/30 17:26
 * @Version: 1.0
 */
@Component
@Slf4j
public class LogoutHandler implements ServerLogoutHandler {

    @Autowired
    private ReactiveRedisTemplate reactiveRedisTemplate;

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Override
    public Mono<Void> logout(WebFilterExchange exchange, Authentication authentication) {

        final String authHeader = exchange.getExchange().getRequest().getHeaders().getFirst(HttpHeaders.AUTHORIZATION);
        try {
            if (StrUtil.isNotBlank(authHeader)) {
                if (authHeader.startsWith("Bearer ")) {
                    String authToken = authHeader.substring(7);
                    String username = jwtTokenUtil.getUserNameFromToken(authToken);
                    reactiveRedisTemplate.opsForValue().delete("USERNAME:" + username).subscribe();
                }
            }
        } catch (Exception e) {
            return Mono.error(e);
        }
        return Mono.empty();

    }
}
