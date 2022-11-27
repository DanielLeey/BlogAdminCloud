package com.lee.config;

import com.lee.component.filter.JwtAuthenticationTokenFilter;
import com.lee.component.handler.RestAuthenticationEntryPoint;
import com.lee.component.handler.RestfulAccessDeniedHandler;
import com.lee.constant.MessageConstant;
import com.lee.domain.SecurityUser;
import com.lee.domain.User;
import com.lee.domain.UserDTO;
import com.lee.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.*;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configurers.ExpressionUrlAuthorizationConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

/**
 * security相关配置
 */

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserService userService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private RestfulAccessDeniedHandler restfulAccessDeniedHandler;
    @Autowired
    private RestAuthenticationEntryPoint restAuthenticationEntryPoint;

    /**
     * 配置Security相关配置
     * 用于配置需要拦截的url路径、jwt过滤器及出异常后的处理器；
     * @param httpSecurity
     * @throws Exception
     */
    @Override
    protected void configure(HttpSecurity httpSecurity) throws Exception {
        ExpressionUrlAuthorizationConfigurer<HttpSecurity>.ExpressionInterceptUrlRegistry registry = httpSecurity.authorizeRequests();
        //不需要保护的资源路径允许访问
        for (String url : ignoreUrlsConfig().getUrls()) {
            registry.antMatchers(url).permitAll();
        }
        //允许跨域请求的OPTIONS请求
        registry.antMatchers(HttpMethod.OPTIONS)
                .permitAll();
        // 任何请求需要身份认证
        registry.and()
                .authorizeRequests()
                .anyRequest()
                .authenticated()
                // 关闭跨站请求防护及不使用session
                .and()
                .csrf()
                .disable()
                .sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                // 自定义权限拒绝处理类
                .and()
                .exceptionHandling()
                .accessDeniedHandler(restfulAccessDeniedHandler)
                .authenticationEntryPoint(restAuthenticationEntryPoint)
                // 自定义权限拦截器JWT过滤器
                .and()
                .addFilterBefore(jwtAuthenticationTokenFilter(), UsernamePasswordAuthenticationFilter.class);
    }

    /**
     * 用于配置UserDetailsService及PasswordEncoder
     * passwordEncoder() userDetailsService()注入
     * @param auth
     * @throws Exception
     */
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService())
                .passwordEncoder(passwordEncoder);
    }


    /**
     * 1.SpringSecurity定义的核心接口，用于根据用户名获取用户信息，需要自行实现
     *      作用：从数据库中获取真实的用户，构造UserDetails实现类对象
     * 2.UserDetailsService接口只有一个方法，可以使用函数式接口，lamda表达式
     *      UserDetails loadUserByUsername(String username) throws UsernameNotFoundException;
     * 3.调用UserService方法从数据库中查询真实的用户信息
     * @return UserDetailsService实例
     */
    @Bean
    @Override
    public UserDetailsService userDetailsService() {
        //获取登录用户信息
        return username -> {
            User user = userService.getUserByUsername(username);

            if (user == null) {
                throw new UsernameNotFoundException(MessageConstant.USERNAME_PASSWORD_ERROR);
            }

            UserDTO userDTO = new UserDTO(user.getId(), user.getUserName(), user.getPassword(), Integer.parseInt(user.getStatus()), null);
            SecurityUser securityUser = new SecurityUser(userDTO);
            if (!securityUser.isEnabled()) {
                throw new DisabledException(MessageConstant.ACCOUNT_DISABLED);
            } else if (!securityUser.isAccountNonLocked()) {
                throw new LockedException(MessageConstant.ACCOUNT_LOCKED);
            } else if (!securityUser.isAccountNonExpired()) {
                throw new AccountExpiredException(MessageConstant.ACCOUNT_EXPIRED);
            } else if (!securityUser.isCredentialsNonExpired()) {
                throw new CredentialsExpiredException(MessageConstant.CREDENTIALS_EXPIRED);
            }
            return securityUser;
        };
    }


    /**
     * 在用户名和密码校验前添加的过滤器，如果有jwt的token，会自行根据token信息进行登录
     * @return
     */
    @Bean
    public JwtAuthenticationTokenFilter jwtAuthenticationTokenFilter(){
        return new JwtAuthenticationTokenFilter();
    }

    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Bean
    public IgnoreUrlsConfig ignoreUrlsConfig() {
        return new IgnoreUrlsConfig();
    }
}
