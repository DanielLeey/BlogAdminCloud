package com.lee.component.handler;

import cn.hutool.json.JSONUtil;
import com.lee.common.api.CommonResult;
import com.lee.domain.SecurityUser;
import com.lee.utils.JwtTokenUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.server.WebFilterExchange;
import org.springframework.security.web.server.authentication.ServerAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import reactor.netty.ByteBufFlux;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;

/**
 * 登录成功时调用的自定义处理类<br>
 * 由于SpringGateWay基于WebFlux，所以SpringSecruity很多原有写法，都得改为WebFlux的方式才能生效！
 */
@Component
public class LoginSuccessHandler implements ServerAuthenticationSuccessHandler {

    private static final Logger LOGGER = LoggerFactory.getLogger(LoginSuccessHandler.class);

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Override
    public Mono<Void> onAuthenticationSuccess(WebFilterExchange webFilterExchange, Authentication authentication) {
        //返回token
        SecurityUser user = (SecurityUser) authentication.getPrincipal();
        String token = jwtTokenUtil.generateToken(user);
        HashMap<String, String> hashMap = new HashMap<String, String>();
        hashMap.put("token", "Bearer " + token);

        ServerWebExchange exchange = webFilterExchange.getExchange();
        ServerHttpResponse response = exchange.getResponse();
        exchange.getSession().flatMap(
                webSession -> {
                    //去除SESSION 使回话无状态
                    webSession.getAttributes().remove("SESSION");
                    webSession.getAttributes().remove("JSESSIONID");
                    return Mono.just(webSession);
                }
        ).subscribe();
        response.getHeaders().setContentType(MediaType.APPLICATION_JSON_UTF8);

        //RestResponse<Map<String, String>> res = new RestResponse<Map<String, String>>(RestStatusCode.OK.code(),null, hashMap);
        //String json= JSON.toJSONString(res);
        //关键
        //JSON parse = JSONUtil.parse(CommonResult.success(hashMap));
        String json = JSONUtil.toJsonStr(CommonResult.success(hashMap));

        Mono<Void> ret = null;
        try {
            ret = response.writeAndFlushWith(Flux.just(ByteBufFlux.just(response.bufferFactory().wrap(json.getBytes("UTF-8")))));
        } catch (UnsupportedEncodingException e) {
            LOGGER.error("error:", e);
        }
        return ret;
    }
}
