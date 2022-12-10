package com.lee.domain;

import cn.hutool.core.collection.CollUtil;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * @author admin
 */
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class SecurityUser implements UserDetails, Serializable {

    private static final long serialVersionUID = 3490737904567829990L;

    private User user;

    private List<Resource> resources;

    public  SecurityUser() {

    }

    public SecurityUser(User user, List<Resource> resources) {
        this.user = user;
        if (CollUtil.isNotEmpty(resources)) {
            this.resources = resources;
        }
    }

    @Override
    @JsonIgnore
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> authorities = new ArrayList<>();
        this.resources.forEach(resource -> authorities.add(new SimpleGrantedAuthority(resource.getUid())));
        return authorities;
    }

    @Override
    public String getPassword() {
        return this.user.getPassword();
    }

    @Override
    public String getUsername() {
        return this.user.getUserName();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return "0".equals(this.user.getStatus());
    }

}
