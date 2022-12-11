package com.lee.controller;

import com.lee.UserServiceApplication;
import com.lee.utils.RedisUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = UserServiceApplication.class)
public class UserControllerTest {

    @Autowired
    private RedisUtils redisUtils;

    @Test
    public void testGetRedis() {
        String aaa = (String) redisUtils.get("aaa");
        System.out.println(aaa);
    }

    @Test
    public void testSetRedis() {
        redisUtils.set("bbb", "bbbbb");
    }

}
