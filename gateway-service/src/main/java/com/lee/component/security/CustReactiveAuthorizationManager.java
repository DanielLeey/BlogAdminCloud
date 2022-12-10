package com.lee.component.security;

import cn.hutool.core.collection.CollUtil;
import com.lee.domain.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
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
 */
@Slf4j
@Component
public class CustReactiveAuthorizationManager implements ReactiveAuthorizationManager<AuthorizationContext>, InitializingBean {

    private Map<String, String> map;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public Mono<AuthorizationDecision> check(Mono<Authentication> authentication, AuthorizationContext authorizationContext) {
        return authentication.map(auth -> {
            String path = authorizationContext.getExchange().getRequest().getURI().getPath();
            String needAuthority = null;
            PathMatcher pathMatcher = new AntPathMatcher();
            if (CollUtil.isNotEmpty(map)) {
                for (String key : map.keySet()) {
                    if (pathMatcher.match(key, path)) {
                        needAuthority = map.get(key);
                        break;
                    }
                }
            }
            for (GrantedAuthority authority : auth.getAuthorities()) {
                if (authority.getAuthority().equals(needAuthority)) {
                    return new AuthorizationDecision(true);
                }
                //对客户端访问路径与用户角色进行匹配
            }
            return new AuthorizationDecision(false);
        }).defaultIfEmpty(new AuthorizationDecision(false));

    }

    @Override
    public void afterPropertiesSet() throws Exception {
        map = new HashMap<>();
        String resourcesQuery = "SELECT * FROM T_SYS_RESOURCE";
        RowMapper<Resource> resourceRowMapper = new BeanPropertyRowMapper<Resource>(Resource.class);
        List<Resource> resources = jdbcTemplate.query(resourcesQuery, resourceRowMapper);
        for (Resource resource : resources) {
            map.put(resource.getUrl(), resource.getUid());
        }
    }
}
