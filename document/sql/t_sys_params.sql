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

 Date: 14/01/2023 16:12:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_sys_params
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_params`;
CREATE TABLE `t_sys_params`  (
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `params_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '配置类型 是否系统内置(1:，是 0:否)',
  `params_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数名称',
  `params_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数键名',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `params_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数键值',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `sort` int(0) NOT NULL DEFAULT 0 COMMENT '排序字段',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_params
-- ----------------------------
INSERT INTO `t_sys_params` VALUES ('099427a9a5305f99ab46bb1c56080d3e', '1', '文件上传路径', 'FILE_UPLOAD_PATH', '图片本地上传路径', 'D:/mogu_blog/data/', 0, '2020-07-21 22:35:43', '2020-08-20 17:55:42', 0);
INSERT INTO `t_sys_params` VALUES ('0b2757bec99cb1c4eba3163fc6ab7cf2', '1', '二级推荐', 'BLOG_SECOND_COUNT', '首页博客 二级推荐数量', '2', 1, '2020-07-21 22:28:03', '2020-07-28 18:02:58', 0);
INSERT INTO `t_sys_params` VALUES ('0e5273aeee0058ee8737b94c6d955fe0', '1', '热门标签数量', 'HOT_TAG_COUNT', '首页 热门标签数量', '20', 1, '2020-07-21 22:41:04', '2021-03-11 19:24:18', 0);
INSERT INTO `t_sys_params` VALUES ('13102852ad56f478324ae13e9f83d7a6', '1', '一级推荐', 'BLOG_FIRST_COUNT', '首页博客 一级推荐数量', '5', 1, '2020-07-21 22:27:27', '2020-08-30 07:59:57', 0);
INSERT INTO `t_sys_params` VALUES ('1cbff65d4982066709fdfc3d4d2799eb', '1', '三级推荐', 'BLOG_THIRD_COUNT', '首页博客 三级推荐数量', '3', 1, '2020-07-21 22:28:34', '2020-07-21 22:28:34', 0);
INSERT INTO `t_sys_params` VALUES ('1ee3e63885637fcee9ab7dcdefbabeaa', '1', '默认密码', 'SYS_DEFAULT_PASSWORD', '管理员默认密码', 'mogu2018', 1, '2020-07-21 17:26:42', '2020-10-05 09:34:33', 2);
INSERT INTO `t_sys_params` VALUES ('207812ebc591b6754a5d655c24d4a58d', '1', '最新博客数量', 'BLOG_NEW_COUNT', '首页 最新显示的博客数量', '15', 1, '2020-07-21 22:26:44', '2020-08-30 07:59:46', 0);
INSERT INTO `t_sys_params` VALUES ('23b1b89ada85a09bb0075eab906958ce', '1', '令牌过期时间', 'TOKEN_EXPIRE_TIME', '后端令牌过期时间  1小时', '3600', 1, '2020-07-21 22:31:58', '2020-08-20 17:55:46', 0);
INSERT INTO `t_sys_params` VALUES ('3434f8d9895956311c1deeb71a7e52e4', '1', '友情链接数', 'FRIENDLY_LINK_COUNT', '友情链接数目', '20', 1, '2020-07-21 22:40:30', '2021-03-11 18:58:49', 0);
INSERT INTO `t_sys_params` VALUES ('62bde28353d8de9b7426d778f899830f', '1', '网盘最大容量', 'MAX_STORAGE_SIZE', '单个管理员账号，网盘最大容量，单位MB', '500', 1, '2020-10-09 10:01:25', '2020-10-09 10:12:02', 0);
INSERT INTO `t_sys_params` VALUES ('7c3c02a3874ca6fe6fd6207b978cf785', '1', '项目名称', 'PROJECT_NAME', '项目中文名称', '蘑菇博客', 1, '2020-07-28 17:18:59', '2020-07-28 17:18:59', 0);
INSERT INTO `t_sys_params` VALUES ('81270e541b3476f61fdae4435407c143', '1', '热门博客数量', 'BLOG_HOT_COUNT', '热门博客数量', '5', 1, '2020-07-21 22:26:02', '2020-07-21 22:26:02', 0);
INSERT INTO `t_sys_params` VALUES ('c69da7fccb13d22ee616e0972d5413af', '1', '四级推荐', 'BLOG_FOURTH_COUNT', '首页博客 四级推荐数量', '5', 1, '2020-07-21 22:29:11', '2020-07-21 22:33:19', 0);
INSERT INTO `t_sys_params` VALUES ('d1c75145ad11d7ba66d5f88a12c19079', '1', '令牌刷新时间', 'TOKEN_REFRESH_TIME', '后端令牌刷新时间 5分钟', '300', 0, '2020-07-21 22:33:04', '2020-08-20 17:55:44', 0);
INSERT INTO `t_sys_params` VALUES ('db28ba09b3edec8a479c6f07e742a31b', '1', '用户令牌存活时间', 'USER_TOKEN_SURVIVAL_TIME', 'toekn令牌存活时间7*24=7天', '168', 0, '2020-07-21 22:41:46', '2020-08-20 17:55:39', 0);

SET FOREIGN_KEY_CHECKS = 1;
