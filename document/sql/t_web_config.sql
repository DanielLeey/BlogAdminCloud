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

 Date: 17/01/2023 10:07:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_web_config
-- ----------------------------
DROP TABLE IF EXISTS `t_web_config`;
CREATE TABLE `t_web_config`  (
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'logo(文件UID)',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站名称',
  `summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '介绍',
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键字',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
  `record_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备案号',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `ali_pay` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝收款码FileId',
  `weixin_pay` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信收款码FileId',
  `github` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'github地址',
  `gitee` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'gitee地址',
  `qq_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ号',
  `qq_group` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ群',
  `we_chat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信号',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `show_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示的列表（用于控制邮箱、QQ、QQ群、Github、Gitee、微信是否显示在前端）',
  `login_type_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录方式列表（用于控制前端登录方式，如账号密码,码云,Github,QQ,微信）',
  `open_comment` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否开启评论(0:否 1:是)',
  `open_mobile_comment` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否开启移动端评论(0:否， 1:是)',
  `open_admiration` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否开启赞赏(0:否， 1:是)',
  `open_mobile_admiration` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否开启移动端赞赏(0:否， 1:是)',
  `link_apply_template` varchar(2018) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '友链申请模板,添加友链申请模板格式',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_web_config
-- ----------------------------
INSERT INTO `t_web_config` VALUES ('a331e4933cf54afcbb8c0cb11ec0830e', 'd884eddbadadf48ac6b98afc723d6660', '蘑菇博客', '一个专注于技术分享的博客平台，大家以共同学习，乐于分享，拥抱开源的价值观进行学习交流', '\"蘑菇博客,蘑菇社区,蘑菇技术社区,,蘑菇IT社区,IT社区,技术社区,Java技术分享,Spring教程,开发者社区', '陌溪', '赣ICP备18014504号', 1, '2018-11-17 08:15:27', '2021-05-17 10:55:56', '一个专注于技术分享的博客平台', '5e4365f45a4708e17f2fe300d3279bf5', '6d83d6146896f9f27f07404fbb05c90f', 'https://github.com/moxi624', 'https://gitee.com/moxi159753', '1595833114', '337209342', '', '1595833114@qq.com', '[\"1\",\"2\",\"3\",\"4\",\"5\"]', '[\"3\",\"4\",\"2\",\"1\",\"5\"]', '1', 0, 1, 0, '<p>请确定贵站可以稳定运营</p>\n\n<p>原创博客优先，技术类博客优先</p>\n\n<p>申请前请先添加下方蘑菇博客友链</p>\n\n<p>欢迎各位小伙伴一起互换友链~</p>\n\n<p>&nbsp;</p>\n\n<p>网站名称：蘑菇博客</p>\n\n<p>网站LOGO：<a href=\"http://localhost:8600//blog/admin/png/2020/6/17/1592358046468.png\" target=\"_blank\">点击查看</a></p>\n\n<p>网站简介：一个专注于技术分享的博客平台</p>\n\n<p>网站地址：http://localhost:9527</p>\n');

SET FOREIGN_KEY_CHECKS = 1;
