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

 Date: 21/01/2023 10:17:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_feedback
-- ----------------------------
DROP TABLE IF EXISTS `t_feedback`;
CREATE TABLE `t_feedback`  (
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一uid',
  `user_uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户uid',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '反馈的内容',
  `status` tinyint(0) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `feedback_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '反馈状态： 0：已开启  1：进行中  2：已完成  3：已拒绝',
  `reply` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复',
  `admin_uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员uid',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '反馈表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_feedback
-- ----------------------------
INSERT INTO `t_feedback` VALUES ('0bbf6e7bf53472545fb7ce09fa104118', '4db79e551d0dda06cfcf6ae39107711c', '最新反馈3', 1, '2020-04-29 15:14:15', '2020-04-29 15:14:14', '最新反馈3', 0, NULL, NULL);
INSERT INTO `t_feedback` VALUES ('2de8a7b6f0aab0623eae94e669293179', '4db79e551d0dda06cfcf6ae39107711c', '测试反馈内容', 0, '2020-04-28 09:35:38', '2020-12-04 16:05:28', '测试反馈', 0, NULL, '1f01cd1d2f474743b241d74008b12333');
INSERT INTO `t_feedback` VALUES ('46a6ea47dc0a50d742dfb45eabf11702', '4db79e551d0dda06cfcf6ae39107711c', '增加反馈2', 1, '2020-04-29 13:21:24', '2020-04-29 13:21:24', '测试反馈2', 0, NULL, NULL);
INSERT INTO `t_feedback` VALUES ('5217d7212f9d487eab13deadca961405', '25675d78f11749d4edaf15e36d046e3b', '一个BUG', 0, '2020-03-16 09:31:46', '2020-03-16 09:31:46', '一个BUG', 0, '我是回复', '1f01cd1d2f474743b241d74008b12333');
INSERT INTO `t_feedback` VALUES ('64d2e894d22ffeaa2f41755a4a8d5e88', '25675d78f11749d4edaf15e36d046e3b', '测试反馈', 0, '2020-03-16 11:53:58', '2020-03-16 11:53:58', '测试反馈', 0, NULL, '1f01cd1d2f474743b241d74008b12333');
INSERT INTO `t_feedback` VALUES ('670af2dd59d04915b4c5e5a952a7b23f', '25675d78f11749d4edaf15e36d046e3b', '我是最新反馈我是最新反馈我是最新反馈我是最新反馈我是最新反馈我是最新反馈', 0, '2020-03-16 11:14:38', '2020-03-16 11:26:41', '我是最新反馈', 2, '感谢你的反馈', '1f01cd1d2f474743b241d74008b12333');
INSERT INTO `t_feedback` VALUES ('6d74c93b1c8059226a1dc1d9f124de3f', '8459dbae919e3b46d3e8cbcf08599041', '评论管理有错误', 0, '2020-04-06 15:10:43', '2020-04-30 10:07:01', '你好', 0, NULL, '1f01cd1d2f474743b241d74008b12333');
INSERT INTO `t_feedback` VALUES ('792ee62f2a61472a0cccf9cfc67ddf9b', '25675d78f11749d4edaf15e36d046e3b', ' 我是最新反馈我是最新反馈我是最新反馈我是最新反馈我是最新反馈我是最新反馈 我是最新反馈我是最新反馈我是最新反馈我是最新反馈我是最新反馈我是最新反馈', 0, '2020-03-16 11:16:02', '2020-03-16 11:26:27', ' 我是最新反馈', 2, '感谢你的反馈', '1f01cd1d2f474743b241d74008b12333');
INSERT INTO `t_feedback` VALUES ('8370ebb8ae79991366de6b255a48a794', '4db79e551d0dda06cfcf6ae39107711c', '测试反馈4', 1, '2020-04-29 15:19:53', '2020-04-29 15:19:52', '测试反馈4', 0, NULL, NULL);
INSERT INTO `t_feedback` VALUES ('99970dbe2638d14bc81c45fbebc44076', 'c52cd5e4c14cc33cd5a8b60e6f610f40', '123456', 1, '2020-08-02 19:12:26', '2020-08-02 19:12:26', '123', 0, NULL, NULL);
INSERT INTO `t_feedback` VALUES ('ae613935909d218a34d2cb31b08d154f', '25675d78f11749d4edaf15e36d046e3b', '测试反馈', 0, '2020-03-17 09:38:45', '2020-04-30 10:06:58', '测试反馈', 0, NULL, '1f01cd1d2f474743b241d74008b12333');
INSERT INTO `t_feedback` VALUES ('b043ac7a082c4928f310e54665bd48b2', '4db79e551d0dda06cfcf6ae39107711c', '最新反馈', 1, '2020-04-29 15:02:39', '2020-04-29 15:02:39', '最新反馈', 0, NULL, NULL);
INSERT INTO `t_feedback` VALUES ('d5209b8c2a744cea289c752fa2442969', '25675d78f11749d4edaf15e36d046e3b', '啊啊啊', 0, '2020-03-16 11:54:58', '2020-03-16 11:54:58', '啊啊啊', 0, NULL, '1f01cd1d2f474743b241d74008b12333');
INSERT INTO `t_feedback` VALUES ('d98c7ae55b7ecc277ef65c5aef9f5151', '25675d78f11749d4edaf15e36d046e3b', '提交反馈', 0, '2020-03-16 10:56:09', '2020-03-16 10:56:09', '提交反馈', 0, NULL, '1f01cd1d2f474743b241d74008b12333');
INSERT INTO `t_feedback` VALUES ('e29b9d32f74d60ce9a294db27e35a897', '4db79e551d0dda06cfcf6ae39107711c', '测试反馈6', 1, '2020-04-29 15:23:41', '2020-04-29 15:23:40', '测试反馈6', 0, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
