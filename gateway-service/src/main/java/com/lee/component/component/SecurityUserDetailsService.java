package com.lee.component.component;

import com.lee.common.constant.MessageConstant;
import com.lee.domain.Resource;
import com.lee.domain.SecurityUser;
import com.lee.domain.User;
import com.lee.domain.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
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
    private JdbcTemplate jdbcTemplate;

    @Override
    public Mono<UserDetails> findByUsername(String username) {
        //获取username的用户和资源权限，返回SecurityUser（UserDetails）
        String userQuery = "SELECT * FROM SYS_USER WHERE USER_NAME = ?";
        RowMapper<User> userRowMapper = new BeanPropertyRowMapper<User>(User.class);
        User user = jdbcTemplate.queryForObject(userQuery, userRowMapper, username);
        if (user == null) {
            throw new UsernameNotFoundException(MessageConstant.USERNAME_PASSWORD_ERROR);
        }
        String resourceQuery = "select a.* from t_sys_resource a left join sys_role_resource_relation b on a.uid = b.resource_id " +
                               "left join sys_user_role_relation c on b.role_id = c.role_id where c.user_id = ?";
        RowMapper<Resource> resourceRowMapper = new BeanPropertyRowMapper<Resource>(Resource.class);
        List<Resource> resources = jdbcTemplate.query(resourceQuery, resourceRowMapper, user.getId());
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
