package com.lee.article.controller;

import com.lee.article.service.LinkService;
import com.lee.common.api.CommonResult;
import com.lee.common.vo.LinkVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2023/2/2 19:40
 * @Version: 1.0
 */
@RestController
@RequestMapping("/link")
public class LinkController {

    @Autowired
    private LinkService linkService;

    @GetMapping("/getLink")
    public CommonResult getLink() {
        List<LinkVO> linkVOList = linkService.getLink();
        return CommonResult.success(linkVOList);
    }
}
