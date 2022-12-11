package com.lee.controller;

import com.lee.common.entity.Resource;
import com.lee.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/7 9:45
 * @Version: 1.0
 */
@RestController
@RequestMapping("/resource")
public class ResourceController {

    @Autowired
    private ResourceService resourceService;

    @GetMapping(value = "/getResourcesByUserId/{id}")
    public List<Resource> getResourcesByUserId(@PathVariable("id") Long id) {
        return resourceService.getResourcesByUserId(id);
    }

    @GetMapping(value = "/list")
    public List<Resource> list() {
        return resourceService.list();
    }
}
