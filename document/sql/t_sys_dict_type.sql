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

 Date: 25/12/2022 10:48:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_dict_type`;
CREATE TABLE `t_sys_dict_type`  (
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `oid` int(0) NOT NULL AUTO_INCREMENT COMMENT '自增键oid',
  `dict_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典名称',
  `dict_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典类型',
  `create_by_uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人UID',
  `update_by_uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '最后更新人UID',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_publish` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否发布(1:是，0:否)',
  `sort` int(0) NOT NULL DEFAULT 0 COMMENT '排序字段',
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `oid`(`oid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_dict_type
-- ----------------------------
INSERT INTO `t_sys_dict_type` VALUES ('147b16259a5f482e86b75893d09e10d4', 18, '友链状态', 'sys_link_status', '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '友链状态', 1, '2020-03-15 08:47:56', '2020-03-15 08:47:56', '1', 0);
INSERT INTO `t_sys_dict_type` VALUES ('20a4dd3551aa6264f7e43c2274820763', 15, '用户账号来源', 'sys_account_source', '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '用户账号来源', 1, '2020-03-10 11:57:40', '2020-03-10 12:12:45', '1', 0);
INSERT INTO `t_sys_dict_type` VALUES ('397114076512e421458806e5d0050af6', 16, '评论状态', 'sys_comment_status', '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '评论状态', 1, '2020-03-10 13:00:24', '2020-03-10 13:00:24', '1', 0);
INSERT INTO `t_sys_dict_type` VALUES ('4d4a35b3dfc16d23b65a82073c88c0e6', 20, '用户标签', 'sys_user_tag', '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '用户标签：普通用户，管理员，博主', 1, '2020-03-18 09:23:56', '2020-03-18 09:24:07', '1', 0);
INSERT INTO `t_sys_dict_type` VALUES ('5c907ad864bc904851bde2506851cb88', 8, '通知类型', 'sys_notice_type', '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '通知类型列表', 1, '2020-02-17 21:40:53', '2020-02-17 21:40:53', '1', 0);
INSERT INTO `t_sys_dict_type` VALUES ('5c956299119cbbcbcf2009558ce503d0', 23, '跳转外链', 'sys_jump_external', '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '是否跳转外部链接', 1, '2020-07-03 21:19:39', '2020-07-03 21:19:39', '1', 0);
INSERT INTO `t_sys_dict_type` VALUES ('5ce79da03dbedef627e8c6fb002b1a29', 7, '系统是否', 'sys_yes_no', '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '系统是否列表', 1, '2020-02-17 21:40:24', '2020-02-17 23:28:38', '1', 0);
INSERT INTO `t_sys_dict_type` VALUES ('6472ff63369e0118d2e0b907437d631d', 19, '反馈状态', 'sys_feedback_status', '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '反馈状态', 1, '2020-03-16 09:20:06', '2020-03-16 09:20:06', '1', 0);
INSERT INTO `t_sys_dict_type` VALUES ('6634c313a8883f6c876806a15b9cc4b1', 25, '编辑器模式', 'sys_editor_modal', '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '用于选择编辑器是富文本或者markdown', 1, '2020-08-29 08:13:46', '2020-08-29 08:13:46', '1', 0);
INSERT INTO `t_sys_dict_type` VALUES ('6bf52bf12dce9d0bc56f2d0e10ceccbe', 21, '菜单类型', 'sys_menu_type', '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '菜单类型', 1, '2020-03-21 09:27:49', '2020-03-21 09:27:49', '1', 0);
INSERT INTO `t_sys_dict_type` VALUES ('80dfd5fa0b8226c8c0102da80cc6fedb', 14, '菜单等级', 'sys_menu_level', '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '菜单管理 菜单等级', 1, '2020-02-19 08:45:01', '2020-02-19 08:45:01', '1', 0);
INSERT INTO `t_sys_dict_type` VALUES ('861dfd0f77c8b053d40e020f23702df4', 3, '显示状态', 'sys_show_hide', '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '显示状态', 1, '2020-02-16 10:48:38', '2020-10-15 10:20:40', '1', 3);
INSERT INTO `t_sys_dict_type` VALUES ('904965b87673d2dd762c9ac2b6726813', 13, '图片显示优先级', 'sys_picture_priority', '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '七牛云、本地、Minio显示优先级', 1, '2020-02-18 09:44:59', '2020-10-22 09:59:08', '1', 0);
INSERT INTO `t_sys_dict_type` VALUES ('94ba24e6adb46cd094bb2217f1028285', 11, '原创状态', 'sys_original_status', '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '原创状态列表', 1, '2020-02-17 21:45:52', '2020-02-17 23:31:37', '1', 1);
INSERT INTO `t_sys_dict_type` VALUES ('a7be558b1c601b94126cc6ab5d5d008d', 27, '文章类型', 'sys_blog_type', '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '文章类型：博客，推广', 1, '2020-11-07 10:14:58', '2020-11-07 10:14:58', '1', 0);
INSERT INTO `t_sys_dict_type` VALUES ('a9eade09410e392988140adb1710e447', 26, '接口耗时', 'sys_spend_time', '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '日志接口耗时区间', 1, '2020-09-22 20:13:17', '2020-09-22 20:13:52', '1', 0);
INSERT INTO `t_sys_dict_type` VALUES ('b0c90de7ebeb138e9a0487f6ba86275a', 5, '操作类型', 'sys_oper_type', '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '操作类型', 1, '2020-02-16 12:56:40', '2020-02-16 12:56:40', '1', 0);
INSERT INTO `t_sys_dict_type` VALUES ('b96483ba6cd5122b2d33981681db8b1c', 24, '参数类型', 'sys_params_type', '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '参数类型', 1, '2020-07-21 17:14:50', '2020-07-21 17:14:50', '1', 0);
INSERT INTO `t_sys_dict_type` VALUES ('ba386b930c4a3580357b1df8a2e24c8a', 12, '存储区域', 'sys_storage_region', '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '七牛云存储区域', 1, '2020-02-17 23:36:21', '2020-02-17 23:36:21', '1', 0);
INSERT INTO `t_sys_dict_type` VALUES ('d3d9f373ae0c344fa0a24eadd23a191b', 17, '评论类型', 'sys_comment_type', '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '评论类型', 1, '2020-03-15 08:47:37', '2020-03-15 08:47:37', '1', 0);
INSERT INTO `t_sys_dict_type` VALUES ('e2fa1d1024a2570f13ec7f684c08bd25', 2, '用户性别', 'sys_user_sex', '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '用户性别列表', 1, '2020-02-16 10:40:49', '2020-02-17 23:31:49', '1', 2);
INSERT INTO `t_sys_dict_type` VALUES ('e582ff889b2e64fffed194737d78fa98', 9, '推荐等级', 'sys_recommend_level', '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '推荐等级列表', 1, '2020-02-17 21:41:59', '2020-02-17 21:41:59', '1', 0);
INSERT INTO `t_sys_dict_type` VALUES ('e7a80c0adce2b69035dfa505d998ba74', 6, '系统开关', 'sys_normal_disable', '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '系统开关列表', 1, '2020-02-17 21:38:55', '2020-02-17 21:40:00', '1', 0);
INSERT INTO `t_sys_dict_type` VALUES ('eaef85e78f7f88bd0efd428f32033f2f', 22, '评论来源', 'sys_comment_source', '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '评论来源', 1, '2020-04-04 21:24:55', '2020-04-04 21:24:55', '1', 0);
INSERT INTO `t_sys_dict_type` VALUES ('f1929a18eac0a6dfa9007aa8024899a2', 30, '搜索模式', 'sys_search_model', '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '搜索模式：SQL搜索、全文检索', 1, '2021-09-11 15:26:35', '2021-09-11 15:26:35', '1', 0);
INSERT INTO `t_sys_dict_type` VALUES ('f4c0b7c14e1857a8453af396e1537556', 10, '发布状态', 'sys_publish_status', '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '发布状态列表', 1, '2020-02-17 21:44:09', '2020-02-17 21:44:09', '1', 0);

SET FOREIGN_KEY_CHECKS = 1;
