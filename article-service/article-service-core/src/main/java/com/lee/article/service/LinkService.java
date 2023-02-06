package com.lee.article.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lee.common.entity.Link;
import com.lee.common.vo.LinkVO;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2023/2/2 19:38
 * @Version: 1.0
 */
public interface LinkService extends IService<Link> {

    List<LinkVO> getLink();
}
