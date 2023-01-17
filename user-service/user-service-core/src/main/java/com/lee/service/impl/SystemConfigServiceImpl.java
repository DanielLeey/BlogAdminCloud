package com.lee.service.impl;

import com.lee.common.bo.DictSysTypeBO;
import com.lee.common.entity.SysConfig;
import com.lee.common.entity.SystemConfig;
import com.lee.service.SysConfigService;
import com.lee.service.SysDictTypeService;
import com.lee.service.SystemConfigService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * @Author: liyansong
 * @Date: 2023/1/14 18:05
 * @Version: 1.0
 */
@Service("systemConfigService")
public class SystemConfigServiceImpl implements SystemConfigService {

    @Autowired
    private SysDictTypeService sysDictTypeService;

    @Autowired
    private SysConfigService sysConfigService;

    /**
     * 获取单例模式
     *
     * @return
     */
    @Override
    public SystemConfig getSystemConfigInstance() {
        // 生成单例的系统配置类
        final SystemConfig systemConfig = SystemConfig.systemConfig();
        //请求SysDictType获取SysDictData的默认值，set systemConfig


        List<String> sysList = Arrays.asList("sys_search_model", "sys_yes_no", "sys_picture_priority", "sys_de_pic_priority",
                "sys_storage_region", "sys_normal_disable",
                "sys_editor_modal", "sys_email_notify", "sys_dash_notify", "sys_email_activate",
                "sys_upload_model");
        final Map<String, DictSysTypeBO> dictTypes = sysDictTypeService.getListByDictTypeList(sysList);
        systemConfig.setEditorModel(dictTypes.get("sys_editor_modal").getDefaultValue());
        systemConfig.setSearchModel(dictTypes.get("sys_search_model").getDefaultValue());
        systemConfig.setPicturePriority(dictTypes.get("sys_picture_priority").getDefaultValue());
        systemConfig.setContentPicturePriority(dictTypes.get("sys_de_pic_priority").getDefaultValue());
        systemConfig.setStartEmailNotification(dictTypes.get("sys_email_notify").getDefaultValue());
        systemConfig.setOpenDashboardNotification(dictTypes.get("sys_dash_notify").getDefaultValue());
        systemConfig.setOpenEmailActivate(dictTypes.get("sys_email_activate").getDefaultValue());
        final String uploadModel = dictTypes.get("sys_upload_model").getDefaultValue();
        // 0 bendi 1 qiniu 2 mini
        // getdefault 0/1/2
        // setUploadlocal 0 否 1 是
        systemConfig.setUploadLocal("0".equals(uploadModel) ? "1" : "0");
        systemConfig.setUploadQiNiu("1".equals(uploadModel) ? "1" : "0");
        systemConfig.setUploadMinio("2".equals(uploadModel) ? "1" : "0");
        //获取t_system_config表中配置的属性
        final SysConfig sysConfig = sysConfigService.list().get(0);
        BeanUtils.copyProperties(sysConfig, systemConfig);
        return systemConfig;

    }
}
