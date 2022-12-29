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

 Date: 29/12/2022 17:03:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_subject
-- ----------------------------
DROP TABLE IF EXISTS `t_subject`;
CREATE TABLE `t_subject`  (
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `subject_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专题名称',
  `summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `file_uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面图片UID',
  `click_count` int(0) NOT NULL DEFAULT 0 COMMENT '专题点击数',
  `collect_count` int(0) NOT NULL DEFAULT 0 COMMENT '专题收藏数',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态',
  `sort` int(0) NOT NULL DEFAULT 0 COMMENT '排序字段',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_subject
-- ----------------------------
INSERT INTO `t_subject` VALUES ('026b7d3453ff74d3d6a31a10abc39a48', 'Java学习笔记', '测试简介', '3dab9866f9ac1867d3845918d4b5b748', 0, 0, 1, 0, '2020-08-23 08:59:17', '2020-08-23 15:13:31');
INSERT INTO `t_subject` VALUES ('136b547482b8734840cfaacb639e2496', '专题管理15', '专题管理15', 'd2424afcd30ca070d43930d0257097ad', 0, 0, 1, 0, '2020-08-23 15:57:20', '2020-08-23 15:57:20');
INSERT INTO `t_subject` VALUES ('13e64cddf5efc221dfba1986cd049ad8', '专题管理11', '专题管理11', '9e2bbd54326312f3f88e6260a46aafc3', 0, 0, 1, 0, '2020-08-23 15:55:58', '2020-08-23 15:55:58');
INSERT INTO `t_subject` VALUES ('199b78b4bbf7c8d6bab290f1e30e3507', '专题4介绍', '专题4介绍', 'dca06b7785df4434091e70a0527fd9a4', 0, 0, 1, 0, '2020-08-31 08:25:17', '2020-08-31 08:25:17');
INSERT INTO `t_subject` VALUES ('1a520cc46876d0e47c4af403f5ff318b', '专题管理6', '专题管理6', '3093e537759b2bddff896fb37d5c242f', 0, 0, 1, 0, '2020-08-23 15:54:39', '2020-08-23 15:54:39');
INSERT INTO `t_subject` VALUES ('1c71beeab364d1dfdf7f0cf5edafb0c5', '专题管理5', '专题管理5', '71a7bc29602e467e1d1b66a59d37c3a2', 0, 0, 1, 0, '2020-08-23 15:54:28', '2020-08-23 15:54:28');
INSERT INTO `t_subject` VALUES ('21315371525ad12a991922329f205d5b', '专题管理10', '专题管理10', '812a22ce7a91495497521174577eb206', 0, 0, 0, 0, '2020-08-23 15:55:47', '2020-12-26 16:57:58');
INSERT INTO `t_subject` VALUES ('34bdc099224854aa3b9df4ffe56100fe', '专题管理18', '专题管理18', 'c1d5bb9da6c0fe593d57ba95a1c7f3d8', 0, 0, 0, 0, '2020-08-23 15:58:06', '2020-12-26 10:58:48');
INSERT INTO `t_subject` VALUES ('4488ba98b5ace6a837a1ecc244b6a2df', '测试专题2', '测试专题2', 'c1d5bb9da6c0fe593d57ba95a1c7f3d8', 0, 0, 0, 0, '2020-08-23 15:37:59', '2020-12-26 10:55:38');
INSERT INTO `t_subject` VALUES ('448f45e5432689ba706587aa759125d6', '专题管理3', '专题管理3', '828227a0f1c736ea393fa4a747b1c5d9', 0, 0, 0, 0, '2020-08-23 15:54:06', '2020-12-26 10:58:48');
INSERT INTO `t_subject` VALUES ('58a6150e6d8bd5df877dee8d82fffc4d', '测试图片2', '测试图片2', 'cc9952f52c84dfa51d74ee35a1dc5367', 0, 0, 0, 0, '2020-09-15 20:26:18', '2020-12-26 10:58:48');
INSERT INTO `t_subject` VALUES ('615131f559b437909fefa86b21883f30', '专题管理17', '专题管理17', '1739543a3739e18c934b8182e2c93d4e', 0, 0, 0, 0, '2020-08-23 15:57:44', '2020-12-26 10:58:48');
INSERT INTO `t_subject` VALUES ('6c9db5a10516afe8035a445d1172fd01', '专题管理4', '专题管理4', 'ffe1c088d99304a0c3e40e8421ccffbd', 0, 0, 0, 0, '2020-08-23 15:54:18', '2020-08-31 08:19:59');
INSERT INTO `t_subject` VALUES ('758a106b566a4799e2f0b24f52b35bdb', '专题管理14', '专题管理14', 'b7cc599479588334b7e799656478b425', 0, 0, 0, 0, '2020-08-23 15:56:53', '2020-12-26 10:58:48');
INSERT INTO `t_subject` VALUES ('7eca5f77f692078824572f7a7d3a45f2', '专题管理13', '专题管理13', '828227a0f1c736ea393fa4a747b1c5d9', 0, 0, 1, 1, '2020-08-23 15:56:41', '2020-09-04 09:16:17');
INSERT INTO `t_subject` VALUES ('92b43c5787fd23424b567830fdbce6b8', '专题管理9', '专题管理9', 'd5e23b87e356018488853df17e027670', 0, 0, 0, 0, '2020-08-23 15:55:38', '2020-12-26 10:58:48');
INSERT INTO `t_subject` VALUES ('b9a9ec4db002857a98c5090a18109225', '专题管理7', '专题管理7', 'e1ac4c3e2b1816ce6ed46319143400dc', 0, 0, 0, 0, '2020-08-23 15:54:49', '2020-12-26 10:58:48');
INSERT INTO `t_subject` VALUES ('d9325e8af33baead15ff318a12fa790d', '123', '123', 'cc9952f52c84dfa51d74ee35a1dc5367', 0, 0, 0, 0, '2020-09-15 20:26:34', '2020-12-26 10:58:48');
INSERT INTO `t_subject` VALUES ('db235c13e4fd66356e38c4b9f874c78a', '测试测试', NULL, '2f84fab3b2ef5fa75206c596514d9004', 0, 0, 0, 0, '2020-10-07 16:27:03', '2020-12-26 16:57:58');
INSERT INTO `t_subject` VALUES ('e57ab21562973029e0324476948511f5', '专题管理8', '专题管理8', 'ee5fd755a6f28df835361c005d0b867b', 0, 0, 1, 0, '2020-08-23 15:55:30', '2020-08-23 15:55:30');
INSERT INTO `t_subject` VALUES ('f256e3a37941d998d8371798c1dff3fd', '专题管理16', '专题管理16', 'b9d6793bfcea4da7d67274cda673e136', 0, 0, 1, 0, '2020-08-23 15:57:31', '2020-08-23 15:57:31');
INSERT INTO `t_subject` VALUES ('ffb9f021c6822e16277fcb952c2adc26', '专题管理19', '专题管理19', '3dab9866f9ac1867d3845918d4b5b748', 0, 0, 1, 0, '2020-08-23 15:58:14', '2020-08-23 15:58:14');
INSERT INTO `t_subject` VALUES ('ffd65140d630f6355a033a213bf0197b', '专题管理12', '专题管理12', '3093e537759b2bddff896fb37d5c242f', 0, 0, 1, 0, '2020-08-23 15:56:27', '2020-08-23 15:56:27');

SET FOREIGN_KEY_CHECKS = 1;
