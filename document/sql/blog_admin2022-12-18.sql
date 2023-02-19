/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : blog_admin

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 18/12/2022 10:14:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article_count
-- ----------------------------
DROP TABLE IF EXISTS `article_count`;
CREATE TABLE `article_count`  (
  `id` bigint(0) NOT NULL COMMENT '文章id',
  `view_count` bigint(0) NULL DEFAULT NULL COMMENT '浏览量',
  `comment_count` bigint(0) NULL DEFAULT NULL COMMENT '评论数',
  `like_count` bigint(0) NULL DEFAULT NULL COMMENT '点赞数',
  `collect_count` bigint(0) NULL DEFAULT NULL COMMENT '收藏数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_count
-- ----------------------------
INSERT INTO `article_count` VALUES (1, 135, 2, 1, 1);
INSERT INTO `article_count` VALUES (2, 24, 3, 1, 1);
INSERT INTO `article_count` VALUES (3, 11, 0, 1, 1);
INSERT INTO `article_count` VALUES (5, 2, 1, 1, 1);

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source oldUser',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id`, `group_id`, `tenant_id`, `datum_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '增加租户字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source oldUser',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_beta' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source oldUser',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id`, `group_id`, `tenant_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_tag' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint(0) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(0) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id`, `tag_name`, `tag_type`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_tag_relation' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '集群、各Group容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint(0) UNSIGNED NOT NULL,
  `nid` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create`) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified`) USING BTREE,
  INDEX `idx_did`(`data_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '多租户改造' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `resource` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  UNIQUE INDEX `uk_role_permission`(`role`, `resource`, `action`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  UNIQUE INDEX `idx_user_role`(`username`, `role`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for sg_article
-- ----------------------------
DROP TABLE IF EXISTS `sg_article`;
CREATE TABLE `sg_article`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '文章内容',
  `summary` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章摘要',
  `category_id` bigint(0) NULL DEFAULT NULL COMMENT '所属分类id',
  `article_tags` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签',
  `thumbnail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '缩略图',
  `is_top` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否置顶（0否，1是）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '状态（0已发布，1草稿）',
  `view_count` bigint(0) NULL DEFAULT 0 COMMENT '访问量',
  `is_comment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否允许评论 1是，0否',
  `creator_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by` bigint(0) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(0) NULL DEFAULT NULL COMMENT '修改者id',
  `update_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(0) NULL DEFAULT 0 COMMENT '删除标志（0代表未删除，1代表已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sg_article
-- ----------------------------
INSERT INTO `sg_article` VALUES (1, 'SpringSecurity从入门到精通', '## 课程介绍\n![image20211219121555979.png](https://sg-blog-oss.oss-cn-beijing.aliyuncs.com/2022/01/31/e7131718e9e64faeaf3fe16404186eb4.png)\n\n## 0. 简介1\n\n​	**Spring Security** 是 Spring 家族中的一个安全管理框架。相比与另外一个安全框架**Shiro**，它提供了更丰富的功能，社区资源也比Shiro丰富。\n\n​	一般来说中大型的项目都是使用**SpringSecurity** 来做安全框架。小项目有Shiro的比较多，因为相比与SpringSecurity，Shiro的上手更加的简单。\n\n​	 一般Web应用的需要进行**认证**和**授权**。\n\n​		**认证：验证当前访问系统的是不是本系统的用户，并且要确认具体是哪个用户**\n\n​		**授权：经过认证后判断当前用户是否有权限进行某个操作**\n\n​	而认证和授权也是SpringSecurity作为安全框架的核心功能。\n\n\n\n## 1. 快速入门\n\n### 1.1 准备工作\n\n​	我们先要搭建一个简单的SpringBoot工程\n\n① 设置父工程 添加依赖\n\n~~~~\n    <parent>\n        <groupId>org.springframework.boot</groupId>\n        <artifactId>spring-boot-starter-parent</artifactId>\n        <version>2.5.0</version>\n    </parent>\n    <dependencies>\n        <dependency>\n            <groupId>org.springframework.boot</groupId>\n            <artifactId>spring-boot-starter-web</artifactId>\n        </dependency>\n        <dependency>\n            <groupId>org.projectlombok</groupId>\n            <artifactId>lombok</artifactId>\n            <optional>true</optional>\n        </dependency>\n    </dependencies>\n~~~~\n\n② 创建启动类\n\n~~~~\n@SpringBootApplication\npublic class SecurityApplication {\n\n    public static void main(String[] args) {\n        SpringApplication.run(SecurityApplication.class,args);\n    }\n}\n\n~~~~\n\n③ 创建Controller\n\n~~~~java\n\nimport org.springframework.web.bind.annotation.RequestMapping;\nimport org.springframework.web.bind.annotation.RestController;\n\n@RestController\npublic class HelloController {\n\n    @RequestMapping(\"/hello\")\n    public String hello(){\n        return \"hello\";\n    }\n}\n\n~~~~\n\n\n\n### 1.2 引入SpringSecurity\n\n​	在SpringBoot项目中使用SpringSecurity我们只需要引入依赖即可实现入门案例。\n\n~~~~xml\n        <dependency>\n            <groupId>org.springframework.boot</groupId>\n            <artifactId>spring-boot-starter-security</artifactId>\n        </dependency>\n~~~~\n\n​	引入依赖后我们在尝试去访问之前的接口就会自动跳转到一个SpringSecurity的默认登陆页面，默认用户名是user,密码会输出在控制台。\n\n​	必须登陆之后才能对接口进行访问。\n\n\n\n## 2. 认证\n\n### 2.1 登陆校验流程\n![image20211215094003288.png](https://sg-blog-oss.oss-cn-beijing.aliyuncs.com/2022/01/31/414a87eeed344828b5b00ffa80178958.png)', 'SpringSecurity框架教程-Spring Security+JWT实现项目级前端分离认证授权', 1, 'java,设计模式', 'https://sg-blog-oss.oss-cn-beijing.aliyuncs.com/2022/01/31/948597e164614902ab1662ba8452e106.png', '1', '0', 118, '0', 'Lee', 1, '2022-01-23 23:20:11', NULL, NULL, 0);
INSERT INTO `sg_article` VALUES (2, 'weq', 'adadaeqe', 'adad', 2, 'php,python', 'https://sg-blog-oss.oss-cn-beijing.aliyuncs.com/2022/01/15/fd2e9460c58a4af3bbeae5d9ed581688.png', '1', '0', 22, '0', NULL, NULL, '2022-01-21 14:58:30', NULL, NULL, 0);
INSERT INTO `sg_article` VALUES (3, 'dad', 'asdasda', 'sadad', 1, 'c++,docker,', 'https://sg-blog-oss.oss-cn-beijing.aliyuncs.com/2022/01/15/737a0ed0b8ea430d8700a12e76aa1cd1.png', '1', '0', 33, '0', NULL, NULL, '2022-01-18 14:58:34', NULL, NULL, 0);
INSERT INTO `sg_article` VALUES (5, 'sdad', '![Snipaste_20220115_165812.png](https://sg-blog-oss.oss-cn-beijing.aliyuncs.com/2022/01/15/1d9d283f5d874b468078b183e4b98b71.png)\r\n\r\n## sda \r\n\r\n222\r\n### sdasd newnewnew', NULL, 2, 'vue', '', '1', '0', 48, '0', NULL, NULL, '2022-01-17 14:58:37', NULL, NULL, 0);
INSERT INTO `sg_article` VALUES (13, 'qqq', '<p><em>qqq</em></p>\n', NULL, NULL, 'qqq,www', NULL, '0', '0', 0, '1', NULL, 1, NULL, NULL, NULL, 0);
INSERT INTO `sg_article` VALUES (14, 'bbb', '<p>bbb</p>\n', NULL, NULL, 'bbb,', NULL, '0', '1', 0, '1', NULL, 1, NULL, NULL, NULL, 0);
INSERT INTO `sg_article` VALUES (15, 'bbb', '<p>bbb</p>\n', NULL, NULL, 'bbb,', NULL, '0', '1', 0, '1', NULL, 1, NULL, NULL, NULL, 0);
INSERT INTO `sg_article` VALUES (16, 'fff', '<h2><a id=\"fff_0\"></a>fff</h2>\n', NULL, NULL, 'fff,', NULL, '0', '1', 0, '1', 'sg', 1, NULL, NULL, NULL, 0);
INSERT INTO `sg_article` VALUES (17, 'fff', '<h2><a id=\"fff_0\"></a>fff</h2>\n', NULL, NULL, 'fff,', NULL, '0', '1', 0, '1', 'sg', 1, NULL, NULL, NULL, 0);
INSERT INTO `sg_article` VALUES (18, 'sss', '<p>sss</p>\n', NULL, NULL, 'sss,', NULL, '0', '1', 0, '1', 'sg', 1, NULL, NULL, NULL, 0);
INSERT INTO `sg_article` VALUES (19, 'hhhh', '<p><strong>hhhh</strong></p>\n', NULL, NULL, 'hhh,', NULL, '0', '1', 1, '1', 'sg', 1, '2022-07-09 10:56:11', NULL, NULL, 0);
INSERT INTO `sg_article` VALUES (20, 'ttt', '<p><strong>tttt</strong></p>\n', NULL, NULL, 'ttt,', NULL, '0', '1', 0, '1', 'sg', 1, '2022-07-09 12:19:53', NULL, NULL, 0);
INSERT INTO `sg_article` VALUES (21, '测试目录', '<h1><a id=\"_0\"></a>测试目录</h1>\n<h2><a id=\"_1\"></a>第一段</h2>\n<p>测试一下</p>\n<h2><a id=\"_3\"></a>第二段</h2>\n<p>测试一下</p>\n', NULL, NULL, '测试目录,标签二,', NULL, '0', '1', 0, '1', 'sg', 1, '2022-07-10 13:46:14', NULL, NULL, 0);

-- ----------------------------
-- Table structure for sg_category
-- ----------------------------
DROP TABLE IF EXISTS `sg_category`;
CREATE TABLE `sg_category`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类名',
  `pid` bigint(0) NULL DEFAULT -1 COMMENT '父分类id，如果没有父分类为-1',
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态0:正常,1禁用',
  `create_by` bigint(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(0) NULL DEFAULT 0 COMMENT '删除标志（0代表未删除，1代表已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sg_category
-- ----------------------------
INSERT INTO `sg_category` VALUES (1, 'java', -1, 'wsd', '0', NULL, NULL, NULL, NULL, 0);
INSERT INTO `sg_category` VALUES (2, 'PHP', -1, 'wsd', '0', NULL, NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for sg_comment
-- ----------------------------
DROP TABLE IF EXISTS `sg_comment`;
CREATE TABLE `sg_comment`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '评论类型（0代表文章评论，1代表友链评论）',
  `article_id` bigint(0) NULL DEFAULT NULL COMMENT '文章id',
  `root_id` bigint(0) NULL DEFAULT -1 COMMENT '根评论id',
  `content` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论内容',
  `to_comment_user_id` bigint(0) NULL DEFAULT -1 COMMENT '所回复的目标评论的userid',
  `to_comment_id` bigint(0) NULL DEFAULT -1 COMMENT '回复目标评论id',
  `create_by` bigint(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(0) NULL DEFAULT 0 COMMENT '删除标志（0代表未删除，1代表已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sg_comment
-- ----------------------------
INSERT INTO `sg_comment` VALUES (1, '0', 1, -1, 'asS', -1, -1, 1, '2022-01-29 07:59:22', 1, '2022-01-29 07:59:22', 0);
INSERT INTO `sg_comment` VALUES (2, '0', 1, -1, '[哈哈]SDAS', -1, -1, 1, '2022-01-29 08:01:24', 1, '2022-01-29 08:01:24', 0);
INSERT INTO `sg_comment` VALUES (3, '0', 1, -1, '是大多数', -1, -1, 1, '2022-01-29 16:07:24', 1, '2022-01-29 16:07:24', 0);
INSERT INTO `sg_comment` VALUES (4, '0', 1, -1, '撒大声地', -1, -1, 1, '2022-01-29 16:12:09', 1, '2022-01-29 16:12:09', 0);
INSERT INTO `sg_comment` VALUES (5, '0', 1, -1, '你再说什么', -1, -1, 1, '2022-01-29 18:19:56', 1, '2022-01-29 18:19:56', 0);
INSERT INTO `sg_comment` VALUES (6, '0', 1, -1, 'hffd', -1, -1, 1, '2022-01-29 22:13:52', 1, '2022-01-29 22:13:52', 0);
INSERT INTO `sg_comment` VALUES (9, '0', 1, 2, '你说什么', 1, 2, 1, '2022-01-29 22:18:40', 1, '2022-01-29 22:18:40', 0);
INSERT INTO `sg_comment` VALUES (10, '0', 1, 2, '哈哈哈哈[哈哈]', 1, 9, 1, '2022-01-29 22:29:15', 1, '2022-01-29 22:29:15', 0);
INSERT INTO `sg_comment` VALUES (11, '0', 1, 2, 'we全文', 1, 10, 3, '2022-01-29 22:29:55', 1, '2022-01-29 22:29:55', 0);
INSERT INTO `sg_comment` VALUES (12, '0', 1, -1, '王企鹅', -1, -1, 1, '2022-01-29 22:30:20', 1, '2022-01-29 22:30:20', 0);
INSERT INTO `sg_comment` VALUES (13, '0', 1, -1, '什么阿是', -1, -1, 1, '2022-01-29 22:30:56', 1, '2022-01-29 22:30:56', 0);
INSERT INTO `sg_comment` VALUES (14, '0', 1, -1, '新平顶山', -1, -1, 1, '2022-01-29 22:32:51', 1, '2022-01-29 22:32:51', 0);
INSERT INTO `sg_comment` VALUES (15, '0', 1, -1, '2222', -1, -1, 1, '2022-01-29 22:34:38', 1, '2022-01-29 22:34:38', 0);
INSERT INTO `sg_comment` VALUES (16, '0', 1, 2, '3333', 1, 11, 1, '2022-01-29 22:34:47', 1, '2022-01-29 22:34:47', 0);
INSERT INTO `sg_comment` VALUES (17, '0', 1, 2, '回复weqedadsd', 3, 11, 1, '2022-01-29 22:38:00', 1, '2022-01-29 22:38:00', 0);
INSERT INTO `sg_comment` VALUES (18, '0', 1, -1, 'sdasd', -1, -1, 1, '2022-01-29 23:18:19', 1, '2022-01-29 23:18:19', 0);
INSERT INTO `sg_comment` VALUES (19, '0', 1, -1, '111', -1, -1, 1, '2022-01-29 23:22:23', 1, '2022-01-29 23:22:23', 0);
INSERT INTO `sg_comment` VALUES (20, '0', 1, 1, '你说啥？', 1, 1, 1, '2022-01-30 10:06:21', 1, '2022-01-30 10:06:21', 0);
INSERT INTO `sg_comment` VALUES (21, '0', 1, -1, '友链添加个呗', -1, -1, 1, '2022-01-30 10:06:50', 1, '2022-01-30 10:06:50', 0);
INSERT INTO `sg_comment` VALUES (22, '1', 1, -1, '友链评论2', -1, -1, 1, '2022-01-30 10:08:28', 1, '2022-01-30 10:08:28', 0);
INSERT INTO `sg_comment` VALUES (23, '1', 1, 22, '回复友链评论3', 1, 22, 1, '2022-01-30 10:08:50', 1, '2022-01-30 10:08:50', 0);
INSERT INTO `sg_comment` VALUES (24, '1', 1, -1, '友链评论4444', -1, -1, 1, '2022-01-30 10:09:03', 1, '2022-01-30 10:09:03', 0);
INSERT INTO `sg_comment` VALUES (25, '1', 1, 22, '收到的', 1, 22, 1, '2022-01-30 10:13:28', 1, '2022-01-30 10:13:28', 0);
INSERT INTO `sg_comment` VALUES (26, '0', 1, -1, 'sda', -1, -1, 1, '2022-01-30 10:39:05', 1, '2022-01-30 10:39:05', 0);
INSERT INTO `sg_comment` VALUES (27, '0', 1, 1, '说你咋地', 1, 20, 14787164048662, '2022-01-30 17:19:30', 14787164048662, '2022-01-30 17:19:30', 0);
INSERT INTO `sg_comment` VALUES (28, '0', 1, 1, 'sdad', 1, 1, 14787164048662, '2022-01-31 11:11:20', 14787164048662, '2022-01-31 11:11:20', 0);
INSERT INTO `sg_comment` VALUES (29, '0', 1, -1, '你说是的ad', -1, -1, 14787164048662, '2022-01-31 14:10:11', 14787164048662, '2022-01-31 14:10:11', 0);
INSERT INTO `sg_comment` VALUES (30, '0', 1, 1, '撒大声地', 1, 1, 14787164048662, '2022-01-31 20:19:18', 14787164048662, '2022-01-31 20:19:18', 0);
INSERT INTO `sg_comment` VALUES (31, '0', 1, 20, 'test递归', 1, 20, 1, '2022-04-05 16:06:08', 1, '2022-04-05 16:06:15', 0);
INSERT INTO `sg_comment` VALUES (34, '0', 1, -1, '评论了文章', -1, -1, 1, '2022-04-05 16:44:57', 1, '2022-04-05 16:44:57', 0);

-- ----------------------------
-- Table structure for sg_link
-- ----------------------------
DROP TABLE IF EXISTS `sg_link`;
CREATE TABLE `sg_link`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `logo` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '网站地址',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '2' COMMENT '审核状态 (0代表审核通过，1代表审核未通过，2代表未审核)',
  `create_by` bigint(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(0) NULL DEFAULT 0 COMMENT '删除标志（0代表未删除，1代表已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '友链' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sg_link
-- ----------------------------
INSERT INTO `sg_link` VALUES (1, 'sda', 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fn1.itc.cn%2Fimg8%2Fwb%2Frecom%2F2016%2F05%2F10%2F146286696706220328.PNG&refer=http%3A%2F%2Fn1.itc.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646205529&t=f942665181eb9b0685db7a6f59d59975', 'sda', 'https://www.baidu.com', '0', NULL, '2022-01-13 08:25:47', NULL, '2022-01-13 08:36:14', 0);
INSERT INTO `sg_link` VALUES (2, 'sda', 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fn1.itc.cn%2Fimg8%2Fwb%2Frecom%2F2016%2F05%2F10%2F146286696706220328.PNG&refer=http%3A%2F%2Fn1.itc.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646205529&t=f942665181eb9b0685db7a6f59d59975', 'dada', 'https://www.qq.com', '0', NULL, '2022-01-13 09:06:10', NULL, '2022-01-13 09:07:09', 0);
INSERT INTO `sg_link` VALUES (3, 'sa', 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fn1.itc.cn%2Fimg8%2Fwb%2Frecom%2F2016%2F05%2F10%2F146286696706220328.PNG&refer=http%3A%2F%2Fn1.itc.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646205529&t=f942665181eb9b0685db7a6f59d59975', 'da', 'https://www.taobao.com', '1', NULL, '2022-01-13 09:23:01', NULL, '2022-01-13 09:23:01', 0);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(0) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` bigint(0) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(0) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2028 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, 1, 'M', '0', '0', '', 'system', 0, '2021-11-12 10:46:19', 0, NULL, '系统管理目录', '0');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'oldUser', 'system/oldUser/index', 1, 'C', '0', '0', 'system:oldUser:list', 'oldUser', 0, '2021-11-12 10:46:19', 1, '2022-07-31 15:47:58', '用户管理菜单', '0');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', 1, 'C', '0', '0', 'system:role:list', 'peoples', 0, '2021-11-12 10:46:19', 0, NULL, '角色管理菜单', '0');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 1, 'C', '0', '0', 'system:menu:list', 'tree-table', 0, '2021-11-12 10:46:19', 0, NULL, '菜单管理菜单', '0');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', 1, 'F', '0', '0', 'system:oldUser:query', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', 1, 'F', '0', '0', 'system:oldUser:add', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', 1, 'F', '0', '0', 'system:oldUser:edit', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', 1, 'F', '0', '0', 'system:oldUser:remove', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', 1, 'F', '0', '0', 'system:oldUser:export', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', 1, 'F', '0', '0', 'system:oldUser:import', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', 1, 'F', '0', '0', 'system:oldUser:resetPwd', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', 1, 'F', '0', '0', 'system:role:query', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', 1, 'F', '0', '0', 'system:role:add', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', 1, 'F', '0', '0', 'system:role:edit', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', 1, 'F', '0', '0', 'system:role:remove', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', 1, 'F', '0', '0', 'system:role:export', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', 1, 'F', '0', '0', 'system:menu:query', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', 1, 'F', '0', '0', 'system:menu:add', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', 1, 'F', '0', '0', 'system:menu:edit', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', 1, 'F', '0', '0', 'system:menu:remove', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (2017, '内容管理', 0, 4, 'content', NULL, 1, 'M', '0', '0', NULL, 'table', NULL, '2022-01-08 02:44:38', 1, '2022-07-31 12:34:23', '', '0');
INSERT INTO `sys_menu` VALUES (2018, '分类管理', 2017, 1, 'category', 'content/category/index', 1, 'C', '0', '0', 'content:category:list', 'example', NULL, '2022-01-08 02:51:45', NULL, '2022-01-08 02:51:45', '', '0');
INSERT INTO `sys_menu` VALUES (2019, '文章管理', 2017, 0, 'article', 'content/article/index', 1, 'C', '0', '0', 'content:article:list', 'build', NULL, '2022-01-08 02:53:10', NULL, '2022-01-08 02:53:10', '', '0');
INSERT INTO `sys_menu` VALUES (2021, '标签管理', 2017, 6, 'tag', 'content/tag/index', 1, 'C', '0', '0', 'content:tag:index', 'button', NULL, '2022-01-08 02:55:37', NULL, '2022-01-08 02:55:50', '', '0');
INSERT INTO `sys_menu` VALUES (2022, '友链管理', 2017, 4, 'link', 'content/link/index', 1, 'C', '0', '0', 'content:link:list', '404', NULL, '2022-01-08 02:56:50', NULL, '2022-01-08 02:56:50', '', '0');
INSERT INTO `sys_menu` VALUES (2023, '写博文', 0, 0, 'write', 'content/article/write/index', 1, 'C', '0', '0', 'content:article:writer', 'build', NULL, '2022-01-08 03:39:58', 1, '2022-07-31 22:07:05', '', '0');
INSERT INTO `sys_menu` VALUES (2024, '友链新增', 2022, 0, '', NULL, 1, 'F', '0', '0', 'content:link:add', '#', NULL, '2022-01-16 07:59:17', NULL, '2022-01-16 07:59:17', '', '0');
INSERT INTO `sys_menu` VALUES (2025, '友链修改', 2022, 1, '', NULL, 1, 'F', '0', '0', 'content:link:edit', '#', NULL, '2022-01-16 07:59:44', NULL, '2022-01-16 07:59:44', '', '0');
INSERT INTO `sys_menu` VALUES (2026, '友链删除', 2022, 1, '', NULL, 1, 'F', '0', '0', 'content:link:remove', '#', NULL, '2022-01-16 08:00:05', NULL, '2022-01-16 08:00:05', '', '0');
INSERT INTO `sys_menu` VALUES (2027, '友链查询', 2022, 2, '', NULL, 1, 'F', '0', '0', 'content:link:query', '#', NULL, '2022-01-16 08:04:09', NULL, '2022-01-16 08:04:09', '', '0');
INSERT INTO `sys_menu` VALUES (2028, '导出分类', 2018, 1, '', NULL, 1, 'F', '0', '0', 'content:category:export', '#', NULL, '2022-01-21 07:06:59', NULL, '2022-01-21 07:06:59', '', '0');

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源URL',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `category_id` bigint(0) NULL DEFAULT NULL COMMENT '资源分类ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台资源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES (1, '2020-02-04 17:04:55', '商品品牌管理', '/brand/**', NULL, 1);
INSERT INTO `sys_resource` VALUES (2, '2020-02-04 17:05:35', '商品属性分类管理', '/productAttribute/**', NULL, 1);
INSERT INTO `sys_resource` VALUES (3, '2020-02-04 17:06:13', '商品属性管理', '/productAttribute/**', NULL, 1);
INSERT INTO `sys_resource` VALUES (4, '2020-02-04 17:07:15', '商品分类管理', '/productCategory/**', NULL, 1);
INSERT INTO `sys_resource` VALUES (5, '2020-02-04 17:09:16', '商品管理', '/product/**', NULL, 1);
INSERT INTO `sys_resource` VALUES (6, '2020-02-04 17:09:53', '商品库存管理', '/sku/**', NULL, 1);
INSERT INTO `sys_resource` VALUES (8, '2020-02-05 14:43:37', '订单管理', '/order/**', '', 2);
INSERT INTO `sys_resource` VALUES (9, '2020-02-05 14:44:22', ' 订单退货申请管理', '/returnApply/**', '', 2);
INSERT INTO `sys_resource` VALUES (10, '2020-02-05 14:45:08', '退货原因管理', '/returnReason/**', '', 2);
INSERT INTO `sys_resource` VALUES (11, '2020-02-05 14:45:43', '订单设置管理', '/orderSetting/**', '', 2);
INSERT INTO `sys_resource` VALUES (12, '2020-02-05 14:46:23', '收货地址管理', '/companyAddress/**', '', 2);
INSERT INTO `sys_resource` VALUES (13, '2020-02-07 16:37:22', '优惠券管理', '/coupon/**', '', 3);
INSERT INTO `sys_resource` VALUES (14, '2020-02-07 16:37:59', '优惠券领取记录管理', '/couponHistory/**', '', 3);
INSERT INTO `sys_resource` VALUES (15, '2020-02-07 16:38:28', '限时购活动管理', '/flash/**', '', 3);
INSERT INTO `sys_resource` VALUES (16, '2020-02-07 16:38:59', '限时购商品关系管理', '/flashProductRelation/**', '', 3);
INSERT INTO `sys_resource` VALUES (17, '2020-02-07 16:39:22', '限时购场次管理', '/flashSession/**', '', 3);
INSERT INTO `sys_resource` VALUES (18, '2020-02-07 16:40:07', '首页轮播广告管理', '/home/advertise/**', '', 3);
INSERT INTO `sys_resource` VALUES (19, '2020-02-07 16:40:34', '首页品牌管理', '/home/brand/**', '', 3);
INSERT INTO `sys_resource` VALUES (20, '2020-02-07 16:41:06', '首页新品管理', '/home/newProduct/**', '', 3);
INSERT INTO `sys_resource` VALUES (21, '2020-02-07 16:42:16', '首页人气推荐管理', '/home/recommendProduct/**', '', 3);
INSERT INTO `sys_resource` VALUES (22, '2020-02-07 16:42:48', '首页专题推荐管理', '/home/recommendSubject/**', '', 3);
INSERT INTO `sys_resource` VALUES (23, '2020-02-07 16:44:56', ' 商品优选管理', '/prefrenceArea/**', '', 5);
INSERT INTO `sys_resource` VALUES (24, '2020-02-07 16:45:39', '商品专题管理', '/subject/**', '', 5);
INSERT INTO `sys_resource` VALUES (25, '2020-02-07 16:47:34', '后台用户管理', '/admin/**', '', 4);
INSERT INTO `sys_resource` VALUES (26, '2020-02-07 16:48:24', '后台用户角色管理', '/role/**', '', 4);
INSERT INTO `sys_resource` VALUES (27, '2020-02-07 16:48:48', '后台菜单管理', '/menu/**', '', 4);
INSERT INTO `sys_resource` VALUES (28, '2020-02-07 16:49:18', '后台资源分类管理', '/resourceCategory/**', '', 4);
INSERT INTO `sys_resource` VALUES (29, '2020-02-07 16:49:45', '后台资源管理', '/resource/**', '', 4);

-- ----------------------------
-- Table structure for sys_resource_category
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource_category`;
CREATE TABLE `sys_resource_category`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资源分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_resource_category
-- ----------------------------
INSERT INTO `sys_resource_category` VALUES (1, '2020-02-05 10:21:44', '商品模块', 0);
INSERT INTO `sys_resource_category` VALUES (2, '2020-02-05 10:22:34', '订单模块', 0);
INSERT INTO `sys_resource_category` VALUES (3, '2020-02-05 10:22:48', '营销模块', 0);
INSERT INTO `sys_resource_category` VALUES (4, '2020-02-05 10:23:04', '权限模块', 0);
INSERT INTO `sys_resource_category` VALUES (5, '2020-02-07 16:34:27', '内容模块', 0);
INSERT INTO `sys_resource_category` VALUES (6, '2020-02-07 16:35:49', '其他模块', 0);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `uid` bigint(0) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `status` int(0) NULL DEFAULT 1 COMMENT '启用状态：0->禁用；1->启用',
  `summary` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '一般管理员', '2022-12-04 16:14:27', '2022-12-04 16:14:27', 1, NULL);
INSERT INTO `sys_role` VALUES (5, '超级管理员', '2022-12-04 16:14:53', '2022-12-04 16:14:53', 1, NULL);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (0, 0);
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (3, 2);
INSERT INTO `sys_role_menu` VALUES (3, 3);
INSERT INTO `sys_role_menu` VALUES (3, 4);
INSERT INTO `sys_role_menu` VALUES (3, 100);
INSERT INTO `sys_role_menu` VALUES (3, 101);
INSERT INTO `sys_role_menu` VALUES (3, 103);
INSERT INTO `sys_role_menu` VALUES (3, 104);
INSERT INTO `sys_role_menu` VALUES (3, 105);
INSERT INTO `sys_role_menu` VALUES (3, 106);
INSERT INTO `sys_role_menu` VALUES (3, 107);
INSERT INTO `sys_role_menu` VALUES (3, 108);
INSERT INTO `sys_role_menu` VALUES (3, 109);
INSERT INTO `sys_role_menu` VALUES (3, 110);
INSERT INTO `sys_role_menu` VALUES (3, 111);
INSERT INTO `sys_role_menu` VALUES (3, 112);
INSERT INTO `sys_role_menu` VALUES (3, 113);
INSERT INTO `sys_role_menu` VALUES (3, 114);
INSERT INTO `sys_role_menu` VALUES (3, 115);
INSERT INTO `sys_role_menu` VALUES (3, 116);
INSERT INTO `sys_role_menu` VALUES (3, 500);
INSERT INTO `sys_role_menu` VALUES (3, 501);
INSERT INTO `sys_role_menu` VALUES (3, 1001);
INSERT INTO `sys_role_menu` VALUES (3, 1002);
INSERT INTO `sys_role_menu` VALUES (3, 1003);
INSERT INTO `sys_role_menu` VALUES (3, 1004);
INSERT INTO `sys_role_menu` VALUES (3, 1005);
INSERT INTO `sys_role_menu` VALUES (3, 1006);
INSERT INTO `sys_role_menu` VALUES (3, 1007);
INSERT INTO `sys_role_menu` VALUES (3, 1008);
INSERT INTO `sys_role_menu` VALUES (3, 1009);
INSERT INTO `sys_role_menu` VALUES (3, 1010);
INSERT INTO `sys_role_menu` VALUES (3, 1011);
INSERT INTO `sys_role_menu` VALUES (3, 1012);
INSERT INTO `sys_role_menu` VALUES (3, 1017);
INSERT INTO `sys_role_menu` VALUES (3, 1018);
INSERT INTO `sys_role_menu` VALUES (3, 1019);
INSERT INTO `sys_role_menu` VALUES (3, 1020);
INSERT INTO `sys_role_menu` VALUES (3, 1021);
INSERT INTO `sys_role_menu` VALUES (3, 1022);
INSERT INTO `sys_role_menu` VALUES (3, 1023);
INSERT INTO `sys_role_menu` VALUES (3, 1024);
INSERT INTO `sys_role_menu` VALUES (3, 1025);
INSERT INTO `sys_role_menu` VALUES (3, 1026);
INSERT INTO `sys_role_menu` VALUES (3, 1027);
INSERT INTO `sys_role_menu` VALUES (3, 1028);
INSERT INTO `sys_role_menu` VALUES (3, 1029);
INSERT INTO `sys_role_menu` VALUES (3, 1030);
INSERT INTO `sys_role_menu` VALUES (3, 1031);
INSERT INTO `sys_role_menu` VALUES (3, 1032);
INSERT INTO `sys_role_menu` VALUES (3, 1033);
INSERT INTO `sys_role_menu` VALUES (3, 1034);
INSERT INTO `sys_role_menu` VALUES (3, 1035);
INSERT INTO `sys_role_menu` VALUES (3, 1036);
INSERT INTO `sys_role_menu` VALUES (3, 1037);
INSERT INTO `sys_role_menu` VALUES (3, 1038);
INSERT INTO `sys_role_menu` VALUES (3, 1039);
INSERT INTO `sys_role_menu` VALUES (3, 1040);
INSERT INTO `sys_role_menu` VALUES (3, 1041);
INSERT INTO `sys_role_menu` VALUES (3, 1042);
INSERT INTO `sys_role_menu` VALUES (3, 1043);
INSERT INTO `sys_role_menu` VALUES (3, 1044);
INSERT INTO `sys_role_menu` VALUES (3, 1045);
INSERT INTO `sys_role_menu` VALUES (3, 1046);
INSERT INTO `sys_role_menu` VALUES (3, 1047);
INSERT INTO `sys_role_menu` VALUES (3, 1048);
INSERT INTO `sys_role_menu` VALUES (3, 1049);
INSERT INTO `sys_role_menu` VALUES (3, 1050);
INSERT INTO `sys_role_menu` VALUES (3, 1051);
INSERT INTO `sys_role_menu` VALUES (3, 1052);
INSERT INTO `sys_role_menu` VALUES (3, 1053);
INSERT INTO `sys_role_menu` VALUES (3, 1054);
INSERT INTO `sys_role_menu` VALUES (3, 1055);
INSERT INTO `sys_role_menu` VALUES (3, 1056);
INSERT INTO `sys_role_menu` VALUES (3, 1057);
INSERT INTO `sys_role_menu` VALUES (3, 1058);
INSERT INTO `sys_role_menu` VALUES (3, 1059);
INSERT INTO `sys_role_menu` VALUES (3, 1060);
INSERT INTO `sys_role_menu` VALUES (3, 2000);
INSERT INTO `sys_role_menu` VALUES (11, 1);
INSERT INTO `sys_role_menu` VALUES (11, 100);
INSERT INTO `sys_role_menu` VALUES (11, 101);
INSERT INTO `sys_role_menu` VALUES (11, 102);
INSERT INTO `sys_role_menu` VALUES (11, 103);
INSERT INTO `sys_role_menu` VALUES (11, 104);
INSERT INTO `sys_role_menu` VALUES (11, 105);
INSERT INTO `sys_role_menu` VALUES (11, 106);
INSERT INTO `sys_role_menu` VALUES (11, 107);
INSERT INTO `sys_role_menu` VALUES (11, 108);
INSERT INTO `sys_role_menu` VALUES (11, 500);
INSERT INTO `sys_role_menu` VALUES (11, 501);
INSERT INTO `sys_role_menu` VALUES (11, 1001);
INSERT INTO `sys_role_menu` VALUES (11, 1002);
INSERT INTO `sys_role_menu` VALUES (11, 1003);
INSERT INTO `sys_role_menu` VALUES (11, 1004);
INSERT INTO `sys_role_menu` VALUES (11, 1005);
INSERT INTO `sys_role_menu` VALUES (11, 1006);
INSERT INTO `sys_role_menu` VALUES (11, 1007);
INSERT INTO `sys_role_menu` VALUES (11, 1008);
INSERT INTO `sys_role_menu` VALUES (11, 1009);
INSERT INTO `sys_role_menu` VALUES (11, 1010);
INSERT INTO `sys_role_menu` VALUES (11, 1011);
INSERT INTO `sys_role_menu` VALUES (11, 1012);
INSERT INTO `sys_role_menu` VALUES (11, 1013);
INSERT INTO `sys_role_menu` VALUES (11, 1014);
INSERT INTO `sys_role_menu` VALUES (11, 1015);
INSERT INTO `sys_role_menu` VALUES (11, 1016);
INSERT INTO `sys_role_menu` VALUES (11, 1017);
INSERT INTO `sys_role_menu` VALUES (11, 1018);
INSERT INTO `sys_role_menu` VALUES (11, 1019);
INSERT INTO `sys_role_menu` VALUES (11, 1020);
INSERT INTO `sys_role_menu` VALUES (11, 1021);
INSERT INTO `sys_role_menu` VALUES (11, 1022);
INSERT INTO `sys_role_menu` VALUES (11, 1023);
INSERT INTO `sys_role_menu` VALUES (11, 1024);
INSERT INTO `sys_role_menu` VALUES (11, 1025);
INSERT INTO `sys_role_menu` VALUES (11, 1026);
INSERT INTO `sys_role_menu` VALUES (11, 1027);
INSERT INTO `sys_role_menu` VALUES (11, 1028);
INSERT INTO `sys_role_menu` VALUES (11, 1029);
INSERT INTO `sys_role_menu` VALUES (11, 1030);
INSERT INTO `sys_role_menu` VALUES (11, 1031);
INSERT INTO `sys_role_menu` VALUES (11, 1032);
INSERT INTO `sys_role_menu` VALUES (11, 1033);
INSERT INTO `sys_role_menu` VALUES (11, 1034);
INSERT INTO `sys_role_menu` VALUES (11, 1035);
INSERT INTO `sys_role_menu` VALUES (11, 1036);
INSERT INTO `sys_role_menu` VALUES (11, 1037);
INSERT INTO `sys_role_menu` VALUES (11, 1038);
INSERT INTO `sys_role_menu` VALUES (11, 1039);
INSERT INTO `sys_role_menu` VALUES (11, 1040);
INSERT INTO `sys_role_menu` VALUES (11, 1041);
INSERT INTO `sys_role_menu` VALUES (11, 1042);
INSERT INTO `sys_role_menu` VALUES (11, 1043);
INSERT INTO `sys_role_menu` VALUES (11, 1044);
INSERT INTO `sys_role_menu` VALUES (11, 1045);
INSERT INTO `sys_role_menu` VALUES (11, 2000);
INSERT INTO `sys_role_menu` VALUES (11, 2003);
INSERT INTO `sys_role_menu` VALUES (11, 2004);
INSERT INTO `sys_role_menu` VALUES (11, 2005);
INSERT INTO `sys_role_menu` VALUES (11, 2006);
INSERT INTO `sys_role_menu` VALUES (11, 2007);
INSERT INTO `sys_role_menu` VALUES (11, 2008);
INSERT INTO `sys_role_menu` VALUES (11, 2009);
INSERT INTO `sys_role_menu` VALUES (11, 2010);
INSERT INTO `sys_role_menu` VALUES (11, 2011);
INSERT INTO `sys_role_menu` VALUES (11, 2012);
INSERT INTO `sys_role_menu` VALUES (11, 2013);
INSERT INTO `sys_role_menu` VALUES (11, 2014);
INSERT INTO `sys_role_menu` VALUES (12, 2017);
INSERT INTO `sys_role_menu` VALUES (12, 2022);
INSERT INTO `sys_role_menu` VALUES (12, 2024);
INSERT INTO `sys_role_menu` VALUES (12, 2025);
INSERT INTO `sys_role_menu` VALUES (12, 2026);
INSERT INTO `sys_role_menu` VALUES (12, 2027);

-- ----------------------------
-- Table structure for sys_role_resource_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource_relation`;
CREATE TABLE `sys_role_resource_relation`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(0) NULL DEFAULT NULL COMMENT '角色ID',
  `resource_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 256 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台角色资源关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_resource_relation
-- ----------------------------
INSERT INTO `sys_role_resource_relation` VALUES (1, 5, '02ea2f9ef5d44f559fb66189b05f6769');
INSERT INTO `sys_role_resource_relation` VALUES (2, 5, '062087bce19d00312b3787b6e24c21d1');
INSERT INTO `sys_role_resource_relation` VALUES (3, 5, '065cda845549289b2afcd0129d87c2c0');
INSERT INTO `sys_role_resource_relation` VALUES (4, 5, '079f0cfdb7a7017d827f5c349983eebc');
INSERT INTO `sys_role_resource_relation` VALUES (5, 5, '0a035547bbec404eb3ee0ef43312148d');
INSERT INTO `sys_role_resource_relation` VALUES (6, 5, '0cab1fcdcd01f394768e2e2674e56773');
INSERT INTO `sys_role_resource_relation` VALUES (7, 5, '147cd431cbb9007bde87444d7987b151');
INSERT INTO `sys_role_resource_relation` VALUES (8, 5, '14bcfc15d02f0d568adf2d383c0342d8');
INSERT INTO `sys_role_resource_relation` VALUES (9, 5, '152216a4fd9b995aa20bfa1eec6312c2');
INSERT INTO `sys_role_resource_relation` VALUES (10, 5, '16a75a3c38e71c1046b443b4b64dd930');
INSERT INTO `sys_role_resource_relation` VALUES (11, 5, '1cc493d36e17fad535f2bf70242162b0');
INSERT INTO `sys_role_resource_relation` VALUES (12, 5, '1d9a5030142e9fd7690f554c20e3bc90');
INSERT INTO `sys_role_resource_relation` VALUES (13, 5, '1dd262b88b63e8f6bd9a6ca72ed0622c');
INSERT INTO `sys_role_resource_relation` VALUES (14, 5, '1f01cd1d2f474743b241d74008b12333');
INSERT INTO `sys_role_resource_relation` VALUES (15, 5, '21a411858fc22b5feb4c44fcad00e529');
INSERT INTO `sys_role_resource_relation` VALUES (16, 5, '237d410f90d0c70b894f87a87718d88c');
INSERT INTO `sys_role_resource_relation` VALUES (17, 5, '238352fc7e86340c339b9a575b1b7086');
INSERT INTO `sys_role_resource_relation` VALUES (18, 5, '2496af227b283bc79d9261b73e3ea743');
INSERT INTO `sys_role_resource_relation` VALUES (19, 5, '25b3ea9639872aa730ad6147baf61641');
INSERT INTO `sys_role_resource_relation` VALUES (20, 5, '26bcccf0164bf84f12ab20448388d346');
INSERT INTO `sys_role_resource_relation` VALUES (21, 5, '2a733ff390af9b44ecda4e8c4634d73k');
INSERT INTO `sys_role_resource_relation` VALUES (22, 5, '2a733ff390af9b44ecda4e8c4634d75d');
INSERT INTO `sys_role_resource_relation` VALUES (23, 5, '2a733ff390af9b44ecda4e8c4634d75f');
INSERT INTO `sys_role_resource_relation` VALUES (24, 5, '2a733ff390af9b44ecda4e8c4634d75k');
INSERT INTO `sys_role_resource_relation` VALUES (25, 5, '2a733ff390af9b44ecda4e8c4634d75t');
INSERT INTO `sys_role_resource_relation` VALUES (26, 5, '2a733ff390af9b44ecda4e8c4634d75u');
INSERT INTO `sys_role_resource_relation` VALUES (27, 5, '2a733ff390af9b44ecda4e8c4634d75v');
INSERT INTO `sys_role_resource_relation` VALUES (28, 5, '2a733ff390af9b44ecda4e8c4634d78k');
INSERT INTO `sys_role_resource_relation` VALUES (29, 5, '2a733ff390af9b44ecda4e8c4634d7ck');
INSERT INTO `sys_role_resource_relation` VALUES (30, 5, '2a733ff390af9b44ecda4e8c4634d7gk');
INSERT INTO `sys_role_resource_relation` VALUES (31, 5, '2a733ff390af9b44ecda4e8c4634d7lk');
INSERT INTO `sys_role_resource_relation` VALUES (32, 5, '2a733ff390af9b44ecda4e8c4634d7pk');
INSERT INTO `sys_role_resource_relation` VALUES (33, 5, '2a733ff390af9b44ecda4e8c4634d7uk');
INSERT INTO `sys_role_resource_relation` VALUES (34, 5, '2a733ff390af9b44ecda4e8c4634db8k');
INSERT INTO `sys_role_resource_relation` VALUES (35, 5, '2a733ff390af9b44ecda4e8c4634dh8c');
INSERT INTO `sys_role_resource_relation` VALUES (36, 5, '2a733ff390af9b44ecda4e8c4634dh8k');
INSERT INTO `sys_role_resource_relation` VALUES (37, 5, '2a733ff390af9b44ecda4e8c4634dm8k');
INSERT INTO `sys_role_resource_relation` VALUES (38, 5, '2b983c5439ac07f2cf07437ba9fff6be');
INSERT INTO `sys_role_resource_relation` VALUES (39, 5, '2d5cd8a387fc2d010c245acd65fefd3b');
INSERT INTO `sys_role_resource_relation` VALUES (40, 5, '2de247af3b0a459095e937d7ab9f5864');
INSERT INTO `sys_role_resource_relation` VALUES (41, 5, '2fb47d3b6dbd44279c8206740a263543');
INSERT INTO `sys_role_resource_relation` VALUES (42, 5, '327d945daf4ddb71976c4ab3830e7c4i');
INSERT INTO `sys_role_resource_relation` VALUES (43, 5, '327d945daf4ddb71976c4ab3830e7c66');
INSERT INTO `sys_role_resource_relation` VALUES (44, 5, '327d945daf4ddb71976c4ab3830e7c6h');
INSERT INTO `sys_role_resource_relation` VALUES (45, 5, '327d945daf4ddb71976c4ab3830e7c6i');
INSERT INTO `sys_role_resource_relation` VALUES (46, 5, '327d945daf4ddb71976c4ab3830e7c7i');
INSERT INTO `sys_role_resource_relation` VALUES (47, 5, '327d945daf4ddb71976c4ab3830e7cdi');
INSERT INTO `sys_role_resource_relation` VALUES (48, 5, '327d945daf4ddb71976c4ab3830e7cfi');
INSERT INTO `sys_role_resource_relation` VALUES (49, 5, '327d945daf4ddb71976c4ab3830e7cmi');
INSERT INTO `sys_role_resource_relation` VALUES (50, 5, '327d945daf4ddb71976c4ab3830e7cqi');
INSERT INTO `sys_role_resource_relation` VALUES (51, 5, '327d945daf4ddb71976c4ab3830e7cvi');
INSERT INTO `sys_role_resource_relation` VALUES (52, 5, '327d945daf4ddb71976c4ab3830e7d7i');
INSERT INTO `sys_role_resource_relation` VALUES (53, 5, '327d945daf4ddb71976c4ab3830e7g7d');
INSERT INTO `sys_role_resource_relation` VALUES (54, 5, '327d945daf4ddb71976c4ab3830e7g7i');
INSERT INTO `sys_role_resource_relation` VALUES (55, 5, '34c1b7b1bd3118979fe1f9f9a1147fa5');
INSERT INTO `sys_role_resource_relation` VALUES (56, 5, '3e92f2fd6cf012d30bfae2d9cdb7092d');
INSERT INTO `sys_role_resource_relation` VALUES (57, 5, '3eacc357e23b0b17e4f835c2f998ed34');
INSERT INTO `sys_role_resource_relation` VALUES (58, 5, '4062db4658392e71c177758bb51bb4cb');
INSERT INTO `sys_role_resource_relation` VALUES (59, 5, '407a263eb12eff5aac31e9f62901cea0');
INSERT INTO `sys_role_resource_relation` VALUES (60, 5, '4337f63d13d84b9aba64b9d7a69fd066');
INSERT INTO `sys_role_resource_relation` VALUES (61, 5, '49b42250abcb47ff876bad699cf34f03');
INSERT INTO `sys_role_resource_relation` VALUES (62, 5, '4dea9c4f39d2480983e8c4333d35e036');
INSERT INTO `sys_role_resource_relation` VALUES (63, 5, '4fe7725159ced4a238b816a4595109d1');
INSERT INTO `sys_role_resource_relation` VALUES (64, 5, '5010ae46511e4c0b9f30d1c63ad3f0c1');
INSERT INTO `sys_role_resource_relation` VALUES (65, 5, '505b4769b77617a314a3ed78e4acdff7');
INSERT INTO `sys_role_resource_relation` VALUES (66, 5, '510483ce569b4fc88299f346147b1314');
INSERT INTO `sys_role_resource_relation` VALUES (67, 5, '587e2697fa4d85046feece8ab9d0706c');
INSERT INTO `sys_role_resource_relation` VALUES (68, 5, '5bf9bd28d387ef923f2c5d11ec01fbbd');
INSERT INTO `sys_role_resource_relation` VALUES (69, 5, '5ef38a4f70c6d859155528776a30cda7');
INSERT INTO `sys_role_resource_relation` VALUES (70, 5, '6228ff4e9ebd42c89599b322201a0345');
INSERT INTO `sys_role_resource_relation` VALUES (71, 5, '6275bc5189e2e595b621d744d68278af');
INSERT INTO `sys_role_resource_relation` VALUES (72, 5, '62c91c47c4646661c045727f0a8eb9d4');
INSERT INTO `sys_role_resource_relation` VALUES (73, 5, '65e22f3d36d94bcea47478aba02895a1');
INSERT INTO `sys_role_resource_relation` VALUES (74, 5, '6606b7e646d545e5a25c70b5e5fade9f');
INSERT INTO `sys_role_resource_relation` VALUES (75, 5, '672b093002b618293befd8e1a164e4cc');
INSERT INTO `sys_role_resource_relation` VALUES (76, 5, '688beda820a236b50f18ccdd5dc9fee9');
INSERT INTO `sys_role_resource_relation` VALUES (77, 5, '6c8a8c50c77429fab210bd52ed8c50ba');
INSERT INTO `sys_role_resource_relation` VALUES (78, 5, '6c8a8c50c77429fab210bd52ed8c50bb');
INSERT INTO `sys_role_resource_relation` VALUES (79, 5, '72d26cf940bf9dfb6bde0a590ff40882');
INSERT INTO `sys_role_resource_relation` VALUES (80, 5, '72d26cf940bf9dfb6bde0a590ff4088g');
INSERT INTO `sys_role_resource_relation` VALUES (81, 5, '72d26cf940bf9dfb6bde0a590ff4088j');
INSERT INTO `sys_role_resource_relation` VALUES (82, 5, '72d26cf940bf9dfb6bde0a590ff4088s');
INSERT INTO `sys_role_resource_relation` VALUES (83, 5, '72d26cf940bf9dfb6bde0a590ff408ej');
INSERT INTO `sys_role_resource_relation` VALUES (84, 5, '72d26cf940bf9dfb6bde0a590ff408nj');
INSERT INTO `sys_role_resource_relation` VALUES (85, 5, '7668dabe69473f59d1516d84cb99d583');
INSERT INTO `sys_role_resource_relation` VALUES (86, 5, '78ab104b123f4950af14d65798afb756');
INSERT INTO `sys_role_resource_relation` VALUES (87, 5, '78f24799307cb63bc3759413dadf4d1a');
INSERT INTO `sys_role_resource_relation` VALUES (88, 5, '7ada0a7053be4ad4b31f6be64315d03a');
INSERT INTO `sys_role_resource_relation` VALUES (89, 5, '7be9dee2f91165d8562aaa80c7e5b936');
INSERT INTO `sys_role_resource_relation` VALUES (90, 5, '7cb1a6b7462832bf831a18a28eea94cd');
INSERT INTO `sys_role_resource_relation` VALUES (91, 5, '80ee135af885f02d52ecb67d5a05b173');
INSERT INTO `sys_role_resource_relation` VALUES (92, 5, '80ee135af885f02d52ecb67d5a05b17b');
INSERT INTO `sys_role_resource_relation` VALUES (93, 5, '82962bbcdb674a3fdd57aec131114d56');
INSERT INTO `sys_role_resource_relation` VALUES (94, 5, '86508603e6d78036db0bf9222946f68c');
INSERT INTO `sys_role_resource_relation` VALUES (95, 5, '879cfcd4dfd3e5bc1bb6ea2c0f1f82c0');
INSERT INTO `sys_role_resource_relation` VALUES (96, 5, '8b40ea466efc42f497c49c8a610c9c20');
INSERT INTO `sys_role_resource_relation` VALUES (97, 5, '9002d1ae905c4cb79c2a485333dad2f7');
INSERT INTO `sys_role_resource_relation` VALUES (98, 5, '93f7fd9a6e81735c47649e6b36042b5d');
INSERT INTO `sys_role_resource_relation` VALUES (99, 5, '9449ce5dd5e24b21a9d15f806cb36e87');
INSERT INTO `sys_role_resource_relation` VALUES (100, 5, '94bee9c48a4611c96b89112b845c7f28');
INSERT INTO `sys_role_resource_relation` VALUES (101, 5, '98b82be8785e41dc939b6a5517fdfa53');
INSERT INTO `sys_role_resource_relation` VALUES (102, 5, '99f5d4233d446a809b9937961c590766');
INSERT INTO `sys_role_resource_relation` VALUES (103, 5, '9bbe311a4ccb087560e6e2c6d40cf271');
INSERT INTO `sys_role_resource_relation` VALUES (104, 5, '9beb7caa2c844b36a02789262dc76fbe');
INSERT INTO `sys_role_resource_relation` VALUES (105, 5, '9c91231f1682aabd765225a7e503bb43');
INSERT INTO `sys_role_resource_relation` VALUES (106, 5, '9db7ffbded9717f13a1a97fca46bc17c');
INSERT INTO `sys_role_resource_relation` VALUES (107, 5, '9e73a9b1de18e4f1cb19eca5e8cd321d');
INSERT INTO `sys_role_resource_relation` VALUES (108, 5, '9e91b4f993c946cba4bf720b2c1b2e90');
INSERT INTO `sys_role_resource_relation` VALUES (109, 5, 'a0c40ddd3fe15bb3f2edf9ec242a1511');
INSERT INTO `sys_role_resource_relation` VALUES (110, 5, 'a5902692a3ed4fd794895bf634f97b8e');
INSERT INTO `sys_role_resource_relation` VALUES (111, 5, 'a8bad1abec6c8fc8d4bce5a27829c878');
INSERT INTO `sys_role_resource_relation` VALUES (112, 5, 'a9396f1a3fbdec3d4cb614f388a22bea');
INSERT INTO `sys_role_resource_relation` VALUES (113, 5, 'aa225cdae6464bc0acebd732192f8362');
INSERT INTO `sys_role_resource_relation` VALUES (114, 5, 'aa6c5d513421aa50cac1ee9ec647d100');
INSERT INTO `sys_role_resource_relation` VALUES (115, 5, 'ab1289c29b336dccda87a9fa8b711aa2');
INSERT INTO `sys_role_resource_relation` VALUES (116, 5, 'acbb5d09da25e6c9e019cc361b35d159');
INSERT INTO `sys_role_resource_relation` VALUES (117, 5, 'aef85c40b54320d7c5a9d78697e12910');
INSERT INTO `sys_role_resource_relation` VALUES (118, 5, 'aef85c40b54320d7c5a9d78697e1291c');
INSERT INTO `sys_role_resource_relation` VALUES (119, 5, 'aef85c40b54320d7c5a9d78697e1295n');
INSERT INTO `sys_role_resource_relation` VALUES (120, 5, 'aef85c40b54320d7c5a9d78697e1296n');
INSERT INTO `sys_role_resource_relation` VALUES (121, 5, 'aef85c40b54320d7c5a9d78697e129rn');
INSERT INTO `sys_role_resource_relation` VALUES (122, 5, 'aef85c40b54320d7c5a9d78697e12e6n');
INSERT INTO `sys_role_resource_relation` VALUES (123, 5, 'af0e753d3ea0adf5cd8cf1dd55f162c2');
INSERT INTO `sys_role_resource_relation` VALUES (124, 5, 'b21105b915a5b54588c2cd458a94d2d5');
INSERT INTO `sys_role_resource_relation` VALUES (125, 5, 'b511cae571834971a392ae4779270034');
INSERT INTO `sys_role_resource_relation` VALUES (126, 5, 'b7fc36f7efc9738bddc9b09fedeccf60');
INSERT INTO `sys_role_resource_relation` VALUES (127, 5, 'baa21ccb45ee133b064187185edb2ac0');
INSERT INTO `sys_role_resource_relation` VALUES (128, 5, 'baace3dc03d34c54b81761dce8243814');
INSERT INTO `sys_role_resource_relation` VALUES (129, 5, 'badf0010422b432ba6ec9c83a25012ed');
INSERT INTO `sys_role_resource_relation` VALUES (130, 5, 'bcf4a9bc21c14b559bcb015fb7912266');
INSERT INTO `sys_role_resource_relation` VALUES (131, 5, 'bcfac78203944094040851cc0a9bb095');
INSERT INTO `sys_role_resource_relation` VALUES (132, 5, 'bfc9463e59a3ca250dcfc1c86627e034');
INSERT INTO `sys_role_resource_relation` VALUES (133, 5, 'bfcb9b002c3de18f269189c573b985f8');
INSERT INTO `sys_role_resource_relation` VALUES (134, 5, 'c28f0b052e0b930299dd53de59cc32d7');
INSERT INTO `sys_role_resource_relation` VALUES (135, 5, 'c2a1218dd07747a57b055f184ddae217');
INSERT INTO `sys_role_resource_relation` VALUES (136, 5, 'c519725da92b42f3acf0cc9fad58c664');
INSERT INTO `sys_role_resource_relation` VALUES (137, 5, 'cbd7ba11c1b38c66b569405ed9185f35');
INSERT INTO `sys_role_resource_relation` VALUES (138, 5, 'ccc0dced06919403832647a871312f09');
INSERT INTO `sys_role_resource_relation` VALUES (139, 5, 'd3a19221259d439b916f475e43edb13d');
INSERT INTO `sys_role_resource_relation` VALUES (140, 5, 'd4d92c53d3614d00865e9219b8292a90');
INSERT INTO `sys_role_resource_relation` VALUES (141, 5, 'da32aa8f92ae7fe7e7f445bf1028d2df');
INSERT INTO `sys_role_resource_relation` VALUES (142, 5, 'e1e54aea65cc22d9f8a4c74ce8d23749');
INSERT INTO `sys_role_resource_relation` VALUES (143, 5, 'e4a482c089d04a30b6ecbaadb81b70f8');
INSERT INTO `sys_role_resource_relation` VALUES (144, 5, 'e5218b0b1cf016ae21eced4e47b628ac');
INSERT INTO `sys_role_resource_relation` VALUES (145, 5, 'e76ec0b7226985a414f035e2ecbd00b4');
INSERT INTO `sys_role_resource_relation` VALUES (146, 5, 'e91945e49c5fdb207f996bc9668cd965');
INSERT INTO `sys_role_resource_relation` VALUES (147, 5, 'ed535411a72bb5cdd62aade25ca6e9c9');
INSERT INTO `sys_role_resource_relation` VALUES (148, 5, 'f3a559635f9d46ee3356d072f5896fcb');
INSERT INTO `sys_role_resource_relation` VALUES (149, 5, 'f4697cdf85920369179b90ff45a5982d');
INSERT INTO `sys_role_resource_relation` VALUES (150, 5, 'f874529321a37e84f099488a4eaf5a0b');
INSERT INTO `sys_role_resource_relation` VALUES (151, 5, 'f87d2f9b4539abbade38583420dc8b2l');
INSERT INTO `sys_role_resource_relation` VALUES (152, 5, 'f87d2f9b4539abbade38583420dc8b89');
INSERT INTO `sys_role_resource_relation` VALUES (153, 5, 'f87d2f9b4539abbade38583420dc8b8e');
INSERT INTO `sys_role_resource_relation` VALUES (154, 5, 'f87d2f9b4539abbade38583420dc8b8l');
INSERT INTO `sys_role_resource_relation` VALUES (155, 5, 'f87d2f9b4539abbade38583420dc8b8r');
INSERT INTO `sys_role_resource_relation` VALUES (156, 5, 'f87d2f9b4539abbade38583420dc8b9l');
INSERT INTO `sys_role_resource_relation` VALUES (157, 5, 'f87d2f9b4539abbade38583420dc8bbl');
INSERT INTO `sys_role_resource_relation` VALUES (158, 5, 'f87d2f9b4539abbade38583420dc8bhl');
INSERT INTO `sys_role_resource_relation` VALUES (159, 5, 'f87d2f9b4539abbade38583420dc8bkl');
INSERT INTO `sys_role_resource_relation` VALUES (160, 5, 'f87d2f9b4539abbade38583420dc8bol');
INSERT INTO `sys_role_resource_relation` VALUES (161, 5, 'f87d2f9b4539abbade38583420dc8bpl');
INSERT INTO `sys_role_resource_relation` VALUES (162, 5, 'f87d2f9b4539abbade38583420dc8btl');
INSERT INTO `sys_role_resource_relation` VALUES (163, 5, 'f87d2f9b4539abbade38583420dc8bxl');
INSERT INTO `sys_role_resource_relation` VALUES (164, 5, 'f87d2f9b4539abbade38583420dc8byl');
INSERT INTO `sys_role_resource_relation` VALUES (165, 5, 'f87d2f9b4539abbade38583420dc8c9l');
INSERT INTO `sys_role_resource_relation` VALUES (166, 5, 'f87d2f9b4539abbade38583420dc8i9b');
INSERT INTO `sys_role_resource_relation` VALUES (167, 5, 'f87d2f9b4539abbade38583420dc8i9l');
INSERT INTO `sys_role_resource_relation` VALUES (168, 5, 'f87d2f9b4539abbade38583420dc8l9l');
INSERT INTO `sys_role_resource_relation` VALUES (169, 5, 'f9276eb8e3274c8aa05577c86e4dc8c1');
INSERT INTO `sys_role_resource_relation` VALUES (170, 5, 'fa1e85a9c7734d27df07bc730206bd1a');
INSERT INTO `sys_role_resource_relation` VALUES (171, 5, 'faccfe476b89483791c05019ad5b4906');
INSERT INTO `sys_role_resource_relation` VALUES (172, 5, 'fb4237a353d0418ab42c748b7c1d64c6');
INSERT INTO `sys_role_resource_relation` VALUES (173, 5, 'fbc30e4ae5bb33b39baca7bf6bd8ca0m');
INSERT INTO `sys_role_resource_relation` VALUES (174, 5, 'fbc30e4ae5bb33b39baca7bf6bd8ce0m');
INSERT INTO `sys_role_resource_relation` VALUES (175, 5, 'fbc30e4ae5bb33b39baca7bf6bd8ce1m');
INSERT INTO `sys_role_resource_relation` VALUES (176, 5, 'fbc30e4ae5bb33b39baca7bf6bd8ce99');
INSERT INTO `sys_role_resource_relation` VALUES (177, 5, 'fbc30e4ae5bb33b39baca7bf6bd8ce9d');
INSERT INTO `sys_role_resource_relation` VALUES (178, 5, 'fbc30e4ae5bb33b39baca7bf6bd8ce9m');
INSERT INTO `sys_role_resource_relation` VALUES (179, 5, 'fbc30e4ae5bb33b39baca7bf6bd8ce9q');
INSERT INTO `sys_role_resource_relation` VALUES (180, 5, 'fbc30e4ae5bb33b39baca7bf6bd8ceam');
INSERT INTO `sys_role_resource_relation` VALUES (181, 5, 'fbc30e4ae5bb33b39baca7bf6bd8ceim');
INSERT INTO `sys_role_resource_relation` VALUES (182, 5, 'fbc30e4ae5bb33b39baca7bf6bd8cejm');
INSERT INTO `sys_role_resource_relation` VALUES (183, 5, 'fbc30e4ae5bb33b39baca7bf6bd8cekm');
INSERT INTO `sys_role_resource_relation` VALUES (184, 5, 'fbc30e4ae5bb33b39baca7bf6bd8celm');
INSERT INTO `sys_role_resource_relation` VALUES (185, 5, 'fbc30e4ae5bb33b39baca7bf6bd8cemm');
INSERT INTO `sys_role_resource_relation` VALUES (186, 5, 'fbc30e4ae5bb33b39baca7bf6bd8cenm');
INSERT INTO `sys_role_resource_relation` VALUES (187, 5, 'fbc30e4ae5bb33b39baca7bf6bd8ceom');
INSERT INTO `sys_role_resource_relation` VALUES (188, 5, 'fbc30e4ae5bb33b39baca7bf6bd8cesm');
INSERT INTO `sys_role_resource_relation` VALUES (189, 5, 'fbc30e4ae5bb33b39baca7bf6bd8cewm');
INSERT INTO `sys_role_resource_relation` VALUES (190, 5, 'fbc30e4ae5bb33b39baca7bf6bd8cezm');
INSERT INTO `sys_role_resource_relation` VALUES (191, 5, 'fbc30e4ae5bb33b39baca7bf6bd8cj0a');
INSERT INTO `sys_role_resource_relation` VALUES (192, 5, 'fbc30e4ae5bb33b39baca7bf6bd8cj0m');
INSERT INTO `sys_role_resource_relation` VALUES (193, 5, 'fbc30e4ae5bb33b39baca7bf6bd8ck0m');
INSERT INTO `sys_role_resource_relation` VALUES (194, 5, 'fe45ea293f75dc88b96cab96c218512a');
INSERT INTO `sys_role_resource_relation` VALUES (195, 5, 'ffc6e9ca2cc243febf6d2f476b849163');
INSERT INTO `sys_role_resource_relation` VALUES (196, 5, 'ffe445828071ce87a851ad58100f1340');
INSERT INTO `sys_role_resource_relation` VALUES (197, 5, 'ffe445828071ce87a851ad58144932f8');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'NULL' COMMENT '用户名',
  `nick_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'NULL' COMMENT '昵称',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'NULL' COMMENT '密码',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户类型：0代表普通用户，1代表管理员',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phonenumber` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户性别（0男，1女，2未知）',
  `avatar` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `create_by` bigint(0) NULL DEFAULT NULL COMMENT '创建人的用户id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(0) NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` int(0) NULL DEFAULT 0 COMMENT '删除标志（0代表未删除，1代表已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14787164048665 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'sg333', '$2a$10$xc8A44uiO6qKKb8FGf36uusbvsF7hEkhUy/YSnekIGQ1LMQrST3Cm', '1', '0', '23412332@qq.com', '18888888888', '1', 'https://sg-blog-oss.oss-cn-beijing.aliyuncs.com/2022/01/31/948597e164614902ab1662ba8452e106.png', NULL, '2022-01-05 09:01:56', 1, '2022-01-30 15:37:03', 0);
INSERT INTO `sys_user` VALUES (3, 'sg3', 'weqe', '$2a$10$ydv3rLkteFnRx9xelQ7elOiVhFvXOooA98xCqk/omh7G94R.K/E3O', '1', '0', NULL, NULL, '0', NULL, NULL, '2022-01-05 13:28:43', NULL, '2022-01-05 13:28:43', 0);
INSERT INTO `sys_user` VALUES (4, 'sg2', 'dsadd', '$2a$10$kY4T3SN7i4muBccZppd2OOkhxMN6yt8tND1sF89hXOaFylhY2T3he', '1', '0', '23412332@qq.com', '19098790742', '0', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (5, 'sg2233', 'tteqe', '', '1', '0', NULL, '18246845873', '1', NULL, NULL, '2022-01-06 03:51:13', NULL, '2022-01-06 07:00:50', 0);
INSERT INTO `sys_user` VALUES (6, 'sangeng', 'sangeng', '$2a$10$Jnq31rRkNV3RNzXe0REsEOSKaYK8UgVZZqlNlNXqn.JeVcj2NdeZy', '1', '0', '2312321', '17777777777', '0', NULL, NULL, '2022-01-16 06:54:26', NULL, '2022-01-16 07:06:34', 0);
INSERT INTO `sys_user` VALUES (14787164048662, 'weixin', 'weixin', '$2a$10$y3k3fnMZsBNihsVLXWfI8uMNueVXBI08k.LzWYaKsW8CW7xXy18wC', '0', '0', 'weixin@qq.com', NULL, NULL, NULL, -1, '2022-01-30 17:18:44', -1, '2022-01-30 17:18:44', 0);
INSERT INTO `sys_user` VALUES (14787164048664, 'test', 'TEST', '$2a$10$2D0aLsPnIwCfEcY7sn5CL.QdvJbYZGm4TKKRo8nHDcdhy3b924Ln6', '0', '0', '2133333@qq.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for sys_user_role_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role_relation`;
CREATE TABLE `sys_user_role_relation`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(0) NULL DEFAULT NULL,
  `role_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户和角色关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role_relation
-- ----------------------------
INSERT INTO `sys_user_role_relation` VALUES (26, 3, 5);
INSERT INTO `sys_user_role_relation` VALUES (27, 6, 1);
INSERT INTO `sys_user_role_relation` VALUES (28, 7, 2);
INSERT INTO `sys_user_role_relation` VALUES (29, 1, 5);
INSERT INTO `sys_user_role_relation` VALUES (30, 4, 5);

-- ----------------------------
-- Table structure for t_category_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_category_menu`;
CREATE TABLE `t_category_menu`  (
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一uid',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `menu_level` tinyint(1) NULL DEFAULT NULL COMMENT '菜单级别',
  `summary` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `parent_uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父uid',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'url地址',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `sort` int(0) NULL DEFAULT 0 COMMENT '排序字段，越大越靠前',
  `status` tinyint(0) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否显示 1:是 0:否',
  `menu_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '菜单类型 0: 菜单   1: 按钮',
  `is_jump_external_url` tinyint(1) NULL DEFAULT 0 COMMENT '是否跳转外部链接 0：否，1：是',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_category_menu
-- ----------------------------
INSERT INTO `t_category_menu` VALUES ('02ea2f9ef5d44f559fb66189b05f6769', 'Solr', 2, 'Solr监控中心', '147cd431cbb9007bde87444d7987b151', '/monitor/Solr', 'el-icon-lightning', 0, 1, '2018-11-30 03:55:39', '2020-12-09 20:41:22', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('062087bce19d00312b3787b6e24c21d1', '字典数据', 2, '字典数据', 'badf0010422b432ba6ec9c83a25012ed', '/system/sysDictData', 'el-icon-data-line', 0, 1, '2020-02-21 18:06:11', '2020-05-30 08:44:04', 0, 0, 0);
INSERT INTO `t_category_menu` VALUES ('065cda845549289b2afcd0129d87c2c0', '新增用户', 3, '新增用户', 'fb4237a353d0418ab42c748b7c1d64c6', '/oldUser/add', NULL, 0, 1, '2020-09-29 20:40:09', '2020-09-29 20:40:30', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('079f0cfdb7a7017d827f5c349983eebc', 'Eureka', 2, 'Eureka监控中心', '147cd431cbb9007bde87444d7987b151', '/monitor/eureka', 'el-icon-moon-night', 0, 0, '2020-01-06 05:27:30', '2020-12-05 15:21:41', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('0a035547bbec404eb3ee0ef43312148d', '分类管理', 2, '管理博客分类', '49b42250abcb47ff876bad699cf34f03', '/blog/blogSort', 'el-icon-brush', 10, 1, '2018-11-26 03:07:14', '2020-05-30 08:34:17', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('0cab1fcdcd01f394768e2e2674e56773', '本地上传', 3, '本地文件上传', '1f01cd1d2f474743b241d74008b12333', '/blog/uploadLocalBlog', NULL, 1, 1, '2020-04-15 17:28:36', '2020-07-09 21:40:01', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('147cd431cbb9007bde87444d7987b151', '监控中心', 1, '监控中心', NULL, '/monitor', 'el-icon-monitor', 0, 1, '2020-01-06 13:25:32', '2020-07-09 21:33:11', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('14bcfc15d02f0d568adf2d383c0342d8', '查询', 3, '服务监控查询', 'a0c40ddd3fe15bb3f2edf9ec242a1511', '/monitor/getServerInfo', NULL, 0, 1, '2020-06-03 09:27:41', '2020-06-03 09:27:41', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('152216a4fd9b995aa20bfa1eec6312c2', 'Nacos', 2, 'Nacos图形化界面', '147cd431cbb9007bde87444d7987b151', 'http://localhost:8848/nacos', 'el-icon-star-off', 5, 1, '2020-07-03 21:39:58', '2020-12-05 15:31:11', 1, 0, 1);
INSERT INTO `t_category_menu` VALUES ('16a75a3c38e71c1046b443b4b64dd930', '删除选中', 3, '博客管理 删除选中', '1f01cd1d2f474743b241d74008b12333', '/blog/deleteBatch', NULL, 0, 1, '2020-03-21 18:21:01', '2020-03-21 18:21:01', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('1cc493d36e17fad535f2bf70242162b0', '图片管理', 2, '图片管理', '65e22f3d36d94bcea47478aba02895a1', '/picture/picture', 'el-icon-brush', 1, 1, '2020-02-21 22:27:12', '2020-10-12 10:12:30', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('1d9a5030142e9fd7690f554c20e3bc90', '推荐管理', 2, '博客推荐管理', '49b42250abcb47ff876bad699cf34f03', '/blog/blogRecommend', 'el-icon-ice-cream-round', 0, 1, '2020-01-28 10:06:32', '2020-05-30 08:34:54', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('1dd262b88b63e8f6bd9a6ca72ed0622c', '导航栏管理 删除', 3, '导航栏管理 删除', '6275bc5189e2e595b621d744d68278af', '/webNavbar/delete', NULL, 0, 1, '2021-02-23 13:02:12', '2021-02-23 13:02:12', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('1f01cd1d2f474743b241d74008b12333', '博客管理', 2, '对博客进行增删改查', '49b42250abcb47ff876bad699cf34f03', '/blog/blog', 'el-icon-notebook-2', 11, 1, '2018-11-27 03:47:07', '2020-05-30 08:33:22', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('21a411858fc22b5feb4c44fcad00e529', '导航栏管理 编辑', 3, '导航栏管理 编辑', '6275bc5189e2e595b621d744d68278af', '/webNavbar/edit', NULL, 0, 1, '2021-02-23 13:01:36', '2021-02-23 13:01:36', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('237d410f90d0c70b894f87a87718d88c', '删除全选', 3, '专题元素管理 删除全选', '7cb1a6b7462832bf831a18a28eea94cd', '/subjectItem/deleteBatch', NULL, 0, 1, '2020-08-23 09:17:22', '2020-08-23 09:17:22', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('238352fc7e86340c339b9a575b1b7086', 'Sentinel', 2, 'Sentinel监控中心', '147cd431cbb9007bde87444d7987b151', 'http://localhost:8070/sentinel/', 'el-icon-warning-outline', 4, 1, '2020-07-06 21:25:52', '2020-12-05 15:31:27', 1, 0, 1);
INSERT INTO `t_category_menu` VALUES ('2496af227b283bc79d9261b73e3ea743', '删除选中', 3, '参数配置 删除选中', '3eacc357e23b0b17e4f835c2f998ed34', '/sysParams/deleteBatch', NULL, 0, 1, '2020-07-21 16:49:18', '2020-07-21 16:49:18', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('25b3ea9639872aa730ad6147baf61641', '删除', 3, '参数配置 删除', '3eacc357e23b0b17e4f835c2f998ed34', '/sysParams/deleteBatch', NULL, 0, 1, '2020-07-21 16:48:57', '2020-07-21 16:48:57', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('26bcccf0164bf84f12ab20448388d346', '待办事项', 2, '首页  代办事项', 'badf0010422b432ba6ec9c83a25012ed', '/dashboard/todo', 'el-icon-date', 0, 1, '2020-03-23 07:51:52', '2020-05-30 09:06:59', 0, 0, 0);
INSERT INTO `t_category_menu` VALUES ('2a733ff390af9b44ecda4e8c4634d73k', '删除', 3, '菜单管理 删除', 'aa225cdae6464bc0acebd732192f8362', '/categoryMenu/delete', NULL, 0, 1, '2020-03-21 18:23:19', '2020-03-21 18:23:19', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('2a733ff390af9b44ecda4e8c4634d75d', '删除选中', 3, '分类管理 删除选中', '0a035547bbec404eb3ee0ef43312148d', '/blogSort/deleteBatch', NULL, 0, 1, '2020-03-21 18:23:19', '2020-03-21 18:23:19', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('2a733ff390af9b44ecda4e8c4634d75f', '删除选中', 3, '标签管理 删除选中', '6606b7e646d545e5a25c70b5e5fade9f', '/tag/deleteBatch', NULL, 0, 1, '2020-03-21 18:23:19', '2020-03-21 18:23:19', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('2a733ff390af9b44ecda4e8c4634d75k', '删除选中', 3, '评论管理 删除选中', '9beb7caa2c844b36a02789262dc76fbe', '/comment/deleteBatch', NULL, 0, 1, '2020-03-21 18:23:19', '2020-04-21 08:33:27', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('2a733ff390af9b44ecda4e8c4634d75t', '重置密码', 3, '用户管理 重置密码', 'fb4237a353d0418ab42c748b7c1d64c6', '/oldUser/resetUserPassword', NULL, 0, 1, '2020-03-21 18:23:19', '2020-04-21 08:28:37', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('2a733ff390af9b44ecda4e8c4634d75u', '初始化ElasticSearch索引', 3, 'ElasticSearch 初始化ElasticSearch索引', 'bfc9463e59a3ca250dcfc1c86627e034', '/search/initElasticIndex', NULL, 0, 1, '2020-03-21 18:23:19', '2020-03-21 18:23:19', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('2a733ff390af9b44ecda4e8c4634d75v', '初始化Solr索引', 3, 'Solr 初始化Solr索引', '02ea2f9ef5d44f559fb66189b05f6769', '/search/initSolrIndex', NULL, 0, 1, '2020-03-21 18:23:19', '2020-03-21 18:23:19', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('2a733ff390af9b44ecda4e8c4634d78k', '删除', 3, '友情链接 删除', '9002d1ae905c4cb79c2a485333dad2f7', '/link/delete', NULL, 0, 1, '2020-03-21 18:23:19', '2020-03-21 18:23:19', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('2a733ff390af9b44ecda4e8c4634d7ck', '删除选中', 3, '字典数据 删除选中', '062087bce19d00312b3787b6e24c21d1', '/sysDictData/deleteBatch', NULL, 0, 1, '2020-03-21 18:23:19', '2020-03-21 18:23:19', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('2a733ff390af9b44ecda4e8c4634d7gk', '删除选中', 3, '图片管理 删除选中', '1cc493d36e17fad535f2bf70242162b0', '/picture/delete', NULL, 0, 1, '2020-03-21 18:23:19', '2020-03-21 18:23:19', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('2a733ff390af9b44ecda4e8c4634d7lk', '删除', 3, '管理员管理 删除', '2de247af3b0a459095e937d7ab9f5864', '/admin/delete', NULL, 0, 1, '2020-03-21 18:23:19', '2020-03-21 18:23:19', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('2a733ff390af9b44ecda4e8c4634d7pk', '删除', 3, '图片类别管理 删除', '4dea9c4f39d2480983e8c4333d35e036', '/pictureSort/delete', NULL, 0, 1, '2020-03-21 18:23:19', '2020-03-21 18:23:19', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('2a733ff390af9b44ecda4e8c4634d7uk', '删除', 3, '角色管理 删除', '5010ae46511e4c0b9f30d1c63ad3f0c1', '/role/delete', NULL, 0, 1, '2020-03-21 18:23:19', '2020-03-21 18:23:19', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('2a733ff390af9b44ecda4e8c4634db8k', '删除', 3, '资源分类 删除', '9449ce5dd5e24b21a9d15f806cb36e87', '/resourceSort/deleteBatch', NULL, 0, 1, '2020-03-21 18:23:19', '2020-03-21 18:23:19', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('2a733ff390af9b44ecda4e8c4634dh8c', '删除', 3, '视频管理 删除', 'ffc6e9ca2cc243febf6d2f476b849163', '/studyVideo/deleteBatch', NULL, 0, 1, '2020-03-21 18:23:19', '2020-03-21 18:23:19', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('2a733ff390af9b44ecda4e8c4634dh8k', '删除', 3, '字典管理 删除', 'c28f0b052e0b930299dd53de59cc32d7', '/sysDictType/delete', NULL, 0, 1, '2020-03-21 18:23:19', '2020-03-21 18:23:19', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('2a733ff390af9b44ecda4e8c4634dm8k', '修改密码', 3, '关于我 修改密码', 'faccfe476b89483791c05019ad5b4906', '/system/changePwd', NULL, 0, 1, '2020-03-21 18:23:19', '2020-03-21 18:23:19', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('2b983c5439ac07f2cf07437ba9fff6be', '编辑', 3, '博客管理 编辑', '1f01cd1d2f474743b241d74008b12333', '/blog/edit', NULL, 0, 1, '2020-03-21 18:15:26', '2020-03-21 18:15:26', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('2d5cd8a387fc2d010c245acd65fefd3b', '强退用户', 3, '强退后台管理员', 'bfcb9b002c3de18f269189c573b985f8', '/admin/forceLogout', NULL, 0, 1, '2020-06-09 18:48:28', '2020-06-09 18:48:28', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('2de247af3b0a459095e937d7ab9f5864', '管理员管理', 2, '管理员增删改查', 'd3a19221259d439b916f475e43edb13d', '/authority/admin', 'el-icon-trophy', 0, 1, '2018-11-25 19:09:21', '2020-05-30 08:45:43', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('2fb47d3b6dbd44279c8206740a263543', '网站配置', 2, '网站配置', 'badf0010422b432ba6ec9c83a25012ed', '/system/webConfig', 'el-icon-setting', 1, 1, '2018-11-28 19:59:04', '2020-08-30 08:01:11', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('327d945daf4ddb71976c4ab3830e7c4i', '新增', 3, '菜单管理 新增', 'aa225cdae6464bc0acebd732192f8362', '/categoryMenu/add', NULL, 0, 1, '2020-03-21 18:22:06', '2020-03-21 18:22:06', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('327d945daf4ddb71976c4ab3830e7c66', '新增', 3, '分类管理 新增', '0a035547bbec404eb3ee0ef43312148d', '/blogSort/add', NULL, 0, 1, '2020-03-21 18:22:06', '2020-03-21 18:22:06', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('327d945daf4ddb71976c4ab3830e7c6h', '新增', 3, '标签管理 新增', '6606b7e646d545e5a25c70b5e5fade9f', '/tag/add', NULL, 0, 1, '2020-03-21 18:22:06', '2020-03-21 18:22:06', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('327d945daf4ddb71976c4ab3830e7c6i', '新增', 3, '评论管理 新增', '9beb7caa2c844b36a02789262dc76fbe', '/comment/add', NULL, 0, 1, '2020-03-21 18:22:06', '2020-04-21 08:33:12', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('327d945daf4ddb71976c4ab3830e7c7i', '新增', 3, '友情链接 新增', '9002d1ae905c4cb79c2a485333dad2f7', '/link/add', NULL, 0, 1, '2020-03-21 18:22:06', '2020-03-21 18:22:06', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('327d945daf4ddb71976c4ab3830e7cdi', '新增', 3, '字典数据 新增', '062087bce19d00312b3787b6e24c21d1', '/sysDictData/add', NULL, 0, 1, '2020-03-21 18:22:06', '2020-03-21 18:22:06', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('327d945daf4ddb71976c4ab3830e7cfi', '新增', 3, '图片管理 新增', '1cc493d36e17fad535f2bf70242162b0', '/picture/add', NULL, 0, 1, '2020-03-21 18:22:06', '2020-03-21 18:22:06', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('327d945daf4ddb71976c4ab3830e7cmi', '新增', 3, '管理员管理 新增', '2de247af3b0a459095e937d7ab9f5864', '/admin/add', NULL, 0, 1, '2020-03-21 18:22:06', '2020-03-21 18:22:06', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('327d945daf4ddb71976c4ab3830e7cqi', '新增', 3, '图片类别管理 新增', '4dea9c4f39d2480983e8c4333d35e036', '/pictureSort/add', NULL, 0, 1, '2020-03-21 18:22:06', '2020-03-21 18:22:06', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('327d945daf4ddb71976c4ab3830e7cvi', '新增', 3, '角色管理 新增', '5010ae46511e4c0b9f30d1c63ad3f0c1', '/role/add', NULL, 0, 1, '2020-03-21 18:22:06', '2020-03-21 18:22:06', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('327d945daf4ddb71976c4ab3830e7d7i', '新增', 3, '资源分类 新增', '9449ce5dd5e24b21a9d15f806cb36e87', '/resourceSort/add', NULL, 0, 1, '2020-03-21 18:22:06', '2020-03-21 18:22:06', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('327d945daf4ddb71976c4ab3830e7g7d', '新增', 3, '视频管理 新增', 'ffc6e9ca2cc243febf6d2f476b849163', '/studyVideo/add', NULL, 0, 1, '2020-03-21 18:22:06', '2020-03-21 18:22:06', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('327d945daf4ddb71976c4ab3830e7g7i', '新增', 3, '字典管理 新增', 'c28f0b052e0b930299dd53de59cc32d7', '/sysDictType/add', NULL, 0, 1, '2020-03-21 18:22:06', '2020-03-21 18:22:06', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('34c1b7b1bd3118979fe1f9f9a1147fa5', '表单构建', 2, '表单构建', 'f4697cdf85920369179b90ff45a5982d', '/test/FormBuild', 'el-icon-milk-tea', 0, 1, '2020-05-26 22:33:16', '2020-05-30 08:46:31', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('3e92f2fd6cf012d30bfae2d9cdb7092d', '专题管理', 2, '博客专题管理', '49b42250abcb47ff876bad699cf34f03', '/blog/subject', 'el-icon-collection', 0, 1, '2020-08-23 08:51:12', '2020-08-23 09:18:13', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('3eacc357e23b0b17e4f835c2f998ed34', '参数配置', 2, '配置项目中使用的参数', 'badf0010422b432ba6ec9c83a25012ed', '/system/sysParams', 'el-icon-document', 0, 1, '2020-07-21 16:45:15', '2020-07-21 16:45:15', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('4062db4658392e71c177758bb51bb4cb', '新建文件夹', 3, '网盘管理 新建文件夹', 'e1e54aea65cc22d9f8a4c74ce8d23749', '/networkDisk/create', NULL, 0, 1, '2020-06-15 10:36:51', '2020-06-15 10:47:02', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('407a263eb12eff5aac31e9f62901cea0', 'Markdown', 2, 'Markdown编辑器', 'f4697cdf85920369179b90ff45a5982d', '/test/Markdown', 'el-icon-watermelon', 0, 1, '2020-01-30 10:36:43', '2020-05-30 08:46:22', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('4337f63d13d84b9aba64b9d7a69fd066', '异常日志', 2, '异常日志', '98b82be8785e41dc939b6a5517fdfa53', '/log/exceptionLog', 'el-icon-ice-cream', 0, 1, '2018-11-28 20:01:36', '2020-05-30 08:47:53', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('49b42250abcb47ff876bad699cf34f03', '博客管理', 1, '用于博客的一些相关操作', NULL, '/blog', 'el-icon-edit', 20, 1, '2018-11-25 05:15:07', '2020-10-07 15:35:48', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('4dea9c4f39d2480983e8c4333d35e036', '图片类别管理', 2, '图片类别', '65e22f3d36d94bcea47478aba02895a1', '/picture/pictureSort', 'el-icon-printer', 2, 1, '2018-11-28 19:50:31', '2020-10-12 10:13:57', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('4fe7725159ced4a238b816a4595109d1', '门户管理', 1, '管理门户页面', NULL, '/web', 'el-icon-help', 0, 1, '2021-02-22 18:25:34', '2021-02-22 18:25:34', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('5010ae46511e4c0b9f30d1c63ad3f0c1', '角色管理', 2, '管理用户角色信息', 'd3a19221259d439b916f475e43edb13d', '/authority/role', 'el-icon-oldUser', 0, 1, '2018-11-25 19:10:34', '2020-05-30 09:06:22', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('505b4769b77617a314a3ed78e4acdff7', 'Zipkin', 2, 'Zipkin链路追踪', '147cd431cbb9007bde87444d7987b151', 'http://localhost:9411/zipkin/', 'el-icon-moon', 2, 1, '2020-02-06 20:22:18', '2020-12-05 15:31:42', 1, 0, 1);
INSERT INTO `t_category_menu` VALUES ('510483ce569b4fc88299f346147b1314', '资源管理', 1, '资源管理', '', '/resource', 'el-icon-present', 2, 1, '2018-11-28 19:42:13', '2020-05-30 08:51:30', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('587e2697fa4d85046feece8ab9d0706c', 'Redis操作', 3, 'Redis操作 清空缓存', '78f24799307cb63bc3759413dadf4d1a', '/systemConfig/cleanRedisByKey', NULL, 0, 1, '2020-04-03 19:38:01', '2020-04-03 19:38:00', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('5bf9bd28d387ef923f2c5d11ec01fbbd', '按创建时间排序', 3, '按创建时间排序', '7cb1a6b7462832bf831a18a28eea94cd', '/subjectItem/sortByCreateTime', NULL, 0, 1, '2020-12-08 20:38:10', '2020-12-08 20:38:10', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('5ef38a4f70c6d859155528776a30cda7', '上传文件', 3, '网盘管理 上传文件', 'e1e54aea65cc22d9f8a4c74ce8d23749', '/networkDisk/add', NULL, 0, 1, '2020-06-15 10:35:45', '2020-06-15 10:46:53', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('6228ff4e9ebd42c89599b322201a0345', '反馈管理', 2, '反馈管理', 'bcf4a9bc21c14b559bcb015fb7912266', '/message/feedback', 'el-icon-microphone', 0, 1, '2018-11-28 19:48:30', '2020-05-30 08:48:39', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('6275bc5189e2e595b621d744d68278af', '导航栏管理', 2, '导航栏管理', '4fe7725159ced4a238b816a4595109d1', '/web/webNavbar', 'el-icon-c-scale-to-original', 0, 1, '2021-02-22 18:26:13', '2021-02-22 18:26:13', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('62c91c47c4646661c045727f0a8eb9d4', '查询', 3, '代办事项  查询', '26bcccf0164bf84f12ab20448388d346', '/todo/getList', NULL, 0, 1, '2020-03-23 07:52:42', '2020-03-23 07:52:42', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('65e22f3d36d94bcea47478aba02895a1', '图片管理', 1, '图片管理', '', '/picture', 'el-icon-picture-outline', 3, 1, '2018-11-28 19:48:53', '2020-05-30 09:07:12', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('6606b7e646d545e5a25c70b5e5fade9f', '标签管理', 2, '对博客标签进行管理', '49b42250abcb47ff876bad699cf34f03', '/blog/blogTag', 'el-icon-folder-opened', 4, 1, '2018-11-26 02:57:38', '2020-05-30 08:34:43', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('672b093002b618293befd8e1a164e4cc', '图片列表', 2, '图片列表', 'f4697cdf85920369179b90ff45a5982d', '/test/PictureList', 'el-icon-sugar', 0, 1, '2020-04-19 08:31:23', '2020-05-30 08:46:14', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('688beda820a236b50f18ccdd5dc9fee9', '下载', 3, '网盘管理 下载', 'e1e54aea65cc22d9f8a4c74ce8d23749', '/networkDisk/download', NULL, 0, 1, '2020-06-15 10:37:17', '2020-06-15 10:46:45', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('6c8a8c50c77429fab210bd52ed8c50ba', '引用量排序', 3, '标签管理 引用量排序', '6606b7e646d545e5a25c70b5e5fade9f', '/tag/tagSortByCite', NULL, 0, 1, '2020-03-21 21:38:19', '2020-03-21 21:38:19', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('6c8a8c50c77429fab210bd52ed8c50bb', '引用量排序', 3, '分类管理 引用量排序', '0a035547bbec404eb3ee0ef43312148d', '/blogSort/blogSortByCite', NULL, 0, 1, '2020-03-21 21:38:19', '2020-03-21 21:38:19', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('72d26cf940bf9dfb6bde0a590ff40882', '删除', 3, '分类管理，删除分类', '0a035547bbec404eb3ee0ef43312148d', '/blogSort/delete', NULL, 0, 1, '2020-03-21 18:22:51', '2020-03-21 18:22:51', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('72d26cf940bf9dfb6bde0a590ff4088g', '删除', 3, '标签管理，删除分类', '6606b7e646d545e5a25c70b5e5fade9f', '/tag/delete', NULL, 0, 1, '2020-03-21 18:22:51', '2020-03-21 18:22:51', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('72d26cf940bf9dfb6bde0a590ff4088j', '删除', 3, '评论管理，删除', '9beb7caa2c844b36a02789262dc76fbe', '/comment/delete', NULL, 0, 1, '2020-03-21 18:22:51', '2020-04-21 08:33:21', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('72d26cf940bf9dfb6bde0a590ff4088s', '删除', 3, '用户管理，删除', 'fb4237a353d0418ab42c748b7c1d64c6', '/oldUser/delete', NULL, 0, 1, '2020-03-21 18:22:51', '2020-04-21 08:28:30', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('72d26cf940bf9dfb6bde0a590ff408ej', '设为封面', 3, '图片管理，设为封面', '1cc493d36e17fad535f2bf70242162b0', '/picture/setCover', NULL, 0, 1, '2020-03-21 18:22:51', '2020-03-21 18:22:51', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('72d26cf940bf9dfb6bde0a590ff408nj', '重置密码', 3, '管理员管理，重置密码', '2de247af3b0a459095e937d7ab9f5864', '/admin/restPwd', NULL, 0, 1, '2020-03-21 18:22:51', '2020-03-21 18:22:51', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('7668dabe69473f59d1516d84cb99d583', '爬虫管理', 1, '爬虫管理', NULL, '/spider', 'el-icon-search', 0, 1, '2021-01-08 22:07:12', '2021-01-08 22:07:12', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('78ab104b123f4950af14d65798afb756', '收藏管理', 2, '管理用户收藏', '49b42250abcb47ff876bad699cf34f03', '/blog/collect', 'el-icon-folder-add', 8, 1, '2018-11-25 19:07:48', '2020-05-30 08:34:29', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('78f24799307cb63bc3759413dadf4d1a', '系统配置', 2, '设置七牛云和邮箱等相关配置', 'badf0010422b432ba6ec9c83a25012ed', '/system/systemConfig', 'el-icon-s-tools', 2, 1, '2020-01-21 09:29:04', '2020-08-30 08:01:17', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('7ada0a7053be4ad4b31f6be64315d03a', '删除', 3, '博客管理 删除', '1f01cd1d2f474743b241d74008b12333', '/blog/delete', NULL, 0, 1, '2020-03-21 15:16:54', '2020-03-21 15:16:54', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('7be9dee2f91165d8562aaa80c7e5b936', '编辑', 3, '代办事项', '26bcccf0164bf84f12ab20448388d346', '/todo/edit', NULL, 0, 1, '2020-03-23 07:53:38', '2020-03-23 07:53:38', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('7cb1a6b7462832bf831a18a28eea94cd', '专题元素管理', 2, '专题元素管理', '49b42250abcb47ff876bad699cf34f03', '/blog/subjectItem', 'el-icon-star-off', 0, 1, '2020-08-23 09:15:06', '2020-08-23 09:15:06', 0, 0, 0);
INSERT INTO `t_category_menu` VALUES ('80ee135af885f02d52ecb67d5a05b173', '点击量排序', 3, '分类管理 点击量排序', '0a035547bbec404eb3ee0ef43312148d', '/blogSort/blogSortByClickCount', NULL, 0, 1, '2020-03-21 21:37:42', '2020-03-21 21:37:42', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('80ee135af885f02d52ecb67d5a05b17b', '点击量排序', 3, '标签管理 点击量排序', '6606b7e646d545e5a25c70b5e5fade9f', '/tag/tagSortByClickCount', NULL, 0, 1, '2020-03-21 21:37:42', '2020-03-21 21:37:42', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('82962bbcdb674a3fdd57aec131114d56', '编辑', 3, '参数配置 编辑', '3eacc357e23b0b17e4f835c2f998ed34', '/sysParams/edit', NULL, 0, 1, '2020-07-21 16:49:41', '2020-07-21 16:49:41', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('86508603e6d78036db0bf9222946f68c', '新增', 3, '专题元素管理 新增', '7cb1a6b7462832bf831a18a28eea94cd', '/subjectItem/add', NULL, 0, 1, '2020-08-23 09:16:00', '2020-08-23 09:16:00', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('879cfcd4dfd3e5bc1bb6ea2c0f1f82c0', '接口管理', 2, '接口管理', 'd3a19221259d439b916f475e43edb13d', '/authority/button', 'el-icon-connection', 0, 1, '2020-03-21 17:39:12', '2021-01-08 22:04:14', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('8b40ea466efc42f497c49c8a610c9c20', '添加参数', 3, '参数配置 新增', '3eacc357e23b0b17e4f835c2f998ed34', '/sysParams/add', NULL, 0, 1, '2020-07-21 16:47:08', '2020-07-21 16:47:08', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('9002d1ae905c4cb79c2a485333dad2f7', '友情链接', 2, '友情链接', 'badf0010422b432ba6ec9c83a25012ed', '/system/blogLink', 'el-icon-ship', 0, 1, '2018-11-29 03:56:35', '2020-05-30 08:36:01', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('93f7fd9a6e81735c47649e6b36042b5d', 'Druid', 2, 'Druid监控中心', '147cd431cbb9007bde87444d7987b151', 'http://localhost:8607/mogu-admin/druid/login.html', 'el-icon-cloudy-and-sunny', 1, 1, '2020-01-06 13:26:51', '2020-12-05 15:31:47', 1, 0, 1);
INSERT INTO `t_category_menu` VALUES ('9449ce5dd5e24b21a9d15f806cb36e87', '资源分类', 2, '资源分类', '510483ce569b4fc88299f346147b1314', '/resource/resourceSort', 'el-icon-folder-opened', 0, 1, '2018-11-29 03:43:27', '2020-05-30 08:51:58', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('94bee9c48a4611c96b89112b845c7f28', '移动', 3, '网盘管理  移动文件', 'e1e54aea65cc22d9f8a4c74ce8d23749', '/networkDisk/move', NULL, 0, 1, '2020-06-15 10:36:23', '2020-06-15 10:46:39', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('98b82be8785e41dc939b6a5517fdfa53', '操作日志', 1, '操作日志', '', '/log', 'el-icon-paperclip', 9, 1, '2018-11-28 20:00:19', '2020-05-30 08:47:14', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('99f5d4233d446a809b9937961c590766', '获取在线管理员', 3, '获取在线管理员列表', 'bfcb9b002c3de18f269189c573b985f8', '/admin/getOnlineAdminList', NULL, 0, 1, '2020-06-09 18:49:32', '2020-06-09 18:49:32', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('9bbe311a4ccb087560e6e2c6d40cf271', '图片爬取', 2, '用于标题图片的爬取', '7668dabe69473f59d1516d84cb99d583', '/spider/pictureSpider', 'el-icon-picture-outline', 0, 1, '2021-01-08 22:08:16', '2021-01-08 22:08:16', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('9beb7caa2c844b36a02789262dc76fbe', '评论管理', 2, '评论管理', 'bcf4a9bc21c14b559bcb015fb7912266', '/message/comment', 'el-icon-chat-line-square', 1, 1, '2018-11-28 19:47:23', '2020-05-30 08:48:28', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('9c91231f1682aabd765225a7e503bb43', '删除', 3, '反馈管理 删除', '6228ff4e9ebd42c89599b322201a0345', '/feedback/deleteBatch', NULL, 0, 1, '2020-03-22 11:17:27', '2020-03-22 11:17:27', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('9db7ffbded9717f13a1a97fca46bc17c', '导出选中', 3, '导出选中，前端实现', '1f01cd1d2f474743b241d74008b12333', '/blog/downloadBatch', NULL, 0, 1, '2020-04-27 22:14:35', '2020-04-27 22:14:35', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('9e73a9b1de18e4f1cb19eca5e8cd321d', '批量编辑', 3, '代办事项 批量编辑', '26bcccf0164bf84f12ab20448388d346', '/todo/toggleAll', NULL, 0, 1, '2020-03-23 07:54:37', '2020-03-23 07:54:37', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('9e91b4f993c946cba4bf720b2c1b2e90', '用户日志', 2, '用户Web端访问情况', '98b82be8785e41dc939b6a5517fdfa53', '/log/webVisit', 'el-icon-hot-water', 0, 1, '2019-05-17 10:16:47', '2020-05-30 08:47:41', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('a0c40ddd3fe15bb3f2edf9ec242a1511', '服务器监控', 2, '服务器监控', '147cd431cbb9007bde87444d7987b151', '/monitor/serverMonitor', 'el-icon-light-rain', 7, 1, '2020-06-03 09:26:13', '2020-12-05 15:27:45', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('a5902692a3ed4fd794895bf634f97b8e', '操作日志', 2, '操作日志', '98b82be8785e41dc939b6a5517fdfa53', '/log/log', 'el-icon-lollipop', 0, 1, '2018-11-28 20:01:02', '2020-05-30 08:47:27', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('a8bad1abec6c8fc8d4bce5a27829c878', '编辑', 3, '专题管理 编辑', '3e92f2fd6cf012d30bfae2d9cdb7092d', '/subject/edit', NULL, 0, 1, '2020-08-23 08:55:55', '2020-08-23 08:55:55', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('a9396f1a3fbdec3d4cb614f388a22bea', 'Monitor', 2, 'SpringBootAdmin监控中心', '147cd431cbb9007bde87444d7987b151', 'http://localhost:8607/mogu-monitor/wallboard', 'el-icon-partly-cloudy', 5, 1, '2020-01-05 21:30:16', '2020-12-05 15:30:27', 1, 0, 1);
INSERT INTO `t_category_menu` VALUES ('aa225cdae6464bc0acebd732192f8362', '菜单管理', 2, '对页面菜单进行管理', 'd3a19221259d439b916f475e43edb13d', '/authority/categoryMenu', 'el-icon-tickets', 0, 1, '2018-11-25 11:12:01', '2020-05-30 08:44:32', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('aa6c5d513421aa50cac1ee9ec647d100', '导航栏管理 新增', 3, '导航栏管理 新增', '6275bc5189e2e595b621d744d68278af', '/webNavbar/add', NULL, 0, 1, '2021-02-23 13:01:16', '2021-02-23 13:01:16', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('ab1289c29b336dccda87a9fa8b711aa2', '删除', 3, '代办事项 删除', '26bcccf0164bf84f12ab20448388d346', '/todo/delete', NULL, 0, 1, '2020-03-23 07:54:01', '2020-03-23 07:54:01', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('acbb5d09da25e6c9e019cc361b35d159', 'Search接口', 2, 'Search接口', 'baace3dc03d34c54b81761dce8243814', 'http://localhost:8606/swagger-ui/index.html', 'el-icon-sunrise', 0, 1, '2020-01-19 19:56:23', '2020-12-24 09:20:24', 1, 0, 1);
INSERT INTO `t_category_menu` VALUES ('aef85c40b54320d7c5a9d78697e12910', '置顶', 3, '分类管理 置顶', '0a035547bbec404eb3ee0ef43312148d', '/blogSort/stick', NULL, 0, 1, '2020-03-21 21:37:07', '2020-03-21 21:37:07', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('aef85c40b54320d7c5a9d78697e1291c', '置顶', 3, '标签管理 置顶', '6606b7e646d545e5a25c70b5e5fade9f', '/tag/stick', NULL, 0, 1, '2020-03-21 21:37:07', '2020-03-21 21:37:07', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('aef85c40b54320d7c5a9d78697e1295n', '置顶', 3, '菜单管理 置顶', 'aa225cdae6464bc0acebd732192f8362', '/categoryMenu/stick', NULL, 0, 1, '2020-03-21 21:37:07', '2020-03-21 21:37:07', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('aef85c40b54320d7c5a9d78697e1296n', '置顶', 3, '友情链接 置顶', '9002d1ae905c4cb79c2a485333dad2f7', '/link/stick', NULL, 0, 1, '2020-03-21 21:37:07', '2020-03-21 21:37:07', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('aef85c40b54320d7c5a9d78697e129rn', '置顶', 3, '图片类别管理 置顶', '4dea9c4f39d2480983e8c4333d35e036', '/pictureSort/stick', NULL, 0, 1, '2020-03-21 21:37:07', '2020-03-21 21:37:07', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('aef85c40b54320d7c5a9d78697e12e6n', '置顶', 3, '资源分类 置顶', '9449ce5dd5e24b21a9d15f806cb36e87', '/resourceSort/stick', NULL, 0, 1, '2020-03-21 21:37:07', '2020-03-21 21:37:07', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('af0e753d3ea0adf5cd8cf1dd55f162c2', '接口聚合', 2, '聚合所有模块的接口', 'baace3dc03d34c54b81761dce8243814', 'http://localhost:8607/doc.html', 'el-icon-ice-cream-round', 5, 1, '2020-12-05 15:42:51', '2020-12-05 15:42:51', 1, 0, 1);
INSERT INTO `t_category_menu` VALUES ('b21105b915a5b54588c2cd458a94d2d5', '新增', 3, '专题管理 新增', '3e92f2fd6cf012d30bfae2d9cdb7092d', '/subject/add', NULL, 0, 1, '2020-08-23 08:55:29', '2020-08-23 08:55:29', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('b511cae571834971a392ae4779270034', '游客管理', 2, '游客管理', 'c519725da92b42f3acf0cc9fad58c664', '/oldUser/visitor', 'el-icon-news', 2, 1, '2018-11-28 19:54:28', '2020-05-30 08:47:06', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('b7fc36f7efc9738bddc9b09fedeccf60', '导航栏管理 查询全部', 3, '导航栏管理 查询全部', '6275bc5189e2e595b621d744d68278af', '/webNavbar/getAllList', NULL, 0, 1, '2021-02-23 13:00:24', '2021-02-23 13:00:24', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('baa21ccb45ee133b064187185edb2ac0', '删除', 3, '网盘管理 删除', 'e1e54aea65cc22d9f8a4c74ce8d23749', '/networkDisk/delete', NULL, 0, 1, '2020-06-15 10:36:07', '2020-06-15 10:46:33', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('baace3dc03d34c54b81761dce8243814', '接口管理', 1, '接口管理', '', '/restapi', 'el-icon-stopwatch', 4, 1, '2018-11-28 20:01:57', '2020-05-30 08:49:22', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('badf0010422b432ba6ec9c83a25012ed', '系统管理', 1, '系统管理', '', '/system', 'el-icon-setting', 19, 1, '2018-11-28 19:54:47', '2020-10-07 15:35:52', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('bcf4a9bc21c14b559bcb015fb7912266', '消息管理', 1, '消息管理', '', '/message', 'el-icon-message', 6, 1, '2018-11-28 19:45:29', '2020-05-30 08:48:21', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('bcfac78203944094040851cc0a9bb095', '删除', 3, '专题元素管理 删除', '7cb1a6b7462832bf831a18a28eea94cd', '/subjectItem/delete', NULL, 0, 1, '2020-08-23 09:16:50', '2020-08-23 09:16:50', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('bfc9463e59a3ca250dcfc1c86627e034', 'ElasticSearch', 2, 'ElasticSearch监控页面', '147cd431cbb9007bde87444d7987b151', '/monitor/ElasticSearch', 'el-icon-cloudy', 0, 1, '2020-01-15 22:58:00', '2020-12-09 20:41:11', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('bfcb9b002c3de18f269189c573b985f8', '在线用户', 2, '在线的用户和管理员', '147cd431cbb9007bde87444d7987b151', '/monitor/OnlineAdmin', 'el-icon-sunset', 6, 1, '2020-06-09 17:14:02', '2020-12-05 15:27:39', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('c28f0b052e0b930299dd53de59cc32d7', '字典管理', 2, '字典管理', 'badf0010422b432ba6ec9c83a25012ed', '/system/sysDictType', 'el-icon-lightning', 0, 1, '2020-02-16 18:11:10', '2020-05-30 08:35:46', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('c2a1218dd07747a57b055f184ddae217', '查询', 3, '参数配置 查询', '3eacc357e23b0b17e4f835c2f998ed34', '/sysParams/getList', NULL, 0, 1, '2020-07-21 16:48:17', '2020-07-21 16:48:17', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('c519725da92b42f3acf0cc9fad58c664', '用户管理', 1, '用户管理', '', '/oldUser', 'el-icon-house', 15, 1, '2018-11-28 19:51:47', '2020-05-30 08:46:44', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('cbd7ba11c1b38c66b569405ed9185f35', 'RabbitMQ', 2, 'RabbitMQ监控中心', '147cd431cbb9007bde87444d7987b151', 'http://localhost:15672', 'el-icon-sunny', 3, 1, '2020-01-05 21:29:39', '2020-12-05 15:31:33', 1, 0, 1);
INSERT INTO `t_category_menu` VALUES ('ccc0dced06919403832647a871312f09', '删除选中', 3, '专题管理 删除选中', '3e92f2fd6cf012d30bfae2d9cdb7092d', '/subject/deleteBatch', NULL, 0, 1, '2020-08-23 08:57:45', '2020-08-23 08:57:45', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('d3a19221259d439b916f475e43edb13d', '权限管理', 1, '对管理员权限分配进行管理', '', '/authority', 'el-icon-oldUser', 18, 1, '2018-11-25 19:08:42', '2020-05-30 08:44:17', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('d4d92c53d3614d00865e9219b8292a90', 'Picture接口', 2, 'Picture接口', 'baace3dc03d34c54b81761dce8243814', 'http://localhost:8602/swagger-ui/index.html', 'el-icon-heavy-rain', 0, 1, '2018-11-28 20:04:33', '2020-12-24 09:20:21', 1, 0, 1);
INSERT INTO `t_category_menu` VALUES ('da32aa8f92ae7fe7e7f445bf1028d2df', '查询', 3, '专题元素管理  查询', '7cb1a6b7462832bf831a18a28eea94cd', '/subjectItem/getList', NULL, 0, 1, '2020-08-23 09:15:37', '2020-08-23 09:15:37', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('e1e54aea65cc22d9f8a4c74ce8d23749', '网盘管理', 2, '管理网盘的资源', '510483ce569b4fc88299f346147b1314', '/resource/file', 'el-icon-unlock', 1, 1, '2020-06-13 16:36:11', '2020-10-10 14:38:13', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('e4a482c089d04a30b6ecbaadb81b70f8', 'Admin接口', 2, 'Admin接口', 'baace3dc03d34c54b81761dce8243814', 'http://localhost:8601/swagger-ui/index.html', 'el-icon-lightning', 0, 1, '2018-11-28 20:03:32', '2020-12-24 09:20:17', 1, 0, 1);
INSERT INTO `t_category_menu` VALUES ('e5218b0b1cf016ae21eced4e47b628ac', '新增', 3, '博客管理 新增', '1f01cd1d2f474743b241d74008b12333', '/blog/add', NULL, 3, 1, '2020-03-21 10:55:34', '2020-10-07 15:38:58', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('e76ec0b7226985a414f035e2ecbd00b4', '查询', 3, '专题管理 查询', '3e92f2fd6cf012d30bfae2d9cdb7092d', '/subject/getList', NULL, 0, 1, '2020-08-23 08:55:08', '2020-08-23 08:55:08', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('e91945e49c5fdb207f996bc9668cd965', '增加', 3, '代办事项 增加', '26bcccf0164bf84f12ab20448388d346', '/todo/add', NULL, 0, 1, '2020-03-23 07:53:07', '2020-03-23 07:53:07', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('ed535411a72bb5cdd62aade25ca6e9c9', '编辑', 3, '专题元素管理 编辑', '7cb1a6b7462832bf831a18a28eea94cd', '/subjectItem/edit', NULL, 0, 1, '2020-08-23 09:16:23', '2020-08-23 09:16:23', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('f3a559635f9d46ee3356d072f5896fcb', '图片裁剪', 2, '用于图片裁剪', 'f4697cdf85920369179b90ff45a5982d', '/test/CropperPicture', 'el-icon-cherry', 0, 1, '2020-01-30 10:38:09', '2020-05-30 08:46:05', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('f4697cdf85920369179b90ff45a5982d', '测试页面', 1, '用于一些功能的测试', NULL, '/test', 'el-icon-cpu', 17, 1, '2020-01-30 10:36:00', '2020-05-30 08:45:54', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('f874529321a37e84f099488a4eaf5a0b', '编辑推荐', 3, '编辑推荐管理', '1d9a5030142e9fd7690f554c20e3bc90', '/blog/editBatch', NULL, 0, 1, '2020-04-26 13:38:15', '2020-04-26 13:38:15', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('f87d2f9b4539abbade38583420dc8b2l', '编辑', 3, '菜单管理 编辑', 'aa225cdae6464bc0acebd732192f8362', '/categoryMenu/edit', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('f87d2f9b4539abbade38583420dc8b89', '编辑', 3, '分类管理 编辑', '0a035547bbec404eb3ee0ef43312148d', '/blogSort/edit', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('f87d2f9b4539abbade38583420dc8b8e', '编辑', 3, '标签管理 编辑', '6606b7e646d545e5a25c70b5e5fade9f', '/tag/edit', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('f87d2f9b4539abbade38583420dc8b8l', '编辑', 3, '评论管理 编辑', '9beb7caa2c844b36a02789262dc76fbe', '/comment/edit', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('f87d2f9b4539abbade38583420dc8b8r', '编辑', 3, '用户管理 编辑', 'fb4237a353d0418ab42c748b7c1d64c6', '/oldUser/edit', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('f87d2f9b4539abbade38583420dc8b9l', '编辑', 3, '友情链接 编辑', '9002d1ae905c4cb79c2a485333dad2f7', '/link/edit', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('f87d2f9b4539abbade38583420dc8bbl', '编辑', 3, '字典数据 编辑', '062087bce19d00312b3787b6e24c21d1', '/sysDictData/edit', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('f87d2f9b4539abbade38583420dc8bhl', '编辑', 3, '图片管理 编辑', '1cc493d36e17fad535f2bf70242162b0', '/picture/edit', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('f87d2f9b4539abbade38583420dc8bkl', '编辑', 3, '管理员管理 编辑', '2de247af3b0a459095e937d7ab9f5864', '/admin/edit', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('f87d2f9b4539abbade38583420dc8bol', '编辑', 3, '图片类别管理 编辑', '4dea9c4f39d2480983e8c4333d35e036', '/pictureSort/edit', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('f87d2f9b4539abbade38583420dc8bpl', '编辑', 3, '网站配置 编辑', '2fb47d3b6dbd44279c8206740a263543', '/webConfig/editWebConfig', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('f87d2f9b4539abbade38583420dc8btl', '编辑', 3, '角色管理 编辑', '5010ae46511e4c0b9f30d1c63ad3f0c1', '/role/edit', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('f87d2f9b4539abbade38583420dc8bxl', '编辑', 3, '反馈管理 编辑', '6228ff4e9ebd42c89599b322201a0345', '/feedback/edit', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('f87d2f9b4539abbade38583420dc8byl', '编辑', 3, '系统配置 编辑', '78f24799307cb63bc3759413dadf4d1a', '/systemConfig/editSystemConfig', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('f87d2f9b4539abbade38583420dc8c9l', '编辑', 3, '资源分类 编辑', '9449ce5dd5e24b21a9d15f806cb36e87', '/resourceSort/edit', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('f87d2f9b4539abbade38583420dc8i9b', '编辑', 3, '视频管理 编辑', 'ffc6e9ca2cc243febf6d2f476b849163', '/studyVideo/edit', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('f87d2f9b4539abbade38583420dc8i9l', '编辑', 3, '字典管理 编辑', 'c28f0b052e0b930299dd53de59cc32d7', '/sysDictType/edit', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('f87d2f9b4539abbade38583420dc8l9l', '编辑', 3, '关于我 编辑', 'faccfe476b89483791c05019ad5b4906', '/system/editMe', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('f9276eb8e3274c8aa05577c86e4dc8c1', 'Web接口', 2, 'Web接口', 'baace3dc03d34c54b81761dce8243814', 'http://localhost:8603/swagger-ui/index.html', 'el-icon-light-rain', 0, 1, '2018-11-28 20:04:52', '2020-12-05 15:46:54', 1, 0, 1);
INSERT INTO `t_category_menu` VALUES ('fa1e85a9c7734d27df07bc730206bd1a', '删除', 3, '编辑管理 删除', '3e92f2fd6cf012d30bfae2d9cdb7092d', '/subject/delete', NULL, 0, 1, '2020-08-23 08:56:36', '2020-08-23 08:58:33', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('faccfe476b89483791c05019ad5b4906', '关于我', 2, '关于我', 'badf0010422b432ba6ec9c83a25012ed', '/system/aboutMe', 'el-icon-sugar', 0, 1, '2018-11-29 03:55:17', '2020-05-30 08:35:21', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('fb4237a353d0418ab42c748b7c1d64c6', '用户管理', 2, '用户管理', 'c519725da92b42f3acf0cc9fad58c664', '/oldUser/oldUser', 'el-icon-headset', 3, 1, '2018-11-28 19:52:20', '2020-05-30 08:46:54', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ca0m', '查询', 3, '资源分类 查询', '9449ce5dd5e24b21a9d15f806cb36e87', '/resourceSort/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ce0m', '查询', 3, '友情链接 查询', '9002d1ae905c4cb79c2a485333dad2f7', '/link/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ce1m', '查询', 3, '菜单管理 查询', 'aa225cdae6464bc0acebd732192f8362', '/categoryMenu/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ce99', '查询', 3, '分类管理 查询', '0a035547bbec404eb3ee0ef43312148d', '/blogSort/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ce9d', '查询', 3, '标签管理 查询', '6606b7e646d545e5a25c70b5e5fade9f', '/tag/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ce9m', '查询', 3, '评论管理 查询', '9beb7caa2c844b36a02789262dc76fbe', '/comment/getList', NULL, 1, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ce9q', '查询', 3, '用户管理 查询', 'fb4237a353d0418ab42c748b7c1d64c6', '/oldUser/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ceam', '查询', 3, '字典数据 查询', '062087bce19d00312b3787b6e24c21d1', '/sysDictData/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ceim', '查询', 3, '图片管理 查询', '1cc493d36e17fad535f2bf70242162b0', '/picture/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8cejm', '查询', 3, '管理员管理 查询', '2de247af3b0a459095e937d7ab9f5864', '/admin/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8cekm', '查询', 3, '异常日志 查询', '4337f63d13d84b9aba64b9d7a69fd066', '/log/getExceptionList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8celm', '查询', 3, '操作日志 查询', 'a5902692a3ed4fd794895bf634f97b8e', '/log/getLogList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8cemm', '查询', 3, '用户日志 查询', '9e91b4f993c946cba4bf720b2c1b2e90', '/webVisit/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8cenm', '查询', 3, '图片类别管理 查询', '4dea9c4f39d2480983e8c4333d35e036', '/pictureSort/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ceom', '查询', 3, '网站配置 查询', '2fb47d3b6dbd44279c8206740a263543', '/webConfig/getWebConfig', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8cesm', '查询', 3, '角色管理 查询', '5010ae46511e4c0b9f30d1c63ad3f0c1', '/role/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8cewm', '查询', 3, '反馈管理 查询', '6228ff4e9ebd42c89599b322201a0345', '/feedback/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8cezm', '查询', 3, '系统配置 查询', '78f24799307cb63bc3759413dadf4d1a', '/systemConfig/getSystemConfig', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8cj0a', '查询', 3, '视频管理 查询', 'ffc6e9ca2cc243febf6d2f476b849163', '/studyVideo/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8cj0m', '查询', 3, '字典管理 查询', 'c28f0b052e0b930299dd53de59cc32d7', '/sysDictType/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ck0m', '查询', 3, '关于我 查询', 'faccfe476b89483791c05019ad5b4906', '/system/getMe', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('fe45ea293f75dc88b96cab96c218512a', '查询', 3, '博客管理 查询', '1f01cd1d2f474743b241d74008b12333', '/blog/getList', NULL, 2, 1, '2020-03-21 18:17:36', '2020-10-07 15:36:19', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('ffc6e9ca2cc243febf6d2f476b849163', '视频管理', 2, '视频管理', '510483ce569b4fc88299f346147b1314', '/resource/studyVideo', 'el-icon-video-camera', 0, 1, '2018-11-28 19:43:50', '2020-05-30 08:51:41', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('ffe445828071ce87a851ad58100f1340', '导航栏管理 分页查询', 3, '导航栏管理 分页查询', '6275bc5189e2e595b621d744d68278af', '/webNavbar/getList', NULL, 0, 1, '2021-02-23 13:00:52', '2021-02-23 13:00:52', 1, 1, 0);

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一uid',
  `user_uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户uid',
  `to_uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复某条评论的uid',
  `to_user_uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复某个人的uid',
  `content` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `blog_uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '博客uid',
  `status` tinyint(0) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论来源： MESSAGE_BOARD，ABOUT，BLOG_INFO 等',
  `TYPE` tinyint(1) NOT NULL DEFAULT 0 COMMENT '评论类型 1:点赞 0:评论',
  `first_comment_uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级评论UID',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论表，替换sg_comment' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('01a334b167c757ede79c6384d4ba203b', '4340b8d1f9123ccbdf5c82a012787473', NULL, NULL, '你好呀', '4f47070aa279f9d7dccdeb94fa2a24b1', 1, '2020-12-31 20:01:45', '2020-12-31 20:01:45', 'BLOG_INFO', 0, NULL);
INSERT INTO `t_comment` VALUES ('01e6f0aac40b3beff973970ddfe34090', '4340b8d1f9123ccbdf5c82a012787473', NULL, NULL, '测试评论3', NULL, 1, '2020-12-26 15:28:12', '2020-12-26 15:28:12', 'MESSAGE_BOARD', 0, NULL);
INSERT INTO `t_comment` VALUES ('02cc64465cdf72c6e2eb4fdc002ccd1a', '4340b8d1f9123ccbdf5c82a012787473', NULL, NULL, '测试评论2', NULL, 1, '2020-12-26 15:22:25', '2020-12-26 15:22:25', 'MESSAGE_BOARD', 0, NULL);
INSERT INTO `t_comment` VALUES ('05318abc932c325a7bc61032228b2e69', '4340b8d1f9123ccbdf5c82a012787473', NULL, NULL, '测试评论2', '5adda57c05ec8ecb386a819375f328c0', 1, '2021-01-07 10:29:18', '2021-01-07 10:29:18', 'BLOG_INFO', 0, NULL);
INSERT INTO `t_comment` VALUES ('0815d442190900c42ea7ce4f41eb8335', 'b486735e7b914e366840d01f049306e4', NULL, NULL, '7', 'db56ab5dcd8c85c393c5dc0a9e65579c', 1, '2021-01-24 09:29:49', '2021-01-24 09:29:49', 'BLOG_INFO', 0, NULL);
INSERT INTO `t_comment` VALUES ('0c646ef5eb2160f9ef1bb42d162477d1', '9b3c520357e0494d85d6fc74119a7723', NULL, NULL, '测试评论2', NULL, 1, '2020-10-29 08:32:51', '2020-10-29 08:32:51', 'MESSAGE_BOARD', 0, NULL);
INSERT INTO `t_comment` VALUES ('0d51185b9556bff94df1cce87abc9657', '937f07cce6c570fe2e26b6a1ed359eaa', NULL, NULL, '测试评论2', NULL, 0, '2020-10-11 16:44:48', '2020-10-25 20:13:04', 'MESSAGE_BOARD', 0, NULL);
INSERT INTO `t_comment` VALUES ('12d82eac7284c396168d47f7ddb4c4cb', '937f07cce6c570fe2e26b6a1ed359eaa', '40635c3a0ee377727ce098c52dcae01e', '937f07cce6c570fe2e26b6a1ed359eaa', '测试评论3', NULL, 0, '2020-10-11 10:21:57', '2020-10-11 10:22:05', 'MESSAGE_BOARD', 0, 'c9905721f1dc371193cadc202ceb3743');
INSERT INTO `t_comment` VALUES ('14ae2d7aaa022eb12907fa838c805f23', 'b486735e7b914e366840d01f049306e4', NULL, NULL, 'http://www.baidu.com\n', NULL, 1, '2021-02-28 21:32:13', '2021-02-28 21:32:13', 'MESSAGE_BOARD', 0, NULL);
INSERT INTO `t_comment` VALUES ('15b3b148cdf722a30a42e394ba4ce6cc', 'b486735e7b914e366840d01f049306e4', NULL, NULL, '3', 'db56ab5dcd8c85c393c5dc0a9e65579c', 1, '2021-01-24 09:29:12', '2021-01-24 09:29:12', 'BLOG_INFO', 0, NULL);
INSERT INTO `t_comment` VALUES ('15fbdd644563bf64a08663fec47a8ed4', '4340b8d1f9123ccbdf5c82a012787473', NULL, NULL, '<span class=\"emoji-item-common emoji-angry emoji-size-small\"></span>你好', '4f47070aa279f9d7dccdeb94fa2a24b1', 1, '2020-12-31 19:58:35', '2020-12-31 19:58:35', 'BLOG_INFO', 0, NULL);
INSERT INTO `t_comment` VALUES ('181c049b4a1c5d0454ec9002acee7ba5', '4340b8d1f9123ccbdf5c82a012787473', NULL, NULL, '测试6', NULL, 1, '2020-12-26 15:32:17', '2020-12-26 15:32:17', 'MESSAGE_BOARD', 0, NULL);
INSERT INTO `t_comment` VALUES ('1b652a679369652f49ca9259807dbb68', '937f07cce6c570fe2e26b6a1ed359eaa', '1de8f25b63a1a66b95c77fcbfa4fd2fc', '937f07cce6c570fe2e26b6a1ed359eaa', '测试评论22', NULL, 0, '2020-10-11 10:20:55', '2020-10-11 10:21:31', 'MESSAGE_BOARD', 0, '1de8f25b63a1a66b95c77fcbfa4fd2fc');
INSERT INTO `t_comment` VALUES ('1de8f25b63a1a66b95c77fcbfa4fd2fc', '937f07cce6c570fe2e26b6a1ed359eaa', NULL, NULL, '测试评论1', NULL, 0, '2020-10-11 10:20:45', '2020-10-11 10:21:36', 'MESSAGE_BOARD', 0, NULL);
INSERT INTO `t_comment` VALUES ('28f71ffc135aad823379aac3ddf15e52', 'b486735e7b914e366840d01f049306e4', NULL, NULL, NULL, '635fc430e3378403a7d3f1e2a4e726a9', 1, '2020-11-14 08:36:10', '2020-11-14 08:36:10', 'BLOG_INFO', 1, NULL);
INSERT INTO `t_comment` VALUES ('30098d80ba11000f7f9a7cd763eb6aab', 'b486735e7b914e366840d01f049306e4', NULL, NULL, 'http://admin.moguit.cn/#/dashboard', NULL, 1, '2021-02-28 21:32:30', '2021-02-28 21:32:30', 'MESSAGE_BOARD', 0, NULL);
INSERT INTO `t_comment` VALUES ('381006986cdb55e9733620f1a5b879d3', '4340b8d1f9123ccbdf5c82a012787473', NULL, NULL, '测试评论2', NULL, 1, '2020-12-26 15:28:06', '2020-12-26 15:28:06', 'MESSAGE_BOARD', 0, NULL);
INSERT INTO `t_comment` VALUES ('40635c3a0ee377727ce098c52dcae01e', '937f07cce6c570fe2e26b6a1ed359eaa', 'c9905721f1dc371193cadc202ceb3743', '937f07cce6c570fe2e26b6a1ed359eaa', '测试评论2', NULL, 0, '2020-10-11 10:21:52', '2020-10-11 10:22:05', 'MESSAGE_BOARD', 0, 'c9905721f1dc371193cadc202ceb3743');
INSERT INTO `t_comment` VALUES ('453df840913be0b42829ddb756704f01', 'b486735e7b914e366840d01f049306e4', NULL, NULL, '6', 'db56ab5dcd8c85c393c5dc0a9e65579c', 1, '2021-01-24 09:29:47', '2021-01-24 09:29:47', 'BLOG_INFO', 0, NULL);
INSERT INTO `t_comment` VALUES ('45c2f8d7a12cbf29796d381df84b9cd0', 'b486735e7b914e366840d01f049306e4', NULL, NULL, '10', 'db56ab5dcd8c85c393c5dc0a9e65579c', 0, '2021-01-24 09:29:54', '2021-01-24 10:11:25', 'BLOG_INFO', 0, NULL);
INSERT INTO `t_comment` VALUES ('48e11e09d4db50b952043ac6002b36b0', 'b486735e7b914e366840d01f049306e4', NULL, NULL, '测试拉拉', NULL, 1, '2021-02-27 13:16:34', '2021-02-27 13:16:34', 'MESSAGE_BOARD', 0, NULL);
INSERT INTO `t_comment` VALUES ('4cebac698cda9ac3098025ed565dbe02', '4340b8d1f9123ccbdf5c82a012787473', NULL, NULL, '测试11', NULL, 1, '2021-01-07 10:08:53', '2021-01-07 10:08:53', 'MESSAGE_BOARD', 0, NULL);
INSERT INTO `t_comment` VALUES ('522977b3c4d2f0964db44e2b613b9f90', '937f07cce6c570fe2e26b6a1ed359eaa', NULL, NULL, '一级评论', NULL, 0, '2020-10-11 10:13:40', '2020-10-11 10:13:59', 'MESSAGE_BOARD', 0, NULL);
INSERT INTO `t_comment` VALUES ('5390b1b7147c2d1902b6e43138ba3026', '937f07cce6c570fe2e26b6a1ed359eaa', NULL, NULL, '测试评论2', NULL, 0, '2020-10-11 10:20:41', '2020-10-11 10:21:39', 'MESSAGE_BOARD', 0, NULL);
INSERT INTO `t_comment` VALUES ('54729a270e3d9166c09c3fd240280918', 'b486735e7b914e366840d01f049306e4', '8a563aeb833d8098f01339600584f932', 'b486735e7b914e366840d01f049306e4', '测试', NULL, 1, '2021-03-25 09:55:16', '2021-03-25 09:55:16', 'MESSAGE_BOARD', 0, 'ce3b2e21a6fed94d76ebc47987089cc3');
INSERT INTO `t_comment` VALUES ('5a35ea7dc1bfc15313a59b6fbe01cd38', '4340b8d1f9123ccbdf5c82a012787473', NULL, NULL, '测试评论', NULL, 1, '2020-12-31 20:03:47', '2020-12-31 20:03:47', 'ABOUT', 0, NULL);
INSERT INTO `t_comment` VALUES ('5dc1094a02f52537ab3fb1f9eec1e3b3', '9b3c520357e0494d85d6fc74119a7723', '0c646ef5eb2160f9ef1bb42d162477d1', '9b3c520357e0494d85d6fc74119a7723', '测试评论3', NULL, 1, '2020-10-29 08:32:55', '2020-10-29 08:32:55', 'MESSAGE_BOARD', 0, '0c646ef5eb2160f9ef1bb42d162477d1');
INSERT INTO `t_comment` VALUES ('6187d7754f62cf1d2c2aab1d0447c7dd', 'b486735e7b914e366840d01f049306e4', NULL, NULL, '4', 'db56ab5dcd8c85c393c5dc0a9e65579c', 1, '2021-01-24 09:29:16', '2021-01-24 09:29:16', 'BLOG_INFO', 0, NULL);
INSERT INTO `t_comment` VALUES ('61f6eb45da9673bd0fc1359825827d61', 'b486735e7b914e366840d01f049306e4', NULL, NULL, '11', 'db56ab5dcd8c85c393c5dc0a9e65579c', 0, '2021-01-24 09:29:56', '2021-01-24 10:11:25', 'BLOG_INFO', 0, NULL);
INSERT INTO `t_comment` VALUES ('67e43dab975bd27737458b49901b7504', '4340b8d1f9123ccbdf5c82a012787473', 'cde9e68ab678f197e6bd7c7b452aae35', '4340b8d1f9123ccbdf5c82a012787473', '你好呀', NULL, 1, '2020-12-26 15:28:21', '2020-12-26 15:28:21', 'MESSAGE_BOARD', 0, 'cde9e68ab678f197e6bd7c7b452aae35');
INSERT INTO `t_comment` VALUES ('6b987a9c55a9e6aa526c6a4eb31b4744', 'b486735e7b914e366840d01f049306e4', NULL, NULL, 'http://moguit.cn/#/info?blogOid=589', NULL, 1, '2021-02-28 21:34:55', '2021-02-28 21:34:55', 'MESSAGE_BOARD', 0, NULL);
INSERT INTO `t_comment` VALUES ('6dc8dfccec2b7c5773d4d4ca79e2a715', '4340b8d1f9123ccbdf5c82a012787473', NULL, NULL, '测试4', NULL, 1, '2020-12-26 15:32:11', '2020-12-26 15:32:11', 'MESSAGE_BOARD', 0, NULL);
INSERT INTO `t_comment` VALUES ('727215be2ccfeab4366b8aa7973de2f1', 'b486735e7b914e366840d01f049306e4', '82a509af2dc29ae215515c7a14ceb9a7', 'b486735e7b914e366840d01f049306e4', '测试评论', NULL, 1, '2021-03-24 22:03:35', '2021-03-24 22:03:35', 'MESSAGE_BOARD', 0, 'ce3b2e21a6fed94d76ebc47987089cc3');
INSERT INTO `t_comment` VALUES ('7a48bf3c895e9200b2476e7edbb5f099', '4340b8d1f9123ccbdf5c82a012787473', NULL, NULL, '测试9', NULL, 1, '2021-01-07 09:22:48', '2021-01-07 09:22:48', 'MESSAGE_BOARD', 0, NULL);
INSERT INTO `t_comment` VALUES ('80044797b6d523459ac393758b17206c', 'a8f8248f6ad406300390b2c6fee472a9', 'ce3b2e21a6fed94d76ebc47987089cc3', 'b486735e7b914e366840d01f049306e4', '你好呀', NULL, 1, '2021-03-25 10:00:02', '2021-03-25 10:00:02', 'MESSAGE_BOARD', 0, 'ce3b2e21a6fed94d76ebc47987089cc3');
INSERT INTO `t_comment` VALUES ('80bed09651a8081890f20533c5e6037b', 'b486735e7b914e366840d01f049306e4', NULL, NULL, '12', 'db56ab5dcd8c85c393c5dc0a9e65579c', 0, '2021-01-24 09:29:57', '2021-01-24 10:10:21', 'BLOG_INFO', 0, NULL);
INSERT INTO `t_comment` VALUES ('80dc80f77a4453cc89e46c8150e30ace', '4340b8d1f9123ccbdf5c82a012787473', NULL, NULL, '测试5', NULL, 1, '2020-12-26 15:32:13', '2020-12-26 15:32:13', 'MESSAGE_BOARD', 0, NULL);
INSERT INTO `t_comment` VALUES ('82a509af2dc29ae215515c7a14ceb9a7', 'b486735e7b914e366840d01f049306e4', 'ce3b2e21a6fed94d76ebc47987089cc3', 'b486735e7b914e366840d01f049306e4', '你好', NULL, 1, '2021-03-24 21:42:26', '2021-03-24 21:42:26', 'MESSAGE_BOARD', 0, 'ce3b2e21a6fed94d76ebc47987089cc3');
INSERT INTO `t_comment` VALUES ('8a1b9a64a3c0ab304fe978445728753c', '937f07cce6c570fe2e26b6a1ed359eaa', 'b60c47a9b8da50aca21fce1b897ba708', '937f07cce6c570fe2e26b6a1ed359eaa', '测试评论22', NULL, 0, '2020-10-11 10:19:55', '2020-10-11 10:20:19', 'MESSAGE_BOARD', 0, 'b60c47a9b8da50aca21fce1b897ba708');
INSERT INTO `t_comment` VALUES ('8a563aeb833d8098f01339600584f932', 'b486735e7b914e366840d01f049306e4', 'ce3b2e21a6fed94d76ebc47987089cc3', 'b486735e7b914e366840d01f049306e4', '测试2', NULL, 1, '2021-03-24 22:03:56', '2021-03-24 22:03:56', 'MESSAGE_BOARD', 0, 'ce3b2e21a6fed94d76ebc47987089cc3');
INSERT INTO `t_comment` VALUES ('8e4ba5f12933cb141390dac483bfdb2f', '4340b8d1f9123ccbdf5c82a012787473', NULL, NULL, '测试10', NULL, 1, '2021-01-07 10:05:45', '2021-01-07 10:05:45', 'MESSAGE_BOARD', 0, NULL);
INSERT INTO `t_comment` VALUES ('8efb95e66741ec42522e800e47e3bcb9', '937f07cce6c570fe2e26b6a1ed359eaa', '1b652a679369652f49ca9259807dbb68', '937f07cce6c570fe2e26b6a1ed359eaa', '测试评论33', NULL, 0, '2020-10-11 10:20:59', '2020-10-11 10:21:17', 'MESSAGE_BOARD', 0, '1de8f25b63a1a66b95c77fcbfa4fd2fc');
INSERT INTO `t_comment` VALUES ('90ba3be5e009f1e62ad5c173888674d7', '4340b8d1f9123ccbdf5c82a012787473', '67e43dab975bd27737458b49901b7504', '4340b8d1f9123ccbdf5c82a012787473', '你很好', NULL, 1, '2020-12-26 15:28:25', '2020-12-26 15:28:25', 'MESSAGE_BOARD', 0, 'cde9e68ab678f197e6bd7c7b452aae35');
INSERT INTO `t_comment` VALUES ('959bd7b93db52358085a060f1b969642', 'b486735e7b914e366840d01f049306e4', NULL, NULL, '13', 'db56ab5dcd8c85c393c5dc0a9e65579c', 0, '2021-01-24 09:29:59', '2021-01-24 10:10:21', 'BLOG_INFO', 0, NULL);
INSERT INTO `t_comment` VALUES ('95cb923abe2d5c79800bdf7fdecf0fc2', '937f07cce6c570fe2e26b6a1ed359eaa', NULL, NULL, '测试评论3', NULL, 0, '2020-10-11 10:20:34', '2020-10-11 10:21:09', 'MESSAGE_BOARD', 0, NULL);
INSERT INTO `t_comment` VALUES ('95fa862af3c20deba7fc353e2c178ff3', '937f07cce6c570fe2e26b6a1ed359eaa', '522977b3c4d2f0964db44e2b613b9f90', '937f07cce6c570fe2e26b6a1ed359eaa', '二级评论', NULL, 0, '2020-10-11 10:13:45', '2020-10-11 10:16:35', 'MESSAGE_BOARD', 0, '522977b3c4d2f0964db44e2b613b9f90');
INSERT INTO `t_comment` VALUES ('98275bab5db4fd3c7a6c9da654948590', '4340b8d1f9123ccbdf5c82a012787473', NULL, NULL, '测试8', NULL, 1, '2020-12-26 15:32:26', '2020-12-26 15:32:26', 'MESSAGE_BOARD', 0, NULL);
INSERT INTO `t_comment` VALUES ('a400344a462976e4de3ec5845c689468', 'b486735e7b914e366840d01f049306e4', NULL, NULL, '8', 'db56ab5dcd8c85c393c5dc0a9e65579c', 0, '2021-01-24 09:29:50', '2021-01-24 10:13:19', 'BLOG_INFO', 0, NULL);
INSERT INTO `t_comment` VALUES ('a4cd46269df4ad36c3648d902de9cc6b', 'b486735e7b914e366840d01f049306e4', NULL, NULL, '1', 'db56ab5dcd8c85c393c5dc0a9e65579c', 1, '2021-01-24 09:29:08', '2021-01-24 09:29:08', 'BLOG_INFO', 0, NULL);
INSERT INTO `t_comment` VALUES ('aa5cabc8acaf701a9a53c2b8a4a8d8dc', 'a8f8248f6ad406300390b2c6fee472a9', '54729a270e3d9166c09c3fd240280918', 'b486735e7b914e366840d01f049306e4', '小明hello', NULL, 1, '2021-03-25 10:00:14', '2021-03-25 10:00:14', 'MESSAGE_BOARD', 0, 'ce3b2e21a6fed94d76ebc47987089cc3');
INSERT INTO `t_comment` VALUES ('ac742c772e2d4dd49a4123d1ce550f4a', '4340b8d1f9123ccbdf5c82a012787473', 'dcef593f2c364108490ca57c1e5079bf', '4340b8d1f9123ccbdf5c82a012787473', 'hello', '4f47070aa279f9d7dccdeb94fa2a24b1', 1, '2020-12-31 20:01:39', '2020-12-31 20:01:39', 'BLOG_INFO', 0, 'd30399881a83c9fc6bb9e6f12ff12ee5');
INSERT INTO `t_comment` VALUES ('adf9ab3e93b4564c06064feea7df0787', '4340b8d1f9123ccbdf5c82a012787473', NULL, NULL, '测试评论', NULL, 1, '2020-12-26 15:27:59', '2020-12-26 15:27:59', 'MESSAGE_BOARD', 0, NULL);
INSERT INTO `t_comment` VALUES ('b0d2b3afd18792c73c5475f97cbfa52b', 'b486735e7b914e366840d01f049306e4', 'b3a51022c46ca85df0d4f5aec33cac02', 'b486735e7b914e366840d01f049306e4', '我是卖报的小行家', 'db56ab5dcd8c85c393c5dc0a9e65579c', 1, '2021-03-25 10:01:09', '2021-03-25 10:01:09', 'BLOG_INFO', 0, 'b5ec0fcbea32bda11b647d5dd6b8b396');
INSERT INTO `t_comment` VALUES ('b3a51022c46ca85df0d4f5aec33cac02', 'b486735e7b914e366840d01f049306e4', 'b5ec0fcbea32bda11b647d5dd6b8b396', 'b486735e7b914e366840d01f049306e4', '啦啦啦', 'db56ab5dcd8c85c393c5dc0a9e65579c', 1, '2021-03-25 10:01:03', '2021-03-25 10:01:03', 'BLOG_INFO', 0, 'b5ec0fcbea32bda11b647d5dd6b8b396');
INSERT INTO `t_comment` VALUES ('b5ec0fcbea32bda11b647d5dd6b8b396', 'b486735e7b914e366840d01f049306e4', NULL, NULL, 'hello', 'db56ab5dcd8c85c393c5dc0a9e65579c', 1, '2021-03-25 10:00:57', '2021-03-25 10:00:57', 'BLOG_INFO', 0, NULL);
INSERT INTO `t_comment` VALUES ('b60c47a9b8da50aca21fce1b897ba708', '937f07cce6c570fe2e26b6a1ed359eaa', NULL, NULL, '测试评论1', NULL, 0, '2020-10-11 10:19:36', '2020-10-11 10:20:03', 'MESSAGE_BOARD', 0, NULL);
INSERT INTO `t_comment` VALUES ('b7098644d1439c555671b6798b58b724', '937f07cce6c570fe2e26b6a1ed359eaa', 'c1354c5696403f5d7592801b9f32d2b2', '937f07cce6c570fe2e26b6a1ed359eaa', '测试评论3', NULL, 0, '2020-10-11 10:19:46', '2020-10-11 10:20:19', 'MESSAGE_BOARD', 0, 'b60c47a9b8da50aca21fce1b897ba708');
INSERT INTO `t_comment` VALUES ('bd5212e1a2ec72a2c934c6040686efdd', 'b486735e7b914e366840d01f049306e4', NULL, NULL, '2', 'db56ab5dcd8c85c393c5dc0a9e65579c', 1, '2021-01-24 09:29:10', '2021-01-24 09:29:10', 'BLOG_INFO', 0, NULL);
INSERT INTO `t_comment` VALUES ('bfc1e4b7e16e5d3c316b34b87a5228a1', '4340b8d1f9123ccbdf5c82a012787473', '90ba3be5e009f1e62ad5c173888674d7', '4340b8d1f9123ccbdf5c82a012787473', '我也很好', NULL, 1, '2020-12-26 15:28:33', '2020-12-26 15:28:33', 'MESSAGE_BOARD', 0, 'cde9e68ab678f197e6bd7c7b452aae35');
INSERT INTO `t_comment` VALUES ('c07a28f3ae9f4e0597018f2fce5448d1', 'b486735e7b914e366840d01f049306e4', NULL, NULL, '9', 'db56ab5dcd8c85c393c5dc0a9e65579c', 0, '2021-01-24 09:29:52', '2021-01-24 10:12:47', 'BLOG_INFO', 0, NULL);
INSERT INTO `t_comment` VALUES ('c1354c5696403f5d7592801b9f32d2b2', '937f07cce6c570fe2e26b6a1ed359eaa', 'b60c47a9b8da50aca21fce1b897ba708', '937f07cce6c570fe2e26b6a1ed359eaa', '测试评论2', NULL, 0, '2020-10-11 10:19:41', '2020-10-11 10:20:19', 'MESSAGE_BOARD', 0, 'b60c47a9b8da50aca21fce1b897ba708');
INSERT INTO `t_comment` VALUES ('c2bf652571a5154355940938550d7e17', 'b486735e7b914e366840d01f049306e4', NULL, NULL, '5', 'db56ab5dcd8c85c393c5dc0a9e65579c', 1, '2021-01-24 09:29:44', '2021-01-24 09:29:44', 'BLOG_INFO', 0, NULL);
INSERT INTO `t_comment` VALUES ('c90a335a6aa0c9671facf3de2d1f27cd', '937f07cce6c570fe2e26b6a1ed359eaa', '95fa862af3c20deba7fc353e2c178ff3', '937f07cce6c570fe2e26b6a1ed359eaa', '三级评论', NULL, 0, '2020-10-11 10:13:51', '2020-10-11 10:16:36', 'MESSAGE_BOARD', 0, '522977b3c4d2f0964db44e2b613b9f90');
INSERT INTO `t_comment` VALUES ('c9905721f1dc371193cadc202ceb3743', '937f07cce6c570fe2e26b6a1ed359eaa', NULL, NULL, '测试评论', NULL, 0, '2020-10-11 10:21:48', '2020-10-11 10:22:05', 'MESSAGE_BOARD', 0, NULL);
INSERT INTO `t_comment` VALUES ('cde9e68ab678f197e6bd7c7b452aae35', '4340b8d1f9123ccbdf5c82a012787473', NULL, NULL, '测试评论4', NULL, 1, '2020-12-26 15:28:16', '2020-12-26 15:28:16', 'MESSAGE_BOARD', 0, NULL);
INSERT INTO `t_comment` VALUES ('ce3b2e21a6fed94d76ebc47987089cc3', 'b486735e7b914e366840d01f049306e4', NULL, NULL, '测试', NULL, 1, '2021-03-24 21:42:22', '2021-03-24 21:42:22', 'MESSAGE_BOARD', 0, NULL);
INSERT INTO `t_comment` VALUES ('cf7edb6c89c22179bc29242d332ae0b7', '4340b8d1f9123ccbdf5c82a012787473', NULL, NULL, '测试评论3', '5adda57c05ec8ecb386a819375f328c0', 1, '2021-01-07 10:40:42', '2021-01-07 10:40:42', 'BLOG_INFO', 0, NULL);
INSERT INTO `t_comment` VALUES ('d0922506d5899f69bb81bc3235ca4430', '4340b8d1f9123ccbdf5c82a012787473', NULL, NULL, '测试评论2', NULL, 1, '2021-01-07 10:28:45', '2021-01-07 10:28:45', 'ABOUT', 0, NULL);
INSERT INTO `t_comment` VALUES ('d27faf942db9e32d6f377b7f45d4957b', '9b3c520357e0494d85d6fc74119a7723', NULL, NULL, '测试', NULL, 0, '2020-10-29 08:32:46', '2020-11-12 14:50:27', 'MESSAGE_BOARD', 0, NULL);
INSERT INTO `t_comment` VALUES ('d30399881a83c9fc6bb9e6f12ff12ee5', '4340b8d1f9123ccbdf5c82a012787473', NULL, NULL, 'hello', '4f47070aa279f9d7dccdeb94fa2a24b1', 1, '2020-12-31 19:58:41', '2020-12-31 19:58:41', 'BLOG_INFO', 0, NULL);
INSERT INTO `t_comment` VALUES ('d50bb8536fbd557894fd2f8167cca69b', '4340b8d1f9123ccbdf5c82a012787473', NULL, NULL, '测试7', NULL, 1, '2020-12-26 15:32:21', '2020-12-26 15:32:21', 'MESSAGE_BOARD', 0, NULL);
INSERT INTO `t_comment` VALUES ('dbbf8296b5b46f44e69421ee5b096a68', '4340b8d1f9123ccbdf5c82a012787473', NULL, NULL, '测试3', NULL, 1, '2020-12-26 15:32:07', '2020-12-26 15:32:07', 'MESSAGE_BOARD', 0, NULL);
INSERT INTO `t_comment` VALUES ('dcef593f2c364108490ca57c1e5079bf', '4340b8d1f9123ccbdf5c82a012787473', 'd30399881a83c9fc6bb9e6f12ff12ee5', '4340b8d1f9123ccbdf5c82a012787473', 'hello', '4f47070aa279f9d7dccdeb94fa2a24b1', 1, '2020-12-31 20:01:35', '2020-12-31 20:01:35', 'BLOG_INFO', 0, 'd30399881a83c9fc6bb9e6f12ff12ee5');
INSERT INTO `t_comment` VALUES ('e0f6527269a8de7e232c42a53649da3c', 'b486735e7b914e366840d01f049306e4', NULL, NULL, '14', 'db56ab5dcd8c85c393c5dc0a9e65579c', 0, '2021-01-24 09:30:01', '2021-01-24 10:10:15', 'BLOG_INFO', 0, NULL);
INSERT INTO `t_comment` VALUES ('f1c0351b9de3420c763fa998757360b1', '9b3c520357e0494d85d6fc74119a7723', NULL, NULL, '陌溪', NULL, 0, '2020-10-25 20:15:16', '2020-10-25 20:15:23', 'MESSAGE_BOARD', 0, NULL);
INSERT INTO `t_comment` VALUES ('f901f9228607131d35debce45fb2b69b', '9b3c520357e0494d85d6fc74119a7723', NULL, NULL, '你好', NULL, 0, '2020-10-25 20:14:13', '2020-10-25 20:14:18', 'MESSAGE_BOARD', 0, NULL);
INSERT INTO `t_comment` VALUES ('fb625677790db9e9cf4d00aa9ca11fd1', '4340b8d1f9123ccbdf5c82a012787473', NULL, NULL, '测试12', NULL, 1, '2021-01-07 10:28:06', '2021-01-07 10:28:06', 'MESSAGE_BOARD', 0, NULL);

-- ----------------------------
-- Table structure for t_sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_resource`;
CREATE TABLE `t_sys_resource`  (
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一uid',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `menu_level` tinyint(1) NULL DEFAULT NULL COMMENT '菜单级别',
  `summary` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `parent_uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父uid',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'url地址',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `sort` int(0) NULL DEFAULT 0 COMMENT '排序字段，越大越靠前',
  `status` tinyint(0) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否显示 1:是 0:否',
  `menu_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '菜单类型 0: 菜单   1: 按钮',
  `is_jump_external_url` tinyint(1) NULL DEFAULT 0 COMMENT '是否跳转外部链接 0：否，1：是',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资源表，替换sys_resource，在mogu_blog中是t_category_menu' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_resource
-- ----------------------------
INSERT INTO `t_sys_resource` VALUES ('02ea2f9ef5d44f559fb66189b05f6769', 'Solr', 2, 'Solr监控中心', '147cd431cbb9007bde87444d7987b151', '/monitor/Solr', 'el-icon-lightning', 0, 1, '2018-11-30 03:55:39', '2020-12-09 20:41:22', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('062087bce19d00312b3787b6e24c21d1', '字典数据', 2, '字典数据', 'badf0010422b432ba6ec9c83a25012ed', '/system/sysDictData', 'el-icon-data-line', 0, 1, '2020-02-21 18:06:11', '2020-05-30 08:44:04', 0, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('065cda845549289b2afcd0129d87c2c0', '新增用户', 3, '新增用户', 'fb4237a353d0418ab42c748b7c1d64c6', '/oldUser/add', NULL, 0, 1, '2020-09-29 20:40:09', '2020-09-29 20:40:30', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('079f0cfdb7a7017d827f5c349983eebc', 'Eureka', 2, 'Eureka监控中心', '147cd431cbb9007bde87444d7987b151', '/monitor/eureka', 'el-icon-moon-night', 0, 0, '2020-01-06 05:27:30', '2020-12-05 15:21:41', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('0a035547bbec404eb3ee0ef43312148d', '分类管理', 2, '管理博客分类', '49b42250abcb47ff876bad699cf34f03', '/blog/blogSort', 'el-icon-brush', 10, 1, '2018-11-26 03:07:14', '2020-05-30 08:34:17', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('0cab1fcdcd01f394768e2e2674e56773', '本地上传', 3, '本地文件上传', '1f01cd1d2f474743b241d74008b12333', '/blog/uploadLocalBlog', NULL, 1, 1, '2020-04-15 17:28:36', '2020-07-09 21:40:01', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('147cd431cbb9007bde87444d7987b151', '监控中心', 1, '监控中心', NULL, '/monitor', 'el-icon-monitor', 0, 1, '2020-01-06 13:25:32', '2020-07-09 21:33:11', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('14bcfc15d02f0d568adf2d383c0342d8', '查询', 3, '服务监控查询', 'a0c40ddd3fe15bb3f2edf9ec242a1511', '/monitor/getServerInfo', NULL, 0, 1, '2020-06-03 09:27:41', '2020-06-03 09:27:41', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('152216a4fd9b995aa20bfa1eec6312c2', 'Nacos', 2, 'Nacos图形化界面', '147cd431cbb9007bde87444d7987b151', 'http://localhost:8848/nacos', 'el-icon-star-off', 5, 1, '2020-07-03 21:39:58', '2020-12-05 15:31:11', 1, 0, 1);
INSERT INTO `t_sys_resource` VALUES ('16a75a3c38e71c1046b443b4b64dd930', '删除选中', 3, '博客管理 删除选中', '1f01cd1d2f474743b241d74008b12333', '/blog/deleteBatch', NULL, 0, 1, '2020-03-21 18:21:01', '2020-03-21 18:21:01', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('1cc493d36e17fad535f2bf70242162b0', '图片管理', 2, '图片管理', '65e22f3d36d94bcea47478aba02895a1', '/picture/picture', 'el-icon-brush', 1, 1, '2020-02-21 22:27:12', '2020-10-12 10:12:30', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('1d9a5030142e9fd7690f554c20e3bc90', '推荐管理', 2, '博客推荐管理', '49b42250abcb47ff876bad699cf34f03', '/blog/blogRecommend', 'el-icon-ice-cream-round', 0, 1, '2020-01-28 10:06:32', '2020-05-30 08:34:54', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('1dd262b88b63e8f6bd9a6ca72ed0622c', '导航栏管理 删除', 3, '导航栏管理 删除', '6275bc5189e2e595b621d744d68278af', '/webNavbar/delete', NULL, 0, 1, '2021-02-23 13:02:12', '2021-02-23 13:02:12', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('1f01cd1d2f474743b241d74008b12333', '博客管理', 2, '对博客进行增删改查', '49b42250abcb47ff876bad699cf34f03', '/blog/blog', 'el-icon-notebook-2', 11, 1, '2018-11-27 03:47:07', '2020-05-30 08:33:22', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('21a411858fc22b5feb4c44fcad00e529', '导航栏管理 编辑', 3, '导航栏管理 编辑', '6275bc5189e2e595b621d744d68278af', '/webNavbar/edit', NULL, 0, 1, '2021-02-23 13:01:36', '2021-02-23 13:01:36', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('237d410f90d0c70b894f87a87718d88c', '删除全选', 3, '专题元素管理 删除全选', '7cb1a6b7462832bf831a18a28eea94cd', '/subjectItem/deleteBatch', NULL, 0, 1, '2020-08-23 09:17:22', '2020-08-23 09:17:22', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('238352fc7e86340c339b9a575b1b7086', 'Sentinel', 2, 'Sentinel监控中心', '147cd431cbb9007bde87444d7987b151', 'http://localhost:8070/sentinel/', 'el-icon-warning-outline', 4, 1, '2020-07-06 21:25:52', '2020-12-05 15:31:27', 1, 0, 1);
INSERT INTO `t_sys_resource` VALUES ('2496af227b283bc79d9261b73e3ea743', '删除选中', 3, '参数配置 删除选中', '3eacc357e23b0b17e4f835c2f998ed34', '/sysParams/deleteBatch', NULL, 0, 1, '2020-07-21 16:49:18', '2020-07-21 16:49:18', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('25b3ea9639872aa730ad6147baf61641', '删除', 3, '参数配置 删除', '3eacc357e23b0b17e4f835c2f998ed34', '/sysParams/deleteBatch', NULL, 0, 1, '2020-07-21 16:48:57', '2020-07-21 16:48:57', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('26bcccf0164bf84f12ab20448388d346', '待办事项', 2, '首页  代办事项', 'badf0010422b432ba6ec9c83a25012ed', '/dashboard/todo', 'el-icon-date', 0, 1, '2020-03-23 07:51:52', '2020-05-30 09:06:59', 0, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('2a733ff390af9b44ecda4e8c4634d73k', '删除', 3, '菜单管理 删除', 'aa225cdae6464bc0acebd732192f8362', '/categoryMenu/delete', NULL, 0, 1, '2020-03-21 18:23:19', '2020-03-21 18:23:19', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('2a733ff390af9b44ecda4e8c4634d75d', '删除选中', 3, '分类管理 删除选中', '0a035547bbec404eb3ee0ef43312148d', '/blogSort/deleteBatch', NULL, 0, 1, '2020-03-21 18:23:19', '2020-03-21 18:23:19', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('2a733ff390af9b44ecda4e8c4634d75f', '删除选中', 3, '标签管理 删除选中', '6606b7e646d545e5a25c70b5e5fade9f', '/tag/deleteBatch', NULL, 0, 1, '2020-03-21 18:23:19', '2020-03-21 18:23:19', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('2a733ff390af9b44ecda4e8c4634d75k', '删除选中', 3, '评论管理 删除选中', '9beb7caa2c844b36a02789262dc76fbe', '/comment/deleteBatch', NULL, 0, 1, '2020-03-21 18:23:19', '2020-04-21 08:33:27', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('2a733ff390af9b44ecda4e8c4634d75t', '重置密码', 3, '用户管理 重置密码', 'fb4237a353d0418ab42c748b7c1d64c6', '/oldUser/resetUserPassword', NULL, 0, 1, '2020-03-21 18:23:19', '2020-04-21 08:28:37', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('2a733ff390af9b44ecda4e8c4634d75u', '初始化ElasticSearch索引', 3, 'ElasticSearch 初始化ElasticSearch索引', 'bfc9463e59a3ca250dcfc1c86627e034', '/search/initElasticIndex', NULL, 0, 1, '2020-03-21 18:23:19', '2020-03-21 18:23:19', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('2a733ff390af9b44ecda4e8c4634d75v', '初始化Solr索引', 3, 'Solr 初始化Solr索引', '02ea2f9ef5d44f559fb66189b05f6769', '/search/initSolrIndex', NULL, 0, 1, '2020-03-21 18:23:19', '2020-03-21 18:23:19', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('2a733ff390af9b44ecda4e8c4634d78k', '删除', 3, '友情链接 删除', '9002d1ae905c4cb79c2a485333dad2f7', '/link/delete', NULL, 0, 1, '2020-03-21 18:23:19', '2020-03-21 18:23:19', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('2a733ff390af9b44ecda4e8c4634d7ck', '删除选中', 3, '字典数据 删除选中', '062087bce19d00312b3787b6e24c21d1', '/sysDictData/deleteBatch', NULL, 0, 1, '2020-03-21 18:23:19', '2020-03-21 18:23:19', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('2a733ff390af9b44ecda4e8c4634d7gk', '删除选中', 3, '图片管理 删除选中', '1cc493d36e17fad535f2bf70242162b0', '/picture/delete', NULL, 0, 1, '2020-03-21 18:23:19', '2020-03-21 18:23:19', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('2a733ff390af9b44ecda4e8c4634d7lk', '删除', 3, '管理员管理 删除', '2de247af3b0a459095e937d7ab9f5864', '/admin/delete', NULL, 0, 1, '2020-03-21 18:23:19', '2020-03-21 18:23:19', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('2a733ff390af9b44ecda4e8c4634d7pk', '删除', 3, '图片类别管理 删除', '4dea9c4f39d2480983e8c4333d35e036', '/pictureSort/delete', NULL, 0, 1, '2020-03-21 18:23:19', '2020-03-21 18:23:19', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('2a733ff390af9b44ecda4e8c4634d7uk', '删除', 3, '角色管理 删除', '5010ae46511e4c0b9f30d1c63ad3f0c1', '/role/delete', NULL, 0, 1, '2020-03-21 18:23:19', '2020-03-21 18:23:19', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('2a733ff390af9b44ecda4e8c4634db8k', '删除', 3, '资源分类 删除', '9449ce5dd5e24b21a9d15f806cb36e87', '/resourceSort/deleteBatch', NULL, 0, 1, '2020-03-21 18:23:19', '2020-03-21 18:23:19', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('2a733ff390af9b44ecda4e8c4634dh8c', '删除', 3, '视频管理 删除', 'ffc6e9ca2cc243febf6d2f476b849163', '/studyVideo/deleteBatch', NULL, 0, 1, '2020-03-21 18:23:19', '2020-03-21 18:23:19', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('2a733ff390af9b44ecda4e8c4634dh8k', '删除', 3, '字典管理 删除', 'c28f0b052e0b930299dd53de59cc32d7', '/sysDictType/delete', NULL, 0, 1, '2020-03-21 18:23:19', '2020-03-21 18:23:19', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('2a733ff390af9b44ecda4e8c4634dm8k', '修改密码', 3, '关于我 修改密码', 'faccfe476b89483791c05019ad5b4906', '/system/changePwd', NULL, 0, 1, '2020-03-21 18:23:19', '2020-03-21 18:23:19', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('2b983c5439ac07f2cf07437ba9fff6be', '编辑', 3, '博客管理 编辑', '1f01cd1d2f474743b241d74008b12333', '/blog/edit', NULL, 0, 1, '2020-03-21 18:15:26', '2020-03-21 18:15:26', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('2d5cd8a387fc2d010c245acd65fefd3b', '强退用户', 3, '强退后台管理员', 'bfcb9b002c3de18f269189c573b985f8', '/admin/forceLogout', NULL, 0, 1, '2020-06-09 18:48:28', '2020-06-09 18:48:28', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('2de247af3b0a459095e937d7ab9f5864', '管理员管理', 2, '管理员增删改查', 'd3a19221259d439b916f475e43edb13d', '/authority/admin', 'el-icon-trophy', 0, 1, '2018-11-25 19:09:21', '2020-05-30 08:45:43', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('2fb47d3b6dbd44279c8206740a263543', '网站配置', 2, '网站配置', 'badf0010422b432ba6ec9c83a25012ed', '/system/webConfig', 'el-icon-setting', 1, 1, '2018-11-28 19:59:04', '2020-08-30 08:01:11', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('327d945daf4ddb71976c4ab3830e7c4i', '新增', 3, '菜单管理 新增', 'aa225cdae6464bc0acebd732192f8362', '/categoryMenu/add', NULL, 0, 1, '2020-03-21 18:22:06', '2020-03-21 18:22:06', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('327d945daf4ddb71976c4ab3830e7c66', '新增', 3, '分类管理 新增', '0a035547bbec404eb3ee0ef43312148d', '/blogSort/add', NULL, 0, 1, '2020-03-21 18:22:06', '2020-03-21 18:22:06', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('327d945daf4ddb71976c4ab3830e7c6h', '新增', 3, '标签管理 新增', '6606b7e646d545e5a25c70b5e5fade9f', '/tag/add', NULL, 0, 1, '2020-03-21 18:22:06', '2020-03-21 18:22:06', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('327d945daf4ddb71976c4ab3830e7c6i', '新增', 3, '评论管理 新增', '9beb7caa2c844b36a02789262dc76fbe', '/comment/add', NULL, 0, 1, '2020-03-21 18:22:06', '2020-04-21 08:33:12', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('327d945daf4ddb71976c4ab3830e7c7i', '新增', 3, '友情链接 新增', '9002d1ae905c4cb79c2a485333dad2f7', '/link/add', NULL, 0, 1, '2020-03-21 18:22:06', '2020-03-21 18:22:06', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('327d945daf4ddb71976c4ab3830e7cdi', '新增', 3, '字典数据 新增', '062087bce19d00312b3787b6e24c21d1', '/sysDictData/add', NULL, 0, 1, '2020-03-21 18:22:06', '2020-03-21 18:22:06', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('327d945daf4ddb71976c4ab3830e7cfi', '新增', 3, '图片管理 新增', '1cc493d36e17fad535f2bf70242162b0', '/picture/add', NULL, 0, 1, '2020-03-21 18:22:06', '2020-03-21 18:22:06', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('327d945daf4ddb71976c4ab3830e7cmi', '新增', 3, '管理员管理 新增', '2de247af3b0a459095e937d7ab9f5864', '/admin/add', NULL, 0, 1, '2020-03-21 18:22:06', '2020-03-21 18:22:06', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('327d945daf4ddb71976c4ab3830e7cqi', '新增', 3, '图片类别管理 新增', '4dea9c4f39d2480983e8c4333d35e036', '/pictureSort/add', NULL, 0, 1, '2020-03-21 18:22:06', '2020-03-21 18:22:06', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('327d945daf4ddb71976c4ab3830e7cvi', '新增', 3, '角色管理 新增', '5010ae46511e4c0b9f30d1c63ad3f0c1', '/role/add', NULL, 0, 1, '2020-03-21 18:22:06', '2020-03-21 18:22:06', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('327d945daf4ddb71976c4ab3830e7d7i', '新增', 3, '资源分类 新增', '9449ce5dd5e24b21a9d15f806cb36e87', '/resourceSort/add', NULL, 0, 1, '2020-03-21 18:22:06', '2020-03-21 18:22:06', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('327d945daf4ddb71976c4ab3830e7g7d', '新增', 3, '视频管理 新增', 'ffc6e9ca2cc243febf6d2f476b849163', '/studyVideo/add', NULL, 0, 1, '2020-03-21 18:22:06', '2020-03-21 18:22:06', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('327d945daf4ddb71976c4ab3830e7g7i', '新增', 3, '字典管理 新增', 'c28f0b052e0b930299dd53de59cc32d7', '/sysDictType/add', NULL, 0, 1, '2020-03-21 18:22:06', '2020-03-21 18:22:06', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('34c1b7b1bd3118979fe1f9f9a1147fa5', '表单构建', 2, '表单构建', 'f4697cdf85920369179b90ff45a5982d', '/test/FormBuild', 'el-icon-milk-tea', 0, 1, '2020-05-26 22:33:16', '2020-05-30 08:46:31', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('3e92f2fd6cf012d30bfae2d9cdb7092d', '专题管理', 2, '博客专题管理', '49b42250abcb47ff876bad699cf34f03', '/blog/subject', 'el-icon-collection', 0, 1, '2020-08-23 08:51:12', '2020-08-23 09:18:13', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('3eacc357e23b0b17e4f835c2f998ed34', '参数配置', 2, '配置项目中使用的参数', 'badf0010422b432ba6ec9c83a25012ed', '/system/sysParams', 'el-icon-document', 0, 1, '2020-07-21 16:45:15', '2020-07-21 16:45:15', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('4062db4658392e71c177758bb51bb4cb', '新建文件夹', 3, '网盘管理 新建文件夹', 'e1e54aea65cc22d9f8a4c74ce8d23749', '/networkDisk/create', NULL, 0, 1, '2020-06-15 10:36:51', '2020-06-15 10:47:02', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('407a263eb12eff5aac31e9f62901cea0', 'Markdown', 2, 'Markdown编辑器', 'f4697cdf85920369179b90ff45a5982d', '/test/Markdown', 'el-icon-watermelon', 0, 1, '2020-01-30 10:36:43', '2020-05-30 08:46:22', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('4337f63d13d84b9aba64b9d7a69fd066', '异常日志', 2, '异常日志', '98b82be8785e41dc939b6a5517fdfa53', '/log/exceptionLog', 'el-icon-ice-cream', 0, 1, '2018-11-28 20:01:36', '2020-05-30 08:47:53', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('49b42250abcb47ff876bad699cf34f03', '博客管理', 1, '用于博客的一些相关操作', NULL, '/blog', 'el-icon-edit', 20, 1, '2018-11-25 05:15:07', '2020-10-07 15:35:48', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('4dea9c4f39d2480983e8c4333d35e036', '图片类别管理', 2, '图片类别', '65e22f3d36d94bcea47478aba02895a1', '/picture/pictureSort', 'el-icon-printer', 2, 1, '2018-11-28 19:50:31', '2020-10-12 10:13:57', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('4fe7725159ced4a238b816a4595109d1', '门户管理', 1, '管理门户页面', NULL, '/web', 'el-icon-help', 0, 1, '2021-02-22 18:25:34', '2021-02-22 18:25:34', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('5010ae46511e4c0b9f30d1c63ad3f0c1', '角色管理', 2, '管理用户角色信息', 'd3a19221259d439b916f475e43edb13d', '/authority/role', 'el-icon-oldUser', 0, 1, '2018-11-25 19:10:34', '2020-05-30 09:06:22', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('505b4769b77617a314a3ed78e4acdff7', 'Zipkin', 2, 'Zipkin链路追踪', '147cd431cbb9007bde87444d7987b151', 'http://localhost:9411/zipkin/', 'el-icon-moon', 2, 1, '2020-02-06 20:22:18', '2020-12-05 15:31:42', 1, 0, 1);
INSERT INTO `t_sys_resource` VALUES ('510483ce569b4fc88299f346147b1314', '资源管理', 1, '资源管理', '', '/resource', 'el-icon-present', 2, 1, '2018-11-28 19:42:13', '2020-05-30 08:51:30', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('587e2697fa4d85046feece8ab9d0706c', 'Redis操作', 3, 'Redis操作 清空缓存', '78f24799307cb63bc3759413dadf4d1a', '/systemConfig/cleanRedisByKey', NULL, 0, 1, '2020-04-03 19:38:01', '2020-04-03 19:38:00', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('5bf9bd28d387ef923f2c5d11ec01fbbd', '按创建时间排序', 3, '按创建时间排序', '7cb1a6b7462832bf831a18a28eea94cd', '/subjectItem/sortByCreateTime', NULL, 0, 1, '2020-12-08 20:38:10', '2020-12-08 20:38:10', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('5ef38a4f70c6d859155528776a30cda7', '上传文件', 3, '网盘管理 上传文件', 'e1e54aea65cc22d9f8a4c74ce8d23749', '/networkDisk/add', NULL, 0, 1, '2020-06-15 10:35:45', '2020-06-15 10:46:53', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('6228ff4e9ebd42c89599b322201a0345', '反馈管理', 2, '反馈管理', 'bcf4a9bc21c14b559bcb015fb7912266', '/message/feedback', 'el-icon-microphone', 0, 1, '2018-11-28 19:48:30', '2020-05-30 08:48:39', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('6275bc5189e2e595b621d744d68278af', '导航栏管理', 2, '导航栏管理', '4fe7725159ced4a238b816a4595109d1', '/web/webNavbar', 'el-icon-c-scale-to-original', 0, 1, '2021-02-22 18:26:13', '2021-02-22 18:26:13', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('62c91c47c4646661c045727f0a8eb9d4', '查询', 3, '代办事项  查询', '26bcccf0164bf84f12ab20448388d346', '/todo/getList', NULL, 0, 1, '2020-03-23 07:52:42', '2020-03-23 07:52:42', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('65e22f3d36d94bcea47478aba02895a1', '图片管理', 1, '图片管理', '', '/picture', 'el-icon-picture-outline', 3, 1, '2018-11-28 19:48:53', '2020-05-30 09:07:12', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('6606b7e646d545e5a25c70b5e5fade9f', '标签管理', 2, '对博客标签进行管理', '49b42250abcb47ff876bad699cf34f03', '/blog/blogTag', 'el-icon-folder-opened', 4, 1, '2018-11-26 02:57:38', '2020-05-30 08:34:43', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('672b093002b618293befd8e1a164e4cc', '图片列表', 2, '图片列表', 'f4697cdf85920369179b90ff45a5982d', '/test/PictureList', 'el-icon-sugar', 0, 1, '2020-04-19 08:31:23', '2020-05-30 08:46:14', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('688beda820a236b50f18ccdd5dc9fee9', '下载', 3, '网盘管理 下载', 'e1e54aea65cc22d9f8a4c74ce8d23749', '/networkDisk/download', NULL, 0, 1, '2020-06-15 10:37:17', '2020-06-15 10:46:45', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('6c8a8c50c77429fab210bd52ed8c50ba', '引用量排序', 3, '标签管理 引用量排序', '6606b7e646d545e5a25c70b5e5fade9f', '/tag/tagSortByCite', NULL, 0, 1, '2020-03-21 21:38:19', '2020-03-21 21:38:19', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('6c8a8c50c77429fab210bd52ed8c50bb', '引用量排序', 3, '分类管理 引用量排序', '0a035547bbec404eb3ee0ef43312148d', '/blogSort/blogSortByCite', NULL, 0, 1, '2020-03-21 21:38:19', '2020-03-21 21:38:19', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('72d26cf940bf9dfb6bde0a590ff40882', '删除', 3, '分类管理，删除分类', '0a035547bbec404eb3ee0ef43312148d', '/blogSort/delete', NULL, 0, 1, '2020-03-21 18:22:51', '2020-03-21 18:22:51', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('72d26cf940bf9dfb6bde0a590ff4088g', '删除', 3, '标签管理，删除分类', '6606b7e646d545e5a25c70b5e5fade9f', '/tag/delete', NULL, 0, 1, '2020-03-21 18:22:51', '2020-03-21 18:22:51', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('72d26cf940bf9dfb6bde0a590ff4088j', '删除', 3, '评论管理，删除', '9beb7caa2c844b36a02789262dc76fbe', '/comment/delete', NULL, 0, 1, '2020-03-21 18:22:51', '2020-04-21 08:33:21', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('72d26cf940bf9dfb6bde0a590ff4088s', '删除', 3, '用户管理，删除', 'fb4237a353d0418ab42c748b7c1d64c6', '/oldUser/delete', NULL, 0, 1, '2020-03-21 18:22:51', '2020-04-21 08:28:30', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('72d26cf940bf9dfb6bde0a590ff408ej', '设为封面', 3, '图片管理，设为封面', '1cc493d36e17fad535f2bf70242162b0', '/picture/setCover', NULL, 0, 1, '2020-03-21 18:22:51', '2020-03-21 18:22:51', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('72d26cf940bf9dfb6bde0a590ff408nj', '重置密码', 3, '管理员管理，重置密码', '2de247af3b0a459095e937d7ab9f5864', '/admin/restPwd', NULL, 0, 1, '2020-03-21 18:22:51', '2020-03-21 18:22:51', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('7668dabe69473f59d1516d84cb99d583', '爬虫管理', 1, '爬虫管理', NULL, '/spider', 'el-icon-search', 0, 1, '2021-01-08 22:07:12', '2021-01-08 22:07:12', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('78ab104b123f4950af14d65798afb756', '收藏管理', 2, '管理用户收藏', '49b42250abcb47ff876bad699cf34f03', '/blog/collect', 'el-icon-folder-add', 8, 1, '2018-11-25 19:07:48', '2020-05-30 08:34:29', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('78f24799307cb63bc3759413dadf4d1a', '系统配置', 2, '设置七牛云和邮箱等相关配置', 'badf0010422b432ba6ec9c83a25012ed', '/system/systemConfig', 'el-icon-s-tools', 2, 1, '2020-01-21 09:29:04', '2020-08-30 08:01:17', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('7ada0a7053be4ad4b31f6be64315d03a', '删除', 3, '博客管理 删除', '1f01cd1d2f474743b241d74008b12333', '/blog/delete', NULL, 0, 1, '2020-03-21 15:16:54', '2020-03-21 15:16:54', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('7be9dee2f91165d8562aaa80c7e5b936', '编辑', 3, '代办事项', '26bcccf0164bf84f12ab20448388d346', '/todo/edit', NULL, 0, 1, '2020-03-23 07:53:38', '2020-03-23 07:53:38', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('7cb1a6b7462832bf831a18a28eea94cd', '专题元素管理', 2, '专题元素管理', '49b42250abcb47ff876bad699cf34f03', '/blog/subjectItem', 'el-icon-star-off', 0, 1, '2020-08-23 09:15:06', '2020-08-23 09:15:06', 0, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('80ee135af885f02d52ecb67d5a05b173', '点击量排序', 3, '分类管理 点击量排序', '0a035547bbec404eb3ee0ef43312148d', '/blogSort/blogSortByClickCount', NULL, 0, 1, '2020-03-21 21:37:42', '2020-03-21 21:37:42', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('80ee135af885f02d52ecb67d5a05b17b', '点击量排序', 3, '标签管理 点击量排序', '6606b7e646d545e5a25c70b5e5fade9f', '/tag/tagSortByClickCount', NULL, 0, 1, '2020-03-21 21:37:42', '2020-03-21 21:37:42', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('82962bbcdb674a3fdd57aec131114d56', '编辑', 3, '参数配置 编辑', '3eacc357e23b0b17e4f835c2f998ed34', '/sysParams/edit', NULL, 0, 1, '2020-07-21 16:49:41', '2020-07-21 16:49:41', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('86508603e6d78036db0bf9222946f68c', '新增', 3, '专题元素管理 新增', '7cb1a6b7462832bf831a18a28eea94cd', '/subjectItem/add', NULL, 0, 1, '2020-08-23 09:16:00', '2020-08-23 09:16:00', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('879cfcd4dfd3e5bc1bb6ea2c0f1f82c0', '接口管理', 2, '接口管理', 'd3a19221259d439b916f475e43edb13d', '/authority/button', 'el-icon-connection', 0, 1, '2020-03-21 17:39:12', '2021-01-08 22:04:14', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('8b40ea466efc42f497c49c8a610c9c20', '添加参数', 3, '参数配置 新增', '3eacc357e23b0b17e4f835c2f998ed34', '/sysParams/add', NULL, 0, 1, '2020-07-21 16:47:08', '2020-07-21 16:47:08', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('9002d1ae905c4cb79c2a485333dad2f7', '友情链接', 2, '友情链接', 'badf0010422b432ba6ec9c83a25012ed', '/system/blogLink', 'el-icon-ship', 0, 1, '2018-11-29 03:56:35', '2020-05-30 08:36:01', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('93f7fd9a6e81735c47649e6b36042b5d', 'Druid', 2, 'Druid监控中心', '147cd431cbb9007bde87444d7987b151', 'http://localhost:8607/mogu-admin/druid/login.html', 'el-icon-cloudy-and-sunny', 1, 1, '2020-01-06 13:26:51', '2020-12-05 15:31:47', 1, 0, 1);
INSERT INTO `t_sys_resource` VALUES ('9449ce5dd5e24b21a9d15f806cb36e87', '资源分类', 2, '资源分类', '510483ce569b4fc88299f346147b1314', '/resource/resourceSort', 'el-icon-folder-opened', 0, 1, '2018-11-29 03:43:27', '2020-05-30 08:51:58', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('94bee9c48a4611c96b89112b845c7f28', '移动', 3, '网盘管理  移动文件', 'e1e54aea65cc22d9f8a4c74ce8d23749', '/networkDisk/move', NULL, 0, 1, '2020-06-15 10:36:23', '2020-06-15 10:46:39', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('98b82be8785e41dc939b6a5517fdfa53', '操作日志', 1, '操作日志', '', '/log', 'el-icon-paperclip', 9, 1, '2018-11-28 20:00:19', '2020-05-30 08:47:14', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('99f5d4233d446a809b9937961c590766', '获取在线管理员', 3, '获取在线管理员列表', 'bfcb9b002c3de18f269189c573b985f8', '/admin/getOnlineAdminList', NULL, 0, 1, '2020-06-09 18:49:32', '2020-06-09 18:49:32', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('9bbe311a4ccb087560e6e2c6d40cf271', '图片爬取', 2, '用于标题图片的爬取', '7668dabe69473f59d1516d84cb99d583', '/spider/pictureSpider', 'el-icon-picture-outline', 0, 1, '2021-01-08 22:08:16', '2021-01-08 22:08:16', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('9beb7caa2c844b36a02789262dc76fbe', '评论管理', 2, '评论管理', 'bcf4a9bc21c14b559bcb015fb7912266', '/message/comment', 'el-icon-chat-line-square', 1, 1, '2018-11-28 19:47:23', '2020-05-30 08:48:28', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('9c91231f1682aabd765225a7e503bb43', '删除', 3, '反馈管理 删除', '6228ff4e9ebd42c89599b322201a0345', '/feedback/deleteBatch', NULL, 0, 1, '2020-03-22 11:17:27', '2020-03-22 11:17:27', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('9db7ffbded9717f13a1a97fca46bc17c', '导出选中', 3, '导出选中，前端实现', '1f01cd1d2f474743b241d74008b12333', '/blog/downloadBatch', NULL, 0, 1, '2020-04-27 22:14:35', '2020-04-27 22:14:35', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('9e73a9b1de18e4f1cb19eca5e8cd321d', '批量编辑', 3, '代办事项 批量编辑', '26bcccf0164bf84f12ab20448388d346', '/todo/toggleAll', NULL, 0, 1, '2020-03-23 07:54:37', '2020-03-23 07:54:37', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('9e91b4f993c946cba4bf720b2c1b2e90', '用户日志', 2, '用户Web端访问情况', '98b82be8785e41dc939b6a5517fdfa53', '/log/webVisit', 'el-icon-hot-water', 0, 1, '2019-05-17 10:16:47', '2020-05-30 08:47:41', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('a0c40ddd3fe15bb3f2edf9ec242a1511', '服务器监控', 2, '服务器监控', '147cd431cbb9007bde87444d7987b151', '/monitor/serverMonitor', 'el-icon-light-rain', 7, 1, '2020-06-03 09:26:13', '2020-12-05 15:27:45', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('a5902692a3ed4fd794895bf634f97b8e', '操作日志', 2, '操作日志', '98b82be8785e41dc939b6a5517fdfa53', '/log/log', 'el-icon-lollipop', 0, 1, '2018-11-28 20:01:02', '2020-05-30 08:47:27', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('a8bad1abec6c8fc8d4bce5a27829c878', '编辑', 3, '专题管理 编辑', '3e92f2fd6cf012d30bfae2d9cdb7092d', '/subject/edit', NULL, 0, 1, '2020-08-23 08:55:55', '2020-08-23 08:55:55', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('a9396f1a3fbdec3d4cb614f388a22bea', 'Monitor', 2, 'SpringBootAdmin监控中心', '147cd431cbb9007bde87444d7987b151', 'http://localhost:8607/mogu-monitor/wallboard', 'el-icon-partly-cloudy', 5, 1, '2020-01-05 21:30:16', '2020-12-05 15:30:27', 1, 0, 1);
INSERT INTO `t_sys_resource` VALUES ('aa225cdae6464bc0acebd732192f8362', '菜单管理', 2, '对页面菜单进行管理', 'd3a19221259d439b916f475e43edb13d', '/authority/categoryMenu', 'el-icon-tickets', 0, 1, '2018-11-25 11:12:01', '2020-05-30 08:44:32', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('aa6c5d513421aa50cac1ee9ec647d100', '导航栏管理 新增', 3, '导航栏管理 新增', '6275bc5189e2e595b621d744d68278af', '/webNavbar/add', NULL, 0, 1, '2021-02-23 13:01:16', '2021-02-23 13:01:16', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('ab1289c29b336dccda87a9fa8b711aa2', '删除', 3, '代办事项 删除', '26bcccf0164bf84f12ab20448388d346', '/todo/delete', NULL, 0, 1, '2020-03-23 07:54:01', '2020-03-23 07:54:01', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('acbb5d09da25e6c9e019cc361b35d159', 'Search接口', 2, 'Search接口', 'baace3dc03d34c54b81761dce8243814', 'http://localhost:8606/swagger-ui/index.html', 'el-icon-sunrise', 0, 1, '2020-01-19 19:56:23', '2020-12-24 09:20:24', 1, 0, 1);
INSERT INTO `t_sys_resource` VALUES ('aef85c40b54320d7c5a9d78697e12910', '置顶', 3, '分类管理 置顶', '0a035547bbec404eb3ee0ef43312148d', '/blogSort/stick', NULL, 0, 1, '2020-03-21 21:37:07', '2020-03-21 21:37:07', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('aef85c40b54320d7c5a9d78697e1291c', '置顶', 3, '标签管理 置顶', '6606b7e646d545e5a25c70b5e5fade9f', '/tag/stick', NULL, 0, 1, '2020-03-21 21:37:07', '2020-03-21 21:37:07', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('aef85c40b54320d7c5a9d78697e1295n', '置顶', 3, '菜单管理 置顶', 'aa225cdae6464bc0acebd732192f8362', '/categoryMenu/stick', NULL, 0, 1, '2020-03-21 21:37:07', '2020-03-21 21:37:07', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('aef85c40b54320d7c5a9d78697e1296n', '置顶', 3, '友情链接 置顶', '9002d1ae905c4cb79c2a485333dad2f7', '/link/stick', NULL, 0, 1, '2020-03-21 21:37:07', '2020-03-21 21:37:07', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('aef85c40b54320d7c5a9d78697e129rn', '置顶', 3, '图片类别管理 置顶', '4dea9c4f39d2480983e8c4333d35e036', '/pictureSort/stick', NULL, 0, 1, '2020-03-21 21:37:07', '2020-03-21 21:37:07', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('aef85c40b54320d7c5a9d78697e12e6n', '置顶', 3, '资源分类 置顶', '9449ce5dd5e24b21a9d15f806cb36e87', '/resourceSort/stick', NULL, 0, 1, '2020-03-21 21:37:07', '2020-03-21 21:37:07', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('af0e753d3ea0adf5cd8cf1dd55f162c2', '接口聚合', 2, '聚合所有模块的接口', 'baace3dc03d34c54b81761dce8243814', 'http://localhost:8607/doc.html', 'el-icon-ice-cream-round', 5, 1, '2020-12-05 15:42:51', '2020-12-05 15:42:51', 1, 0, 1);
INSERT INTO `t_sys_resource` VALUES ('b21105b915a5b54588c2cd458a94d2d5', '新增', 3, '专题管理 新增', '3e92f2fd6cf012d30bfae2d9cdb7092d', '/subject/add', NULL, 0, 1, '2020-08-23 08:55:29', '2020-08-23 08:55:29', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('b511cae571834971a392ae4779270034', '游客管理', 2, '游客管理', 'c519725da92b42f3acf0cc9fad58c664', '/oldUser/visitor', 'el-icon-news', 2, 1, '2018-11-28 19:54:28', '2020-05-30 08:47:06', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('b7fc36f7efc9738bddc9b09fedeccf60', '导航栏管理 查询全部', 3, '导航栏管理 查询全部', '6275bc5189e2e595b621d744d68278af', '/webNavbar/getAllList', NULL, 0, 1, '2021-02-23 13:00:24', '2021-02-23 13:00:24', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('baa21ccb45ee133b064187185edb2ac0', '删除', 3, '网盘管理 删除', 'e1e54aea65cc22d9f8a4c74ce8d23749', '/networkDisk/delete', NULL, 0, 1, '2020-06-15 10:36:07', '2020-06-15 10:46:33', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('baace3dc03d34c54b81761dce8243814', '接口管理', 1, '接口管理', '', '/restapi', 'el-icon-stopwatch', 4, 1, '2018-11-28 20:01:57', '2020-05-30 08:49:22', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('badf0010422b432ba6ec9c83a25012ed', '系统管理', 1, '系统管理', '', '/system', 'el-icon-setting', 19, 1, '2018-11-28 19:54:47', '2020-10-07 15:35:52', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('bcf4a9bc21c14b559bcb015fb7912266', '消息管理', 1, '消息管理', '', '/message', 'el-icon-message', 6, 1, '2018-11-28 19:45:29', '2020-05-30 08:48:21', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('bcfac78203944094040851cc0a9bb095', '删除', 3, '专题元素管理 删除', '7cb1a6b7462832bf831a18a28eea94cd', '/subjectItem/delete', NULL, 0, 1, '2020-08-23 09:16:50', '2020-08-23 09:16:50', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('bfc9463e59a3ca250dcfc1c86627e034', 'ElasticSearch', 2, 'ElasticSearch监控页面', '147cd431cbb9007bde87444d7987b151', '/monitor/ElasticSearch', 'el-icon-cloudy', 0, 1, '2020-01-15 22:58:00', '2020-12-09 20:41:11', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('bfcb9b002c3de18f269189c573b985f8', '在线用户', 2, '在线的用户和管理员', '147cd431cbb9007bde87444d7987b151', '/monitor/OnlineAdmin', 'el-icon-sunset', 6, 1, '2020-06-09 17:14:02', '2020-12-05 15:27:39', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('c28f0b052e0b930299dd53de59cc32d7', '字典管理', 2, '字典管理', 'badf0010422b432ba6ec9c83a25012ed', '/system/sysDictType', 'el-icon-lightning', 0, 1, '2020-02-16 18:11:10', '2020-05-30 08:35:46', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('c2a1218dd07747a57b055f184ddae217', '查询', 3, '参数配置 查询', '3eacc357e23b0b17e4f835c2f998ed34', '/sysParams/getList', NULL, 0, 1, '2020-07-21 16:48:17', '2020-07-21 16:48:17', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('c519725da92b42f3acf0cc9fad58c664', '用户管理', 1, '用户管理', '', '/oldUser', 'el-icon-house', 15, 1, '2018-11-28 19:51:47', '2020-05-30 08:46:44', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('cbd7ba11c1b38c66b569405ed9185f35', 'RabbitMQ', 2, 'RabbitMQ监控中心', '147cd431cbb9007bde87444d7987b151', 'http://localhost:15672', 'el-icon-sunny', 3, 1, '2020-01-05 21:29:39', '2020-12-05 15:31:33', 1, 0, 1);
INSERT INTO `t_sys_resource` VALUES ('ccc0dced06919403832647a871312f09', '删除选中', 3, '专题管理 删除选中', '3e92f2fd6cf012d30bfae2d9cdb7092d', '/subject/deleteBatch', NULL, 0, 1, '2020-08-23 08:57:45', '2020-08-23 08:57:45', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('d3a19221259d439b916f475e43edb13d', '权限管理', 1, '对管理员权限分配进行管理', '', '/authority', 'el-icon-oldUser', 18, 1, '2018-11-25 19:08:42', '2020-05-30 08:44:17', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('d4d92c53d3614d00865e9219b8292a90', 'Picture接口', 2, 'Picture接口', 'baace3dc03d34c54b81761dce8243814', 'http://localhost:8602/swagger-ui/index.html', 'el-icon-heavy-rain', 0, 1, '2018-11-28 20:04:33', '2020-12-24 09:20:21', 1, 0, 1);
INSERT INTO `t_sys_resource` VALUES ('da32aa8f92ae7fe7e7f445bf1028d2df', '查询', 3, '专题元素管理  查询', '7cb1a6b7462832bf831a18a28eea94cd', '/subjectItem/getList', NULL, 0, 1, '2020-08-23 09:15:37', '2020-08-23 09:15:37', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('e1e54aea65cc22d9f8a4c74ce8d23749', '网盘管理', 2, '管理网盘的资源', '510483ce569b4fc88299f346147b1314', '/resource/file', 'el-icon-unlock', 1, 1, '2020-06-13 16:36:11', '2020-10-10 14:38:13', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('e4a482c089d04a30b6ecbaadb81b70f8', 'Admin接口', 2, 'Admin接口', 'baace3dc03d34c54b81761dce8243814', 'http://localhost:8601/swagger-ui/index.html', 'el-icon-lightning', 0, 1, '2018-11-28 20:03:32', '2020-12-24 09:20:17', 1, 0, 1);
INSERT INTO `t_sys_resource` VALUES ('e5218b0b1cf016ae21eced4e47b628ac', '新增', 3, '博客管理 新增', '1f01cd1d2f474743b241d74008b12333', '/blog/add', NULL, 3, 1, '2020-03-21 10:55:34', '2020-10-07 15:38:58', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('e76ec0b7226985a414f035e2ecbd00b4', '查询', 3, '专题管理 查询', '3e92f2fd6cf012d30bfae2d9cdb7092d', '/subject/getList', NULL, 0, 1, '2020-08-23 08:55:08', '2020-08-23 08:55:08', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('e91945e49c5fdb207f996bc9668cd965', '增加', 3, '代办事项 增加', '26bcccf0164bf84f12ab20448388d346', '/todo/add', NULL, 0, 1, '2020-03-23 07:53:07', '2020-03-23 07:53:07', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('ed535411a72bb5cdd62aade25ca6e9c9', '编辑', 3, '专题元素管理 编辑', '7cb1a6b7462832bf831a18a28eea94cd', '/subjectItem/edit', NULL, 0, 1, '2020-08-23 09:16:23', '2020-08-23 09:16:23', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('f3a559635f9d46ee3356d072f5896fcb', '图片裁剪', 2, '用于图片裁剪', 'f4697cdf85920369179b90ff45a5982d', '/test/CropperPicture', 'el-icon-cherry', 0, 1, '2020-01-30 10:38:09', '2020-05-30 08:46:05', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('f4697cdf85920369179b90ff45a5982d', '测试页面', 1, '用于一些功能的测试', NULL, '/test', 'el-icon-cpu', 17, 1, '2020-01-30 10:36:00', '2020-05-30 08:45:54', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('f874529321a37e84f099488a4eaf5a0b', '编辑推荐', 3, '编辑推荐管理', '1d9a5030142e9fd7690f554c20e3bc90', '/blog/editBatch', NULL, 0, 1, '2020-04-26 13:38:15', '2020-04-26 13:38:15', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('f87d2f9b4539abbade38583420dc8b2l', '编辑', 3, '菜单管理 编辑', 'aa225cdae6464bc0acebd732192f8362', '/categoryMenu/edit', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('f87d2f9b4539abbade38583420dc8b89', '编辑', 3, '分类管理 编辑', '0a035547bbec404eb3ee0ef43312148d', '/blogSort/edit', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('f87d2f9b4539abbade38583420dc8b8e', '编辑', 3, '标签管理 编辑', '6606b7e646d545e5a25c70b5e5fade9f', '/tag/edit', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('f87d2f9b4539abbade38583420dc8b8l', '编辑', 3, '评论管理 编辑', '9beb7caa2c844b36a02789262dc76fbe', '/comment/edit', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('f87d2f9b4539abbade38583420dc8b8r', '编辑', 3, '用户管理 编辑', 'fb4237a353d0418ab42c748b7c1d64c6', '/oldUser/edit', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('f87d2f9b4539abbade38583420dc8b9l', '编辑', 3, '友情链接 编辑', '9002d1ae905c4cb79c2a485333dad2f7', '/link/edit', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('f87d2f9b4539abbade38583420dc8bbl', '编辑', 3, '字典数据 编辑', '062087bce19d00312b3787b6e24c21d1', '/sysDictData/edit', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('f87d2f9b4539abbade38583420dc8bhl', '编辑', 3, '图片管理 编辑', '1cc493d36e17fad535f2bf70242162b0', '/picture/edit', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('f87d2f9b4539abbade38583420dc8bkl', '编辑', 3, '管理员管理 编辑', '2de247af3b0a459095e937d7ab9f5864', '/admin/edit', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('f87d2f9b4539abbade38583420dc8bol', '编辑', 3, '图片类别管理 编辑', '4dea9c4f39d2480983e8c4333d35e036', '/pictureSort/edit', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('f87d2f9b4539abbade38583420dc8bpl', '编辑', 3, '网站配置 编辑', '2fb47d3b6dbd44279c8206740a263543', '/webConfig/editWebConfig', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('f87d2f9b4539abbade38583420dc8btl', '编辑', 3, '角色管理 编辑', '5010ae46511e4c0b9f30d1c63ad3f0c1', '/role/edit', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('f87d2f9b4539abbade38583420dc8bxl', '编辑', 3, '反馈管理 编辑', '6228ff4e9ebd42c89599b322201a0345', '/feedback/edit', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('f87d2f9b4539abbade38583420dc8byl', '编辑', 3, '系统配置 编辑', '78f24799307cb63bc3759413dadf4d1a', '/systemConfig/editSystemConfig', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('f87d2f9b4539abbade38583420dc8c9l', '编辑', 3, '资源分类 编辑', '9449ce5dd5e24b21a9d15f806cb36e87', '/resourceSort/edit', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('f87d2f9b4539abbade38583420dc8i9b', '编辑', 3, '视频管理 编辑', 'ffc6e9ca2cc243febf6d2f476b849163', '/studyVideo/edit', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('f87d2f9b4539abbade38583420dc8i9l', '编辑', 3, '字典管理 编辑', 'c28f0b052e0b930299dd53de59cc32d7', '/sysDictType/edit', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('f87d2f9b4539abbade38583420dc8l9l', '编辑', 3, '关于我 编辑', 'faccfe476b89483791c05019ad5b4906', '/system/editMe', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('f9276eb8e3274c8aa05577c86e4dc8c1', 'Web接口', 2, 'Web接口', 'baace3dc03d34c54b81761dce8243814', 'http://localhost:8603/swagger-ui/index.html', 'el-icon-light-rain', 0, 1, '2018-11-28 20:04:52', '2020-12-05 15:46:54', 1, 0, 1);
INSERT INTO `t_sys_resource` VALUES ('fa1e85a9c7734d27df07bc730206bd1a', '删除', 3, '编辑管理 删除', '3e92f2fd6cf012d30bfae2d9cdb7092d', '/subject/delete', NULL, 0, 1, '2020-08-23 08:56:36', '2020-08-23 08:58:33', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('faccfe476b89483791c05019ad5b4906', '关于我', 2, '关于我', 'badf0010422b432ba6ec9c83a25012ed', '/system/aboutMe', 'el-icon-sugar', 0, 1, '2018-11-29 03:55:17', '2020-05-30 08:35:21', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('fb4237a353d0418ab42c748b7c1d64c6', '用户管理', 2, '用户管理', 'c519725da92b42f3acf0cc9fad58c664', '/oldUser/oldUser', 'el-icon-headset', 3, 1, '2018-11-28 19:52:20', '2020-05-30 08:46:54', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ca0m', '查询', 3, '资源分类 查询', '9449ce5dd5e24b21a9d15f806cb36e87', '/resourceSort/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ce0m', '查询', 3, '友情链接 查询', '9002d1ae905c4cb79c2a485333dad2f7', '/link/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ce1m', '查询', 3, '菜单管理 查询', 'aa225cdae6464bc0acebd732192f8362', '/categoryMenu/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ce99', '查询', 3, '分类管理 查询', '0a035547bbec404eb3ee0ef43312148d', '/blogSort/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ce9d', '查询', 3, '标签管理 查询', '6606b7e646d545e5a25c70b5e5fade9f', '/tag/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ce9m', '查询', 3, '评论管理 查询', '9beb7caa2c844b36a02789262dc76fbe', '/comment/getList', NULL, 1, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ce9q', '查询', 3, '用户管理 查询', 'fb4237a353d0418ab42c748b7c1d64c6', '/oldUser/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ceam', '查询', 3, '字典数据 查询', '062087bce19d00312b3787b6e24c21d1', '/sysDictData/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ceim', '查询', 3, '图片管理 查询', '1cc493d36e17fad535f2bf70242162b0', '/picture/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8cejm', '查询', 3, '管理员管理 查询', '2de247af3b0a459095e937d7ab9f5864', '/admin/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8cekm', '查询', 3, '异常日志 查询', '4337f63d13d84b9aba64b9d7a69fd066', '/log/getExceptionList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8celm', '查询', 3, '操作日志 查询', 'a5902692a3ed4fd794895bf634f97b8e', '/log/getLogList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8cemm', '查询', 3, '用户日志 查询', '9e91b4f993c946cba4bf720b2c1b2e90', '/webVisit/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8cenm', '查询', 3, '图片类别管理 查询', '4dea9c4f39d2480983e8c4333d35e036', '/pictureSort/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ceom', '查询', 3, '网站配置 查询', '2fb47d3b6dbd44279c8206740a263543', '/webConfig/getWebConfig', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8cesm', '查询', 3, '角色管理 查询', '5010ae46511e4c0b9f30d1c63ad3f0c1', '/role/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8cewm', '查询', 3, '反馈管理 查询', '6228ff4e9ebd42c89599b322201a0345', '/feedback/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8cezm', '查询', 3, '系统配置 查询', '78f24799307cb63bc3759413dadf4d1a', '/systemConfig/getSystemConfig', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8cj0a', '查询', 3, '视频管理 查询', 'ffc6e9ca2cc243febf6d2f476b849163', '/studyVideo/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8cj0m', '查询', 3, '字典管理 查询', 'c28f0b052e0b930299dd53de59cc32d7', '/sysDictType/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ck0m', '查询', 3, '关于我 查询', 'faccfe476b89483791c05019ad5b4906', '/system/getMe', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('fe45ea293f75dc88b96cab96c218512a', '查询', 3, '博客管理 查询', '1f01cd1d2f474743b241d74008b12333', '/blog/getList', NULL, 2, 1, '2020-03-21 18:17:36', '2020-10-07 15:36:19', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('ffc6e9ca2cc243febf6d2f476b849163', '视频管理', 2, '视频管理', '510483ce569b4fc88299f346147b1314', '/resource/studyVideo', 'el-icon-video-camera', 0, 1, '2018-11-28 19:43:50', '2020-05-30 08:51:41', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('ffe445828071ce87a851ad58100f1340', '导航栏管理 分页查询', 3, '导航栏管理 分页查询', '6275bc5189e2e595b621d744d68278af', '/webNavbar/getList', NULL, 0, 1, '2021-02-23 13:00:52', '2021-02-23 13:00:52', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('ffe445828071ce87a851ad58144932f8', '用户信息', 3, '用户信息', NULL, '/admin/auth/info', NULL, 0, 1, '2022-12-08 10:55:25', '2022-12-08 10:55:25', 0, 0, 0);

-- ----------------------------
-- Table structure for t_web_visit
-- ----------------------------
DROP TABLE IF EXISTS `t_web_visit`;
CREATE TABLE `t_web_visit`  (
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `user_uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户uid',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问ip地址',
  `behavior` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户行为',
  `module_uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块uid（文章uid，标签uid，分类uid）',
  `other_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加数据(比如搜索内容)',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览器',
  `ip_source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip来源',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Web访问记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_web_visit
-- ----------------------------
INSERT INTO `t_web_visit` VALUES ('000207674f0f6510f2f4dc24fb6bbccd', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-01-24 09:52:22', '2021-01-24 09:52:22', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('0013af7f24cf20066bf209253f0cfde1', NULL, '0:0:0:0:0:0:0:1', 'blog_search', NULL, '测试', 1, '2020-12-09 20:47:08', '2020-12-09 20:47:08', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('0061914cd344853ab609c2ce7a885f7a', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 10:24:05', '2021-01-15 10:24:05', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('0077b0b6bc64654b2c181fb8ee106997', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 11:11:02', '2021-04-11 11:11:02', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('00982c3f3ade4f9c4f4670c5daf08234', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:10:34', '2021-02-23 18:10:34', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('009f1c50f8d1f1d400a89e56f98bb2b4', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-27 13:16:28', '2021-02-27 13:16:28', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('00c7bb56b788838724c836f02c52873e', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:52:27', '2021-03-25 09:52:27', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('00e3125175198922cc038c5e579fcf35', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:26:01', '2021-03-25 09:26:01', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('00eae689ba0456ae2b7293a36a2aa90d', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-23 18:23:38', '2021-02-23 18:23:38', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('010e17a9511085e88523f6b6a3bc3f1c', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:05:49', '2021-04-12 09:05:49', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('016dcb79da386a35a654df1b9075a1f9', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-03-02 10:52:53', '2021-03-02 10:52:53', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('0186d7584c313dcff672cb55eeb79b1b', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 17:29:18', '2020-12-04 17:29:18', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('018b4ed3f3fa44a74f309765bbdf8bef', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:26:24', '2021-03-24 21:26:24', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('01939c4e8b67572be7b934aa2eb13914', 'b486735e7b914e366840d01f049306e4', '192.168.104.1', 'blog_content', NULL, NULL, 1, '2020-11-14 08:37:29', '2020-11-14 08:37:29', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('01945072080c43e65149174431bc3979', NULL, '192.168.104.1', 'blog_content', NULL, NULL, 1, '2020-11-20 21:18:50', '2020-11-20 21:18:50', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('01963d9e843fd17b7414875b176995f5', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2020年12月', 1, '2021-02-23 15:29:50', '2021-02-23 15:29:50', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('019c8959b48497a6813fb7a73884adb2', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '31', 1, '2020-12-12 10:42:36', '2020-12-12 10:42:36', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('01a4c72a34d36dbe131d247d48c37208', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:22:08', '2021-02-23 18:22:08', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('01c5eb809c1849b2ad4b06ba60d3125b', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 20:58:51', '2021-04-09 20:58:51', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('01d369c757da74ef788802cc9fb22437', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-13 09:16:44', '2020-11-13 09:16:44', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('020341725187a77f4ffdf0201d78937c', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 13:16:42', '2021-02-27 13:16:42', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('02624b2f43212e48fff3a144b4dca657', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:51:04', '2021-03-24 21:51:04', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('0267ee5a047492518ff8325aa3e97250', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '我也很好', 1, '2020-12-26 15:28:33', '2020-12-26 15:28:33', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('0292458a2babd09d8bbf6ac9be07568a', NULL, '192.168.104.1', 'blog_content', 'c58083675437f407d73d3322ca01b995', NULL, 1, '2020-11-13 09:20:59', '2020-11-13 09:20:59', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('02f8ba81a46fcaca1aa616d1f8da6dd4', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-26 15:02:07', '2020-12-26 15:02:07', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('031c1399c195ef5ee2db870464c4a568', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:55:43', '2021-02-23 16:55:43', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('033cbe93e38e03853bbb45039a46d514', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-22 16:27:43', '2021-02-22 16:27:43', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('03489ea009d0fd1c578f385a2130bca8', NULL, '192.168.104.1', 'blog_content', '062ca3475e8193a4a81853a4bf41a8fa', NULL, 1, '2020-11-13 09:26:25', '2020-11-13 09:26:25', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('034919f870b4324cd8c480c417825128', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '58', 1, '2021-04-12 16:52:17', '2021-04-12 16:52:17', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('0357146e10f84262a9ca0d4e1494cf03', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-22 16:24:40', '2021-02-22 16:24:40', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('03894bfae6b881d92d92011446a48249', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-22 16:24:28', '2021-02-22 16:24:28', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('0389b23606d8470db7de9ca26a7dbe61', '1', '', 'admin_auth', NULL, NULL, 1, '2022-12-13 18:09:54', '2022-12-13 18:09:54', 'UnKnown, More-Info: PostmanRuntime/7.29.0', 'PostmanRuntime/7.29.0', NULL);
INSERT INTO `t_web_visit` VALUES ('039e4fcf4729995d50006546f4e96ece', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-02 10:52:52', '2021-03-02 10:52:52', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('03a898483f7f82be7f6858d4bef3f45f', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 13:12:58', '2021-02-27 13:12:58', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('03ab9c5d52c70562736faf01d476ce12', NULL, '192.168.104.1', 'blog_content', NULL, NULL, 1, '2020-11-20 21:44:21', '2020-11-20 21:44:21', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('03abf5614036c5a29efe18c2fa290170', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 18:05:51', '2021-02-23 18:05:51', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('03caf0bf9f49f24fb241473328d77c2e', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-04 19:15:16', '2021-03-04 19:15:16', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('03d63e9bcedb7488bb8c85a796bb20da', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:39:46', '2021-03-25 09:39:46', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('03d75d202a46a0347d1bc3a9ec7a537e', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 10:54:37', '2021-04-11 10:54:37', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('03e354f25ec18175265b3d418ccf2217', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 15:21:23', '2021-02-23 15:21:23', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('03e491f70e470c6aa7218554161d91f6', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:09:15', '2021-04-12 09:09:15', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('03ea0a37f2842ff21fa54382f17314b3', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2020-12-26 15:37:29', '2020-12-26 15:37:29', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('04130952eacc502fd12bb538e799cb20', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 22:40:10', '2020-12-04 22:40:10', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('04157caca5b5f3404dbf1796a07991a1', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2020年10月', 1, '2021-02-23 15:29:50', '2021-02-23 15:29:50', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('04158a210d97ef6934791de04c6174de', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-25 10:01:25', '2021-03-25 10:01:25', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('04263d43e640a34bc6d4dd55c58de16f', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '测试12', 1, '2021-01-07 10:28:06', '2021-01-07 10:28:06', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('0426f0c9b6967cc49d3d700cf18c07b9', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2020-12-12 10:39:22', '2020-12-12 10:39:22', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('04660a24a3601af0d31174b4e3fd864b', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '31', 1, '2020-12-12 10:38:18', '2020-12-12 10:38:18', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('047196896510d7b4539a7eb176351d77', NULL, '192.168.104.1', 'visit_sort', NULL, '2020年10月', 1, '2020-11-20 22:10:07', '2020-11-20 22:10:07', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('04abe282f04427d3474215ddae38aaac', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '30', 1, '2020-12-12 10:28:37', '2020-12-12 10:28:37', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('04bd1890b3acf6bd26d52aee5c763629', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-11 17:29:51', '2020-11-11 17:29:51', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('04d6ca768a01b46af62fd6b4e15f8ff0', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '30', 1, '2020-12-12 10:38:20', '2020-12-12 10:38:20', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('04ed1089b79e407cad8f582bc3d6e70a', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-04 19:35:09', '2021-03-04 19:35:09', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('0528a4d02c92095c956ce3ad89fd4d73', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 16:58:19', '2021-02-23 16:58:19', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('053531fe0284ddcae59cc5392cbe0329', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-13 09:35:07', '2020-11-13 09:35:07', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('0543be7b80263cf201b4cc4f2a91f11e', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 10:33:35', '2021-04-10 10:33:35', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('05690db84c20342d786c068fb45a0636', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 10:00:28', '2021-03-25 10:00:28', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('0586537a6bad81f9ab4f5d5104759e00', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-28 21:06:27', '2021-02-28 21:06:27', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('059876b67c10bd45be3568e78d2d0cb3', NULL, '192.168.104.1', 'blog_content', '062ca3475e8193a4a81853a4bf41a8fa', NULL, 1, '2020-11-13 09:20:32', '2020-11-13 09:20:32', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('05a82afa60d6cc7e93d97f2c174f76e1', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '31', 1, '2020-12-12 10:35:25', '2020-12-12 10:35:25', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('05bac872f009d314abf577a8f5422509', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 15:29:53', '2021-02-23 15:29:53', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('05c8f4b930364d5a51a15d4a9ed1ec70', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-11 19:05:45', '2021-03-11 19:05:45', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('05d64ef4aca4579b90828d9cbc911fe8', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 15:29:32', '2021-02-23 15:29:32', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('05e4ff9850bc895badb4678ebc0dbbd9', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '我是卖报的小行家', 1, '2021-03-25 10:01:09', '2021-03-25 10:01:09', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('062b448f68bc5b7ddc33fcc1664a45e7', NULL, '192.168.104.1', 'blog_content', '062ca3475e8193a4a81853a4bf41a8fa', NULL, 1, '2020-11-13 09:40:20', '2020-11-13 09:40:20', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('063e1c0fe3c6dc594a53110c9ac84f11', NULL, '192.168.104.1', 'blog_content', NULL, '8', 1, '2020-12-04 16:24:18', '2020-12-04 16:24:18', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('067075abb586ff9fe9053c186005e946', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 20:31:40', '2021-04-09 20:31:40', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('0684c24e6cba3886672a544e60ee3936', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 14:59:42', '2021-02-23 14:59:42', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('068c279e7a86181bcc8c36fe53e6b16a', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-24 10:00:25', '2021-01-24 10:00:25', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('06db981a3003ed97fbfd800aceb52591', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-19 12:06:24', '2021-02-19 12:06:24', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('071f4a8d79a58be416b494eba1ad6e8f', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-11 18:44:25', '2021-03-11 18:44:25', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('073a48e9b3b04d9e6192e950046a1319', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 18:23:02', '2021-02-23 18:23:02', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('073d5e917964859b0dbb47bb0e6f4e54', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-19 12:12:09', '2021-02-19 12:12:09', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('0764569a0fb46d122de46cac89a3d602', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:17:38', '2021-04-09 21:17:38', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('076e8d75a685d4b87cb883553aaa8044', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 15:21:22', '2021-02-23 15:21:22', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('07c11458e9821e5231105b0e7abc45c0', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:51:57', '2021-03-25 09:51:57', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('0815fc63f4d05c58eb0138c04cdbfd5e', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:36:07', '2021-04-09 21:36:07', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('084f35bd44b75b2f0311d99cfba2109c', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 20:43:29', '2021-04-09 20:43:29', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('085f0d60f0595469e4335eda8d0ac704', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-19 12:11:46', '2021-02-19 12:11:46', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('08773b44df92b91ce885eaba8165f164', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '8', 1, '2020-12-09 21:07:28', '2020-12-09 21:07:28', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('087e586703dc290ee8b22d5c8811a101', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:30:37', '2021-03-24 21:30:37', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('0884b445a1f6a95f54349448ffd26b94', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 17:21:49', '2020-12-04 17:21:49', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('08cc2c51cb9b5a334d767e4acc7e2bba', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 14:59:59', '2021-02-23 14:59:59', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('09270f10e5d78355eb3f61f9c2a4d8e6', '6795d72d4b27b24e02acb38723ccc5d6', '0:0:0:0:0:0:0:1', 'visit_classify', '2c93dfab0e754006866f8ed486923a41', NULL, 1, '2021-06-13 07:48:17', '2021-06-13 07:48:17', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('09826848311b319b4c93191791e9abc3', '6795d72d4b27b24e02acb38723ccc5d6', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-06-13 07:48:11', '2021-06-13 07:48:11', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('0984cc9b65cb522c94b7f03ed6fad879', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 10:41:27', '2021-04-11 10:41:27', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('09a3cd9378e4febdf04e4e8e7e71833f', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-03-04 19:27:25', '2021-03-04 19:27:25', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('0a187927f9e69ea7f2d9d161443ecc97', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:30:37', '2021-04-10 09:30:37', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('0a335ac3e9581e13e9473cd6f62ae964', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-03-02 10:52:13', '2021-03-02 10:52:13', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('0a3484db26cd98f15a3523109d851229', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-02 10:52:12', '2021-03-02 10:52:12', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('0a354d8997c6b652c72238536f5914f4', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 21:28:31', '2021-01-15 21:28:31', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('0a3eb7b97333b77a2262c8c7194b86ce', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '12', 1, '2021-01-24 09:29:57', '2021-01-24 09:29:57', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('0a5b69a6c1f3a6b6cfa614a0c2236290', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-03-16 16:01:26', '2021-03-16 16:01:26', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('0a5cd0d0830bc18bfc0d0f8e078f3d78', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '36', 1, '2021-01-01 21:44:25', '2021-01-01 21:44:25', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('0a603c1bfa32e088229eefed965558e0', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-03-16 16:01:30', '2021-03-16 16:01:30', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('0a797c8431fdbe04b5af55b3594e07c2', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-02 15:45:32', '2021-01-02 15:45:32', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('0a9778e621db66733029d0d9a9e63b69', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 21:39:58', '2020-11-17 21:39:58', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('0a999c3032a99d5ef84ef51165a21974', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 19:11:42', '2021-02-23 19:11:42', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('0aa8daf1b6b0001508aa552d5d72d032', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 10:38:56', '2021-04-12 10:38:56', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('0aba1670a46039e0ec15c3fd03187553', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 10:22:06', '2021-04-11 10:22:06', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('0abcee11cb93c03a4efa4e54a7d4ee48', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-05 09:41:35', '2020-12-05 09:41:35', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('0ad1b3435761107e3e39c048cd2966c3', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-22 16:24:13', '2021-02-22 16:24:13', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('0b63494bd665f30c64073acf3dd7a218', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:30:22', '2021-04-10 09:30:22', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('0b6c3e2de5017fef627b398fb631bbb8', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 10:47:02', '2021-04-12 10:47:02', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('0b74215abd71dd8c278115d84557c958', NULL, '192.168.104.1', 'blog_content', NULL, '8', 1, '2020-12-04 16:52:14', '2020-12-04 16:52:14', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('0b7c7ae29354d1ff8f1deb0708feeaa5', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:06:47', '2021-04-09 21:06:47', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('0bc0cc9627ba1f13b2c4e791bc89edfa', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 15:58:45', '2021-02-23 15:58:45', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('0be466c41ed0287480a373855c099319', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年01月', 1, '2021-02-23 15:29:49', '2021-02-23 15:29:49', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('0c052cf3b3bcf2a7f7c1686db671ae47', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-27 13:14:38', '2021-02-27 13:14:38', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('0c23c485061edce6ed7785fde335781c', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-13 10:21:33', '2021-02-13 10:21:33', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('0c39017544541f350634ef30eca665e9', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-01-24 10:00:36', '2021-01-24 10:00:36', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('0c67e7f79771e5a7090ef1e044a1bd9e', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:59:29', '2021-02-23 16:59:29', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('0c6fea93de4d9011655d4cfedf65fb45', 'b486735e7b914e366840d01f049306e4', '192.168.104.1', 'blog_content', NULL, '8', 1, '2020-11-22 08:47:40', '2020-11-22 08:47:40', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('0c7bacef9038e282ab0da979022b6a3a', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-24 09:40:46', '2021-01-24 09:40:46', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('0cb00071ca122b1b461fe98c8f8d9eac', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-04 20:38:00', '2021-03-04 20:38:00', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('0cd1e4ce29aca75a70dd4fbce737793c', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-03-04 19:29:50', '2021-03-04 19:29:50', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('0cdab6f61cc7c77aa7293e1dd5d42a95', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-01-02 16:07:29', '2021-01-02 16:07:29', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('0ceb5715b9d3061050fa6a3982b0b903', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '49', 1, '2021-04-09 20:51:38', '2021-04-09 20:51:38', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('0cfa62c0deea8466d5853cd90aede72e', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 10:33:08', '2021-04-10 10:33:08', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('0cfdb2fa20abaddc62130ef951253353', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:54:19', '2021-03-25 09:54:19', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('0d21d09991fdca919fae18297cce8743', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-22 21:17:12', '2021-03-22 21:17:12', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('0d3124f2c70187cacdb792096161bde2', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 11:29:52', '2021-04-12 11:29:52', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('0d4910071f9028f2648efe963918bc9e', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2020年12月', 1, '2020-12-13 19:35:17', '2020-12-13 19:35:17', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('0d5d0fdbf82976c3d867d2283d426d6f', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 20:15:19', '2020-12-04 20:15:19', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('0d5f11158b7234b69e524d0aa7e84c53', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '58', 1, '2021-04-12 16:48:10', '2021-04-12 16:48:10', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('0d7909a2ac62a9b7a0cc5d74c9da1c10', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:30:26', '2021-04-10 09:30:26', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('0d93e3fc6cde99e27e305adf4729f6c9', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:10:06', '2021-02-23 18:10:06', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('0dab165058ebb7650a15643f2835e9a5', NULL, '192.168.104.1', 'blog_search', NULL, 'https', 1, '2020-11-13 09:05:19', '2020-11-13 09:05:19', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('0dc14d39e6e3e7a0e8a0e20c809c1533', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-09 19:49:38', '2020-12-09 19:49:38', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('0e09ef090716b015e6aad73335ae3231', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 19:11:33', '2021-02-23 19:11:33', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('0e143c7f6b36405ecc8f68ecff0f22c4', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-22 21:26:32', '2021-03-22 21:26:32', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('0e6ea00608a5a453a628f282fafc221e', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-01-24 10:00:46', '2021-01-24 10:00:46', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('0ea3fc0ae7ad79b31c5337a3532bd7f3', '6795d72d4b27b24e02acb38723ccc5d6', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-06-13 07:49:13', '2021-06-13 07:49:13', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('0eb299d8fd29dcfd3b267b9cf583e301', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2020-12-26 15:45:50', '2020-12-26 15:45:50', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('0ebdf30bc20b9b4050ea824e0983ee28', NULL, '192.168.104.1', 'visit_page', NULL, '关于我', 1, '2020-12-04 15:57:23', '2020-12-04 15:57:23', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('0eca13c37684ac4e65f96fedcdb3afd6', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 13:13:00', '2021-02-27 13:13:00', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('0f57d715c4a680bf3dca2bf437ab5c85', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-03-22 21:19:34', '2021-03-22 21:19:34', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('0f6b7fe8efb7f49f30fbe900f5e3e09a', '939e48c0b3d27ade7f654a113c729976', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 22:48:58', '2020-11-17 22:48:58', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('0f88c2bf68da441a518598bcdcd8bb3f', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-12 10:39:17', '2020-12-12 10:39:17', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('0f9b24b886df88e052df5cc008faf054', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 13:01:43', '2021-02-27 13:01:43', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('0fa0acfcd02716415c0cb3f109723925', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2020-12-09 21:06:13', '2020-12-09 21:06:13', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('0fd3a03705138d1773b49266ef805304', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:29:12', '2021-03-24 21:29:12', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('1002e12cb6ba082442b1b1f6dc7330f7', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 12:36:39', '2021-02-27 12:36:39', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('1012f687a369594a31d10097a5bd3640', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-01-28 23:18:25', '2021-01-28 23:18:25', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('106029709b2e8da3513c620a34000da9', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-04-10 09:30:32', '2021-04-10 09:30:32', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('106a70b4e49c60d0122c4537ea2eed02', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 15:19:37', '2021-02-23 15:19:37', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('107e62a29e0e4a5b5a40912776f77ab9', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-22 21:09:35', '2021-03-22 21:09:35', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('10cfdff5d7f4f8e26f8f304e6424c555', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 17:03:17', '2021-04-11 17:03:17', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('117a421adc5521a8a35c4390aae196a5', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 16:54:12', '2021-04-11 16:54:12', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('1199ece501105b4270c1001985c73d33', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:50:43', '2021-03-25 09:50:43', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('11b3ec3f34850d63c06c45f0bbe72ee9', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '8', 1, '2021-01-24 09:29:50', '2021-01-24 09:29:50', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('11d92f312ea8cd254211d8938b83d635', NULL, '0:0:0:0:0:0:0:1', 'friendship_link', '5217d7212f9d487eab13deadca961402', '点击友情链接', 1, '2021-02-23 18:22:49', '2021-02-23 18:22:49', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('11fafd218458681a040ddaa7768e4be8', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-14 22:15:23', '2021-01-14 22:15:23', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('12006c371113faaebfcc7e16d2831857', '5eb5257f707cad9c6f06a1e951ba2def', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-09 09:23:43', '2020-11-09 09:23:43', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('120b4d725fd589704c933b731794d86a', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 11:23:16', '2021-04-11 11:23:16', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('120d69ba0788fdd3beba20f703ce4b62', NULL, '0:0:0:0:0:0:0:1', 'friendship_link', '6bfeefb34f8114fbd2d029c02a805aea', '点击友情链接', 1, '2021-01-24 09:25:03', '2021-01-24 09:25:03', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('1236d1d555e5c65b7ba3d6f9b61f5764', NULL, '192.168.104.1', 'blog_content', '062ca3475e8193a4a81853a4bf41a8fa', NULL, 1, '2020-11-13 09:32:28', '2020-11-13 09:32:28', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('1242fef9c43eaf72cbbce372efa08863', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2020-12-26 15:37:23', '2020-12-26 15:37:23', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('1250ccb6c9df1eeb6485698082810e09', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-22 21:26:59', '2021-03-22 21:26:59', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('125680feda0c7bda437ec1f41c0181b2', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-01-24 09:52:29', '2021-01-24 09:52:29', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('125d5184796c2f79f20b3f33f4d45ca9', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_search', NULL, '123', 1, '2021-03-25 09:26:39', '2021-03-25 09:26:39', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('1269d1283c76a5f076834e62343eff7e', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 21:44:38', '2021-01-15 21:44:38', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('1278203bf15b91dbcc884b34e49af1ca', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 22:17:49', '2020-12-04 22:17:49', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('128213caa65fe015b33ad477c2e67ce7', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:18:51', '2021-02-23 18:18:51', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('12997af148572fbf1e20b348227bb63d', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '30', 1, '2020-12-12 10:43:51', '2020-12-12 10:43:51', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('131d27e960cc0e127238e5c9309b3eb1', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '2f5779e877da48958c985d69b311d0d6', NULL, 1, '2020-12-26 11:24:34', '2020-12-26 11:24:34', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('137e2627251e92741c9f1620c887415a', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-04-09 18:56:27', '2021-04-09 18:56:27', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('138bc761ed238132dd6a293538af3b2f', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:48:00', '2021-02-23 16:48:00', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('138e28de557b1d530588d0bcf24f3b81', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:27:39', '2021-04-10 09:27:39', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('14307bbf113f817fe02cd752eb169bff', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:33:10', '2021-03-24 21:33:10', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('1441520608758d2d09d7df84f67978a2', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 17:29:09', '2021-02-23 17:29:09', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('145293d6e72817432470feaa8d09bcc8', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:40:30', '2021-04-09 21:40:30', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('1455ab81c56c10f7ca424155bf97dd05', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:22:27', '2021-04-10 09:22:27', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('148986f8fd1e8b5476051517273db3f3', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 08:53:36', '2021-04-10 08:53:36', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('14bb87e86155092fb9a3d990c76b7bea', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 16:40:31', '2021-04-11 16:40:31', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('14c506357983cbacbf0d9c527a12d174', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 18:56:28', '2021-04-09 18:56:28', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('150a7c949371df024879c0fcb51010ca', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 19:05:05', '2021-02-23 19:05:05', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('150ad5b58dfcf8ad270a092c9f6bff9d', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 10:04:05', '2021-04-12 10:04:05', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('151f27cf2e16c83deec807e032852c7b', NULL, '0:0:0:0:0:0:0:1', 'blog_tag', '7e0e93ea6cdb44ae92e58f48e6496ed7', NULL, 1, '2021-02-27 13:13:38', '2021-02-27 13:13:38', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('152f700f969dc623761a37dee637e2d1', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 15:37:57', '2021-02-23 15:37:57', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('15a31db58ab4138f403e2d7c35b38cda', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 17:22:08', '2021-04-09 17:22:08', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('15e24948bec8a2cd8b31dd1e18772726', '6795d72d4b27b24e02acb38723ccc5d6', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年04月', 1, '2021-06-13 07:48:43', '2021-06-13 07:48:43', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('15fb8bfd9ab5648708a9f7c211d7de3e', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 20:46:10', '2021-04-09 20:46:10', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('160c7b3f81d17e959d6e603ed081db65', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 11:20:15', '2021-04-11 11:20:15', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('1616279256ab0d632f996f3544b67dce', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-02 11:20:28', '2021-03-02 11:20:28', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('164fdac89e87d28faf1087746e854dcc', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年01月', 1, '2021-01-24 09:51:54', '2021-01-24 09:51:54', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('169b1320e250a50a9b819d0d79ab4c4e', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2020-12-12 10:28:13', '2020-12-12 10:28:13', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('16b0d7bf73da4bdedf858125f759e1f0', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-31 19:56:58', '2020-12-31 19:56:58', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('16c6e6e746b6040904ae2ca5f876cf15', '6795d72d4b27b24e02acb38723ccc5d6', '0:0:0:0:0:0:0:1', 'visit_classify', '093d8bdd01c84890a928e923d5c235fe', NULL, 1, '2021-06-13 07:48:16', '2021-06-13 07:48:16', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('171cf044d6bfd3c6c9ed7af9e6a17fa6', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:16:53', '2021-04-12 09:16:53', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('1727708d0517c9e7c89c2d4e230df7fe', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-27 13:14:37', '2021-02-27 13:14:37', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('173f94016b55d1ead647fa72c7a9cc58', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-27 13:15:48', '2021-02-27 13:15:48', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('17878795777b1b83732684a2e6996be3', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-22 21:18:00', '2021-03-22 21:18:00', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('17a631262a70118fd479d51d296be1fb', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 10:21:21', '2021-04-11 10:21:21', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('17e6355fbe4880e8baa5301e2f007b4b', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 14:51:01', '2021-04-11 14:51:01', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('17f2917445255cb7d79d443363ce24b8', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:47:39', '2021-04-10 09:47:39', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('17f8b664cf7912424d26cdbcd5189f22', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:47:41', '2021-03-25 09:47:41', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('17fff4962924380ceda4b009d73fb28d', NULL, '192.168.104.1', 'blog_content', 'c58083675437f407d73d3322ca01b995', NULL, 1, '2020-11-13 09:22:12', '2020-11-13 09:22:12', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('1820ca7001215e643a8deff2b25113d6', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-08 22:21:08', '2020-11-08 22:21:08', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('18535cac07f9432f28e58304db907bad', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:40:44', '2021-04-09 21:40:44', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('18562424b499fbaaf0fe9c657d6fa53a', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-01-15 20:35:36', '2021-01-15 20:35:36', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('191d30e557796980361500f617fedf3b', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 10:01:21', '2021-03-25 10:01:21', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('192bddbd05885abb640a537bd0b95899', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:51:33', '2021-03-24 21:51:33', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('1934e1bf8123b9f43ec0475bd43545c0', 'b486735e7b914e366840d01f049306e4', '192.168.104.1', 'blog_praise', '635fc430e3378403a7d3f1e2a4e726a9', NULL, 1, '2020-11-22 08:47:42', '2020-11-22 08:47:42', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('194166bf31cdcefcce8a86e925f1f85c', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 14:36:21', '2021-02-23 14:36:21', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('194d483566b4d71cb2a9bda6f36722ec', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-21 09:00:37', '2021-02-21 09:00:37', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('195af84a75fc789e2e36d384d64741bf', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-02 11:22:27', '2021-03-02 11:22:27', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('196101fa81f4400ef5f783406e38613e', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:20:20', '2021-03-25 09:20:20', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('1980babc458536561661859afa60ee9a', NULL, '192.168.104.1', 'blog_content', 'undefined', NULL, 1, '2020-11-13 09:16:53', '2020-11-13 09:16:53', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('19b241431ea592aaf80b99fc88404ded', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-02 15:57:22', '2021-01-02 15:57:22', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('19b34133136ad1dd0e4a087871a67cc5', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 15:40:18', '2021-02-23 15:40:18', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('19b3880cbf60c5b9cd0882c1d59c47fa', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'ca28ffc94ea94fbda5571e0b242021e2', NULL, 1, '2020-12-26 11:24:49', '2020-12-26 11:24:49', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('19cb12edd5af87a07d852b616dbeced9', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '31', 1, '2020-12-12 10:35:06', '2020-12-12 10:35:06', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('19d6d23fbad7b22c207018a8cf20f891', NULL, '192.168.104.1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2020-11-20 22:06:01', '2020-11-20 22:06:01', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('19da53bced0dae09e7ba8331efbca937', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:19:44', '2021-04-09 21:19:44', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('19eeaa27ec9649d647b564a09a71398e', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-03-22 21:17:19', '2021-03-22 21:17:19', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('1a007189e495db99dfcc2c5aaf2e26ad', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 19:12:58', '2021-02-23 19:12:58', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('1a0651232f2a2a8be602d27846ef915b', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 20:38:39', '2021-01-15 20:38:39', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('1a17f2fa9804b1039ad7135660a808e4', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 18:19:24', '2021-02-23 18:19:24', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('1a58cb50f7f3fff1e3e5ae149da105a6', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 16:20:19', '2021-04-12 16:20:19', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('1a8323cf9cef9b0238b2ae40b443e42e', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:03:53', '2021-02-23 16:03:53', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('1aa4682329305bb9a88e688da86a88c9', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-03-02 10:52:30', '2021-03-02 10:52:30', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('1aae8b262e5fec7d7fece7bc65bf4890', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-03-22 21:21:57', '2021-03-22 21:21:57', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('1ab292d4e7668c6dc609e13757362c87', 'f6ac7f1cee33a0c4652a7396a1767368', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 18:38:00', '2021-04-09 18:38:00', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('1ab5d97ed53bfbb9a62d5c78b75daae6', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-11 19:24:35', '2021-03-11 19:24:35', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('1af0888c83ffd3bbd2be0d14d695c8e7', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2020-12-26 10:59:32', '2020-12-26 10:59:32', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('1b317690adc562435ed73769ebcde11c', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 11:17:32', '2021-04-11 11:17:32', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('1b4317fa70d2af3494ea906173588e10', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:50:11', '2021-03-24 21:50:11', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('1b5b8c856af756a0aa1799ad0ade1d1b', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-21 15:14:52', '2020-12-21 15:14:52', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('1b806d02647a343830144d9e831a5311', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-16 16:01:30', '2021-03-16 16:01:30', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('1b8ce41bb0cb2d7333257879bfffcd67', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 10:57:30', '2021-04-11 10:57:30', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('1b9ce822d20861ce272760ab3737cefe', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-15 20:35:29', '2021-01-15 20:35:29', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('1bcf61e17174221d8adb1c761d1f200d', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '31', 1, '2020-12-12 10:45:31', '2020-12-12 10:45:31', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('1c2c2c252cd9f1b6020454605f89142a', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-03-11 19:05:55', '2021-03-11 19:05:55', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('1c42a38095a59a63d80630a379d0a46e', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:14:20', '2021-04-12 09:14:20', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('1c631c362a4cfd523a83b09d2b5d5d22', NULL, '0:0:0:0:0:0:0:1', 'blog_search', NULL, '测试', 1, '2020-12-09 21:07:03', '2020-12-09 21:07:03', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('1c746993516b80fb119ff4a1c128acc1', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', 'e81bc2dca42c4031be7d66fef4a71e16', NULL, 1, '2020-12-26 11:24:32', '2020-12-26 11:24:32', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('1c782dcecd33fab07e0f9a094f9c1b86', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-05-17 10:54:10', '2021-05-17 10:54:10', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('1c7cbbff42c2b41cbb4938003934851c', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-18 09:51:28', '2021-01-18 09:51:28', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('1c7d289634206a9216a7bfbe796305dd', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:52:57', '2021-03-24 21:52:57', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('1c844dd65ba8470906c11570d6903e9b', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-12 14:47:03', '2020-11-12 14:47:03', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('1cb08e99551a0ec93ee91f36cbe96d91', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2020-12-26 11:24:58', '2020-12-26 11:24:58', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('1ce86fc7999f2622fc49936758bc4673', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 10:21:59', '2021-04-10 10:21:59', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('1d0faec726ebaf22a57ff9e62a03473f', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 22:33:00', '2020-11-17 22:33:00', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('1d11b669e522fed7e97cd9ef8dec4fff', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-22 20:44:08', '2021-03-22 20:44:08', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('1d133e36c0b91256dcdc523ddaa06c2a', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '8', 1, '2020-12-09 20:44:56', '2020-12-09 20:44:56', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('1d345ccd70ebefa2ce3abf69675d2653', NULL, '192.168.104.1', 'blog_content', '062ca3475e8193a4a81853a4bf41a8fa', NULL, 1, '2020-11-13 09:40:24', '2020-11-13 09:40:24', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('1da390d2c1183bffa319e5229bbc4cc1', 'b486735e7b914e366840d01f049306e4', '192.168.104.1', 'blog_praise', '635fc430e3378403a7d3f1e2a4e726a9', NULL, 1, '2020-11-22 08:47:44', '2020-11-22 08:47:44', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('1daccecd761a2492ef41e849d1e0432a', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-24 09:25:59', '2021-01-24 09:25:59', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('1dad1d9ff9db36e17e1dbf6c00ec68bf', NULL, '192.168.104.1', 'blog_content', NULL, NULL, 1, '2020-11-13 10:14:28', '2020-11-13 10:14:28', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('1dcf667796add2879b3b45f98b6dfd72', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 17:37:29', '2021-02-23 17:37:29', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('1def109600167830ee34b968f28f2dce', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2020年08月', 1, '2021-02-23 15:29:51', '2021-02-23 15:29:51', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('1e01280480bb650a009146f8205afe83', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 18:23:58', '2021-02-23 18:23:58', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('1e0e544fbc03d4283bcca4be33c21d40', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 16:51:04', '2021-04-11 16:51:04', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('1e50836b8979ee57c72fedcd87273e50', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:17:17', '2021-04-10 09:17:17', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('1e6a377fa461820978e98cdc13ef9d51', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:20:27', '2021-03-25 09:20:27', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('1e75a3b546f9bf146195dd7ef55f0c11', NULL, '192.168.104.1', 'blog_content', NULL, NULL, 1, '2020-11-13 10:12:47', '2020-11-13 10:12:47', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('1e77b8ea5cad8c60b3d01b8ab4af0512', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 14:41:50', '2021-02-23 14:41:50', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('1e7a15d0df0c8ec8e436fc0d28d122ff', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 20:39:03', '2021-04-09 20:39:03', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('1e9fcc1c54ca710aa93d1f3c183ddde9', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:32:50', '2021-03-24 21:32:50', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('1ed59807707bba8365ea394d3ac33f5b', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-14 23:09:45', '2021-01-14 23:09:45', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('1ee2f7b3a7503285aa3e6e5ce3561cc2', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-16 19:45:06', '2021-03-16 19:45:06', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('1efb59d8a4bfba27decca663a662281f', '6795d72d4b27b24e02acb38723ccc5d6', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-06-13 07:46:29', '2021-06-13 07:46:29', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('1f3a2c2193f02c742828e2341407fdee', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:16:21', '2021-04-10 09:16:21', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('1f575d8ba86e75fd1539925b97a79934', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '49', 1, '2021-04-09 20:47:18', '2021-04-09 20:47:18', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('1fb5c434699abb5d9acde7f5266993b2', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:57:48', '2021-04-12 09:57:48', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('1fc3138e26efcd57c431b5bcb904f018', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-11 19:24:42', '2021-03-11 19:24:42', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('1fdf2bb24d5e94d6ca5a716ac8c09f35', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '24', 1, '2021-04-09 20:43:36', '2021-04-09 20:43:36', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('1fff4672130b3e06d3dce09f6815d3a3', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2020-12-26 15:22:07', '2020-12-26 15:22:07', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('204f6ae027a43b73f854395e54a618c7', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-13 09:20:52', '2020-11-13 09:20:52', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('205e79cf738d4e313d2b97ec7250d7f7', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 15:28:19', '2021-02-23 15:28:19', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('2067b23595d1a71378e2ee9f10640550', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 10:44:30', '2021-04-11 10:44:30', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('209be131e5c85fb2b70a78267bc0f9e2', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 15:37:58', '2021-02-23 15:37:58', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('20b9857687a85c4bb052a8edb1953cb5', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 19:13:01', '2021-02-23 19:13:01', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('20ce55601985b33dc43c217232768bcb', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-16 16:01:25', '2021-03-16 16:01:25', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('216249cd80ff3c97ad8a5a496d0abe33', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-22 16:24:41', '2021-02-22 16:24:41', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('2166dc07e624dc27e99db2966f855c72', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 15:40:14', '2021-02-23 15:40:14', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('216f5e79502c00ffed9051dd79903b85', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-20 21:18:35', '2020-11-20 21:18:35', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('21814d223da2e9713274d6bfa675073e', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 20:43:24', '2021-04-09 20:43:24', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('21850c7f216c88a41e20f04014bd0427', NULL, '192.168.104.1', 'blog_content', '062ca3475e8193a4a81853a4bf41a8fa', NULL, 1, '2020-11-13 09:24:41', '2020-11-13 09:24:41', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('219dddb4e85d6dd4e817441da1f6fda0', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 19:03:01', '2021-02-23 19:03:01', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('21b2b818a3669e2b71bbcf8471993ad3', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 20:49:19', '2021-04-09 20:49:19', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('21c577df89e0bd0c764098014458f663', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:26:10', '2021-03-25 09:26:10', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('21cd9627fa6e78b8ed766e4191837161', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年01月', 1, '2021-01-28 23:18:30', '2021-01-28 23:18:30', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('21e3ed7a556b987b3140bf9ad9d7edae', NULL, '192.168.104.1', 'visit_sort', NULL, '2020年11月', 1, '2020-12-04 15:57:24', '2020-12-04 15:57:24', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('21f821611baadbee2c8f95e3dbe8cbb3', NULL, '192.168.104.1', 'visit_tag', NULL, NULL, 1, '2020-11-13 10:54:05', '2020-11-13 10:54:05', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('2219cb0ad79a65448afe5125c28e551d', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:23:50', '2021-04-10 09:23:50', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('221a11ed1b82bfd9306b9805fdfb8d07', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 19:04:20', '2021-02-23 19:04:20', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('2231e01be3301afcc843fa8691570685', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:57:13', '2021-02-23 16:57:13', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('229c1a1e9d0d136456d727edadd0dcfa', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-11 19:24:13', '2021-03-11 19:24:13', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('22b505fe9d8c4e4348717622d100550b', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:11:15', '2021-02-23 18:11:15', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('22c7e099d2c751d1885d1f317866abdc', NULL, '192.168.104.1', 'blog_content', NULL, '8', 1, '2020-12-04 16:17:31', '2020-12-04 16:17:31', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('22d59376df8f3d413bcc51518c7d606b', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:30:50', '2021-03-24 21:30:50', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('23120ca488c698921e8f2b963d8ab5d4', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:27:46', '2021-02-23 16:27:46', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('23292f1d6090f0180ca3dc89945b9212', 'b486735e7b914e366840d01f049306e4', '192.168.104.1', 'blog_praise', '635fc430e3378403a7d3f1e2a4e726a9', NULL, 1, '2020-11-14 08:39:15', '2020-11-14 08:39:15', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('2345c86dd71dd55bcf4eeed8bb3cc38b', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-13 10:20:37', '2021-02-13 10:20:37', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('23476df1bc71046ed26b26d596c6738c', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-13 10:54:04', '2020-11-13 10:54:04', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('2353816ce2ba7580834880e2ff2bb4b1', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-11 19:23:22', '2021-03-11 19:23:22', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('237b514cb9131f4436b229360d42197a', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 19:12:47', '2021-02-23 19:12:47', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('23994a6670ae38cb949927ef04149ec2', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:52:09', '2021-03-24 21:52:09', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('239eddd2c384966f574703d5a829c119', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-22 16:24:11', '2021-02-22 16:24:11', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('23a33721bde11195f79c82dd98a395bc', 'b486735e7b914e366840d01f049306e4', '192.168.104.1', 'blog_praise', '635fc430e3378403a7d3f1e2a4e726a9', NULL, 1, '2020-11-22 08:47:44', '2020-11-22 08:47:44', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('23befc1611171890b225bf55adc89321', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 21:46:33', '2021-01-15 21:46:33', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('23c932314cd021d25b2d941dbb808035', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 20:49:14', '2021-04-09 20:49:14', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('23c95df0c19183e5e09a6a2fad3e3141', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年04月', 1, '2021-04-10 09:30:27', '2021-04-10 09:30:27', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('23cb078ec12204711e9339f561b949e2', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:07:22', '2021-04-09 21:07:22', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('23ecfe5017cd937819d8de9dbd8f9629', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 16:39:15', '2021-04-11 16:39:15', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('23f1cde062cc4ea76d41d5df29ee8a45', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 16:46:11', '2021-02-23 16:46:11', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('244d0d1d7ba456cc1b15b671874b1d6d', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:31:48', '2021-04-12 09:31:48', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('247e174df26ca0c2d48506b0127ceeeb', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:40:30', '2021-04-09 21:40:30', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('248efc65d19881b4494e959da5e3424b', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-03-16 16:00:38', '2021-03-16 16:00:38', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('24999dd4fc237f92001b0d140828f283', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-27 13:14:39', '2021-02-27 13:14:39', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('24a0ddf94f8307362905257f04d60dd6', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-14 23:23:59', '2021-01-14 23:23:59', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('24e4842a0ba9ca0c7bfbdb1210735d9a', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:29:12', '2021-04-10 09:29:12', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('25045f5df8eb357d6e0deedd52008c83', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:19:50', '2021-04-10 09:19:50', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('253593d69da8fe27c5982759bcb53057', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-02 15:44:45', '2021-01-02 15:44:45', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('2579d487e1697b74e9e43be209f644e9', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 16:08:11', '2021-02-23 16:08:11', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('25c9ed51d0793f38349fb60f4bf77eca', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-04 19:04:05', '2021-03-04 19:04:05', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('25ecf00ce72c23afbe81fc098b7cf872', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:16:06', '2021-04-10 09:16:06', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('2646296c3c90664b086bfc58cf4358ca', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:26:12', '2021-03-25 09:26:12', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('265bd0ada621d7217498bdff7f19ae98', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 20:38:09', '2021-04-09 20:38:09', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('265d6cd4d8f6adff09561f9f245166ed', '6795d72d4b27b24e02acb38723ccc5d6', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-06-13 07:48:23', '2021-06-13 07:48:23', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('2684df24cf8182992034b7b74afde2b7', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 10:41:04', '2021-04-11 10:41:04', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('26851e6e6f094a8b9abc62f9408b3f87', 'b486735e7b914e366840d01f049306e4', '192.168.104.1', 'blog_content', NULL, NULL, 1, '2020-11-14 08:38:09', '2020-11-14 08:38:09', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('26a8442afe0c6760a6fe94ff16183dde', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-14 23:18:16', '2021-01-14 23:18:16', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('26de5708614f1b40418129c805eb74e9', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 12:40:12', '2021-02-27 12:40:12', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('26e0f6c185923826090cb7ec87c7ab3c', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-22 16:24:34', '2021-02-22 16:24:34', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('26fbefa9ca69bea61131237058c6325a', '6795d72d4b27b24e02acb38723ccc5d6', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年04月', 1, '2021-06-13 07:48:39', '2021-06-13 07:48:39', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('26ff3b7ca00499eba8c5bc9c9929960a', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-06 22:00:08', '2020-12-06 22:00:08', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('271438d770fc391e39edf1b4f2aec747', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:40:51', '2021-03-25 09:40:51', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('271e1c69a44becbcb433f24ceb704aae', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 14:43:05', '2021-02-23 14:43:05', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('271fb14df72a0896df273896e548a153', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-21 19:35:07', '2020-12-21 19:35:07', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('2730392f53909e5982af2ebd25acf07e', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-19 16:07:28', '2020-11-19 16:07:28', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('27422c85af4cc2e708b7cdfa7727acbd', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 10:41:00', '2021-04-11 10:41:00', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('276d9ffd3215f0fb049093e09b0502ce', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2020-12-26 15:37:34', '2020-12-26 15:37:34', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('2777c7fbb2550c4d756e5dcb6b58a6d8', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 21:33:41', '2021-01-15 21:33:41', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('27b8c615d9a07f8c555bd6aa6fd2b333', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 19:11:34', '2021-02-23 19:11:34', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('27e952180b6e13ae2ebc63b10f3c8bdb', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 19:05:52', '2021-02-23 19:05:52', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('2810750d89beec200dc91fb4709b5031', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 18:23:42', '2021-02-23 18:23:42', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('2815c053f07f4521545201ff35347fb5', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-08 21:50:29', '2020-12-08 21:50:29', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('282332835cf3f6e222d0c545a04a9d32', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'blog_content', '5adda57c05ec8ecb386a819375f328c0', NULL, 1, '2021-01-07 10:41:43', '2021-01-07 10:41:43', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('2844848ba51004b2fc653471a259d20d', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:06:03', '2021-02-23 18:06:03', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('2849131697e9c74f9928df2cd7c7bbf6', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-27 13:14:17', '2021-02-27 13:14:17', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('28733b7226eae9675bd4d29daba56176', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-19 11:58:45', '2021-02-19 11:58:45', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('2898132dcafdee58b25910a2fa4e3cbd', NULL, '192.168.104.1', 'blog_content', NULL, '8', 1, '2020-12-04 16:22:16', '2020-12-04 16:22:16', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('28ddcc9d62e9dc2e59625d12c6fdeade', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:37:00', '2021-04-09 21:37:00', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('28f0e04d76ababaedec10dddd5239bbe', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-04 23:47:58', '2021-02-04 23:47:58', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('29076450f2eaeeba63b6c317380a0f89', NULL, '0:0:0:0:0:0:0:1', 'blog_search', NULL, '测试', 1, '2020-12-09 21:07:27', '2020-12-09 21:07:27', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('291adebcd32716ab9d81af0e41c629e1', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-06 15:43:00', '2021-02-06 15:43:00', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('29280796e290480046068a1b1a2e2d6a', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '49', 1, '2021-04-09 20:49:13', '2021-04-09 20:49:13', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('294da288028fe2df1dc4fe99f9db87da', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:07:22', '2021-02-23 16:07:22', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('2a2d9dd86a7f5e775ab51212ca329a3b', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2020年12月', 1, '2020-12-26 11:32:21', '2020-12-26 11:32:21', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('2a302239fdda3d9d25b06e44446d7d02', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-07 09:22:06', '2021-01-07 09:22:06', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('2a42519bb8b515b7faffd93f2c48d35f', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 20:57:01', '2021-04-09 20:57:01', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('2a841900ac16121a20fe994bf8009fc4', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 15:00:01', '2021-02-23 15:00:01', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('2a94d8a3d5e7a4b362ab175d62cc02fb', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '测试', 1, '2021-03-24 21:42:22', '2021-03-24 21:42:22', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('2ac5c3d4e178769fbcec1e25b5104b42', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 16:47:52', '2021-04-11 16:47:52', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('2ae3628cb6e07b86d8bf884918f9d74e', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 16:55:14', '2021-04-11 16:55:14', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('2b565c1548d8dff3f2520dee32b1832c', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '33', 1, '2020-12-26 16:06:58', '2020-12-26 16:06:58', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('2b575ac41019bcf69606e76763ecc059', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 15:37:06', '2021-02-23 15:37:06', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('2b5db32a4c95f25a7b133bde2f5fc4ee', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 10:59:48', '2021-04-11 10:59:48', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('2b621fa4ff0f4c3c6e08d1dde68f9a95', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:44:53', '2021-03-25 09:44:53', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('2b802cdf348a0b3845caed0e4c7bcddc', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-15 20:33:08', '2021-01-15 20:33:08', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('2b864622afd95fa945886ab66a542593', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-05 11:07:21', '2020-12-05 11:07:21', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('2b8bf13fc56cd8f1e6f9d21069d6be4c', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '31', 1, '2020-12-12 10:41:59', '2020-12-12 10:41:59', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('2b97b4c5278a639b84acf8c0813a111c', '6795d72d4b27b24e02acb38723ccc5d6', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-06-13 07:48:20', '2021-06-13 07:48:20', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('2bda5f968cde0b349af725b6ae8d2e35', NULL, '192.168.104.1', 'blog_content', '34eb1b938fa734a52ce0f18a1b849685', NULL, 1, '2020-11-09 09:15:18', '2020-11-09 09:15:18', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('2bdd0f8d58f1ebdec294d032985505cb', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 17:31:47', '2021-02-23 17:31:47', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('2c12e48547ebf7dc6a5091e79ef4f1b8', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 10:34:00', '2021-04-10 10:34:00', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('2c16de0649ae5a3b3be3f29165b6ca6b', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-03-04 19:29:53', '2021-03-04 19:29:53', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('2c288cf170a19685ac80696315d34b54', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-27 13:14:39', '2021-02-27 13:14:39', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('2c2df9e5457b9fc30ae3f210780b6a9a', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '31', 1, '2020-12-12 10:46:25', '2020-12-12 10:46:25', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('2c34c7d99c003266349c24b97b330abe', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 08:50:31', '2021-04-10 08:50:31', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('2c4ac3e447be71bdf9da76b7a87b825d', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:13:36', '2021-03-25 09:13:36', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('2c58f129d8b126c4d99a485b5bf8298e', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 15:37:58', '2021-02-23 15:37:58', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('2c7113100430bea20d210c8ac50e9d69', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2020-12-26 15:40:36', '2020-12-26 15:40:36', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('2cca856671c40a70bdf67df001ca88aa', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 11:29:58', '2021-04-12 11:29:58', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('2ccb32c58a17121420f69591ff50cae1', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-22 16:24:41', '2021-02-22 16:24:41', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('2d175dcfeca376694439db1fb9ca1632', '3c61610e3f04833f5d91084beb42166a', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 21:53:29', '2020-11-17 21:53:29', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('2d1db3659097238bf473578e3d575602', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-23 18:06:02', '2021-02-23 18:06:02', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('2d379a02b53c07dba35d47dabeedfea9', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-04 23:44:53', '2021-02-04 23:44:53', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('2d51925eb38f5e0f2a12a0c1c53dce80', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:17:54', '2021-03-25 09:17:54', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('2db8b16655c126bdf33f8ef5bcfde65f', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '3c16b9093e9b1bfddbdfcb599b23d835', NULL, 1, '2020-12-26 11:24:36', '2020-12-26 11:24:36', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('2dbefa5c33f009ccfdd7ef4624e7059c', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-02 10:52:50', '2021-03-02 10:52:50', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('2dc81360dd9b4256b8932c30604954ea', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-04-12 10:30:49', '2021-04-12 10:30:49', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('2dd94e50e1c0cd7c17fd845b800c2992', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:30:01', '2021-04-10 09:30:01', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('2dfeca6e0ebb619524e09a492c25fa14', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 15:29:31', '2021-02-23 15:29:31', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('2e573879c0a6efaeff3b1182dccf27be', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-03-16 16:01:31', '2021-03-16 16:01:31', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('2e9c6be358e272be5ad854a028f98412', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-21 19:38:32', '2020-12-21 19:38:32', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('2e9dc51aa88677ff372ccd07f123b3c4', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:15:22', '2021-02-23 18:15:22', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('2eb96a9efb3810e6ffb90f06d0c2f20f', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:04:04', '2021-02-23 18:04:04', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('2edc710a77023a5e23f52b681588a4b3', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 16:57:28', '2021-04-11 16:57:28', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('2f020f6aa7c3674dc8eb03bd2184525d', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 17:00:05', '2020-12-04 17:00:05', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('2f21c83642ff0fb5af18bfeeb7e9e03f', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-03-22 21:21:50', '2021-03-22 21:21:50', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('2f484f4fee018b67f31a711ba8f82530', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 17:25:38', '2021-02-23 17:25:38', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('2f68d981dcdcd88a25a9de52221fef40', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-19 12:15:15', '2021-02-19 12:15:15', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('2f69e0d419e38ea4119b2953a94d73aa', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2020年12月', 1, '2020-12-12 10:36:09', '2020-12-12 10:36:09', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('2fe9b092d7253252dfc8d85fa52c50c0', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 10:01:19', '2021-04-12 10:01:19', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('2ffa691f1f4c14fca92dc6d6b5a39052', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:38:01', '2021-04-12 09:38:01', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('300275e61d9b76b49feb91d7b1bfd573', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-04-09 20:43:15', '2021-04-09 20:43:15', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('301f2169a8313bf5a922a5e7022ad0e0', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '45', 1, '2021-03-25 10:00:43', '2021-03-25 10:00:43', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('30415f1b79cd1a6f5ce4db7231993da8', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:20:05', '2021-03-25 09:20:05', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('306846a53049c89cabdf7ad4b2bcb9e0', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 20:39:15', '2021-04-09 20:39:15', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('30ce03a131ce238597ecb1162dc71661', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 10:24:28', '2021-01-15 10:24:28', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('30f9727fcec35015660bbf66d4bafe5d', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '31', 1, '2020-12-12 10:38:01', '2020-12-12 10:38:01', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('31623a48ef2860c37316f22b5a895342', '3c61610e3f04833f5d91084beb42166a', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 21:56:17', '2020-11-17 21:56:17', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('316248f79b1deae4c4e78e63ec80eb0c', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 20:56:55', '2021-04-09 20:56:55', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('3163af4cc2166bcf959954a5ac0b6a1e', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '30', 1, '2020-12-12 10:36:39', '2020-12-12 10:36:39', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('31680eac1affeef912ef2c359a592618', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:07:13', '2021-04-09 21:07:13', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('3178e5268bb22fe376d9bae677b60c6f', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 10:08:57', '2021-04-12 10:08:57', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('317cbd540dd10613628416a317b042ab', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:55:45', '2021-02-23 16:55:45', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('31aee292ad9653c6fd87b09702ee378a', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 15:29:56', '2021-02-23 15:29:56', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('31f3cc3c883316bb18139024b216a7d6', NULL, '192.168.104.1', 'visit_classify', '093d8bdd01c84890a928e923d5c235fe', NULL, 1, '2020-11-20 22:06:02', '2020-11-20 22:06:02', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('31f74a8b1b872b663a746b807627d1f4', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 16:16:43', '2020-12-04 16:16:43', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('3214cee34fcd24ad3dedc62819ec57c5', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-12 10:39:31', '2020-12-12 10:39:31', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('321cda1bec2d7157b07762edd5eb1913', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 10:59:49', '2021-04-11 10:59:49', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('32362f9ce6352f5d39e9bc46eb1905ac', NULL, '192.168.104.1', 'blog_content', NULL, NULL, 1, '2020-11-13 10:16:26', '2020-11-13 10:16:26', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('324240d5d9b59979a6f08bd0e882f4d5', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-03-22 21:26:05', '2021-03-22 21:26:05', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('3291c1a6d33e9fdd9e8f538858cc53e2', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:26:31', '2021-03-24 21:26:31', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('32c38e2c2e5fb5d8a9e734cc229fb609', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-18 12:12:30', '2021-01-18 12:12:30', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('32d58c0d7c0b40013e791d926495e396', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 22:32:54', '2020-11-17 22:32:54', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('32e8bc4e977f139fb0418ef74fca98f5', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2020-12-27 11:01:24', '2020-12-27 11:01:24', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('32f88574b214535da50375e4d125385b', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:07:28', '2021-02-23 18:07:28', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('32fcc0b6ca0567de9816c3c459404dac', NULL, '127.0.0.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 22:56:30', '2020-12-04 22:56:30', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('3300a57c56246b1e36a0a7f81887976b', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-13 09:51:21', '2021-02-13 09:51:21', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('335041e1f3e44021dce197de379c7ce9', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-05-17 11:00:57', '2021-05-17 11:00:57', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('3356605a0281cf2305f7b2931d7f3527', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:40:54', '2021-02-23 18:40:54', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('338c1152c52d4be06ba9edc167e9442f', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 16:10:08', '2020-12-04 16:10:08', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('33aa3f5418e333b4f7be1024e2ce2b3d', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-22 21:26:57', '2021-03-22 21:26:57', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('33b7e197b8fb3afcd536540a221a8dc0', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 19:11:59', '2021-02-23 19:11:59', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('33ca4534e25795a02de48a5768490fbb', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2020-12-26 11:24:24', '2020-12-26 11:24:24', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('33d6fa56ef4fab349786161319600033', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-18 23:47:59', '2021-01-18 23:47:59', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('33f5a4aa1cf0d12567132538153d113c', '6795d72d4b27b24e02acb38723ccc5d6', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-06-13 07:57:10', '2021-06-13 07:57:10', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('33fbab7d98842dd7a6c99b3dde527ea6', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-04 19:35:08', '2021-03-04 19:35:08', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('33fd1d1682a0bed485ab06717b26cc84', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-04 19:34:16', '2021-03-04 19:34:16', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('341fdea24889d3f51899724830dc0bd0', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-05-17 10:32:39', '2021-05-17 10:32:39', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('344f4f0fa9ca0b3c9a88abb9cb4459f6', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-02 10:52:44', '2021-03-02 10:52:44', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('346f7acbd39bf8d897ac26ef0507e9ea', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 10:12:49', '2021-04-12 10:12:49', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('3476a7e99119743fdeadf85f56115a28', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-03-22 21:21:38', '2021-03-22 21:21:38', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('347a7b7e75d5e0e9b5b7d868308a9e4c', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:29:36', '2021-03-24 21:29:36', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('347cb0f90f3e3726f755142aa581e9b1', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-19 16:07:23', '2020-11-19 16:07:23', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('349eae216380ca2b728478428f4d1972', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '52', 1, '2021-04-12 15:42:41', '2021-04-12 15:42:41', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('34d42b909d8b453284e3572bfc28a3fb', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:08:08', '2021-02-23 16:08:08', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('350b496ab81d753a2919314de65d5736', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 10:01:23', '2021-03-25 10:01:23', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('35818728281c3fb3cfb1dce64c8c6ef8', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 17:01:11', '2021-04-11 17:01:11', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('35d03ba652751dda58b0f76cf1e03d2a', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 10:41:23', '2021-04-11 10:41:23', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('35d0607d58c663c27ec7570f2c1ce3a2', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 13:14:38', '2021-02-27 13:14:38', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('35fba2f7de020c504f65c419822fd602', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-02 10:52:39', '2021-03-02 10:52:39', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('362efe81006f321d828aed422ed72970', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 10:00:28', '2021-03-25 10:00:28', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('3635aa0df3c46a37f888a38b30c89e1f', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-23 18:19:41', '2021-02-23 18:19:41', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('364e103bf8105f5e3c4984d02b59f7b5', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-11 19:18:48', '2021-03-11 19:18:48', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('3659946b7fbb685bb61a41f3a2e20879', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-05 16:44:04', '2020-12-05 16:44:04', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('3681202673ca2aae4f08afd0f6f12832', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 10:37:52', '2021-04-12 10:37:52', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('369da1a636a1c7f603e3c91b5df13670', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 18:23:20', '2021-02-23 18:23:20', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('36c35c043cccc4acaa1c573b2e696322', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:41:07', '2021-03-25 09:41:07', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('36f40e9e3ab7e9afb75810d56797b9b6', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-03-25 09:26:48', '2021-03-25 09:26:48', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('3706a444661ce85fb3033ad477fef172', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-24 21:41:17', '2021-03-24 21:41:17', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('371669dac9a9f8dd37de46c34512d1a2', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-23 15:29:27', '2021-02-23 15:29:27', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('37279290781834297c847a20c8d5d461', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-24 09:18:39', '2020-12-24 09:18:39', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('3748c3018e09d6c1607043028f2a8e7d', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 13:15:52', '2021-02-27 13:15:52', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('3783fef292f046afd0c1e77f8bdbc2c2', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:06:21', '2021-04-09 21:06:21', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('3790494b1736781907ec67e3f916d4fc', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-01-02 16:07:29', '2021-01-02 16:07:29', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('379dab06b2318f0c1ef858e458d54d45', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 21:35:00', '2021-02-23 21:35:00', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('37b8850de4df7c5d1fec0923b92b79ed', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 10:58:24', '2021-04-11 10:58:24', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('37c4846c85914989ca8d878a1f0af10c', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:42:05', '2021-03-25 09:42:05', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('37f86440ee7153d5acbe1e150335bfb5', NULL, '192.168.104.1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2020-11-20 22:20:24', '2020-11-20 22:20:24', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('37fe125a241ff1ea2b33bbbef38bf1fe', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:17:16', '2021-03-25 09:17:16', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('3802907dca6045492ed7e97928390733', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-20 21:17:30', '2020-11-20 21:17:30', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('382cceddb277c2319e0ef39ae305f2f4', '5eb5257f707cad9c6f06a1e951ba2def', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-09 09:21:24', '2020-11-09 09:21:24', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('387b6f38c4891b7d4fb21bfa8191d5fd', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:19:51', '2021-02-23 18:19:51', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('38c81774d0280cb3a1adb4d7e58e4ec8', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:27:23', '2021-03-24 21:27:23', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('390355a3768a1afb380a508c09e7eff4', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:19:23', '2021-02-23 18:19:23', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('39399c9ccbe222c5c21ca142b660da57', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:12:29', '2021-04-10 09:12:29', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('393bef7ed8f5f30bb471019f1eb3f260', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-02 11:22:41', '2021-03-02 11:22:41', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('397e416d5dc19035e53769ef18ff0beb', 'b486735e7b914e366840d01f049306e4', '192.168.104.1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2020-11-22 08:47:52', '2020-11-22 08:47:52', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('39b9cbc82a120b03f925a4e3adb4834d', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-02-04 23:49:40', '2021-02-04 23:49:40', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('39c661f608185f2ad10a9237be72d3e1', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-13 09:36:43', '2021-02-13 09:36:43', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('39d9b3e857cb81e788f800e7cd4f33c3', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-03-02 10:52:37', '2021-03-02 10:52:37', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('39e3983a5fb195debd6ad76498e74cb2', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', '635fc430e3378403a7d3f1e2a4e726a9', NULL, 1, '2021-04-12 11:30:14', '2021-04-12 11:30:14', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('3a0a895d100979547be3744022b2da21', NULL, '192.168.104.1', 'blog_content', NULL, NULL, 1, '2020-11-13 10:54:02', '2020-11-13 10:54:02', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('3a1c52a727f65ec6def135095fbdf4cd', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 16:48:03', '2021-02-23 16:48:03', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('3a289eb98c2f4e912d7f9296f51bf06b', 'b486735e7b914e366840d01f049306e4', '192.168.104.1', 'blog_praise', '635fc430e3378403a7d3f1e2a4e726a9', NULL, 1, '2020-11-22 08:47:43', '2020-11-22 08:47:43', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('3a2dd514aa129189231471ec61714796', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '30', 1, '2020-12-12 10:32:04', '2020-12-12 10:32:04', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('3a3e637f3d2a19782183c728c804e488', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:41:15', '2021-03-24 21:41:15', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('3a7a2199b090593b85dbb25683e54b66', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-22 16:24:39', '2021-02-22 16:24:39', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('3a7bb0fff180772740b165ac857af5a3', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 16:55:15', '2021-04-11 16:55:15', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('3a86d202d2e4c0bbac006401d123c5a2', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 19:11:34', '2021-02-23 19:11:34', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('3ad99658445e33686a515e23723ba0c6', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:19:30', '2021-04-09 21:19:30', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('3afcdc6282fdcc2e818c056b0fd54501', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 10:07:25', '2021-04-10 10:07:25', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('3b0f13d664cdc91c1508afd33cf8499d', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-31 19:58:04', '2020-12-31 19:58:04', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('3b42012226a34a8c262a7aec232606e3', '3c61610e3f04833f5d91084beb42166a', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 21:43:58', '2020-11-17 21:43:58', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('3b613e47c19e332fcdf91d8379147706', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-27 13:15:59', '2021-02-27 13:15:59', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('3ba331678a0c2ae8a99d3aa08a570e83', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 15:29:30', '2021-02-23 15:29:30', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('3bc26dcdb4e0e01ef0bade5becd77b11', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 10:01:57', '2021-04-12 10:01:57', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('3c2b47f4a81b74b176f633a8c8c90930', 'f6ac7f1cee33a0c4652a7396a1767368', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-04-09 18:39:25', '2021-04-09 18:39:25', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('3ca462cb88d39f0e6049553978b48a77', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '测试评论', 1, '2020-12-31 20:03:48', '2020-12-31 20:03:48', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('3ce65185ac51c6b98dad892f08c16bc1', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 16:08:12', '2021-02-23 16:08:12', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('3cfab44ad1d46c63fe36af6239edba65', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 22:34:23', '2020-11-17 22:34:23', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('3d29cf32a218fa357934406b4140e879', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-24 09:30:05', '2021-01-24 09:30:05', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('3d3832a48bc27d84c1d5a528a85d709d', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-13 09:19:28', '2020-11-13 09:19:28', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('3d4850d5479e74897344ba2a8ca4c32e', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-04 19:29:35', '2021-03-04 19:29:35', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('3d825ec3c1f87d47ad248859c7f513c6', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-13 10:12:36', '2020-11-13 10:12:36', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('3d8e1f9dbdcecb854e35d1626692d89d', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-11 19:29:19', '2021-03-11 19:29:19', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('3d9ac0533366b092d21f15beafdd82b1', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 16:12:51', '2020-12-04 16:12:51', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('3da916b7a897b07c4f0e161261ea3745', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:25:07', '2021-02-23 18:25:07', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('3dc4524f8c5d00672cd263bc9b2b14f5', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 10:42:24', '2021-04-11 10:42:24', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('3dc72d038e5d0dd5c94c632262aa0272', '6795d72d4b27b24e02acb38723ccc5d6', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-06-13 07:45:17', '2021-06-13 07:45:17', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('3dd1348b36c49c2a8ceb392205f8280a', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 16:52:47', '2021-04-11 16:52:47', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('3dd7eb3a0dd0a024f81e522acddb6a90', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-22 21:09:41', '2021-03-22 21:09:41', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('3dea1892290b97a1620e6e0c768f8001', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-24 09:23:21', '2021-01-24 09:23:21', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('3e24f9055a3c7529398108aab0d15a9b', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 13:06:19', '2021-02-27 13:06:19', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('3e4c6ff797209626b3bb5bf3255863ee', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-13 09:36:40', '2021-02-13 09:36:40', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('3e5a04ed8341d7f9308e75a5e40ccb2c', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-08 22:15:39', '2020-11-08 22:15:39', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('3e65be135b0b487c340541af6b821f17', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 16:57:52', '2021-02-23 16:57:52', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('3e93e56a35ce3f10da6ad017a322f6fb', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 10:54:41', '2021-04-11 10:54:41', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('3eb8e69757f4982f6081d4e7ac806e12', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '49', 1, '2021-04-09 20:47:09', '2021-04-09 20:47:09', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('3ed0e70c156c6ab69ba13c13f28a2efa', '939e48c0b3d27ade7f654a113c729976', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 22:53:18', '2020-11-17 22:53:18', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('3ee2b00bfcf0ac1f581f622bd2b950c1', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:39:33', '2021-04-12 09:39:33', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('3f20a5ab331745af76c1d2fd2d40d2e6', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:19:38', '2021-02-23 18:19:38', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('3f2713d03107ab3df6e119d191ef0cee', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-03-25 10:01:26', '2021-03-25 10:01:26', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('3f5d9b0d0838892f88ba55ca28eac9cf', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-03-04 19:34:57', '2021-03-04 19:34:57', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('3f6a4cb412faa71493322f57470fb0a6', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 11:05:20', '2021-04-11 11:05:20', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('3f8625d7ff2de8d1aacca99d6096fa12', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '31', 1, '2020-12-12 10:31:04', '2020-12-12 10:31:04', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('3f8f438a2d61959f33979fd0332fd7a0', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-05 09:35:28', '2020-12-05 09:35:28', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('3fa191674dfa5a77538cd3af70faccfa', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:31:08', '2021-04-12 09:31:08', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('3fb7461ad98706164f0e42e4bbfb7af9', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 21:27:24', '2021-01-15 21:27:24', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('3fccba5b212726dfbe2322691602c3a9', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-28 21:07:11', '2021-02-28 21:07:11', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('3fcdefcceb49688235e680983a4e6947', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 17:19:41', '2021-02-23 17:19:41', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('3fd35f02408875c0949148d9a1205cd2', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-03-25 10:00:53', '2021-03-25 10:00:53', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('3fd43a3ea1a74dfcffcd85d7b262f076', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-13 09:18:00', '2020-11-13 09:18:00', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('3fee39d1c5b663993ce2c0d8512d7102', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-28 21:06:25', '2021-02-28 21:06:25', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('3ff08e798142845f2dbb476fc2654473', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 15:30:09', '2021-02-23 15:30:09', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('402e933106f685a8dbca9304c1b21891', '6795d72d4b27b24e02acb38723ccc5d6', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-06-13 07:49:09', '2021-06-13 07:49:09', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('4034635a450811d35ff6df17a5181c4b', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 21:01:24', '2021-01-15 21:01:24', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('406789bd384c507e6a9ff917dbdcf32c', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:01:32', '2021-04-12 09:01:32', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('40732c7c3d99196d2c3faa2a903a3a90', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 16:47:14', '2021-04-11 16:47:14', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('4086777635ebf1eaf133c9de763f9046', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-22 16:24:17', '2021-02-22 16:24:17', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('40869fc921d10251b65493a47ba3c1da', NULL, '192.168.104.1', 'visit_tag', '7e0e93ea6cdb44ae92e58f48e6496ed7', NULL, 1, '2020-11-20 22:27:36', '2020-11-20 22:27:36', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('4094154773a51560cdce916637004747', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-12 10:28:34', '2020-12-12 10:28:34', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('40a365d5de9f8847a188885cc9af8d56', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 19:12:54', '2021-02-23 19:12:54', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('40b10a9b94311262c7233edf3451b3b1', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-11 19:29:08', '2021-03-11 19:29:08', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('40bb4764434b21562fb09519209305ae', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-19 12:09:05', '2021-02-19 12:09:05', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('40cc62a0a4860efd8079e76aee976fa9', 'b486735e7b914e366840d01f049306e4', '192.168.104.1', 'blog_praise', '635fc430e3378403a7d3f1e2a4e726a9', NULL, 1, '2020-11-22 08:47:44', '2020-11-22 08:47:44', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('40ce622afb80d7492d1a3afcd01354ff', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:19:57', '2021-04-09 21:19:57', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('40e7acd5208e5139f7447c37e77e6bb5', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 19:04:42', '2021-02-23 19:04:42', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('40e8ff6b5e800d4f00e11beb9760a174', NULL, '192.168.104.1', 'blog_content', 'undefined', NULL, 1, '2020-11-08 22:20:08', '2020-11-08 22:20:08', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('40fb41fb91d3ea54c74142172c5b39bf', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 19:04:36', '2021-02-23 19:04:36', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('410c168e47c1caab47666831da68aafd', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2020-12-31 20:03:25', '2020-12-31 20:03:25', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('414f11300de57e7c3b3e285c2a9e1579', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-27 13:14:33', '2021-02-27 13:14:33', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('4166bb366cc923cc4d16d09ac08c0ffd', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:08:39', '2021-03-25 09:08:39', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('41a36ae80361a6b8535cdcf7b6a0288c', 'b486735e7b914e366840d01f049306e4', '192.168.104.1', 'blog_praise', '635fc430e3378403a7d3f1e2a4e726a9', NULL, 1, '2020-11-14 08:38:11', '2020-11-14 08:38:11', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('41e308a61514dc2a129a096a3e54adec', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:43:36', '2021-04-10 09:43:36', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('41f6fe4ebd152c70801be23bb6021214', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-03-25 09:56:06', '2021-03-25 09:56:06', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('420f46a489aa8bfa6013aca1006fb1cd', NULL, '192.168.104.1', 'blog_content', NULL, '8', 1, '2020-12-04 17:16:39', '2020-12-04 17:16:39', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('42104ca8a56f79f315b27ac91836d6b0', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-22 16:24:18', '2021-02-22 16:24:18', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('424a8888f6d5e0ffa096799488f8321e', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 17:01:12', '2020-12-04 17:01:12', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('424daaf3e04991b60b56317279223a56', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '测试评论3', 1, '2021-01-07 10:40:42', '2021-01-07 10:40:42', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('426d62ef2056b5a94556ce8acf110c93', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-12 10:39:21', '2020-12-12 10:39:21', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('4270ffef91315c836c92b6a51259b9b0', NULL, '192.168.104.1', 'visit_page', NULL, '关于我', 1, '2020-12-04 16:17:27', '2020-12-04 16:17:27', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('428616c0a61a1d987c508cf547e56705', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 20:41:25', '2021-01-15 20:41:25', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('42a27878d794aaed10b40833061df926', 'b486735e7b914e366840d01f049306e4', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-22 08:47:38', '2020-11-22 08:47:38', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('42c40b77d89e38bd5c0e6f7f3a6fe7ec', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-22 21:14:48', '2021-03-22 21:14:48', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('42e84ca28221cb220ae7d7361de46ef8', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2020-12-26 15:38:17', '2020-12-26 15:38:17', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('42f52513772fa12077bdaa34b28fd941', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 16:08:02', '2021-02-23 16:08:02', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('4302a65b25c5356e18e1faa6ff2d995b', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-01-28 23:18:27', '2021-01-28 23:18:27', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('4305278241e16e3b19e7d260e381beb5', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '30', 1, '2020-12-12 10:36:02', '2020-12-12 10:36:02', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('4340cc26b8a87ab611f8320713af2a2a', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-03-04 19:29:55', '2021-03-04 19:29:55', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('4344e9bc1697ad0e5d0f9579318df5ad', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '24', 1, '2020-12-09 20:47:21', '2020-12-09 20:47:21', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('43512cf3fbfe0fe9c17f0b3f51316339', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-01-24 09:52:26', '2021-01-24 09:52:26', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('4375487be3f718acdd7c50b14b7572bd', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-02 16:07:17', '2021-01-02 16:07:17', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('438308dee2614b63d6058f308ad37c0d', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '36', 1, '2021-01-14 22:58:51', '2021-01-14 22:58:51', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('438425d1e16a8541ab96b6b08125b02f', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-23 16:08:13', '2021-02-23 16:08:13', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('43ca4cd3a72de4df8a9fde89d608d5ab', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-13 09:06:20', '2020-11-13 09:06:20', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('43dfe0fc651b166754e3f55bebf8de6c', '3c61610e3f04833f5d91084beb42166a', '192.168.104.1', 'visit_sort', NULL, '2020年11月', 1, '2020-11-17 21:50:01', '2020-11-17 21:50:01', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('43f520758842e3ace06defb51937ff81', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-03-04 19:34:58', '2021-03-04 19:34:58', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('43f7faf3a66287e781975a1e8299e816', '162ab0809537781ef9c1bf41e78391e9', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 22:34:39', '2020-11-17 22:34:39', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('440e5f11c18731521202a984c7f6f9b8', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-13 09:51:21', '2021-02-13 09:51:21', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('4459da1c8e44538865c37015afab65c6', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 16:13:05', '2020-12-04 16:13:05', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('4486375ce521655048448da5952ce7cf', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-28 21:07:11', '2021-02-28 21:07:11', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('44cbd2d2a75d266d5603afd84618290f', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 12:59:57', '2021-02-27 12:59:57', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('44e6169700c301c9e7c222c1e1c260af', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:01:00', '2021-04-12 09:01:00', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('44e659cfd71da8da32c26d50c73b91ae', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-05 09:45:11', '2020-12-05 09:45:11', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('44f47cce63cb7ef11e4c6e4840fab459', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-22 16:24:28', '2021-02-22 16:24:28', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('44fc74c07d281f3f565ff3ddb2310195', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-27 13:15:48', '2021-02-27 13:15:48', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('4505644d11316d72fb579b43cad94a8d', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-03-25 09:26:49', '2021-03-25 09:26:49', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('451d42ac2589c9d2b1a427a037d27326', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-02 11:22:38', '2021-03-02 11:22:38', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('4571ff84b89cf82657c3bdc76da10a2a', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '测试2', 1, '2021-03-24 22:04:03', '2021-03-24 22:04:03', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('459bb2b13088f745531696884b64abaa', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 13:15:46', '2021-02-27 13:15:46', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('45aecf029909fd402b18e52db098b463', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:14:45', '2021-04-09 21:14:45', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('45c25c347e64d3154b81a378140ffc35', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:44:52', '2021-03-25 09:44:52', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('45cd6c023b78c4d52d1803920f4ee5ec', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-24 09:26:01', '2021-01-24 09:26:01', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('45ef5910c6bb69d3bd055c1d64c4153c', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 16:59:14', '2020-12-04 16:59:14', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('45f5ec6dc70a2345cebdf83a4231c4c5', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-24 09:49:17', '2021-01-24 09:49:17', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('460374751548fba9c9911a0162178e59', NULL, '192.168.104.1', 'visit_page', NULL, '关于我', 1, '2020-11-13 10:54:03', '2020-11-13 10:54:03', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('464677f943b2a33b175417721578b824', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '测试', 1, '2021-03-25 09:55:16', '2021-03-25 09:55:16', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('464c97f2d4bafe70766c352b08e6cc3f', NULL, '192.168.104.1', 'blog_content', NULL, '8', 1, '2020-12-04 16:24:29', '2020-12-04 16:24:29', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('4675550d0d6383de37066da49e45f857', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:39:53', '2021-04-09 21:39:53', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('46835bc53cd3c92656789380b8e32de2', NULL, '192.168.104.1', 'blog_content', NULL, NULL, 1, '2020-11-19 17:06:31', '2020-11-19 17:06:31', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('46a5b589f37868a867c1a9d6f1c8cf48', NULL, '192.168.104.1', 'blog_content', NULL, '8', 1, '2020-12-04 16:36:13', '2020-12-04 16:36:13', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('46d4e2deed8e364e885544ab6043f310', NULL, '192.168.104.1', 'blog_praise', '635fc430e3378403a7d3f1e2a4e726a9', NULL, 1, '2020-11-14 08:38:18', '2020-11-14 08:38:18', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('46dc3189489150ac8e33a1d89579e454', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 20:16:36', '2020-12-04 20:16:36', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('46fee9ea518cea33321325c458425344', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-03-24 21:39:29', '2021-03-24 21:39:29', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('471663dd33e8473767ab27224718669b', NULL, '192.168.104.1', 'blog_content', NULL, '8', 1, '2020-12-04 17:16:33', '2020-12-04 17:16:33', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('4719ad19a923dd0b7ef1202ddd590bea', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-27 13:15:49', '2021-02-27 13:15:49', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('472ced10f8f695b885afb0727b651868', NULL, '0:0:0:0:0:0:0:1', 'blog_content', 'e247932bf5f883ad3699144a00318a4b', NULL, 1, '2021-02-23 18:57:32', '2021-02-23 18:57:32', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('473d015c8184521d716043ed6ec6323c', 'b486735e7b914e366840d01f049306e4', '192.168.104.1', 'blog_praise', '635fc430e3378403a7d3f1e2a4e726a9', NULL, 1, '2020-11-22 08:47:44', '2020-11-22 08:47:44', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('4741e3c88cb57bc0cec6960a88970706', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 10:55:47', '2021-04-12 10:55:47', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('476aa73f2a15217da857778644735d03', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '32', 1, '2020-12-26 16:08:19', '2020-12-26 16:08:19', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('476ac0b2ee4d2308fd25be7cd3e0bff4', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-02 10:52:08', '2021-03-02 10:52:08', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('47a1bfa8ee4e279e28a4f06780440ade', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 18:10:51', '2021-02-23 18:10:51', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('47cf60a20cab6671a4310e43a42868cb', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:23:39', '2021-04-12 09:23:39', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('485a1d51602ff02b0e06ea5f52b1a5ff', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 16:51:06', '2021-04-11 16:51:06', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('48608aff219d627c8266c4b654f2e8b4', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:24:38', '2021-04-10 09:24:38', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('486fef284eb25d90cabc8a17993724b5', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 17:00:28', '2021-04-11 17:00:28', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('4872b2dfa303cee6fbef6bf916ff7c85', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 18:19:51', '2021-02-23 18:19:51', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('48ca09564c685cfefb3f241863cb738c', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-21 09:37:52', '2021-02-21 09:37:52', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('4909dac13f7b4fa3a4a46ccf07498322', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', '093d8bdd01c84890a928e923d5c235fe', NULL, 1, '2020-12-26 11:24:48', '2020-12-26 11:24:48', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('4923f6c4d9f47810f8637ee1198ffdcd', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 18:19:26', '2021-02-23 18:19:26', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('497ca5a2d3b970637b00f3cbc231b032', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 10:25:04', '2021-04-12 10:25:04', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('4992d8974a97f3b7beee5230d834b6dc', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '8', 1, '2020-12-09 21:06:54', '2020-12-09 21:06:54', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('49b7cb3319a3e17b94c8ea94ca910e91', '939e48c0b3d27ade7f654a113c729976', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 22:52:58', '2020-11-17 22:52:58', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('49c46de363ace7115a78a13129f65cb8', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'blog_search', NULL, '概念', 1, '2020-12-26 16:29:22', '2020-12-26 16:29:22', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('49d8c1526e2cc30c8040890f0a38ff11', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-03-16 16:01:27', '2021-03-16 16:01:27', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('49ed9841728c7a86827bf655b5e06bb7', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:23:25', '2021-04-10 09:23:25', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('4a211adc2b76218c289d1db3f51c2165', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:22:43', '2021-03-25 09:22:43', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('4a2a8a667afe575c2df6b6a5373fafe8', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-04-10 09:30:30', '2021-04-10 09:30:30', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('4a35cf8cc698670eb126ebd6fe540498', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:05:46', '2021-02-23 18:05:46', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('4a422279459f280758ca9ecac8eb5b4c', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-22 20:54:29', '2021-03-22 20:54:29', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('4aa41d3cf6ef90f543de7d2528d3e616', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '30', 1, '2020-12-12 10:35:12', '2020-12-12 10:35:12', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('4ace4611b3aa14be97edf360cb421e38', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2020-12-09 21:00:11', '2020-12-09 21:00:11', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('4af666f0a390adce36edd2351ecd9d89', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 10:25:54', '2021-04-10 10:25:54', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('4afd22727391a49691366dd20d858425', '6795d72d4b27b24e02acb38723ccc5d6', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-06-13 07:49:13', '2021-06-13 07:49:13', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('4b0eb972374ed2ea8e4e1ebfcb5a9558', 'b486735e7b914e366840d01f049306e4', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-22 08:47:55', '2020-11-22 08:47:55', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('4b19777c3afc9f7eb1480798383eec19', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 10:20:05', '2021-04-10 10:20:05', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('4b1ab609f1c13d7464cd42f02b05431a', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-18 23:45:07', '2021-01-18 23:45:07', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('4b27e7e395001a6088f49668069a07fa', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 18:18:53', '2021-02-23 18:18:53', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('4b3d3a197853ad90a8dd576355c3e3b0', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 20:39:47', '2021-04-09 20:39:47', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('4b68f92f6fa217fa58d9882e9e6c5a47', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-11 19:29:38', '2021-03-11 19:29:38', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('4b7ab186667033a872a0a935fa0f0463', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:18:17', '2021-04-10 09:18:17', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('4b9b4ba3c6624f0e4b44cf4fe0c61217', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, 'hello', 1, '2021-03-25 10:00:58', '2021-03-25 10:00:58', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('4bd0adca2079fe9cf8f717c97152c4dd', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-03-02 10:52:06', '2021-03-02 10:52:06', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('4c03c40668ffaa32fdf792397f32a55e', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2020年08月', 1, '2021-03-22 21:14:04', '2021-03-22 21:14:04', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('4c149d794e3051df0409f6c87cee3910', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:57:27', '2021-02-23 18:57:27', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('4c1f4795b867c97c1fb086fe546a7651', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2020-12-26 15:22:04', '2020-12-26 15:22:04', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('4c396d73ed24bf0226c91662cdcdf674', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-03-16 16:01:26', '2021-03-16 16:01:26', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('4c662921d3dd93ca4e5de1fa63b41005', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 19:12:58', '2021-02-23 19:12:58', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('4c6f3938f7b22d1843e7d1f45eb955eb', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '2', 1, '2021-01-24 09:29:10', '2021-01-24 09:29:10', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('4c798a23f290d09ef2a28645fb197a15', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:09:24', '2021-02-23 18:09:24', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('4c89d663c4c3b5589287990832988fdd', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 19:05:48', '2021-02-23 19:05:48', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('4cc5f39f3eee6f1d9a9723e6d0b374c9', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-11 19:25:16', '2021-03-11 19:25:16', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('4cfb51c4067dcf0273f1de2270241584', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '31', 1, '2020-12-12 10:39:18', '2020-12-12 10:39:18', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('4d270f1c1bd91815ccb8db4e7e2aa620', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:37:59', '2021-04-09 21:37:59', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('4d3e830c59d0b122224e2eb533484717', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2020-12-26 15:39:15', '2020-12-26 15:39:15', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('4d465656d8a8fb3d9525eed1ae7ae686', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-13 10:12:38', '2021-02-13 10:12:38', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('4d473a153a98588d6fdf400c2c764789', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2020年12月', 1, '2020-12-26 11:38:23', '2020-12-26 11:38:23', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('4d81dfd8b04326325e6641a2cce134f0', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2020年12月', 1, '2020-12-13 19:01:24', '2020-12-13 19:01:24', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('4d92e8224da40cf76ce614f02ffdaecb', NULL, '192.168.104.1', 'blog_content', NULL, NULL, 1, '2020-11-13 10:34:38', '2020-11-13 10:34:38', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('4db8ca8ef949a8d7b7b3660d00af8536', NULL, '192.168.104.1', 'visit_page', NULL, '关于我', 1, '2020-11-20 22:05:46', '2020-11-20 22:05:46', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('4de918f09fd17bab1a3b259f5780dc4e', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 11:27:07', '2021-04-11 11:27:07', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('4deb003a794407804201c9607e9dac17', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:07:29', '2021-04-12 09:07:29', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('4e1a4f429b124658d42b287ab04c6353', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-13 10:06:26', '2021-02-13 10:06:26', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('4e5800ef1cbca74b54186afa6f952c37', NULL, '192.168.104.1', 'blog_content', NULL, '8', 1, '2020-11-20 22:05:24', '2020-11-20 22:05:24', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('4e93f88b0a57f59eae2708a0a0880b81', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-14 23:18:58', '2021-01-14 23:18:58', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('4e963a77c5b402a383a956ecc48bc6df', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 13:09:10', '2021-02-27 13:09:10', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('4ea42430fa55ed49669bcd22a68a363e', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 15:01:54', '2021-02-23 15:01:54', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('4eb4795fe1c80d8e537ee857339d32c8', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 15:56:46', '2021-02-23 15:56:46', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('4ec45ae01b32fbd0ee8834e39c8a60a4', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-22 08:47:37', '2020-11-22 08:47:37', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('4ecfb86a648910ba9876e7ebbb0e0cb6', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-19 10:57:43', '2021-01-19 10:57:43', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('4ef4c74dc53918561e48e3c5d7106ab4', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-03-02 10:51:22', '2021-03-02 10:51:22', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('4eff9ed3c82dfd25de29905d908c8a55', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:11:56', '2021-04-12 09:11:56', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('4f263d395b2494c6e2bc56ef3c231329', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-09 20:48:06', '2020-12-09 20:48:06', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('4f5354f9c092e93b758ee3c583359b3b', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-24 09:40:32', '2021-01-24 09:40:32', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('4f825bb4a4a2daf954e334967132e97d', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-02 10:49:15', '2021-03-02 10:49:15', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('4fa701ab8284ffdf023c5c008c2f971f', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:14:11', '2021-03-25 09:14:11', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('4fadcd60ce5d12c71a057950d9317733', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-01-24 10:00:35', '2021-01-24 10:00:35', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('4feb38fcd6a413b652088a33a727de5f', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 19:05:07', '2021-02-23 19:05:07', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('505fba31b241a4fbfdb540c48f5542bb', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 10:59:47', '2021-04-11 10:59:47', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('5064b6cb7cb6c86a7c8ac462a008dd00', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-03-22 21:21:45', '2021-03-22 21:21:45', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('509fc4840b50bd48f765b4d949608c9b', '162ab0809537781ef9c1bf41e78391e9', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 22:23:16', '2020-11-17 22:23:16', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('50be57424722fb15c5a68402d6d2571e', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:21:55', '2021-02-23 18:21:55', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('50f0afa62f16211cb25d02d1e98bc3e5', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2020年12月', 1, '2021-03-02 10:51:35', '2021-03-02 10:51:35', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('510b6672dd2955120e91fa09219109e8', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 15:37:09', '2021-02-23 15:37:09', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('5110533af758cdc099981b8b0f237701', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 18:23:36', '2021-02-23 18:23:36', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('5139a781b8b9ec4ae4d70b0444ca3b62', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '测试7', 1, '2020-12-26 15:32:21', '2020-12-26 15:32:21', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('5151a0654256800f6d68cdd33238946c', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 20:42:55', '2021-04-09 20:42:55', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('515a42a48639a35a8db3af11ef4d4507', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-02 10:55:36', '2021-03-02 10:55:36', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('518364c8b0f3128012838b120a9741da', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-13 09:25:31', '2020-11-13 09:25:31', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('51b9a49113c6a5b5e6068116a1661754', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 19:48:00', '2020-12-04 19:48:00', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('51be2142cf62270f94f63acc874b3bab', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:40:32', '2021-03-25 09:40:32', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('51d84387404a122a84278d54555b6135', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-27 13:14:34', '2021-02-27 13:14:34', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('520013add670e026270ecb064dc3683b', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, 'hello', 1, '2020-12-31 20:01:39', '2020-12-31 20:01:39', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('523529195a5f68a19d1cf6b500e450da', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-02 11:25:31', '2021-03-02 11:25:31', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('52454b3ada1e29ee256ab0dba5a9fb7c', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-27 13:16:28', '2021-02-27 13:16:28', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('52688373bf5eb2073811a6854c9c6381', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-11 18:45:24', '2020-11-11 18:45:24', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('527669342979867aebf26bf2d18ee4f9', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2020年12月', 1, '2020-12-26 15:22:06', '2020-12-26 15:22:06', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('52ccd384a444f008e63723a9fe4c376d', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-02 15:27:37', '2021-01-02 15:27:37', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('5302e3cc96743565a6864c91c492762c', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 17:17:12', '2021-04-09 17:17:12', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('53144243e0d07e72dbf9a6717f61bb96', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-28 21:06:45', '2021-02-28 21:06:45', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('5352e165a24a4d180dd2f84a1d63c9c4', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 13:13:22', '2021-02-27 13:13:22', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('5364198cf708459ea3b320a3cb271d49', '1', '', 'admin_auth', NULL, NULL, 1, '2022-12-08 10:05:29', '2022-12-08 10:05:29', 'UnKnown, More-Info: PostmanRuntime/7.29.0', 'PostmanRuntime/7.29.0', NULL);
INSERT INTO `t_web_visit` VALUES ('53a7c798bdc236540bc5262e1f4288c2', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 16:45:55', '2021-04-12 16:45:55', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('53dba1fb4ec1e4fe6be1c31a12cbcdc0', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-13 10:34:35', '2020-11-13 10:34:35', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('54027169a00d76febedd9796e7a6f8a2', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 15:11:54', '2021-02-23 15:11:54', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('540d723a6b08eb4e5e796d2bfd13a5d1', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 19:05:32', '2021-02-23 19:05:32', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('5466d1429272e55572e34da34231f791', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-21 08:22:01', '2020-11-21 08:22:01', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('5478a06b92fde15c9c3cc97dc23b30e8', NULL, '192.168.104.1', 'blog_content', NULL, '8', 1, '2020-12-04 16:34:06', '2020-12-04 16:34:06', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('54ab6921fd2917f0c45d4f3e411b20f3', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '30', 1, '2020-12-12 10:44:07', '2020-12-12 10:44:07', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('54c8b590c32ae4a97c40f98e3f359857', NULL, '192.168.104.1', 'blog_content', NULL, NULL, 1, '2020-11-19 17:07:20', '2020-11-19 17:07:20', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('54e53252872da872e53feb50341970b2', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:44:33', '2021-04-12 09:44:33', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('54f9fe127b6d7e841a09ea98a43ecbea', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:19:06', '2021-03-25 09:19:06', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('5532bb8f136a822fce557159d79e8a1f', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:18:47', '2021-04-10 09:18:47', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('5559ad92cd524e7a20de3ce82a2c360d', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-03-25 10:01:25', '2021-03-25 10:01:25', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('556b7ce84dad77f50ab34b675309ffac', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-23 19:12:02', '2021-02-23 19:12:02', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('55ac44a42f41b3d513574b6ce2f019e4', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:53:37', '2021-04-10 09:53:37', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('55d81b307e93f577db908964be3c05e7', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 10:24:18', '2021-04-12 10:24:18', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('55e1b54324616f68f019ac545d6f1803', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:41:22', '2021-03-24 21:41:22', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('5619eaff9fd074a9e0baa858131d24cb', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '测试6', 1, '2020-12-26 15:32:17', '2020-12-26 15:32:17', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('561d9fe6d09788fd72143fbd2788e436', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 18:56:03', '2021-04-09 18:56:03', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('56333ce29a662434baa6057964ac5b8f', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-05 09:28:22', '2020-12-05 09:28:22', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('56448b00fbd414fbd668acd44cf202cf', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2020-12-26 10:59:32', '2020-12-26 10:59:32', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('566a01b424b3284c48fe75be0c55f4f0', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:02:54', '2021-02-23 16:02:54', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('567a4bad5cd583164dba2e0340d835ee', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '57', 1, '2021-04-12 16:45:58', '2021-04-12 16:45:58', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('569b9cad905f05b2a16666438db2052a', '5eb5257f707cad9c6f06a1e951ba2def', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-09 09:22:27', '2020-11-09 09:22:27', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('56d4e8a78d11a9ae7aff509aa92ad6fc', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, 'hello', 1, '2021-03-25 10:00:48', '2021-03-25 10:00:48', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('5706da47587ff6685ea837037735919d', NULL, '192.168.104.1', 'blog_content', '062ca3475e8193a4a81853a4bf41a8fa', NULL, 1, '2020-11-13 09:25:15', '2020-11-13 09:25:15', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('5707446458c3c2c4ce88d8dd46745ba9', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 11:25:19', '2021-04-11 11:25:19', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('57669ca5902f89b00d58aa8318d66788', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-03-11 19:29:42', '2021-03-11 19:29:42', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('577240166e189941f231326dffa05dc3', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 19:12:49', '2021-02-23 19:12:49', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('578c843900f5b88914e20c7df605943a', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 19:12:02', '2021-02-23 19:12:02', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('578d57d2a0f1de4f46b5c4521a1b3bf7', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年04月', 1, '2021-04-10 09:30:35', '2021-04-10 09:30:35', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('578f36c5f0c165267a32675d62d7c915', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:51:01', '2021-03-25 09:51:01', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('57d10cfd0e4254a7f029b4d3179c3c39', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:41:02', '2021-04-09 21:41:02', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('581d091b38e2fda6384512097bd238cf', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-24 21:41:15', '2021-03-24 21:41:15', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('586d531ec94ba42e39a7886ea2e095de', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-22 16:26:20', '2021-02-22 16:26:20', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('589449ab61733ae960431c915fb23716', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-12 09:03:10', '2021-02-12 09:03:10', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('59135313ba1d90d8b15d4e30758833c3', 'a8f8248f6ad406300390b2c6fee472a9', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '小明hello', 1, '2021-03-25 10:00:14', '2021-03-25 10:00:14', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('5924f8bc59c5b2a1a72e82e6107b65db', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 15:29:53', '2021-02-23 15:29:53', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('593b9fd360e3864f4706703a9689ecf7', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-03-25 10:01:35', '2021-03-25 10:01:35', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('5961d6826cae29ecad05538c541cd469', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-27 13:14:21', '2021-02-27 13:14:21', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('597595a270586bdcf7e224f601395d15', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 16:57:26', '2021-04-11 16:57:26', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('5995adf4be16df4349e8c304deb5f0aa', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:19:29', '2021-03-25 09:19:29', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('599d1202d1076544a5efdbf478272a08', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 16:08:11', '2021-02-23 16:08:11', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('59aad74d1f898544ffcc6a889cb6c4e0', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-27 13:14:37', '2021-02-27 13:14:37', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('59d1d473babaefb8a8df56885278a58c', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-08 22:21:04', '2020-11-08 22:21:04', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('59f3903ee1aaa892cb36e4507e2fad06', NULL, '192.168.104.1', 'blog_praise', '635fc430e3378403a7d3f1e2a4e726a9', NULL, 1, '2020-11-14 08:38:17', '2020-11-14 08:38:17', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('59f538ebe38dd2910e6303e10e5c594a', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '30', 1, '2020-12-12 10:39:42', '2020-12-12 10:39:42', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('59f5ba21a116759418157b93ba3431ac', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '31', 1, '2020-12-09 21:08:58', '2020-12-09 21:08:58', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('5a26202fdadac2d829382e5d891122c4', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '45', 1, '2021-04-09 20:38:12', '2021-04-09 20:38:12', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('5a4c3df2d19bd8506cfbe08cc3a9617e', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 10:29:19', '2021-04-12 10:29:19', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('5a52a41d43de72273cef492e46b7502b', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-03-04 19:12:21', '2021-03-04 19:12:21', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('5a71d02a8eb85c5cb438e58b6d1926e3', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 20:36:12', '2021-04-09 20:36:12', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('5a8c9c75063b74714b3b4a29388e76ba', '6795d72d4b27b24e02acb38723ccc5d6', '0:0:0:0:0:0:0:1', 'blog_tag', '7e0e93ea6cdb44ae92e58f48e6496ed7', NULL, 1, '2021-06-13 07:47:58', '2021-06-13 07:47:58', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('5a9d17524b48ed67a5dc269debd94b0a', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 13:13:15', '2021-02-27 13:13:15', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('5ae8baecc2c8104d7ddbffc9493f9cdd', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 17:05:21', '2021-02-23 17:05:21', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('5b0eb5be84d0fc9a6ec9b77c5fd04b42', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:51:06', '2021-02-23 16:51:06', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('5b2077dcd9bf0faca4eef28ddfa01d6e', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-13 10:12:45', '2020-11-13 10:12:45', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('5b2bd4b294ef60a37afcd1a3ae59423a', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 10:38:22', '2021-04-11 10:38:22', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('5b71f3b65006412ff127b9f5038b6e49', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:50:47', '2021-03-24 21:50:47', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('5b72716df848a4f253bc4943065fed85', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:08:20', '2021-04-12 09:08:20', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('5b7a6fc54c2fb2dfa02820a1bf6d4e70', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-22 10:46:29', '2021-02-22 10:46:29', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('5ba72763ffbfcc9f701e9913985034d1', NULL, '192.168.104.1', 'visit_classify', '337806254f9c42999043de5c5ee09e77', NULL, 1, '2020-11-20 22:06:10', '2020-11-20 22:06:10', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('5bd403cbff55031baf6a76ca2bf85b22', '3c61610e3f04833f5d91084beb42166a', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 21:49:55', '2020-11-17 21:49:55', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('5bd6cb196babd1c418d1256e07fd67e0', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 15:52:01', '2021-04-11 15:52:01', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('5c0ef158c0f2b713a8c83725772deb5b', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 15:29:26', '2021-02-23 15:29:26', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('5c403bedd3935fa8b00235021b15ba8b', 'f6ac7f1cee33a0c4652a7396a1767368', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-04-09 18:39:22', '2021-04-09 18:39:22', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('5c5aef029d038d25de9480d7056c2a93', NULL, '192.168.104.1', 'blog_content', 'e247932bf5f883ad3699144a00318a4b', NULL, 1, '2020-11-08 22:21:17', '2020-11-08 22:21:17', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('5c7bc06af9d934bc40a29494a6daac0f', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '49', 1, '2021-04-09 20:49:18', '2021-04-09 20:49:18', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('5cc01bc864d5f5f1c1ed605b68dd9956', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 15:40:33', '2021-02-23 15:40:33', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('5cc66fdd97133db14393d6d79be4e473', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-28 21:06:26', '2021-02-28 21:06:26', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('5d16958d567989c276ef97f591a00f31', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-08 16:17:54', '2020-12-08 16:17:54', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('5d1906624ad1af6fbc0e0bf53ebb6011', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '你很好', 1, '2020-12-26 15:28:25', '2020-12-26 15:28:25', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('5d4197609fa88b3ccc5b4aa88304cdaa', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 15:11:51', '2021-02-23 15:11:51', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('5d6b681ebdee1f6bd431218bd342118d', NULL, '192.168.104.1', 'blog_content', '34eb1b938fa734a52ce0f18a1b849685', NULL, 1, '2020-11-08 22:21:06', '2020-11-08 22:21:06', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('5d71cb3007dd6ab6ffe911eb2f11320b', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 16:48:02', '2021-02-23 16:48:02', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('5dc5a346600df1773a963fb8f3ca2976', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-04 19:04:48', '2021-03-04 19:04:48', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('5de02f1419b295ab453296c53f1a7e19', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 16:52:54', '2021-04-11 16:52:54', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('5dfb96ca270cb187bda151bea452180d', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:56:02', '2021-03-25 09:56:02', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('5e295723d968b3a02973ebcec11d5da6', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '31', 1, '2020-12-12 10:46:16', '2020-12-12 10:46:16', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('5e435bfbc2070cadf025c83c92abcbd5', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 10:52:30', '2021-04-11 10:52:30', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('5e61ec934b2fce3f4c214412ae6bada0', NULL, '192.168.104.1', 'blog_content', NULL, NULL, 1, '2020-11-19 16:10:31', '2020-11-19 16:10:31', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('5e61f0b9f870de0efafe4dde0ab85be6', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 15:25:37', '2021-02-23 15:25:37', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('5e84a553f58bff0f543d11506f1ec4f6', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-28 21:07:12', '2021-02-28 21:07:12', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('5eb5142cbe758a730600b0f591d732c5', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 20:38:54', '2021-04-09 20:38:54', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('5ecd6367dd1ddf6ceed0c9adcd4942a7', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:54:52', '2021-03-25 09:54:52', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('5f19e66b61687635dec8da6bfd070718', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:18:47', '2021-02-23 18:18:47', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('5f1a14e3672688ed9353df167f5e33fb', NULL, '192.168.104.1', 'blog_content', 'c58083675437f407d73d3322ca01b995', NULL, 1, '2020-11-13 09:21:21', '2020-11-13 09:21:21', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('5f1b6326ff0dcacba9110ce3cbb29502', NULL, '192.168.104.1', 'visit_page', NULL, '关于我', 1, '2020-12-04 16:17:25', '2020-12-04 16:17:25', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('5f32be7e42de88bf2ecb73cfcff3dd56', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 21:47:11', '2021-01-15 21:47:11', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('5f76b727d8f8b7a902f4dec48cf86927', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '测试评论4', 1, '2020-12-26 15:28:16', '2020-12-26 15:28:16', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('5fa004855918f582a76667ee0b30cd4a', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-28 21:06:25', '2021-02-28 21:06:25', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('5fddebcedf536a0d5180ff1ab47d28dd', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 17:23:11', '2020-12-04 17:23:11', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('5fe35b1962e192c11d642b4cc90a436c', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '58', 1, '2021-04-12 16:48:18', '2021-04-12 16:48:18', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('6014a7249f6a2811d134551f86fd58eb', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 10:59:46', '2021-04-11 10:59:46', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('6022dd591ab37efd013a0d933c5c859a', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, 'http://www.baidu.com\n', 1, '2021-02-28 21:32:13', '2021-02-28 21:32:13', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('6043dc9de16ebd7b606162435d8b009a', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:51:27', '2021-02-23 16:51:27', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('609075ed2ea3b555e9db81668adff474', '707a054d97a36fec69a83ee7ff500e97', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 22:36:12', '2020-11-17 22:36:12', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('6098131399c113aa1eb5ef8c62dcdfa2', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 18:19:50', '2021-02-23 18:19:50', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('60de4258019e04cc59fc7e3f89e83385', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 12:40:04', '2021-02-27 12:40:04', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('60f2894032ee874f602863eafdbee296', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-04 19:03:14', '2021-03-04 19:03:14', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('60f6c78f3ff417d0de57a79bc2d3782b', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 10:46:30', '2021-04-12 10:46:30', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('60f8b53ebf3f3553e913a44d56daaf09', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '测试9', 1, '2021-01-07 09:22:48', '2021-01-07 09:22:48', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('61331c5378bb121dc03fe2214c18492f', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 13:12:18', '2021-02-27 13:12:18', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('613fbb06432be175153f25e3a8784245', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:57:50', '2021-02-23 16:57:50', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('6168646eb59db6cbeaf1e0e56ddef371', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '测试11', 1, '2021-01-07 10:08:53', '2021-01-07 10:08:53', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('619568ea366f249c4c07855ddf30ab25', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 18:06:23', '2021-02-23 18:06:23', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('619c1ba77ee3c1fc9264d458b2596dbc', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-11 19:22:42', '2021-03-11 19:22:42', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('61b156714b7a351e68f3cd5fef45b5cc', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:05:58', '2021-02-23 18:05:58', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('61c816948657757fa6e7bc1370f3c5c8', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '30', 1, '2020-12-12 10:38:04', '2020-12-12 10:38:04', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('61d171af4517a435cf5fb42670fa6de9', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-22 21:26:43', '2021-03-22 21:26:43', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('61ed6279b8733138d78d08401261ead8', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 18:04:06', '2021-02-23 18:04:06', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('61f52525eefe489d459ce4df695fcdd7', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 20:43:11', '2021-04-09 20:43:11', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('61fda133e2be12c52678affdad363db3', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-12 10:36:43', '2020-12-12 10:36:43', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('6273f2292e0bb550f8b364f3b14d62e3', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:51:22', '2021-02-23 16:51:22', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('629675946fbd2429c1ac16d8b106d889', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '30', 1, '2020-12-12 10:46:23', '2020-12-12 10:46:23', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('6296ee7247a689c02a183266e1395968', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '15721a34adba068763b5a2fb1991fc57', NULL, 1, '2020-12-26 11:24:32', '2020-12-26 11:24:32', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('62b7e04b0387a428667230f72f95e39b', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-01-28 23:18:27', '2021-01-28 23:18:27', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('62eb30e860f04a1e3232611400390f42', NULL, '127.0.0.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 22:56:27', '2020-12-04 22:56:27', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('62f8e316e1831a1494627a72ea1a6c5b', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 13:09:18', '2021-02-27 13:09:18', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('635a97b40ebef93f369b25602a358924', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-01-28 23:18:31', '2021-01-28 23:18:31', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('6372b437398017ffa44f2ec076d06232', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-03-04 19:14:40', '2021-03-04 19:14:40', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('63821256e3b85c979e1ce0251fb956da', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:03:19', '2021-02-23 16:03:19', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('63ae9aadc5fd758d4162be567cc37de4', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-26 15:37:24', '2020-12-26 15:37:24', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('63e687d60c2f02eda1303c141d8178fe', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '45', 1, '2021-04-09 20:42:58', '2021-04-09 20:42:58', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('63f2051a8fabd399f8b94951e7bcc57e', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '2', 1, '2020-12-26 16:06:23', '2020-12-26 16:06:23', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('641d81cf1ed3d4f9e30eaafdb1310bcb', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '19', 1, '2020-12-26 16:01:52', '2020-12-26 16:01:52', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('64430ead1205079a60e14283557ea33c', NULL, '192.168.104.1', 'blog_content', NULL, NULL, 1, '2020-11-13 10:54:08', '2020-11-13 10:54:08', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('644c5b9c6b787076092e5625dc72ed87', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 11:28:25', '2021-04-12 11:28:25', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('64d31412ecc6d5410dc747a7f3ad862f', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-19 15:12:15', '2020-11-19 15:12:15', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('64d925fd0634cdc10f9fec6d1db1a10b', NULL, '192.168.104.1', 'blog_content', 'undefined', NULL, 1, '2020-11-08 22:20:13', '2020-11-08 22:20:13', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('64de794e702274c9f1099ea0c2d969c3', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 15:29:57', '2021-02-23 15:29:57', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('6510850faf78e945825ae9ef90319303', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-03-22 21:21:39', '2021-03-22 21:21:39', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('652c74073b6d4fe3d16f17c2e43f0fad', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:48:22', '2021-03-25 09:48:22', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('6561fb9f63c6a477178cb0d132b825ab', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2020年12月', 1, '2021-01-02 16:07:29', '2021-01-02 16:07:29', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('656f8686eebe2c1e09372b244473d7f2', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:18:00', '2021-04-09 21:18:00', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('6584a8e06d7fc94ed84a144f1266da12', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '测试3', 1, '2020-12-26 15:32:07', '2020-12-26 15:32:07', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('65c7d92cc5d691518d24c72d13e56741', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-04 19:04:10', '2021-03-04 19:04:10', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('65cb624860275e9671abc6edcd11fa6f', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-11 19:18:36', '2021-03-11 19:18:36', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('65f58f00d019d83883381f6d6c6b55bb', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 16:55:38', '2021-02-23 16:55:38', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('6668091d425b2a386443ef828fb5c39f', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-19 12:27:28', '2021-02-19 12:27:28', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('6670118ec5d8b7b589a84d3fac08a418', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:40:54', '2021-02-23 18:40:54', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('66737f15a71bf4e1d9e00aaf3931c94f', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:52:27', '2021-03-24 21:52:27', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('6684ea61aceaa80fe885503be62c9f2f', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:04:10', '2021-02-23 18:04:10', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('66917ff1266f85f49532dc4e87fa5a39', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:38:03', '2021-02-23 18:38:03', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('66adc58042f50a8527025dd8e94045a7', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:19:35', '2021-02-23 18:19:35', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('66d4346db42f03174488c7ccc13d273a', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 10:57:27', '2021-04-11 10:57:27', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('66f83f0c4ab925431efd8b4804d31b04', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-24 09:45:24', '2021-01-24 09:45:24', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('6731d16965400a2611a5048320f17c71', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 08:55:36', '2021-04-10 08:55:36', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('67399763e1fc4beb6c5608c44a7a1a1d', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-01-24 10:00:49', '2021-01-24 10:00:49', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('674aebe68b63c1f17446e2d78098060e', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 10:09:46', '2021-04-12 10:09:46', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('676a2d4887e7f00eed57d90c6b62bb5c', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-27 12:40:10', '2021-02-27 12:40:10', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('678155e29418c9c94bc5a49ece17d071', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '13', 1, '2021-01-24 09:29:59', '2021-01-24 09:29:59', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('6786855690f4025a35575a9517ee42d3', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 11:29:52', '2021-04-12 11:29:52', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('679933bf5958b0996854d2dc1f0bf25a', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 17:05:23', '2021-02-23 17:05:23', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('67ad8dac6f547dc2a5288f276faebe02', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-05 16:42:35', '2020-12-05 16:42:35', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('67aec28450abdee9208e18118accf74d', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:12:51', '2021-04-10 09:12:51', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('67c740408ca41f2cc344fd897620d3f2', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 21:42:55', '2021-01-15 21:42:55', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('681364f5d708526caa33e29c3286db0e', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-11 18:46:06', '2021-03-11 18:46:06', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('684d5b7436418f08c68586def2352616', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-04 19:14:37', '2021-03-04 19:14:37', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('6850fe3a087a073620119e3eb560759c', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 19:47:43', '2020-12-04 19:47:43', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('6874a5e69f0168a7f25fcf6264130d41', NULL, '192.168.104.1', 'blog_content', NULL, NULL, 1, '2020-11-19 17:09:11', '2020-11-19 17:09:11', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('687dc2233036cf6e6ddba91a93f163a3', '939e48c0b3d27ade7f654a113c729976', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 22:50:39', '2020-11-17 22:50:39', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('68a778cb2053e436b6589052ed94028e', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-04-09 18:55:49', '2021-04-09 18:55:49', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('68be936b5e7debef0f746bc4a9a05cc3', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:38:24', '2021-03-25 09:38:24', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('68c4b20015e90cb1cc7d43db0cb65547', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2020-12-31 20:03:58', '2020-12-31 20:03:58', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('68cfe56497c5a6ae0dfb75b2c8d71e62', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-01-07 10:28:57', '2021-01-07 10:28:57', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('68e0ec124ee1b90444eb21463cf72841', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 10:44:25', '2021-04-12 10:44:25', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('6903909cb03a69095b087ad947e1dcfb', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '测试10', 1, '2021-01-07 10:05:46', '2021-01-07 10:05:46', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('690ea24b9ea27e036e90044d8bb818f6', NULL, '192.168.104.1', 'visit_page', NULL, '关于我', 1, '2020-12-04 19:46:30', '2020-12-04 19:46:30', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('69298bb8b80e3bee9eb7be544754d591', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 17:01:43', '2021-04-11 17:01:43', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('695a6749d43afba86cbdb6f61a8b86b4', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-28 23:10:13', '2021-01-28 23:10:13', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('6977919a2270a3287e18be02e86c277c', NULL, '192.168.104.1', 'blog_content', '34eb1b938fa734a52ce0f18a1b849685', NULL, 1, '2020-11-08 22:20:33', '2020-11-08 22:20:33', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('697e8f0cc92d83a87b40cdef7d30228e', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '11', 1, '2021-02-07 12:57:17', '2021-02-07 12:57:17', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('698826548f03ceadd7c3855dfd36dd38', 'f6ac7f1cee33a0c4652a7396a1767368', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-04-09 18:39:24', '2021-04-09 18:39:24', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('698b733e637b17bcb25e216fb077df9e', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 19:04:20', '2021-02-23 19:04:20', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('69be1a658f8744f9bf0f7292205eec1e', NULL, '192.168.104.1', 'blog_praise', '635fc430e3378403a7d3f1e2a4e726a9', NULL, 1, '2020-11-14 08:38:16', '2020-11-14 08:38:16', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('69db63ec430847398f412979ca65ea58', '1', '', 'admin_auth', NULL, NULL, 1, '2022-12-09 10:05:31', '2022-12-09 10:05:31', 'UnKnown, More-Info: PostmanRuntime/7.29.0', 'PostmanRuntime/7.29.0', NULL);
INSERT INTO `t_web_visit` VALUES ('69f1c2f38df6a514cf7e685472d3c24a', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-01-02 16:07:19', '2021-01-02 16:07:19', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('69f6455e3cd2ce3deb08e93e078426cd', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:29:26', '2021-02-23 16:29:26', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('6a0c932f7c0938471b7c21ba116cc0b5', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '52', 1, '2021-04-12 15:42:45', '2021-04-12 15:42:45', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('6a659c29e1e082d03aaf68f5ce8e936b', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-02 10:41:04', '2021-03-02 10:41:04', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('6a71111329b1e85b0f881faf373ddb6e', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2020-12-09 21:00:12', '2020-12-09 21:00:12', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('6a79f3f8349e671a5840a47a7c10d399', NULL, '192.168.104.1', 'blog_content', NULL, '8', 1, '2020-12-04 16:29:19', '2020-12-04 16:29:19', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('6a7bac8233418e90397f3e5175a6dffa', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:38:12', '2021-04-10 09:38:12', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('6a98d6f0f197910ddb320b15d96f2a2e', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:47:15', '2021-02-23 16:47:15', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('6af251591cc5e10a77c94ccd9d1556d3', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-09 09:30:23', '2020-11-09 09:30:23', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('6b1116eaeed0b107a7b15ada4a9a3034', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:07:33', '2021-02-23 18:07:33', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('6b1873d36c89275e904bd74b92062a35', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', '32945390483577a0309fe72ee4425870', NULL, 1, '2021-04-12 11:26:34', '2021-04-12 11:26:34', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('6b18b0736d657c204d9ac62fab95f56d', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:08:54', '2021-02-23 18:08:54', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('6b1b241c1e666cbab954a278e7e58436', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 16:39:07', '2021-04-11 16:39:07', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('6b2f13a9543f0fcd66589a2fbf0fee67', NULL, '192.168.104.1', 'blog_content', NULL, NULL, 1, '2020-11-13 09:35:25', '2020-11-13 09:35:25', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('6b4282b587b8d6de1a3b984e5b2c9f32', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-08 22:20:12', '2020-11-08 22:20:12', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('6b761d0fc0311337ee426d8b66a1dff7', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-18 21:53:32', '2021-02-18 21:53:32', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('6b86a25f3b142bb2b820928ef6a7da36', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-22 16:24:35', '2021-02-22 16:24:35', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('6bc3ad4908e6e041aa15ebe18dc79d12', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-27 13:16:00', '2021-02-27 13:16:00', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('6bcc0168910a0294ccc8e0b8a318866a', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 10:15:39', '2021-01-15 10:15:39', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('6bf0dab07d3afb3b820e41352c26affc', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-27 13:14:20', '2021-02-27 13:14:20', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('6bf250bd1fb937c109659e4e6be08013', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:51:28', '2021-02-23 16:51:28', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('6c0612a024bd6b3d4ecd87edece67953', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-03-02 10:52:43', '2021-03-02 10:52:43', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('6c101de8613da84f4c240ad01f313b55', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '啦啦啦', 1, '2021-03-25 10:01:03', '2021-03-25 10:01:03', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('6c21969e81e644e00554d59e8949c70a', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-23 18:19:37', '2021-02-23 18:19:37', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('6c2c7290fd4ba281cea71bc5414567fa', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-27 12:40:12', '2021-02-27 12:40:12', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('6c45c3e4451a400241d225b94b988aae', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2020年08月', 1, '2021-03-22 21:27:00', '2021-03-22 21:27:00', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('6c76b665aed19e074df1a509bbeb6c68', '939e48c0b3d27ade7f654a113c729976', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 22:48:33', '2020-11-17 22:48:33', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('6d4ff3457e43bb0c987989dcf90baa3e', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 19:12:49', '2021-02-23 19:12:49', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('6dceef112dff4995f9f6722d9f92f7c7', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 18:56:02', '2021-04-09 18:56:02', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('6dd255277aa08f2ead18e1b9951feda8', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:10:30', '2021-02-23 18:10:30', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('6e181091dfca2a527f350075b364ba61', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-13 10:24:16', '2021-02-13 10:24:16', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('6e2847e1562c8243244947f4b72c80c3', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, 'hello', 1, '2020-12-31 19:58:41', '2020-12-31 19:58:41', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('6e37de0e30957480283feb95e776ee40', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 15:58:46', '2021-02-23 15:58:46', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('6e3ae53685a03bc7cd47b1da81b55e68', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-21 08:13:41', '2020-11-21 08:13:41', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('6e44cbe7647de4b595e3f46763b17a87', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 10:44:36', '2021-04-11 10:44:36', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('6e688ce75d9ee4ba3c23de4355fe2ff0', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-04 19:14:39', '2021-03-04 19:14:39', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('6e7b407505a0d4474ff76303de9772ca', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-07 09:22:06', '2021-01-07 09:22:06', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('6e7e6c80a0bdd53e4e3c86b27c3b2280', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 10:03:33', '2021-01-15 10:03:33', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('6eafe47f01a6d3ae12f082bf80564c69', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:23:20', '2021-03-25 09:23:20', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('6f11b4a5661097acc246c11da3aeb6d4', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 16:10:19', '2020-12-04 16:10:19', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('6f523e3040624a83a6af202155187249', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 16:13:12', '2021-04-12 16:13:12', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('6f79ef95a2b2af53036704d5ae1208f4', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-03-02 10:52:38', '2021-03-02 10:52:38', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('6f83a1c7a11ebf664332bdab7b3c5ff2', '3c61610e3f04833f5d91084beb42166a', '192.168.104.1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2020-11-17 21:50:02', '2020-11-17 21:50:02', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('6fb9f78ef720bd48cd867af23e25d4e3', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-03-25 09:26:49', '2021-03-25 09:26:49', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('6fc6329eaf307c526f94243c5d8674b7', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-22 21:16:59', '2021-03-22 21:16:59', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('6fe4f8e9ea782866512006bb860fc236', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:42:20', '2021-04-10 09:42:20', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('6fea42e13dda20829702020fea75691d', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:42:09', '2021-04-09 21:42:09', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('7008f50ab33ffe697d0f803026915d76', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '30', 1, '2020-12-12 10:35:48', '2020-12-12 10:35:48', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('700c19d1b8460bcd562b03030ef20d48', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2020年08月', 1, '2021-03-22 21:26:45', '2021-03-22 21:26:45', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('702208c122e31f6acf2f9bc9e10c0090', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 13:09:08', '2021-02-27 13:09:08', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('7028d665902ee1ae1a20a96ccba371d4', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-11 19:29:39', '2021-03-11 19:29:39', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('709790ea181104fd458ab2495b1cce35', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 10:19:31', '2021-01-15 10:19:31', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('70a2366f5a804f37a5a8d27ae2a98c14', '1', '', 'admin_auth', NULL, NULL, 1, '2022-12-12 09:51:09', '2022-12-12 09:51:09', 'Windows', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', NULL);
INSERT INTO `t_web_visit` VALUES ('70abd26723718367071a43cc6b2d3d9b', '6795d72d4b27b24e02acb38723ccc5d6', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-06-13 07:48:09', '2021-06-13 07:48:09', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('70bfb938639ef0cc6a5579178faf934e', '6795d72d4b27b24e02acb38723ccc5d6', '0:0:0:0:0:0:0:1', 'visit_classify', '337806254f9c42999043de5c5ee09e77', NULL, 1, '2021-06-13 07:48:17', '2021-06-13 07:48:17', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('70e601b4a60a048ef9da1e68010401d9', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 15:19:38', '2021-04-11 15:19:38', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('711315a3e7071db43f03180df5a8b38d', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:26:25', '2021-03-25 09:26:25', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('711beff95602bac625ca4dbf50222d4a', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 15:29:24', '2021-02-23 15:29:24', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('711f7cc0192d58a7354c2c3acebe4050', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 16:44:57', '2021-02-23 16:44:57', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('717475ca0dc20072bf5671005f8e90ce', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-22 20:43:50', '2021-03-22 20:43:50', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('7176f95956a96d00e1258422b1f095c5', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 16:20:45', '2021-04-12 16:20:45', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('71b4e7ea2e0e161fc7a6dff3eca7b91a', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-11 19:18:17', '2021-03-11 19:18:17', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('726fdf00e22771ca56c0757d3a2941c2', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 19:12:07', '2021-02-23 19:12:07', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('7271a5548478c6e99e75692abee09268', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 17:19:39', '2021-02-23 17:19:39', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('72c0897a51d44a7280801c87da637c66', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 14:36:17', '2021-02-23 14:36:17', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('72c64a727d125dbb965dc7955362da2c', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 21:47:06', '2021-01-15 21:47:06', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('73016f5bae4dc59940df2ca771e8d3b5', NULL, '192.168.104.1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2020-11-13 10:13:56', '2020-11-13 10:13:56', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('730dc795a3a5483795934bd0329b90aa', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-04-09 18:55:48', '2021-04-09 18:55:48', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('7311280109c97e6827f222a240fb9a53', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 15:30:06', '2021-02-23 15:30:06', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('7338c07029975b14882b86a4c7e07000', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:17:45', '2021-02-23 18:17:45', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('734fc0b6cbbf7c8e1061b2774d7ffca1', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:05:58', '2021-02-23 16:05:58', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('7355402772f1da9f6df9a2a07206497f', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '52', 1, '2021-04-12 16:13:07', '2021-04-12 16:13:07', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('73581eb95ee629339c21b20b9a9d7ce9', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '30', 1, '2020-12-12 10:36:50', '2020-12-12 10:36:50', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('737dc1492adf014f7151eaac582e6bc0', '6795d72d4b27b24e02acb38723ccc5d6', '0:0:0:0:0:0:0:1', 'visit_classify', 'ca28ffc94ea94fbda5571e0b242021e2', NULL, 1, '2021-06-13 07:48:18', '2021-06-13 07:48:18', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('7385b5ef129bea357ba05e6acdb81ea3', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-11 19:24:33', '2021-03-11 19:24:33', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('739154c62539fee2ee3c2f0cd7576bc0', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-22 20:42:39', '2021-03-22 20:42:39', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('739c3e47b5f3deac94ca02aa403704bb', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-01 21:50:03', '2020-12-01 21:50:03', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('73d35da567b51cc7cf87eb72714cb36f', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-13 09:23:43', '2020-11-13 09:23:43', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('740e51a923524ca6ab498dcffc1fcfe9', '1', '', 'admin_auth', NULL, NULL, 1, '2022-12-11 10:05:32', '2022-12-11 10:05:32', 'UnKnown, More-Info: PostmanRuntime/7.29.0', 'PostmanRuntime/7.29.0', NULL);
INSERT INTO `t_web_visit` VALUES ('7410be1234ccc80ebdf61ea6407fb7fc', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:57:31', '2021-02-23 18:57:31', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('74176bf8eef2d25f5ed8eea1ccb5d089', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '你好呀', 1, '2020-12-26 15:28:21', '2020-12-26 15:28:21', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('7428a62ff622c83be21879394f0bf349', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:51:26', '2021-02-23 16:51:26', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('745f71d93641ae14fc3019d98179e334', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 20:11:00', '2020-12-04 20:11:00', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('748e2bf4eef696b16406e8f11cb15ee7', 'b486735e7b914e366840d01f049306e4', '192.168.104.1', 'blog_praise', '635fc430e3378403a7d3f1e2a4e726a9', NULL, 1, '2020-11-22 08:47:43', '2020-11-22 08:47:43', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('74aedc08d183a5aa2d89f8210e938fd3', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2020-12-12 11:02:42', '2020-12-12 11:02:42', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('74dac573e568c8703bb14bb18f5ded98', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '45', 1, '2021-02-27 13:16:46', '2021-02-27 13:16:46', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('74e9dd6fa81cb8e7d235f0446f5582a0', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '31', 1, '2020-12-12 10:42:26', '2020-12-12 10:42:26', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('74ece01aa4111f9e337cdf6089ed4927', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-13 09:05:12', '2020-11-13 09:05:12', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('751131cb87cf9d9338b6ef66cc637d1b', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 20:56:23', '2021-04-09 20:56:23', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('751c43e096bf2cce70352e88e6d086e6', '7ca8e7ceb152bfd834e15365b4b96767', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 19:53:48', '2020-12-04 19:53:48', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('75767ef382a31e115ab822a44f31ac44', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-04-12 16:45:52', '2021-04-12 16:45:52', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('757bb82c00f749c0d1b2d59c127352aa', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-03-11 19:29:20', '2021-03-11 19:29:20', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('7598090096d39a8ccef3d3e697c244a4', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:05:25', '2021-02-23 16:05:25', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('759ff84f86753e4a99052440de849929', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-04 19:29:55', '2021-03-04 19:29:55', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('75ae6cd63d266fd6b602a22a412f0934', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:58:21', '2021-02-23 16:58:21', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('75b4c4b8e4533202b16ace4623fb69dc', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 20:41:20', '2021-01-15 20:41:20', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('75bec19fa22fa1a53978e3179912def9', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 10:52:32', '2021-04-11 10:52:32', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('75c3928e957fedec2bbb1fee2e199903', NULL, '0:0:0:0:0:0:0:1', 'blog_search', NULL, 'mogu ', 1, '2021-02-23 19:05:15', '2021-02-23 19:05:15', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('75dacf7d121da0ecc111f544149673af', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 17:23:39', '2020-12-04 17:23:39', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('760a2580bdcbf3387e7423f80f026747', 'b486735e7b914e366840d01f049306e4', '192.168.104.1', 'blog_praise', '635fc430e3378403a7d3f1e2a4e726a9', NULL, 1, '2020-11-22 08:47:44', '2020-11-22 08:47:44', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('761fde6f634025d80671eefd09f53c4e', NULL, '192.168.104.1', 'blog_content', NULL, NULL, 1, '2020-11-13 09:37:26', '2020-11-13 09:37:26', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('763b424cac1398fc47f40e2982358512', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 15:00:02', '2021-02-23 15:00:02', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('763c67bd069c659a5436c34f6e224c05', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:50:13', '2021-03-24 21:50:13', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('764861709c8c5509597d0fa5800ea6b6', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-15 20:35:37', '2021-01-15 20:35:37', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('766b4428d435afe49cbdd5e4479febad', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '你好呀', 1, '2020-12-31 20:01:45', '2020-12-31 20:01:45', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('767103159569d66b173d9b14d52d721b', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-13 09:20:39', '2020-11-13 09:20:39', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('76716a617e377ca4a78f11800737e821', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:45:26', '2021-04-10 09:45:26', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('768e1fef00c62bd0dd4d4a906dea5ec2', NULL, '192.168.104.1', 'blog_content', NULL, '8', 1, '2020-12-04 16:38:03', '2020-12-04 16:38:03', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('76f50e59ede5b0e436b824816a462655', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 21:01:34', '2021-01-15 21:01:34', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('7714e10c67c47aaf6d48a6e8c73e7cba', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 10:23:26', '2021-04-12 10:23:26', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('772ccb78d61fc9556fc02f7f176994b6', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-02 10:51:20', '2021-03-02 10:51:20', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('778606498958b41542bf10e819ec44aa', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-02 10:48:02', '2021-03-02 10:48:02', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('77a143f825ce15a0fa9463b0940e9625', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '30', 1, '2020-12-12 10:43:57', '2020-12-12 10:43:57', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('77b5779d51459d58c62fc0d349fcdc35', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 16:51:48', '2021-02-23 16:51:48', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('77fd9ec0a14b3f7f33ff4cbe8a93f69a', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-27 11:01:22', '2020-12-27 11:01:22', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('7830a2f81a0de0ab57ab4ff71bfc45c6', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '30', 1, '2020-12-12 10:32:14', '2020-12-12 10:32:14', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('783b927236027d6ff37a8df8aa8d371c', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 14:40:55', '2021-02-23 14:40:55', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('7846fec7116a37cf32564d05ae97f8d2', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:53:03', '2021-03-24 21:53:03', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('78ab3fba6b81a1293409403d8b3cf8d9', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2020年12月', 1, '2020-12-21 15:24:49', '2020-12-21 15:24:49', 'Android', 'Chrome-75.0.3770.142', NULL);
INSERT INTO `t_web_visit` VALUES ('78e468ed6e2c9f1d4e7cf1d7154027b3', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-16 21:32:20', '2020-11-16 21:32:20', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('78ea4038a9e3657150102dc0f9317c63', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-02 16:07:31', '2021-01-02 16:07:31', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('79123c705be3d758b2c0a0ab0b6e76b7', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-27 13:14:37', '2021-02-27 13:14:37', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('793808ba4ac5306d871ee7598c55cf14', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:50:58', '2021-03-24 21:50:58', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('79452377cae707990d6466da5bedc67a', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-15 21:33:59', '2021-01-15 21:33:59', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('795dd36f4bff02c3e44bbcd7e6f6d732', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-13 10:12:36', '2020-11-13 10:12:36', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('796d00f9d25806351ebc5d0b73796652', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 17:22:40', '2021-02-23 17:22:40', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('798b5d064076489966085ca4151299ee', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-14 23:23:44', '2021-01-14 23:23:44', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('79902622de0a4aec36178c79be184a74', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-01-02 16:07:18', '2021-01-02 16:07:18', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('799dff32ae337afe2886f9c6d19bff0c', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 10:12:07', '2021-01-15 10:12:07', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('79ac0811ccc38585abd56f31edcd4c22', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:54:17', '2021-03-25 09:54:17', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('79c3cbbc05dfd0a6f5723a0823add295', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 10:23:24', '2021-01-15 10:23:24', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('7a00ef87bcd64c928e11625e6a101c25', '1', '', 'admin_auth', NULL, NULL, 1, '2022-12-07 10:05:28', '2022-12-07 10:05:28', 'UnKnown, More-Info: PostmanRuntime/7.29.0', 'PostmanRuntime/7.29.0', NULL);
INSERT INTO `t_web_visit` VALUES ('7a121ae0731e44b63ba3866bdc9abf80', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-05-17 10:54:45', '2021-05-17 10:54:45', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('7a2e2e7d92373d9c1cbf541ab3c1ab72', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:41:14', '2021-03-24 21:41:14', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('7a90c19bf7fc7f0c53ed8655a42a7143', NULL, '192.168.104.1', 'blog_content', NULL, '8', 1, '2020-12-04 16:38:06', '2020-12-04 16:38:06', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('7aba268a22ad24f9653c78e5659dbd92', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 11:14:10', '2021-04-11 11:14:10', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('7ad531e22815bdee49dae141b3c17d9f', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '41', 1, '2021-02-21 09:00:34', '2021-02-21 09:00:34', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('7ae00d153e8c27538937dea2cadd5671', NULL, '192.168.104.1', 'visit_sort', NULL, '2020年11月', 1, '2020-11-20 22:05:39', '2020-11-20 22:05:39', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('7b51de75e0ab4af820d562401c91213a', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-02 11:25:26', '2021-03-02 11:25:26', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('7b94bbdea5651c339fcb1ac1be192bd8', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 10:11:52', '2021-04-12 10:11:52', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('7b96648759552b40440d377a0b104c25', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-27 13:14:38', '2021-02-27 13:14:38', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('7b9d2585cb63eecac1e97a1c65c086d4', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:56:16', '2021-03-25 09:56:16', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('7bb2169740b52d382fd0b2afac6832b6', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-11 17:29:20', '2020-11-11 17:29:20', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('7bd42d74c2d0c93c59c2178c0f7757d1', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '31', 1, '2020-12-12 10:35:50', '2020-12-12 10:35:50', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('7bd783ca448da389664db90d80c72f60', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 20:28:55', '2021-04-09 20:28:55', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('7bd820d5b33d26c62bf03415a3aa3296', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 15:59:04', '2021-02-23 15:59:04', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('7c10de3575076196ba9cc3a062fc6261', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 17:37:40', '2021-02-23 17:37:40', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('7c5dbcd325304aa61446c4c9b60f03dc', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-27 13:14:17', '2021-02-27 13:14:17', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('7c66ed1d4c454d9b9f8d03641a248bc8', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 13:16:25', '2021-02-27 13:16:25', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('7c68dd65840944815cc1b753e3c3ef7e', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-19 12:23:28', '2021-02-19 12:23:28', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('7c917ff150a6f723b564393db9fee3ca', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-03-02 11:25:23', '2021-03-02 11:25:23', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('7c9b5e6c3141636b8a4908ec6134020a', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 10:08:30', '2021-04-12 10:08:30', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('7cac3561342333b8dcaba3a97d0fb278', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:23:46', '2021-04-10 09:23:46', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('7cb564468e19b019ed06a70c42b55b98', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:38:44', '2021-04-09 21:38:44', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('7cbbaaac0d1c30d60965826fa69b7f1b', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 19:05:22', '2021-02-23 19:05:22', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('7ccea7a70c38f853dbe1f8cd95399452', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 15:28:19', '2021-04-11 15:28:19', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('7ccf81b68c45f4008d034c514236bc2a', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-03-25 09:56:05', '2021-03-25 09:56:05', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('7dadafa131c9549d097f1962b946a7ad', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:45:11', '2021-04-12 09:45:11', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('7e0730e40c2931d934f114e95be0b609', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-12 10:39:49', '2020-12-12 10:39:49', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('7e1240dc5ef1d5fb027a2ebcfc7ad519', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '30', 1, '2020-12-12 10:36:12', '2020-12-12 10:36:12', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('7e3d5cbc81255b0009d796b64bbde31a', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 10:23:51', '2021-01-15 10:23:51', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('7e55bfb9f99720a4cb9e847be16ae8db', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 10:55:37', '2021-04-11 10:55:37', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('7e646a8832125830daa730cdc48cf98c', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:10:57', '2021-02-23 18:10:57', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('7e932be2660b8fbc8808ac45ee451422', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-16 16:00:39', '2021-03-16 16:00:39', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('7eb169135dde1dfe28781621cd011054', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 13:02:25', '2021-02-27 13:02:25', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('7ee27eaa9d193d432762f70f66209ea2', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-22 21:12:26', '2021-03-22 21:12:26', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('7ef52ee26ded7e11ce4ce9a021778cf4', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:27:41', '2021-02-23 16:27:41', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('7f03f619d9478aad667d0f6151abecb5', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:38:22', '2021-04-09 21:38:22', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('7f57f9091d63617cf1dafd60c09e28e7', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-30 16:23:29', '2020-12-30 16:23:29', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('7fb1a520da8e6ff9b811c73cae5205b3', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-03-24 21:39:31', '2021-03-24 21:39:31', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('7fd43f46c6bdb174a3ce160ae4c2398c', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2020-12-26 15:22:06', '2020-12-26 15:22:06', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('804a195a9872d9fd6394b25bd1d01beb', NULL, '192.168.104.1', 'blog_content', 'e247932bf5f883ad3699144a00318a4b', NULL, 1, '2020-11-13 09:20:54', '2020-11-13 09:20:54', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('807ce177d8a8cde0e71f15abc5a4ace1', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-25 09:56:04', '2021-03-25 09:56:04', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('809abcbc78ef738a048efe0e29e84e1e', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-05 09:18:51', '2020-12-05 09:18:51', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('80c2cb3c034f04e24130710ada264ed2', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-05 09:28:23', '2020-12-05 09:28:23', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('80c71480faf6b9fb397ce2f544412774', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:57:26', '2021-02-23 18:57:26', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('80c98d5f7ef257e944508894884bdd9f', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '11', 1, '2021-01-24 09:29:56', '2021-01-24 09:29:56', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('811a56b1f7da2f40eb2518468f73d33d', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 10:08:47', '2021-04-12 10:08:47', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('812e3deee4c82bdfeef7221db19bc67e', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 20:35:39', '2021-01-15 20:35:39', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('813c5daea703b54d80d8f93ef4a13abb', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:13:04', '2021-04-10 09:13:04', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('8149cd383d44270d33b79a5ce2446f54', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-25 10:01:22', '2021-03-25 10:01:22', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('81598d8e5a8d8d4800cb60776a11afb8', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:58:18', '2021-02-23 16:58:18', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('8171bf46a99a4c7c4553cbb6d2b10dd9', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2020年12月', 1, '2020-12-13 19:38:51', '2020-12-13 19:38:51', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('817de6bf2b4c3f7aae67ed2f706c5288', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年01月', 1, '2021-01-28 23:18:26', '2021-01-28 23:18:26', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('8181a9ac58fca4ace421fe12f08b9b6b', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2020年11月', 1, '2021-03-02 10:51:35', '2021-03-02 10:51:35', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('81c54a3d9c08449b1a609a319614d68a', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 10:59:49', '2021-04-11 10:59:49', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('81cfad770b3900e6c29541dd34c53f39', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-19 16:10:28', '2020-11-19 16:10:28', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('81fa52dee78b068c6be645ce18660a5c', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:43:15', '2021-04-10 09:43:15', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('820227bde16815403505d07db8632037', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年04月', 1, '2021-04-12 10:30:50', '2021-04-12 10:30:50', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('820cbf849c0a6ec3bf38182bb881c650', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 10:11:36', '2021-01-15 10:11:36', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('826b1b0010145d431546872faf7230e9', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '30', 1, '2020-12-12 10:45:47', '2020-12-12 10:45:47', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('82997a04fd6ae09b9108c43a5dd3a1d1', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:40:44', '2021-04-09 21:40:44', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('82ac7ab33f540d5aa6761b22e6a93fe3', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:28:19', '2021-04-10 09:28:19', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('82b45ce24e7d2e4f5a7addbfcb64662f', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-03-25 09:56:06', '2021-03-25 09:56:06', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('82c3c4bd47c2bf7eaf56445edf2ad310', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 19:11:31', '2021-02-23 19:11:31', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('82c3e53aec2b1d76d05ffef0e8414e39', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 19:03:40', '2021-02-23 19:03:40', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('82e0b4806d10e0dc9f72d3e8e9b4da56', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:45:14', '2021-03-25 09:45:14', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('82eb74459db888e5845f2f118871ef29', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-05-17 10:54:56', '2021-05-17 10:54:56', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('82fef9b0b0efe64385cff5c5fbf820f6', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-24 09:46:48', '2021-01-24 09:46:48', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('83211f67c936f5b8d2e591b5a3492d7a', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-23 18:19:40', '2021-02-23 18:19:40', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('8329a6730be99a7bdc0024d0b670163a', '6795d72d4b27b24e02acb38723ccc5d6', '0:0:0:0:0:0:0:1', 'visit_classify', '9d2019983d91490aaa758eddd7c07caf', NULL, 1, '2021-06-13 07:48:18', '2021-06-13 07:48:18', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('834a9bff049fc901db4b143d2de543ee', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-09 21:09:09', '2020-12-09 21:09:09', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('8351f400fbd51d1500d4c498be30fbce', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-03-04 19:31:30', '2021-03-04 19:31:30', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('835f0f35a0a13a0050098a87a3e35be8', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 15:00:00', '2021-02-23 15:00:00', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('836f9fdd2dd26bcd3bb02df3170d6eab', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-23 15:19:38', '2021-02-23 15:19:38', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('838012e6d7c34f88efa0f9b80a649415', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-31 19:58:03', '2020-12-31 19:58:03', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('838d7186b4f18055315210fcb081f683', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-22 21:14:02', '2021-03-22 21:14:02', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('839e7edb554c6cda0d3276ffd3506c49', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-04 18:47:55', '2021-03-04 18:47:55', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('83a1e423768b9dc150a0a6c20c1d6d13', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-03-04 19:35:06', '2021-03-04 19:35:06', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('83ec881c1e7652bbe24b94eab5457bd2', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:42:09', '2021-04-09 21:42:09', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('842f10d6f0dddd208a8776ce640948bc', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-05-17 10:56:00', '2021-05-17 10:56:00', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('84390cdbc65a4759930210586c0e2610', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 17:28:00', '2020-12-04 17:28:00', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('843fd2e1596f23f8cc62db390458609f', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '测试评论2', 1, '2021-01-07 10:28:45', '2021-01-07 10:28:45', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('8443a271ef9cce3fbedc724742b5bfcc', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-03-22 21:14:05', '2021-03-22 21:14:05', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('84459fa9043345a062b985401f9f406a', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-16 15:31:06', '2021-03-16 15:31:06', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('84722592152e536a17d4119cc15f28a1', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-23 18:04:07', '2021-02-23 18:04:07', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('84a4719cd2d82085277a06f7ff3b5a89', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:19:32', '2021-02-23 18:19:32', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('84a7a1c1989330ef332536b3374b92a2', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '1', 1, '2021-01-24 09:29:08', '2021-01-24 09:29:08', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('84d1efb791b8e411d667eeabdfc3680d', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 18:06:02', '2021-02-23 18:06:02', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('84e56eeb9112138b475df94a4b43e14e', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:46:14', '2021-02-23 16:46:14', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('85285816a84f29972a10b52a509190f9', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 08:53:40', '2021-03-25 08:53:40', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('856930ca3df297c4ae350e9792078672', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 10:22:30', '2021-01-15 10:22:30', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('859829c82364223bff0a9380fa7f6cd1', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年01月', 1, '2021-01-24 10:00:34', '2021-01-24 10:00:34', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('85a84193fa0de1dd168672e4f9cf86be', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-13 09:37:02', '2021-02-13 09:37:02', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('85bf1ba7197809f22cc34d3a5cd1d037', NULL, '0:0:0:0:0:0:0:1', 'blog_search', NULL, '测试', 1, '2020-12-09 20:47:07', '2020-12-09 20:47:07', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('85dddf0f8e87d88cee769d596cf2e9a0', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:36:56', '2021-04-09 21:36:56', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('85e0111dd160656b1231e6c102211617', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-03-25 10:01:27', '2021-03-25 10:01:27', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('86232a644cdd436ea2550cb8b1bb9332', '1', '', 'admin_auth', NULL, NULL, 1, '2022-12-14 10:05:29', '2022-12-14 10:05:29', 'UnKnown, More-Info: PostmanRuntime/7.29.0', 'PostmanRuntime/7.29.0', NULL);
INSERT INTO `t_web_visit` VALUES ('8644756f698850328bf44691d3bce0af', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-27 13:16:11', '2021-02-27 13:16:11', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('86515a45455ca78d2f2de28eb3e8fa7d', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2020年08月', 1, '2021-03-22 21:17:14', '2021-03-22 21:17:14', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('8669237733774c5c8b289ee0d4c3b252', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:23:07', '2021-03-25 09:23:07', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('86aabbd338c33694d5652a46423c2c89', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '31', 1, '2020-12-12 10:35:58', '2020-12-12 10:35:58', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('86af28ef47628d966b78923967e00260', 'b486735e7b914e366840d01f049306e4', '192.168.104.1', 'blog_praise', '635fc430e3378403a7d3f1e2a4e726a9', NULL, 1, '2020-11-14 08:39:14', '2020-11-14 08:39:14', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('86d26ef90137587438c5df11161366c0', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:28:16', '2021-04-10 09:28:16', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('86dd0aae9e17e016f6da3a4bac9113fe', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:10:42', '2021-02-23 18:10:42', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('86ec4a6d272858fc40b59b259b9c95f5', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-03-04 19:35:07', '2021-03-04 19:35:07', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('86f16014d45e0f1329cdfd1ca84af426', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 10:16:08', '2021-01-15 10:16:08', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('874c2b98eec5fd54f75700054c2e52d5', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 19:12:01', '2021-02-23 19:12:01', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('875c8f0cfd924b2d19b838dfd9c5dfec', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-23 18:23:30', '2021-02-23 18:23:30', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('87a306a6903e55aadb4b10f04cfe349b', NULL, '192.168.104.1', 'blog_content', NULL, NULL, 1, '2020-11-19 16:28:54', '2020-11-19 16:28:54', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('87d6ecaedce6e6ea59e354e25af332a3', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 19:15:28', '2021-02-23 19:15:28', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('87eae8e85a40638fdf9ec0747bb43881', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:46:07', '2021-02-23 16:46:07', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('880778a5e691335246cb41146272e5a7', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 10:14:22', '2021-04-12 10:14:22', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('8814a727bd5ea25068d9fa998f4b0e21', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 17:04:23', '2021-04-11 17:04:23', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('881a2d869719e7e05a9c1148922c79d7', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 18:22:07', '2021-02-23 18:22:07', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('884d1cf0ebb1245078cecc004fef6eca', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', 'db56ab5dcd8c85c393c5dc0a9e65579c', NULL, 1, '2021-03-25 10:01:43', '2021-03-25 10:01:43', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('884f9bc649f3ad71b202efd61d02ec93', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:26:01', '2021-04-12 09:26:01', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('886b0bc16f5a1ffb04acfa0526f6cff7', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 15:29:30', '2021-02-23 15:29:30', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('88a09758472472d4c52528cc88d160fa', NULL, '0:0:0:0:0:0:0:1', 'friendship_link', '8eff079bd3857879daf8401c52d4a2de', '点击友情链接', 1, '2021-01-24 09:23:18', '2021-01-24 09:23:18', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('88cd2c037378129b682670400e80d470', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 10:30:51', '2021-04-12 10:30:51', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('89230e3c850de48b7ad7dfa44f0b5b80', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 18:11:01', '2021-02-23 18:11:01', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('8978596fbe501c1376f3df602f591c36', NULL, '192.168.104.1', 'blog_praise', '635fc430e3378403a7d3f1e2a4e726a9', NULL, 1, '2020-11-14 08:38:19', '2020-11-14 08:38:19', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('89a8a50b2ad05f37886b63d7b1c50f39', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-13 10:04:44', '2021-02-13 10:04:44', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('89d6758825c860518b458eb0cfe0f45a', NULL, '192.168.104.1', 'blog_content', '062ca3475e8193a4a81853a4bf41a8fa', NULL, 1, '2020-11-13 09:37:33', '2020-11-13 09:37:33', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('8a01f1029f6a7c32d964bfaf81514779', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-02 15:27:41', '2021-01-02 15:27:41', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('8a083de03e152b1b0513ace643359154', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '31', 1, '2020-12-12 10:28:48', '2020-12-12 10:28:48', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('8a3a4ed3d5ab38c710a0485ce9ee36cb', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-22 20:57:15', '2021-03-22 20:57:15', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('8a45b60a131208f36eb3951ecbe15d18', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 20:39:36', '2021-01-15 20:39:36', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('8a5ab1a2204f386ddb446a7fb2ac2985', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-13 09:24:13', '2020-11-13 09:24:13', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('8a65ebf30ebe83dabf372dad547fe9e3', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 19:56:21', '2020-12-04 19:56:21', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('8a7346b88ae5f9b3b85d95853bf2395c', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', '69eed1ef9ff92d4fbcdc4f5e633e026b', NULL, 1, '2021-04-12 09:32:10', '2021-04-12 09:32:10', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('8aa0d70542bafeedda5603e6b4988f8d', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '53c5a0f3142e4f54820315936f78383b', NULL, 1, '2020-12-26 11:24:35', '2020-12-26 11:24:35', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('8ae202a2a9c1ac865ea8abd0b097ec79', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 21:28:27', '2021-01-15 21:28:27', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('8afb1e2690f8c011dc092f024e7e6098', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-03-02 11:25:28', '2021-03-02 11:25:28', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('8b15aaafc42eff46d09e5e21e7e690e7', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-23 18:23:22', '2021-02-23 18:23:22', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('8b1b66736c128977330e37193f131280', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:51:28', '2021-02-23 16:51:28', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('8b3576b3de70e1f6928d463572b3cdbc', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-19 12:23:41', '2021-02-19 12:23:41', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('8b37f4b8f05610ad3c419602f5bddfa6', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 15:19:46', '2021-02-23 15:19:46', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('8b5020cabf87b9bef99bf7bbfb49b10b', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 18:20:28', '2021-02-23 18:20:28', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('8b5bf03271277097b702db9f6809dc1b', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2020-12-21 15:24:48', '2020-12-21 15:24:48', 'Android', 'Chrome-75.0.3770.142', NULL);
INSERT INTO `t_web_visit` VALUES ('8b69126a294bf26192cace8f63b14b78', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-19 12:12:06', '2021-02-19 12:12:06', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('8bed64cfe58ca01d8ae1f650d783a8c9', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-07 12:57:10', '2021-02-07 12:57:10', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('8c19b4822c434947970e1600923d9eed', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2020年06月', 1, '2020-12-31 19:57:59', '2020-12-31 19:57:59', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('8c5af9c5a83f9d4059663ef457003ae8', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 19:05:08', '2021-02-23 19:05:08', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('8c6a3cf969b16007f45e94dc1704055f', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 14:40:11', '2021-02-23 14:40:11', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('8c6cafe938ba1f2ba4450edc95d0d2dd', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:22:13', '2021-03-25 09:22:13', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('8c72fb45f23059b7dc18fffe0f43bcbb', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 22:05:25', '2021-03-24 22:05:25', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('8ca22d25aa422f32268133ebbafede22', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-27 13:14:18', '2021-02-27 13:14:18', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('8cba9fcac465280b426c0fbf899c4faa', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-14 23:23:38', '2021-01-14 23:23:38', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('8cc41a94e29ad053a68a356434eea338', NULL, '192.168.104.1', 'blog_content', NULL, NULL, 1, '2020-11-13 09:32:39', '2020-11-13 09:32:39', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('8ccdc706558523347a21c76a3ab31087', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 18:23:36', '2021-02-23 18:23:36', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('8ce5e223e7a7471eb98858b97d3cca8a', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-08 22:21:02', '2020-11-08 22:21:02', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('8cee61de29123d18a2b7d8f01ca77980', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-22 16:24:29', '2021-02-22 16:24:29', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('8d13fae459dfe30289995768253a9644', 'f6ac7f1cee33a0c4652a7396a1767368', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 18:39:21', '2021-04-09 18:39:21', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('8d1c7f2e3334c4d6416d8adc2a2e336a', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 18:19:40', '2021-02-23 18:19:40', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('8d4fe19325fa5da992880a6a665512dd', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:29:09', '2021-02-23 16:29:09', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('8d5f1909ad705ee5c19280629609f492', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:14:45', '2021-04-09 21:14:45', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('8d69837ec91cd44e6e14eae95a50938f', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 18:06:20', '2021-02-23 18:06:20', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('8d9056628a5cb4d6155cd34ecc38d015', '6795d72d4b27b24e02acb38723ccc5d6', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-06-13 07:47:44', '2021-06-13 07:47:44', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('8da44f549a4db0442a01d30af7bfbd9e', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 16:56:22', '2021-04-11 16:56:22', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('8dacd258beaa330bd6213334e7e733d3', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-16 20:02:53', '2021-03-16 20:02:53', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('8dcae10b892737676b2d34518a35b51c', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-23 16:57:55', '2021-02-23 16:57:55', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('8ddc1103dbfe0ac4d624c23dde942228', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-15 09:51:40', '2021-01-15 09:51:40', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('8e254758b39f4cbd47b0a695a1a3949d', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-27 13:17:51', '2021-02-27 13:17:51', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('8e3b4f1abf95c1670849abe63bd5f50c', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 16:48:20', '2021-04-11 16:48:20', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('8e49a4fca01a455fedc0c5acf8baf901', 'b486735e7b914e366840d01f049306e4', '192.168.104.1', 'blog_praise', '635fc430e3378403a7d3f1e2a4e726a9', NULL, 1, '2020-11-14 08:39:13', '2020-11-14 08:39:13', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('8eb5974072f8ee962cc2f6cb37710fc3', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-22 21:17:10', '2021-03-22 21:17:10', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('8ebc3a6735ab455e9941ed92e52423ab', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 13:00:53', '2021-02-27 13:00:53', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('8ec8770c94ba1249abedf94861d2b0cc', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:39:33', '2021-03-24 21:39:33', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('8ed2c405f7618272c5e4a0109ca0119f', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 13:01:57', '2021-02-27 13:01:57', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('8ee478e32455042edaf0f6e04728b7be', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '测试评论3', 1, '2020-12-26 15:28:12', '2020-12-26 15:28:12', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('8f0fe8590789c5b4c2aeed70c568ff10', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:52:01', '2021-03-24 21:52:01', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('8f1337b85505fd5c87926ded3ebcbbee', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '52', 1, '2021-04-12 16:20:19', '2021-04-12 16:20:19', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('8f20319845ab92c36f3c44c2ba069a25', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 20:33:25', '2021-04-09 20:33:25', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('8f2be19b7d1a83be7131ccd7bac329c9', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-02 10:52:39', '2021-03-02 10:52:39', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('8f359bde2d86621c5de34ef0e342c251', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 11:14:01', '2021-04-11 11:14:01', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('8f456c79abff0f696ac29d141f3d692f', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 10:16:19', '2021-01-15 10:16:19', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('8f46fd5051a42faf35c0afbb6d859b62', NULL, '192.168.104.1', 'blog_content', '635fc430e3378403a7d3f1e2a4e726a9', NULL, 1, '2020-11-13 09:35:13', '2020-11-13 09:35:13', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('8f6fc44fcccf534a5f463fc3e769f863', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '9', 1, '2021-03-16 19:45:42', '2021-03-16 19:45:42', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('8fe78e6db2f0015d13304a27c79d62a0', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:28:10', '2021-04-10 09:28:10', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('8ff18ebf25fee0c05a3de9a1d13d957e', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 17:17:12', '2020-12-04 17:17:12', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('900309b4cf8d7e5760866b1c0b476d73', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 22:05:24', '2021-03-24 22:05:24', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('9009d59d56bb6a30c90bafe5cce96518', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-02 11:25:24', '2021-03-02 11:25:24', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('901a5ce95c65ef746ec7f3994f02ba05', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-09 09:15:12', '2020-11-09 09:15:12', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('901c801bb89b1e491b42dd7305800c6a', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-05-17 10:56:28', '2021-05-17 10:56:28', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('901caa722ed3c9c1e5bdab74dea9c01b', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '7', 1, '2021-01-24 09:29:49', '2021-01-24 09:29:49', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('904ff68aae2a150c1d597c579a7e9d4a', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 10:59:47', '2021-04-11 10:59:47', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('9057c3276cda3c9bdf3252bf0cd3931b', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-04 19:15:18', '2021-03-04 19:15:18', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('905db0ab37f6f52b540f43e68df9daff', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 19:47:16', '2020-12-04 19:47:16', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('9062f1d203124b2da9a9abb5da544d07', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 18:06:20', '2021-02-23 18:06:20', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('90860696f9ed3b37d7f93dcad26189ab', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-04 19:31:31', '2021-03-04 19:31:31', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('9092719fda7ed8a16597809deef5fbbc', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 15:08:51', '2021-02-23 15:08:51', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('90f16b1b21fd72453b283ee4dbb122cf', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 15:34:00', '2021-02-23 15:34:00', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('90ffd7b0027e969848aa45b37a98e3db', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-22 21:16:57', '2021-03-22 21:16:57', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('9182643d24550210257f983276049ab4', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 17:25:00', '2021-02-23 17:25:00', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('91ade6e618cf7c884714d642b2cfe812', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-18 22:02:29', '2021-02-18 22:02:29', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('91b7e45b3e27672e5176da128431df9c', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-12 09:04:13', '2021-02-12 09:04:13', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('91b83c5fb19683e64b643d7a7d4f774a', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-21 09:10:35', '2021-02-21 09:10:35', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('91dfe25ffe88bb524ede18b1d1318608', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 10:59:52', '2021-04-11 10:59:52', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('91e6b2fa77d148a030cf48e99cbb1bc9', NULL, '192.168.104.1', 'blog_content', NULL, NULL, 1, '2020-11-19 17:09:33', '2020-11-19 17:09:33', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('91fb77ec6f4b23870c80d6ac22c6e9c3', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-03-02 10:52:46', '2021-03-02 10:52:46', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('91fd40b3f0789ac0447a744a7a0f7fed', '5eb5257f707cad9c6f06a1e951ba2def', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-09 09:18:42', '2020-11-09 09:18:42', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('920ca46afb4961d2b677d1578344cc3b', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '测试评论2', 1, '2020-12-26 15:22:25', '2020-12-26 15:22:25', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('9236cd213db690a8994202ed42a1de3c', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-22 16:00:01', '2021-02-22 16:00:01', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('92457ac320d1c7e0a506e2ddf25402b7', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 19:47:49', '2020-12-04 19:47:49', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('9246ad189c365f1057272eb8b716fcab', NULL, '192.168.104.1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2020-11-09 09:30:21', '2020-11-09 09:30:21', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('927eec143d838dcdf106a6eea214e2bd', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-04-10 09:30:28', '2021-04-10 09:30:28', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('9293dab09d7a37ef52bc21737184e5f9', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:15:31', '2021-03-25 09:15:31', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('92960d5d7eff45a362d8acd970b7122d', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:19:57', '2021-04-09 21:19:57', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('92bb40b0c73d1f2832a71a937807af82', '939e48c0b3d27ade7f654a113c729976', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 22:53:04', '2020-11-17 22:53:04', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('92f0bf25d09aeb0cc880131671cda5da', NULL, '192.168.104.1', 'blog_content', NULL, '8', 1, '2020-12-04 17:15:35', '2020-12-04 17:15:35', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('92f729ecf36dfb053261363b8de90b4a', NULL, '0:0:0:0:0:0:0:1', 'blog_search', NULL, 'list', 1, '2021-02-23 19:05:21', '2021-02-23 19:05:21', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('9302e8e0cb82a67d09bdaa8c1dffe59e', NULL, '192.168.104.1', 'visit_page', NULL, '关于我', 1, '2020-11-09 09:30:20', '2020-11-09 09:30:20', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('930d24ec41368825b9ae147998716707', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-19 12:20:47', '2021-02-19 12:20:47', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('9354aa3166c728521af06cf8bd289014', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2020年12月', 1, '2020-12-26 11:39:43', '2020-12-26 11:39:43', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('9394979476e77e70a351f1428eb0dbfc', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 11:30:08', '2021-04-12 11:30:08', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('93b6eca132f450bb24df2657860e949a', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:23:35', '2021-02-23 18:23:35', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('93c172787c633f6cbfdf35975238b398', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-22 21:18:09', '2021-03-22 21:18:09', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('93cd97156fdb517162e2b22272a2a295', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 17:41:38', '2021-02-23 17:41:38', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('93da2fad98647b0f428bdf5e539d8075', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 15:42:11', '2021-04-12 15:42:11', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('93e7b64af05d726534c9954d12f56e32', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 11:29:48', '2021-04-12 11:29:48', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('93f249726d88ca92f50e929c090182c5', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-05-17 10:54:12', '2021-05-17 10:54:12', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('93fb7e7935854e098547ac787d488932', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2020年10月', 1, '2021-03-02 10:51:36', '2021-03-02 10:51:36', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('9400f05e4af60c61e4641c6730ca8962', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:38:00', '2021-04-10 09:38:00', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('940e7d42d2ac1aab78a6f442aa1b4eae', NULL, '192.168.104.1', 'blog_content', '062ca3475e8193a4a81853a4bf41a8fa', NULL, 1, '2020-11-13 09:20:28', '2020-11-13 09:20:28', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('9441245af3d47fd279291cbd966e2437', '939e48c0b3d27ade7f654a113c729976', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 22:50:18', '2020-11-17 22:50:18', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('94751b0bd2c4ae9287a40118bb90c3db', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-05 11:07:04', '2020-12-05 11:07:04', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('9477b9dae150493f7741ba85fa48fa51', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 20:58:51', '2021-04-09 20:58:51', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('94a79cd3001b93fd4fdecb2af57637f8', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-24 10:00:39', '2021-01-24 10:00:39', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('94e81c9ed0c47536f6eeb2ff499f8ffb', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 10:13:39', '2021-04-12 10:13:39', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('94f1d620fe3e52c0a9b1c02a57e29300', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:07:46', '2021-02-23 16:07:46', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('94f84741af142d9490fa253654138c3c', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:42:31', '2021-04-09 21:42:31', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('952706df47ed7f3f29f769b8ed9fe080', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-13 09:17:06', '2020-11-13 09:17:06', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('95282cfa2d6f2177d43e533e21eb2daa', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:50:41', '2021-03-24 21:50:41', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('9564ec56d759ae0dcbd95c10aa135351', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 18:23:28', '2021-02-23 18:23:28', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('958d93740e6bb5ecc9a30e090e09985f', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-22 16:24:37', '2021-02-22 16:24:37', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('95d136b7dacfa940fdcd137f2d4da5eb', NULL, '192.168.104.1', 'blog_content', NULL, NULL, 1, '2020-11-14 08:38:58', '2020-11-14 08:38:58', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('95ed673be2f2a5413de40cc2f889d781', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 14:43:03', '2021-02-23 14:43:03', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('95ff06c179420437b6a095db366c3a00', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 10:07:23', '2021-04-12 10:07:23', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('960cd249a3b687d8d02a12e489f4a83a', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2020年12月', 1, '2021-01-02 16:07:18', '2021-01-02 16:07:18', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('9611aca940a332cf0e029e56dfb005f6', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:01:18', '2021-02-23 16:01:18', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('963b973d1c665acd19cc477cde24a686', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2020-12-26 11:24:29', '2020-12-26 11:24:29', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('963f300296ac203e3ed6a78e814f6d62', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:23:01', '2021-03-25 09:23:01', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('966c6f3b51340f5975c7a9e5f4dba059', '6795d72d4b27b24e02acb38723ccc5d6', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-06-13 07:49:08', '2021-06-13 07:49:08', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('967fd76e84d4d91e2c75a4b6e877c4fe', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 10:55:39', '2021-04-11 10:55:39', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('968103cc096169a8f51f732dcc9522e7', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '测试评论', 1, '2021-03-24 22:03:40', '2021-03-24 22:03:40', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('96870fca463d07dd62b1d41608f1de33', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 18:10:59', '2021-02-23 18:10:59', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('9687e7b6a4bc4063e7f0137ec1e9984f', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-27 13:14:21', '2021-02-27 13:14:21', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('9691876f72b327e7cf1fc06f84573625', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-01 21:10:27', '2021-01-01 21:10:27', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('969330856609ed1f01c80c21ac31673c', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 19:11:34', '2021-02-23 19:11:34', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('96a1905a62631cacf3dcd25839145c2c', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, 'http://admin.moguit.cn/#/dashboard', 1, '2021-02-28 21:32:30', '2021-02-28 21:32:30', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('96be2fb125547423903b38c9741ebd5b', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-03-24 21:41:20', '2021-03-24 21:41:20', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('96d9c163aef3dba8481b27dc7dc54d6c', '6795d72d4b27b24e02acb38723ccc5d6', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-06-13 07:49:06', '2021-06-13 07:49:06', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('96f73805c4d9ed5cdc2a7b7685eb093b', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:26:35', '2021-03-25 09:26:35', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('97046196cbda4061a5e73aa22137a262', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2020-12-09 21:09:20', '2020-12-09 21:09:20', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('973c4029e23eb79269dea4fd5f68fc95', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:44:14', '2021-03-25 09:44:14', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('9782d562ce1ad294c39fa2c420ae4dc1', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-08 21:22:39', '2020-12-08 21:22:39', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('978544b8f81a2f77f4fb171571f85f50', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_tag', '7e0e93ea6cdb44ae92e58f48e6496ed7', NULL, 1, '2021-01-24 10:00:57', '2021-01-24 10:00:57', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('97aa50b1ec00b317f78d708f581c1491', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 08:53:45', '2021-03-25 08:53:45', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('97cab4225566a4a70c9580ab5a619daf', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-21 09:10:48', '2021-02-21 09:10:48', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('97f57990ce58ccd3c1134fefa8717bf4', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:17:29', '2021-03-25 09:17:29', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('97fa586b8f3ac362934621a9be832b7f', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 22:05:22', '2020-11-17 22:05:22', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('97fb6686de193858eeb4d4df78f73800', NULL, '192.168.104.1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2020-11-13 10:14:27', '2020-11-13 10:14:27', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('9838e5926ae0f39d0198a3ccd6352bb4', NULL, '192.168.104.1', 'blog_content', NULL, '8', 1, '2020-12-04 16:17:40', '2020-12-04 16:17:40', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('986a6327c8378f1e7277bf2ec6ddde7f', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:21:11', '2021-04-10 09:21:11', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('986e982bde29fe9a9b7e1e4f43642a5d', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-04 19:29:56', '2021-03-04 19:29:56', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('98893bb7433c572884f48aaea65048e4', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 21:44:28', '2021-01-15 21:44:28', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('988abf52478e4a28e0e889c4e761b739', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2020-12-26 15:38:35', '2020-12-26 15:38:35', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('993ce6e059ca6c42daacc72ea4a218aa', 'b486735e7b914e366840d01f049306e4', '192.168.104.1', 'blog_praise', '635fc430e3378403a7d3f1e2a4e726a9', NULL, 1, '2020-11-14 08:36:11', '2020-11-14 08:36:11', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('99443ad2db15e75566dfed793f9c3a4b', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 18:22:45', '2021-02-23 18:22:45', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('99c8141602a24843ac1744613011d45e', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-22 16:24:35', '2021-02-22 16:24:35', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('9a7acbdcbd5f2e03d155032da13eb15a', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-03-24 21:41:09', '2021-03-24 21:41:09', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('9a899d3451916d35131613a4f648eed8', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-02 10:52:48', '2021-03-02 10:52:48', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('9a9a70cfba08ebfd9ab8ae7b3169780a', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '测试评论2', 1, '2020-12-26 15:28:06', '2020-12-26 15:28:06', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('9a9fbb4a9d9a2d7d3922e863c1afad09', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 18:23:53', '2021-02-23 18:23:53', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('9aade33130ab2aeadcd9337f44ee0268', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 18:06:19', '2021-02-23 18:06:19', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('9ab697afb1b1f64b6b5020f9b8d5ce51', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 19:46:30', '2020-12-04 19:46:30', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('9ad037bd70a929d0876b334d7867b2d9', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-19 12:19:14', '2021-02-19 12:19:14', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('9aee70e51664a6d5a386fb40849afd36', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 15:42:07', '2021-04-12 15:42:07', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('9af073adab269de1c1bcbb2a71b33239', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-03-02 10:52:52', '2021-03-02 10:52:52', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('9b31e656404a6bc3c85fe9b2c9054a61', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-02 09:48:54', '2021-01-02 09:48:54', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('9b395d4765fb4045fd440299e061eb68', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-03-22 21:21:47', '2021-03-22 21:21:47', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('9b483791c8216cfae5a91cbbbf9ca1ef', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, 'http://moguit.cn/#/info?blogOid=589', 1, '2021-02-28 21:34:55', '2021-02-28 21:34:55', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('9ba0017e8dc0c5b0882d7a1426241f87', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:26:50', '2021-03-25 09:26:50', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('9bedc93afaec05dd874459896a57c00d', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 17:31:43', '2021-02-23 17:31:43', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('9c36b5b95d70c32011294556ae7c1903', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 10:55:09', '2021-04-11 10:55:09', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('9c49d45fb6b3885c6341143daf3f180e', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '45', 1, '2021-02-23 19:11:43', '2021-02-23 19:11:43', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('9c5515524f5a9747e4e948e94dc1ae64', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '3', 1, '2021-01-24 09:29:12', '2021-01-24 09:29:12', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('9c6381ad9fc7d6761f089093b48caec3', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-04 23:48:02', '2021-02-04 23:48:02', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('9c8f2eca96abeeef06bb92225a52c348', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 18:23:42', '2021-02-23 18:23:42', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('9ccd53d8e087555cf704e7d33701d485', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-24 09:41:35', '2021-01-24 09:41:35', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('9cdbd71a5724934d5a7788c59022c0d1', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 18:18:52', '2021-02-23 18:18:52', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('9d10186e7ee8b6eeffb181c8962cc9c4', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-18 21:53:05', '2021-02-18 21:53:05', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('9d33036175e198f310abf029bd66504f', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:43:23', '2021-04-10 09:43:23', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('9dd307331bd82bccdc46886c0be85ead', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 16:17:26', '2020-12-04 16:17:26', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('9dd7e5a54bcf840691029b190b650c08', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-04-10 09:30:25', '2021-04-10 09:30:25', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('9ddd66f5fcd5cbb958aef561deb22bc5', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 16:58:54', '2020-12-04 16:58:54', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('9df264e308574b938a74622435bf4b5b', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '15721a34adba068763b5a2fb1991fc57', NULL, 1, '2020-12-26 11:24:32', '2020-12-26 11:24:32', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('9e2316e6125dab1030dea1cde5156e81', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:44:13', '2021-04-12 09:44:13', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('9e2bec2305e2c485c8fa939974e45aa8', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:40:09', '2021-04-09 21:40:09', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('9e68d9d98209f214378e4db58811f6c8', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 10:05:37', '2021-04-12 10:05:37', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('9e7901ba85b4964f71649ccc50701c00', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 17:02:07', '2021-02-23 17:02:07', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('9e872a07c9bc4cb6a0660a23b2711858', '1', '', 'admin_auth', NULL, NULL, 1, '2022-12-10 10:05:32', '2022-12-14 10:05:32', 'UnKnown, More-Info: PostmanRuntime/7.29.0', 'PostmanRuntime/7.29.0', NULL);
INSERT INTO `t_web_visit` VALUES ('9e94161a752bed7a0a3cea4de3906882', NULL, '192.168.104.1', 'visit_tag', '7e0e93ea6cdb44ae92e58f48e6496ed7', NULL, 1, '2020-11-20 22:27:35', '2020-11-20 22:27:35', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('9e988fca8400bd91d2a184dbf7d1d580', 'b486735e7b914e366840d01f049306e4', '192.168.104.1', 'blog_praise', '635fc430e3378403a7d3f1e2a4e726a9', NULL, 1, '2020-11-14 08:37:31', '2020-11-14 08:37:31', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('9eb56165c15763e8fb338eb0ddc426db', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 16:47:45', '2021-04-11 16:47:45', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('9ec10a6abdb3366ca6db6adda8540d78', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-22 20:57:27', '2021-03-22 20:57:27', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('9f05f4344e3ba064d93861d98dcbf251', '5eb5257f707cad9c6f06a1e951ba2def', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-09 09:19:14', '2020-11-09 09:19:14', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('9f062576612597ff4c827550da44e525', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 22:33:00', '2020-11-17 22:33:00', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('9f57dbcc867077698fb09beef61fc6dd', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'ca28ffc94ea94fbda5571e0b242021e2', NULL, 1, '2020-12-26 11:24:49', '2020-12-26 11:24:49', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('9f5d142a7a9840ddfc4640717b67fca7', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-28 20:52:55', '2021-02-28 20:52:55', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('9f922c4678deb6bb3ec148bc8946ac22', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 17:01:30', '2020-12-04 17:01:30', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('9fcbf735dc5293885283ac32283dd4bf', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:21:04', '2021-04-10 09:21:04', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('9fcca84eb0b4f17c7036673f885c10a9', NULL, '192.168.104.1', 'blog_content', NULL, '8', 1, '2020-11-22 08:47:21', '2020-11-22 08:47:21', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('9ff3474f707514a5576e9461574fa39b', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:42:00', '2021-03-25 09:42:00', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('a00c7f53944fc5f5b45810037872f62b', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-23 13:19:59', '2021-02-23 13:19:59', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('a0493ada7a80f1893f9283bc59e72744', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 18:18:53', '2021-02-23 18:18:53', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('a049c5de6bbe827f52344e7971244200', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:18:17', '2021-02-23 18:18:17', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('a08352717292a3b584ef07245bcf9f6e', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 18:22:07', '2021-02-23 18:22:07', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('a085d51b50396eec6d082567011976da', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:22:46', '2021-02-23 18:22:46', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('a0a7fb2b0d2da12eda02de3354eaff01', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 15:25:34', '2021-02-23 15:25:34', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('a0a7fc39c1fff2d7bd4b47dd338eba66', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:27:03', '2021-03-24 21:27:03', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('a0dc18cde3c86c99efe56f224a95f696', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'blog_content', '5adda57c05ec8ecb386a819375f328c0', NULL, 1, '2021-01-07 10:30:26', '2021-01-07 10:30:26', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('a17eee4adb35b6559839a2d385d042e2', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 16:55:38', '2021-02-23 16:55:38', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('a1aa51c572d66d0c1354b4dd909904dc', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:07:10', '2021-02-23 16:07:10', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('a1b51f34637d2832444ff2389579980d', NULL, '192.168.104.1', 'visit_tag', NULL, NULL, 1, '2020-11-13 10:34:35', '2020-11-13 10:34:35', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('a1f8dfbcb219e5239a14d8bba1e4c6bc', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-04-11 16:52:56', '2021-04-11 16:52:56', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('a1ffd1e6b64a461990c6bcbe54b33bbc', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-03-22 21:18:18', '2021-03-22 21:18:18', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('a24ff5fc429d4f968ce091cf4d5e2ded', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年04月', 1, '2021-04-10 09:30:30', '2021-04-10 09:30:30', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('a263aade71166d1d07e234705b691e17', 'b486735e7b914e366840d01f049306e4', '192.168.104.1', 'blog_content', NULL, NULL, 1, '2020-11-14 08:39:12', '2020-11-14 08:39:12', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('a26837cb89f21063a9b808360d97f18c', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-02 10:52:46', '2021-03-02 10:52:46', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('a275f58d9d3255af3ecec9a3e8a7d309', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-11 18:19:50', '2020-11-11 18:19:50', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('a28509ec272e286eacd483ac1ca0b5d5', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2020-12-26 11:24:54', '2020-12-26 11:24:54', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('a2a48c6ed927827c4be831fe98dee676', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 20:55:44', '2021-04-09 20:55:44', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('a2fb02efe2d4bb82bdf4b7a74bf996c7', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '0b51c75ed5744cdcadefe0ad947be9b6', NULL, 1, '2020-12-26 11:24:33', '2020-12-26 11:24:33', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('a31b4230b91e19a130372e3781c136c0', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:11:07', '2021-04-12 09:11:07', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('a3769260e228eaeddd85ad7d997dae92', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '30', 1, '2020-12-09 21:09:00', '2020-12-09 21:09:00', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('a38061bdabd7f76904a8110714c66bfe', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2020-12-26 11:24:42', '2020-12-26 11:24:42', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('a3850e37f624a64498521e12786a465e', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-27 13:17:51', '2021-02-27 13:17:51', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('a390dcc4e0e9bd40bf7d54e6fe47d703', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:45:32', '2021-03-25 09:45:32', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('a3ab89b566f3d04254847c0021368113', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-16 16:01:29', '2021-03-16 16:01:29', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('a3b90639842cb2fabd3cef45678d99a7', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '14', 1, '2021-01-24 09:30:01', '2021-01-24 09:30:01', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('a3bf15aa1acbc763e2c6fda8994f7194', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 18:22:44', '2021-02-23 18:22:44', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('a3c8086ea67207e67fe4052df62877d9', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:34:50', '2021-04-10 09:34:50', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('a3df5e4585e64621c049d469ae6bec50', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 18:06:01', '2021-02-23 18:06:01', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('a3e4f20aa0f392cc8b9d4b9bbcda11a5', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-28 21:06:29', '2021-02-28 21:06:29', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('a40503b337dbcd13a2abb485e028d716', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-27 13:15:50', '2021-02-27 13:15:50', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('a407f34427b3d722e3fac9e3587a6b8b', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 19:46:17', '2020-12-04 19:46:17', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('a41b9fa344c6ee624530953bae9777fe', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:39:41', '2021-03-25 09:39:41', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('a469c80fa64ba8c5f1b557112aa755f4', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:39:53', '2021-04-09 21:39:53', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('a4a3b93deb08284d163ede3a777753bb', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:18:48', '2021-02-23 18:18:48', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('a4b78dc52d56d713598ca150d580312a', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_search', NULL, '测试', 1, '2021-03-25 09:56:14', '2021-03-25 09:56:14', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('a4d036e6da901631aa1a4a95e200a7ab', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2020-12-26 10:59:17', '2020-12-26 10:59:17', 'Android', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('a4dbe62cb48989e6fc4704c5a321d113', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '测试评论2', 1, '2021-01-07 10:29:18', '2021-01-07 10:29:18', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('a4e3d2a35d898251cf7ee19b8821710f', NULL, '192.168.104.1', 'blog_content', '062ca3475e8193a4a81853a4bf41a8fa', NULL, 1, '2020-11-13 09:41:57', '2020-11-13 09:41:57', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('a508a40a1942267363f84cd63b470054', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-11 18:31:00', '2021-03-11 18:31:00', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('a51e655e20a116b8d26ea207f765287e', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-12 09:04:14', '2021-02-12 09:04:14', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('a53e720c9d18f5547d00c8baad2737ae', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-03-04 19:15:21', '2021-03-04 19:15:21', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('a5a041022402470b36cedf24da7fb4a0', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 10:21:56', '2021-04-11 10:21:56', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('a5ab12e5d92b7aedb7b08bfb5a20b324', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 15:30:11', '2021-02-23 15:30:11', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('a614e17c2f0520e0f9b4b8d41648fc7f', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:32:23', '2021-04-12 09:32:23', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('a618ef0b257f809a68c18ab649adc2fa', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 13:13:45', '2021-02-27 13:13:45', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('a61ec8bdfe0692b173cd67847f6f9993', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-22 16:24:12', '2021-02-22 16:24:12', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('a626522a610e474699b6060c9191a2dc', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:52:03', '2021-03-25 09:52:03', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('a62ffb384243cf760f171dad4929c72d', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 10:24:11', '2021-01-15 10:24:11', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('a648e0cd8cc02023a86064687b8fc5b2', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 18:04:08', '2021-02-23 18:04:08', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('a6aef821420149afabf26c99eb79b6b1', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-03-22 21:24:18', '2021-03-22 21:24:18', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('a6e37093afedcea913b5c249636339df', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '31', 1, '2020-12-12 10:45:55', '2020-12-12 10:45:55', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('a6ec2f89308e14554febacb5ea0599f2', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:44:10', '2021-03-25 09:44:10', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('a6f0adbefb7662ce0dff447ec5453531', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-01-02 16:07:30', '2021-01-02 16:07:30', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('a6f277b97c15e9c3e6557b2a4382b9c1', NULL, '192.168.104.1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2020-11-13 10:14:25', '2020-11-13 10:14:25', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('a702aef149481ef6f84e3cc8df2c4807', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-13 10:12:36', '2020-11-13 10:12:36', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('a7111eb3b3c1f9bc40ddccce45b1c7f6', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-02 15:45:43', '2021-01-02 15:45:43', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('a71c5019c9b178c7683dfc4fe5c77f2f', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 15:56:43', '2021-02-23 15:56:43', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('a739aabfa782a2b5383db35c3c1b6528', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 13:04:11', '2021-02-27 13:04:11', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('a746d7e84a0a937608dda512c434b49a', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-12 09:04:11', '2021-02-12 09:04:11', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('a75f0810f5eca534c1e1d70ae2d2a8ac', NULL, '192.168.104.1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2020-11-20 22:11:41', '2020-11-20 22:11:41', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('a77ee0b08632dd397273be7f50fa0b5a', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 10:03:23', '2021-04-12 10:03:23', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('a84efde44b8bf0c09f7b3760b6053228', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-13 08:41:38', '2020-11-13 08:41:38', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('a862e16c2802810fa61813ff51bc4bdd', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-03-24 21:41:19', '2021-03-24 21:41:19', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('a8b5150b0abd01a728bc408e759b3668', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 18:37:21', '2021-04-09 18:37:21', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('a8b910a1d9c63e19150395042c6b1e9d', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:15:14', '2021-02-23 18:15:14', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('a8d54892f88c63bda5d04c678552eaa8', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:25:25', '2021-03-24 21:25:25', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('a8dd826366d9cca485a4ced31090a5e2', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-09 10:23:11', '2020-11-09 10:23:11', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('a8ef9f1ea9018c065edcddbe14fba84f', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-28 21:06:30', '2021-02-28 21:06:30', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('a8fa2a97c581bef847c882f0cf19c642', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '30', 1, '2020-12-12 10:42:59', '2020-12-12 10:42:59', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('a93a9ab5b6a86f493b3b92e0c9ef3789', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 15:23:59', '2021-02-23 15:23:59', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('a980c469b273cff996abc59c0c9cdae1', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-08 22:20:05', '2020-11-08 22:20:05', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('a98aa655f20aacdc324a4ca68e45d6ab', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '31', 1, '2020-12-12 10:43:55', '2020-12-12 10:43:55', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('a9d0ffeeec05e90704f8164a1438738a', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-16 15:26:32', '2021-03-16 15:26:32', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('a9d4c81ba3036c2e40a315f4d3a7f283', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:38:24', '2021-04-09 21:38:24', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('aa59f88e3425640bd92fa1abb1419b7e', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 18:22:06', '2021-02-23 18:22:06', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('aa72be67e076e65bb0ea8182aa1dffef', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-04 19:12:20', '2021-03-04 19:12:20', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('aa89d9d40a07c032172dd34a30f14548', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 10:03:57', '2021-01-15 10:03:57', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('aabcb735d0d2ed51feca8b9ed7f4f50f', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:19:13', '2021-03-25 09:19:13', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('aabd881586e352264f6db1da5c14cd99', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-23 15:29:29', '2021-02-23 15:29:29', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('aad23052197886c4cbcc9872e2998cdc', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:35:16', '2021-04-10 09:35:16', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('aadd4eb00c5c080e1e6859c76a83bb36', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-24 09:21:08', '2021-01-24 09:21:08', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('aadef0d9de8b4a00b8187e42b9651d35', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 17:21:44', '2020-12-04 17:21:44', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('aadfd8ebd5eff0b1445e23f44a7cc907', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 11:28:24', '2021-04-12 11:28:24', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('aae61a8e9d341c32a75bc7518b697f4c', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-18 21:58:34', '2021-02-18 21:58:34', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('aaead0762e132c09af2c2e80370263c5', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 19:05:11', '2021-02-23 19:05:11', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('aafe1e265e470c6ca6b52f201d72468f', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 15:00:04', '2021-02-23 15:00:04', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('ab215cfacbeedc293a13b9b90d1dc6b3', NULL, '192.168.104.1', 'blog_content', NULL, NULL, 1, '2020-11-14 08:38:15', '2020-11-14 08:38:15', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('ab6afda54678296b8485100d2c8b1835', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', '55b7b13a1661bb6827b9a81c01e60e8a', NULL, 1, '2021-04-11 16:58:22', '2021-04-11 16:58:22', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('ab83f33da7f0beb6e414e2b35b3d3863', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-24 09:40:39', '2021-01-24 09:40:39', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('aba80af35f25159c7f7a72ee880aba1e', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 18:37:25', '2021-04-09 18:37:25', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('abcd00114f856523f8debab8338bfd19', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:27:32', '2021-04-10 09:27:32', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('abcdccce822e4badbe7d7e619c7a350f', '1', '', 'admin_auth', NULL, NULL, 1, '2022-12-14 10:05:26', '2022-12-14 10:05:26', 'UnKnown, More-Info: PostmanRuntime/7.29.0', 'PostmanRuntime/7.29.0', NULL);
INSERT INTO `t_web_visit` VALUES ('abfcecf9e120fe572e2c8b3e790ffb19', NULL, '192.168.104.1', 'blog_content', 'c58083675437f407d73d3322ca01b995', NULL, 1, '2020-11-13 09:21:39', '2020-11-13 09:21:39', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('ac182f00db05aa90cd590d681eef3139', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-19 12:08:43', '2021-02-19 12:08:43', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('ac326bd88e4f38ac0809761c3ac8a342', '6795d72d4b27b24e02acb38723ccc5d6', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-06-13 07:48:46', '2021-06-13 07:48:46', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('ac3659e84366b18817bbc508d88a19d4', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-05 09:28:28', '2020-12-05 09:28:28', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('ac3b02be4f980ab62cc657e9ceb0651c', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '30', 1, '2020-12-12 10:42:38', '2020-12-12 10:42:38', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('ac53582d2148d7c63ec276d2afacafc1', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 18:55:42', '2021-04-09 18:55:42', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('ac76b3db27805c428f25d7b17d2c5b55', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:20:19', '2021-02-23 18:20:19', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('acdfc0cfa02bbf3a14796d60a90c0cd0', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '49', 1, '2021-04-09 20:46:14', '2021-04-09 20:46:14', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('ad0f2a2837f3d495eddb9ed003bd4cdb', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2020-12-26 15:22:05', '2020-12-26 15:22:05', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('ad260d7035d0635d99bb52066ff4e976', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 18:19:50', '2021-02-23 18:19:50', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('ad2eed44c305911e0e90a509de0e9645', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 10:22:27', '2021-04-10 10:22:27', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('ad486e6420f4b464675216b712497acd', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-05-17 10:32:57', '2021-05-17 10:32:57', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('ad825a46fdb4961403b3e6adcb40bc3d', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:26:48', '2021-02-23 16:26:48', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('ada081f2ef22a195d21ac808d2b719a8', '939e48c0b3d27ade7f654a113c729976', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 22:50:31', '2020-11-17 22:50:31', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('ade12a85a67717881eeeda8058bc740a', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-03-22 21:14:06', '2021-03-22 21:14:06', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('ae1a73c074cb50100981f41d404cc084', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 19:11:54', '2021-02-23 19:11:54', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('ae4e561d57a3825ad33246eed7250aeb', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-22 21:26:30', '2021-03-22 21:26:30', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('ae5718c1f11c233d077642fd5a51fc63', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 19:04:21', '2021-02-23 19:04:21', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('ae82f21fc737373748074094f19565fe', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-14 23:02:52', '2021-01-14 23:02:52', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('aeb21c377d385d7d084bb2f903884f82', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-28 21:06:58', '2021-02-28 21:06:58', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('aec57e127df588d7799a1039a581aa39', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', '9d2019983d91490aaa758eddd7c07caf', NULL, 1, '2020-12-26 11:24:49', '2020-12-26 11:24:49', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('af01409282068a73b1956c43cd74fade', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '30', 1, '2020-12-12 10:37:57', '2020-12-12 10:37:57', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('af2fbc46d073f9f9ef6d38f8fdb0d2d0', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:06:33', '2021-04-12 09:06:33', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('af31d956e5326b78943f8ab267854ff6', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-08 22:21:20', '2020-11-08 22:21:20', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('af34fcc293823ab020d52a8fcb7df2c1', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2020年12月', 1, '2020-12-26 11:33:56', '2020-12-26 11:33:56', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('af5d907246801c1931c76319f789ca34', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-28 23:18:31', '2021-01-28 23:18:31', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('af6812fdbeea60bd1e2b056c07b87093', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-05 16:42:29', '2020-12-05 16:42:29', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('af800f3da3f61e20aaf8f29a39cff2f7', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-31 20:04:22', '2020-12-31 20:04:22', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('af88decbde8e2390010346bd29e9ad9e', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-23 15:25:38', '2021-02-23 15:25:38', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('afae937098acdd62462dcf50d996866a', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-14 23:27:46', '2021-01-14 23:27:46', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('afbe71096570200d53f5fd5f87fdace0', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:30:29', '2021-04-10 09:30:29', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('affa72a4832270beae7a34eb09545ed1', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-28 21:06:30', '2021-02-28 21:06:30', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('b0135d49fb083aa7793c491f29e1408d', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 21:33:44', '2021-01-15 21:33:44', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('b0bcda64df43d0aa07930ef891672350', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 21:42:09', '2020-11-17 21:42:09', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('b0e734c1c79c6c896cb5736a4944c771', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '7e0e93ea6cdb44ae92e58f48e6496ed7', NULL, 1, '2020-12-26 11:24:31', '2020-12-26 11:24:31', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('b0ebed97f9ba45f04836b9837e23e0ff', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '45', 1, '2021-02-04 23:51:42', '2021-02-04 23:51:42', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('b109207b8fc09cceb82686a0fa9f4eae', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-28 21:06:59', '2021-02-28 21:06:59', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('b10aedabe43cd0147af80571b465493c', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:31:28', '2021-04-12 09:31:28', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('b136b15c5b8cecb0ca5bf70c5593775f', NULL, '192.168.104.1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2020-11-13 10:16:22', '2020-11-13 10:16:22', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('b13a5313e5690cbbef578da554c10869', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-04 19:03:45', '2021-03-04 19:03:45', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('b19373d4f8fe8015e30503d124e9347a', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:19:42', '2021-02-23 18:19:42', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('b1bdb26c5fd67814b15d458a8ff450fb', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2020年12月', 1, '2020-12-26 11:38:21', '2020-12-26 11:38:21', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('b1e9fb66c5291854614f8a6d9d430511', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '1c76b9848f5f4d71a5e88b20dbaf38f4', NULL, 1, '2020-12-26 11:24:33', '2020-12-26 11:24:33', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('b1ec677b9100ec0647351cec47caa100', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-27 13:17:50', '2021-02-27 13:17:50', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('b2241b656c2cc478af042218183b52d6', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 18:23:28', '2021-02-23 18:23:28', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('b24788e8b2e6c6e8709651bc13c1bed8', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '27', 1, '2020-12-09 20:45:00', '2020-12-09 20:45:00', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('b259c805516a835c9fc5d6a691902d11', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:08:35', '2021-03-25 09:08:35', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('b285680e1b0545775b743083c46b3393', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-03-04 19:14:41', '2021-03-04 19:14:41', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('b2971b27b652570e897571a9c6e68f9b', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2020-12-09 21:00:12', '2020-12-09 21:00:12', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('b2a5518973487818a1def3153ac50fdd', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-24 21:39:28', '2021-03-24 21:39:28', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('b2ec1601999be3d941c31c387b7f6bed', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2020年12月', 1, '2020-12-09 21:09:19', '2020-12-09 21:09:19', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('b2ec3920e474ddb685c304a97314e7bb', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:05:04', '2021-04-12 09:05:04', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('b355240b8c14397ff4ee36601f2fdee9', '816d8eeb87df5b14f4a879d094ce7d82', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 22:40:52', '2020-11-17 22:40:52', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('b35f83b5b05a131dcce4b397d359e6ee', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:36:06', '2021-04-09 21:36:06', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('b360305d79b46ae09f51e9122ddfe6d9', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-24 09:24:57', '2021-01-24 09:24:57', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('b3927d60cc454ec6de155b9e89def032', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '测试8', 1, '2020-12-26 15:32:26', '2020-12-26 15:32:26', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('b3a033c5dcc1ae7933671c388ddb7f1d', NULL, '192.168.104.1', 'blog_content', '062ca3475e8193a4a81853a4bf41a8fa', NULL, 1, '2020-11-13 09:20:48', '2020-11-13 09:20:48', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('b4171bbd1128dcb0e14b6118b525253f', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-07 09:19:14', '2021-01-07 09:19:14', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('b468550a8be3fce5dc4871e0a26da2f7', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 16:58:10', '2021-02-23 16:58:10', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('b469b51305845fa5ce09c4307b35466d', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:53:07', '2021-03-24 21:53:07', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('b4b874f14921062de0175a749de7fee5', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 16:36:07', '2021-04-11 16:36:07', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('b4bc39a421b0d2027e65d8a6fc39d121', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 19:03:05', '2021-02-23 19:03:05', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('b4bc55eda563a09049f49916b2044bf0', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 19:56:13', '2020-12-04 19:56:13', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('b4e58cbed83f0477e50677fbbc037f7d', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-14 08:34:01', '2020-11-14 08:34:01', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('b519dbe73ea449eae0a301c7f7f54fd4', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 14:37:18', '2021-04-12 14:37:18', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('b567ac5472d964cd98fc7dd97dd6a882', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-04 23:45:00', '2021-02-04 23:45:00', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('b62520b1aeafc88f0b4fa568672440b8', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 18:05:50', '2021-02-23 18:05:50', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('b67337f3544ae75428779360d3e5dab4', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 15:10:28', '2021-02-23 15:10:28', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('b67fce11e4526bbd64625e16eb7a4ec3', NULL, '192.168.104.1', 'blog_content', NULL, NULL, 1, '2020-11-19 17:04:11', '2020-11-19 17:04:11', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('b6bbb078e2296cae2b0047216c98d51b', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-23 18:18:53', '2021-02-23 18:18:53', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('b6c89a85a5f6f285d55948f30d82fa89', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:36:55', '2021-04-09 21:36:55', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('b6e8d751eef09eea771411af453f17c7', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 08:52:31', '2021-03-25 08:52:31', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('b6f7865615a35d9c90601d17733ad444', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:11:33', '2021-02-23 18:11:33', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('b7402555110c651677129939922d34b1', NULL, '192.168.104.1', 'visit_tag', NULL, NULL, 1, '2020-11-20 22:10:04', '2020-11-20 22:10:04', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('b7474418d28c3e5e71e29089a8c324ae', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-03-02 10:52:13', '2021-03-02 10:52:13', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('b7a484817d7e35790318520a146cda28', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2020-12-21 15:24:49', '2020-12-21 15:24:49', 'Android', 'Chrome-75.0.3770.142', NULL);
INSERT INTO `t_web_visit` VALUES ('b7a87b2eb6f01864fae9f04eaf94338b', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', '2c93dfab0e754006866f8ed486923a41', NULL, 1, '2020-12-26 11:24:48', '2020-12-26 11:24:48', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('b7d18f2262c3721c7006a883d97a5e28', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 17:02:03', '2020-12-04 17:02:03', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('b7f8ea3bd0d1ef76fe8533c3b2064a33', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-01-24 09:51:45', '2021-01-24 09:51:45', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('b80e3b3a4cd32e98adcd047f49a1e064', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-28 21:07:00', '2021-02-28 21:07:00', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('b856e59520221963bae5a0964938a80d', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 13:18:48', '2021-02-23 13:18:48', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('b873104be2cde99a4e464a46b2454680', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, 'hello', 1, '2020-12-31 20:01:35', '2020-12-31 20:01:35', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('b88645b9ab39cea4018397e4d343acec', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-03-04 19:14:42', '2021-03-04 19:14:42', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('b89b791f2111f3ffa0f30d67cde06a73', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-09 10:44:39', '2020-11-09 10:44:39', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('b8a1c1f4c71f12b127a89032192549f9', 'b486735e7b914e366840d01f049306e4', '192.168.104.1', 'blog_praise', '635fc430e3378403a7d3f1e2a4e726a9', NULL, 1, '2020-11-14 08:36:10', '2020-11-14 08:36:10', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('b8a758b30fa4be7213f8753e6f06360f', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 15:25:40', '2021-02-23 15:25:40', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('b8aa6fad00d174534de8f1d8a50ff892', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 17:04:36', '2021-04-11 17:04:36', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('b8c9aa9da299745dd5c14eb980670656', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2020-12-26 11:24:37', '2020-12-26 11:24:37', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('b8ebef6e48b18556a47c1466e6391880', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-02-04 23:49:29', '2021-02-04 23:49:29', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('b9482ab7eea7c01c3035cf2f2cb9457b', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-21 19:48:48', '2020-12-21 19:48:48', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('b95a2f32e6e229609f0fca36dab2de68', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:10:49', '2021-02-23 18:10:49', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('b978e985a68773dab6c2599596d607b9', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-22 21:13:33', '2021-03-22 21:13:33', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('b993775a67ac6c499a3a2f7e960c74c1', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 17:05:42', '2021-02-23 17:05:42', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('b9e146b6c7b8b46e522d413bfc748d5e', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 17:05:27', '2021-02-23 17:05:27', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('b9ea8f84ef6ee97c31d2d45291d07270', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-03-04 19:15:18', '2021-03-04 19:15:18', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('ba0b139d12e159f7a64a69ce71deaa95', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:38:44', '2021-03-24 21:38:44', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('ba49ffb9ce903fae6e75c1d00f011efa', NULL, '192.168.104.1', 'blog_content', NULL, NULL, 1, '2020-11-13 09:33:27', '2020-11-13 09:33:27', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('ba58a5e3ab7db3656b662621453f47f9', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-13 09:37:29', '2020-11-13 09:37:29', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('ba720000a8607499b61854ad530cea11', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 21:34:02', '2021-01-15 21:34:02', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('ba82a0147c0c8b2497dae0c817e5d3a0', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 13:12:34', '2021-02-27 13:12:34', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('ba911ce69dcf94199eee949c9b663de6', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 20:38:16', '2021-04-09 20:38:16', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('baac60c194d20d3f3e4ccad1109bdd46', NULL, '192.168.104.1', 'visit_sort', NULL, '2020年11月', 1, '2020-11-20 22:10:05', '2020-11-20 22:10:05', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('babcad23db0ec998f637376167ce2ad4', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-04 19:05:01', '2021-03-04 19:05:01', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('bad9035e254306c7d6f721ffc2371c92', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:40:11', '2021-03-25 09:40:11', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('bb00599831b501df6a2d14e8d87eb37a', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-12 10:56:13', '2020-12-12 10:56:13', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('bb3ff3f6c87d5ff2fd421acf6014722c', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-13 10:18:06', '2021-02-13 10:18:06', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('bb508e6ce3345b62dd5ae67e5d08c2f7', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-02 10:52:45', '2021-03-02 10:52:45', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('bb6016e22949f1d58b89a16dfa429540', NULL, '192.168.104.1', 'blog_content', NULL, NULL, 1, '2020-11-19 17:06:42', '2020-11-19 17:06:42', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('bb99d53c4bc83d9a5da8c8e6165eb901', NULL, '192.168.104.1', 'blog_content', '062ca3475e8193a4a81853a4bf41a8fa', NULL, 1, '2020-11-13 09:23:48', '2020-11-13 09:23:48', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('bc2b7f8db159b46b58441d43bf9d2849', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2020年12月', 1, '2020-12-13 19:01:42', '2020-12-13 19:01:42', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('bc2b8120a688bae7b2420218d03837c4', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 11:26:39', '2021-04-12 11:26:39', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('bc4e40997cf38c9db0f8d3b82bd54420', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 17:02:37', '2021-04-11 17:02:37', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('bc55069b96af297e892d502165bbcae3', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 15:58:47', '2021-02-23 15:58:47', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('bc75b0b5bf6d1c196a2f09fadc06b904', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 15:17:36', '2021-02-23 15:17:36', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('bcabc797b432604f76d26340965e9c8c', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 14:45:51', '2021-02-23 14:45:51', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('bce0793fab52c79bde9f5355cbc4609c', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-11 19:29:28', '2021-03-11 19:29:28', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('bd0163b8d91d5b1290a4585d708e20c8', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 19:47:56', '2020-12-04 19:47:56', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('bd07800f0119fdd758fe83a98204269f', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2020-12-26 11:24:47', '2020-12-26 11:24:47', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('bd0acca53e793dc0bc79e0014b3d6964', NULL, '192.168.104.1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2020-11-20 22:05:40', '2020-11-20 22:05:40', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('bd0ae7572b733b3bf7c45b9b915f4621', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 10:59:48', '2021-04-11 10:59:48', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('bd46232a69efa130b1244088ece9d46a', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-11 19:29:45', '2021-03-11 19:29:45', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('bd6ef9003c1c0c8260029c853b0ae257', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:22:04', '2021-02-23 18:22:04', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('bdb772262782690fefc232ddfb673de1', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 15:58:48', '2021-02-23 15:58:48', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('bdb9abe984a9a85c48aad75fa9c5bbae', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 16:58:20', '2021-02-23 16:58:20', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('bdc0dc144c09a1265504fed28ab3c455', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:55:34', '2021-02-23 16:55:34', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('bde34eb19dc03b83514c42efbd8ddad6', '6795d72d4b27b24e02acb38723ccc5d6', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-06-13 07:45:54', '2021-06-13 07:45:54', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('bdeb5597fa6e5ce47a3da3738921e6a2', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '31', 1, '2020-12-12 10:35:52', '2020-12-12 10:35:52', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('be0f1ef9c515acf24cd85a9361363dfb', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 19:11:33', '2021-02-23 19:11:33', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('be350799c82070317cf5dbcbef6cce7e', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-26 15:45:56', '2020-12-26 15:45:56', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('be6592bf7d80e3c00bbb28ea8a0ab33a', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:38:22', '2021-04-09 21:38:22', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('bea82deff92010b7280ba39267f3e09f', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 10:23:55', '2021-01-15 10:23:55', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('bead5caff7e135f35bae010be14d75af', '6795d72d4b27b24e02acb38723ccc5d6', '0:0:0:0:0:0:0:1', 'visit_classify', 'db0d64ea7df409de5d2d747927cfa1a5', NULL, 1, '2021-06-13 07:48:15', '2021-06-13 07:48:15', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('beb3a5e7684c8cbffa4fb2f3c8739d0f', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:52:27', '2021-02-23 16:52:27', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('beb570611eebfa381ca95f1f90d2b421', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-03-04 19:15:20', '2021-03-04 19:15:20', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('bed0fd929e0912cd49bfbc35e9336343', NULL, '192.168.104.1', 'blog_content', 'undefined', NULL, 1, '2020-11-13 09:09:50', '2020-11-13 09:09:50', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('beddceef65cb7cf0bc0cec9d29890b5a', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:19:41', '2021-04-09 21:19:41', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('beddd7aa09ce57e13d95b2f811b28c79', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-09 21:06:15', '2020-12-09 21:06:15', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('bedf5dab218ec0cb3361ec0922216405', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-23 18:10:58', '2021-02-23 18:10:58', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('bf0643ea50ae76fe36e2e91c837aa8f6', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-03-22 21:24:34', '2021-03-22 21:24:34', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('bf2b26e0692912fe109a4e8cd3729f07', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-23 15:19:41', '2021-02-23 15:19:41', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('bf5342bd3346842fe397d80c58e6c5fa', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-03-11 19:29:21', '2021-03-11 19:29:21', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('bf5b828bf3ba280f0aebea4935404692', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:51:58', '2021-04-12 09:51:58', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('bf633a95400ef24729da82c66c8e1fec', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 15:29:25', '2021-02-23 15:29:25', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('bf6a93e4bbe22095fd2480b9c79e8d6a', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 15:12:02', '2021-02-23 15:12:02', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('bf8c4afdbafc75602a8a95d6351ee7b8', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:17:35', '2021-04-09 21:17:35', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('bfaedc39ca63cdc05c1c19879ecb1972', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:38:01', '2021-02-23 18:38:01', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('bfbd32dc219d096782f64ee82e9901d4', '5eb5257f707cad9c6f06a1e951ba2def', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-09 09:16:45', '2020-11-09 09:16:45', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('bfc0f19e8360ee2683e2e229c9d3ab0b', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 11:25:21', '2021-04-12 11:25:21', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('bfcbec3cd02ba14d5523a455aca9c020', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-22 21:27:00', '2021-03-22 21:27:00', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('bfcf7c5a230d62a56b1a416d6f672258', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-04 23:51:34', '2021-02-04 23:51:34', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('bfe09c7a3db7baa7dbcda4119b4c4d08', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-16 16:00:17', '2021-03-16 16:00:17', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('bfeacbf4cf25d0871ce04fa1c1ab98db', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 10:26:29', '2021-04-12 10:26:29', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('c05a6f9093ba667bd737165c64e08538', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:46:36', '2021-03-25 09:46:36', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('c066e78def9de7f9cad41ef537945196', NULL, '192.168.104.1', 'blog_content', '062ca3475e8193a4a81853a4bf41a8fa', NULL, 1, '2020-11-13 09:20:42', '2020-11-13 09:20:42', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('c0ad6a31f7432453f07fceb2ab3e8fb8', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '31', 1, '2020-12-12 10:43:08', '2020-12-12 10:43:08', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('c0ba2159191437cfb677fe50f7b75a26', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 13:15:19', '2021-02-27 13:15:19', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('c0c6275bb360598158319681920cbf70', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:07:59', '2021-02-23 16:07:59', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('c0c675ebb4da2922bbd977166873dcc5', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '32', 1, '2020-12-26 16:27:10', '2020-12-26 16:27:10', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('c141cabd385824ffc7b53c619f297d3b', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '31', 1, '2020-12-12 10:32:19', '2020-12-12 10:32:19', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('c1a099c8998923fe24fe8c7238fd6a5d', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:46:09', '2021-02-23 16:46:09', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('c1fef3e4877e46e777195ba17eadf02c', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 11:00:46', '2021-04-11 11:00:46', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('c2022a1448e90b6953c3247cd602f874', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2020-12-31 20:04:00', '2020-12-31 20:04:00', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('c21b64c1812d9ed126785fd92c31262c', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:21:04', '2021-04-09 21:21:04', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('c230b537228aa648b020b37b21ee83cf', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 17:34:32', '2021-02-23 17:34:32', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('c29a98bfc6b8aa02b6d94c4caa9f2b49', 'f6ac7f1cee33a0c4652a7396a1767368', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-04-09 18:39:24', '2021-04-09 18:39:24', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('c2af831a65a9f4ec341bcf32b19dc973', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:00:27', '2021-03-25 09:00:27', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('c2deecfdacd95e9a67cab7884d65fe79', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '31', 1, '2020-12-12 10:45:45', '2020-12-12 10:45:45', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('c2e7382529306614920aa68ea9b4d6bd', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-27 10:54:00', '2020-12-27 10:54:00', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('c2f21940c526dc579cc6e40d8990e368', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:20:22', '2021-02-23 18:20:22', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('c3103249eabc607951e546d45c1848b3', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:18:01', '2021-04-09 21:18:01', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('c32569ab644e66b6a3fc87e7588d216c', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-04-09 20:33:23', '2021-04-09 20:33:23', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('c33de1f1f2e26709611c07e07724f442', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:27:18', '2021-02-23 16:27:18', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('c342870492436d637c3cf25815f3f30f', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-02 10:32:27', '2021-03-02 10:32:27', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('c375e84841ad788e2226d6a944942af2', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-13 10:12:47', '2021-02-13 10:12:47', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('c385f963d9f38d313819d864160c2b73', NULL, '192.168.104.1', 'blog_content', NULL, '8', 1, '2020-12-04 16:58:25', '2020-12-04 16:58:25', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('c39f29550da4a75fb4c52782931b7f48', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:22:09', '2021-04-10 09:22:09', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('c3b0612de3923214ad9ef53040ff2c3a', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 19:11:32', '2021-02-23 19:11:32', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('c3b89db4f41c792c442a76c333580734', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-21 09:01:05', '2021-02-21 09:01:05', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('c3d9fb832de8fb163e70722ccd3a8d69', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-03-02 11:25:28', '2021-03-02 11:25:28', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('c40e52f02d4a40d2d4f50effec552c12', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:45:22', '2021-03-25 09:45:22', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('c416d7e7240a3ddcf052b1bb950badf2', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-28 21:06:26', '2021-02-28 21:06:26', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('c4200948e617edaea5e5acf033e376c8', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 18:04:05', '2021-02-23 18:04:05', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('c45ea9ff2eb0425e218da6cc7f722835', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 13:16:26', '2021-02-27 13:16:26', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('c4957b2f52f3662ec35de9dfd7e58870', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 10:12:52', '2021-04-10 10:12:52', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('c4a31636069ff03a0f17ac488329bd15', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 20:49:18', '2021-04-09 20:49:18', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('c4ab5f226d86d5c8a531d81ac9bfb865', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 13:08:21', '2021-02-27 13:08:21', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('c4bb7d7136739a6a3ea943c94a9140f3', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-24 09:41:55', '2021-01-24 09:41:55', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('c4c7879920fa06970435713c2722aaf8', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2020年08月', 1, '2021-03-22 21:18:17', '2021-03-22 21:18:17', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('c4cca617e15899768335f48cf8fc6c10', '6795d72d4b27b24e02acb38723ccc5d6', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-06-13 07:47:56', '2021-06-13 07:47:56', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('c4e09d650e014689ab2a1ba9b4b71f6a', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 15:50:04', '2021-04-11 15:50:04', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('c4f098143a89b306afc9d73b054c4e92', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-23 16:55:40', '2021-02-23 16:55:40', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('c4f257f64062d014c381b7eb42d54789', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-13 09:36:42', '2021-02-13 09:36:42', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('c4fb1f3ea5f36141a66982b427397d77', NULL, '192.168.104.1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2020-11-20 22:27:35', '2020-11-20 22:27:35', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('c528ed6c7a1dff2cce4b5561c0fc724b', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:58:04', '2021-02-23 16:58:04', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('c53492971d2eb5a1cd80f27d3fcc17f1', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-02 15:57:22', '2021-01-02 15:57:22', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('c545967e87851b066e6b2ae1cbab045d', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '30', 1, '2020-12-12 10:46:18', '2020-12-12 10:46:18', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('c54b207c0bc869863d053c7620e454e2', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-13 09:42:01', '2020-11-13 09:42:01', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('c553ed700bbb12700392feb773c91583', 'a8f8248f6ad406300390b2c6fee472a9', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:59:53', '2021-03-25 09:59:53', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('c56d879eceabb88d30843263e13ef919', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 10:27:32', '2021-04-10 10:27:32', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('c575a10979ffb60423333ad7e0cb213f', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 18:23:21', '2021-02-23 18:23:21', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('c582dff0329fac95ccf63f2ecceceb9e', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:41:02', '2021-04-09 21:41:02', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('c5c2af63227ca20f6dd9069103efdd6c', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-11 18:58:41', '2021-03-11 18:58:41', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('c5e5049bee4481e2eb3413ed3d01fe10', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2020-12-26 15:39:07', '2020-12-26 15:39:07', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('c5eea37d39ec525f575b52d6a01396df', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年01月', 1, '2021-03-02 10:51:34', '2021-03-02 10:51:34', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('c5f2a7bf44e08a4cbb9e1c0862c1701a', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:42:31', '2021-04-09 21:42:31', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('c5f6a57bc20123ce3942f1389acc8c44', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-22 21:07:17', '2021-03-22 21:07:17', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('c600bcb71ca0dd077a992839c17a8474', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:19:16', '2021-04-10 09:19:16', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('c62c0027f3c7f7999ed98625b8467cad', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '8', 1, '2020-12-09 20:47:12', '2020-12-09 20:47:12', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('c64005bc593a872c4ce910bf5222c7ee', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-23 19:13:00', '2021-02-23 19:13:00', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('c64834a67f7e0bfdd2f1a74192ded792', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 17:35:21', '2021-02-23 17:35:21', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('c652c85c24b6c18c948922f6d00c34f8', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-23 18:23:59', '2021-02-23 18:23:59', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('c65dbf93896a359f33e130ba19b574f6', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '52', 1, '2021-04-12 15:42:09', '2021-04-12 15:42:09', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('c6744ce45e432ff3a81696b8361ed382', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 17:02:17', '2021-02-23 17:02:17', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('c67c1db90434441e0b502e4c7aba5e62', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '31', 1, '2020-12-12 10:43:14', '2020-12-12 10:43:14', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('c6e8cf9d3b4e35ef6b4a5a4492fb5ecc', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 17:25:31', '2020-12-04 17:25:31', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('c6ec5809a7021181139092270f4f106f', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-04 19:15:17', '2021-03-04 19:15:17', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('c759302eb77cbc6ac2c00b4ef094349b', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:19:41', '2021-04-09 21:19:41', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('c77918c30c809e28e04c04db3da4cf31', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '2a31dd6c2b1b464e9e222a1198bc739a', NULL, 1, '2020-12-26 11:24:34', '2020-12-26 11:24:34', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('c7d369b55bbdbb124faeb9bfca9090bd', NULL, '192.168.104.1', 'blog_content', '34eb1b938fa734a52ce0f18a1b849685', NULL, 1, '2020-11-13 10:13:37', '2020-11-13 10:13:37', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('c80abdda63e507eae80bdfb9ff9c397d', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '30', 1, '2020-12-12 10:43:16', '2020-12-12 10:43:16', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('c8106aee768e1b669ebd28d2f6acd059', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-22 16:24:34', '2021-02-22 16:24:34', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('c82d07852ca96398857dfb4157637bb3', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 17:17:23', '2020-12-04 17:17:23', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('c83a655019f96af358c273f1024e2f06', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-14 23:02:50', '2021-01-14 23:02:50', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('c866781174f8e7576117f92f0ce21767', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '7e0e93ea6cdb44ae92e58f48e6496ed7', NULL, 1, '2020-12-26 11:24:31', '2020-12-26 11:24:31', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('c8cf2c7dd83ba53eb448fddf69720812', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:38:01', '2021-02-23 18:38:01', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('c8d77f0e85d49f3048329d077ad8f872', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-02 10:34:28', '2021-03-02 10:34:28', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('c8e77f3d7d600058c14da5fcb00314d5', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-05 11:07:12', '2020-12-05 11:07:12', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('c8f54a6252b6b04354b9a43648f9a6fb', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:19:34', '2021-04-12 09:19:34', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('c91f04848073ebe44d89e6346fe40d61', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-04 22:30:03', '2021-02-04 22:30:03', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('c930c46231634f5894e80220b065edbf', '1', '', 'admin_auth', NULL, NULL, 1, '2022-12-06 09:40:32', '2022-12-06 09:40:32', 'Windows', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', NULL);
INSERT INTO `t_web_visit` VALUES ('c94006bf1c74c37f7c62669b9fcecb00', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 15:29:54', '2021-02-23 15:29:54', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('c94a44320ce1340e0e072a0523beea37', NULL, '192.168.104.1', 'blog_content', 'c58083675437f407d73d3322ca01b995', NULL, 1, '2020-11-13 09:23:40', '2020-11-13 09:23:40', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('c971e8716f3bf9b4790eb63a0566cb35', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 18:23:29', '2021-02-23 18:23:29', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('c98184187d327e146030230482b0ef2b', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-24 10:01:00', '2021-01-24 10:01:00', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('c98896a434bd1ed0ff654fbd7f350d38', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 19:04:19', '2021-02-23 19:04:19', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('c98fb6029f3b257e0a9899239c56d6f5', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:56:11', '2021-03-25 09:56:11', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('c9c43eb557baeea34d84810ec285e48a', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-04 19:34:40', '2021-03-04 19:34:40', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('c9cdf336d3ac8ac8a642aa937882700e', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-13 10:12:12', '2021-02-13 10:12:12', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('ca028c5de46b0c1d7466845b40ad71a5', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 17:05:26', '2021-02-23 17:05:26', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('ca2f9e85a4be776a94c6b8e08c83f17c', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '31', 1, '2020-12-12 10:45:50', '2020-12-12 10:45:50', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('ca4c07b0aaf3292454bc5b3533cdaf73', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 20:58:52', '2021-04-09 20:58:52', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('ca4eca997dd039ae1971f280c42cc2c5', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-03-24 21:41:10', '2021-03-24 21:41:10', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('ca56bec0ca2f4cbc9e9bbf2ee38f7eb6', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 10:08:43', '2021-04-10 10:08:43', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('ca5b6983466276ade429e7c081c9c685', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:02:38', '2021-04-12 09:02:38', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('ca80c57cfca43ae212dfb2d40d232872', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:08:56', '2021-02-23 18:08:56', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('ca8c9f20e85c7c4f18f0597ce52cbe95', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-12 11:02:42', '2020-12-12 11:02:42', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('ca8cc4089fb708f9d7fac5e38c23b73b', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:23:43', '2021-04-12 09:23:43', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('caf7d17988d145fd3fff1fbbe4e4c4e9', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-27 13:13:47', '2021-02-27 13:13:47', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('cb017fd1f0bc7dff5037875d1137dfea', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 10:01:30', '2021-03-25 10:01:30', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('cb0ae708c3f29dd72bcef61b3014abfb', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 17:21:20', '2020-12-04 17:21:20', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('cb28f150d40c2ac5bea768224317ef66', 'b486735e7b914e366840d01f049306e4', '192.168.104.1', 'visit_sort', NULL, '2020年11月', 1, '2020-11-22 08:47:54', '2020-11-22 08:47:54', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('cb4e8e4f9df41b4ddea38538706d3fb9', '5eb5257f707cad9c6f06a1e951ba2def', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-09 09:21:08', '2020-11-09 09:21:08', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('cb87633f867521ee2a9d40f107825dd7', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-09 21:00:10', '2020-12-09 21:00:10', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('cb8b35d09d2a8833c7ea29fd3634ce58', '5eb5257f707cad9c6f06a1e951ba2def', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-09 09:21:32', '2020-11-09 09:21:32', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('cb99c37522752f93a546764df285b877', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 10:03:39', '2021-01-15 10:03:39', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('cb9e06e4a6de8b5c4f875647e489771d', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', 'db56ab5dcd8c85c393c5dc0a9e65579c', NULL, 1, '2021-04-12 11:30:19', '2021-04-12 11:30:19', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('cbd7ff2b8f712b6795d802fbd4d1e228', NULL, '192.168.104.1', 'blog_content', NULL, NULL, 1, '2020-11-19 16:29:25', '2020-11-19 16:29:25', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('cbedd40548df92f6b1c2f3718a639728', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '31', 1, '2020-12-12 10:41:03', '2020-12-12 10:41:03', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('cc16949badb374d2dd5ad1b2b8ec06e1', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 16:38:43', '2021-04-11 16:38:43', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('cc52876f53b783f3a0c1fad23d4e98e4', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 13:15:41', '2021-02-27 13:15:41', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('cc7ea733f1fc996e0706976133368df8', NULL, '192.168.104.1', 'blog_praise', '635fc430e3378403a7d3f1e2a4e726a9', NULL, 1, '2020-11-14 08:38:18', '2020-11-14 08:38:18', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('cc82b3f8b3393997251309e0237abaaa', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-26 11:01:26', '2020-12-26 11:01:26', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('ccd997ca8fe72e8fd8c4e308473137ab', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 19:03:29', '2021-02-23 19:03:29', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('ccdcd6a7216ee78e05475f9f29ae11a5', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '36', 1, '2021-01-07 10:29:11', '2021-01-07 10:29:11', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('cce9e03c5672fe69382e2beca8957110', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-01-02 16:07:31', '2021-01-02 16:07:31', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('cdde3fb5839bd04a69ce0ce849c3c75c', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-04 18:47:43', '2021-03-04 18:47:43', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('cde1defa4033ed1a02be02ef03bf7293', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:49:29', '2021-03-25 09:49:29', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('cdfe1aefea90dbda78a2aa2f650008cf', NULL, '192.168.104.1', 'blog_content', NULL, '8', 1, '2020-12-04 17:15:52', '2020-12-04 17:15:52', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('ce17d408eb72f56937262f6fd7f29e87', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-03-22 21:23:27', '2021-03-22 21:23:27', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('ce2614bcc33b9bc2532de5e2aaf1e6e4', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 13:12:30', '2021-02-27 13:12:30', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('ce39e7ef623749231890e6fe38ea7159', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:26:45', '2021-02-23 16:26:45', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('ce50981c06955288850c4e3ae96604e9', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 19:15:28', '2021-02-23 19:15:28', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('ce77a9f9c1bb33203fd617c4f0d2c710', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 17:02:09', '2020-12-04 17:02:09', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('ce96e0e6053b2f9ddf68eda9e9d0442d', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-12 10:39:27', '2020-12-12 10:39:27', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('ceaff56123b0553d9bc20788ca2266d7', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:31:24', '2021-04-10 09:31:24', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('ceb764ee4d74a80aa0c7f1e6b2b97e9a', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 14:41:55', '2021-02-23 14:41:55', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('cf5bf1c67e77818a4bd5cc442ffe3faf', NULL, '0:0:0:0:0:0:0:1', 'friendship_link', '8eff079bd3857879daf8401c52d4a2de', '点击友情链接', 1, '2021-01-24 09:24:59', '2021-01-24 09:24:59', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('cf6214cd05a2a6e11f12ed1e1562fe18', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 15:00:02', '2021-02-23 15:00:02', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('cf7367e138d55c2276fa5a00ec4531f8', NULL, '192.168.104.1', 'visit_classify', '2c93dfab0e754006866f8ed486923a41', NULL, 1, '2020-11-20 22:06:08', '2020-11-20 22:06:08', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('cf94cbcc344d5fc5c4f16862406f10b1', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-03-02 10:52:47', '2021-03-02 10:52:47', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('cfa2ff3d4281884bad5302f927911a58', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:06:55', '2021-02-23 16:06:55', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('cfa3bf2f40e109314a06123a49b602ac', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '31', 1, '2020-12-12 10:36:46', '2020-12-12 10:36:46', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('cfa7cfc1708422f0bbb253bd7ba20661', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 15:19:34', '2021-02-23 15:19:34', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('cfc1bb785217919dd41a2fe495a26a41', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-16 19:45:38', '2021-03-16 19:45:38', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('cfc32484830600ebd47d017f1e7eb036', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '51', 1, '2021-04-11 16:40:39', '2021-04-11 16:40:39', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('cfd4a4bdce0c684e2d278d764217d0b0', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-22 21:18:14', '2021-03-22 21:18:14', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('cff898fedbe06e54062de294f7ecfce4', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-16 16:00:35', '2021-03-16 16:00:35', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('d01387daaff4409c71b707c1cf3636f4', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:46:16', '2021-02-23 16:46:16', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('d015e15f00a682d3c867e2dffd659c50', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 13:01:05', '2021-02-27 13:01:05', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('d042b5b01885a99a66e25ca34a150fdd', NULL, '192.168.104.1', 'visit_sort', NULL, '2020年11月', 1, '2020-11-09 09:30:21', '2020-11-09 09:30:21', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('d045b0d0f55ad5cf4176adf002d60f3b', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '24', 1, '2020-12-09 20:45:03', '2020-12-09 20:45:03', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('d07877d1d8c3507e72daf294983af8b6', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-11 17:29:34', '2020-11-11 17:29:34', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('d0b719a078707256148345eebdc713cd', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 20:32:51', '2021-04-09 20:32:51', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('d0fdf74632e5622166d23d68f7fac397', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-05 16:42:28', '2020-12-05 16:42:28', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('d14458d294f51915192febd4b3189f96', NULL, '0:0:0:0:0:0:0:1', 'blog_search', NULL, '测试', 1, '2020-12-09 20:47:22', '2020-12-09 20:47:22', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('d183dc1160a7faae956cf1c7234ecd7d', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-01 21:44:23', '2021-01-01 21:44:23', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('d19249327d22f149bdf390d77e34f3fb', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-23 18:21:57', '2021-02-23 18:21:57', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('d19502d9cb654796be37046ba22ec7ec', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:51:51', '2021-03-25 09:51:51', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('d1ca8a5be1210a12cf524961d6bca44c', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 11:29:48', '2021-04-12 11:29:48', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('d1cb50202ea27c0462a5e8daa1333380', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 15:11:45', '2021-02-23 15:11:45', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('d1ce9490302f37d4c4bb884045eb42db', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-11 18:46:15', '2021-03-11 18:46:15', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('d1f1503c645f6d6489f0e583705c73b2', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '5', 1, '2021-01-24 09:29:44', '2021-01-24 09:29:44', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('d20da287a11f5a617d42dd9f59a50a13', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-23 18:11:20', '2021-02-23 18:11:20', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('d22994f91f56e67e4d5763e49e64a00b', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-03-04 19:27:35', '2021-03-04 19:27:35', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('d23e851481ee20ef85760059ef100156', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-01-24 09:52:30', '2021-01-24 09:52:30', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('d27b0b2399071d6338f28766fecc2239', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 08:50:43', '2021-04-10 08:50:43', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('d2a4b03eaa795431b48eba33c8a7d063', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 15:19:18', '2021-02-23 15:19:18', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('d2ab50a89267317eebbffb12b3c6a7b9', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'db0d64ea7df409de5d2d747927cfa1a5', NULL, 1, '2020-12-26 11:24:47', '2020-12-26 11:24:47', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('d303ab3734246295ecb42383c04bc0ae', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-23 19:12:50', '2021-02-23 19:12:50', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('d31f5177fd7612b1bfacb3415d39edfd', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 22:22:13', '2020-11-17 22:22:13', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('d3238dfe647b78c00f91bdf15e36eade', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '45', 1, '2021-02-27 13:13:17', '2021-02-27 13:13:17', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('d34d2902181ba242bd0478da844c8258', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 13:14:21', '2021-02-27 13:14:21', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('d3e860aa88be9c41a6def0e6fbd5b5b5', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 12:58:54', '2021-02-27 12:58:54', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('d4059f1820b13c65b649886474beed53', NULL, '192.168.104.1', 'visit_sort', NULL, '2020年11月', 1, '2020-11-20 22:11:42', '2020-11-20 22:11:42', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('d425ad8c93bddab93364c67f8bc7863a', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:57:28', '2021-02-23 18:57:28', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('d491ba30244fdc45053b5aadbac3e965', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 20:52:27', '2021-01-15 20:52:27', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('d4b3ec3b2ac477d1f8636117bdb70b2b', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 08:56:07', '2021-03-25 08:56:07', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('d4d94e49fb82c3786e646d75dbc08d57', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:12:23', '2021-04-10 09:12:23', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('d511e0a327a4643f0674695f448cec79', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 16:57:17', '2021-02-23 16:57:17', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('d55285ff293d251df2fd558b0158804f', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:40:09', '2021-04-09 21:40:09', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('d55ae8bc4b2dea6e39b7bb14dbca1f22', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 11:29:58', '2021-04-12 11:29:58', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('d56931442c4dcf85d5bb21d2844866d8', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:18:47', '2021-03-25 09:18:47', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('d56d6aa089aae72f2049eadefc556ff3', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-22 21:17:23', '2021-03-22 21:17:23', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('d5e602aa9dc758de329576a2dc72217a', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 17:06:06', '2021-02-23 17:06:06', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('d6141e6207b75cc8d925a9cfca0b4637', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-03-11 19:05:54', '2021-03-11 19:05:54', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('d614dc7b215ac51275592aa54aef25f0', '6bf3ab060a89d1faa2ccace42e47ffd8', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-04 19:00:54', '2021-03-04 19:00:54', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('d65e5e53329928e367e6c1fccbfab5bd', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 10:38:27', '2021-04-12 10:38:27', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('d66bf035fe49f3324f9bd043bfea42f4', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-02 10:41:51', '2021-03-02 10:41:51', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('d677f61e002b8e16f413398a3522c9cc', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:05:48', '2021-02-23 18:05:48', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('d6a2685fe70f43e4add73af115c8034f', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:55:01', '2021-03-25 09:55:01', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('d6b67fbb9ac3c47dfaba5931fd5a4e20', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 20:35:48', '2021-04-09 20:35:48', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('d6bee3b08bf34ac98ae47ec698987097', '1', '', 'admin_auth', NULL, NULL, 1, '2022-12-14 09:37:35', '2022-12-14 09:37:35', 'Windows', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', NULL);
INSERT INTO `t_web_visit` VALUES ('d6eb2ef182190b5a5a4e439103ae88a1', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 12:41:56', '2021-02-27 12:41:56', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('d6fc5a0a099605c7520be41241c0a354', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 11:18:07', '2021-04-12 11:18:07', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('d70f9cecbce98193755a84f139377a2b', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-18 22:07:42', '2021-02-18 22:07:42', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('d712c901fbfa3bcc192d409cbb812fc8', 'b486735e7b914e366840d01f049306e4', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-14 08:35:48', '2020-11-14 08:35:48', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('d715fa2fefc14cf4762bb35c9a3f229b', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:47:53', '2021-02-23 16:47:53', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('d724d82ea6b609b401bb2f7f46f025fd', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:37:23', '2021-03-25 09:37:23', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('d725f2f395ac6e21dbcb4f6d127de432', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 10:51:25', '2021-04-12 10:51:25', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('d726bda0ec5fc56111a8c931ef4de7ca', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:54:48', '2021-02-23 16:54:48', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('d753870e77d78b4e6048a03efdca85f1', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 21:28:22', '2021-01-15 21:28:22', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('d775c6e9dc62f0ab4598ef3d9d6ac1cc', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 21:32:58', '2021-02-23 21:32:58', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('d77cfe9c0b1031112a373b2879fee152', '3c61610e3f04833f5d91084beb42166a', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 21:51:25', '2020-11-17 21:51:25', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('d7917b9d3e1772666d233533f9c916ce', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 17:25:09', '2020-12-04 17:25:09', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('d7ac28f71d877da7d4b7a013e90fae66', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-03-04 19:12:22', '2021-03-04 19:12:22', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('d7f64532823b78be78fc8371a5ef1a23', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:16:12', '2021-04-12 09:16:12', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('d7f6a34730d52b2637ff5453e7165a3b', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 17:05:48', '2021-02-23 17:05:48', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('d82cd5797f33d7f54a161fff19cd405e', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 18:23:36', '2021-02-23 18:23:36', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('d837816ca2bc2a5f146dbb331cdc226b', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-27 13:14:35', '2021-02-27 13:14:35', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('d88c62f1e0ec3481f9833d18bb7adead', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-24 09:25:46', '2021-01-24 09:25:46', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('d88f6e7fc3e4286db67b47e4f3bfb4d9', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 13:19:20', '2021-02-23 13:19:20', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('d8a6a245b23abcf882f96837e493a86d', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-03-11 19:29:42', '2021-03-11 19:29:42', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('d8b32de75e9b7d814e03a74581724de0', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:23:43', '2021-02-23 18:23:43', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('d8c42423c48b8761b1b1ca10b59d2875', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-03-22 21:20:46', '2021-03-22 21:20:46', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('d8efdd6bbb32032f55c3bd039883ffba', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-23 16:48:03', '2021-02-23 16:48:03', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('d91dbdd1e5aabca2e6a0f43ac57619bd', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 22:32:43', '2020-11-17 22:32:43', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('d9265d8dc60e27c98c58508041c83879', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:11:10', '2021-02-23 18:11:10', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('d95d0b7c140d02a503cf7eee9a9208de', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'db0d64ea7df409de5d2d747927cfa1a5', NULL, 1, '2020-12-26 11:24:47', '2020-12-26 11:24:47', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('d95da2d92628bb186f152ba4be40c86b', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-07 09:21:58', '2021-01-07 09:21:58', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('d995fdbad51bd552c0cc66fcdf162907', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 19:05:41', '2021-02-23 19:05:41', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('d999132f0ddf494a2c1a5f7a5747b78d', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:03:58', '2021-02-23 18:03:58', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('d9aad7c295f1a8c5092c22ffc6e6c58a', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 22:32:59', '2020-11-17 22:32:59', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('d9b17bd211df4d79a624e7399df49074', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 13:14:13', '2021-02-27 13:14:13', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('d9f7c0329c4b358409d8b424343e1701', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '33', 1, '2020-12-31 19:58:07', '2020-12-31 19:58:07', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('d9f894cbcde7c215a8792aca501fb617', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '52', 1, '2021-04-12 15:42:14', '2021-04-12 15:42:14', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('da2f30d4876a45153f5a8c7a83030940', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-18 22:02:47', '2021-02-18 22:02:47', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('da3c92914d95814168571fea72e87662', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-03-04 19:29:38', '2021-03-04 19:29:38', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('da4609bfa3f86517d1ecd1fe7e316858', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-12 09:04:13', '2021-02-12 09:04:13', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('da4910884567c12ca3a316508cff4ca2', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-18 22:02:13', '2021-02-18 22:02:13', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('dae1aed0686c697e01fb5229183f3e91', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 20:39:25', '2021-04-09 20:39:25', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('dae6882075626e6aa8848b400be2b8e4', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-01-07 10:28:38', '2021-01-07 10:28:38', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('daedf0dd99a6be4df448544e5291e44f', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年01月', 1, '2021-02-23 19:11:47', '2021-02-23 19:11:47', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('db136f29ffdd3563904ecdf862b46cda', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-22 21:06:45', '2021-03-22 21:06:45', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('dbb5919fc8c713861352cc83ff823913', NULL, '192.168.104.1', 'blog_content', '8dc52bd61e36fa56cfc7699815375572', NULL, 1, '2020-11-20 22:05:49', '2020-11-20 22:05:49', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('dc19f5c919e9376c3c1f0f39834fa666', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:30:43', '2021-03-24 21:30:43', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('dc220fa6702b5be3d4f5affbe1cc0118', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-04 19:00:39', '2021-03-04 19:00:39', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('dc36ffe47ab44aa34230360f03b126ce', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 10:00:41', '2021-03-25 10:00:41', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('dc4392004ebda3647695d51369970eb7', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-03-04 19:29:40', '2021-03-04 19:29:40', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('dc4d909cd364e59e165ac2ad7530894a', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 19:11:53', '2021-02-23 19:11:53', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('dc5d51e39bfa31b786f990db6d2f55fe', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 16:51:49', '2021-02-23 16:51:49', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('dc94c585b4cf0ba40f5dc2a734191286', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 15:57:25', '2020-12-04 15:57:25', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('dc98d095c844db5b409548e63891684f', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-04 18:48:06', '2021-03-04 18:48:06', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('dcb88a707de566d43d71b2c3bb5e56ed', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 14:41:57', '2021-02-23 14:41:57', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('dd2c10ed6dff1f74347907ddf8788fb8', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-13 18:54:25', '2020-12-13 18:54:25', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('dd3cd08733f544ffe6d69cddf971db52', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-20 21:46:53', '2020-11-20 21:46:53', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('ddca93bac0f5a0c9fd1232d7ec72f375', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:50:59', '2021-03-24 21:50:59', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('dde7326854c20505e9efaf38b041a8e4', NULL, '192.168.104.1', 'blog_content', NULL, NULL, 1, '2020-11-13 10:12:53', '2020-11-13 10:12:53', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('de0193d9fee9c02e0abef2c4bd960f68', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 08:59:54', '2021-03-25 08:59:54', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('de151a60250087b13f60c3e9153a1be7', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 18:10:52', '2021-02-23 18:10:52', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('de99c1c7ff1b202138bf168fc0e5afc0', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:37:57', '2021-04-10 09:37:57', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('decdbfc2dd8fd652efc665ea4c3898f5', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-14 12:25:13', '2021-01-14 12:25:13', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('dee33babbd6fcd459e07b6ddd26c6026', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 20:53:42', '2021-04-09 20:53:42', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('df06e3d24f70f4483939f40e7824e81f', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '30', 1, '2020-12-12 10:30:57', '2020-12-12 10:30:57', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('df3861405d8fd130c1ad9bc875e298fd', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:44:51', '2021-03-25 09:44:51', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('df4b68ede4aa8b0e1295a66219a4c7d4', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:59:05', '2021-04-12 09:59:05', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('df4fd9dcfbbfb00f1ac986cf5f5fa38d', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 15:25:35', '2021-02-23 15:25:35', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('df7bd33ddac007109bf62e2c4d2ed128', NULL, '192.168.104.1', 'blog_content', NULL, '8', 1, '2020-12-04 16:41:44', '2020-12-04 16:41:44', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('df8294188dfe4e687f2be566a92bd612', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:53:06', '2021-02-23 16:53:06', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('df8532dba79bcd78fba607ca7e5b889f', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-22 16:24:37', '2021-02-22 16:24:37', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('df91be6fd200db1adb667e0e5ab644e3', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:39:11', '2021-04-12 09:39:11', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('df9697e9b20f21f7790fc3ae84021789', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-22 16:24:36', '2021-02-22 16:24:36', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('e008f6b862ad1f7983edb4a7c95700d7', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '32', 1, '2020-12-26 16:09:59', '2020-12-26 16:09:59', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('e0577c950f45eb1f26fdf88d7049ba8f', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-27 13:16:00', '2021-02-27 13:16:00', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('e0c0300bc6ffef66f57d05041f740f0d', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 13:15:45', '2021-02-27 13:15:45', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('e0c338649d5da2654022c53d374112af', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 10:51:29', '2021-04-12 10:51:29', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('e0d3153d3083486931dfb46617d52113', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '9', 1, '2021-01-24 09:29:52', '2021-01-24 09:29:52', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('e0dfc2f88104968f49d810e9b903bf3f', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 21:01:06', '2021-01-15 21:01:06', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('e115cfed67c76dcbdd4d25b83121adba', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-25 09:26:50', '2021-03-25 09:26:50', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('e16da8f2f7611a61c59cea72d785bde0', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:38:47', '2021-04-12 09:38:47', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('e18a87579a3e2c8eff8c31ba2e93e9b6', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 20:56:02', '2021-04-09 20:56:02', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('e1956ab2d9fa48781f3664735941227d', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:39:03', '2021-03-25 09:39:03', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('e1e307f74d464427a9ff1a3449868a40', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-10 20:42:24', '2020-12-10 20:42:24', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('e22a1e30297f65d96300e4199894ae8f', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 17:01:20', '2020-12-04 17:01:20', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('e27c0e90ef67eef0e2803574cadd5215', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '你好', 1, '2021-03-24 21:42:26', '2021-03-24 21:42:26', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('e27d3ede79c2ebe78b613a567caa3d4b', NULL, '192.168.104.1', 'blog_content', NULL, '8', 1, '2020-12-04 16:36:21', '2020-12-04 16:36:21', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('e27ff831d13d26e8beb3397289dd0d08', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:38:48', '2021-03-24 21:38:48', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('e292d8ab6d517e686e0ad3427f0ecd0c', NULL, '192.168.104.1', 'blog_content', '635fc430e3378403a7d3f1e2a4e726a9', NULL, 1, '2020-11-13 10:13:58', '2020-11-13 10:13:58', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('e299baabbd39e3794f3a64071d869146', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-03-25 10:01:16', '2021-03-25 10:01:16', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('e2a4c4d14e4cbc45ea82cd70fa042578', NULL, '192.168.104.1', 'blog_content', NULL, '8', 1, '2020-11-21 08:21:11', '2020-11-21 08:21:11', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('e2d645370f47a7fa49e21380388ae541', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-22 16:24:40', '2021-02-22 16:24:40', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('e2e0fa49ec31ef92c30d40ff1c94ec83', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_tag', '15721a34adba068763b5a2fb1991fc57', NULL, 1, '2021-01-24 10:00:58', '2021-01-24 10:00:58', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('e3129850d3dce81a23b3ab206e575081', '6795d72d4b27b24e02acb38723ccc5d6', '0:0:0:0:0:0:0:1', 'visit_classify', 'e60df954efcd47c48463a504bb70bbe9', NULL, 1, '2021-06-13 07:48:19', '2021-06-13 07:48:19', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('e353717e1504025c80e6e3bf5c2dd5c7', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-22 21:26:46', '2021-03-22 21:26:46', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('e36a30fca338e4a54ae162b275f8cd93', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 17:02:49', '2020-12-04 17:02:49', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('e38505a7b79b829d4a6174154b5a6725', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-27 13:17:50', '2021-02-27 13:17:50', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('e3972841b6f68d71f2faea004d72979c', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-03-24 21:41:10', '2021-03-24 21:41:10', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('e3b2fd5d621380fa1eccb73502aaa2c1', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '测试5', 1, '2020-12-26 15:32:13', '2020-12-26 15:32:13', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('e3c3c4878ad1ef9d8d9781d4c63e1afe', 'b486735e7b914e366840d01f049306e4', '192.168.104.1', 'visit_page', NULL, '关于我', 1, '2020-11-22 08:47:55', '2020-11-22 08:47:55', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('e40473def3df41739d3c81c455a645a7', '1', '', 'admin_auth', NULL, NULL, 1, '2022-12-08 09:52:38', '2022-12-08 09:52:38', 'Windows', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', NULL);
INSERT INTO `t_web_visit` VALUES ('e42be2dbadd79266d938d8ac4bcc3ce4', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2020年12月', 1, '2020-12-26 11:38:24', '2020-12-26 11:38:24', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('e434cbf207b38bffca2451671b75b168', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-03-04 19:27:07', '2021-03-04 19:27:07', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('e45ea0d1f55cf7859abb442833a1d033', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-28 21:06:59', '2021-02-28 21:06:59', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('e46b5d422451089daa3ecdf5d637dd03', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '57', 1, '2021-05-17 10:32:48', '2021-05-17 10:32:48', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('e47951409221a7e881ffa44c3f711aa9', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-11 18:58:25', '2021-03-11 18:58:25', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('e4cd0d58d7a43e42c5ea12c59add276e', '5eb5257f707cad9c6f06a1e951ba2def', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-09 09:22:29', '2020-11-09 09:22:29', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('e547be5a7cbc71a3498337cf3e247a99', NULL, '192.168.104.1', 'blog_content', NULL, NULL, 1, '2020-11-13 09:37:21', '2020-11-13 09:37:21', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('e548f165d8d0b7532c4104932f1846a3', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-28 23:18:18', '2021-01-28 23:18:18', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('e5586b7eced895f28a05b07758a7dd37', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-03-04 19:12:20', '2021-03-04 19:12:20', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('e5ba8ef382d3fa5e2f53470f32aaa483', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-15 09:47:44', '2021-01-15 09:47:44', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('e612e2b7685cb13e9a1c3b0d77aa3233', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '<span class=\"emoji-item-common emoji-angry emoji-size-small\"></span>你好', 1, '2020-12-31 19:58:35', '2020-12-31 19:58:35', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('e6342334513f735554419f00b46e1973', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 16:55:39', '2021-02-23 16:55:39', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('e63a8b98414dd6f1c6c50e4a71778f8a', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 19:11:55', '2021-02-23 19:11:55', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('e66eda242fd60d7f13e21006c234a60d', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2020年12月', 1, '2020-12-26 11:31:33', '2020-12-26 11:31:33', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('e672831bff6184202fe00bc4e82e38f0', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-13 09:35:39', '2021-02-13 09:35:39', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('e6763e40ad240a9cf5877b72cc73769b', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '测试拉拉', 1, '2021-02-27 13:16:34', '2021-02-27 13:16:34', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('e6bd2350b4e7577eb0030442a274c47f', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-01-24 10:00:33', '2021-01-24 10:00:33', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('e6ca88cba1fb5f5ef80463bd86eb40c4', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '45', 1, '2021-02-27 13:13:33', '2021-02-27 13:13:33', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('e6e88a7f1f21f47b6e3bf6a82fdd46c0', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年01月', 1, '2021-01-24 10:00:48', '2021-01-24 10:00:48', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('e6f8bafa5e4ba73014faeb3f931a5f56', NULL, '192.168.104.1', 'blog_content', NULL, NULL, 1, '2020-11-13 10:12:57', '2020-11-13 10:12:57', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('e70ff251eaf1ca670666ea21582b91db', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-03-22 21:26:07', '2021-03-22 21:26:07', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('e71269225237e37cb06771228ca5fa56', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:10:29', '2021-02-23 18:10:29', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('e7248babe2f4ffa239ae60309d599da8', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-23 15:21:24', '2021-02-23 15:21:24', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('e72ff127432565e99c044a2610cb5fb4', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 13:15:29', '2021-02-27 13:15:29', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('e74a1104826e71ef12e25e1c8789861f', NULL, '192.168.104.1', 'blog_content', NULL, '8', 1, '2020-12-04 16:41:32', '2020-12-04 16:41:32', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('e762943f75108a4abb584da6f58a1627', 'fe012adf78605b5c24c72f23e7ad226f', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 21:58:03', '2020-11-17 21:58:03', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('e78210887af04b72f8539a5a1d4c16d6', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:19:54', '2021-04-12 09:19:54', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('e7bb15f33e5de79b5f6d6d6ebf16eb16', '162ab0809537781ef9c1bf41e78391e9', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 22:35:14', '2020-11-17 22:35:14', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('e7d389edcb87e3679477c22e90616a4b', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:18:17', '2021-02-23 18:18:17', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('e80342adf218f66632a93bc7d8496e5a', '5eb5257f707cad9c6f06a1e951ba2def', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-09 09:18:55', '2020-11-09 09:18:55', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('e8222794129cca575ddc93112dc17d06', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-27 13:14:34', '2021-02-27 13:14:34', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('e896918fceb434588ca0b8c8855a5d37', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 15:19:37', '2021-02-23 15:19:37', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('e899cda6ae5dae252a7068743a0bd45e', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 17:05:25', '2021-02-23 17:05:25', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('e8b82562814390ff75b53558f37e3619', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 15:29:57', '2021-02-23 15:29:57', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('e8beb918bb9207cd3d14621e4fffb4a2', NULL, '192.168.104.1', 'blog_content', '062ca3475e8193a4a81853a4bf41a8fa', NULL, 1, '2020-11-13 09:20:50', '2020-11-13 09:20:50', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('e8e044b89de3270bb12e4abe16ccfce3', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 10:10:23', '2021-04-12 10:10:23', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('e8e0c9d5e02597ce53761afcac742c7d', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '30', 1, '2020-12-12 10:35:54', '2020-12-12 10:35:54', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('e8ed81575d79a45bd95f63a557249503', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-01 21:52:42', '2020-12-01 21:52:42', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('e8f7e82a71349a285957491b6d88a77b', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-27 13:16:41', '2021-02-27 13:16:41', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('e8f91eba2317768335df4fe76487623b', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 16:17:29', '2020-12-04 16:17:29', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('e908b8c1715c8d407a9a66e4ab959e6a', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:23:58', '2021-04-12 09:23:58', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('e933bfde0ed455fc2ee7c3112cb52d61', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 22:02:53', '2020-11-17 22:02:53', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('e95080683dc600ea9cf4e64311a47fea', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 16:53:09', '2021-02-23 16:53:09', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('e97881a29e5d90d3e6eb35fe6994830e', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2020-12-26 11:24:28', '2020-12-26 11:24:28', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('e99d10278d4f04813d5f8bd699a471a9', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 21:56:42', '2020-11-17 21:56:42', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('e9a9eb05e75c601ec1f12c01254f0d6f', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 12:38:16', '2021-02-27 12:38:16', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('ea932445e43dfb30d63c2511114eaa49', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-13 09:36:41', '2021-02-13 09:36:41', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('eaabee80580c76b7a4252737d8c356a1', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-23 15:37:56', '2021-02-23 15:37:56', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('eab3f70e5a465b2fdc0e82063159df3a', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '52', 1, '2021-04-12 15:42:39', '2021-04-12 15:42:39', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('eabe284c11a21af381096ae069432e5e', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:46:18', '2021-02-23 16:46:18', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('eaf162ccc94119b0260ff9dae2dbe4f7', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 10:25:12', '2021-04-12 10:25:12', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('eb194ede91b4c2a881ab2d77ffe8db6e', NULL, '192.168.104.1', 'blog_content', NULL, NULL, 1, '2020-11-13 09:32:53', '2020-11-13 09:32:53', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('eb6b2ea65ebbcb624ca5d83d25f39699', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:29:42', '2021-03-24 21:29:42', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('ebd6b302276ae4ed5de046f42cdf995f', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 18:23:35', '2021-02-23 18:23:35', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('ebe36dc3a4b64d43d6ea6e6899bf3f0b', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-08 22:20:31', '2020-11-08 22:20:31', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('ec3f200b80d93e954a023dda845b9621', '816d8eeb87df5b14f4a879d094ce7d82', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 22:39:16', '2020-11-17 22:39:16', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('ec623a68f3950d1ae4d7b7bc29b47e2e', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 15:37:59', '2021-02-23 15:37:59', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('ecb8e49f0d2f0c7a6c92123d8b9ebbe8', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 18:22:45', '2021-02-23 18:22:45', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('ed11b646f6b93c58ca8bf7d20e15f860', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-23 15:00:02', '2021-02-23 15:00:02', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('ed4de87f779013117ec4ba3ef96a8177', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 17:02:54', '2020-12-04 17:02:54', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('ed6b4092f7b6abb7fab8d90aa3b7104a', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-27 13:14:18', '2021-02-27 13:14:18', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('ed72b1714e4957f7e55d38c8e34f82af', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-03-22 21:17:16', '2021-03-22 21:17:16', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('ed734eb1cf57bba1c9444745269c5316', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-22 21:18:15', '2021-03-22 21:18:15', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('ed8069e9a14d5a0dc002cb90cc3a8d10', NULL, '192.168.104.1', 'blog_content', NULL, NULL, 1, '2020-11-13 09:37:24', '2020-11-13 09:37:24', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('ed8b61d0f3aa0de4cf21274c4843cc00', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-23 18:06:22', '2021-02-23 18:06:22', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('edc1da8fdc8ab5fd1406b40c76782e23', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 19:11:46', '2021-02-23 19:11:46', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('edc72ebb1cd8feeef14d59f880943dea', NULL, '0:0:0:0:0:0:0:1', 'blog_content', '31ba99fe46e0bddb4db1e50ed97fcf22', NULL, 1, '2020-12-09 21:08:03', '2020-12-09 21:08:03', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('ede0728f4bee6086ddb70573d6c7e8f0', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 12:59:36', '2021-02-27 12:59:36', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('ede662762840c126573160f75093aace', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '33', 1, '2021-04-09 20:43:27', '2021-04-09 20:43:27', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('ee35ea8ea557043cc20be9a8938a460a', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-22 21:11:20', '2021-03-22 21:11:20', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('ee37969fee84277d2a30ccd8079ebedb', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-22 21:14:07', '2021-03-22 21:14:07', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('ee5dbe6446e3271afac0e09d15b667a5', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 13:18:38', '2021-02-23 13:18:38', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('ee94517c9aeef9b5fe13f4752bdd9cf2', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 15:29:26', '2021-02-23 15:29:26', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('eecb2b02bb78caaf945b9ce439d25abd', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-04-12 09:11:07', '2021-04-12 09:11:07', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('eefc9352085778511a17f3e67a28b720', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:20:27', '2021-04-09 21:20:27', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('ef37434aea7fe0d6ccc0c3b97c9dc82c', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 16:48:02', '2021-02-23 16:48:02', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('ef71b49bdb72e931accb758ad44bf9ae', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-11 19:05:56', '2021-03-11 19:05:56', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('ef8051585608c605aa64f2241b550559', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 15:29:42', '2021-02-23 15:29:42', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('ef8ec4ffcd6eb71db03e347d043bf606', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 10:28:46', '2021-04-12 10:28:46', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('ef9940488f09ebcc6567c0bcf7aad45b', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-13 10:12:36', '2020-11-13 10:12:36', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('ef997684f935539f87fcca647174f854', '6795d72d4b27b24e02acb38723ccc5d6', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-06-13 07:47:41', '2021-06-13 07:47:41', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('efc189cd4fc204d8a8d298ef17520bc3', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-03-11 19:29:41', '2021-03-11 19:29:41', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('efc943bde48858f5841c06460fa7c770', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 13:14:49', '2021-02-27 13:14:49', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('f03f3bc3ee2d16541a4276bbb9d86039', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 17:22:08', '2020-12-04 17:22:08', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('f061877df675cac59fd10e8f66933364', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '1c76b9848f5f4d71a5e88b20dbaf38f4', NULL, 1, '2020-12-26 11:24:34', '2020-12-26 11:24:34', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('f083102ae62ec0e403a8e95765430696', 'a8f8248f6ad406300390b2c6fee472a9', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '你好呀', 1, '2021-03-25 10:00:02', '2021-03-25 10:00:02', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('f0cb97044e03dac8adfdb3d715cf7de0', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:14:23', '2021-04-09 21:14:23', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('f0dedd95efbb99d2e70ef03fccc27b2c', NULL, '192.168.104.1', 'blog_content', NULL, '24', 1, '2020-11-20 22:05:37', '2020-11-20 22:05:37', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('f0e2afed1c009d33be4b997f6e5bd292', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-03-24 21:41:18', '2021-03-24 21:41:18', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('f115542a01cbb538aef271196e3efce6', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 15:16:20', '2021-04-11 15:16:20', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('f17635309ad9537e7cd8c5e95dad4191', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-02-23 18:23:59', '2021-02-23 18:23:59', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('f17defcb60461e868dcf1c90e0937b9b', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '测试4', 1, '2020-12-26 15:32:11', '2020-12-26 15:32:11', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('f18a2ad6a44934b38cd61221ac016335', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-22 16:24:30', '2021-02-22 16:24:30', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('f1ade0d7ad589a24d3aecb01a7ddd276', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 22:05:45', '2020-11-17 22:05:45', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('f1c3ce44484f064091822ca6c88f7dbb', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '30', 1, '2020-12-12 10:35:01', '2020-12-12 10:35:01', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('f1c6f3cfbafa384c6f23ce2c6343b00b', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-21 09:00:34', '2021-02-21 09:00:34', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('f1c8e724be2035d1a0a2c0d58440ed3d', 'b486735e7b914e366840d01f049306e4', '192.168.104.1', 'blog_content', NULL, NULL, 1, '2020-11-14 08:36:09', '2020-11-14 08:36:09', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('f2463a3a40721b3ef58bf19601e67475', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-04 23:47:34', '2021-02-04 23:47:34', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('f26fb0806e7521207926fd8e06301995', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '31', 1, '2020-12-12 10:39:29', '2020-12-12 10:39:29', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('f290a2568050cd42724b97524de801df', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 10:54:36', '2021-04-11 10:54:36', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('f2d207511493919198cebc0490913ebb', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-18 23:46:05', '2021-01-18 23:46:05', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('f2fe4f5e0f1522ee0c0d6495ad3b6ea6', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-22 16:24:11', '2021-02-22 16:24:11', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('f306b5d0e134742834e6caa18052a99a', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-16 19:39:12', '2021-03-16 19:39:12', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('f320d6ed919400b86391a3478482bc35', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-24 09:25:59', '2021-01-24 09:25:59', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('f32ecc70c0a6306279a2676debfbc473', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-03-04 19:29:45', '2021-03-04 19:29:45', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('f3431bb850cf4a2d5158b6e1f29267fd', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 14:44:38', '2021-02-23 14:44:38', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('f3576eafd601fdd92cb2de406431b12d', NULL, '192.168.104.1', 'blog_content', NULL, '8', 1, '2020-12-04 16:36:05', '2020-12-04 16:36:05', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('f3ad621a45c5df822ea27e61d8793ea2', 'b486735e7b914e366840d01f049306e4', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-14 08:39:07', '2020-11-14 08:39:07', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('f3cfad6cc1b44a360bf85e0950aad757', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 15:38:44', '2021-04-12 15:38:44', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('f3e7a7a115c35f276db7ae22f9183d79', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-23 18:19:26', '2021-02-23 18:19:26', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('f3f72492c2aa2f28cf508d38fa3a755d', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 09:39:05', '2021-04-10 09:39:05', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('f4199ae01b7a14b5c8b608260590e8fe', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 20:36:03', '2021-04-09 20:36:03', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('f42de779c019663a8e7084c32c9606ec', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-23 19:11:53', '2021-02-23 19:11:53', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('f4441ff25b385b4b3219b974ddd032d1', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 13:01:29', '2021-02-27 13:01:29', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('f4a692bb924b0b0d5faeb6e92e001cf7', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-12 10:26:50', '2020-12-12 10:26:50', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('f4b1ddcb0cf4725a35924b965d5efb50', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-18 22:07:47', '2021-02-18 22:07:47', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('f4d50221d640f2d25048b35b7e9e1cda', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 14:59:46', '2021-02-23 14:59:46', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('f4e0ed46259208d9cd18b117e3a6a81b', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 10:03:40', '2021-04-12 10:03:40', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('f52fb0423c97d31a740154be1927a1b4', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:39:55', '2021-04-09 21:39:55', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('f54fa2e913ac4ad1d8a857f7ddf151cf', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2020-12-26 11:35:49', '2020-12-26 11:35:49', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('f56ccefec3d5a12148cc97629bf909bd', NULL, '192.168.104.1', 'visit_tag', NULL, NULL, 1, '2020-11-13 10:16:23', '2020-11-13 10:16:23', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('f58ac2262c8e5ed844e630ae4e669f56', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-03-24 21:39:32', '2021-03-24 21:39:32', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('f58dab108d6641eead605519e1ca7347', '1', '', 'admin_auth', NULL, NULL, 1, '2022-12-12 10:05:32', '2022-12-12 10:05:32', 'UnKnown, More-Info: PostmanRuntime/7.29.0', 'PostmanRuntime/7.29.0', NULL);
INSERT INTO `t_web_visit` VALUES ('f592deb68ceeea7383e3334d2f9f01dc', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:14:24', '2021-04-09 21:14:24', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('f5e49bbd9aa3af9efeebf0360fd4454f', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 14:39:26', '2021-02-23 14:39:26', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('f629a0c13106845d256d266163efae9b', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 15:29:39', '2021-02-23 15:29:39', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('f63313f91a260e8a902b27964b886cd1', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-27 12:40:11', '2021-02-27 12:40:11', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('f638b95d29a2876222cf7cb3ee0afa4e', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-18 22:01:38', '2021-02-18 22:01:38', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('f65c28ef1a5252874a0f816764bb2552', NULL, '192.168.104.1', 'blog_content', NULL, NULL, 1, '2020-11-13 10:14:32', '2020-11-13 10:14:32', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('f6872c510d66cd90acec96f4368fd2d0', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:09:26', '2021-04-12 09:09:26', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('f70a509fdfc03d13156f81416f82e580', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '6', 1, '2021-01-24 09:29:47', '2021-01-24 09:29:47', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('f71678c072b073fa46d0028796b39c70', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '31', 1, '2020-12-09 21:00:08', '2020-12-09 21:00:08', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('f747c2a6c40792ab563f471e5bef8f63', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:39:11', '2021-04-09 21:39:11', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('f751d79c40e8aeaa8e5fb1017ad694f9', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 12:00:05', '2021-02-23 12:00:05', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('f75561ac074431a447ed8d8a2e44b69c', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-03-16 16:02:23', '2021-03-16 16:02:23', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('f774b7895611ba502187681530e7bebf', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2020-12-26 11:31:11', '2020-12-26 11:31:11', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('f79096b6b51d350f6e9a085b56dacabe', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 17:29:08', '2020-12-04 17:29:08', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('f796a9b1bdd59ae37440b375489b75fc', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-24 09:44:37', '2021-01-24 09:44:37', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('f7b868b2a0cef2f4b584d7250c15f632', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年01月', 1, '2021-01-15 20:35:36', '2021-01-15 20:35:36', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('f7be744232b4e87e70bd0fefa008000d', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:24:22', '2021-03-25 09:24:22', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('f7c03b61fa0366a7acc278806ab0ef07', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-22 21:17:57', '2021-03-22 21:17:57', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('f7c2b73649655a20164149fc48ee508c', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 21:44:35', '2021-01-15 21:44:35', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('f7d3ed990e3555d9b81d68e3f10322e6', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:06:24', '2021-02-23 18:06:24', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('f844dd9f3775a0194ebde912af7dcba1', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-03-04 19:29:54', '2021-03-04 19:29:54', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('f8674e48a26e868e42c3c385675597c0', NULL, '192.168.104.1', 'blog_content', NULL, NULL, 1, '2020-11-19 16:29:06', '2020-11-19 16:29:06', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('f869a6cbab0b93cceec6b13973bdb6bb', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '4', 1, '2021-01-24 09:29:17', '2021-01-24 09:29:17', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('f8ab4f66b0acbc60c85bb92ef84b1815', NULL, '192.168.104.1', 'blog_content', '062ca3475e8193a4a81853a4bf41a8fa', NULL, 1, '2020-11-13 09:06:24', '2020-11-13 09:06:24', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('f8e8b24e59fd65b9eacce9b415f82655', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-01-24 10:00:51', '2021-01-24 10:00:51', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('f8e8ef219f23bbfb635eaeb2c19cf78b', NULL, '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-23 18:19:49', '2021-02-23 18:19:49', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('f8f71a8903491fa22cd92288ffe8901f', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 16:48:08', '2021-04-12 16:48:08', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('f914461914f2cea16e3f3e20b33e4a59', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-11 18:56:10', '2021-03-11 18:56:10', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('f92f292cfff4d504f28dafe571e760fb', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 15:57:11', '2020-12-04 15:57:11', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('f9560c4d745ae3710a94a64cf96fe1cf', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 21:38:44', '2021-04-09 21:38:44', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('f95a6690eff0ea8905d15ed21cae8d88', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '30', 1, '2020-12-12 10:43:44', '2020-12-12 10:43:44', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('f96ed250977448f27c19f9ca63320827', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-12-04 17:29:29', '2020-12-04 17:29:29', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('f98902bb9c51193860e71eb1fa37e871', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '44', 1, '2021-01-15 21:34:22', '2021-01-15 21:34:22', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('f9fe3c027a5e7f1cfdb2dbfdc7022b85', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:41:08', '2021-03-24 21:41:08', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('fa3f98b885e3568b871b47801785c9b1', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-02 15:22:03', '2021-01-02 15:22:03', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('fa42dea0117ff51fc85116a8ea27ee83', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-04-10 09:30:36', '2021-04-10 09:30:36', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('fa63e8414bc4a8aebe81da4e47d87c61', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-03-24 21:41:07', '2021-03-24 21:41:07', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('fab7b5b84e1dbe423c5984c3f003a291', NULL, '192.168.104.1', 'blog_content', NULL, '8', 1, '2020-12-04 16:41:17', '2020-12-04 16:41:17', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('fab879fdeca4c804db0f099961dd92e0', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '45', 1, '2021-02-23 18:18:49', '2021-02-23 18:18:49', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('fac418b663f2383f24fcd0caeb4efe2e', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-11 15:03:11', '2020-11-11 15:03:11', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('fada3dcc14f377fff0ca6dd341964587', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 18:19:25', '2021-02-23 18:19:25', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('faefa7ec704c7a1298921495c22eca1c', '6795d72d4b27b24e02acb38723ccc5d6', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年04月', 1, '2021-06-13 07:49:10', '2021-06-13 07:49:10', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('fafaefd09f19c1e01ed22f1a2aa5fa1b', NULL, '192.168.104.1', 'blog_content', NULL, '8', 1, '2020-11-20 22:05:43', '2020-11-20 22:05:43', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('fb177f70474bec11af22e6fc0bee9a32', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 18:23:43', '2021-02-23 18:23:43', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('fb64300f472fcb13c1a5777e6da6f971', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:26:41', '2021-03-25 09:26:41', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('fb99f5f32df2ff9e8e44a5694e5b96f7', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 10:00:51', '2021-03-25 10:00:51', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('fba1b53e5f4917de3812ac949290968b', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-22 08:34:34', '2020-11-22 08:34:34', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('fc066685e58f10bf8b7d59f4f5bc8057', '816d8eeb87df5b14f4a879d094ce7d82', '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 22:40:39', '2020-11-17 22:40:39', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('fc0b4194b92222de79d7ff9472d9bb6a', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 18:06:17', '2021-02-23 18:06:17', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('fc4c5ade622b243752fae538cc2d2b25', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-25 09:17:22', '2021-03-25 09:17:22', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('fc6f08f4bb41d6146e89b90adb3ed37a', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-07 10:29:09', '2021-01-07 10:29:09', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('fc78867f4c2c440fadcf1923bba4ce69', NULL, '0:0:0:0:0:0:0:1', 'visit_classify', 'a03d7290b1c04b6eaf46659661b47032', NULL, 1, '2021-03-22 21:21:05', '2021-03-22 21:21:05', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('fc817c0b7e9b7bc33099d6ec4836d6fd', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-04-12 16:31:03', '2021-04-12 16:31:03', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('fc84172708e017b2bd169e51a62f0137', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-28 21:07:12', '2021-02-28 21:07:12', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('fc97f2adfdaa5a5664413497f10c3208', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-27 13:16:41', '2021-02-27 13:16:41', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('fc9d4d5d1b078d580dbd58e448afa6d6', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '10', 1, '2021-01-24 09:29:54', '2021-01-24 09:29:54', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('fd055b374aa477a644118fe4b2d4f867', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2020年12月', 1, '2020-12-31 20:03:52', '2020-12-31 20:03:52', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('fd1d798fb1b7b7dca5a01b0ebd7a65a1', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-10 10:32:17', '2021-04-10 10:32:17', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('fd39c8b305e8aba046e2c999f1facda3', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-02 10:46:06', '2021-03-02 10:46:06', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('fd4f45f6f9a7af8f1a4a05196c9a3b10', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_tag', '5626932d452c2ad863d9b3cb0b69d22d', NULL, 1, '2021-02-28 21:06:53', '2021-02-28 21:06:53', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('fd55510ffc1420c08d80a0db3df5caed', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-11 16:54:01', '2021-04-11 16:54:01', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('fd7bc659b0bf5c2bf1127240ad851706', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-01-14 14:33:39', '2021-01-14 14:33:39', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('fded15572519ed1296d928d98b6c06e0', '4340b8d1f9123ccbdf5c82a012787473', '0:0:0:0:0:0:0:1', 'publish_comment', NULL, '测试评论', 1, '2020-12-26 15:27:59', '2020-12-26 15:27:59', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('fe0db77ff6069bc5879698fa18e6e412', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 15:21:20', '2021-02-23 15:21:20', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('fe12b9a82ff44b61715225ee4384a991', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 15:21:22', '2021-02-23 15:21:22', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('fe17e27981ab32442da8e6da8940f945', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-05-17 10:55:05', '2021-05-17 10:55:05', 'Windows', 'Chrome-90.0.4430.212', NULL);
INSERT INTO `t_web_visit` VALUES ('fe2ef08e54e74d5cc864c75288683e4f', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '31', 1, '2020-12-12 10:44:24', '2020-12-12 10:44:24', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('fe4812f301aae84191a2395cb4f8fe2b', NULL, '0:0:0:0:0:0:0:1', 'blog_content', NULL, '31', 1, '2020-12-12 10:29:00', '2020-12-12 10:29:00', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('fe55dc05ab71ffcd38f84291c18717d9', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2020-12-26 10:43:24', '2020-12-26 10:43:24', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('feba9a6b71bfd7ecf717c073415e8c21', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-23 16:52:54', '2021-02-23 16:52:54', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('fec4c51c56cd35a90164f9debfbc68f8', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 22:18:30', '2020-11-17 22:18:30', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('fed31ef153f874f70bae07e56757ae24', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-09 20:49:14', '2021-04-09 20:49:14', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('fef7d199395a29f8045a1789530a3fea', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2020年12月', 1, '2020-12-13 19:38:54', '2020-12-13 19:38:54', 'Windows', 'Chrome-86.0.4240.75', NULL);
INSERT INTO `t_web_visit` VALUES ('ff05b48d3e3f9670b38693667b65563e', '3c61610e3f04833f5d91084beb42166a', '192.168.104.1', 'visit_page', NULL, '关于我', 1, '2020-11-17 21:50:01', '2020-11-17 21:50:01', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('ff1007b2a1390824ddff01e985c389de', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 09:20:10', '2021-04-12 09:20:10', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('ff1bdb6cbc8dc7a800253b5f8abed3f4', NULL, '192.168.104.1', 'visit_page', NULL, 'INDEX', 1, '2020-11-17 22:14:07', '2020-11-17 22:14:07', 'Windows', 'Chrome-86.0.4240.75', '内网IP|内网IP');
INSERT INTO `t_web_visit` VALUES ('ff29e178b83fff9089c8b0d6c9e53a5e', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-11 19:29:28', '2021-03-11 19:29:28', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('ff33856677bfc328c740d74632a1fb0a', NULL, '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-02-23 15:25:36', '2021-02-23 15:25:36', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('ff41461d437d06e0787a9f79fc63e393', NULL, '0:0:0:0:0:0:0:1', 'blog_search', NULL, '测试', 1, '2021-03-22 21:26:38', '2021-03-22 21:26:38', 'Mac', 'Safari-13.0.3', NULL);
INSERT INTO `t_web_visit` VALUES ('ff43748ab558ec72264cc3a4efcb6a00', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-03-24 21:41:05', '2021-03-24 21:41:05', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('ff6bca63873676dde5c81a85181ed5f3', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-02-27 13:16:09', '2021-02-27 13:16:09', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('ff9bae82dd3a0bd779d7589039ba3d4b', NULL, '0:0:0:0:0:0:0:1', 'visit_page', NULL, '关于我', 1, '2021-02-23 16:51:54', '2021-02-23 16:51:54', 'Windows', 'Chrome-87.0.4280.88', NULL);
INSERT INTO `t_web_visit` VALUES ('ffb51740bcd47bee42ecf214fd835498', 'b486735e7b914e366840d01f049306e4', '0:0:0:0:0:0:0:1', 'visit_page', NULL, 'INDEX', 1, '2021-04-12 10:46:30', '2021-04-12 10:46:30', 'Windows', 'Chrome-88.0.4324.190', NULL);
INSERT INTO `t_web_visit` VALUES ('ffd3cfbbaf8559a719385da05994cd61', '4a8fd47742b7c10b07b3ef0c7da07bb7', '0:0:0:0:0:0:0:1', 'visit_sort', NULL, '2021年02月', 1, '2021-03-04 19:29:34', '2021-03-04 19:29:34', 'Windows', 'Chrome-88.0.4324.190', NULL);

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '租户容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp`, `tenant_id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'tenant_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------

-- ----------------------------
-- Table structure for oldUsers
-- ----------------------------
DROP TABLE IF EXISTS `oldUsers`;
CREATE TABLE `oldUsers`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oldUsers
-- ----------------------------
INSERT INTO `oldUsers` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);

SET FOREIGN_KEY_CHECKS = 1;
