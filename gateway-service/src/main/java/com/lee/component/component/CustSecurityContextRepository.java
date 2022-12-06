package com.lee.component.component;

import cn.hutool.core.util.StrUtil;
import com.lee.utils.JwtTokenUtil;
import io.jsonwebtoken.Claims;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.security.authentication.ReactiveAuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.web.server.context.ServerSecurityContextRepository;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.util.ArrayList;
import java.util.Collection;

/**
 * 根据token来判断用户权限
 * 实现ServerSecurityContextRepository类的主要目的是实现load方法
 * 这个方法实际上是传递一个Authentication对象供后面ReactiveAuthorizationManager<AuthorizationContext>来判断用户权限
 *
 * @author Lee
 */

@Slf4j
@Component
public class CustSecurityContextRepository implements ServerSecurityContextRepository {

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Autowired
    private CustReactiveAuthenticationManager custReactiveAuthenticationManager;

    @Override
    public Mono<Void> save(ServerWebExchange serverWebExchange, SecurityContext securityContext) {
        return Mono.empty();
    }

    @Override
    public Mono<SecurityContext> load(ServerWebExchange serverWebExchange) {
        String authHeader = serverWebExchange.getRequest().getHeaders().getFirst(HttpHeaders.AUTHORIZATION);
        if (StrUtil.isNotBlank(authHeader)) {

            if (authHeader != null && authHeader.startsWith("Bearer ")) {
                // The part after "Bearer "
                String authToken = authHeader.substring(7);
                String username = jwtTokenUtil.getUserNameFromToken(authToken);
                if (StrUtil.isNotBlank(username)) {
                    //添加请求头
                    serverWebExchange.getRequest().mutate().header("USERNAME", username).build();
                    //token能正常解析，表示token有效并对应数据库已知用户
                    Authentication newAuthentication = new UsernamePasswordAuthenticationToken(username, username);
                    return custReactiveAuthenticationManager.authenticate(newAuthentication).map(SecurityContextImpl::new);
                    } else {
                    return Mono.empty();
                }
            }
        }
        return Mono.empty();


    }
}
