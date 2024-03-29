package com.lee.config;


import com.lee.component.handler.*;
import com.lee.component.security.CustReactiveAuthorizationManager;
import com.lee.component.security.CustSecurityContextRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.reactive.EnableWebFluxSecurity;
import org.springframework.security.config.web.server.SecurityWebFiltersOrder;
import org.springframework.security.config.web.server.ServerHttpSecurity;
import org.springframework.security.web.server.SecurityWebFilterChain;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.reactive.CorsWebFilter;
import org.springframework.web.cors.reactive.UrlBasedCorsConfigurationSource;


@EnableWebFluxSecurity
public class WebfluxSecurityConfig {

    // 登录成功时调用的自定义处理类
    @Autowired
    private LoginSuccessHandler loginSuccessHandler;
    // 退出登录时调用的自定义处理类
    @Autowired
    private LogoutHandler logoutHandler;
    // 退出登录成功时调用的自定义处理类
    @Autowired
    private LogoutSuccessHandler logoutSuccessHandler;

    // 登录失败时调用的自定义处理类
    @Autowired
    private LoginFailureHandler loginFailureHandler;

    // 未登录访问资源时的处理类，若无此处理类，前端页面会弹出登录窗口
    @Autowired
    private CustomHttpBasicServerAuthenticationEntryPoint customHttpBasicServerAuthenticationEntryPoint;

    // 无权限访问被拒绝时的自定义处理器。如不自己处理，默认返回403错误
    @Autowired
    private CustomServerAccessDeniedHandler customServerAccessDeniedHandler;


    // 根据token来判断用户权限
    @Autowired
    private CustSecurityContextRepository custSecurityContextRepository;

    /*
     * 自定义的鉴权服务，通过鉴权的才能继续访问某个请求
     */
    @Autowired
    private CustReactiveAuthorizationManager custReactiveAuthorizationManager;


    // security的鉴权排除列表
    private static final String[] excludedAuthPages = {
            "/health", "/api/socket/**", "/base-core/product/try1",
            "/swagger-ui/**", "/swagger-resources/**",
            "/v2/api-docs", "/webjars/**", "/doc.html",
            "/gateway/auth/login",
            "/admin/auth/getWebSiteName",
            "/admin/auth/getMenu",
            "/admin/auth/info",
            "/admin/auth/**",
            "/admin/index/**",
            "/admin/sysDictData/**",
            "/admin/systemConfig/**",
            "/article/blog/**",
            "/article/blogSort/**",
            "/article/tag/**",
            "/article/subject/**",
            "/article/subjectItem/**",
            "/admin/admin/**",
            "/admin/role/**",
            "/admin/resource/**",
            "/admin/user/**",
            "/admin/sysDictType/**",
            "/admin/sysParams/**",
            "/admin/webConfig/getWebConfig",
            "/admin/webNavbar/**",
            "/admin/todo/**",
            "/article/comment/**",
            "/web/sysDictData/**",
            "/web/index/**",
            "/web/about/getMe",
            "/article/link/**",
            "/article/search/**",
            "/article/content/**",
            "/article/sort/**",
            "/article/classify/**",
            "/article/article/recorderVisitPage",
            "/admin/oauth/**"

    };

    // "/admin/auth/**"
    @Bean
    SecurityWebFilterChain webFluxSecurityFilterChain(ServerHttpSecurity http) throws Exception {
        http                // 1. 开始跨域配置
                .cors()
                // 2. 指定一个 CorsConfigurationSource`
                .and().addFilterBefore(corsFilter(), SecurityWebFiltersOrder.CORS)
                .csrf().disable()
                .httpBasic().disable()
                .formLogin().disable()
                .securityContextRepository(custSecurityContextRepository)
                //SecurityWebFiltersOrder枚举类定义了执行次序 请求拦截处理
                .authorizeExchange(exchange -> exchange
                        .pathMatchers(excludedAuthPages).permitAll()
                        .pathMatchers(HttpMethod.OPTIONS).permitAll()
                        .anyExchange().access(custReactiveAuthorizationManager)//权限
                )
                // 未登录访问资源时的处理类，若无此处理类，前端页面会弹出登录窗口
                .exceptionHandling().authenticationEntryPoint(customHttpBasicServerAuthenticationEntryPoint)
                // 访问被拒绝时自定义处理器
                .and().exceptionHandling().accessDeniedHandler(customServerAccessDeniedHandler)

                // 登录成功
                .and().formLogin().loginPage("/auth/login").authenticationSuccessHandler(loginSuccessHandler)
                // 登录验证失败
                .authenticationFailureHandler(loginFailureHandler)
                // 退出登录
                .and().logout().logoutUrl("/auth/logout").logoutHandler(logoutHandler).logoutSuccessHandler(logoutSuccessHandler);
        // 为了支持jwt 自定义了这个类，从请求头中获取token
        http.securityContextRepository(custSecurityContextRepository);
        //http.addFilterAt(new CorsWebFilter(), SecurityWebFiltersOrder.SECURITY_CONTEXT_SERVER_WEB_EXCHANGE);
        return http.build();
    }

    public CorsWebFilter corsFilter() {
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        CorsConfiguration configuration = new CorsConfiguration();
        // 配置跨域的信息
        configuration.addAllowedHeader("*");
        configuration.addAllowedMethod("*");
        // SpringBoot升级到2.4.0 之后需要使用该配置
        configuration.addAllowedOriginPattern("*");
        configuration.setAllowCredentials(true);
        source.registerCorsConfiguration("/**", configuration);
        return new CorsWebFilter(source);
    }
}
