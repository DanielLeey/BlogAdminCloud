package com.lee.component.security;

import cn.hutool.core.util.StrUtil;
import com.lee.utils.JwtTokenUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.web.server.context.ServerSecurityContextRepository;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

/**
 * 根据token来判断用户权限
 * 实现ServerSecurityContextRepository类的主要目的是实现load方法
 * 这个方法实际上是传递一个Authentication对象供后面ReactiveAuthenticationManager去认证
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
                    //添加请求头，其他模块能够从请求头获取用户USERNAME，再从redis或db中获取
                    serverWebExchange.getRequest().mutate().header("USERNAME", username).build();
                    //token能正常解析，表示token有效并对应数据库已知用户
                    Authentication newAuthentication = new UsernamePasswordAuthenticationToken(username, null);
                    return custReactiveAuthenticationManager.authenticate(newAuthentication).map(SecurityContextImpl::new);
                    } else {
                    return Mono.empty();
                }
            }
        }
        return Mono.empty();


    }
}
