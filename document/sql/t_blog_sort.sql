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

 Date: 24/12/2022 16:42:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_blog_sort
-- ----------------------------
DROP TABLE IF EXISTS `t_blog_sort`;
CREATE TABLE `t_blog_sort`  (
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一uid',
  `sort_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类内容',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类简介',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `status` tinyint(0) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  `sort` int(0) NULL DEFAULT 0 COMMENT '排序字段，越大越靠前',
  `click_count` int(0) NULL DEFAULT 0 COMMENT '点击数',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '博客分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_blog_sort
-- ----------------------------
INSERT INTO `t_blog_sort` VALUES ('01b604bb1be10b32847f6fc64e1111bf', '测试2', '测试2', '2020-10-13 10:00:44', '2020-10-13 10:00:52', 0, 0, 0);
INSERT INTO `t_blog_sort` VALUES ('029d80ba36a04c96a89a80e2705031a2', '测试分类', '测试分类', '2019-01-11 21:10:43', '2019-01-11 21:10:43', 0, 0, 0);
INSERT INTO `t_blog_sort` VALUES ('043e2062e18497fc283d30657e800dac', 'JVM', 'Java虚拟机', '2020-03-10 07:28:04', '2020-03-10 07:28:04', 0, 0, 0);
INSERT INTO `t_blog_sort` VALUES ('093d8bdd01c84890a928e923d5c235fe', '软件推荐', '软件推荐', '2018-09-25 16:14:59', '2020-10-13 10:00:23', 1, 0, 5);
INSERT INTO `t_blog_sort` VALUES ('2c93dfab0e754006866f8ed486923a41', '慢生活', '慢生活，不是懒惰，放慢速度不是拖延时间，而是让我们在生活中寻找到平衡', '2018-09-25 15:29:33', '2020-10-13 10:00:23', 1, 0, 19);
INSERT INTO `t_blog_sort` VALUES ('337806254f9c42999043de5c5ee09e77', '技术新闻', '发现世界的每一天', '2018-12-30 10:42:11', '2020-10-13 10:00:23', 1, 0, 58);
INSERT INTO `t_blog_sort` VALUES ('9d2019983d91490aaa758eddd7c07caf', '机器学习', '机器学习', '2018-11-22 20:56:02', '2020-10-13 10:00:23', 1, 0, 3);
INSERT INTO `t_blog_sort` VALUES ('a03d7290b1c04b6eaf46659661b47032', '后端开发', '后端开发专题', '2018-12-30 10:35:43', '2020-10-13 10:00:23', 1, 6, 362);
INSERT INTO `t_blog_sort` VALUES ('ca28ffc94ea94fbda5571e0b242021e2', '前端开发', '前端开发专题', '2018-12-30 10:35:58', '2020-10-13 10:00:23', 1, 0, 56);
INSERT INTO `t_blog_sort` VALUES ('db0d64ea7df409de5d2d747927cfa1a5', '学习笔记', '学习笔记', '2019-08-31 09:50:03', '2020-10-13 10:00:23', 1, 3, 111);
INSERT INTO `t_blog_sort` VALUES ('e4ccfe610a5d59538836ddbf4dcb31c7', '分类名称', '分类介绍', '2020-10-13 10:00:08', '2020-10-13 10:00:14', 0, 0, 0);
INSERT INTO `t_blog_sort` VALUES ('e60df954efcd47c48463a504bb70bbe9', '面试', '面试专题', '2018-12-20 21:16:30', '2020-10-13 10:00:23', 1, 0, 43);

SET FOREIGN_KEY_CHECKS = 1;
