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

 Date: 18/01/2023 14:36:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_web_navbar
-- ----------------------------
DROP TABLE IF EXISTS `t_web_navbar`;
CREATE TABLE `t_web_navbar`  (
  `uid` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `navbar_level` tinyint(1) NULL DEFAULT NULL,
  `summary` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_uid` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_show` tinyint(1) NULL DEFAULT NULL,
  `is_jump_external_url` tinyint(1) NULL DEFAULT NULL,
  `sort` int(0) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_web_navbar
-- ----------------------------
INSERT INTO `t_web_navbar` VALUES ('e186d3225e1405a0ee73995347b1c239', '首页', 1, '首页', NULL, '/', 'el-icon-remove', 1, 0, 7, 1, '2021-02-23 13:17:30', '2021-02-23 17:05:31');
INSERT INTO `t_web_navbar` VALUES ('c3e10b3c8d576ed24387934d5d0c0b81', '关于我', 1, '关于我', NULL, '/about', 'el-icon-oldUser', 1, 0, 6, 1, '2021-02-23 13:18:43', '2021-02-23 18:06:14');
INSERT INTO `t_web_navbar` VALUES ('55bca78a37694c5a72b2910adde12d96', '归档', 1, '归档', NULL, '/sort', 'el-icon-camera', 1, 0, 5, 1, '2021-02-23 13:19:11', '2021-02-23 15:30:37');
INSERT INTO `t_web_navbar` VALUES ('abe6c960aa65fba7f728480fd933807f', '分类', 1, '博客分类', NULL, '/classify', 'el-icon-folder-checked', 1, 0, 4, 1, '2021-02-23 13:19:38', '2021-02-23 15:30:43');
INSERT INTO `t_web_navbar` VALUES ('0de9cfa4227c80530e43c534712156f5', '标签', 1, '博客标签', NULL, '/tag', 'el-icon-headset', 1, 0, 3, 1, '2021-02-23 13:20:01', '2021-02-23 15:30:47');
INSERT INTO `t_web_navbar` VALUES ('40277498960cfc2fb428c1ee4429676c', '专题', 1, '博客专题', NULL, '/subject', 'el-icon-data-analysis', 1, 0, 2, 1, '2021-02-23 13:20:22', '2021-02-23 15:30:50');
INSERT INTO `t_web_navbar` VALUES ('0d8a13137502ed28649888cfea40ee80', '留言板', 1, '留言板', NULL, '/messageBoard', 'el-icon-money', 1, 0, 1, 1, '2021-02-23 13:20:47', '2021-02-23 15:30:53');
INSERT INTO `t_web_navbar` VALUES ('94d59134ab64aac6d7994c80c6698f8a', '博客源码', 1, '博客源码', NULL, 'https://gitee.com/moxi159753/mogu_blog_v2', 'el-icon-zoom-in', 1, 1, 0, 1, '2021-02-23 18:07:24', '2021-02-27 13:05:34');
INSERT INTO `t_web_navbar` VALUES ('a26eb81119b47bb34f733c4c38432021', '博客详情', 1, '博客详情页', NULL, '/info', 'el-icon-oldUser', 0, 0, 0, 1, '2021-02-23 18:40:54', '2021-02-23 18:40:54');
INSERT INTO `t_web_navbar` VALUES ('7fb0684401ff99073c64dc956a9cb28a', '博客列表', 1, '博客列表', NULL, '/list', 'el-icon-picture-outline-round', 0, 0, 0, 1, '2021-02-23 18:57:19', '2021-02-23 18:57:19');
INSERT INTO `t_web_navbar` VALUES ('25bdfd2a854ea4af1bf1adcd676a711b', '学习笔记', 2, '学习笔记', '94d59134ab64aac6d7994c80c6698f8a', 'https://gitee.com/moxi159753/LearningNotes', 'el-icon-folder-opened', 1, 1, 0, 1, '2021-02-27 12:43:40', '2021-02-27 12:43:40');
INSERT INTO `t_web_navbar` VALUES ('51f9db7329ccd382255c01f4ef371108', '博客源码', 2, '蘑菇博客源码', '94d59134ab64aac6d7994c80c6698f8a', 'https://gitee.com/moxi159753/mogu_blog_v2', 'el-icon-tickets', 1, 1, 0, 1, '2021-02-27 13:06:13', '2021-02-27 13:06:13');

SET FOREIGN_KEY_CHECKS = 1;
