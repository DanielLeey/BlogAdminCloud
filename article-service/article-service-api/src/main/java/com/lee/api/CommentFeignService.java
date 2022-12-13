package com.lee.api;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @Author: liyansong
 * @Date: 2022/12/13 10:13
 * @Version: 1.0
 */
@FeignClient(value = "article-service", path = "/comment")
public interface CommentFeignService {

    @GetMapping("/count")
    public int getCommentCount();
}
