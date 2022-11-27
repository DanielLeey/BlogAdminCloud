package com.lee.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.dao.UserMapper;
import com.lee.domain.SecurityUser;
import com.lee.domain.User;
import com.lee.domain.UserDTO;
import com.lee.service.UserService;

import com.lee.utils.JwtTokenUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    private static final Logger LOGGER = LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UserMapper userMapper;

    @Value("${jwt.tokenHead}")
    private String tokenHead;

    @Override
    public User getUserByUsername(String username) {
        LambdaQueryWrapper<User> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(User::getUserName, username);
        return getOne(wrapper);
    }

    @Override
    public String login(String username, String password) {
        // username从数据库中获取user，对比密码
        UserDetails userDetails = loadUserDetailsByUsername(username);
        if (!passwordEncoder.matches(password, userDetails.getPassword())) {
            throw new UsernameNotFoundException("用户名或密码错误");
        }
        UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
        // 获取认证后的对象
        SecurityContextHolder.getContext().setAuthentication(authentication);
        // 通过认证后的对象，生成jwt Token，sub：username
        return jwtTokenUtil.generateToken(userDetails);
    }

    private UserDetails loadUserDetailsByUsername(String username) {
        User user = getUserByUsername(username);
        if (user != null) {
            // List<UmsResource> resourceList = getResourceList(admin.getId());
            UserDTO userDTO = new UserDTO(user.getId(), user.getUserName(), user.getPassword(), Integer.parseInt(user.getStatus()), null);
            return new SecurityUser(userDTO);
        }
        throw new UsernameNotFoundException("用户名或密码错误");
    }
}
