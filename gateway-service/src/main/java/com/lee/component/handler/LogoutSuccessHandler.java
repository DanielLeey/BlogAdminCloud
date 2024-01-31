package com.lee.component.handler;

import cn.hutool.json.JSONUtil;
import com.lee.common.api.CommonResult;
import com.lee.common.api.ResultCode;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.buffer.DataBuffer;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseCookie;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.server.WebFilterExchange;
import org.springframework.security.web.server.authentication.logout.ServerLogoutSuccessHandler;
import org.springframework.stereotype.Component;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import reactor.netty.ByteBufFlux;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;

/**
 * @Author: liyansong
 * @Date: 2024/1/30 17:15
 * @Version: 1.0
 */
@Component
@Slf4j
public class LogoutSuccessHandler implements ServerLogoutSuccessHandler {
    @Override
    public Mono<Void> onLogoutSuccess(WebFilterExchange exchange, Authentication authentication) {
        ServerHttpResponse response = exchange.getExchange().getResponse();
        //设置headers
        HttpHeaders httpHeaders = response.getHeaders();
        httpHeaders.add("Content-Type", "application/json; charset=UTF-8");
        httpHeaders.add("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0");
        //设置body
        HashMap<String, String> map = new HashMap<>();
        //删除token
        response.addCookie(ResponseCookie.from("token", "logout").maxAge(0).path("/").build());
        map.put("code", "200");
        map.put("message", "退出登录成功");
        String json = JSONUtil.toJsonStr(CommonResult.success(map));

        Mono<Void> ret = null;
        try {
            ret = response.writeAndFlushWith(Flux.just(ByteBufFlux.just(response.bufferFactory().wrap(json.getBytes("UTF-8")))));
        } catch (UnsupportedEncodingException e) {
            log.error("退出登录错误：", e);
        }
        return ret;

    }
}
