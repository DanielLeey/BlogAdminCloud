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

 Date: 02/02/2023 19:34:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_link
-- ----------------------------
DROP TABLE IF EXISTS `t_link`;
CREATE TABLE `t_link`  (
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一uid',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '友情链接标题',
  `summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '友情链接介绍',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '友情链接URL',
  `click_count` int(0) NULL DEFAULT 0 COMMENT '点击数',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `status` tinyint(0) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  `sort` int(0) NULL DEFAULT 0 COMMENT '排序字段，越大越靠前',
  `link_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '友链状态： 0 申请中， 1：已上线，  2：已下架',
  `user_uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请用户UID',
  `admin_uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作管理员UID',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站长邮箱',
  `file_uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网站图标',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '友情链接表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_link
-- ----------------------------
INSERT INTO `t_link` VALUES ('0236076a0f1e38e1777ab398d64340f7', '测试网站', '测试网站链接', 'http://www.baidu.com', 0, '2020-09-26 17:03:37', '2020-09-26 17:03:37', 1, 0, 0, '937f07cce6c570fe2e26b6a1ed359eaa', NULL, NULL, NULL);
INSERT INTO `t_link` VALUES ('0d39d0b33074d7fbd6a1826fafafb1ad', '蘑菇博客', '蘑菇博客', 'http://www.moguit.cn', 0, '2020-09-26 17:08:49', '2020-09-26 17:08:49', 1, 0, 0, '937f07cce6c570fe2e26b6a1ed359eaa', NULL, NULL, NULL);
INSERT INTO `t_link` VALUES ('1578d5662d91665adfe9003877d64141', '蘑菇博客', '蘑菇博客', 'http://moguit.cn', 0, '2020-11-09 09:22:58', '2020-11-09 09:22:58', 1, 0, 0, '5eb5257f707cad9c6f06a1e951ba2def', NULL, NULL, '17ce7d6c1a41299359293a23df1606c5');
INSERT INTO `t_link` VALUES ('2e8e9be41bea1330f4beb769a8b14602', '测试友链', '测试友链', 'http://www.baidu.com', 0, '2020-10-15 10:02:08', '2020-10-15 10:02:18', 0, 3, 1, NULL, NULL, NULL, NULL);
INSERT INTO `t_link` VALUES ('3b7e9d7a4d9f8c43c0043cd86a4c410b', '测试1', '测试1', 'http://url.com', 0, '2020-03-22 12:19:06', '2020-03-22 12:19:06', 0, 2, 1, NULL, NULL, NULL, NULL);
INSERT INTO `t_link` VALUES ('49d45433d874836fd01130786b755b5d', '234', '234', 'http://www.baidu.com', 0, '2020-08-02 18:55:43', '2020-08-02 18:55:43', 1, 0, 0, 'c52cd5e4c14cc33cd5a8b60e6f610f40', NULL, NULL, NULL);
INSERT INTO `t_link` VALUES ('5217d7212f9d487eab13deadca961402', '博客Gitee', '蘑菇博客Gitee', 'https://gitee.com/moxi159753/mogu_blog_v2', 25, '2018-12-17 02:25:11', '2021-02-23 18:22:48', 1, 0, 1, NULL, NULL, NULL, NULL);
INSERT INTO `t_link` VALUES ('6195e13f6272e61da6c7a2c481bd9a6e', '1', '1', 'http://www.baidu.com', 0, '2020-03-20 11:33:42', '2020-03-20 11:33:42', 0, 0, 1, NULL, NULL, NULL, NULL);
INSERT INTO `t_link` VALUES ('6bfeefb34f8114fbd2d029c02a805aea', '小小蘑菇', '小小蘑菇', 'http://www.moguit.cn', 1, '2021-01-18 12:28:50', '2021-01-24 09:25:03', 1, 0, 1, NULL, NULL, '1595833114@qq.com', NULL);
INSERT INTO `t_link` VALUES ('796f61499bdfe41960484f5bd063ac81', '蘑菇大屋', '蘑菇大屋', 'http://moguit.cn', 0, '2020-09-26 17:16:39', '2021-03-11 18:57:56', 1, 0, 1, '937f07cce6c570fe2e26b6a1ed359eaa', NULL, '1595833114@qq.com', 'd74b8b6a03b4ae43f20641d9b4c2836a');
INSERT INTO `t_link` VALUES ('8eff079bd3857879daf8401c52d4a2de', '博客Github', '蘑菇博客Github', 'https://github.com/moxi624/mogu_blog_v2', 8, '2019-12-06 20:50:05', '2021-01-24 09:24:59', 1, 1, 1, NULL, NULL, '1595833114@qq.com', '85d825a9be2c777da525d95a029e108c');
INSERT INTO `t_link` VALUES ('a2086067fe13f178f8cce3a4e87f9999', '蘑菇博客', '蘑菇博客', 'http://www.moguit.cn', 0, '2020-04-29 16:40:37', '2020-04-29 16:40:37', 1, 0, 0, '4db79e551d0dda06cfcf6ae39107711c', NULL, NULL, NULL);
INSERT INTO `t_link` VALUES ('b8b0e6c4967601bd4dec671d369845c8', '我是友链', '我是友链', 'http://www.baidu.com', 0, '2020-09-26 15:50:02', '2020-09-26 15:53:28', 1, 0, 1, NULL, NULL, NULL, '528885a01dcb22fa0d60eac19ccd70f8');
INSERT INTO `t_link` VALUES ('b9e22b94688fc8ac2dbada2f9e342117', '测试', '测试', 'http://www.baidu.com', 0, '2020-08-02 18:56:40', '2020-11-09 09:23:23', 0, 0, 0, 'c52cd5e4c14cc33cd5a8b60e6f610f40', NULL, NULL, NULL);
INSERT INTO `t_link` VALUES ('bcad571e9c1976af96b793d8aaee7991', '测试', '测试', '测试', 0, '2020-08-02 18:46:13', '2020-08-02 18:51:48', 0, 0, 0, 'c52cd5e4c14cc33cd5a8b60e6f610f40', NULL, NULL, NULL);
INSERT INTO `t_link` VALUES ('d0a5e434f9f06da3e0d0f1ceb4160070', '蘑菇博客', '蘑菇博客', 'http://image.moguit.cn/favicon.png', 0, '2020-03-15 11:43:18', '2020-03-15 11:43:18', 1, 0, 1, '25675d78f11749d4edaf15e36d046e3b', NULL, NULL, NULL);
INSERT INTO `t_link` VALUES ('da30eaf680ed626431dd14b8eb07a0c6', '蘑菇博客', '蘑菇博客', NULL, 0, '2020-03-15 11:01:46', '2020-03-15 11:01:46', 0, 0, 0, '25675d78f11749d4edaf15e36d046e3b', NULL, NULL, NULL);
INSERT INTO `t_link` VALUES ('dcc01149be71492dabd55821c22f6061', 'Mybatis-plus', 'MyBatis-Plus 为简化开发而生', 'http://mp.baomidou.com/', 12, '2018-09-27 02:52:58', '2018-09-27 02:52:58', 1, 0, 1, NULL, NULL, NULL, NULL);
INSERT INTO `t_link` VALUES ('f8aefec9bf4cb9d7af0c42290905f254', '蘑菇小屋', '蘑菇小屋', 'http://www.moguit.cn', 0, '2021-01-18 12:10:24', '2021-01-18 12:10:24', 1, 0, 1, NULL, NULL, '159583311@qq.com', NULL);

SET FOREIGN_KEY_CHECKS = 1;
