package com.lee.component.handler;

import cn.hutool.json.JSONUtil;
import com.lee.common.api.CommonResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.server.authorization.ServerAccessDeniedHandler;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import reactor.netty.ByteBufFlux;

import java.io.UnsupportedEncodingException;

/**
 * 无权限访问被拒绝时的自定义处理器。如不自己处理，默认返回403错误<br>
 * 由于SpringGateWay基于WebFlux，所以SpringSecruity很多原有写法，都得改为WebFlux的方式才能生效！
 */
@Component
public class CustomServerAccessDeniedHandler implements ServerAccessDeniedHandler {
    private static final Logger LOGGER = LoggerFactory.getLogger(CustomServerAccessDeniedHandler.class);

    @Override
    public Mono<Void> handle(ServerWebExchange serverWebExchange, AccessDeniedException e) {
        ServerHttpResponse response = serverWebExchange.getResponse();
        response.getHeaders().setContentType(MediaType.APPLICATION_JSON_UTF8);
        response.setStatusCode(HttpStatus.FORBIDDEN);//放回403
        CommonResult<String> res = CommonResult.forbidden(e.getMessage());
        //RestResponse<String> res = new RestResponse<String>(RestStatusCode.BAD_REQUEST.code(), e.getMessage());
        String json = JSONUtil.toJsonStr(res);//关键
        Mono<Void> ret = null;
        try {
            ret = response.writeAndFlushWith(Flux.just(ByteBufFlux.just(response.bufferFactory().wrap(json.getBytes("UTF-8")))));
        } catch (UnsupportedEncodingException err) {
            LOGGER.error("error:", err);
        }
        return ret;
    }
}
