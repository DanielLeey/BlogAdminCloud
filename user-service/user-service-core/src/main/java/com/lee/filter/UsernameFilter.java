package com.lee.filter;

import cn.hutool.core.util.ObjUtil;
import cn.hutool.core.util.StrUtil;
import com.lee.common.entity.SecurityUserDTO;
import com.lee.domain.UserThreadHolder;
import com.lee.service.UserService;
import com.lee.utils.RedisUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.GenericFilterBean;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Author: liyansong
 * @Date: 2022/12/8 17:22
 * @Version: 1.0
 * 从请求头中的USERNAME在redis中获取用户，放入ThreadLocal
 */

@Component
@Order(Ordered.HIGHEST_PRECEDENCE)
@Slf4j
public class UsernameFilter extends GenericFilterBean {

    @Autowired
    private RedisUtils redisUtils;

    @Autowired
    private UserService userService;

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        // 从Header中获取 username
        String username = request.getHeader("USERNAME");
        log.debug("header中的USERNAME:{}", username);
        if (StrUtil.isNotEmpty(username)) {
            SecurityUserDTO securityUserDTO = (SecurityUserDTO) redisUtils.get("USERNAME:" + username);
            if (ObjUtil.isNotNull(securityUserDTO)) {
                UserThreadHolder.set(securityUserDTO.getUser());
            }
            UserThreadHolder.set(userService.getUserByUsername(username));
        }
        filterChain.doFilter(request, response);
        UserThreadHolder.remove();
    }
}
