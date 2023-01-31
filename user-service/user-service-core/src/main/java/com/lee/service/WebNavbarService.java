package com.lee.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lee.common.Request.WebNavbarEditRequest;
import com.lee.common.bo.WebNavbarBO;
import com.lee.common.entity.WebNavbar;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2023/1/18 14:51
 * @Version: 1.0
 */
public interface WebNavbarService extends IService<WebNavbar> {

    List<WebNavbarBO> getAllList();

    Boolean edit(WebNavbarEditRequest webNavbarEditRequest);

}
