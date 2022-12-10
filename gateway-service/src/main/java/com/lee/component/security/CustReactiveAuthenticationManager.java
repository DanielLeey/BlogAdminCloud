package com.lee.component.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.*;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.util.StringUtils;
import reactor.core.publisher.Mono;

@Configuration
public class CustReactiveAuthenticationManager implements ReactiveAuthenticationManager {

    @Autowired
    private SecurityUserDetailsService securityUserDetailsService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public Mono<Authentication> authenticate(Authentication authentication) {
        String username = (String) authentication.getPrincipal();
        String password = (String) authentication.getCredentials();

        // 如果对token有足够的安全认可，可以采用无状态凭证策略，将username和authorities放置在token串中解析获取，此处就可以不用查询数据库验证

        return securityUserDetailsService.getUserFromRedis(username)
                .map(redisUser -> (UserDetails) redisUser)
                .map(user -> {
                    if (user == null) {
                        throw new DisabledException("账户不可用");
                    }
                    if (StringUtils.hasLength(password) && !passwordEncoder.matches(password, user.getPassword())) {
                        throw new UsernameNotFoundException("用户名或密码错误");
                    } else if (!user.isEnabled()) {
                        new DisabledException("该账户已被禁用，请联系管理员");

                    } else if (!user.isAccountNonLocked()) {
                        new LockedException("该账号已被锁定");
                    } else if (!user.isAccountNonExpired()) {
                        new AccountExpiredException("该账号已过期，请联系管理员");

                    } else if (!user.isCredentialsNonExpired()) {
                        new CredentialsExpiredException("该账户的登录凭证已过期，请重新登录");
                    }
                    Authentication auth = new UsernamePasswordAuthenticationToken(user, null, user.getAuthorities());
                    return auth;
                }).switchIfEmpty(securityUserDetailsService.findByUsername(username).map(user -> {
                    if (user == null) {
                        throw new DisabledException("账户不可用");
                    }
                    if (StringUtils.hasLength(password) && !passwordEncoder.matches(password, user.getPassword())) {
                        throw new UsernameNotFoundException("用户名或密码错误");
                    } else if (!user.isEnabled()) {
                        new DisabledException("该账户已被禁用，请联系管理员");

                    } else if (!user.isAccountNonLocked()) {
                        new LockedException("该账号已被锁定");
                    } else if (!user.isAccountNonExpired()) {
                        new AccountExpiredException("该账号已过期，请联系管理员");

                    } else if (!user.isCredentialsNonExpired()) {
                        new CredentialsExpiredException("该账户的登录凭证已过期，请重新登录");
                    }
                    Authentication auth = new UsernamePasswordAuthenticationToken(user, null, user.getAuthorities());
                    return auth;
                }));

        /*Mono<UserDetails> userDetails = securityUserDetailsService.findByUsername(username);
        UserDetails user = userDetails.block();

        if (StringUtils.hasLength(password) && !passwordEncoder.matches(password, user.getPassword())) {
            throw new UsernameNotFoundException("用户名或密码错误");
        }
        if (user == null) {
            throw new DisabledException("账户不可用");
        }// 用户若不存在，则会在上面方法中抛出异常，所以能到这里用户一定存在
        else if (!user.isEnabled()) {
            return Mono.error(new DisabledException("该账户已被禁用，请联系管理员"));

        } else if (!user.isAccountNonLocked()) {
            return Mono.error(new LockedException("该账号已被锁定"));
        } else if (!user.isAccountNonExpired()) {
            return Mono.error(new AccountExpiredException("该账号已过期，请联系管理员"));

        } else if (!user.isCredentialsNonExpired()) {
            return Mono.error(new CredentialsExpiredException("该账户的登录凭证已过期，请重新登录"));
        }

        Authentication auth = new UsernamePasswordAuthenticationToken(user, null, user.getAuthorities());
        return Mono.just(auth);*/
    }
}
