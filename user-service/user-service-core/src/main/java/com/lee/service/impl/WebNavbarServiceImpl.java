package com.lee.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.common.Request.WebNavbarEditRequest;
import com.lee.common.bo.WebNavbarBO;
import com.lee.common.entity.WebNavbar;
import com.lee.dao.WebNavbarMapper;
import com.lee.service.WebNavbarService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @Author: liyansong
 * @Date: 2023/1/18 14:52
 * @Version: 1.0
 */
@Service("webNavbarService")
public class WebNavbarServiceImpl extends ServiceImpl<WebNavbarMapper, WebNavbar> implements WebNavbarService {

    @Override
    public List<WebNavbarBO> getAllList() {
        final List<WebNavbar> allWebNavbars = list();
        List<WebNavbarBO> webNavbarBOList = new ArrayList<>(allWebNavbars.size());
        for (WebNavbar webNavbar : allWebNavbars) {
            WebNavbarBO webNavbarBO = new WebNavbarBO();
            BeanUtils.copyProperties(webNavbar, webNavbarBO);
            webNavbarBOList.add(webNavbarBO);
        }
        return webNavbarBOList.stream().filter(webNavbarBO -> webNavbarBO.getNavbarLevel() == 1)
                .map(webNavbarBO -> getSubWebNavbar(webNavbarBO, webNavbarBOList)).collect(Collectors.toList());
    }

    @Override
    public Boolean edit(WebNavbarEditRequest webNavbarEditRequest) {
        final WebNavbarBO webNavbarBO = new WebNavbarBO();
        BeanUtils.copyProperties(webNavbarEditRequest, webNavbarBO);
        editWebNavbarBO(webNavbarBO);
        return true;
    }


    private void editWebNavbarBO(WebNavbarBO webNavbarBO) {
        final WebNavbar webNavbar = new WebNavbar();
        BeanUtils.copyProperties(webNavbarBO, webNavbar);
        updateById(webNavbar);
        if (CollUtil.isNotEmpty(webNavbarBO.getChildWebNavbar())) {
            for (WebNavbarBO oneWebNavbarBO : webNavbarBO.getChildWebNavbar()) {
                editWebNavbarBO(oneWebNavbarBO);
            }
        }
    }

    private WebNavbarBO getSubWebNavbar(WebNavbarBO webNavbarBO, List<WebNavbarBO> webNavbarBOList) {
        final List<WebNavbarBO> chirdWebNavbarBOList = webNavbarBOList.stream().filter(oneWebNavbarBO -> webNavbarBO.getUid().equals(oneWebNavbarBO.getParentUid())).collect(Collectors.toList());
        if (CollUtil.isEmpty(chirdWebNavbarBOList)) {
            return webNavbarBO;
        }
        for (WebNavbarBO oneWebNavBarBO : chirdWebNavbarBOList) {
            getSubWebNavbar(oneWebNavBarBO, webNavbarBOList);
        }
        webNavbarBO.setChildWebNavbar(chirdWebNavbarBOList);
        return webNavbarBO;
    }
}
