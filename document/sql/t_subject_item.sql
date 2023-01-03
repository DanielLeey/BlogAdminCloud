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

 Date: 30/12/2022 16:16:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_subject_item
-- ----------------------------
DROP TABLE IF EXISTS `t_subject_item`;
CREATE TABLE `t_subject_item`  (
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `subject_uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '专题uid',
  `blog_uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '博客uid',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态',
  `sort` int(0) NOT NULL DEFAULT 0 COMMENT '排序字段',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题Item表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_subject_item
-- ----------------------------
INSERT INTO `t_subject_item` VALUES ('12028222cea8e1543f99dd8482bdbf66', '7eca5f77f692078824572f7a7d3a45f2', '7135efc7f536769efd0d0483c687ba07', 1, 7, '2020-11-01 15:45:14', '2020-12-31 20:07:23');
INSERT INTO `t_subject_item` VALUES ('130065b278652653d52c104afc30c8b0', '7eca5f77f692078824572f7a7d3a45f2', '062ca3475e8193a4a81853a4bf41a8fa', 1, 2, '2020-11-01 15:45:14', '2020-12-31 20:07:23');
INSERT INTO `t_subject_item` VALUES ('2a9fdb7658d48d9b8756f93d95a5e29a', '199b78b4bbf7c8d6bab290f1e30e3507', '1e2164300cef164a0c7d8738bfcb441f', 1, 2, '2020-12-08 21:18:54', '2020-12-08 21:50:42');
INSERT INTO `t_subject_item` VALUES ('3a26e109f7a1dc08ee01c291c16ce864', '7eca5f77f692078824572f7a7d3a45f2', '9fa1fcd046b6cddb67c7859d050aeecd', 1, 4, '2020-11-01 15:45:14', '2020-12-31 20:07:23');
INSERT INTO `t_subject_item` VALUES ('4da924dc6ec5e7d3203d9cc9647d5b0a', '7eca5f77f692078824572f7a7d3a45f2', '80d3eae77c16cea10e119b9f1a1da4c8', 1, 6, '2020-10-11 16:35:22', '2020-12-31 20:07:23');
INSERT INTO `t_subject_item` VALUES ('4f305449bf0eba3bfc5b78e378865aab', '026b7d3453ff74d3d6a31a10abc39a48', '80d3eae77c16cea10e119b9f1a1da4c8', 1, 1, '2020-09-04 14:53:02', '2020-12-08 21:51:02');
INSERT INTO `t_subject_item` VALUES ('7005b920cd3131768b54518f9d80d613', '7eca5f77f692078824572f7a7d3a45f2', '11e0cace2148383e201439a682432d59', 1, 9, '2020-11-01 15:45:14', '2020-12-31 20:07:23');
INSERT INTO `t_subject_item` VALUES ('7a8106f2a213995beec8f0d17f69d1ae', '13e64cddf5efc221dfba1986cd049ad8', '7a7ad19472d53147150eb7fdb0978bb2', 1, 4, '2020-10-07 16:35:42', '2020-12-08 20:52:56');
INSERT INTO `t_subject_item` VALUES ('82e0fb0e5b5451a37c70f16af717ed29', '7eca5f77f692078824572f7a7d3a45f2', '9d7a6531cd55f415a0b26712f6fecc7a', 1, 10, '2020-11-01 15:45:14', '2020-12-31 20:07:23');
INSERT INTO `t_subject_item` VALUES ('84cad2f6adae4533f4efee8e1dd8e1c2', '199b78b4bbf7c8d6bab290f1e30e3507', '31ba99fe46e0bddb4db1e50ed97fcf22', 1, 1, '2020-12-08 21:18:54', '2020-12-08 21:50:42');
INSERT INTO `t_subject_item` VALUES ('9065cfb24b5d04b54a6d8056e4bb73ef', '7eca5f77f692078824572f7a7d3a45f2', 'c58083675437f407d73d3322ca01b995', 1, 3, '2020-11-01 15:45:14', '2020-12-31 20:07:23');
INSERT INTO `t_subject_item` VALUES ('9fa99d2d288f3d236ab75931a62945c9', '199b78b4bbf7c8d6bab290f1e30e3507', 'f941246ea08539af0f9c068323b76e44', 1, 3, '2020-12-08 21:18:54', '2020-12-08 21:50:42');
INSERT INTO `t_subject_item` VALUES ('a6bb817a4338014a3c4bcc6f65615dea', '7eca5f77f692078824572f7a7d3a45f2', '635fc430e3378403a7d3f1e2a4e726a9', 1, 1, '2020-11-01 15:45:14', '2020-12-31 20:07:23');
INSERT INTO `t_subject_item` VALUES ('b5437af7ae1bc21b50bb2876d449bdfb', '7eca5f77f692078824572f7a7d3a45f2', '7a7ad19472d53147150eb7fdb0978bb2', 1, 5, '2020-10-11 16:35:22', '2020-12-31 20:07:23');
INSERT INTO `t_subject_item` VALUES ('cf108ab9e61de1c2ec0486bddfdac9e1', '7eca5f77f692078824572f7a7d3a45f2', '8dc52bd61e36fa56cfc7699815375572', 1, 8, '2020-11-01 15:45:14', '2020-12-31 20:07:23');
INSERT INTO `t_subject_item` VALUES ('de8ea588b0601465d1afb68672463b19', '136b547482b8734840cfaacb639e2496', '7a7ad19472d53147150eb7fdb0978bb2', 1, 9, '2020-10-13 08:35:01', '2020-12-08 20:52:56');
INSERT INTO `t_subject_item` VALUES ('dfa84fb363d659bf0416553aff3cb6db', '136b547482b8734840cfaacb639e2496', '80d3eae77c16cea10e119b9f1a1da4c8', 1, 10, '2020-10-13 08:35:01', '2020-12-08 20:52:56');
INSERT INTO `t_subject_item` VALUES ('f104aacfb7485784d42956705da452ea', '026b7d3453ff74d3d6a31a10abc39a48', '7a7ad19472d53147150eb7fdb0978bb2', 1, 2, '2020-09-04 14:53:02', '2020-12-08 21:51:02');
INSERT INTO `t_subject_item` VALUES ('f9104455cdece248058a4dd90d336dda', '13e64cddf5efc221dfba1986cd049ad8', '80d3eae77c16cea10e119b9f1a1da4c8', 1, 3, '2020-10-07 16:35:42', '2020-12-08 20:52:56');

SET FOREIGN_KEY_CHECKS = 1;
