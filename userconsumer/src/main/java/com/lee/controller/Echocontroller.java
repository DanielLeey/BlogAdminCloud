package com.lee.controller;

import com.lee.api.EchoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class Echocontroller {

    @Autowired
    private RestTemplate restTemplate;
    @Autowired
    private EchoService echoService;


    @GetMapping(value = "/echo-rest/{str}")
    public String rest(@PathVariable String str) {
        return restTemplate.getForObject("http://user-service/echo/" + str, String.class);
    }
    @GetMapping(value = "/echo-feign/{str}")
    public String feign(@PathVariable String str) {
        return echoService.echo(str);
    }

}
