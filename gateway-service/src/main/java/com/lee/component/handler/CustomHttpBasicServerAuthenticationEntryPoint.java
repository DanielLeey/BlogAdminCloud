package com.lee.component.handler;

import cn.hutool.json.JSONUtil;
import com.lee.common.api.CommonResult;
import com.lee.common.api.ResultCode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.server.authentication.HttpBasicServerAuthenticationEntryPoint;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import reactor.netty.ByteBufFlux;

import java.io.UnsupportedEncodingException;

/**
 * 未登录访问资源时的处理类，若无此处理类，前端页面会弹出登录窗口<br>
 * 由于SpringGateWay基于WebFlux，所以SpringSecruity很多原有写法，都得改为WebFlux的方式才能生效！
 */
@Component
public class CustomHttpBasicServerAuthenticationEntryPoint extends HttpBasicServerAuthenticationEntryPoint /* implements ServerAuthenticationEntryPoint */ {
    private static final Logger LOGGER = LoggerFactory.getLogger(CustomHttpBasicServerAuthenticationEntryPoint.class);

    @Override
    public Mono<Void> commence(ServerWebExchange exchange, AuthenticationException e) {
        ServerHttpResponse response = exchange.getResponse();
        response.getHeaders().setContentType(MediaType.APPLICATION_JSON_UTF8);
        //放回401
        response.setStatusCode(HttpStatus.UNAUTHORIZED);
        CommonResult<Object> res = CommonResult.failed(ResultCode.UNAUTHORIZED, e.getMessage());
        String json = JSONUtil.toJsonStr(res);
        Mono<Void> ret = null;
        try {
            ret = response.writeAndFlushWith(Flux.just(ByteBufFlux.just(response.bufferFactory().wrap(json.getBytes("UTF-8")))));
        } catch (UnsupportedEncodingException err) {
            LOGGER.error("error:", err);
        }
        return ret;
    }
}
