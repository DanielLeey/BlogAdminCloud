package com.lee.controller;

import cn.hutool.json.JSONUtil;
import com.lee.api.EchoService;
import com.lee.api.ResourceFeignService;
import com.lee.api.AuthFeignService;
import com.lee.common.entity.Resource;
import com.lee.common.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.util.List;

@RestController
public class Echocontroller {

    @Autowired
    private RestTemplate restTemplate;
    @Autowired
    private EchoService echoService;

    @Autowired
    private AuthFeignService authFeignService;

    @Autowired
    private ResourceFeignService resourceFeignService;


    @GetMapping(value = "/echo-rest/{str}")
    public String rest(@PathVariable String str) {
        return restTemplate.getForObject("http://user-service/echo/" + str, String.class);
    }

    @GetMapping(value = "/echo-feign/{str}")
    public String feign(@PathVariable String str) {
        return echoService.echo(str);
    }

    @GetMapping("/test/userfeign")
    public String testUserFeign() {
        User user = authFeignService.getUserByUsername("admin");
        return JSONUtil.toJsonPrettyStr(user);
    }

    @GetMapping("/test/resourcefeign")
    public String testResourceFeign() {
        final List<Resource> resourcesByUserId = resourceFeignService.getResourcesByUserId(1L);
        return resourcesByUserId.toString();
    }

    @GetMapping("/test/resourcefeign2")
    public String testResourceFeign2() {
        List<Resource> list = resourceFeignService.list();
        return list.toString();
    }
}
