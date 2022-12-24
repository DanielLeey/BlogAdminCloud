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

 Date: 24/12/2022 17:36:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag`  (
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一uid',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签内容',
  `status` tinyint(0) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  `click_count` int(0) NULL DEFAULT 0 COMMENT '标签简介',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `sort` int(0) NULL DEFAULT 0 COMMENT '排序字段，越大越靠前',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_tag
-- ----------------------------
INSERT INTO `t_tag` VALUES ('0b51c75ed5744cdcadefe0ad947be9b6', '数据库', 1, 78, '2020-10-13 10:01:00', '2020-12-26 11:24:33', 0);
INSERT INTO `t_tag` VALUES ('15721a34adba068763b5a2fb1991fc57', 'JVM', 1, 33, '2020-10-13 10:01:00', '2021-01-24 10:00:58', 3);
INSERT INTO `t_tag` VALUES ('188396dc0efcae369856fe472df1ed09', '标签2', 0, 0, '2020-10-13 10:01:10', '2020-10-13 10:01:15', 6);
INSERT INTO `t_tag` VALUES ('1c76b9848f5f4d71a5e88b20dbaf38f4', 'RabbitMQ', 1, 106, '2020-10-13 10:01:00', '2020-12-26 11:24:33', 0);
INSERT INTO `t_tag` VALUES ('1d1fd6d26c8e40a38637ef6126c45cd0', 'Linux', 1, 336, '2020-10-13 10:01:00', '2020-10-13 10:01:03', 1);
INSERT INTO `t_tag` VALUES ('2a31dd6c2b1b464e9e222a1198bc739a', '虚拟机', 1, 58, '2020-10-13 10:01:00', '2020-12-26 11:24:34', 0);
INSERT INTO `t_tag` VALUES ('2f5779e877da48958c985d69b311d0d6', '大数据', 1, 72, '2020-10-13 10:01:00', '2020-12-26 11:24:34', 0);
INSERT INTO `t_tag` VALUES ('3c16b9093e9b1bfddbdfcb599b23d835', 'Nginx', 1, 32, '2020-10-13 10:01:00', '2020-12-26 11:24:36', 0);
INSERT INTO `t_tag` VALUES ('53c5a0f3142e4f54820315936f78383b', 'Spring Boot', 1, 73, '2020-10-13 10:01:00', '2020-12-26 11:24:35', 0);
INSERT INTO `t_tag` VALUES ('5626932d452c2ad863d9b3cb0b69d22d', '学习笔记', 1, 237, '2020-10-13 10:01:00', '2021-06-13 07:48:23', 5);
INSERT INTO `t_tag` VALUES ('5c939107ddb746b989156737805df625', '机器学习', 1, 109, '2020-10-13 10:01:00', '2020-10-13 10:01:03', 0);
INSERT INTO `t_tag` VALUES ('618346963de0fc724e44c6f9120aea9c', 'Github', 1, 17, '2020-10-13 10:01:00', '2020-10-13 10:01:03', 0);
INSERT INTO `t_tag` VALUES ('6d35ddd5075f4c0e885ffb2e3b3a0365', 'Tomcat', 1, 58, '2020-10-13 10:01:00', '2020-10-13 10:01:03', 0);
INSERT INTO `t_tag` VALUES ('7e0e93ea6cdb44ae92e58f48e6496ed7', 'Java', 1, 1644, '2020-10-13 10:01:00', '2021-06-13 07:47:58', 4);
INSERT INTO `t_tag` VALUES ('8c9d43de144245eb8176854eca5ae244', 'AI', 1, 20, '2020-10-13 10:01:00', '2020-10-13 10:01:03', 0);
INSERT INTO `t_tag` VALUES ('8d5ce3e0c0784b95adb7f9e7b76dca93', '建站系统', 1, 100, '2020-10-13 10:01:00', '2020-10-13 10:01:03', 0);
INSERT INTO `t_tag` VALUES ('a9a747d944c24845815356f72723ef8e', '前端开发', 1, 114, '2020-10-13 10:01:00', '2020-10-13 10:01:03', 0);
INSERT INTO `t_tag` VALUES ('b22b9bdc32a442dd65dee82cdc5cf800', '计算机网络', 1, 16, '2020-10-13 10:01:00', '2020-10-13 10:01:03', 0);
INSERT INTO `t_tag` VALUES ('ca928e8718654aa5a802e2f69277b137', '面试', 1, 193, '2020-10-13 10:01:00', '2020-10-13 10:01:03', 0);
INSERT INTO `t_tag` VALUES ('d3c3fc43f38445389c970ff0732a6586', 'NLP', 1, 39, '2020-10-13 10:01:00', '2020-10-13 10:01:03', 0);
INSERT INTO `t_tag` VALUES ('dececd440fdc4fa28dffe6404e696dd4', 'Python', 1, 19, '2020-10-13 10:01:00', '2020-10-13 10:01:03', 0);
INSERT INTO `t_tag` VALUES ('e2c7913050cf4ab9aa92902316aaf075', '校园生活', 1, 169, '2020-10-13 10:01:00', '2020-10-13 10:01:03', 0);
INSERT INTO `t_tag` VALUES ('e81bc2dca42c4031be7d66fef4a71e16', 'Spring Cloud', 1, 110, '2020-10-13 10:01:00', '2020-12-26 11:24:32', 2);
INSERT INTO `t_tag` VALUES ('ebf63989f11741bc89494c52fc6bae4c', 'Docker', 1, 96, '2020-10-13 10:01:00', '2020-10-13 10:01:03', 0);
INSERT INTO `t_tag` VALUES ('f5d458db6a044eaebc22232efa1e3b54', '深度学习', 1, 66, '2020-10-13 10:01:00', '2020-10-13 10:01:03', 0);
INSERT INTO `t_tag` VALUES ('f90d3c2fd9434302951130e897a89164', 'Vue', 1, 90, '2020-10-13 10:01:00', '2020-10-13 10:01:03', 0);
INSERT INTO `t_tag` VALUES ('fb72516226474cf0bfa0f310bfa75426', 'Redis', 1, 61, '2020-10-13 10:01:00', '2020-10-13 10:01:03', 0);

SET FOREIGN_KEY_CHECKS = 1;
