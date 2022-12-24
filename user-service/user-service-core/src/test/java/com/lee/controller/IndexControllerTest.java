package com.lee.controller;

import com.lee.UserServiceApplication;
import com.lee.service.WebVisitService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = UserServiceApplication.class)
public class IndexControllerTest {

    @Autowired
    private WebVisitService webVisitService;

    @Test
    public void getBlogCountByBlogSortTest() {
    }
}
