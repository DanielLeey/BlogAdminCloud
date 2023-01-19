package com.lee.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.common.entity.WebConfig;
import com.lee.dao.WebConfigMapper;
import com.lee.service.WebConfigService;
import org.springframework.stereotype.Service;

/**
 * @Author: liyansong
 * @Date: 2023/1/17 10:48
 * @Version: 1.0
 */
@Service("webConfigService")
public class WebConfigServiceImpl extends ServiceImpl<WebConfigMapper, WebConfig> implements WebConfigService {

}
