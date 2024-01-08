package com.lee.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.api.ArticleFeignService;
import com.lee.common.api.CommonResult;
import com.lee.common.dto.ArticleDTO;
import com.lee.common.entity.Article;
import com.lee.common.entity.User;
import com.lee.dao.UserMapper;
import com.lee.service.UserService;
import io.seata.spring.annotation.GlobalTransactional;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ExceptionHandler;

@Service
@Slf4j
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    private static final Logger LOGGER = LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private ArticleFeignService articleFeignService;


    @Override
    public User getUserByUsername(String username) {
        LambdaQueryWrapper<User> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(User::getUserName, username);
        return getOne(wrapper);
    }

    @Override
    @GlobalTransactional(rollbackFor = Exception.class)
    //@Transactional(rollbackFor = Exception.class)
    public void userTestSeata() throws Exception {
        User user = getById(1);
        user.setId(100L);
        userMapper.insert(user);
        CommonResult<Article> commonResult = articleFeignService.testSeataInsertArtile();
        log.info(commonResult.getData().toString());
        int i = 10 / 0;

    }
}
