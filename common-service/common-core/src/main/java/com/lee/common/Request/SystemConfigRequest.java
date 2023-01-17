package com.lee.common.Request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @Author: liyansong
 * @Date: 2023/1/9 20:37
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SystemConfigRequest {
    private String qiNiuAccessKey;
    private String qiNiuSecretKey;
    private String qiNiuBucket;
    private String qiNiuArea;
    private String minioEndPoint;
    private String minioAccessKey;
    private String minioSecretKey;
    private String minioBucket;
    private String uploadQiNiu;
    private String uploadLocal;
    private String uploadMinio;
    private String picturePriority;
    private String contentPicturePriority;
    private String localPictureBaseUrl;
    private String qiNiuPictureBaseUrl;
    private String minioPictureBaseUrl;
    private String email;
    private String emailPassword;
    private String smtpPort;
    private String startEmailNotification;
    private String editorModel;
    private String themeColor;
    private String dashboardNotification;
    private String openDashboardNotification;
    private String openEmailActivate;
    private String searchModel;
    private String uid;
    private Integer status;
    private Date createTime;
    private Date updateTime;
}
