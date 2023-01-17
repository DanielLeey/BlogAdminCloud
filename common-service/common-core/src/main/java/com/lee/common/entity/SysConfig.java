package com.lee.common.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.io.Serializable;

/**
 * 系统配置表(TSystemConfig)实体类
 *
 * @author makejava
 * @since 2023-01-15 13:07:13
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("t_system_config")
public class SysConfig implements Serializable {
    private static final long serialVersionUID = 616029676067505124L;
    /**
     * 主键
     */
    @TableId
    private String uid;
    /**
     * 七牛云公钥
     */
    private String qiNiuAccessKey;
    /**
     * 七牛云私钥
     */
    private String qiNiuSecretKey;
    /**
     * 邮箱账号
     */
    private String email;
    /**
     * 邮箱发件人用户名
     */
    private String emailUserName;
    /**
     * 邮箱密码
     */
    private String emailPassword;
    /**
     * SMTP地址
     */
    private String smtpAddress;
    /**
     * SMTP端口
     */
    private String smtpPort;
    /**
     * 状态
     */
    private Integer status;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 更新时间
     */
    private Date updateTime;
    /**
     * 七牛云上传空间
     */
    private String qiNiuBucket;
    /**
     * 七牛云存储区域 华东（z0），华北(z1)，华南(z2)，北美(na0)，东南亚(as0)
     */
    private String qiNiuArea;
    /**
     * 七牛云域名前缀：http://images.moguit.cn
     */
    private String qiNiuPictureBaseUrl;
    /**
     * 本地服务器域名前缀：http://localhost:8600
     */
    private String localPictureBaseUrl;
    /**
     * 主题颜色
     */
    private String themeColor;
    /**
     * Minio远程连接地址
     */
    private String minioEndPoint;
    /**
     * Minio公钥
     */
    private String minioAccessKey;
    /**
     * Minio私钥
     */
    private String minioSecretKey;
    /**
     * Minio桶
     */
    private String minioBucket;
    /**
     * Minio服务器文件域名前缀
     */
    private String minioPictureBaseUrl;
    /**
     * 仪表盘通知【用于首次登录弹框】
     */
    private String dashboardNotification;

}