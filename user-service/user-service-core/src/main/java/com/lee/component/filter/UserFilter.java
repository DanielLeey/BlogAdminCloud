package com.lee.component.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collections;
import java.util.Enumeration;
import java.util.LinkedHashSet;
import java.util.Set;

/**
 * @Author: liyansong
 * @Date: 2022/12/8 17:22
 * @Version: 1.0
 */

public class UserFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
        HttpServletResponse httpResponse = (HttpServletResponse) servletResponse;
        String username = httpRequest.getHeader("USER_NAME");
        HttpServletRequestWrapper requestWrapper = new HttpServletRequestWrapper(httpRequest) {
            @Override
            public String[] getParameterValues(String name) {
                if (name.equals("loginUserId")) {
                    return new String[] { username.toString() };
                }
                return super.getParameterValues(name);
            }
            @Override
            public Enumeration<String> getParameterNames() {
                Set<String> paramNames = new LinkedHashSet<>();
                paramNames.add("loginUserId");
                Enumeration<String> names =  super.getParameterNames();
                while(names.hasMoreElements()) {
                    paramNames.add(names.nextElement());
                }
                return Collections.enumeration(paramNames);
            }
        };
        filterChain.doFilter(requestWrapper, httpResponse);
    }
}
