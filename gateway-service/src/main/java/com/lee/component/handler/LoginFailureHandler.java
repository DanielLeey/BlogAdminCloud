package com.lee.component.handler;

import cn.hutool.json.JSON;
import cn.hutool.json.JSONUtil;
import com.lee.api.CommonResult;
import com.lee.api.ResultCode;
import com.lee.constant.MessageConstant;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.server.WebFilterExchange;
import org.springframework.security.web.server.authentication.ServerAuthenticationFailureHandler;
import org.springframework.stereotype.Component;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import reactor.netty.ByteBufFlux;

import java.io.UnsupportedEncodingException;

/**
 * 登录失败时调用的自定义处理类
 * 由于SpringGateWay基于WebFlux，所以SpringSecruity很多原有写法，都得改为WebFlux的方式才能生效！
 */
@Component
public class LoginFailureHandler implements ServerAuthenticationFailureHandler {
    private static final Logger LOGGER = LoggerFactory.getLogger(LoginFailureHandler.class);
    @Override
    public Mono<Void> onAuthenticationFailure(WebFilterExchange webFilterExchange, AuthenticationException e) {
        ServerHttpResponse response = webFilterExchange.getExchange().getResponse();
        response.getHeaders().setContentType(MediaType.APPLICATION_JSON_UTF8);
        response.setStatusCode(HttpStatus.UNAUTHORIZED);//放回401
        CommonResult<Object> res = CommonResult.failed(ResultCode.UNAUTHORIZED, e.getMessage());
        //RestResponse<String> res = new RestResponse<String>(RestStatusCode.BAD_REQUEST.code(), e.getMessage());
        //String json= JSON.toJSONString(res);//关键
        String json = JSONUtil.toJsonStr(res);
        Mono<Void> ret = null;
        try {
            ret = response.writeAndFlushWith(Flux.just(ByteBufFlux.just(response.bufferFactory().wrap(json.getBytes("UTF-8")))));
        } catch (UnsupportedEncodingException err) {
            LOGGER.error("error:",err);
        }
        return ret;
    }
}
