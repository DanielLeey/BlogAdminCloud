package com.lee.common.entity;

import lombok.Data;

import java.util.Date;

/**
 * @Author: liyansong
 * @Date: 2023/1/14 18:08
 * @Version: 1.0
 * 单例模式创建系统配置类
 */
@Data
public class SystemConfig {

    // first page
    private String picturePriority;
    private String contentPicturePriority;
    private String startEmailNotification;
    private String editorModel;
    private String openDashboardNotification;
    private String openEmailActivate;
    private String searchModel;

    // second page
    private String localPictureBaseUrl;
    private String uploadLocal;

    // third page qiniu
    private String qiNiuPictureBaseUrl;
    private String qiNiuAccessKey;
    private String qiNiuSecretKey;
    private String qiNiuBucket;
    private String qiNiuArea;
    private String uploadQiNiu;

    // fourth page minio
    private String minioPictureBaseUrl;
    private String minioEndPoint;
    private String minioAccessKey;
    private String minioSecretKey;
    private String minioBucket;
    private String dashboardNotification;
    private String uploadMinio;

    // fifth page email
    private String email;
    private String emailUserName;
    private String emailPassword;
    private String smtpAddress;
    private String smtpPort;

    private String themeColor;

    private String uid;
    private Integer status;
    private Date createTime;
    private Date updateTime;

    private SystemConfig(){
    }
    public static SystemConfig systemConfig(){
        return Inner.instance;
    }
    private static class Inner {
        private static final SystemConfig instance = new SystemConfig();
    }

}
