package com.lee.common.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @Author: liyansong
 * @Date: 2022/12/27 9:22
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SystemConfigVO {
    //七牛云文件域名
    private String qiNiuPictureBaseUrl;
    //七牛云公钥
    private String qiNiuAccessKey;
    //七牛云私钥
    private String qiNiuSecretKey;
    //上传空间
    private String qiNiuBucket;
    //存储区域
    private String qiNiuArea;
    //文件上传七牛云
    private String uploadQiNiu;
    //Minio访问域名
    private String minioPictureBaseUrl;
    //Minio连接地址
    private String minioEndPoint;
    //Minio公钥
    private String minioAccessKey;
    //Minio私钥
    private String minioSecretKey;
    //Minio上传空间
    private String minioBucket;
    //文件上传Minio
    private String uploadMinio;
    //本地文件域名
    private String localPictureBaseUrl;
    //文件上传本地
    private String uploadLocal;
    //封面图片显示优先级
    private String picturePriority;
    //详情图片显示优先级
    private String contentPicturePriority;
    //文本编辑器
    private String editorModel;
    //网站消息邮件通知
    private String startEmailNotification;
    //是否开启仪表盘
    private String openDashboardNotification;
    //注册用户邮件激活
    private String openEmailActivate;
    //文章搜索模式
    private String searchModel;
    //邮箱
    private String email;
    //邮箱用户名
    private String emailUserName;
    //邮箱密码
    private String emailPassword;
    //SMTP地址
    private String smtpAddress;
    //SMTP端口
    private String smtpPort;
    //仪表盘通知
    private String dashboardNotification;
    //"<p>欢迎来到蘑菇博客项目，开源项目离不开大家的支持，希望小伙伴能随手点赞一下，你的点赞就是我维护的动力~</p>\n\n<p>项目源码：<a href=\"https://gitee.com/moxi159753/mogu_blog_v2\"><span style=\"color:#0000cd\">点我传送</span></a>，项目文档：<a href=\"http://moxi159753.gitee.io/mogu_blog_doc/#/\" target=\"_blank\"><span style=\"color:#0000ff\">点我传送</span></a>，项目官网：<a href=\"http://www.moguit.cn/#/\" target=\"_blank\"><span style=\"color:#0000ff\">点我传送</span></a>，学习笔记：<a href=\"https://gitee.com/moxi159753/LearningNotes\" target=\"_blank\"><span style=\"color:#0000ff\">点我传送</span></a></p>\n\n<p>蘑菇博客使用了一些监控的Spring Cloud组件，但是并不一定都需要部署，必须启动的服务包含</p>\n\n<p><code>nacos</code>，<code>nginx</code>，<code>rabbitmq</code>，&nbsp;<code>redis</code>，<code>mysql</code>，<code>mogu-gateway</code>,&nbsp;&nbsp;<code>mogu-sms</code>，<code>mogu-picture</code>，&nbsp;<code>mogu-web</code>,&nbsp;<code>mogu-admin</code></p>\n\n<p>其它的服务都可以不启动，也不影正常使用，可以根据自身服务器配置来启动</p>\n\n<p>最低配置：1核2G&nbsp;<code>需要开启虚拟内存</code></p>\n\n<p>推荐配置：2核4G 【双十二特惠】</p>\n\n<p>双12活动开始喽~，本次优惠力度非常大，如果有需求的，欢迎点击下面链接购买</p>\n\n<p>【阿里云】云服务器双12狂欢特惠，1核2G 5M轻量级应用服务器114元/年【博主使用】&nbsp;<a href=\"https://www.aliyun.com/minisite/goods?userCode=w7aungxw\"><span style=\"color:#0000ff\">点我传送</span></a></p>\n\n<p>【腾讯云】云产品限时秒杀，爆款1核2G云服务器，首年99元（老用户重新用微信QQ注册即可）&nbsp;<a href=\"https://curl.qcloud.com/zry6xub9\"><span style=\"color:#0000ff\">点我进入</span></a></p>\n\n<p>服务器和域名等服务的购买和续费都会产生一定的费用，为了维持项目的正常运作，如果觉得本项目对您有帮助的话</p>\n\n<p>欢迎朋友能够给予一些支持，非常感谢~（ps.. 小伙伴赞赏的时候可以备注一下下~）</p>\n\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\n\t<tbody>\n\t\t<tr>\n\t\t\t<td style=\"text-align:center\">微信</td>\n\t\t\t<td style=\"text-align:center\">支付宝</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td><img alt=\"\" src=\"http://demopicture.moguit.cn//blog/admin/png/2020/12/11/1607690861847.png\" /></td>\n\t\t\t<td><img alt=\"\" src=\"http://demopicture.moguit.cn//blog/admin/png/2020/12/11/1607690798874.png\" /></td>\n\t\t</tr>\n\t</tbody>\n</table>\n";

    private String themeColor;
    //= "#172524";

    private String uid;
    //= "37d492e35dc6e3fbb9dfedfd2079a123";
    private Integer status;
    private Date createTime;
    private Date updateTime;
}
