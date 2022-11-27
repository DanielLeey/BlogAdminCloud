package com.lee.api;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(name = "user-service")
public interface EchoService {

    @GetMapping(value = "/echo/{str}")
    String echo(@PathVariable("str") String str);
}
