package com.lee.component.component;

import com.lee.api.ResourceFeignService;
import com.lee.api.UserFeignService;
import com.lee.common.constant.MessageConstant;
import com.lee.domain.Resource;
import com.lee.domain.SecurityUser;
import com.lee.domain.User;
import com.lee.domain.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.userdetails.ReactiveUserDetailsService;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import reactor.core.publisher.Mono;

import java.util.List;

@Component("securityUserDetailsService")
public class SecurityUserDetailsService implements ReactiveUserDetailsService {

    @Autowired
    private UserFeignService userService;

    @Autowired
    private ResourceFeignService resourceService;

    @Override
    public Mono<UserDetails> findByUsername(String username) {

        User user = userService.getUserByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException(MessageConstant.USERNAME_PASSWORD_ERROR);
        }
        List<Resource> resources = resourceService.getResourcesByUserId(user.getId());
        UserDTO userDTO = new UserDTO(user.getId(), user.getUserName(), user.getPassword(), Integer.parseInt(user.getStatus()), resources);
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

        return Mono.just(securityUser);

    }
}
