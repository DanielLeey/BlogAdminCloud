package com.lee.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.common.entity.SysConfig;
import com.lee.dao.SysConfigMapper;
import com.lee.service.SysConfigService;
import org.springframework.stereotype.Service;

/**
 * @Author: liyansong
 * @Date: 2023/1/15 13:43
 * @Version: 1.0
 */
@Service("sysConfigService")
public class SysConfigServiceImpl extends ServiceImpl<SysConfigMapper, SysConfig> implements SysConfigService {

}
