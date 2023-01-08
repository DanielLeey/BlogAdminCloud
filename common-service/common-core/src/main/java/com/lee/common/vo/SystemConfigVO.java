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
    private String qiNiuAccessKey;
    private String qiNiuSecretKey;
    private String qiNiuBucket;
    private String qiNiuArea;
    private String minioEndPoint;
    private String minioAccessKey;
    private String minioSecretKey;
    private String minioBucket;
    private String uploadQiNiu = "0";
    private String uploadLocal = "1";
    private String uploadMinio = "0";
    private String picturePriority = "0";
    private String contentPicturePriority = "0";
    private String localPictureBaseUrl = "http://localhost:8600/";
    private String qiNiuPictureBaseUrl;
    private String minioPictureBaseUrl;
    private String email = "1040612985@qq.com";
    private String emailPassword;
    private String smtpPort;
    private String startEmailNotification = "0";
    private String editorModel = "0";
    private String themeColor = "#172524";
    private String dashboardNotification = "<p>欢迎来到蘑菇博客项目，开源项目离不开大家的支持，希望小伙伴能随手点赞一下，你的点赞就是我维护的动力~</p>\n\n<p>项目源码：<a href=\"https://gitee.com/moxi159753/mogu_blog_v2\"><span style=\"color:#0000cd\">点我传送</span></a>，项目文档：<a href=\"http://moxi159753.gitee.io/mogu_blog_doc/#/\" target=\"_blank\"><span style=\"color:#0000ff\">点我传送</span></a>，项目官网：<a href=\"http://www.moguit.cn/#/\" target=\"_blank\"><span style=\"color:#0000ff\">点我传送</span></a>，学习笔记：<a href=\"https://gitee.com/moxi159753/LearningNotes\" target=\"_blank\"><span style=\"color:#0000ff\">点我传送</span></a></p>\n\n<p>蘑菇博客使用了一些监控的Spring Cloud组件，但是并不一定都需要部署，必须启动的服务包含</p>\n\n<p><code>nacos</code>，<code>nginx</code>，<code>rabbitmq</code>，&nbsp;<code>redis</code>，<code>mysql</code>，<code>mogu-gateway</code>,&nbsp;&nbsp;<code>mogu-sms</code>，<code>mogu-picture</code>，&nbsp;<code>mogu-web</code>,&nbsp;<code>mogu-admin</code></p>\n\n<p>其它的服务都可以不启动，也不影正常使用，可以根据自身服务器配置来启动</p>\n\n<p>最低配置：1核2G&nbsp;<code>需要开启虚拟内存</code></p>\n\n<p>推荐配置：2核4G 【双十二特惠】</p>\n\n<p>双12活动开始喽~，本次优惠力度非常大，如果有需求的，欢迎点击下面链接购买</p>\n\n<p>【阿里云】云服务器双12狂欢特惠，1核2G 5M轻量级应用服务器114元/年【博主使用】&nbsp;<a href=\"https://www.aliyun.com/minisite/goods?userCode=w7aungxw\"><span style=\"color:#0000ff\">点我传送</span></a></p>\n\n<p>【腾讯云】云产品限时秒杀，爆款1核2G云服务器，首年99元（老用户重新用微信QQ注册即可）&nbsp;<a href=\"https://curl.qcloud.com/zry6xub9\"><span style=\"color:#0000ff\">点我进入</span></a></p>\n\n<p>服务器和域名等服务的购买和续费都会产生一定的费用，为了维持项目的正常运作，如果觉得本项目对您有帮助的话</p>\n\n<p>欢迎朋友能够给予一些支持，非常感谢~（ps.. 小伙伴赞赏的时候可以备注一下下~）</p>\n\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\n\t<tbody>\n\t\t<tr>\n\t\t\t<td style=\"text-align:center\">微信</td>\n\t\t\t<td style=\"text-align:center\">支付宝</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td><img alt=\"\" src=\"http://demopicture.moguit.cn//blog/admin/png/2020/12/11/1607690861847.png\" /></td>\n\t\t\t<td><img alt=\"\" src=\"http://demopicture.moguit.cn//blog/admin/png/2020/12/11/1607690798874.png\" /></td>\n\t\t</tr>\n\t</tbody>\n</table>\n";
    private String openDashboardNotification = "1";
    private String openEmailActivate = "0";
    private String searchModel = "0";
    private String uid = "37d492e35dc6e3fbb9dfedfd2079a123";
    private Integer status = 1;
    private Date createTime;
    private Date updateTime;
}
