/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : mogu_blog

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 15/01/2023 13:05:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_system_config
-- ----------------------------
DROP TABLE IF EXISTS `t_system_config`;
CREATE TABLE `t_system_config`  (
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `qi_niu_access_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '七牛云公钥',
  `qi_niu_secret_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '七牛云私钥',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱账号',
  `email_user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱发件人用户名',
  `email_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱密码',
  `smtp_address` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SMTP地址',
  `smtp_port` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT 'SMTP端口',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `qi_niu_bucket` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '七牛云上传空间',
  `qi_niu_area` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '七牛云存储区域 华东（z0），华北(z1)，华南(z2)，北美(na0)，东南亚(as0)',
  `upload_qi_niu` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '图片是否上传七牛云 (0:否， 1：是)',
  `upload_local` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '图片是否上传本地存储 (0:否， 1：是)',
  `picture_priority` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '图片显示优先级（ 1 展示 七牛云,  0 本地）',
  `qi_niu_picture_base_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '七牛云域名前缀：http://images.moguit.cn',
  `local_picture_base_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '本地服务器域名前缀：http://localhost:8600',
  `start_email_notification` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否开启邮件通知(0:否， 1:是)',
  `editor_model` tinyint(1) NOT NULL DEFAULT 0 COMMENT '编辑器模式，(0：富文本编辑器CKEditor，1：markdown编辑器Veditor)',
  `theme_color` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '#409EFF' COMMENT '主题颜色',
  `minio_end_point` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Minio远程连接地址',
  `minio_access_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Minio公钥',
  `minio_secret_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Minio私钥',
  `minio_bucket` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Minio桶',
  `upload_minio` tinyint(1) NOT NULL DEFAULT 0 COMMENT '图片是否上传Minio (0:否， 1：是)',
  `minio_picture_base_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Minio服务器文件域名前缀',
  `open_dashboard_notification` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否开启仪表盘通知(0:否， 1:是)',
  `dashboard_notification` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '仪表盘通知【用于首次登录弹框】',
  `content_picture_priority` tinyint(1) NOT NULL DEFAULT 0 COMMENT '博客详情图片显示优先级（ 0:本地  1: 七牛云 2: Minio）',
  `open_email_activate` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否开启用户邮件激活功能【0 关闭，1 开启】',
  `search_model` tinyint(1) NOT NULL DEFAULT 0 COMMENT '搜索模式【0:SQL搜索 、1：全文检索】',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_system_config
-- ----------------------------
INSERT INTO `t_system_config` VALUES ('37d492e35dc6e3fbb9dfedfd2079a123', 'QKD378sek_yRy0AlpWEzT_U_oni0SfrrxaP2lgWX', 'Vjh0zPBLrflxYn08YNIG4rkRYv7sqtlMccgd8QzL', '123456789@qq.com', NULL, '', NULL, '', 1, '2020-01-29 19:14:26', '2021-05-17 10:50:02', 'testmogublog', 'z2', '0', '1', '0', 'http://testimage.moguit.cn/', 'http://localhost:8600/', '1', 0, '#6E6EFE', 'http://101.132.122.175:8080', 'mogu2018', 'mogu2018', 'mogublog', 0, 'http://101.132.122.175:8080', 1, '<p>欢迎来到蘑菇博客项目，开源项目离不开大家的支持，希望小伙伴能随手点赞一下，你的点赞就是我维护的动力~</p>\n\n<p>项目源码：<a href=\"https://gitee.com/moxi159753/mogu_blog_v2\" target=\"_blank\">点我传送</a>&nbsp; ，&nbsp; 项目文档：<a href=\"http://moxi159753.gitee.io/mogu_blog_doc\" target=\"_blank\">点我传送</a>&nbsp; &nbsp; ，项目官网：<a href=\"http://www.moguit.cn/#/\" target=\"_blank\">点我传送</a>，&nbsp;学习笔记：<a href=\"https://gitee.com/moxi159753/LearningNotes\" target=\"_blank\">点我传送</a></p>\n\n<p>蘑菇博客使用了一些监控的Spring Cloud组件，并不一定都需要部署启动，可以根据自身服务器配置来启动</p>\n\n<p>最低配置：1核2G 【<code>需要开启虚拟内存</code>】</p>\n\n<p>推荐配置：2核4G 【双十一特惠】</p>\n\n<p>双11活动开始喽~，本次优惠力度非常大，如果有需求的，欢迎点击下面链接购买</p>\n\n<p>【阿里云】双十一拼团 2核4G3M 664元/3年（强烈推荐）&nbsp;<a href=\"http://a.aliyun.com/f1.l0DRK\"><span style=\"color:#0000ff\">点我进入</span></a></p>\n\n<p>【阿里云】云服务器双11狂欢特惠，1核2G 最低仅需84.97元/年&nbsp;<a href=\"https://www.aliyun.com/1111/home?userCode=w7aungxw\"><span style=\"color:#0000ff\">点我传送</span></a></p>\n\n<p>【腾讯云】双十一活动2核4G 100G盘700元/3年（老用户重新用微信QQ注册即可）<span style=\"color:#0000ff\">&nbsp;</span><a href=\"https://curl.qcloud.com/8Nfp3pRy\"><span style=\"color:#0000ff\">点我进入</span></a></p>\n\n<p><span style=\"color:#daa520\">tip：仪表盘通知可以在&nbsp; 系统配置 -&gt; 仪表盘通知&nbsp; 处进行关闭</span></p>\n', 0, 1, 0);

SET FOREIGN_KEY_CHECKS = 1;
