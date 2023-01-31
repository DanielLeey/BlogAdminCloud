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

 Date: 21/01/2023 10:17:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

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

SET FOREIGN_KEY_CHECKS = 1;
