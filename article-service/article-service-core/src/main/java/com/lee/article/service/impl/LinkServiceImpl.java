package com.lee.article.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.article.dao.LinkMapper;
import com.lee.article.service.LinkService;
import com.lee.common.entity.Link;
import com.lee.common.vo.LinkVO;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @Author: liyansong
 * @Date: 2023/2/2 19:38
 * @Version: 1.0
 */
@Service("linkService")
public class LinkServiceImpl extends ServiceImpl<LinkMapper, Link> implements LinkService {

    @Override
    public List<LinkVO> getLink() {
        LambdaQueryWrapper<Link> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Link::getStatus, 1);
        wrapper.eq(Link::getLinkStatus, 1);
        wrapper.orderByDesc(Link::getSort);
        final List<Link> linkList = list(wrapper);
        return linkList.stream().map(link -> {
            final LinkVO linkVO = new LinkVO();
            BeanUtils.copyProperties(link, linkVO);
            return linkVO;
        }).collect(Collectors.toList());
    }
}
