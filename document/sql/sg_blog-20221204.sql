/*
 Navicat Premium Data Transfer

 Source Server         : Blog
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : sg_blog

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 04/12/2022 18:09:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article_count
-- ----------------------------
DROP TABLE IF EXISTS `article_count`;
CREATE TABLE `article_count`  (
  `id` bigint NOT NULL COMMENT '文章id',
  `view_count` bigint NULL DEFAULT NULL COMMENT '浏览量',
  `comment_count` bigint NULL DEFAULT NULL COMMENT '评论数',
  `like_count` bigint NULL DEFAULT NULL COMMENT '点赞数',
  `collect_count` bigint NULL DEFAULT NULL COMMENT '收藏数',
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
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
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
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
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
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
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
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
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
  `id` bigint NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint NOT NULL AUTO_INCREMENT,
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
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
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
  `id` bigint UNSIGNED NOT NULL,
  `nid` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '文章内容',
  `summary` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章摘要',
  `category_id` bigint NULL DEFAULT NULL COMMENT '所属分类id',
  `article_tags` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签',
  `thumbnail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '缩略图',
  `is_top` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否置顶（0否，1是）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '状态（0已发布，1草稿）',
  `view_count` bigint NULL DEFAULT 0 COMMENT '访问量',
  `is_comment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否允许评论 1是，0否',
  `creator_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` bigint NULL DEFAULT NULL COMMENT '修改者id',
  `update_time` datetime NULL DEFAULT NULL,
  `del_flag` int NULL DEFAULT 0 COMMENT '删除标志（0代表未删除，1代表已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章表' ROW_FORMAT = Dynamic;

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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类名',
  `pid` bigint NULL DEFAULT -1 COMMENT '父分类id，如果没有父分类为-1',
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态0:正常,1禁用',
  `create_by` bigint NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` bigint NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `del_flag` int NULL DEFAULT 0 COMMENT '删除标志（0代表未删除，1代表已删除）',
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '评论类型（0代表文章评论，1代表友链评论）',
  `article_id` bigint NULL DEFAULT NULL COMMENT '文章id',
  `root_id` bigint NULL DEFAULT -1 COMMENT '根评论id',
  `content` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论内容',
  `to_comment_user_id` bigint NULL DEFAULT -1 COMMENT '所回复的目标评论的userid',
  `to_comment_id` bigint NULL DEFAULT -1 COMMENT '回复目标评论id',
  `create_by` bigint NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` bigint NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `del_flag` int NULL DEFAULT 0 COMMENT '删除标志（0代表未删除，1代表已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `logo` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '网站地址',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '2' COMMENT '审核状态 (0代表审核通过，1代表审核未通过，2代表未审核)',
  `create_by` bigint NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` bigint NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `del_flag` int NULL DEFAULT 0 COMMENT '删除标志（0代表未删除，1代表已删除）',
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
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2028 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, 1, 'M', '0', '0', '', 'system', 0, '2021-11-12 10:46:19', 0, NULL, '系统管理目录', '0');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', 1, 'C', '0', '0', 'system:user:list', 'user', 0, '2021-11-12 10:46:19', 1, '2022-07-31 15:47:58', '用户管理菜单', '0');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', 1, 'C', '0', '0', 'system:role:list', 'peoples', 0, '2021-11-12 10:46:19', 0, NULL, '角色管理菜单', '0');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 1, 'C', '0', '0', 'system:menu:list', 'tree-table', 0, '2021-11-12 10:46:19', 0, NULL, '菜单管理菜单', '0');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', 1, 'F', '0', '0', 'system:user:query', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', 1, 'F', '0', '0', 'system:user:add', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', 1, 'F', '0', '0', 'system:user:edit', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', 1, 'F', '0', '0', 'system:user:remove', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', 1, 'F', '0', '0', 'system:user:export', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', 1, 'F', '0', '0', 'system:user:import', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', 1, 'F', '0', '0', 'system:user:resetPwd', '#', 0, '2021-11-12 10:46:19', 0, NULL, '', '0');
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源URL',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `category_id` bigint NULL DEFAULT NULL COMMENT '资源分类ID',
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资源分类表' ROW_FORMAT = Dynamic;

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
  `uid` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `status` int NULL DEFAULT 1 COMMENT '启用状态：0->禁用；1->启用',
  `summary` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户角色表' ROW_FORMAT = DYNAMIC;

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
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint NULL DEFAULT NULL COMMENT '角色ID',
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

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'NULL' COMMENT '用户名',
  `nick_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'NULL' COMMENT '昵称',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'NULL' COMMENT '密码',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户类型：0代表普通用户，1代表管理员',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phonenumber` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户性别（0男，1女，2未知）',
  `avatar` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人的用户id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` int NULL DEFAULT 0 COMMENT '删除标志（0代表未删除，1代表已删除）',
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NULL DEFAULT NULL,
  `role_id` bigint NULL DEFAULT NULL,
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
  `sort` int NULL DEFAULT 0 COMMENT '排序字段，越大越靠前',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
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
INSERT INTO `t_category_menu` VALUES ('065cda845549289b2afcd0129d87c2c0', '新增用户', 3, '新增用户', 'fb4237a353d0418ab42c748b7c1d64c6', '/user/add', NULL, 0, 1, '2020-09-29 20:40:09', '2020-09-29 20:40:30', 1, 1, 0);
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
INSERT INTO `t_category_menu` VALUES ('2a733ff390af9b44ecda4e8c4634d75t', '重置密码', 3, '用户管理 重置密码', 'fb4237a353d0418ab42c748b7c1d64c6', '/user/resetUserPassword', NULL, 0, 1, '2020-03-21 18:23:19', '2020-04-21 08:28:37', 1, 1, 0);
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
INSERT INTO `t_category_menu` VALUES ('5010ae46511e4c0b9f30d1c63ad3f0c1', '角色管理', 2, '管理用户角色信息', 'd3a19221259d439b916f475e43edb13d', '/authority/role', 'el-icon-user', 0, 1, '2018-11-25 19:10:34', '2020-05-30 09:06:22', 1, 0, 0);
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
INSERT INTO `t_category_menu` VALUES ('72d26cf940bf9dfb6bde0a590ff4088s', '删除', 3, '用户管理，删除', 'fb4237a353d0418ab42c748b7c1d64c6', '/user/delete', NULL, 0, 1, '2020-03-21 18:22:51', '2020-04-21 08:28:30', 1, 1, 0);
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
INSERT INTO `t_category_menu` VALUES ('b511cae571834971a392ae4779270034', '游客管理', 2, '游客管理', 'c519725da92b42f3acf0cc9fad58c664', '/user/visitor', 'el-icon-news', 2, 1, '2018-11-28 19:54:28', '2020-05-30 08:47:06', 1, 0, 0);
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
INSERT INTO `t_category_menu` VALUES ('c519725da92b42f3acf0cc9fad58c664', '用户管理', 1, '用户管理', '', '/user', 'el-icon-house', 15, 1, '2018-11-28 19:51:47', '2020-05-30 08:46:44', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('cbd7ba11c1b38c66b569405ed9185f35', 'RabbitMQ', 2, 'RabbitMQ监控中心', '147cd431cbb9007bde87444d7987b151', 'http://localhost:15672', 'el-icon-sunny', 3, 1, '2020-01-05 21:29:39', '2020-12-05 15:31:33', 1, 0, 1);
INSERT INTO `t_category_menu` VALUES ('ccc0dced06919403832647a871312f09', '删除选中', 3, '专题管理 删除选中', '3e92f2fd6cf012d30bfae2d9cdb7092d', '/subject/deleteBatch', NULL, 0, 1, '2020-08-23 08:57:45', '2020-08-23 08:57:45', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('d3a19221259d439b916f475e43edb13d', '权限管理', 1, '对管理员权限分配进行管理', '', '/authority', 'el-icon-user', 18, 1, '2018-11-25 19:08:42', '2020-05-30 08:44:17', 1, 0, 0);
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
INSERT INTO `t_category_menu` VALUES ('f87d2f9b4539abbade38583420dc8b8r', '编辑', 3, '用户管理 编辑', 'fb4237a353d0418ab42c748b7c1d64c6', '/user/edit', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
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
INSERT INTO `t_category_menu` VALUES ('fb4237a353d0418ab42c748b7c1d64c6', '用户管理', 2, '用户管理', 'c519725da92b42f3acf0cc9fad58c664', '/user/user', 'el-icon-headset', 3, 1, '2018-11-28 19:52:20', '2020-05-30 08:46:54', 1, 0, 0);
INSERT INTO `t_category_menu` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ca0m', '查询', 3, '资源分类 查询', '9449ce5dd5e24b21a9d15f806cb36e87', '/resourceSort/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ce0m', '查询', 3, '友情链接 查询', '9002d1ae905c4cb79c2a485333dad2f7', '/link/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ce1m', '查询', 3, '菜单管理 查询', 'aa225cdae6464bc0acebd732192f8362', '/categoryMenu/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ce99', '查询', 3, '分类管理 查询', '0a035547bbec404eb3ee0ef43312148d', '/blogSort/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ce9d', '查询', 3, '标签管理 查询', '6606b7e646d545e5a25c70b5e5fade9f', '/tag/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ce9m', '查询', 3, '评论管理 查询', '9beb7caa2c844b36a02789262dc76fbe', '/comment/getList', NULL, 1, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_category_menu` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ce9q', '查询', 3, '用户管理 查询', 'fb4237a353d0418ab42c748b7c1d64c6', '/user/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
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
  `sort` int NULL DEFAULT 0 COMMENT '排序字段，越大越靠前',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否显示 1:是 0:否',
  `menu_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '菜单类型 0: 菜单   1: 按钮',
  `is_jump_external_url` tinyint(1) NULL DEFAULT 0 COMMENT '是否跳转外部链接 0：否，1：是',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_resource
-- ----------------------------
INSERT INTO `t_sys_resource` VALUES ('02ea2f9ef5d44f559fb66189b05f6769', 'Solr', 2, 'Solr监控中心', '147cd431cbb9007bde87444d7987b151', '/monitor/Solr', 'el-icon-lightning', 0, 1, '2018-11-30 03:55:39', '2020-12-09 20:41:22', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('062087bce19d00312b3787b6e24c21d1', '字典数据', 2, '字典数据', 'badf0010422b432ba6ec9c83a25012ed', '/system/sysDictData', 'el-icon-data-line', 0, 1, '2020-02-21 18:06:11', '2020-05-30 08:44:04', 0, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('065cda845549289b2afcd0129d87c2c0', '新增用户', 3, '新增用户', 'fb4237a353d0418ab42c748b7c1d64c6', '/user/add', NULL, 0, 1, '2020-09-29 20:40:09', '2020-09-29 20:40:30', 1, 1, 0);
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
INSERT INTO `t_sys_resource` VALUES ('2a733ff390af9b44ecda4e8c4634d75t', '重置密码', 3, '用户管理 重置密码', 'fb4237a353d0418ab42c748b7c1d64c6', '/user/resetUserPassword', NULL, 0, 1, '2020-03-21 18:23:19', '2020-04-21 08:28:37', 1, 1, 0);
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
INSERT INTO `t_sys_resource` VALUES ('5010ae46511e4c0b9f30d1c63ad3f0c1', '角色管理', 2, '管理用户角色信息', 'd3a19221259d439b916f475e43edb13d', '/authority/role', 'el-icon-user', 0, 1, '2018-11-25 19:10:34', '2020-05-30 09:06:22', 1, 0, 0);
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
INSERT INTO `t_sys_resource` VALUES ('72d26cf940bf9dfb6bde0a590ff4088s', '删除', 3, '用户管理，删除', 'fb4237a353d0418ab42c748b7c1d64c6', '/user/delete', NULL, 0, 1, '2020-03-21 18:22:51', '2020-04-21 08:28:30', 1, 1, 0);
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
INSERT INTO `t_sys_resource` VALUES ('b511cae571834971a392ae4779270034', '游客管理', 2, '游客管理', 'c519725da92b42f3acf0cc9fad58c664', '/user/visitor', 'el-icon-news', 2, 1, '2018-11-28 19:54:28', '2020-05-30 08:47:06', 1, 0, 0);
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
INSERT INTO `t_sys_resource` VALUES ('c519725da92b42f3acf0cc9fad58c664', '用户管理', 1, '用户管理', '', '/user', 'el-icon-house', 15, 1, '2018-11-28 19:51:47', '2020-05-30 08:46:44', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('cbd7ba11c1b38c66b569405ed9185f35', 'RabbitMQ', 2, 'RabbitMQ监控中心', '147cd431cbb9007bde87444d7987b151', 'http://localhost:15672', 'el-icon-sunny', 3, 1, '2020-01-05 21:29:39', '2020-12-05 15:31:33', 1, 0, 1);
INSERT INTO `t_sys_resource` VALUES ('ccc0dced06919403832647a871312f09', '删除选中', 3, '专题管理 删除选中', '3e92f2fd6cf012d30bfae2d9cdb7092d', '/subject/deleteBatch', NULL, 0, 1, '2020-08-23 08:57:45', '2020-08-23 08:57:45', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('d3a19221259d439b916f475e43edb13d', '权限管理', 1, '对管理员权限分配进行管理', '', '/authority', 'el-icon-user', 18, 1, '2018-11-25 19:08:42', '2020-05-30 08:44:17', 1, 0, 0);
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
INSERT INTO `t_sys_resource` VALUES ('f87d2f9b4539abbade38583420dc8b8r', '编辑', 3, '用户管理 编辑', 'fb4237a353d0418ab42c748b7c1d64c6', '/user/edit', NULL, 0, 1, '2020-03-21 21:35:57', '2020-03-21 21:35:57', 1, 1, 0);
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
INSERT INTO `t_sys_resource` VALUES ('fb4237a353d0418ab42c748b7c1d64c6', '用户管理', 2, '用户管理', 'c519725da92b42f3acf0cc9fad58c664', '/user/user', 'el-icon-headset', 3, 1, '2018-11-28 19:52:20', '2020-05-30 08:46:54', 1, 0, 0);
INSERT INTO `t_sys_resource` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ca0m', '查询', 3, '资源分类 查询', '9449ce5dd5e24b21a9d15f806cb36e87', '/resourceSort/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ce0m', '查询', 3, '友情链接 查询', '9002d1ae905c4cb79c2a485333dad2f7', '/link/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ce1m', '查询', 3, '菜单管理 查询', 'aa225cdae6464bc0acebd732192f8362', '/categoryMenu/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ce99', '查询', 3, '分类管理 查询', '0a035547bbec404eb3ee0ef43312148d', '/blogSort/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ce9d', '查询', 3, '标签管理 查询', '6606b7e646d545e5a25c70b5e5fade9f', '/tag/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ce9m', '查询', 3, '评论管理 查询', '9beb7caa2c844b36a02789262dc76fbe', '/comment/getList', NULL, 1, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
INSERT INTO `t_sys_resource` VALUES ('fbc30e4ae5bb33b39baca7bf6bd8ce9q', '查询', 3, '用户管理 查询', 'fb4237a353d0418ab42c748b7c1d64c6', '/user/getList', NULL, 0, 1, '2020-03-21 21:36:28', '2020-03-21 21:36:28', 1, 1, 0);
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

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '租户容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp`, `tenant_id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'tenant_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);

SET FOREIGN_KEY_CHECKS = 1;
