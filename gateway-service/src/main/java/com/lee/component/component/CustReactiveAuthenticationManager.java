package com.lee.component.component;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.*;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import reactor.core.publisher.Mono;

@Configuration
public class CustReactiveAuthenticationManager implements ReactiveAuthenticationManager {

    @Autowired
    private SecurityUserDetailsService securityUserDetailsService;


    @Override
    public Mono<Authentication> authenticate(Authentication authentication) {
        // 如果对token有足够的安全认可，可以采用无状态凭证策略，将username和authorities放置在token串中解析获取，此处就可以不用查询数据库验证
        Mono<UserDetails> userDetails = securityUserDetailsService.findByUsername(authentication.getPrincipal().toString());
        UserDetails user = userDetails.block();
        if (user == null){
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

        Authentication auth = new UsernamePasswordAuthenticationToken(user.getUsername(), null, user.getAuthorities());
        return Mono.just(auth);
    }
}
