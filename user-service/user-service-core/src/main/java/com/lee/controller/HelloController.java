package com.lee.controller;

import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/gateway")
public class HelloController {

    @GetMapping("/api/hello")
    public String hello(){
        return "hello, 这里是service-gateway网关, 恭喜你请求了正确的路径！";
    }

    @GetMapping("/error/hello")
    public String error(){
        return "hello, 这里是service-gateway网关, 好小子你直接跳过网关来请求真实后端地址是吧！";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public String login(String username, String password) {
        return username + ": " + password;
    }
}
