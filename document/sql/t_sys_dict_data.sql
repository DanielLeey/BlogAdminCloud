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

 Date: 25/12/2022 10:48:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_dict_data`;
CREATE TABLE `t_sys_dict_data`  (
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `oid` int(0) NOT NULL AUTO_INCREMENT COMMENT '自增键oid',
  `dict_type_uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典类型UID',
  `dict_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典标签',
  `dict_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典键值',
  `css_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` tinyint(1) NULL DEFAULT 0 COMMENT '是否默认（1是 0否）,默认为0',
  `create_by_uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人UID',
  `update_by_uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后更新人UID',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_publish` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否发布(1:是，0:否)',
  `sort` int(0) NOT NULL DEFAULT 0 COMMENT '排序字段',
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `oid`(`oid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_dict_data
-- ----------------------------
INSERT INTO `t_sys_dict_data` VALUES ('026b7d3453ff74d3d6a31a10abc39a47', 10, 'b0c90de7ebeb138e9a0487f6ba86275a', '删除', '3', NULL, NULL, 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '删除操作', 1, '2020-02-17 21:25:04', '2020-02-17 21:25:04', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('03bfb8183ef66828f7b04487bfbe35c7', 27, '904965b87673d2dd762c9ac2b6726813', '七牛云对象存储', '1', NULL, 'primary', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '图片显示优先级  七牛云', 1, '2020-02-18 09:45:27', '2020-10-22 10:04:42', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('03ebe4234670f7cfeb0b19c8794bdaea', 19, 'e582ff889b2e64fffed194737d78fa98', '二级推荐', '2', NULL, 'success', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '推荐等级 二级推荐', 1, '2020-02-17 22:05:34', '2020-02-17 22:05:34', '1', 3);
INSERT INTO `t_sys_dict_data` VALUES ('0cb01485ad75f7ec37a29d388e7d6013', 7, 'e2fa1d1024a2570f13ec7f684c08bd25', '女', '2', NULL, NULL, 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '性别 女', 1, '2020-02-16 20:49:56', '2020-02-16 20:49:56', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('0d5183928308f7945bfb300f873b1f1e', 44, '147b16259a5f482e86b75893d09e10d4', '上架', '1', NULL, 'success', 1, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '友链状态 上线中', 1, '2020-03-15 08:50:28', '2020-03-15 08:50:28', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('0f2833c5c24480bab9c4e3e5a815002a', 70, '904965b87673d2dd762c9ac2b6726813', 'Minio对象存储', '2', NULL, 'primary', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '使用Minio构建本地对象存储服务', 1, '2020-10-22 10:04:02', '2020-10-22 10:05:39', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('0fb5f67e224f91638e71935eb6a38467', 21, 'e582ff889b2e64fffed194737d78fa98', '四级推荐', '4', NULL, 'primary', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '推荐等级 四级推荐', 1, '2020-02-17 22:06:13', '2020-02-17 22:06:13', '1', 1);
INSERT INTO `t_sys_dict_data` VALUES ('10e538229ea9ee8552672ed1cb5575e0', 61, '5c956299119cbbcbcf2009558ce503d0', '是', '1', NULL, 'danger', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '是否跳转外链  是', 1, '2020-07-03 21:20:09', '2020-07-03 21:43:33', '1', 1);
INSERT INTO `t_sys_dict_data` VALUES ('1e666c133099dc361ec0dbaa8b6203cc', 56, '80dfd5fa0b8226c8c0102da80cc6fedb', '三级菜单', '3', NULL, 'info', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '菜单管理 三级菜单  按钮', 1, '2020-03-21 18:02:22', '2020-03-21 18:02:22', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('2388fa41c446c4f870b6010bc404473f', 31, '94ba24e6adb46cd094bb2217f1028285', '原创', '1', NULL, 'success', 1, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '原创博客', 1, '2020-02-19 09:54:52', '2020-02-19 09:54:52', '1', 1);
INSERT INTO `t_sys_dict_data` VALUES ('23b55a610d84470e052e09abf110dccc', 17, 'e582ff889b2e64fffed194737d78fa98', '正常', '0', NULL, 'info', 1, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '推荐等级 正常', 1, '2020-02-17 22:01:56', '2020-02-17 22:01:56', '1', 5);
INSERT INTO `t_sys_dict_data` VALUES ('24f6c115ecfbb9c1818f9603990c8971', 80, 'f1929a18eac0a6dfa9007aa8024899a2', 'Solr搜索', '2', NULL, NULL, 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '搜索模式：Solr搜索', 1, '2021-09-11 16:18:17', '2021-09-11 16:18:17', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('2ebdf915ac4003d4ed5e2b4c78038acf', 59, 'eaef85e78f7f88bd0efd428f32033f2f', '博客详情', 'BLOG_INFO', NULL, 'warning', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '评论来源 博客详情', 1, '2020-04-04 21:27:11', '2020-04-04 21:27:11', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('30a04bbb52add36a22211f6b93fc882e', 13, '5ce79da03dbedef627e8c6fb002b1a29', '是', '1', NULL, 'success', 1, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '系统是否  是', 1, '2020-02-17 21:56:35', '2020-02-17 21:56:35', '1', 1);
INSERT INTO `t_sys_dict_data` VALUES ('3151f138e5c2858112da60b70a699469', 23, 'ba386b930c4a3580357b1df8a2e24c8a', '华北', 'z1', NULL, NULL, 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '存储区域 华北', 1, '2020-02-17 23:37:31', '2020-02-17 23:37:31', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('3555747751ef69d66109280797dd2859', 57, 'eaef85e78f7f88bd0efd428f32033f2f', '留言板', 'MESSAGE_BOARD', NULL, 'primary', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '评论来源 留言板', 1, '2020-04-04 21:25:34', '2020-04-04 21:25:34', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('39cf99bab1bd3ca0683424f99f1a9fee', 26, 'ba386b930c4a3580357b1df8a2e24c8a', '东南亚', 'as0', NULL, NULL, 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '存储区域 东南亚', 1, '2020-02-17 23:38:32', '2020-02-17 23:38:32', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('3b38f16f39b491acb52d6a3a2be6e9c6', 58, 'eaef85e78f7f88bd0efd428f32033f2f', '关于我', 'ABOUT', NULL, 'success', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '评论来源 关于我', 1, '2020-04-04 21:26:14', '2020-04-04 21:26:14', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('3f47a55713b1ea101b7f38af0fe1efa9', 37, '20a4dd3551aa6264f7e43c2274820763', 'GITEE', 'GITEE', NULL, 'primary', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '账号类型 Gitee', 1, '2020-03-10 12:09:07', '2020-03-10 12:09:07', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('40b08947b62bc34793b0655c944d2eec', 34, '20a4dd3551aa6264f7e43c2274820763', 'Gitee', 'Gitee', NULL, NULL, 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '账号类型 Gitee', 0, '2020-03-10 11:59:26', '2020-03-10 11:59:26', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('416abb075fd0f8d4a512d204121c15b2', 15, 'f4c0b7c14e1857a8453af396e1537556', '发布', '1', NULL, 'success', 1, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '发布状态  上架', 1, '2020-02-17 22:00:01', '2020-02-17 22:00:01', '1', 1);
INSERT INTO `t_sys_dict_data` VALUES ('431eb64cba73239ebd01b0b823e5f36f', 64, 'b96483ba6cd5122b2d33981681db8b1c', '否', '0', NULL, 'info', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '参数类型 是否内置  否', 1, '2020-07-21 17:16:16', '2020-07-21 17:16:16', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('464f9e4a13d53494bff10df5e966b0cf', 39, '397114076512e421458806e5d0050af6', '禁言', '0', NULL, 'danger', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '评论状态 禁言', 1, '2020-03-10 13:01:20', '2020-03-10 13:01:20', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('47559bf170909797709381e3b8c1a796', 38, '20a4dd3551aa6264f7e43c2274820763', 'GITHUB', 'GITHUB', NULL, 'danger', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '账号类型 Github', 1, '2020-03-10 12:09:20', '2020-03-10 12:09:20', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('490b20a757bc11fbb0b089a91c169830', 14, '5ce79da03dbedef627e8c6fb002b1a29', '否', '0', NULL, 'warning', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '系统是否  否', 1, '2020-02-17 21:56:47', '2020-02-17 21:56:47', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('49d73b6c112e6d3233e11cc97c4ae231', 71, 'a7be558b1c601b94126cc6ab5d5d008d', '博客', '0', NULL, 'default', 1, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '文章类型：博客', 1, '2020-11-07 10:15:56', '2020-11-07 10:19:05', '1', 1);
INSERT INTO `t_sys_dict_data` VALUES ('4a3e898c54f9ddcfa52a5c40e5a647dd', 45, '147b16259a5f482e86b75893d09e10d4', '下架', '2', NULL, 'warning', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '友链状态  已下架', 1, '2020-03-15 08:52:20', '2020-03-15 08:52:20', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('4a90a207068f8044c65cae80fbbb7309', 62, '5c956299119cbbcbcf2009558ce503d0', '否', '0', NULL, 'info', 1, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '是否跳转外链  否', 1, '2020-07-03 21:20:22', '2020-07-03 21:43:26', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('4dcc00f8566473020608d9609a1686e5', 46, '6472ff63369e0118d2e0b907437d631d', '已开启', '0', NULL, 'warning', 1, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '反馈状态 已开启', 1, '2020-03-16 09:20:38', '2020-03-16 09:20:38', '1', 4);
INSERT INTO `t_sys_dict_data` VALUES ('4f243578b444646a6bc1349a10d1be9f', 8, 'b0c90de7ebeb138e9a0487f6ba86275a', '新增', '1', NULL, NULL, 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '新增操作', 1, '2020-02-17 21:24:29', '2020-02-17 21:24:29', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('5130d2cf209bcf02e97322491b4e611e', 4, '861dfd0f77c8b053d40e020f23702df4', '隐藏', '0', NULL, NULL, 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '菜单状态 隐藏', 1, '2020-02-16 13:23:39', '2020-02-16 13:23:39', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('57968d6ea419bc4868ef8a4518c1f90c', 69, 'a9eade09410e392988140adb1710e447', '超时', '5000_10000000', NULL, 'danger', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '接口耗时  超时  5000_100000', 1, '2020-09-22 20:15:46', '2020-09-22 20:35:19', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('5b6f8111b8296906b887ec5d4420721b', 52, '4d4a35b3dfc16d23b65a82073c88c0e6', '博主', '2', NULL, 'danger', 1, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '用户标签  博主', 1, '2020-03-18 09:25:33', '2020-03-18 09:25:33', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('5f554b9bae92a1d630a1b89b8f88bc65', 47, '6472ff63369e0118d2e0b907437d631d', '进行中', '1', NULL, 'primary', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '反馈状态 进行中', 1, '2020-03-16 09:20:56', '2020-03-16 09:20:56', '1', 2);
INSERT INTO `t_sys_dict_data` VALUES ('614a593ba613eb6f5c591f2d2430538a', 49, '6472ff63369e0118d2e0b907437d631d', '已拒绝', '3', NULL, 'danger', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '反馈状态 已拒绝', 1, '2020-03-16 09:21:33', '2020-03-16 09:21:33', '1', 1);
INSERT INTO `t_sys_dict_data` VALUES ('66aa82856368c573e0bfe012ec6d0ab6', 22, 'ba386b930c4a3580357b1df8a2e24c8a', '华东', 'z0', NULL, NULL, 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '存储区域 华东', 1, '2020-02-17 23:37:12', '2020-02-17 23:37:12', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('6caab28eb72a7331ecac4d01c616f023', 67, 'a9eade09410e392988140adb1710e447', '正常', '0_2000', NULL, 'primary', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '接口耗时  正常  0_2000', 1, '2020-09-22 20:14:36', '2020-09-22 20:25:39', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('6e19e89f593b2e378ae98e209972004b', 51, '4d4a35b3dfc16d23b65a82073c88c0e6', '管理员', '1', NULL, 'warning', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '用户标签 管理员', 1, '2020-03-18 09:25:09', '2020-03-18 09:25:09', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('71bb6611f581413baa7b654dd271deca', 16, 'f4c0b7c14e1857a8453af396e1537556', '下架', '0', NULL, 'danger', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '发布状态  下架', 1, '2020-02-17 22:00:15', '2020-02-17 22:00:15', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('763bb526d9aa6ebd5bc0b7db69548c57', 30, '80dfd5fa0b8226c8c0102da80cc6fedb', '二级菜单', '2', NULL, 'danger', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '菜单等级 二级菜单', 1, '2020-02-19 08:45:53', '2020-02-19 08:45:53', '1', 2);
INSERT INTO `t_sys_dict_data` VALUES ('78a4a2573f5fe9bd22813a9e4b1f38a8', 60, '20a4dd3551aa6264f7e43c2274820763', 'QQ', 'QQ', NULL, 'primary', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '账号类型 QQ', 1, '2020-05-28 09:13:00', '2020-05-28 09:13:09', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('7a88a80ab90ed03c86ec3276bd9748cb', 65, '6634c313a8883f6c876806a15b9cc4b1', '富文本编辑器', '0', NULL, 'primary', 1, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '富文本编辑器Markdown', 1, '2020-08-29 08:14:32', '2020-08-29 08:47:11', '1', 1);
INSERT INTO `t_sys_dict_data` VALUES ('7c99aecb7b9b50c06b1c643c19568a4d', 25, 'ba386b930c4a3580357b1df8a2e24c8a', '北美', 'na0', NULL, NULL, 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '存储区域 北美', 1, '2020-02-17 23:38:16', '2020-02-17 23:38:16', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('82d7c4c2fcbd2d3b9aa856ac33420c45', 2, '861dfd0f77c8b053d40e020f23702df4', '显示', '1', NULL, NULL, 1, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '菜单状态 显示', 1, '2020-02-16 12:40:51', '2020-10-15 10:17:39', '1', 1);
INSERT INTO `t_sys_dict_data` VALUES ('868d1b0c1df6915a4a6ca574b46d4ac8', 18, 'e582ff889b2e64fffed194737d78fa98', '一级推荐', '1', NULL, 'danger', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '推荐等级 一级推荐', 1, '2020-02-17 22:05:19', '2020-02-17 22:05:19', '1', 4);
INSERT INTO `t_sys_dict_data` VALUES ('8cb9f3d3fa091a581a333102dec732ab', 20, 'e582ff889b2e64fffed194737d78fa98', '三级推荐', '3', NULL, 'warning', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '推荐等级 三级推荐', 1, '2020-02-17 22:05:55', '2020-02-17 22:05:55', '1', 2);
INSERT INTO `t_sys_dict_data` VALUES ('9288f39aa07aee842952fbc7dd1fe4a2', 66, '6634c313a8883f6c876806a15b9cc4b1', 'Markdown编辑器', '1', NULL, 'warning', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', 'Markdown编辑器', 1, '2020-08-29 08:14:59', '2020-08-29 08:14:59', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('95b43081a93a53727b0474098242d64c', 33, '20a4dd3551aa6264f7e43c2274820763', 'Github', 'Github', NULL, NULL, 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '账号类型 Github', 0, '2020-03-10 11:59:12', '2020-03-10 11:59:12', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('964945d3c156ea7dcc64b13741b02923', 63, 'b96483ba6cd5122b2d33981681db8b1c', '是', '1', NULL, 'primary', 1, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '参数类型  是否内置  是', 1, '2020-07-21 17:15:49', '2020-07-21 17:16:29', '1', 1);
INSERT INTO `t_sys_dict_data` VALUES ('9673bcc91bb2f22c31381c8364d4726b', 9, 'b0c90de7ebeb138e9a0487f6ba86275a', '编辑', '2', NULL, NULL, 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '编辑操作', 1, '2020-02-17 21:24:45', '2020-02-17 21:24:45', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('a03e72c6f457bb282d3a7f62ff5f4598', 55, '6bf52bf12dce9d0bc56f2d0e10ceccbe', '按钮', '1', NULL, 'warning', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '菜单类型 按钮', 1, '2020-03-21 09:28:32', '2020-03-21 09:28:32', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('a94dadf4a2a5c003c3bb38dd6075ebe3', 35, '20a4dd3551aa6264f7e43c2274820763', 'Mogu', 'Mogu', NULL, NULL, 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '账号类型 蘑菇博客', 0, '2020-03-10 11:59:53', '2020-03-10 11:59:53', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('ac72222bb8ac26959460f87328c97d59', 24, 'ba386b930c4a3580357b1df8a2e24c8a', '华南', 'z2', NULL, NULL, 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '存储区域 华南', 1, '2020-02-17 23:38:00', '2020-02-17 23:38:00', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('b0e0e31c66fa52f481ea1982348ee703', 12, 'e7a80c0adce2b69035dfa505d998ba74', '关闭', '0', NULL, 'danger', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '系统开关 关闭', 1, '2020-02-17 21:50:22', '2020-02-17 21:50:22', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('b8764efefb7a78d4a2d84466daf34084', 40, '397114076512e421458806e5d0050af6', '正常', '1', NULL, 'success', 1, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '评论状态 正常', 1, '2020-03-10 13:01:35', '2020-03-10 13:01:35', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('bc852b3bbec6b9641a508fa32c49a40d', 54, '6bf52bf12dce9d0bc56f2d0e10ceccbe', '菜单', '0', NULL, 'success', 1, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '菜单类型  菜单', 1, '2020-03-21 09:28:13', '2020-03-21 09:28:13', '1', 1);
INSERT INTO `t_sys_dict_data` VALUES ('bc9c1933052d66f8424b09a6869972d0', 79, 'f1929a18eac0a6dfa9007aa8024899a2', '全文检索', '1', NULL, NULL, 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '搜索模式：开启ElasticSearch全文检索', 1, '2021-09-11 15:27:36', '2021-09-11 15:27:36', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('bd14282cf7e3db5831e1b9e7e899024e', 42, 'd3d9f373ae0c344fa0a24eadd23a191b', '评论', '0', NULL, 'warning', 1, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '评论类型 评论', 1, '2020-03-15 08:49:18', '2020-05-14 18:50:12', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('c027f76096eb89ee6364b25f7b366388', 78, 'f1929a18eac0a6dfa9007aa8024899a2', 'SQL搜索', '0', NULL, NULL, 1, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '搜索模式：SQL搜索', 1, '2021-09-11 15:27:00', '2021-09-11 15:27:00', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('c3299bf019caeff6690e90c358e67e43', 53, '861dfd0f77c8b053d40e020f23702df4', '123', '123', NULL, NULL, 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', NULL, 0, '2020-03-20 11:51:09', '2020-03-20 11:51:09', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('ca66f4c186c3ceb69057ae0432bd43d6', 11, 'e7a80c0adce2b69035dfa505d998ba74', '开启', '1', NULL, 'primary', 1, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '系统开关 开启', 1, '2020-02-17 21:50:06', '2020-02-17 21:50:06', '1', 1);
INSERT INTO `t_sys_dict_data` VALUES ('cc7cc52fbe8b7b4c89a6f1670d09c060', 6, 'e2fa1d1024a2570f13ec7f684c08bd25', '男', '1', NULL, NULL, 1, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '性别 男', 1, '2020-02-16 20:49:40', '2020-02-16 20:49:40', '1', 2);
INSERT INTO `t_sys_dict_data` VALUES ('d350119289186d520e0ccbb9b320e07a', 48, '6472ff63369e0118d2e0b907437d631d', '已完成', '2', NULL, 'success', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '反馈状态 已完成', 1, '2020-03-16 09:21:13', '2020-03-16 09:21:13', '1', 3);
INSERT INTO `t_sys_dict_data` VALUES ('d3fe3ce87880595aad04b3e8077da223', 32, '94ba24e6adb46cd094bb2217f1028285', '转载', '0', NULL, 'info', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '转载博客', 1, '2020-02-19 09:55:09', '2020-02-19 09:55:09', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('dc3c52a18d8ad99b83337751187e7359', 29, '80dfd5fa0b8226c8c0102da80cc6fedb', '一级菜单', '1', NULL, 'success', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '菜单等级 一级菜单', 1, '2020-02-19 08:45:31', '2020-02-19 08:45:31', '1', 3);
INSERT INTO `t_sys_dict_data` VALUES ('e42847ffae93e9f494dfc6cc65eaedce', 68, 'a9eade09410e392988140adb1710e447', '一般', '2000_5000', NULL, 'warning', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '接口耗时 一般  2000_5000', 1, '2020-09-22 20:14:57', '2020-09-22 20:25:30', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('e6d918372233a8b48b9609fa70326c89', 43, '147b16259a5f482e86b75893d09e10d4', '申请', '0', NULL, 'danger', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '友链状态  申请中', 1, '2020-03-15 08:49:57', '2020-03-15 08:49:57', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('e7dbddd726ae81086364e49abb12c539', 41, 'd3d9f373ae0c344fa0a24eadd23a191b', '点赞', '1', NULL, 'success', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '评论类型  点赞', 1, '2020-03-15 08:49:02', '2020-03-15 08:49:02', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('e9d6bc86f8ffa4e8dcf85b98069211dd', 28, '904965b87673d2dd762c9ac2b6726813', '本地文件存储', '0', NULL, 'primary', 1, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '图片显示优先级  本地', 1, '2020-02-18 09:45:45', '2020-10-22 10:04:36', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('f3d2ded0e31673ce545b905aacce627f', 72, 'a7be558b1c601b94126cc6ab5d5d008d', '推广', '1', NULL, 'default', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '文章类型：推广', 1, '2020-11-07 10:16:16', '2020-11-07 10:16:16', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('f6fdd4f421d31989b57d932422ec5528', 50, '4d4a35b3dfc16d23b65a82073c88c0e6', '普通用户', '0', NULL, 'info', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '用户标签 普通用户', 1, '2020-03-18 09:24:40', '2020-03-18 09:24:40', '1', 0);
INSERT INTO `t_sys_dict_data` VALUES ('f963505ec3462cb63f9a590c9df08ac8', 36, '20a4dd3551aa6264f7e43c2274820763', 'MOGU', 'MOGU', NULL, 'success', 0, '1f01cd1d2f474743b241d74008b12333', '1f01cd1d2f474743b241d74008b12333', '账号类型 蘑菇博客', 1, '2020-03-10 12:08:50', '2020-03-10 12:08:50', '1', 0);

SET FOREIGN_KEY_CHECKS = 1;
