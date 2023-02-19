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

 Date: 16/02/2023 19:13:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一uid',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `gender` tinyint(0) UNSIGNED NULL DEFAULT NULL COMMENT '性别(1:男2:女)',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人头像',
  `email` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `birthday` date NULL DEFAULT NULL COMMENT '出生年月日',
  `mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `valid_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱验证码',
  `summary` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自我简介最多150字',
  `login_count` int(0) UNSIGNED NULL DEFAULT 0 COMMENT '登录次数',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '127.0.0.1' COMMENT '最后登录IP',
  `status` tinyint(0) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资料来源',
  `uuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台uuid',
  `qq_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ号',
  `we_chat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信号',
  `occupation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业',
  `comment_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '评论状态 1:正常 0:禁言',
  `ip_source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip来源',
  `browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览器',
  `os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `start_email_notification` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否开启邮件通知 1:开启 0:关闭',
  `user_tag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '用户标签：0：普通用户，1：管理员，2：博主 等',
  `loading_valid` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否通过加载校验【0 未通过，1 已通过】',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('3124514bff8a925fc77a5828a9ebcdbd', 'mogu2023', 'af19a7dce862a97914f27aa4981c721e', NULL, NULL, 'xzx199950624@qq.com', NULL, NULL, NULL, NULL, 0, NULL, '0:0:0:0:0:0:0:1', 0, '2021-04-09 18:48:24', '2021-04-09 19:08:34', 'mogu2023', 'MOGU', NULL, NULL, NULL, NULL, 1, NULL, 'Chrome-88.0.4324.190', 'Windows', 0, 0, 0);
INSERT INTO `t_user` VALUES ('4a8fd47742b7c10b07b3ef0c7da07bb7', 'moguBlog_GITEE_6530827', '972d768bb099b1de8fd2362275256fac', 0, '42330749ebfd7328be9e05cb9ba14f26', NULL, NULL, NULL, '36aa9ecc134bb2573f4e6550e7d671f2', NULL, 0, '2021-03-04 19:05:00', '192.168.12.1', 1, '2021-03-04 19:05:00', '2021-03-04 19:05:00', '陌溪', 'GITEE', '6530827', NULL, NULL, NULL, 1, '内网IP|内网IP', 'Chrome-88.0.4324.190', 'Windows', 0, 0, 0);
INSERT INTO `t_user` VALUES ('a8f8248f6ad406300390b2c6fee472a9', 'mogu2021', 'c5dea93b3377f5a40245f518505ab479', 1, NULL, 'xzx19950624@qq.com', NULL, NULL, NULL, NULL, 0, '2021-03-25 09:59:52', '0:0:0:0:0:0:0:1', 1, '2021-03-16 20:03:27', '2021-03-25 09:59:52', 'mogu2021', 'MOGU', NULL, NULL, NULL, NULL, 1, NULL, 'Chrome-88.0.4324.190', 'Windows', 0, 0, 0);
INSERT INTO `t_user` VALUES ('b486735e7b914e366840d01f049306e4', 'mogu2018', '972d768bb099b1de8fd2362275256fac', NULL, '751cb073fed6be9721dfe6cc74decfc5', '1595833114@qq.com', NULL, NULL, NULL, '发的说法付付付付付付付打发斯蒂芬', 0, '2021-04-10 08:50:42', '0:0:0:0:0:0:0:1', 1, '2020-11-14 16:35:16', '2021-04-10 08:50:42', 'mogu2018', 'MOGU', NULL, NULL, NULL, NULL, 1, NULL, 'Chrome-88.0.4324.190', 'Windows', 0, 0, 0);
INSERT INTO `t_user` VALUES ('f6ac7f1cee33a0c4652a7396a1767368', 'mogu2022', '402bd8a798ba87a4fc28f0c092daed23', NULL, 'c6496c24b9bee1dfc2dfcc1744cc31ec', '123456789@qq.com', NULL, NULL, NULL, NULL, 0, '2021-04-09 18:37:59', '0:0:0:0:0:0:0:1', 1, '2021-04-09 18:37:51', '2021-04-09 18:38:43', 'mogu2022', 'MOGU', NULL, NULL, NULL, NULL, 1, NULL, 'Chrome-88.0.4324.190', 'Windows', 0, 0, 0);

SET FOREIGN_KEY_CHECKS = 1;
