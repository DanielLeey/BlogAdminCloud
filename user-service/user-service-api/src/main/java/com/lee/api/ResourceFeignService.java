package com.lee.api;

import com.lee.common.entity.Resource;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/7 9:44
 * @Version: 1.0
 */
@FeignClient(value = "user-service", path = "/resource")
public interface ResourceFeignService {

    @GetMapping(value = "/getResourcesByUserId/{id}")
    public List<Resource> getResourcesByUserId(@PathVariable("id") Long id);

    @GetMapping(value = "/list")
    public List<Resource> list();
}