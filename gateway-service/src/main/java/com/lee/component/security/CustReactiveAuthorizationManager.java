package com.lee.component.security;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.lang.UUID;
import com.lee.common.entity.Resource;
import com.lee.domain.SecurityUser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.authorization.AuthorizationDecision;
import org.springframework.security.authorization.ReactiveAuthorizationManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.server.authorization.AuthorizationContext;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;
import reactor.core.publisher.Mono;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 权限校验
 * 由于SpringGateWay基于WebFlux，所以SpringSecruity很多原有写法，都得改为WebFlux的方式才能生效！
 * 从路径获取所需权限，Authentication 获取用户所有权限，查看有没有
 *
 */
@Slf4j
@Component
public class CustReactiveAuthorizationManager implements ReactiveAuthorizationManager<AuthorizationContext>, InitializingBean {

    private Map<String, String> ResourceMap;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public Mono<AuthorizationDecision> check(Mono<Authentication> authentication, AuthorizationContext authorizationContext) {
        return authentication.map(auth -> {
            String path = authorizationContext.getExchange().getRequest().getURI().getPath();
            String needAuthority = null;
            PathMatcher pathMatcher = new AntPathMatcher();
            if (CollUtil.isNotEmpty(ResourceMap)) {
                for (String key : ResourceMap.keySet()) {
                    if (pathMatcher.match(key, path)) {
                        needAuthority = ResourceMap.get(key);
                        break;
                    }
                }
            }
            for (GrantedAuthority authority : auth.getAuthorities()) {
                if (authority.getAuthority().equals(needAuthority)) {
                    // 鉴权成功，放行；写入访问日志表
                    addVisitorInfo(authorizationContext, auth);
                    return new AuthorizationDecision(true);
                }
                //对客户端访问路径与用户角色进行匹配
            }
            return new AuthorizationDecision(false);
        }).defaultIfEmpty(new AuthorizationDecision(false));

    }

    private void addVisitorInfo(AuthorizationContext authorizationContext, Authentication auth) {
        ServerHttpRequest request = authorizationContext.getExchange().getRequest();
        String uid = UUID.fastUUID().toString().replace("-", "");
        SecurityUser securityUser = (SecurityUser) auth.getPrincipal();
        String userId = securityUser.getUser().getUid();
        String ip = "";
        if(request.getHeaders().getFirst("X-Forwarded-For") != null) {
            ip = request.getHeaders().getFirst("X-Forwarded-For");
        }
        String path = request.getURI().getPath();
        String[] splitPath = path.split("/");
        String behavior = "";
        if(splitPath.length >= 3) {
            behavior = splitPath[1] + "_" + splitPath[2];
        }
        String browser = request.getHeaders().getFirst("User-Agent");
        String os;
        if (browser.toLowerCase().indexOf("windows") >= 0 )
        {
            os = "Windows";
        } else if(browser.toLowerCase().indexOf("mac") >= 0)
        {
            os = "Mac";
        } else if(browser.toLowerCase().indexOf("x11") >= 0)
        {
            os = "Unix";
        } else if(browser.toLowerCase().indexOf("android") >= 0)
        {
            os = "Android";
        } else if(browser.toLowerCase().indexOf("iphone") >= 0)
        {
            os = "IPhone";
        }else {
            os = "UnKnown, More-Info: " + browser;
        }
        String insertSql = "INSERT INTO T_WEB_VISIT(UID, USER_UID, IP, BEHAVIOR, OS, BROWSER) VALUES (?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(insertSql, uid, userId, ip, behavior, os, browser);
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        ResourceMap = new HashMap<>();
        String resourcesQuery = "SELECT * FROM T_SYS_RESOURCE";
        RowMapper<Resource> resourceRowMapper = new BeanPropertyRowMapper<Resource>(Resource.class);
        List<Resource> resources = jdbcTemplate.query(resourcesQuery, resourceRowMapper);
        for (Resource resource : resources) {
            ResourceMap.put(resource.getUrl(), resource.getUid());
        }
    }
}
