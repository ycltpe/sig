/*
Navicat MySQL Data Transfer

Source Server         : localhost_iis
Source Server Version : 50606
Source Host           : localhost:3306
Source Database       : nahuikou

Target Server Type    : MYSQL
Target Server Version : 50606
File Encoding         : 65001

Date: 2014-09-16 17:52:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_access`
-- ----------------------------
DROP TABLE IF EXISTS `t_access`;
CREATE TABLE `t_access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `pid` smallint(6) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_access
-- ----------------------------
INSERT INTO `t_access` VALUES ('2', '1', '1', '0', null);
INSERT INTO `t_access` VALUES ('2', '40', '2', '1', null);
INSERT INTO `t_access` VALUES ('2', '30', '2', '1', null);
INSERT INTO `t_access` VALUES ('3', '1', '1', '0', null);
INSERT INTO `t_access` VALUES ('2', '69', '2', '1', null);
INSERT INTO `t_access` VALUES ('2', '50', '3', '40', null);
INSERT INTO `t_access` VALUES ('3', '50', '3', '40', null);
INSERT INTO `t_access` VALUES ('1', '50', '3', '40', null);
INSERT INTO `t_access` VALUES ('3', '7', '2', '1', null);
INSERT INTO `t_access` VALUES ('3', '39', '3', '30', null);
INSERT INTO `t_access` VALUES ('2', '39', '3', '30', null);
INSERT INTO `t_access` VALUES ('2', '49', '3', '30', null);
INSERT INTO `t_access` VALUES ('4', '1', '1', '0', null);
INSERT INTO `t_access` VALUES ('4', '2', '2', '1', null);
INSERT INTO `t_access` VALUES ('4', '3', '2', '1', null);
INSERT INTO `t_access` VALUES ('4', '4', '2', '1', null);
INSERT INTO `t_access` VALUES ('4', '5', '2', '1', null);
INSERT INTO `t_access` VALUES ('4', '6', '2', '1', null);
INSERT INTO `t_access` VALUES ('4', '7', '2', '1', null);
INSERT INTO `t_access` VALUES ('4', '11', '2', '1', null);
INSERT INTO `t_access` VALUES ('5', '25', '1', '0', null);
INSERT INTO `t_access` VALUES ('5', '51', '2', '25', null);
INSERT INTO `t_access` VALUES ('1', '1', '1', '0', null);
INSERT INTO `t_access` VALUES ('1', '39', '3', '30', null);
INSERT INTO `t_access` VALUES ('1', '69', '2', '1', null);
INSERT INTO `t_access` VALUES ('1', '30', '2', '1', null);
INSERT INTO `t_access` VALUES ('1', '40', '2', '1', null);
INSERT INTO `t_access` VALUES ('1', '49', '3', '30', null);
INSERT INTO `t_access` VALUES ('3', '69', '2', '1', null);
INSERT INTO `t_access` VALUES ('3', '30', '2', '1', null);
INSERT INTO `t_access` VALUES ('3', '40', '2', '1', null);
INSERT INTO `t_access` VALUES ('1', '37', '3', '30', null);
INSERT INTO `t_access` VALUES ('1', '36', '3', '30', null);
INSERT INTO `t_access` VALUES ('1', '35', '3', '30', null);
INSERT INTO `t_access` VALUES ('1', '34', '3', '30', null);
INSERT INTO `t_access` VALUES ('1', '33', '3', '30', null);
INSERT INTO `t_access` VALUES ('1', '32', '3', '30', null);
INSERT INTO `t_access` VALUES ('1', '31', '3', '30', null);
INSERT INTO `t_access` VALUES ('2', '32', '3', '30', null);
INSERT INTO `t_access` VALUES ('2', '31', '3', '30', null);
INSERT INTO `t_access` VALUES ('7', '1', '1', '0', null);
INSERT INTO `t_access` VALUES ('7', '30', '2', '1', null);
INSERT INTO `t_access` VALUES ('7', '40', '2', '1', null);
INSERT INTO `t_access` VALUES ('7', '69', '2', '1', null);
INSERT INTO `t_access` VALUES ('7', '50', '3', '40', null);
INSERT INTO `t_access` VALUES ('7', '39', '3', '30', null);
INSERT INTO `t_access` VALUES ('7', '49', '3', '30', null);
INSERT INTO `t_access` VALUES ('1', '90', '2', '1', null);

-- ----------------------------
-- Table structure for `t_admin_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_user`;
CREATE TABLE `t_admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '后台用户ID',
  `name` varchar(20) DEFAULT '' COMMENT '名称',
  `username` varchar(50) DEFAULT '' COMMENT '用户登录名称',
  `password` varchar(200) NOT NULL DEFAULT '' COMMENT '密码',
  `part_id` int(11) DEFAULT '2' COMMENT '权限（1：管理员；2：普通用户）',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) DEFAULT '1' COMMENT '上次登录时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin_user
-- ----------------------------
INSERT INTO `t_admin_user` VALUES ('2', '付文波', '1181958400@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '1', '1402640859', '1409931009');
INSERT INTO `t_admin_user` VALUES ('14', 'ganbing', 'bing.gan', '827ccb0eea8a706c4c34a16891f84e7b', '1', '1406276295', '1406276295');
INSERT INTO `t_admin_user` VALUES ('12', '赖财旺', 'caiwang.lai@sigboat.com', 'e10adc3949ba59abbe56e057f20f883e', '1', '1406182567', '1407115159');
INSERT INTO `t_admin_user` VALUES ('9', '胡美乐', '1124791554@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '1', '1406181436', '1409906203');
INSERT INTO `t_admin_user` VALUES ('15', '张正国', 'zhengguo.zhang@sigboat.com', 'e10adc3949ba59abbe56e057f20f883e', '1', '1406600268', '1409385391');
INSERT INTO `t_admin_user` VALUES ('16', '丁百计', 'baiji.ding@sigboat.com', 'e10adc3949ba59abbe56e057f20f883e', '1', '1406774171', '1409907227');
INSERT INTO `t_admin_user` VALUES ('17', '彭帆', '277088798@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '1', '1408348817', '1409932349');
INSERT INTO `t_admin_user` VALUES ('18', '陈志梅', 'zhimei.chen@sigboat.com', '3dd026ec0fd8578945cd49a5b4946beb', '1', '1409537555', '1409905981');
INSERT INTO `t_admin_user` VALUES ('19', '凌斌', 'jojojo574@yahoo.com', 'e165d4f2174b66a7d1a95cb204d296eb', '1', '1409597640', '1409951565');
INSERT INTO `t_admin_user` VALUES ('20', 'tiancaiwu', 'tiancaiwu@sina.com', '22ed349c996633dd4a972f861e18fc56', '1', '1409953457', '1409953505');
INSERT INTO `t_admin_user` VALUES ('21', 'admin', 'admin@qq.com', '21232f297a57a5a743894a0e4a801fc3', '1', '1409597640', '1410846915');

-- ----------------------------
-- Table structure for `t_app_version`
-- ----------------------------
DROP TABLE IF EXISTS `t_app_version`;
CREATE TABLE `t_app_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '版本更新ID',
  `name` varchar(100) DEFAULT '' COMMENT '应用名称',
  `app_id` varchar(200) DEFAULT '' COMMENT '应用ID',
  `app_type` int(11) DEFAULT '1' COMMENT 'app类型（1:商家端;2:客户端）',
  `version_code` double DEFAULT '1' COMMENT '版本号',
  `version_name` varchar(50) DEFAULT '' COMMENT '版本名称',
  `type` int(11) DEFAULT '1' COMMENT '应用类型（1:android;2:ios）',
  `file_android_url` varchar(200) DEFAULT '' COMMENT 'android版本地址',
  `file_ios_url` varchar(200) DEFAULT '' COMMENT 'ios地址',
  `create_msg` text COMMENT '更新日志',
  `create_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_app_version
-- ----------------------------
INSERT INTO `t_app_version` VALUES ('1', '拿回扣', 'com.glenmere.nhk.retailer', '1', '1', '1.0', '1', 'Uploads/app/FanLiShangJia.apk', '', '所有功能基本完成', '1409929765');
INSERT INTO `t_app_version` VALUES ('2', '拿回扣', 'com.glenmere.nhk.retailer', '1', '1', '1.0', '1', 'Uploads/app/FanLiShangJia.apk', '', '第一版本', '1409930810');
INSERT INTO `t_app_version` VALUES ('3', '拿回扣', 'com.glenmere.nhk.customer', '1', '1', '1.0', '1', 'Uploads/app/Kickbacks.apk', '', '初次版本', '1409932442');

-- ----------------------------
-- Table structure for `t_arctype`
-- ----------------------------
DROP TABLE IF EXISTS `t_arctype`;
CREATE TABLE `t_arctype` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `p_id` int(4) unsigned NOT NULL DEFAULT '0',
  `name` varchar(20) NOT NULL DEFAULT '',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0',
  `channeltype` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sortrank` smallint(5) unsigned NOT NULL DEFAULT '0',
  `status` smallint(2) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_arctype
-- ----------------------------
INSERT INTO `t_arctype` VALUES ('1', '0', '产品与方案', '0', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('2', '0', '服务内容', '0', '1', '0', '1');
INSERT INTO `t_arctype` VALUES ('3', '0', '典型案例', '0', '1', '0', '1');
INSERT INTO `t_arctype` VALUES ('4', '0', '技术天使', '0', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('5', '0', '客户与伙伴', '0', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('6', '0', '关于行帆', '0', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('7', '0', '联系我们', '0', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('8', '1', '移动产品', '0', '1', '0', '1');
INSERT INTO `t_arctype` VALUES ('9', '1', '解决方案', '0', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('10', '1', '微信平台', '0', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('11', '2', '移动战略咨询', '0', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('12', '2', '移动产品设计', '0', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('13', '2', '开发与测试', '0', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('14', '2', '运营与推广', '0', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('15', '2', '维护与升级', '0', '1', '0', '1');
INSERT INTO `t_arctype` VALUES ('16', '3', '经典案例', '0', '1', '0', '1');
INSERT INTO `t_arctype` VALUES ('17', '3', '500强案例', '0', '1', '0', '1');
INSERT INTO `t_arctype` VALUES ('18', '6', '创始人介绍', '0', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('19', '6', '股东介绍', '0', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('20', '6', '公司简介', '0', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('21', '6', '行帆历程', '0', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('22', '6', '行帆文化', '0', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('23', '7', 'aaa', '0', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('24', '11', '企业移动化咨询', '1', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('25', '11', '消费者移动产品咨询', '1', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('26', '12', '产品UI原型图制作', '1', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('27', '12', 'GUI效果图制作', '1', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('28', '12', '用户体验测试与该机', '1', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('29', '13', '安卓（Android）开发', '1', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('30', '13', '苹果（IOS）开发', '1', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('31', '13', '微信公众号开发', '1', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('32', '13', '移动网站开发', '1', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('33', '13', '网站开发', '1', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('34', '14', '产品运营', '1', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('35', '14', 'APP Store运营', '1', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('36', '13', '企业系统开发', '1', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('37', '13', '后台系统与接口开发', '1', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('38', '13', 'Q&A测试', '1', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('39', '14', '运营监控', '1', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('40', '14', '市场营销', '1', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('41', '14', '推广活动策划', '1', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('42', '14', '合作推广', '1', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('43', '15', 'BUG维修', '1', '2', '0', '1');
INSERT INTO `t_arctype` VALUES ('44', '15', '迭代开发', '1', '2', '0', '1');

-- ----------------------------
-- Table structure for `t_bank`
-- ----------------------------
DROP TABLE IF EXISTS `t_bank`;
CREATE TABLE `t_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '银行卡表',
  `name` varchar(100) DEFAULT '' COMMENT '银行名称',
  `type` int(11) DEFAULT '1' COMMENT '银行卡类别（1：国内银行，2：国外银行）',
  `logo_android` varchar(200) DEFAULT '' COMMENT 'android银行卡logo',
  `logo_ios` varchar(200) DEFAULT '' COMMENT 'ios银行卡LOGO',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bank
-- ----------------------------
INSERT INTO `t_bank` VALUES ('1', '中国工商银行（ICBC）', '1', 'Uploads/bank/android/ICBC.png', 'Uploads/bank/ios/ICBC.png');
INSERT INTO `t_bank` VALUES ('2', '中国建设银行（CCB）', '1', 'Uploads/bank/android/CCB.png', 'Uploads/bank/ios/CCB.png');
INSERT INTO `t_bank` VALUES ('3', '中国农业银行（ABC）', '1', 'Uploads/bank/android/ABC.png', 'Uploads/bank/ios/ABC.png');
INSERT INTO `t_bank` VALUES ('4', '中国银行（BOC）', '1', 'Uploads/bank/android/BOC.png', 'Uploads/bank/ios/BOC.png');
INSERT INTO `t_bank` VALUES ('5', '交通银行（BOCOM）', '1', 'Uploads/bank/android/BOCOM.png', 'Uploads/bank/ios/BOCOM.png');
INSERT INTO `t_bank` VALUES ('6', '招商银行（CMB）', '1', 'Uploads/bank/android/CMB.png', 'Uploads/bank/ios/CMB.png');
INSERT INTO `t_bank` VALUES ('7', '兴业银行（CIB）', '1', 'Uploads/bank/android/CIB.png', 'Uploads/bank/ios/CIB.png');
INSERT INTO `t_bank` VALUES ('8', '浦发银行（SPDB）', '1', 'Uploads/bank/android/SPDB.png', 'Uploads/bank/ios/SPDB.png');
INSERT INTO `t_bank` VALUES ('9', '中信银行（Citic）', '1', 'Uploads/bank/android/Citic.png', 'Uploads/bank/ios/Citic.png');
INSERT INTO `t_bank` VALUES ('10', '中国民生银行（CMBC）', '1', 'Uploads/bank/android/CMBC.png', 'Uploads/bank/ios/CMBC.png');
INSERT INTO `t_bank` VALUES ('11', '中国光大银行（CEB）', '1', 'Uploads/bank/android/CEB.png', 'Uploads/bank/ios/CEB.png');
INSERT INTO `t_bank` VALUES ('12', '广发银行（CGB）', '1', 'Uploads/bank/android/CGB.png', 'Uploads/bank/ios/CGB.png');
INSERT INTO `t_bank` VALUES ('14', '汇丰控股公司（HSBC Holding）', '2', 'Uploads/bank/android/2014/20140822/53f6ef4d91a9e.jpg', 'Uploads/bank/ios/2014/20140822/53f6ef56c7c1c.jpg');

-- ----------------------------
-- Table structure for `t_banner`
-- ----------------------------
DROP TABLE IF EXISTS `t_banner`;
CREATE TABLE `t_banner` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `lit_title` varchar(100) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `status` smallint(2) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_banner
-- ----------------------------
INSERT INTO `t_banner` VALUES ('1', '领先的移动互联网全球服务机构', '专注于企业移动信息化技术开发与服务', 'Uploads/pic/banner/2014/20140912/541299e27e5aa.png', '1');
INSERT INTO `t_banner` VALUES ('2', '领先的移动互联网全球服务机构7', '专注于企业移动信息化技术开发与服务', 'Uploads/pic/banner/2014/20140912/541294e78654a.png', '1');

-- ----------------------------
-- Table structure for `t_brand`
-- ----------------------------
DROP TABLE IF EXISTS `t_brand`;
CREATE TABLE `t_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '品牌ID',
  `name` varchar(200) DEFAULT '' COMMENT '品牌名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_brand
-- ----------------------------
INSERT INTO `t_brand` VALUES ('1', 'Apple 苹果');
INSERT INTO `t_brand` VALUES ('2', 'AVON 雅芳');
INSERT INTO `t_brand` VALUES ('3', 'Anytime 艾她');
INSERT INTO `t_brand` VALUES ('4', 'Bossini 堡狮龙');
INSERT INTO `t_brand` VALUES ('5', 'Ya Shi Lan dai 雅诗兰黛');
INSERT INTO `t_brand` VALUES ('6', 'LOUIS  VUITTON 路易·威登');
INSERT INTO `t_brand` VALUES ('7', 'Armani 阿玛尼');
INSERT INTO `t_brand` VALUES ('8', 'zhonghua 中华');
INSERT INTO `t_brand` VALUES ('9', '傲凤');

-- ----------------------------
-- Table structure for `t_bussiness_pay`
-- ----------------------------
DROP TABLE IF EXISTS `t_bussiness_pay`;
CREATE TABLE `t_bussiness_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商家支付ID',
  `store_id` int(11) DEFAULT '0' COMMENT '商店ID',
  `money` float(11,2) DEFAULT '0.00' COMMENT '交易金额',
  `type` int(11) DEFAULT '1' COMMENT '消费类型（1、支出，2、收入）',
  `fate` varchar(200) DEFAULT '' COMMENT '来源或去向',
  `status` int(11) DEFAULT '1' COMMENT '交易状态（1、成功，2、失败，3、等待中）',
  `create_time` int(11) DEFAULT NULL COMMENT '交易时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bussiness_pay
-- ----------------------------
INSERT INTO `t_bussiness_pay` VALUES ('1', '8', '120.00', '1', '商家打款', '1', '1409217631');

-- ----------------------------
-- Table structure for `t_case`
-- ----------------------------
DROP TABLE IF EXISTS `t_case`;
CREATE TABLE `t_case` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '',
  `case_cate_id` smallint(5) unsigned NOT NULL,
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `isa` smallint(2) unsigned NOT NULL DEFAULT '1',
  `isi` smallint(2) unsigned NOT NULL DEFAULT '1',
  `usergroups` varchar(100) NOT NULL DEFAULT '',
  `designstyle` varchar(100) NOT NULL DEFAULT '',
  `is500` smallint(2) unsigned NOT NULL DEFAULT '0',
  `isclassic` smallint(2) unsigned NOT NULL DEFAULT '0',
  `created` int(11) unsigned NOT NULL DEFAULT '0',
  `status` smallint(2) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_case
-- ----------------------------
INSERT INTO `t_case` VALUES ('3', '平安随行', '2', 'Uploads/pic/case/2014/20140915/5416b1bc12db2.png', '<div id=\"u1472\" class=\"u1472\">\r\n	<div id=\"u1472_rtf\">\r\n		<p style=\"text-align:left;\">\r\n			<span style=\"font-family:微软雅黑;font-size:18px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;\"> </span><span style=\"font-family:微软雅黑;font-size:18px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;\">行帆科技为平安集团的长期供应商，为平安集团开发了数款移动APP。平安随行是行帆科技为中国平安集团定制开发的第一款应用。</span><span style=\"font-family:微软雅黑;font-size:18px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;\">主要功能有：语音导航、路况查询、违章查询、新闻资讯、周边搜罗、周边好友、车险服务、趣味游戏、生活服务，</span><span style=\"font-family:微软雅黑;font-size:18px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;\">为所有车主用户提供行车、资讯、交友、游戏、生活等全面丰富的信息和服务。</span> \r\n		</p>\r\n	</div>\r\n</div>', '1', '1', '123456', '1234567', '1', '1', '1410761939', '1');

-- ----------------------------
-- Table structure for `t_case_cate`
-- ----------------------------
DROP TABLE IF EXISTS `t_case_cate`;
CREATE TABLE `t_case_cate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catename` varchar(50) NOT NULL DEFAULT '',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0',
  `status` smallint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_case_cate
-- ----------------------------
INSERT INTO `t_case_cate` VALUES ('1', '移动教育', '0', '1');
INSERT INTO `t_case_cate` VALUES ('2', '移动金融', '0', '1');
INSERT INTO `t_case_cate` VALUES ('3', '快销行业', '0', '1');
INSERT INTO `t_case_cate` VALUES ('4', '医疗健康', '0', '1');
INSERT INTO `t_case_cate` VALUES ('5', '智能穿戴', '0', '1');
INSERT INTO `t_case_cate` VALUES ('6', '生活服务', '0', '1');
INSERT INTO `t_case_cate` VALUES ('7', '美容健身', '0', '1');
INSERT INTO `t_case_cate` VALUES ('8', '移动信息化', '0', '1');
INSERT INTO `t_case_cate` VALUES ('9', '移动O2O', '0', '1');
INSERT INTO `t_case_cate` VALUES ('10', '旅游', '0', '1');
INSERT INTO `t_case_cate` VALUES ('11', '工具', '0', '1');
INSERT INTO `t_case_cate` VALUES ('12', '农业', '0', '1');
INSERT INTO `t_case_cate` VALUES ('13', '汽车', '0', '1');
INSERT INTO `t_case_cate` VALUES ('14', '房产', '0', '1');
INSERT INTO `t_case_cate` VALUES ('15', '物流', '0', '1');
INSERT INTO `t_case_cate` VALUES ('16', '其它', '0', '1');

-- ----------------------------
-- Table structure for `t_category`
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '种类ID',
  `en_name` varchar(20) DEFAULT '' COMMENT '英文名称',
  `cn_name` varchar(20) DEFAULT '' COMMENT '中文名称',
  `pic` varchar(200) DEFAULT '' COMMENT '种类图片',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES ('1', 'Women', '女装', 'Uploads/pic/category/icon_yifu.png');
INSERT INTO `t_category` VALUES ('2', 'Men', '男装', 'Uploads/pic/category/icon_nanzhuang.png');
INSERT INTO `t_category` VALUES ('3', 'Women‘sShoes', '女鞋', 'Uploads/pic/category/icon_nvxie.png');
INSERT INTO `t_category` VALUES ('4', 'Men’Shoes', '男鞋', 'Uploads/pic/category/icon_nanxie.png');
INSERT INTO `t_category` VALUES ('5', 'Bags', '箱包', 'Uploads/pic/category/icon_xiebao.png');
INSERT INTO `t_category` VALUES ('6', 'Glasses', '眼镜', 'Uploads/pic/category/icon_yanjing.png');
INSERT INTO `t_category` VALUES ('7', 'Cosmetics', '化妆品', 'Uploads/pic/Category/2014/20140830/540147256596b.png');
INSERT INTO `t_category` VALUES ('8', 'Caestus ', '腰带', 'Uploads/pic/Category/2014/20140830/540145004020a.png');
INSERT INTO `t_category` VALUES ('9', 'sport', '运动', 'Uploads/pic/category/2014/20140830/54018dad48680.png');

-- ----------------------------
-- Table structure for `t_chat`
-- ----------------------------
DROP TABLE IF EXISTS `t_chat`;
CREATE TABLE `t_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '交流表ID',
  `foot_id` int(11) DEFAULT '0' COMMENT '足迹ID',
  `content` text COMMENT '交流内容',
  `from_user_id` int(11) DEFAULT '0' COMMENT '发消息用户ID',
  `to_user_id` int(11) DEFAULT '0' COMMENT '接收消息用户ID',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_chat
-- ----------------------------
INSERT INTO `t_chat` VALUES ('1', null, '%E4%BD%A0%E5%91%80%21%E4%BD%A0', '10003', '10009', '1409220523');
INSERT INTO `t_chat` VALUES ('2', null, '而任天堂', '10009', '10003', '1409220570');
INSERT INTO `t_chat` VALUES ('3', null, '244', '10003', '10009', '1409221628');
INSERT INTO `t_chat` VALUES ('4', null, 'hs&hhd', '10001', '10010', '1409278504');
INSERT INTO `t_chat` VALUES ('5', null, '我儿童', '10001', '10010', '1409279858');
INSERT INTO `t_chat` VALUES ('6', null, '%E5%93%88%E5%93%88%E5%93%88%E5%93%88%E5%93%88', '10020', '10001', '1409279929');
INSERT INTO `t_chat` VALUES ('7', null, '\'拔出来', '10001', '10020', '1409280195');
INSERT INTO `t_chat` VALUES ('8', null, '%E5%91%83%E5%91%83%E5%91%83', '10020', '10001', '1409280313');
INSERT INTO `t_chat` VALUES ('9', null, '逗逼', '10001', '10003', '1409295781');
INSERT INTO `t_chat` VALUES ('10', null, 'aassxcc', '10003', '10001', '1409295814');
INSERT INTO `t_chat` VALUES ('11', null, '%E4%BD%A0%E7%9A%84%E5%A5%BD', '10003', '10001', '1409295826');
INSERT INTO `t_chat` VALUES ('12', null, '我们', '10003', '10001', '1409297398');
INSERT INTO `t_chat` VALUES ('13', null, '鹅鹅鹅', '10001', '10003', '1409297412');
INSERT INTO `t_chat` VALUES ('14', null, 'hjj', '10025', '10008', '1409309782');
INSERT INTO `t_chat` VALUES ('15', null, '寄存基础上计策长时间', '10001', '10020', '1409366844');
INSERT INTO `t_chat` VALUES ('16', null, '聚聚u就', '10001', '10002', '1409370967');
INSERT INTO `t_chat` VALUES ('17', '0', 'Ghh', '10009', '10003', '1409388911');
INSERT INTO `t_chat` VALUES ('18', '0', 'ertgygh的方法骨灰盒', '10003', '10009', '1409388998');
INSERT INTO `t_chat` VALUES ('19', '0', '得到發廣告', '10003', '10009', '1409389345');
INSERT INTO `t_chat` VALUES ('20', '0', '發剛剛過後', '10003', '10009', '1409389506');
INSERT INTO `t_chat` VALUES ('21', '0', 'Hdjfjjfjgjf', '10013', '10002', '1409456285');
INSERT INTO `t_chat` VALUES ('22', '0', 'Hdhfhhf', '10013', '10002', '1409456290');
INSERT INTO `t_chat` VALUES ('23', '0', 'Hfjjfjfjf', '10013', '10002', '1409456295');
INSERT INTO `t_chat` VALUES ('24', '0', 'Hfhfjfhjfjfjf', '10013', '10002', '1409456299');
INSERT INTO `t_chat` VALUES ('25', '0', 'Hdhfhfhfhhf', '10013', '10002', '1409456301');
INSERT INTO `t_chat` VALUES ('26', '0', 'Hdhjffjhfhfhf', '10013', '10002', '1409456302');
INSERT INTO `t_chat` VALUES ('27', '0', 'Hdhfhhdhfd', '10013', '10002', '1409456303');
INSERT INTO `t_chat` VALUES ('28', '0', 'Hdhfhfhhdhdd', '10013', '10002', '1409456303');
INSERT INTO `t_chat` VALUES ('29', '0', 'Benghazi', '10013', '10002', '1409456304');
INSERT INTO `t_chat` VALUES ('30', '0', 'Hhfhdhjddj', '10013', '10002', '1409456307');
INSERT INTO `t_chat` VALUES ('31', '0', 'Hdhfhhfhdhddhfhf', '10013', '10002', '1409456311');
INSERT INTO `t_chat` VALUES ('32', '0', 'Hdfhdhhdhdhdhdhdhd', '10013', '10002', '1409456314');
INSERT INTO `t_chat` VALUES ('33', '0', 'Hfkjfjfjfhfnfnhf', '10013', '10002', '1409456331');
INSERT INTO `t_chat` VALUES ('34', '0', 'Jdjfjjfjff', '10013', '10002', '1409456366');
INSERT INTO `t_chat` VALUES ('35', '0', 'Hfjfjjfjfjdjdjjdjdjdjfjf', '10013', '10002', '1409456385');
INSERT INTO `t_chat` VALUES ('36', '0', 'Jfjdjjfjfjfjfjf', '10013', '10002', '1409456387');
INSERT INTO `t_chat` VALUES ('37', '0', 'Jfjdjjdhdjd', '10013', '10002', '1409456390');
INSERT INTO `t_chat` VALUES ('38', '0', 'Jfjjdhdhdhhfhhdbd', '10013', '10002', '1409456398');
INSERT INTO `t_chat` VALUES ('39', '0', 'Duvnv', '10001', '10039', '1409473678');
INSERT INTO `t_chat` VALUES ('40', null, '发酒疯就那个', '10039', '10001', '1409473972');
INSERT INTO `t_chat` VALUES ('41', '0', 'Ggbg', '10001', '10039', '1409473987');
INSERT INTO `t_chat` VALUES ('42', '0', 'Ytr', '10001', '10039', '1409474025');
INSERT INTO `t_chat` VALUES ('43', null, '第几次句', '10039', '10001', '1409474032');
INSERT INTO `t_chat` VALUES ('44', null, '差别很大还不行', '10039', '10001', '1409474056');
INSERT INTO `t_chat` VALUES ('45', null, '都觉得就到家大口大口', '10039', '10052', '1409539871');
INSERT INTO `t_chat` VALUES ('46', '0', '的继续继续好想好想还行哈', '10052', '10012', '1409646417');
INSERT INTO `t_chat` VALUES ('47', '0', 'Cdfjkg', '10013', '10002', '1409733462');
INSERT INTO `t_chat` VALUES ('48', '0', '', '10013', '10002', '1409733463');
INSERT INTO `t_chat` VALUES ('49', '0', '', '10013', '10002', '1409733463');
INSERT INTO `t_chat` VALUES ('50', '0', '', '10013', '10002', '1409733463');
INSERT INTO `t_chat` VALUES ('51', '0', '', '10013', '10002', '1409733464');
INSERT INTO `t_chat` VALUES ('52', '0', '', '10013', '10002', '1409733464');
INSERT INTO `t_chat` VALUES ('53', '0', '', '10013', '10002', '1409733464');
INSERT INTO `t_chat` VALUES ('54', '0', '', '10013', '10002', '1409733464');
INSERT INTO `t_chat` VALUES ('55', '0', '', '10013', '10002', '1409733464');
INSERT INTO `t_chat` VALUES ('56', '0', '', '10013', '10002', '1409733464');
INSERT INTO `t_chat` VALUES ('57', '0', '', '10013', '10002', '1409733465');
INSERT INTO `t_chat` VALUES ('58', '0', '', '10013', '10002', '1409733465');
INSERT INTO `t_chat` VALUES ('59', '0', '', '10013', '10002', '1409733465');
INSERT INTO `t_chat` VALUES ('60', '0', '', '10013', '10002', '1409733465');
INSERT INTO `t_chat` VALUES ('61', '0', '', '10013', '10002', '1409733465');
INSERT INTO `t_chat` VALUES ('62', '0', '', '10013', '10002', '1409733465');
INSERT INTO `t_chat` VALUES ('63', '0', '', '10013', '10002', '1409733465');
INSERT INTO `t_chat` VALUES ('64', '0', '', '10013', '10002', '1409733466');
INSERT INTO `t_chat` VALUES ('65', '0', '', '10013', '10002', '1409733466');
INSERT INTO `t_chat` VALUES ('66', '0', '', '10013', '10002', '1409733466');
INSERT INTO `t_chat` VALUES ('67', '0', '', '10013', '10002', '1409733466');
INSERT INTO `t_chat` VALUES ('68', '0', '', '10013', '10002', '1409733466');
INSERT INTO `t_chat` VALUES ('69', '0', '', '10013', '10002', '1409733466');
INSERT INTO `t_chat` VALUES ('70', '0', '', '10013', '10002', '1409733467');
INSERT INTO `t_chat` VALUES ('71', '0', '', '10013', '10002', '1409733467');
INSERT INTO `t_chat` VALUES ('72', '0', '', '10013', '10002', '1409733467');
INSERT INTO `t_chat` VALUES ('73', '0', '', '10013', '10002', '1409733467');
INSERT INTO `t_chat` VALUES ('74', '0', '', '10013', '10002', '1409733467');
INSERT INTO `t_chat` VALUES ('75', '0', '', '10013', '10002', '1409733467');
INSERT INTO `t_chat` VALUES ('76', '0', '', '10013', '10002', '1409733468');
INSERT INTO `t_chat` VALUES ('77', '0', '', '10013', '10002', '1409733468');
INSERT INTO `t_chat` VALUES ('78', '0', '', '10013', '10002', '1409733468');
INSERT INTO `t_chat` VALUES ('79', '0', '', '10013', '10002', '1409733468');
INSERT INTO `t_chat` VALUES ('80', '0', '', '10013', '10002', '1409733468');
INSERT INTO `t_chat` VALUES ('81', '0', '', '10013', '10002', '1409733468');
INSERT INTO `t_chat` VALUES ('82', '0', '', '10013', '10002', '1409733472');
INSERT INTO `t_chat` VALUES ('83', '0', '', '10013', '10002', '1409733472');
INSERT INTO `t_chat` VALUES ('84', '0', '', '10013', '10002', '1409733473');
INSERT INTO `t_chat` VALUES ('85', '0', '', '10013', '10002', '1409733473');
INSERT INTO `t_chat` VALUES ('86', '0', '', '10013', '10002', '1409733473');
INSERT INTO `t_chat` VALUES ('87', '0', '', '10013', '10002', '1409733473');
INSERT INTO `t_chat` VALUES ('88', '0', '', '10013', '10002', '1409733473');
INSERT INTO `t_chat` VALUES ('89', '0', '', '10013', '10002', '1409733473');
INSERT INTO `t_chat` VALUES ('90', '0', '', '10013', '10002', '1409733474');
INSERT INTO `t_chat` VALUES ('91', '0', '', '10013', '10002', '1409733474');
INSERT INTO `t_chat` VALUES ('92', '0', '', '10013', '10002', '1409733474');
INSERT INTO `t_chat` VALUES ('93', '0', '', '10013', '10002', '1409733474');
INSERT INTO `t_chat` VALUES ('94', '0', '', '10013', '10002', '1409733474');
INSERT INTO `t_chat` VALUES ('95', '0', '', '10013', '10002', '1409733474');
INSERT INTO `t_chat` VALUES ('96', '0', '', '10013', '10002', '1409733474');
INSERT INTO `t_chat` VALUES ('97', '0', '', '10013', '10002', '1409733475');
INSERT INTO `t_chat` VALUES ('98', '0', '', '10013', '10002', '1409733475');
INSERT INTO `t_chat` VALUES ('99', '0', '', '10013', '10002', '1409733475');
INSERT INTO `t_chat` VALUES ('100', '0', '', '10013', '10002', '1409733475');
INSERT INTO `t_chat` VALUES ('101', '0', '', '10013', '10002', '1409733475');
INSERT INTO `t_chat` VALUES ('102', '0', '', '10013', '10002', '1409733476');
INSERT INTO `t_chat` VALUES ('103', '0', '', '10013', '10002', '1409733476');
INSERT INTO `t_chat` VALUES ('104', '0', '', '10013', '10002', '1409733476');
INSERT INTO `t_chat` VALUES ('105', '0', '', '10013', '10002', '1409733476');
INSERT INTO `t_chat` VALUES ('106', '0', '', '10013', '10002', '1409733476');
INSERT INTO `t_chat` VALUES ('107', '0', '', '10013', '10002', '1409733477');
INSERT INTO `t_chat` VALUES ('108', '0', '', '10013', '10002', '1409733477');
INSERT INTO `t_chat` VALUES ('109', '0', '', '10013', '10002', '1409733477');
INSERT INTO `t_chat` VALUES ('110', '0', '', '10013', '10002', '1409733477');
INSERT INTO `t_chat` VALUES ('111', '0', '', '10013', '10002', '1409733477');
INSERT INTO `t_chat` VALUES ('112', '0', '', '10013', '10002', '1409733477');
INSERT INTO `t_chat` VALUES ('113', '0', '', '10013', '10002', '1409733478');
INSERT INTO `t_chat` VALUES ('114', '0', '', '10013', '10002', '1409733478');
INSERT INTO `t_chat` VALUES ('115', '0', '', '10013', '10002', '1409733478');
INSERT INTO `t_chat` VALUES ('116', '0', '', '10013', '10002', '1409733478');
INSERT INTO `t_chat` VALUES ('117', '0', '', '10013', '10002', '1409733478');
INSERT INTO `t_chat` VALUES ('118', '0', '', '10013', '10002', '1409733478');
INSERT INTO `t_chat` VALUES ('119', '0', '', '10013', '10002', '1409733479');
INSERT INTO `t_chat` VALUES ('120', '0', '', '10013', '10002', '1409733479');
INSERT INTO `t_chat` VALUES ('121', '0', '', '10013', '10002', '1409733479');
INSERT INTO `t_chat` VALUES ('122', '0', '', '10013', '10002', '1409733479');
INSERT INTO `t_chat` VALUES ('123', '0', '', '10013', '10002', '1409733480');
INSERT INTO `t_chat` VALUES ('124', '0', '', '10013', '10002', '1409733480');
INSERT INTO `t_chat` VALUES ('125', '0', '', '10013', '10002', '1409733480');
INSERT INTO `t_chat` VALUES ('126', '0', '', '10013', '10002', '1409733480');
INSERT INTO `t_chat` VALUES ('127', '0', '', '10013', '10002', '1409733480');
INSERT INTO `t_chat` VALUES ('128', '0', '', '10013', '10002', '1409733480');
INSERT INTO `t_chat` VALUES ('129', '0', '', '10013', '10002', '1409733481');
INSERT INTO `t_chat` VALUES ('130', '0', '', '10013', '10002', '1409733481');
INSERT INTO `t_chat` VALUES ('131', '0', '', '10013', '10002', '1409733481');
INSERT INTO `t_chat` VALUES ('132', '0', '', '10013', '10002', '1409733481');
INSERT INTO `t_chat` VALUES ('133', '0', '', '10013', '10002', '1409733481');
INSERT INTO `t_chat` VALUES ('134', '0', '', '10013', '10002', '1409733482');
INSERT INTO `t_chat` VALUES ('135', '0', '', '10013', '10002', '1409733482');
INSERT INTO `t_chat` VALUES ('136', '0', '', '10013', '10002', '1409733482');
INSERT INTO `t_chat` VALUES ('137', '0', '', '10013', '10002', '1409733482');
INSERT INTO `t_chat` VALUES ('138', '0', '', '10013', '10002', '1409733482');
INSERT INTO `t_chat` VALUES ('139', '0', '', '10013', '10002', '1409733483');
INSERT INTO `t_chat` VALUES ('140', '0', '', '10013', '10002', '1409733483');
INSERT INTO `t_chat` VALUES ('141', '0', 'Fhj', '10013', '10002', '1409733522');
INSERT INTO `t_chat` VALUES ('142', '0', 'Hiii', '10013', '10002', '1409804574');
INSERT INTO `t_chat` VALUES ('143', '0', 'Disuse', '10052', '10012', '1409828546');

-- ----------------------------
-- Table structure for `t_city`
-- ----------------------------
DROP TABLE IF EXISTS `t_city`;
CREATE TABLE `t_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '城市ID',
  `name` varchar(200) DEFAULT '' COMMENT '城市名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_city
-- ----------------------------
INSERT INTO `t_city` VALUES ('1', 'London 伦敦');
INSERT INTO `t_city` VALUES ('2', 'Oxford 牛津');
INSERT INTO `t_city` VALUES ('3', 'Cambridge 剑桥');
INSERT INTO `t_city` VALUES ('4', 'Birmingham 伯明翰');
INSERT INTO `t_city` VALUES ('5', 'Glasgow 格拉斯哥');
INSERT INTO `t_city` VALUES ('6', 'Edinburgh 愛丁堡');

-- ----------------------------
-- Table structure for `t_clause`
-- ----------------------------
DROP TABLE IF EXISTS `t_clause`;
CREATE TABLE `t_clause` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '条款ID',
  `name` varchar(200) DEFAULT '' COMMENT '条款名称',
  `content` text COMMENT '条款内容',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_clause
-- ----------------------------
INSERT INTO `t_clause` VALUES ('1', '客户注册协议', 'QQ号码规则\r\n\r\n【首部及导言】\r\n\r\n为有效利用QQ号码资源，维护用户合法权益，特制订《QQ号码规则》（以下简称“本规则”）。请您务必审慎阅读、充分理解各条款内容，特别是免除或者限制责任的条款，以及开通或使用某项服务的单独协议，并选择接受或不接受。限制、免责条款可能以加粗形式提示您注意。\r\n\r\n除非您已阅读并接受本规则所有条款，否则您无权申请或使用QQ号码。您申请或使用QQ号码的行为即视为您已阅读并同意受本规则的约束。\r\n\r\n一、【规则的范围】\r\n\r\n \r\n\r\n1.1 本规则是腾讯制定的关于获取和使用QQ号码的相关规则。本规则适用于腾讯提供的需要注册或使用QQ号码的全部软件和服务。\r\n\r\n1.2 本规则属于腾讯的业务规则，是《腾讯服务协议》不可分割的组成部分。\r\n\r\n1.3 您通过QQ号码使用腾讯的软件和服务时，须同时遵守各项服务的单独协议。\r\n\r\n二、【QQ号码的性质】\r\n\r\n \r\n\r\nQQ号码是腾讯创设的用于识别用户身份的数字标识。QQ号码的所有权属于腾讯。\r\n\r\n三、【QQ号码的获取】\r\n\r\n \r\n\r\n3.1 您可以通过如下方式免费或有偿申请注册QQ号码，包括但不限于：\r\n\r\n（1）软件客户端；\r\n\r\n（2）腾讯网站；\r\n\r\n（3）手机短信、电话语音（IVR）；\r\n\r\n（4）参与腾讯开展或授权开展的活动；\r\n\r\n（5）其他腾讯授权的方式。\r\n\r\n3.2 您完成申请注册程序后，依照腾讯的业务规则获得该号码的使用权。\r\n\r\n3.3 无论您通过何种方式获取QQ号码，均受本规则约束。\r\n', '1406185107');
INSERT INTO `t_clause` VALUES ('2', '商家注册协议', 'QQ号码规则\r\n\r\n【首部及导言】\r\n\r\n为有效利用QQ号码资源，维护用户合法权益，特制订《QQ号码规则》（以下简称“本规则”）。请您务必审慎阅读、充分理解各条款内容，特别是免除或者限制责任的条款，以及开通或使用某项服务的单独协议，并选择接受或不接受。限制、免责条款可能以加粗形式提示您注意。\r\n\r\n除非您已阅读并接受本规则所有条款，否则您无权申请或使用QQ号码。您申请或使用QQ号码的行为即视为您已阅读并同意受本规则的约束。\r\n\r\n一、【规则的范围】\r\n\r\n \r\n\r\n1.1 本规则是腾讯制定的关于获取和使用QQ号码的相关规则。本规则适用于腾讯提供的需要注册或使用QQ号码的全部软件和服务。\r\n\r\n1.2 本规则属于腾讯的业务规则，是《腾讯服务协议》不可分割的组成部分。\r\n\r\n1.3 您通过QQ号码使用腾讯的软件和服务时，须同时遵守各项服务的单独协议。\r\n\r\n二、【QQ号码的性质】\r\n\r\n \r\n\r\nQQ号码是腾讯创设的用于识别用户身份的数字标识。QQ号码的所有权属于腾讯。\r\n\r\n三、【QQ号码的获取】\r\n\r\n \r\n\r\n3.1 您可以通过如下方式免费或有偿申请注册QQ号码，包括但不限于：\r\n\r\n（1）软件客户端；\r\n\r\n（2）腾讯网站；\r\n\r\n（3）手机短信、电话语音（IVR）；\r\n\r\n（4）参与腾讯开展或授权开展的活动；\r\n\r\n（5）其他腾讯授权的方式。\r\n\r\n3.2 您完成申请注册程序后，依照腾讯的业务规则获得该号码的使用权。\r\n\r\n3.3 无论您通过何种方式获取QQ号码，均受本规则约束。\r\n', '1406268977');

-- ----------------------------
-- Table structure for `t_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论表ID',
  `user_id` int(11) DEFAULT '0' COMMENT '评论的用户ID',
  `store_id` int(11) DEFAULT '0' COMMENT '商店ID',
  `star_level` int(11) DEFAULT '5' COMMENT '星星级别',
  `content` text COMMENT '评论内容',
  `create_time` int(11) DEFAULT '1' COMMENT '评论时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('1', '10003', '3', '0', '%E5%91%B5%E5%91%B5%E6%8C%BA%E5%A5%BD%E7%9A%84', '1409292198');
INSERT INTO `t_comment` VALUES ('2', '10032', '141', '3', 'haix', '1409390539');
INSERT INTO `t_comment` VALUES ('3', '10032', '141', '4', 'dffcc', '1409390588');
INSERT INTO `t_comment` VALUES ('4', '10032', '141', '5', 'ghhbnnn', '1409390691');
INSERT INTO `t_comment` VALUES ('5', '10032', '141', '0', '%E5%B0%8F%E5%AE%9D', '1409390733');
INSERT INTO `t_comment` VALUES ('6', '10041', '155', '4', '%E5%85%84%E5%BC%9F', '1409458513');
INSERT INTO `t_comment` VALUES ('7', '10039', '175', '0', '%E9%83%BD%E5%BE%88%E5%A5%BD%E8%AF%A5%E5%96%9D%E5%96%9D', '1409481696');
INSERT INTO `t_comment` VALUES ('8', '10039', '175', '0', '%E5%BA%9F%E8%AF%9D%E5%A7%90%E5%A7%90', '1409481715');
INSERT INTO `t_comment` VALUES ('9', '10061', '221', '0', '%E9%9D%9E%E9%BB%91%E5%8D%B3%E7%99%BD%E6%92%ADVV', '1409710866');
INSERT INTO `t_comment` VALUES ('10', '10012', '204', '0', '%E8%AF%84%E4%BB%B7%E4%B8%80%E4%B8%8B', '1409832695');

-- ----------------------------
-- Table structure for `t_commodity`
-- ----------------------------
DROP TABLE IF EXISTS `t_commodity`;
CREATE TABLE `t_commodity` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品表ID',
  `en_name` varchar(100) DEFAULT '' COMMENT '英文名称',
  `cn_name` varchar(200) DEFAULT '' COMMENT '中文名称',
  `price` float(11,2) DEFAULT '0.00' COMMENT '商品价格（单位：英镑）',
  `rebates` float(11,2) DEFAULT '0.00' COMMENT '返利(商家提供返利比例)',
  `user_rebates` float(11,2) DEFAULT '0.00' COMMENT '返利(呈现用户返利比例)',
  `vip_rebates` float(11,2) DEFAULT '0.00' COMMENT '返利(VIP用户返利比例)',
  `logo` varchar(200) DEFAULT '' COMMENT '商品图标',
  `store_id` int(11) DEFAULT '0' COMMENT '商店ID',
  `category_id` int(11) DEFAULT '0' COMMENT '种类ID',
  `brand_id` int(11) DEFAULT '0' COMMENT '品牌ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_commodity
-- ----------------------------
INSERT INTO `t_commodity` VALUES ('1', 'Ya Shi Lan dai', '雅诗兰黛', '98.00', '20.00', '18.00', '19.00', 'Uploads/pic/commodity/icon_001.png', '2', '1', '5');
INSERT INTO `t_commodity` VALUES ('2', 'Louis VuittonMarais BBMonagram', 'Louis Vuitton 路易·威登 女士Marais BB紫丁香色Monagram手提包', '1843.00', '9.00', '7.00', '8.00', 'Uploads/pic/commodity/icon_001.png', '1', '5', '6');
INSERT INTO `t_commodity` VALUES ('3', 'louis Vuitton Perforation Nomade M6931w', '路易·威登 皮带 棕色', '461.00', '9.00', '7.00', '8.00', 'Uploads/pic/commodity/icon_001.png', '1', '5', '6');
INSERT INTO `t_commodity` VALUES ('4', 'louis Vuitton Perforation Nomade M6931w', '路易·威登 皮带 白色', '460.00', '9.00', '7.00', '8.00', 'Uploads/pic/commodity/icon_001.png', '3', '5', '6');
INSERT INTO `t_commodity` VALUES ('5', 'louis Vuitton Perforation Nomade M6931w', '路易·威登 皮带 黑色', '461.00', '9.00', '7.00', '8.00', 'Uploads/pic/commodity/icon_001.png', '4', '5', '6');
INSERT INTO `t_commodity` VALUES ('6', 'louis Vuitton Perforation Nomade M6931w', '路易·威登 皮鞋 棕色', '462.00', '7.00', '6.00', '7.00', 'Uploads/pic/commodity/icon_001.png', '5', '5', '6');
INSERT INTO `t_commodity` VALUES ('7', 'louis Vuitton Perforation Nomade M6931w', '路易·威登 皮鞋 黑色', '461.00', '11.00', '9.00', '8.00', 'Uploads/pic/commodity/icon_001.png', '6', '5', '6');
INSERT INTO `t_commodity` VALUES ('8', 'louis Vuitton Perforation Nomade M6931w', '路易·威登 皮鞋 白色', '471.00', '14.00', '12.00', '13.00', 'Uploads/pic/commodity/icon_001.png', '7', '5', '6');
INSERT INTO `t_commodity` VALUES ('9', 'fitocrazy', '健身器材', '434.00', '13.00', '11.00', '12.00', '', '5', '0', '2');
INSERT INTO `t_commodity` VALUES ('10', 'ulemei', '优乐美奶茶', '32.00', '13.00', '11.00', '12.00', '', '5', '0', '1');
INSERT INTO `t_commodity` VALUES ('11', 'ABC', '农业银行', '3232.00', '13.00', '11.00', '12.00', '', '5', '0', '1');
INSERT INTO `t_commodity` VALUES ('12', 'CGDD', 'fsda ', '323.00', '13.00', '11.00', '12.00', '', '5', '0', '1');
INSERT INTO `t_commodity` VALUES ('13', 'CIB', 'CIB', '323.00', '13.00', '11.00', '12.00', '', '5', '1', '1');
INSERT INTO `t_commodity` VALUES ('14', 'CCB', 'CCB', '434.00', '13.00', '11.00', '12.00', '', '5', '1', '1');
INSERT INTO `t_commodity` VALUES ('15', 'zhonghuaCigarette', '中华香烟', '130.00', '20.00', '13.00', '15.00', 'Uploads/commodity/logo/2014/20140820/53f43fb14e2de.jpg', '8', '7', '8');
INSERT INTO `t_commodity` VALUES ('16', 'ATX385', '傲凤铝合金山地车 包邮双碟刹 减震学生男女自行车公路一体轮车', '10000000.00', '1000.00', '300.00', '500.00', 'Uploads/commodity/logo/2014/20140830/54018cf7ed3fa.png', '12', '5', '7');
INSERT INTO `t_commodity` VALUES ('17', 'drink1', 'drink1', '80.00', '10.00', '5.00', '8.00', 'Uploads/commodity/logo/2014/20140904/5407d882089b8.png', '17', '1', '4');
INSERT INTO `t_commodity` VALUES ('18', 'dianshuihu', '电水壶', '210.00', '16.00', '13.00', '14.00', 'Uploads/commodity/logo/2014/20140905/5409308fb283c.jpg', '18', '1', '1');

-- ----------------------------
-- Table structure for `t_contact`
-- ----------------------------
DROP TABLE IF EXISTS `t_contact`;
CREATE TABLE `t_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(100) DEFAULT NULL COMMENT '电话',
  `fax` varchar(100) DEFAULT NULL COMMENT '传真',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `address` text COMMENT '地址',
  `company_introduction` text COMMENT '公司简介',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_contact
-- ----------------------------
INSERT INTO `t_contact` VALUES ('1', '021-63311188', '(86 21) 63311189', 'info.sh@chubb-asia.com', '上海市黄浦区汉口路300号解放日报大厦15楼  200001', null, null, null);

-- ----------------------------
-- Table structure for `t_customers`
-- ----------------------------
DROP TABLE IF EXISTS `t_customers`;
CREATE TABLE `t_customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0',
  `status` smallint(2) NOT NULL DEFAULT '1',
  `url` varchar(100) NOT NULL DEFAULT '',
  `logo` varchar(100) NOT NULL DEFAULT '',
  `created` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_customers
-- ----------------------------
INSERT INTO `t_customers` VALUES ('1', '平安', '0', '1', 'http://www.pingan.com', 'Uploads/pic/partner/2014/20140916/541722bb2709d.png', '1410802363');
INSERT INTO `t_customers` VALUES ('2', '3M', '0', '1', 'http://www.3M.com', 'Uploads/pic/partner/2014/20140916/541723571bc7a.png', '1410802519');

-- ----------------------------
-- Table structure for `t_exchange_rate`
-- ----------------------------
DROP TABLE IF EXISTS `t_exchange_rate`;
CREATE TABLE `t_exchange_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '汇率ID',
  `from` varchar(20) DEFAULT '英镑' COMMENT '当前货币种类',
  `to` varchar(20) DEFAULT '人民币' COMMENT '目标货币种类',
  `rate` float(11,2) DEFAULT '0.00' COMMENT '汇率',
  `get_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT '0' COMMENT '本地更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1082 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_exchange_rate
-- ----------------------------
INSERT INTO `t_exchange_rate` VALUES ('1', '英镑', '人民币', '10.19', null, '1409093942');
INSERT INTO `t_exchange_rate` VALUES ('2', '英镑', '人民币', '10.20', null, '1409220001');
INSERT INTO `t_exchange_rate` VALUES ('3', '英镑', '人民币', '10.20', null, '1409220061');
INSERT INTO `t_exchange_rate` VALUES ('4', '英镑', '人民币', '10.20', null, '1409220122');
INSERT INTO `t_exchange_rate` VALUES ('5', '英镑', '人民币', '10.20', null, '1409220181');
INSERT INTO `t_exchange_rate` VALUES ('6', '英镑', '人民币', '10.20', null, '1409220242');
INSERT INTO `t_exchange_rate` VALUES ('7', '英镑', '人民币', '10.20', null, '1409220302');
INSERT INTO `t_exchange_rate` VALUES ('8', '英镑', '人民币', '10.20', null, '1409220362');
INSERT INTO `t_exchange_rate` VALUES ('9', '英镑', '人民币', '10.20', null, '1409220421');
INSERT INTO `t_exchange_rate` VALUES ('10', '英镑', '人民币', '10.20', null, '1409220482');
INSERT INTO `t_exchange_rate` VALUES ('11', '英镑', '人民币', '10.20', null, '1409220542');
INSERT INTO `t_exchange_rate` VALUES ('12', '英镑', '人民币', '10.20', null, '1409220601');
INSERT INTO `t_exchange_rate` VALUES ('13', '英镑', '人民币', '10.20', null, '1409220662');
INSERT INTO `t_exchange_rate` VALUES ('14', '英镑', '人民币', '10.20', null, '1409220724');
INSERT INTO `t_exchange_rate` VALUES ('15', '英镑', '人民币', '10.20', null, '1409220782');
INSERT INTO `t_exchange_rate` VALUES ('16', '英镑', '人民币', '10.20', null, '1409220841');
INSERT INTO `t_exchange_rate` VALUES ('17', '英镑', '人民币', '10.20', null, '1409220902');
INSERT INTO `t_exchange_rate` VALUES ('18', '英镑', '人民币', '10.20', null, '1409220961');
INSERT INTO `t_exchange_rate` VALUES ('19', '英镑', '人民币', '10.20', null, '1409221022');
INSERT INTO `t_exchange_rate` VALUES ('20', '英镑', '人民币', '10.19', null, '1409221081');
INSERT INTO `t_exchange_rate` VALUES ('21', '英镑', '人民币', '10.19', null, '1409221142');
INSERT INTO `t_exchange_rate` VALUES ('22', '英镑', '人民币', '10.19', null, '1409221205');
INSERT INTO `t_exchange_rate` VALUES ('23', '英镑', '人民币', '10.20', null, '1409221261');
INSERT INTO `t_exchange_rate` VALUES ('24', '英镑', '人民币', '10.19', null, '1409221322');
INSERT INTO `t_exchange_rate` VALUES ('25', '英镑', '人民币', '10.19', null, '1409221381');
INSERT INTO `t_exchange_rate` VALUES ('26', '英镑', '人民币', '10.19', null, '1409221442');
INSERT INTO `t_exchange_rate` VALUES ('27', '英镑', '人民币', '10.19', null, '1409221501');
INSERT INTO `t_exchange_rate` VALUES ('28', '英镑', '人民币', '10.19', null, '1409221564');
INSERT INTO `t_exchange_rate` VALUES ('29', '英镑', '人民币', '10.19', null, '1409221622');
INSERT INTO `t_exchange_rate` VALUES ('30', '英镑', '人民币', '10.19', null, '1409221681');
INSERT INTO `t_exchange_rate` VALUES ('31', '英镑', '人民币', '10.19', null, '1409221742');
INSERT INTO `t_exchange_rate` VALUES ('32', '英镑', '人民币', '10.19', null, '1409221802');
INSERT INTO `t_exchange_rate` VALUES ('33', '英镑', '人民币', '10.19', null, '1409221861');
INSERT INTO `t_exchange_rate` VALUES ('34', '英镑', '人民币', '10.19', null, '1409221922');
INSERT INTO `t_exchange_rate` VALUES ('35', '英镑', '人民币', '10.19', null, '1409221981');
INSERT INTO `t_exchange_rate` VALUES ('36', '英镑', '人民币', '10.19', null, '1409222042');
INSERT INTO `t_exchange_rate` VALUES ('37', '英镑', '人民币', '10.19', null, '1409222101');
INSERT INTO `t_exchange_rate` VALUES ('38', '英镑', '人民币', '10.19', null, '1409222161');
INSERT INTO `t_exchange_rate` VALUES ('39', '英镑', '人民币', '10.20', null, '1409222222');
INSERT INTO `t_exchange_rate` VALUES ('40', '英镑', '人民币', '10.19', null, '1409222282');
INSERT INTO `t_exchange_rate` VALUES ('41', '英镑', '人民币', '10.19', null, '1409222341');
INSERT INTO `t_exchange_rate` VALUES ('42', '英镑', '人民币', '10.19', null, '1409222402');
INSERT INTO `t_exchange_rate` VALUES ('43', '英镑', '人民币', '10.20', null, '1409222462');
INSERT INTO `t_exchange_rate` VALUES ('44', '英镑', '人民币', '10.19', null, '1409222521');
INSERT INTO `t_exchange_rate` VALUES ('45', '英镑', '人民币', '10.19', null, '1409222582');
INSERT INTO `t_exchange_rate` VALUES ('46', '英镑', '人民币', '10.19', null, '1409222644');
INSERT INTO `t_exchange_rate` VALUES ('47', '英镑', '人民币', '10.19', null, '1409222702');
INSERT INTO `t_exchange_rate` VALUES ('48', '英镑', '人民币', '10.19', null, '1409222762');
INSERT INTO `t_exchange_rate` VALUES ('49', '英镑', '人民币', '10.19', null, '1409222821');
INSERT INTO `t_exchange_rate` VALUES ('50', '英镑', '人民币', '10.19', null, '1409222882');
INSERT INTO `t_exchange_rate` VALUES ('51', '英镑', '人民币', '10.19', null, '1409222941');
INSERT INTO `t_exchange_rate` VALUES ('52', '英镑', '人民币', '10.19', null, '1409223002');
INSERT INTO `t_exchange_rate` VALUES ('53', '英镑', '人民币', '10.19', null, '1409223064');
INSERT INTO `t_exchange_rate` VALUES ('54', '英镑', '人民币', '10.19', null, '1409223122');
INSERT INTO `t_exchange_rate` VALUES ('55', '英镑', '人民币', '10.19', null, '1409223182');
INSERT INTO `t_exchange_rate` VALUES ('56', '英镑', '人民币', '10.19', null, '1409223242');
INSERT INTO `t_exchange_rate` VALUES ('57', '英镑', '人民币', '10.19', null, '1409223304');
INSERT INTO `t_exchange_rate` VALUES ('58', '英镑', '人民币', '10.19', null, '1409223361');
INSERT INTO `t_exchange_rate` VALUES ('59', '英镑', '人民币', '10.19', null, '1409223422');
INSERT INTO `t_exchange_rate` VALUES ('60', '英镑', '人民币', '10.19', null, '1409223484');
INSERT INTO `t_exchange_rate` VALUES ('61', '英镑', '人民币', '10.19', null, '1409223545');
INSERT INTO `t_exchange_rate` VALUES ('62', '英镑', '人民币', '10.19', null, '1409263202');
INSERT INTO `t_exchange_rate` VALUES ('63', '英镑', '人民币', '10.19', null, '1409263261');
INSERT INTO `t_exchange_rate` VALUES ('64', '英镑', '人民币', '10.19', null, '1409263322');
INSERT INTO `t_exchange_rate` VALUES ('65', '英镑', '人民币', '10.19', null, '1409263381');
INSERT INTO `t_exchange_rate` VALUES ('66', '英镑', '人民币', '10.19', null, '1409263442');
INSERT INTO `t_exchange_rate` VALUES ('67', '英镑', '人民币', '10.19', null, '1409263501');
INSERT INTO `t_exchange_rate` VALUES ('68', '英镑', '人民币', '10.19', null, '1409263562');
INSERT INTO `t_exchange_rate` VALUES ('69', '英镑', '人民币', '10.19', null, '1409263621');
INSERT INTO `t_exchange_rate` VALUES ('70', '英镑', '人民币', '10.19', null, '1409263682');
INSERT INTO `t_exchange_rate` VALUES ('71', '英镑', '人民币', '10.19', null, '1409263741');
INSERT INTO `t_exchange_rate` VALUES ('72', '英镑', '人民币', '10.19', null, '1409263802');
INSERT INTO `t_exchange_rate` VALUES ('73', '英镑', '人民币', '10.19', null, '1409263861');
INSERT INTO `t_exchange_rate` VALUES ('74', '英镑', '人民币', '10.19', null, '1409263922');
INSERT INTO `t_exchange_rate` VALUES ('75', '英镑', '人民币', '10.19', null, '1409263981');
INSERT INTO `t_exchange_rate` VALUES ('76', '英镑', '人民币', '10.19', null, '1409264042');
INSERT INTO `t_exchange_rate` VALUES ('77', '英镑', '人民币', '10.19', null, '1409264101');
INSERT INTO `t_exchange_rate` VALUES ('78', '英镑', '人民币', '10.19', null, '1409264162');
INSERT INTO `t_exchange_rate` VALUES ('79', '英镑', '人民币', '10.19', null, '1409264221');
INSERT INTO `t_exchange_rate` VALUES ('80', '英镑', '人民币', '10.19', null, '1409264282');
INSERT INTO `t_exchange_rate` VALUES ('81', '英镑', '人民币', '10.19', null, '1409264342');
INSERT INTO `t_exchange_rate` VALUES ('82', '英镑', '人民币', '10.19', null, '1409264402');
INSERT INTO `t_exchange_rate` VALUES ('83', '英镑', '人民币', '10.19', null, '1409264461');
INSERT INTO `t_exchange_rate` VALUES ('84', '英镑', '人民币', '10.19', null, '1409264522');
INSERT INTO `t_exchange_rate` VALUES ('85', '英镑', '人民币', '10.19', null, '1409264581');
INSERT INTO `t_exchange_rate` VALUES ('86', '英镑', '人民币', '10.19', null, '1409264642');
INSERT INTO `t_exchange_rate` VALUES ('87', '英镑', '人民币', '10.19', null, '1409264701');
INSERT INTO `t_exchange_rate` VALUES ('88', '英镑', '人民币', '10.19', null, '1409264762');
INSERT INTO `t_exchange_rate` VALUES ('89', '英镑', '人民币', '10.19', null, '1409264821');
INSERT INTO `t_exchange_rate` VALUES ('90', '英镑', '人民币', '10.19', null, '1409264882');
INSERT INTO `t_exchange_rate` VALUES ('91', '英镑', '人民币', '10.19', null, '1409264942');
INSERT INTO `t_exchange_rate` VALUES ('92', '英镑', '人民币', '10.19', null, '1409265004');
INSERT INTO `t_exchange_rate` VALUES ('93', '英镑', '人民币', '10.19', null, '1409265062');
INSERT INTO `t_exchange_rate` VALUES ('94', '英镑', '人民币', '10.19', null, '1409265121');
INSERT INTO `t_exchange_rate` VALUES ('95', '英镑', '人民币', '10.19', null, '1409265182');
INSERT INTO `t_exchange_rate` VALUES ('96', '英镑', '人民币', '10.19', null, '1409265241');
INSERT INTO `t_exchange_rate` VALUES ('97', '英镑', '人民币', '10.19', null, '1409265302');
INSERT INTO `t_exchange_rate` VALUES ('98', '英镑', '人民币', '10.19', null, '1409265362');
INSERT INTO `t_exchange_rate` VALUES ('99', '英镑', '人民币', '10.19', null, '1409265421');
INSERT INTO `t_exchange_rate` VALUES ('100', '英镑', '人民币', '10.19', null, '1409265482');
INSERT INTO `t_exchange_rate` VALUES ('101', '英镑', '人民币', '10.19', null, '1409265541');
INSERT INTO `t_exchange_rate` VALUES ('102', '英镑', '人民币', '10.19', null, '1409265602');
INSERT INTO `t_exchange_rate` VALUES ('103', '英镑', '人民币', '10.19', null, '1409265662');
INSERT INTO `t_exchange_rate` VALUES ('104', '英镑', '人民币', '10.19', null, '1409265721');
INSERT INTO `t_exchange_rate` VALUES ('105', '英镑', '人民币', '10.19', null, '1409265782');
INSERT INTO `t_exchange_rate` VALUES ('106', '英镑', '人民币', '10.19', null, '1409265841');
INSERT INTO `t_exchange_rate` VALUES ('107', '英镑', '人民币', '10.19', null, '1409265902');
INSERT INTO `t_exchange_rate` VALUES ('108', '英镑', '人民币', '10.19', null, '1409265961');
INSERT INTO `t_exchange_rate` VALUES ('109', '英镑', '人民币', '10.19', null, '1409266022');
INSERT INTO `t_exchange_rate` VALUES ('110', '英镑', '人民币', '10.19', null, '1409266081');
INSERT INTO `t_exchange_rate` VALUES ('111', '英镑', '人民币', '10.19', null, '1409266142');
INSERT INTO `t_exchange_rate` VALUES ('112', '英镑', '人民币', '10.19', null, '1409266201');
INSERT INTO `t_exchange_rate` VALUES ('113', '英镑', '人民币', '10.19', null, '1409266261');
INSERT INTO `t_exchange_rate` VALUES ('114', '英镑', '人民币', '10.19', null, '1409266322');
INSERT INTO `t_exchange_rate` VALUES ('115', '英镑', '人民币', '10.19', null, '1409266382');
INSERT INTO `t_exchange_rate` VALUES ('116', '英镑', '人民币', '10.19', null, '1409266441');
INSERT INTO `t_exchange_rate` VALUES ('117', '英镑', '人民币', '10.19', null, '1409266502');
INSERT INTO `t_exchange_rate` VALUES ('118', '英镑', '人民币', '10.19', null, '1409266561');
INSERT INTO `t_exchange_rate` VALUES ('119', '英镑', '人民币', '10.19', null, '1409266622');
INSERT INTO `t_exchange_rate` VALUES ('120', '英镑', '人民币', '10.19', null, '1409266681');
INSERT INTO `t_exchange_rate` VALUES ('121', '英镑', '人民币', '10.19', null, '1409266742');
INSERT INTO `t_exchange_rate` VALUES ('122', '英镑', '人民币', '10.19', null, '1409306405');
INSERT INTO `t_exchange_rate` VALUES ('123', '英镑', '人民币', '10.19', null, '1409306465');
INSERT INTO `t_exchange_rate` VALUES ('124', '英镑', '人民币', '10.19', null, '1409306521');
INSERT INTO `t_exchange_rate` VALUES ('125', '英镑', '人民币', '10.19', null, '1409306582');
INSERT INTO `t_exchange_rate` VALUES ('126', '英镑', '人民币', '10.19', null, '1409306644');
INSERT INTO `t_exchange_rate` VALUES ('127', '英镑', '人民币', '10.20', null, '1409306702');
INSERT INTO `t_exchange_rate` VALUES ('128', '英镑', '人民币', '10.20', null, '1409306762');
INSERT INTO `t_exchange_rate` VALUES ('129', '英镑', '人民币', '10.20', null, '1409306821');
INSERT INTO `t_exchange_rate` VALUES ('130', '英镑', '人民币', '10.20', null, '1409306882');
INSERT INTO `t_exchange_rate` VALUES ('131', '英镑', '人民币', '10.20', null, '1409306941');
INSERT INTO `t_exchange_rate` VALUES ('132', '英镑', '人民币', '10.20', null, '1409307002');
INSERT INTO `t_exchange_rate` VALUES ('133', '英镑', '人民币', '10.20', null, '1409307065');
INSERT INTO `t_exchange_rate` VALUES ('134', '英镑', '人民币', '10.20', null, '1409307121');
INSERT INTO `t_exchange_rate` VALUES ('135', '英镑', '人民币', '10.20', null, '1409307182');
INSERT INTO `t_exchange_rate` VALUES ('136', '英镑', '人民币', '10.19', null, '1409307241');
INSERT INTO `t_exchange_rate` VALUES ('137', '英镑', '人民币', '10.20', null, '1409307302');
INSERT INTO `t_exchange_rate` VALUES ('138', '英镑', '人民币', '10.20', null, '1409307362');
INSERT INTO `t_exchange_rate` VALUES ('139', '英镑', '人民币', '10.19', null, '1409307425');
INSERT INTO `t_exchange_rate` VALUES ('140', '英镑', '人民币', '10.20', null, '1409307481');
INSERT INTO `t_exchange_rate` VALUES ('141', '英镑', '人民币', '10.19', null, '1409307542');
INSERT INTO `t_exchange_rate` VALUES ('142', '英镑', '人民币', '10.19', null, '1409307601');
INSERT INTO `t_exchange_rate` VALUES ('143', '英镑', '人民币', '10.19', null, '1409307661');
INSERT INTO `t_exchange_rate` VALUES ('144', '英镑', '人民币', '10.19', null, '1409307725');
INSERT INTO `t_exchange_rate` VALUES ('145', '英镑', '人民币', '10.19', null, '1409307783');
INSERT INTO `t_exchange_rate` VALUES ('146', '英镑', '人民币', '10.19', null, '1409307844');
INSERT INTO `t_exchange_rate` VALUES ('147', '英镑', '人民币', '10.20', null, '1409307902');
INSERT INTO `t_exchange_rate` VALUES ('148', '英镑', '人民币', '10.20', null, '1409307961');
INSERT INTO `t_exchange_rate` VALUES ('149', '英镑', '人民币', '10.19', null, '1409308022');
INSERT INTO `t_exchange_rate` VALUES ('150', '英镑', '人民币', '10.19', null, '1409308081');
INSERT INTO `t_exchange_rate` VALUES ('151', '英镑', '人民币', '10.19', null, '1409308145');
INSERT INTO `t_exchange_rate` VALUES ('152', '英镑', '人民币', '10.19', null, '1409308205');
INSERT INTO `t_exchange_rate` VALUES ('153', '英镑', '人民币', '10.19', null, '1409308261');
INSERT INTO `t_exchange_rate` VALUES ('154', '英镑', '人民币', '10.19', null, '1409308322');
INSERT INTO `t_exchange_rate` VALUES ('155', '英镑', '人民币', '10.19', null, '1409308381');
INSERT INTO `t_exchange_rate` VALUES ('156', '英镑', '人民币', '10.19', null, '1409308442');
INSERT INTO `t_exchange_rate` VALUES ('157', '英镑', '人民币', '10.19', null, '1409308501');
INSERT INTO `t_exchange_rate` VALUES ('158', '英镑', '人民币', '10.19', null, '1409308562');
INSERT INTO `t_exchange_rate` VALUES ('159', '英镑', '人民币', '10.19', null, '1409308625');
INSERT INTO `t_exchange_rate` VALUES ('160', '英镑', '人民币', '10.19', null, '1409308681');
INSERT INTO `t_exchange_rate` VALUES ('161', '英镑', '人民币', '10.19', null, '1409308742');
INSERT INTO `t_exchange_rate` VALUES ('162', '英镑', '人民币', '10.19', null, '1409308801');
INSERT INTO `t_exchange_rate` VALUES ('163', '英镑', '人民币', '10.19', null, '1409308861');
INSERT INTO `t_exchange_rate` VALUES ('164', '英镑', '人民币', '10.19', null, '1409308923');
INSERT INTO `t_exchange_rate` VALUES ('165', '英镑', '人民币', '10.19', null, '1409308982');
INSERT INTO `t_exchange_rate` VALUES ('166', '英镑', '人民币', '10.19', null, '1409309041');
INSERT INTO `t_exchange_rate` VALUES ('167', '英镑', '人民币', '10.19', null, '1409309102');
INSERT INTO `t_exchange_rate` VALUES ('168', '英镑', '人民币', '10.19', null, '1409309161');
INSERT INTO `t_exchange_rate` VALUES ('169', '英镑', '人民币', '10.19', null, '1409309222');
INSERT INTO `t_exchange_rate` VALUES ('170', '英镑', '人民币', '10.19', null, '1409309281');
INSERT INTO `t_exchange_rate` VALUES ('171', '英镑', '人民币', '10.19', null, '1409309342');
INSERT INTO `t_exchange_rate` VALUES ('172', '英镑', '人民币', '10.19', null, '1409309404');
INSERT INTO `t_exchange_rate` VALUES ('173', '英镑', '人民币', '10.19', null, '1409309462');
INSERT INTO `t_exchange_rate` VALUES ('174', '英镑', '人民币', '10.19', null, '1409309522');
INSERT INTO `t_exchange_rate` VALUES ('175', '英镑', '人民币', '10.19', null, '1409309581');
INSERT INTO `t_exchange_rate` VALUES ('176', '英镑', '人民币', '10.19', null, '1409309642');
INSERT INTO `t_exchange_rate` VALUES ('177', '英镑', '人民币', '10.19', null, '1409309704');
INSERT INTO `t_exchange_rate` VALUES ('178', '英镑', '人民币', '10.19', null, '1409309762');
INSERT INTO `t_exchange_rate` VALUES ('179', '英镑', '人民币', '10.19', null, '1409309821');
INSERT INTO `t_exchange_rate` VALUES ('180', '英镑', '人民币', '10.19', null, '1409309882');
INSERT INTO `t_exchange_rate` VALUES ('181', '英镑', '人民币', '10.19', null, '1409309944');
INSERT INTO `t_exchange_rate` VALUES ('182', '英镑', '人民币', '10.20', null, '1409349601');
INSERT INTO `t_exchange_rate` VALUES ('183', '英镑', '人民币', '10.20', null, '1409349662');
INSERT INTO `t_exchange_rate` VALUES ('184', '英镑', '人民币', '10.20', null, '1409349721');
INSERT INTO `t_exchange_rate` VALUES ('185', '英镑', '人民币', '10.20', null, '1409349782');
INSERT INTO `t_exchange_rate` VALUES ('186', '英镑', '人民币', '10.20', null, '1409349841');
INSERT INTO `t_exchange_rate` VALUES ('187', '英镑', '人民币', '10.20', null, '1409349902');
INSERT INTO `t_exchange_rate` VALUES ('188', '英镑', '人民币', '10.20', null, '1409349962');
INSERT INTO `t_exchange_rate` VALUES ('189', '英镑', '人民币', '10.20', null, '1409350021');
INSERT INTO `t_exchange_rate` VALUES ('190', '英镑', '人民币', '10.20', null, '1409350082');
INSERT INTO `t_exchange_rate` VALUES ('191', '英镑', '人民币', '10.20', null, '1409350141');
INSERT INTO `t_exchange_rate` VALUES ('192', '英镑', '人民币', '10.20', null, '1409350202');
INSERT INTO `t_exchange_rate` VALUES ('193', '英镑', '人民币', '10.20', null, '1409350261');
INSERT INTO `t_exchange_rate` VALUES ('194', '英镑', '人民币', '10.20', null, '1409350322');
INSERT INTO `t_exchange_rate` VALUES ('195', '英镑', '人民币', '10.20', null, '1409350381');
INSERT INTO `t_exchange_rate` VALUES ('196', '英镑', '人民币', '10.20', null, '1409350442');
INSERT INTO `t_exchange_rate` VALUES ('197', '英镑', '人民币', '10.20', null, '1409350501');
INSERT INTO `t_exchange_rate` VALUES ('198', '英镑', '人民币', '10.20', null, '1409350562');
INSERT INTO `t_exchange_rate` VALUES ('199', '英镑', '人民币', '10.20', null, '1409350621');
INSERT INTO `t_exchange_rate` VALUES ('200', '英镑', '人民币', '10.20', null, '1409350682');
INSERT INTO `t_exchange_rate` VALUES ('201', '英镑', '人民币', '10.20', null, '1409350741');
INSERT INTO `t_exchange_rate` VALUES ('202', '英镑', '人民币', '10.20', null, '1409350803');
INSERT INTO `t_exchange_rate` VALUES ('203', '英镑', '人民币', '10.20', null, '1409350861');
INSERT INTO `t_exchange_rate` VALUES ('204', '英镑', '人民币', '10.20', null, '1409350922');
INSERT INTO `t_exchange_rate` VALUES ('205', '英镑', '人民币', '10.20', null, '1409350981');
INSERT INTO `t_exchange_rate` VALUES ('206', '英镑', '人民币', '10.20', null, '1409351041');
INSERT INTO `t_exchange_rate` VALUES ('207', '英镑', '人民币', '10.20', null, '1409351102');
INSERT INTO `t_exchange_rate` VALUES ('208', '英镑', '人民币', '10.20', null, '1409351161');
INSERT INTO `t_exchange_rate` VALUES ('209', '英镑', '人民币', '10.20', null, '1409351223');
INSERT INTO `t_exchange_rate` VALUES ('210', '英镑', '人民币', '10.20', null, '1409351281');
INSERT INTO `t_exchange_rate` VALUES ('211', '英镑', '人民币', '10.20', null, '1409351341');
INSERT INTO `t_exchange_rate` VALUES ('212', '英镑', '人民币', '10.20', null, '1409351402');
INSERT INTO `t_exchange_rate` VALUES ('213', '英镑', '人民币', '10.20', null, '1409351462');
INSERT INTO `t_exchange_rate` VALUES ('214', '英镑', '人民币', '10.20', null, '1409351521');
INSERT INTO `t_exchange_rate` VALUES ('215', '英镑', '人民币', '10.20', null, '1409351582');
INSERT INTO `t_exchange_rate` VALUES ('216', '英镑', '人民币', '10.20', null, '1409351641');
INSERT INTO `t_exchange_rate` VALUES ('217', '英镑', '人民币', '10.20', null, '1409351702');
INSERT INTO `t_exchange_rate` VALUES ('218', '英镑', '人民币', '10.20', null, '1409351761');
INSERT INTO `t_exchange_rate` VALUES ('219', '英镑', '人民币', '10.20', null, '1409351822');
INSERT INTO `t_exchange_rate` VALUES ('220', '英镑', '人民币', '10.20', null, '1409351882');
INSERT INTO `t_exchange_rate` VALUES ('221', '英镑', '人民币', '10.20', null, '1409351941');
INSERT INTO `t_exchange_rate` VALUES ('222', '英镑', '人民币', '10.20', null, '1409352002');
INSERT INTO `t_exchange_rate` VALUES ('223', '英镑', '人民币', '10.20', null, '1409352061');
INSERT INTO `t_exchange_rate` VALUES ('224', '英镑', '人民币', '10.20', null, '1409352122');
INSERT INTO `t_exchange_rate` VALUES ('225', '英镑', '人民币', '10.20', null, '1409352181');
INSERT INTO `t_exchange_rate` VALUES ('226', '英镑', '人民币', '10.20', null, '1409352242');
INSERT INTO `t_exchange_rate` VALUES ('227', '英镑', '人民币', '10.20', null, '1409352301');
INSERT INTO `t_exchange_rate` VALUES ('228', '英镑', '人民币', '10.20', null, '1409352362');
INSERT INTO `t_exchange_rate` VALUES ('229', '英镑', '人民币', '10.20', null, '1409352421');
INSERT INTO `t_exchange_rate` VALUES ('230', '英镑', '人民币', '10.20', null, '1409352482');
INSERT INTO `t_exchange_rate` VALUES ('231', '英镑', '人民币', '10.20', null, '1409352541');
INSERT INTO `t_exchange_rate` VALUES ('232', '英镑', '人民币', '10.20', null, '1409352602');
INSERT INTO `t_exchange_rate` VALUES ('233', '英镑', '人民币', '10.20', null, '1409352661');
INSERT INTO `t_exchange_rate` VALUES ('234', '英镑', '人民币', '10.20', null, '1409352721');
INSERT INTO `t_exchange_rate` VALUES ('235', '英镑', '人民币', '10.20', null, '1409352782');
INSERT INTO `t_exchange_rate` VALUES ('236', '英镑', '人民币', '10.20', null, '1409352842');
INSERT INTO `t_exchange_rate` VALUES ('237', '英镑', '人民币', '10.20', null, '1409352901');
INSERT INTO `t_exchange_rate` VALUES ('238', '英镑', '人民币', '10.20', null, '1409352962');
INSERT INTO `t_exchange_rate` VALUES ('239', '英镑', '人民币', '10.20', null, '1409353021');
INSERT INTO `t_exchange_rate` VALUES ('240', '英镑', '人民币', '10.20', null, '1409353082');
INSERT INTO `t_exchange_rate` VALUES ('241', '英镑', '人民币', '10.20', null, '1409353141');
INSERT INTO `t_exchange_rate` VALUES ('242', '英镑', '人民币', '10.20', null, '1409392801');
INSERT INTO `t_exchange_rate` VALUES ('243', '英镑', '人民币', '10.20', null, '1409392864');
INSERT INTO `t_exchange_rate` VALUES ('244', '英镑', '人民币', '10.20', null, '1409392925');
INSERT INTO `t_exchange_rate` VALUES ('245', '英镑', '人民币', '10.20', null, '1409392984');
INSERT INTO `t_exchange_rate` VALUES ('246', '英镑', '人民币', '10.20', null, '1409393045');
INSERT INTO `t_exchange_rate` VALUES ('247', '英镑', '人民币', '10.20', null, '1409393101');
INSERT INTO `t_exchange_rate` VALUES ('248', '英镑', '人民币', '10.20', null, '1409393165');
INSERT INTO `t_exchange_rate` VALUES ('249', '英镑', '人民币', '10.20', null, '1409393221');
INSERT INTO `t_exchange_rate` VALUES ('250', '英镑', '人民币', '10.20', null, '1409393282');
INSERT INTO `t_exchange_rate` VALUES ('251', '英镑', '人民币', '10.20', null, '1409393341');
INSERT INTO `t_exchange_rate` VALUES ('252', '英镑', '人民币', '10.20', null, '1409393405');
INSERT INTO `t_exchange_rate` VALUES ('253', '英镑', '人民币', '10.20', null, '1409393464');
INSERT INTO `t_exchange_rate` VALUES ('254', '英镑', '人民币', '10.20', null, '1409393522');
INSERT INTO `t_exchange_rate` VALUES ('255', '英镑', '人民币', '10.20', null, '1409393581');
INSERT INTO `t_exchange_rate` VALUES ('256', '英镑', '人民币', '10.20', null, '1409393642');
INSERT INTO `t_exchange_rate` VALUES ('257', '英镑', '人民币', '10.20', null, '1409393701');
INSERT INTO `t_exchange_rate` VALUES ('258', '英镑', '人民币', '10.20', null, '1409393761');
INSERT INTO `t_exchange_rate` VALUES ('259', '英镑', '人民币', '10.20', null, '1409393822');
INSERT INTO `t_exchange_rate` VALUES ('260', '英镑', '人民币', '10.20', null, '1409393881');
INSERT INTO `t_exchange_rate` VALUES ('261', '英镑', '人民币', '10.20', null, '1409393942');
INSERT INTO `t_exchange_rate` VALUES ('262', '英镑', '人民币', '10.20', null, '1409394002');
INSERT INTO `t_exchange_rate` VALUES ('263', '英镑', '人民币', '10.20', null, '1409394062');
INSERT INTO `t_exchange_rate` VALUES ('264', '英镑', '人民币', '10.20', null, '1409394121');
INSERT INTO `t_exchange_rate` VALUES ('265', '英镑', '人民币', '10.20', null, '1409394182');
INSERT INTO `t_exchange_rate` VALUES ('266', '英镑', '人民币', '10.20', null, '1409394241');
INSERT INTO `t_exchange_rate` VALUES ('267', '英镑', '人民币', '10.20', null, '1409394302');
INSERT INTO `t_exchange_rate` VALUES ('268', '英镑', '人民币', '10.20', null, '1409394361');
INSERT INTO `t_exchange_rate` VALUES ('269', '英镑', '人民币', '10.20', null, '1409394422');
INSERT INTO `t_exchange_rate` VALUES ('270', '英镑', '人民币', '10.20', null, '1409394484');
INSERT INTO `t_exchange_rate` VALUES ('271', '英镑', '人民币', '10.20', null, '1409394542');
INSERT INTO `t_exchange_rate` VALUES ('272', '英镑', '人民币', '10.20', null, '1409394601');
INSERT INTO `t_exchange_rate` VALUES ('273', '英镑', '人民币', '10.20', null, '1409394661');
INSERT INTO `t_exchange_rate` VALUES ('274', '英镑', '人民币', '10.20', null, '1409394722');
INSERT INTO `t_exchange_rate` VALUES ('275', '英镑', '人民币', '10.20', null, '1409394781');
INSERT INTO `t_exchange_rate` VALUES ('276', '英镑', '人民币', '10.20', null, '1409394842');
INSERT INTO `t_exchange_rate` VALUES ('277', '英镑', '人民币', '10.20', null, '1409394901');
INSERT INTO `t_exchange_rate` VALUES ('278', '英镑', '人民币', '10.20', null, '1409394962');
INSERT INTO `t_exchange_rate` VALUES ('279', '英镑', '人民币', '10.20', null, '1409395021');
INSERT INTO `t_exchange_rate` VALUES ('280', '英镑', '人民币', '10.20', null, '1409395081');
INSERT INTO `t_exchange_rate` VALUES ('281', '英镑', '人民币', '10.20', null, '1409395142');
INSERT INTO `t_exchange_rate` VALUES ('282', '英镑', '人民币', '10.20', null, '1409395202');
INSERT INTO `t_exchange_rate` VALUES ('283', '英镑', '人民币', '10.20', null, '1409395262');
INSERT INTO `t_exchange_rate` VALUES ('284', '英镑', '人民币', '10.20', null, '1409395321');
INSERT INTO `t_exchange_rate` VALUES ('285', '英镑', '人民币', '10.20', null, '1409395385');
INSERT INTO `t_exchange_rate` VALUES ('286', '英镑', '人民币', '10.20', null, '1409395441');
INSERT INTO `t_exchange_rate` VALUES ('287', '英镑', '人民币', '10.20', null, '1409395502');
INSERT INTO `t_exchange_rate` VALUES ('288', '英镑', '人民币', '10.20', null, '1409395561');
INSERT INTO `t_exchange_rate` VALUES ('289', '英镑', '人民币', '10.20', null, '1409395622');
INSERT INTO `t_exchange_rate` VALUES ('290', '英镑', '人民币', '10.20', null, '1409395681');
INSERT INTO `t_exchange_rate` VALUES ('291', '英镑', '人民币', '10.20', null, '1409395742');
INSERT INTO `t_exchange_rate` VALUES ('292', '英镑', '人民币', '10.20', null, '1409395801');
INSERT INTO `t_exchange_rate` VALUES ('293', '英镑', '人民币', '10.20', null, '1409395862');
INSERT INTO `t_exchange_rate` VALUES ('294', '英镑', '人民币', '10.20', null, '1409395921');
INSERT INTO `t_exchange_rate` VALUES ('295', '英镑', '人民币', '10.20', null, '1409395982');
INSERT INTO `t_exchange_rate` VALUES ('296', '英镑', '人民币', '10.20', null, '1409396041');
INSERT INTO `t_exchange_rate` VALUES ('297', '英镑', '人民币', '10.20', null, '1409396102');
INSERT INTO `t_exchange_rate` VALUES ('298', '英镑', '人民币', '10.20', null, '1409396162');
INSERT INTO `t_exchange_rate` VALUES ('299', '英镑', '人民币', '10.20', null, '1409396226');
INSERT INTO `t_exchange_rate` VALUES ('300', '英镑', '人民币', '10.20', null, '1409396282');
INSERT INTO `t_exchange_rate` VALUES ('301', '英镑', '人民币', '10.20', null, '1409396341');
INSERT INTO `t_exchange_rate` VALUES ('302', '英镑', '人民币', '10.20', null, '1409436002');
INSERT INTO `t_exchange_rate` VALUES ('303', '英镑', '人民币', '10.20', null, '1409436062');
INSERT INTO `t_exchange_rate` VALUES ('304', '英镑', '人民币', '10.20', null, '1409436121');
INSERT INTO `t_exchange_rate` VALUES ('305', '英镑', '人民币', '10.20', null, '1409436182');
INSERT INTO `t_exchange_rate` VALUES ('306', '英镑', '人民币', '10.20', null, '1409436241');
INSERT INTO `t_exchange_rate` VALUES ('307', '英镑', '人民币', '10.20', null, '1409436302');
INSERT INTO `t_exchange_rate` VALUES ('308', '英镑', '人民币', '10.20', null, '1409436361');
INSERT INTO `t_exchange_rate` VALUES ('309', '英镑', '人民币', '10.20', null, '1409436422');
INSERT INTO `t_exchange_rate` VALUES ('310', '英镑', '人民币', '10.20', null, '1409436481');
INSERT INTO `t_exchange_rate` VALUES ('311', '英镑', '人民币', '10.20', null, '1409436542');
INSERT INTO `t_exchange_rate` VALUES ('312', '英镑', '人民币', '10.20', null, '1409436601');
INSERT INTO `t_exchange_rate` VALUES ('313', '英镑', '人民币', '10.20', null, '1409436661');
INSERT INTO `t_exchange_rate` VALUES ('314', '英镑', '人民币', '10.20', null, '1409436722');
INSERT INTO `t_exchange_rate` VALUES ('315', '英镑', '人民币', '10.20', null, '1409436781');
INSERT INTO `t_exchange_rate` VALUES ('316', '英镑', '人民币', '10.20', null, '1409436842');
INSERT INTO `t_exchange_rate` VALUES ('317', '英镑', '人民币', '10.20', null, '1409436901');
INSERT INTO `t_exchange_rate` VALUES ('318', '英镑', '人民币', '10.20', null, '1409436962');
INSERT INTO `t_exchange_rate` VALUES ('319', '英镑', '人民币', '10.20', null, '1409437021');
INSERT INTO `t_exchange_rate` VALUES ('320', '英镑', '人民币', '10.20', null, '1409437082');
INSERT INTO `t_exchange_rate` VALUES ('321', '英镑', '人民币', '10.20', null, '1409437141');
INSERT INTO `t_exchange_rate` VALUES ('322', '英镑', '人民币', '10.20', null, '1409437202');
INSERT INTO `t_exchange_rate` VALUES ('323', '英镑', '人民币', '10.20', null, '1409437263');
INSERT INTO `t_exchange_rate` VALUES ('324', '英镑', '人民币', '10.20', null, '1409437321');
INSERT INTO `t_exchange_rate` VALUES ('325', '英镑', '人民币', '10.20', null, '1409437382');
INSERT INTO `t_exchange_rate` VALUES ('326', '英镑', '人民币', '10.20', null, '1409437441');
INSERT INTO `t_exchange_rate` VALUES ('327', '英镑', '人民币', '10.20', null, '1409437502');
INSERT INTO `t_exchange_rate` VALUES ('328', '英镑', '人民币', '10.20', null, '1409437561');
INSERT INTO `t_exchange_rate` VALUES ('329', '英镑', '人民币', '10.20', null, '1409437622');
INSERT INTO `t_exchange_rate` VALUES ('330', '英镑', '人民币', '10.20', null, '1409437681');
INSERT INTO `t_exchange_rate` VALUES ('331', '英镑', '人民币', '10.20', null, '1409437742');
INSERT INTO `t_exchange_rate` VALUES ('332', '英镑', '人民币', '10.20', null, '1409437801');
INSERT INTO `t_exchange_rate` VALUES ('333', '英镑', '人民币', '10.20', null, '1409437861');
INSERT INTO `t_exchange_rate` VALUES ('334', '英镑', '人民币', '10.20', null, '1409437922');
INSERT INTO `t_exchange_rate` VALUES ('335', '英镑', '人民币', '10.20', null, '1409437981');
INSERT INTO `t_exchange_rate` VALUES ('336', '英镑', '人民币', '10.20', null, '1409438042');
INSERT INTO `t_exchange_rate` VALUES ('337', '英镑', '人民币', '10.20', null, '1409438101');
INSERT INTO `t_exchange_rate` VALUES ('338', '英镑', '人民币', '10.20', null, '1409438161');
INSERT INTO `t_exchange_rate` VALUES ('339', '英镑', '人民币', '10.20', null, '1409438222');
INSERT INTO `t_exchange_rate` VALUES ('340', '英镑', '人民币', '10.20', null, '1409438281');
INSERT INTO `t_exchange_rate` VALUES ('341', '英镑', '人民币', '10.20', null, '1409438345');
INSERT INTO `t_exchange_rate` VALUES ('342', '英镑', '人民币', '10.20', null, '1409438401');
INSERT INTO `t_exchange_rate` VALUES ('343', '英镑', '人民币', '10.20', null, '1409438461');
INSERT INTO `t_exchange_rate` VALUES ('344', '英镑', '人民币', '10.20', null, '1409438522');
INSERT INTO `t_exchange_rate` VALUES ('345', '英镑', '人民币', '10.20', null, '1409438581');
INSERT INTO `t_exchange_rate` VALUES ('346', '英镑', '人民币', '10.20', null, '1409438641');
INSERT INTO `t_exchange_rate` VALUES ('347', '英镑', '人民币', '10.20', null, '1409438701');
INSERT INTO `t_exchange_rate` VALUES ('348', '英镑', '人民币', '10.20', null, '1409438761');
INSERT INTO `t_exchange_rate` VALUES ('349', '英镑', '人民币', '10.20', null, '1409438822');
INSERT INTO `t_exchange_rate` VALUES ('350', '英镑', '人民币', '10.20', null, '1409438881');
INSERT INTO `t_exchange_rate` VALUES ('351', '英镑', '人民币', '10.20', null, '1409438942');
INSERT INTO `t_exchange_rate` VALUES ('352', '英镑', '人民币', '10.20', null, '1409439001');
INSERT INTO `t_exchange_rate` VALUES ('353', '英镑', '人民币', '10.20', null, '1409439062');
INSERT INTO `t_exchange_rate` VALUES ('354', '英镑', '人民币', '10.20', null, '1409439121');
INSERT INTO `t_exchange_rate` VALUES ('355', '英镑', '人民币', '10.20', null, '1409439182');
INSERT INTO `t_exchange_rate` VALUES ('356', '英镑', '人民币', '10.20', null, '1409439241');
INSERT INTO `t_exchange_rate` VALUES ('357', '英镑', '人民币', '10.20', null, '1409439302');
INSERT INTO `t_exchange_rate` VALUES ('358', '英镑', '人民币', '10.20', null, '1409439363');
INSERT INTO `t_exchange_rate` VALUES ('359', '英镑', '人民币', '10.20', null, '1409439422');
INSERT INTO `t_exchange_rate` VALUES ('360', '英镑', '人民币', '10.20', null, '1409439482');
INSERT INTO `t_exchange_rate` VALUES ('361', '英镑', '人民币', '10.20', null, '1409439541');
INSERT INTO `t_exchange_rate` VALUES ('362', '英镑', '人民币', '10.20', null, '1409479202');
INSERT INTO `t_exchange_rate` VALUES ('363', '英镑', '人民币', '10.20', null, '1409479262');
INSERT INTO `t_exchange_rate` VALUES ('364', '英镑', '人民币', '10.20', null, '1409479321');
INSERT INTO `t_exchange_rate` VALUES ('365', '英镑', '人民币', '10.20', null, '1409479382');
INSERT INTO `t_exchange_rate` VALUES ('366', '英镑', '人民币', '10.20', null, '1409479442');
INSERT INTO `t_exchange_rate` VALUES ('367', '英镑', '人民币', '10.20', null, '1409479501');
INSERT INTO `t_exchange_rate` VALUES ('368', '英镑', '人民币', '10.20', null, '1409479563');
INSERT INTO `t_exchange_rate` VALUES ('369', '英镑', '人民币', '10.20', null, '1409479621');
INSERT INTO `t_exchange_rate` VALUES ('370', '英镑', '人民币', '10.20', null, '1409479682');
INSERT INTO `t_exchange_rate` VALUES ('371', '英镑', '人民币', '10.20', null, '1409479744');
INSERT INTO `t_exchange_rate` VALUES ('372', '英镑', '人民币', '10.20', null, '1409479802');
INSERT INTO `t_exchange_rate` VALUES ('373', '英镑', '人民币', '10.20', null, '1409479862');
INSERT INTO `t_exchange_rate` VALUES ('374', '英镑', '人民币', '10.20', null, '1409479922');
INSERT INTO `t_exchange_rate` VALUES ('375', '英镑', '人民币', '10.20', null, '1409479982');
INSERT INTO `t_exchange_rate` VALUES ('376', '英镑', '人民币', '10.20', null, '1409480043');
INSERT INTO `t_exchange_rate` VALUES ('377', '英镑', '人民币', '10.20', null, '1409480104');
INSERT INTO `t_exchange_rate` VALUES ('378', '英镑', '人民币', '10.20', null, '1409480162');
INSERT INTO `t_exchange_rate` VALUES ('379', '英镑', '人民币', '10.20', null, '1409480221');
INSERT INTO `t_exchange_rate` VALUES ('380', '英镑', '人民币', '10.20', null, '1409480282');
INSERT INTO `t_exchange_rate` VALUES ('381', '英镑', '人民币', '10.20', null, '1409480341');
INSERT INTO `t_exchange_rate` VALUES ('382', '英镑', '人民币', '10.20', null, '1409480402');
INSERT INTO `t_exchange_rate` VALUES ('383', '英镑', '人民币', '10.20', null, '1409480462');
INSERT INTO `t_exchange_rate` VALUES ('384', '英镑', '人民币', '10.20', null, '1409480521');
INSERT INTO `t_exchange_rate` VALUES ('385', '英镑', '人民币', '10.20', null, '1409480582');
INSERT INTO `t_exchange_rate` VALUES ('386', '英镑', '人民币', '10.20', null, '1409480641');
INSERT INTO `t_exchange_rate` VALUES ('387', '英镑', '人民币', '10.20', null, '1409480702');
INSERT INTO `t_exchange_rate` VALUES ('388', '英镑', '人民币', '10.20', null, '1409480762');
INSERT INTO `t_exchange_rate` VALUES ('389', '英镑', '人民币', '10.20', null, '1409480821');
INSERT INTO `t_exchange_rate` VALUES ('390', '英镑', '人民币', '10.20', null, '1409480882');
INSERT INTO `t_exchange_rate` VALUES ('391', '英镑', '人民币', '10.20', null, '1409480941');
INSERT INTO `t_exchange_rate` VALUES ('392', '英镑', '人民币', '10.20', null, '1409481002');
INSERT INTO `t_exchange_rate` VALUES ('393', '英镑', '人民币', '10.20', null, '1409481061');
INSERT INTO `t_exchange_rate` VALUES ('394', '英镑', '人民币', '10.20', null, '1409481122');
INSERT INTO `t_exchange_rate` VALUES ('395', '英镑', '人民币', '10.20', null, '1409481181');
INSERT INTO `t_exchange_rate` VALUES ('396', '英镑', '人民币', '10.20', null, '1409481242');
INSERT INTO `t_exchange_rate` VALUES ('397', '英镑', '人民币', '10.20', null, '1409481301');
INSERT INTO `t_exchange_rate` VALUES ('398', '英镑', '人民币', '10.20', null, '1409481361');
INSERT INTO `t_exchange_rate` VALUES ('399', '英镑', '人民币', '10.20', null, '1409481422');
INSERT INTO `t_exchange_rate` VALUES ('400', '英镑', '人民币', '10.20', null, '1409481481');
INSERT INTO `t_exchange_rate` VALUES ('401', '英镑', '人民币', '10.20', null, '1409481542');
INSERT INTO `t_exchange_rate` VALUES ('402', '英镑', '人民币', '10.20', null, '1409481601');
INSERT INTO `t_exchange_rate` VALUES ('403', '英镑', '人民币', '10.20', null, '1409481662');
INSERT INTO `t_exchange_rate` VALUES ('404', '英镑', '人民币', '10.20', null, '1409481721');
INSERT INTO `t_exchange_rate` VALUES ('405', '英镑', '人民币', '10.20', null, '1409481782');
INSERT INTO `t_exchange_rate` VALUES ('406', '英镑', '人民币', '10.20', null, '1409481841');
INSERT INTO `t_exchange_rate` VALUES ('407', '英镑', '人民币', '10.20', null, '1409481902');
INSERT INTO `t_exchange_rate` VALUES ('408', '英镑', '人民币', '10.20', null, '1409481961');
INSERT INTO `t_exchange_rate` VALUES ('409', '英镑', '人民币', '10.20', null, '1409482022');
INSERT INTO `t_exchange_rate` VALUES ('410', '英镑', '人民币', '10.20', null, '1409482081');
INSERT INTO `t_exchange_rate` VALUES ('411', '英镑', '人民币', '10.20', null, '1409482142');
INSERT INTO `t_exchange_rate` VALUES ('412', '英镑', '人民币', '10.20', null, '1409482201');
INSERT INTO `t_exchange_rate` VALUES ('413', '英镑', '人民币', '10.20', null, '1409482262');
INSERT INTO `t_exchange_rate` VALUES ('414', '英镑', '人民币', '10.20', null, '1409482322');
INSERT INTO `t_exchange_rate` VALUES ('415', '英镑', '人民币', '10.20', null, '1409482381');
INSERT INTO `t_exchange_rate` VALUES ('416', '英镑', '人民币', '10.20', null, '1409482442');
INSERT INTO `t_exchange_rate` VALUES ('417', '英镑', '人民币', '10.20', null, '1409482501');
INSERT INTO `t_exchange_rate` VALUES ('418', '英镑', '人民币', '10.20', null, '1409482562');
INSERT INTO `t_exchange_rate` VALUES ('419', '英镑', '人民币', '10.20', null, '1409482621');
INSERT INTO `t_exchange_rate` VALUES ('420', '英镑', '人民币', '10.20', null, '1409482682');
INSERT INTO `t_exchange_rate` VALUES ('421', '英镑', '人民币', '10.20', null, '1409482741');
INSERT INTO `t_exchange_rate` VALUES ('422', '英镑', '人民币', '10.21', null, '1409522401');
INSERT INTO `t_exchange_rate` VALUES ('423', '英镑', '人民币', '10.21', null, '1409522473');
INSERT INTO `t_exchange_rate` VALUES ('424', '英镑', '人民币', '10.21', null, '1409522521');
INSERT INTO `t_exchange_rate` VALUES ('425', '英镑', '人民币', '10.21', null, '1409522582');
INSERT INTO `t_exchange_rate` VALUES ('426', '英镑', '人民币', '10.21', null, '1409522641');
INSERT INTO `t_exchange_rate` VALUES ('427', '英镑', '人民币', '10.21', null, '1409522702');
INSERT INTO `t_exchange_rate` VALUES ('428', '英镑', '人民币', '10.21', null, '1409522761');
INSERT INTO `t_exchange_rate` VALUES ('429', '英镑', '人民币', '10.21', null, '1409522822');
INSERT INTO `t_exchange_rate` VALUES ('430', '英镑', '人民币', '10.21', null, '1409522881');
INSERT INTO `t_exchange_rate` VALUES ('431', '英镑', '人民币', '10.21', null, '1409522942');
INSERT INTO `t_exchange_rate` VALUES ('432', '英镑', '人民币', '10.21', null, '1409523001');
INSERT INTO `t_exchange_rate` VALUES ('433', '英镑', '人民币', '10.21', null, '1409523061');
INSERT INTO `t_exchange_rate` VALUES ('434', '英镑', '人民币', '10.21', null, '1409523122');
INSERT INTO `t_exchange_rate` VALUES ('435', '英镑', '人民币', '10.21', null, '1409523181');
INSERT INTO `t_exchange_rate` VALUES ('436', '英镑', '人民币', '10.21', null, '1409523242');
INSERT INTO `t_exchange_rate` VALUES ('437', '英镑', '人民币', '10.21', null, '1409523301');
INSERT INTO `t_exchange_rate` VALUES ('438', '英镑', '人民币', '10.21', null, '1409523362');
INSERT INTO `t_exchange_rate` VALUES ('439', '英镑', '人民币', '10.21', null, '1409523421');
INSERT INTO `t_exchange_rate` VALUES ('440', '英镑', '人民币', '10.21', null, '1409523482');
INSERT INTO `t_exchange_rate` VALUES ('441', '英镑', '人民币', '10.21', null, '1409523541');
INSERT INTO `t_exchange_rate` VALUES ('442', '英镑', '人民币', '10.21', null, '1409523602');
INSERT INTO `t_exchange_rate` VALUES ('443', '英镑', '人民币', '10.21', null, '1409523664');
INSERT INTO `t_exchange_rate` VALUES ('444', '英镑', '人民币', '10.21', null, '1409523733');
INSERT INTO `t_exchange_rate` VALUES ('445', '英镑', '人民币', '10.21', null, '1409523784');
INSERT INTO `t_exchange_rate` VALUES ('446', '英镑', '人民币', '10.21', null, '1409523853');
INSERT INTO `t_exchange_rate` VALUES ('447', '英镑', '人民币', '10.21', null, '1409523901');
INSERT INTO `t_exchange_rate` VALUES ('448', '英镑', '人民币', '10.21', null, '1409523963');
INSERT INTO `t_exchange_rate` VALUES ('449', '英镑', '人民币', '10.21', null, '1409524022');
INSERT INTO `t_exchange_rate` VALUES ('450', '英镑', '人民币', '10.21', null, '1409524081');
INSERT INTO `t_exchange_rate` VALUES ('451', '英镑', '人民币', '10.21', null, '1409524142');
INSERT INTO `t_exchange_rate` VALUES ('452', '英镑', '人民币', '10.21', null, '1409524201');
INSERT INTO `t_exchange_rate` VALUES ('453', '英镑', '人民币', '10.21', null, '1409524261');
INSERT INTO `t_exchange_rate` VALUES ('454', '英镑', '人民币', '10.21', null, '1409524321');
INSERT INTO `t_exchange_rate` VALUES ('455', '英镑', '人民币', '10.21', null, '1409524382');
INSERT INTO `t_exchange_rate` VALUES ('456', '英镑', '人民币', '10.21', null, '1409524441');
INSERT INTO `t_exchange_rate` VALUES ('457', '英镑', '人民币', '10.21', null, '1409524505');
INSERT INTO `t_exchange_rate` VALUES ('458', '英镑', '人民币', '10.21', null, '1409524561');
INSERT INTO `t_exchange_rate` VALUES ('459', '英镑', '人民币', '10.21', null, '1409524625');
INSERT INTO `t_exchange_rate` VALUES ('460', '英镑', '人民币', '10.21', null, '1409524682');
INSERT INTO `t_exchange_rate` VALUES ('461', '英镑', '人民币', '10.21', null, '1409524742');
INSERT INTO `t_exchange_rate` VALUES ('462', '英镑', '人民币', '10.21', null, '1409524801');
INSERT INTO `t_exchange_rate` VALUES ('463', '英镑', '人民币', '10.21', null, '1409524861');
INSERT INTO `t_exchange_rate` VALUES ('464', '英镑', '人民币', '10.21', null, '1409524922');
INSERT INTO `t_exchange_rate` VALUES ('465', '英镑', '人民币', '10.21', null, '1409524981');
INSERT INTO `t_exchange_rate` VALUES ('466', '英镑', '人民币', '10.21', null, '1409525042');
INSERT INTO `t_exchange_rate` VALUES ('467', '英镑', '人民币', '10.21', null, '1409525101');
INSERT INTO `t_exchange_rate` VALUES ('468', '英镑', '人民币', '10.21', null, '1409525162');
INSERT INTO `t_exchange_rate` VALUES ('469', '英镑', '人民币', '10.21', null, '1409525221');
INSERT INTO `t_exchange_rate` VALUES ('470', '英镑', '人民币', '10.21', null, '1409525285');
INSERT INTO `t_exchange_rate` VALUES ('471', '英镑', '人民币', '10.21', null, '1409525341');
INSERT INTO `t_exchange_rate` VALUES ('472', '英镑', '人民币', '10.21', null, '1409525402');
INSERT INTO `t_exchange_rate` VALUES ('473', '英镑', '人民币', '10.21', null, '1409525461');
INSERT INTO `t_exchange_rate` VALUES ('474', '英镑', '人民币', '10.21', null, '1409525522');
INSERT INTO `t_exchange_rate` VALUES ('475', '英镑', '人民币', '10.21', null, '1409525581');
INSERT INTO `t_exchange_rate` VALUES ('476', '英镑', '人民币', '10.21', null, '1409525642');
INSERT INTO `t_exchange_rate` VALUES ('477', '英镑', '人民币', '10.21', null, '1409525703');
INSERT INTO `t_exchange_rate` VALUES ('478', '英镑', '人民币', '10.21', null, '1409525761');
INSERT INTO `t_exchange_rate` VALUES ('479', '英镑', '人民币', '10.21', null, '1409525822');
INSERT INTO `t_exchange_rate` VALUES ('480', '英镑', '人民币', '10.21', null, '1409525881');
INSERT INTO `t_exchange_rate` VALUES ('481', '英镑', '人民币', '10.21', null, '1409525941');
INSERT INTO `t_exchange_rate` VALUES ('482', '英镑', '人民币', '10.21', null, '1409565605');
INSERT INTO `t_exchange_rate` VALUES ('483', '英镑', '人民币', '10.21', null, '1409565662');
INSERT INTO `t_exchange_rate` VALUES ('484', '英镑', '人民币', '10.21', null, '1409565722');
INSERT INTO `t_exchange_rate` VALUES ('485', '英镑', '人民币', '10.21', null, '1409565781');
INSERT INTO `t_exchange_rate` VALUES ('486', '英镑', '人民币', '10.21', null, '1409565842');
INSERT INTO `t_exchange_rate` VALUES ('487', '英镑', '人民币', '10.21', null, '1409565912');
INSERT INTO `t_exchange_rate` VALUES ('488', '英镑', '人民币', '10.21', null, '1409565961');
INSERT INTO `t_exchange_rate` VALUES ('489', '英镑', '人民币', '10.21', null, '1409566022');
INSERT INTO `t_exchange_rate` VALUES ('490', '英镑', '人民币', '10.21', null, '1409566084');
INSERT INTO `t_exchange_rate` VALUES ('491', '英镑', '人民币', '10.21', null, '1409566142');
INSERT INTO `t_exchange_rate` VALUES ('492', '英镑', '人民币', '10.21', null, '1409566202');
INSERT INTO `t_exchange_rate` VALUES ('493', '英镑', '人民币', '10.21', null, '1409566261');
INSERT INTO `t_exchange_rate` VALUES ('494', '英镑', '人民币', '10.21', null, '1409566323');
INSERT INTO `t_exchange_rate` VALUES ('495', '英镑', '人民币', '10.21', null, '1409566382');
INSERT INTO `t_exchange_rate` VALUES ('496', '英镑', '人民币', '10.21', null, '1409566441');
INSERT INTO `t_exchange_rate` VALUES ('497', '英镑', '人民币', '10.21', null, '1409566502');
INSERT INTO `t_exchange_rate` VALUES ('498', '英镑', '人民币', '10.21', null, '1409566562');
INSERT INTO `t_exchange_rate` VALUES ('499', '英镑', '人民币', '10.21', null, '1409566627');
INSERT INTO `t_exchange_rate` VALUES ('500', '英镑', '人民币', '10.21', null, '1409566683');
INSERT INTO `t_exchange_rate` VALUES ('501', '英镑', '人民币', '10.21', null, '1409566741');
INSERT INTO `t_exchange_rate` VALUES ('502', '英镑', '人民币', '10.21', null, '1409566802');
INSERT INTO `t_exchange_rate` VALUES ('503', '英镑', '人民币', '10.21', null, '1409566862');
INSERT INTO `t_exchange_rate` VALUES ('504', '英镑', '人民币', '10.21', null, '1409566922');
INSERT INTO `t_exchange_rate` VALUES ('505', '英镑', '人民币', '10.21', null, '1409566981');
INSERT INTO `t_exchange_rate` VALUES ('506', '英镑', '人民币', '10.21', null, '1409567042');
INSERT INTO `t_exchange_rate` VALUES ('507', '英镑', '人民币', '10.21', null, '1409567101');
INSERT INTO `t_exchange_rate` VALUES ('508', '英镑', '人民币', '10.21', null, '1409567162');
INSERT INTO `t_exchange_rate` VALUES ('509', '英镑', '人民币', '10.21', null, '1409567223');
INSERT INTO `t_exchange_rate` VALUES ('510', '英镑', '人民币', '10.21', null, '1409567281');
INSERT INTO `t_exchange_rate` VALUES ('511', '英镑', '人民币', '10.21', null, '1409567345');
INSERT INTO `t_exchange_rate` VALUES ('512', '英镑', '人民币', '10.21', null, '1409567401');
INSERT INTO `t_exchange_rate` VALUES ('513', '英镑', '人民币', '10.21', null, '1409567464');
INSERT INTO `t_exchange_rate` VALUES ('514', '英镑', '人民币', '10.21', null, '1409567522');
INSERT INTO `t_exchange_rate` VALUES ('515', '英镑', '人民币', '10.21', null, '1409567581');
INSERT INTO `t_exchange_rate` VALUES ('516', '英镑', '人民币', '10.21', null, '1409567642');
INSERT INTO `t_exchange_rate` VALUES ('517', '英镑', '人民币', '10.21', null, '1409567701');
INSERT INTO `t_exchange_rate` VALUES ('518', '英镑', '人民币', '10.21', null, '1409567762');
INSERT INTO `t_exchange_rate` VALUES ('519', '英镑', '人民币', '10.21', null, '1409567821');
INSERT INTO `t_exchange_rate` VALUES ('520', '英镑', '人民币', '10.21', null, '1409567885');
INSERT INTO `t_exchange_rate` VALUES ('521', '英镑', '人民币', '10.21', null, '1409567944');
INSERT INTO `t_exchange_rate` VALUES ('522', '英镑', '人民币', '10.21', null, '1409568002');
INSERT INTO `t_exchange_rate` VALUES ('523', '英镑', '人民币', '10.21', null, '1409568062');
INSERT INTO `t_exchange_rate` VALUES ('524', '英镑', '人民币', '10.21', null, '1409568121');
INSERT INTO `t_exchange_rate` VALUES ('525', '英镑', '人民币', '10.21', null, '1409568182');
INSERT INTO `t_exchange_rate` VALUES ('526', '英镑', '人民币', '10.21', null, '1409568241');
INSERT INTO `t_exchange_rate` VALUES ('527', '英镑', '人民币', '10.21', null, '1409568302');
INSERT INTO `t_exchange_rate` VALUES ('528', '英镑', '人民币', '10.21', null, '1409568365');
INSERT INTO `t_exchange_rate` VALUES ('529', '英镑', '人民币', '10.21', null, '1409568421');
INSERT INTO `t_exchange_rate` VALUES ('530', '英镑', '人民币', '10.21', null, '1409568482');
INSERT INTO `t_exchange_rate` VALUES ('531', '英镑', '人民币', '10.21', null, '1409568541');
INSERT INTO `t_exchange_rate` VALUES ('532', '英镑', '人民币', '10.21', null, '1409568602');
INSERT INTO `t_exchange_rate` VALUES ('533', '英镑', '人民币', '10.21', null, '1409568665');
INSERT INTO `t_exchange_rate` VALUES ('534', '英镑', '人民币', '10.21', null, '1409568721');
INSERT INTO `t_exchange_rate` VALUES ('535', '英镑', '人民币', '10.21', null, '1409568782');
INSERT INTO `t_exchange_rate` VALUES ('536', '英镑', '人民币', '10.21', null, '1409568841');
INSERT INTO `t_exchange_rate` VALUES ('537', '英镑', '人民币', '10.21', null, '1409568902');
INSERT INTO `t_exchange_rate` VALUES ('538', '英镑', '人民币', '10.21', null, '1409568961');
INSERT INTO `t_exchange_rate` VALUES ('539', '英镑', '人民币', '10.21', null, '1409569022');
INSERT INTO `t_exchange_rate` VALUES ('540', '英镑', '人民币', '10.21', null, '1409569081');
INSERT INTO `t_exchange_rate` VALUES ('541', '英镑', '人民币', '10.21', null, '1409569145');
INSERT INTO `t_exchange_rate` VALUES ('542', '英镑', '人民币', '10.21', null, '1409608801');
INSERT INTO `t_exchange_rate` VALUES ('543', '英镑', '人民币', '10.21', null, '1409608861');
INSERT INTO `t_exchange_rate` VALUES ('544', '英镑', '人民币', '10.21', null, '1409608922');
INSERT INTO `t_exchange_rate` VALUES ('545', '英镑', '人民币', '10.21', null, '1409608981');
INSERT INTO `t_exchange_rate` VALUES ('546', '英镑', '人民币', '10.20', null, '1409609042');
INSERT INTO `t_exchange_rate` VALUES ('547', '英镑', '人民币', '10.20', null, '1409609101');
INSERT INTO `t_exchange_rate` VALUES ('548', '英镑', '人民币', '10.20', null, '1409609162');
INSERT INTO `t_exchange_rate` VALUES ('549', '英镑', '人民币', '10.20', null, '1409609221');
INSERT INTO `t_exchange_rate` VALUES ('550', '英镑', '人民币', '10.20', null, '1409609282');
INSERT INTO `t_exchange_rate` VALUES ('551', '英镑', '人民币', '10.20', null, '1409609342');
INSERT INTO `t_exchange_rate` VALUES ('552', '英镑', '人民币', '10.20', null, '1409609401');
INSERT INTO `t_exchange_rate` VALUES ('553', '英镑', '人民币', '10.20', null, '1409609461');
INSERT INTO `t_exchange_rate` VALUES ('554', '英镑', '人民币', '10.20', null, '1409609522');
INSERT INTO `t_exchange_rate` VALUES ('555', '英镑', '人民币', '10.20', null, '1409609581');
INSERT INTO `t_exchange_rate` VALUES ('556', '英镑', '人民币', '10.20', null, '1409609642');
INSERT INTO `t_exchange_rate` VALUES ('557', '英镑', '人民币', '10.20', null, '1409609701');
INSERT INTO `t_exchange_rate` VALUES ('558', '英镑', '人民币', '10.20', null, '1409609762');
INSERT INTO `t_exchange_rate` VALUES ('559', '英镑', '人民币', '10.20', null, '1409609821');
INSERT INTO `t_exchange_rate` VALUES ('560', '英镑', '人民币', '10.20', null, '1409609882');
INSERT INTO `t_exchange_rate` VALUES ('561', '英镑', '人民币', '10.20', null, '1409609941');
INSERT INTO `t_exchange_rate` VALUES ('562', '英镑', '人民币', '10.20', null, '1409610002');
INSERT INTO `t_exchange_rate` VALUES ('563', '英镑', '人民币', '10.20', null, '1409610061');
INSERT INTO `t_exchange_rate` VALUES ('564', '英镑', '人民币', '10.20', null, '1409610122');
INSERT INTO `t_exchange_rate` VALUES ('565', '英镑', '人民币', '10.20', null, '1409610182');
INSERT INTO `t_exchange_rate` VALUES ('566', '英镑', '人民币', '10.20', null, '1409610241');
INSERT INTO `t_exchange_rate` VALUES ('567', '英镑', '人民币', '10.20', null, '1409610302');
INSERT INTO `t_exchange_rate` VALUES ('568', '英镑', '人民币', '10.20', null, '1409610361');
INSERT INTO `t_exchange_rate` VALUES ('569', '英镑', '人民币', '10.20', null, '1409610422');
INSERT INTO `t_exchange_rate` VALUES ('570', '英镑', '人民币', '10.20', null, '1409610481');
INSERT INTO `t_exchange_rate` VALUES ('571', '英镑', '人民币', '10.20', null, '1409610542');
INSERT INTO `t_exchange_rate` VALUES ('572', '英镑', '人民币', '10.20', null, '1409610601');
INSERT INTO `t_exchange_rate` VALUES ('573', '英镑', '人民币', '10.20', null, '1409610662');
INSERT INTO `t_exchange_rate` VALUES ('574', '英镑', '人民币', '10.20', null, '1409610721');
INSERT INTO `t_exchange_rate` VALUES ('575', '英镑', '人民币', '10.20', null, '1409610782');
INSERT INTO `t_exchange_rate` VALUES ('576', '英镑', '人民币', '10.20', null, '1409610841');
INSERT INTO `t_exchange_rate` VALUES ('577', '英镑', '人民币', '10.20', null, '1409610902');
INSERT INTO `t_exchange_rate` VALUES ('578', '英镑', '人民币', '10.20', null, '1409610961');
INSERT INTO `t_exchange_rate` VALUES ('579', '英镑', '人民币', '10.20', null, '1409611021');
INSERT INTO `t_exchange_rate` VALUES ('580', '英镑', '人民币', '10.20', null, '1409611082');
INSERT INTO `t_exchange_rate` VALUES ('581', '英镑', '人民币', '10.20', null, '1409611141');
INSERT INTO `t_exchange_rate` VALUES ('582', '英镑', '人民币', '10.20', null, '1409611202');
INSERT INTO `t_exchange_rate` VALUES ('583', '英镑', '人民币', '10.20', null, '1409611262');
INSERT INTO `t_exchange_rate` VALUES ('584', '英镑', '人民币', '10.20', null, '1409611321');
INSERT INTO `t_exchange_rate` VALUES ('585', '英镑', '人民币', '10.20', null, '1409611382');
INSERT INTO `t_exchange_rate` VALUES ('586', '英镑', '人民币', '10.20', null, '1409611441');
INSERT INTO `t_exchange_rate` VALUES ('587', '英镑', '人民币', '10.20', null, '1409611502');
INSERT INTO `t_exchange_rate` VALUES ('588', '英镑', '人民币', '10.20', null, '1409611561');
INSERT INTO `t_exchange_rate` VALUES ('589', '英镑', '人民币', '10.20', null, '1409611622');
INSERT INTO `t_exchange_rate` VALUES ('590', '英镑', '人民币', '10.20', null, '1409611682');
INSERT INTO `t_exchange_rate` VALUES ('591', '英镑', '人民币', '10.20', null, '1409611741');
INSERT INTO `t_exchange_rate` VALUES ('592', '英镑', '人民币', '10.20', null, '1409611802');
INSERT INTO `t_exchange_rate` VALUES ('593', '英镑', '人民币', '10.20', null, '1409611862');
INSERT INTO `t_exchange_rate` VALUES ('594', '英镑', '人民币', '10.20', null, '1409611921');
INSERT INTO `t_exchange_rate` VALUES ('595', '英镑', '人民币', '10.20', null, '1409611981');
INSERT INTO `t_exchange_rate` VALUES ('596', '英镑', '人民币', '10.20', null, '1409612042');
INSERT INTO `t_exchange_rate` VALUES ('597', '英镑', '人民币', '10.20', null, '1409612101');
INSERT INTO `t_exchange_rate` VALUES ('598', '英镑', '人民币', '10.20', null, '1409612162');
INSERT INTO `t_exchange_rate` VALUES ('599', '英镑', '人民币', '10.20', null, '1409612221');
INSERT INTO `t_exchange_rate` VALUES ('600', '英镑', '人民币', '10.20', null, '1409612282');
INSERT INTO `t_exchange_rate` VALUES ('601', '英镑', '人民币', '10.20', null, '1409612341');
INSERT INTO `t_exchange_rate` VALUES ('602', '英镑', '人民币', '10.16', null, '1409652002');
INSERT INTO `t_exchange_rate` VALUES ('603', '英镑', '人民币', '10.16', null, '1409652061');
INSERT INTO `t_exchange_rate` VALUES ('604', '英镑', '人民币', '10.16', null, '1409652122');
INSERT INTO `t_exchange_rate` VALUES ('605', '英镑', '人民币', '10.16', null, '1409652182');
INSERT INTO `t_exchange_rate` VALUES ('606', '英镑', '人民币', '10.16', null, '1409652241');
INSERT INTO `t_exchange_rate` VALUES ('607', '英镑', '人民币', '10.16', null, '1409652302');
INSERT INTO `t_exchange_rate` VALUES ('608', '英镑', '人民币', '10.16', null, '1409652362');
INSERT INTO `t_exchange_rate` VALUES ('609', '英镑', '人民币', '10.16', null, '1409652421');
INSERT INTO `t_exchange_rate` VALUES ('610', '英镑', '人民币', '10.16', null, '1409652483');
INSERT INTO `t_exchange_rate` VALUES ('611', '英镑', '人民币', '10.16', null, '1409652541');
INSERT INTO `t_exchange_rate` VALUES ('612', '英镑', '人民币', '10.16', null, '1409652602');
INSERT INTO `t_exchange_rate` VALUES ('613', '英镑', '人民币', '10.16', null, '1409652669');
INSERT INTO `t_exchange_rate` VALUES ('614', '英镑', '人民币', '10.16', null, '1409652722');
INSERT INTO `t_exchange_rate` VALUES ('615', '英镑', '人民币', '10.16', null, '1409652782');
INSERT INTO `t_exchange_rate` VALUES ('616', '英镑', '人民币', '10.16', null, '1409652842');
INSERT INTO `t_exchange_rate` VALUES ('617', '英镑', '人民币', '10.16', null, '1409652901');
INSERT INTO `t_exchange_rate` VALUES ('618', '英镑', '人民币', '10.16', null, '1409652962');
INSERT INTO `t_exchange_rate` VALUES ('619', '英镑', '人民币', '10.16', null, '1409653021');
INSERT INTO `t_exchange_rate` VALUES ('620', '英镑', '人民币', '10.16', null, '1409653082');
INSERT INTO `t_exchange_rate` VALUES ('621', '英镑', '人民币', '10.16', null, '1409653141');
INSERT INTO `t_exchange_rate` VALUES ('622', '英镑', '人民币', '10.16', null, '1409653202');
INSERT INTO `t_exchange_rate` VALUES ('623', '英镑', '人民币', '10.16', null, '1409653262');
INSERT INTO `t_exchange_rate` VALUES ('624', '英镑', '人民币', '10.16', null, '1409653321');
INSERT INTO `t_exchange_rate` VALUES ('625', '英镑', '人民币', '10.16', null, '1409653383');
INSERT INTO `t_exchange_rate` VALUES ('626', '英镑', '人民币', '10.16', null, '1409653441');
INSERT INTO `t_exchange_rate` VALUES ('627', '英镑', '人民币', '10.16', null, '1409653502');
INSERT INTO `t_exchange_rate` VALUES ('628', '英镑', '人民币', '10.16', null, '1409653561');
INSERT INTO `t_exchange_rate` VALUES ('629', '英镑', '人民币', '10.16', null, '1409653623');
INSERT INTO `t_exchange_rate` VALUES ('630', '英镑', '人民币', '10.16', null, '1409653682');
INSERT INTO `t_exchange_rate` VALUES ('631', '英镑', '人民币', '10.16', null, '1409653742');
INSERT INTO `t_exchange_rate` VALUES ('632', '英镑', '人民币', '10.16', null, '1409653801');
INSERT INTO `t_exchange_rate` VALUES ('633', '英镑', '人民币', '10.16', null, '1409653862');
INSERT INTO `t_exchange_rate` VALUES ('634', '英镑', '人民币', '10.16', null, '1409653922');
INSERT INTO `t_exchange_rate` VALUES ('635', '英镑', '人民币', '10.16', null, '1409653982');
INSERT INTO `t_exchange_rate` VALUES ('636', '英镑', '人民币', '10.16', null, '1409654041');
INSERT INTO `t_exchange_rate` VALUES ('637', '英镑', '人民币', '10.16', null, '1409654102');
INSERT INTO `t_exchange_rate` VALUES ('638', '英镑', '人民币', '10.16', null, '1409654162');
INSERT INTO `t_exchange_rate` VALUES ('639', '英镑', '人民币', '10.16', null, '1409654221');
INSERT INTO `t_exchange_rate` VALUES ('640', '英镑', '人民币', '10.16', null, '1409654283');
INSERT INTO `t_exchange_rate` VALUES ('641', '英镑', '人民币', '10.16', null, '1409654342');
INSERT INTO `t_exchange_rate` VALUES ('642', '英镑', '人民币', '10.16', null, '1409654402');
INSERT INTO `t_exchange_rate` VALUES ('643', '英镑', '人民币', '10.16', null, '1409654462');
INSERT INTO `t_exchange_rate` VALUES ('644', '英镑', '人民币', '10.16', null, '1409654522');
INSERT INTO `t_exchange_rate` VALUES ('645', '英镑', '人民币', '10.16', null, '1409654583');
INSERT INTO `t_exchange_rate` VALUES ('646', '英镑', '人民币', '10.16', null, '1409654642');
INSERT INTO `t_exchange_rate` VALUES ('647', '英镑', '人民币', '10.16', null, '1409654702');
INSERT INTO `t_exchange_rate` VALUES ('648', '英镑', '人民币', '10.17', null, '1409654762');
INSERT INTO `t_exchange_rate` VALUES ('649', '英镑', '人民币', '10.16', null, '1409654821');
INSERT INTO `t_exchange_rate` VALUES ('650', '英镑', '人民币', '10.16', null, '1409654882');
INSERT INTO `t_exchange_rate` VALUES ('651', '英镑', '人民币', '10.16', null, '1409654941');
INSERT INTO `t_exchange_rate` VALUES ('652', '英镑', '人民币', '10.16', null, '1409655002');
INSERT INTO `t_exchange_rate` VALUES ('653', '英镑', '人民币', '10.17', null, '1409655062');
INSERT INTO `t_exchange_rate` VALUES ('654', '英镑', '人民币', '10.16', null, '1409655121');
INSERT INTO `t_exchange_rate` VALUES ('655', '英镑', '人民币', '10.16', null, '1409655182');
INSERT INTO `t_exchange_rate` VALUES ('656', '英镑', '人民币', '10.16', null, '1409655242');
INSERT INTO `t_exchange_rate` VALUES ('657', '英镑', '人民币', '10.16', null, '1409655302');
INSERT INTO `t_exchange_rate` VALUES ('658', '英镑', '人民币', '10.16', null, '1409655361');
INSERT INTO `t_exchange_rate` VALUES ('659', '英镑', '人民币', '10.16', null, '1409655422');
INSERT INTO `t_exchange_rate` VALUES ('660', '英镑', '人民币', '10.16', null, '1409655482');
INSERT INTO `t_exchange_rate` VALUES ('661', '英镑', '人民币', '10.16', null, '1409655541');
INSERT INTO `t_exchange_rate` VALUES ('662', '英镑', '人民币', '10.13', null, '1409695201');
INSERT INTO `t_exchange_rate` VALUES ('663', '英镑', '人民币', '10.13', null, '1409695261');
INSERT INTO `t_exchange_rate` VALUES ('664', '英镑', '人民币', '10.13', null, '1409695322');
INSERT INTO `t_exchange_rate` VALUES ('665', '英镑', '人民币', '10.13', null, '1409695381');
INSERT INTO `t_exchange_rate` VALUES ('666', '英镑', '人民币', '10.13', null, '1409695442');
INSERT INTO `t_exchange_rate` VALUES ('667', '英镑', '人民币', '10.13', null, '1409695502');
INSERT INTO `t_exchange_rate` VALUES ('668', '英镑', '人民币', '10.13', null, '1409695561');
INSERT INTO `t_exchange_rate` VALUES ('669', '英镑', '人民币', '10.13', null, '1409695622');
INSERT INTO `t_exchange_rate` VALUES ('670', '英镑', '人民币', '10.13', null, '1409695681');
INSERT INTO `t_exchange_rate` VALUES ('671', '英镑', '人民币', '10.13', null, '1409695742');
INSERT INTO `t_exchange_rate` VALUES ('672', '英镑', '人民币', '10.13', null, '1409695801');
INSERT INTO `t_exchange_rate` VALUES ('673', '英镑', '人民币', '10.13', null, '1409695861');
INSERT INTO `t_exchange_rate` VALUES ('674', '英镑', '人民币', '10.13', null, '1409695922');
INSERT INTO `t_exchange_rate` VALUES ('675', '英镑', '人民币', '10.13', null, '1409695982');
INSERT INTO `t_exchange_rate` VALUES ('676', '英镑', '人民币', '10.13', null, '1409696041');
INSERT INTO `t_exchange_rate` VALUES ('677', '英镑', '人民币', '10.13', null, '1409696102');
INSERT INTO `t_exchange_rate` VALUES ('678', '英镑', '人民币', '10.13', null, '1409696161');
INSERT INTO `t_exchange_rate` VALUES ('679', '英镑', '人民币', '10.13', null, '1409696222');
INSERT INTO `t_exchange_rate` VALUES ('680', '英镑', '人民币', '10.13', null, '1409696281');
INSERT INTO `t_exchange_rate` VALUES ('681', '英镑', '人民币', '10.13', null, '1409696342');
INSERT INTO `t_exchange_rate` VALUES ('682', '英镑', '人民币', '10.13', null, '1409696401');
INSERT INTO `t_exchange_rate` VALUES ('683', '英镑', '人民币', '10.13', null, '1409696462');
INSERT INTO `t_exchange_rate` VALUES ('684', '英镑', '人民币', '10.13', null, '1409696522');
INSERT INTO `t_exchange_rate` VALUES ('685', '英镑', '人民币', '10.13', null, '1409696581');
INSERT INTO `t_exchange_rate` VALUES ('686', '英镑', '人民币', '10.13', null, '1409696642');
INSERT INTO `t_exchange_rate` VALUES ('687', '英镑', '人民币', '10.13', null, '1409696701');
INSERT INTO `t_exchange_rate` VALUES ('688', '英镑', '人民币', '10.13', null, '1409696762');
INSERT INTO `t_exchange_rate` VALUES ('689', '英镑', '人民币', '10.13', null, '1409696821');
INSERT INTO `t_exchange_rate` VALUES ('690', '英镑', '人民币', '10.13', null, '1409696882');
INSERT INTO `t_exchange_rate` VALUES ('691', '英镑', '人民币', '10.13', null, '1409696941');
INSERT INTO `t_exchange_rate` VALUES ('692', '英镑', '人民币', '10.13', null, '1409697002');
INSERT INTO `t_exchange_rate` VALUES ('693', '英镑', '人民币', '10.13', null, '1409697062');
INSERT INTO `t_exchange_rate` VALUES ('694', '英镑', '人民币', '10.13', null, '1409697121');
INSERT INTO `t_exchange_rate` VALUES ('695', '英镑', '人民币', '10.13', null, '1409697182');
INSERT INTO `t_exchange_rate` VALUES ('696', '英镑', '人民币', '10.13', null, '1409697242');
INSERT INTO `t_exchange_rate` VALUES ('697', '英镑', '人民币', '10.13', null, '1409697301');
INSERT INTO `t_exchange_rate` VALUES ('698', '英镑', '人民币', '10.13', null, '1409697362');
INSERT INTO `t_exchange_rate` VALUES ('699', '英镑', '人民币', '10.13', null, '1409697421');
INSERT INTO `t_exchange_rate` VALUES ('700', '英镑', '人民币', '10.13', null, '1409697482');
INSERT INTO `t_exchange_rate` VALUES ('701', '英镑', '人民币', '10.13', null, '1409697541');
INSERT INTO `t_exchange_rate` VALUES ('702', '英镑', '人民币', '10.13', null, '1409697602');
INSERT INTO `t_exchange_rate` VALUES ('703', '英镑', '人民币', '10.13', null, '1409697661');
INSERT INTO `t_exchange_rate` VALUES ('704', '英镑', '人民币', '10.13', null, '1409697722');
INSERT INTO `t_exchange_rate` VALUES ('705', '英镑', '人民币', '10.13', null, '1409697781');
INSERT INTO `t_exchange_rate` VALUES ('706', '英镑', '人民币', '10.13', null, '1409697842');
INSERT INTO `t_exchange_rate` VALUES ('707', '英镑', '人民币', '10.13', null, '1409697901');
INSERT INTO `t_exchange_rate` VALUES ('708', '英镑', '人民币', '10.13', null, '1409697962');
INSERT INTO `t_exchange_rate` VALUES ('709', '英镑', '人民币', '10.13', null, '1409698021');
INSERT INTO `t_exchange_rate` VALUES ('710', '英镑', '人民币', '10.13', null, '1409698082');
INSERT INTO `t_exchange_rate` VALUES ('711', '英镑', '人民币', '10.13', null, '1409698141');
INSERT INTO `t_exchange_rate` VALUES ('712', '英镑', '人民币', '10.13', null, '1409698202');
INSERT INTO `t_exchange_rate` VALUES ('713', '英镑', '人民币', '10.13', null, '1409698262');
INSERT INTO `t_exchange_rate` VALUES ('714', '英镑', '人民币', '10.13', null, '1409698321');
INSERT INTO `t_exchange_rate` VALUES ('715', '英镑', '人民币', '10.13', null, '1409698382');
INSERT INTO `t_exchange_rate` VALUES ('716', '英镑', '人民币', '10.13', null, '1409698441');
INSERT INTO `t_exchange_rate` VALUES ('717', '英镑', '人民币', '10.13', null, '1409698502');
INSERT INTO `t_exchange_rate` VALUES ('718', '英镑', '人民币', '10.13', null, '1409698561');
INSERT INTO `t_exchange_rate` VALUES ('719', '英镑', '人民币', '10.13', null, '1409698622');
INSERT INTO `t_exchange_rate` VALUES ('720', '英镑', '人民币', '10.13', null, '1409698681');
INSERT INTO `t_exchange_rate` VALUES ('721', '英镑', '人民币', '10.13', null, '1409698742');
INSERT INTO `t_exchange_rate` VALUES ('722', '英镑', '人民币', '10.12', null, '1409738402');
INSERT INTO `t_exchange_rate` VALUES ('723', '英镑', '人民币', '10.12', null, '1409738462');
INSERT INTO `t_exchange_rate` VALUES ('724', '英镑', '人民币', '10.12', null, '1409738522');
INSERT INTO `t_exchange_rate` VALUES ('725', '英镑', '人民币', '10.12', null, '1409738581');
INSERT INTO `t_exchange_rate` VALUES ('726', '英镑', '人民币', '10.12', null, '1409738642');
INSERT INTO `t_exchange_rate` VALUES ('727', '英镑', '人民币', '10.12', null, '1409738701');
INSERT INTO `t_exchange_rate` VALUES ('728', '英镑', '人民币', '10.12', null, '1409738762');
INSERT INTO `t_exchange_rate` VALUES ('729', '英镑', '人民币', '10.12', null, '1409738821');
INSERT INTO `t_exchange_rate` VALUES ('730', '英镑', '人民币', '10.12', null, '1409738882');
INSERT INTO `t_exchange_rate` VALUES ('731', '英镑', '人民币', '10.12', null, '1409738942');
INSERT INTO `t_exchange_rate` VALUES ('732', '英镑', '人民币', '10.12', null, '1409739002');
INSERT INTO `t_exchange_rate` VALUES ('733', '英镑', '人民币', '10.12', null, '1409739062');
INSERT INTO `t_exchange_rate` VALUES ('734', '英镑', '人民币', '10.12', null, '1409739121');
INSERT INTO `t_exchange_rate` VALUES ('735', '英镑', '人民币', '10.12', null, '1409739182');
INSERT INTO `t_exchange_rate` VALUES ('736', '英镑', '人民币', '10.12', null, '1409739242');
INSERT INTO `t_exchange_rate` VALUES ('737', '英镑', '人民币', '10.12', null, '1409739301');
INSERT INTO `t_exchange_rate` VALUES ('738', '英镑', '人民币', '10.12', null, '1409739361');
INSERT INTO `t_exchange_rate` VALUES ('739', '英镑', '人民币', '10.12', null, '1409739422');
INSERT INTO `t_exchange_rate` VALUES ('740', '英镑', '人民币', '10.12', null, '1409739481');
INSERT INTO `t_exchange_rate` VALUES ('741', '英镑', '人民币', '10.12', null, '1409739542');
INSERT INTO `t_exchange_rate` VALUES ('742', '英镑', '人民币', '10.12', null, '1409739602');
INSERT INTO `t_exchange_rate` VALUES ('743', '英镑', '人民币', '10.12', null, '1409739661');
INSERT INTO `t_exchange_rate` VALUES ('744', '英镑', '人民币', '10.12', null, '1409739722');
INSERT INTO `t_exchange_rate` VALUES ('745', '英镑', '人民币', '10.12', null, '1409739781');
INSERT INTO `t_exchange_rate` VALUES ('746', '英镑', '人民币', '10.12', null, '1409739842');
INSERT INTO `t_exchange_rate` VALUES ('747', '英镑', '人民币', '10.12', null, '1409739901');
INSERT INTO `t_exchange_rate` VALUES ('748', '英镑', '人民币', '10.12', null, '1409739973');
INSERT INTO `t_exchange_rate` VALUES ('749', '英镑', '人民币', '10.12', null, '1409740021');
INSERT INTO `t_exchange_rate` VALUES ('750', '英镑', '人民币', '10.12', null, '1409740082');
INSERT INTO `t_exchange_rate` VALUES ('751', '英镑', '人民币', '10.12', null, '1409740141');
INSERT INTO `t_exchange_rate` VALUES ('752', '英镑', '人民币', '10.12', null, '1409740202');
INSERT INTO `t_exchange_rate` VALUES ('753', '英镑', '人民币', '10.12', null, '1409740262');
INSERT INTO `t_exchange_rate` VALUES ('754', '英镑', '人民币', '10.12', null, '1409740321');
INSERT INTO `t_exchange_rate` VALUES ('755', '英镑', '人民币', '10.13', null, '1409740382');
INSERT INTO `t_exchange_rate` VALUES ('756', '英镑', '人民币', '10.12', null, '1409740441');
INSERT INTO `t_exchange_rate` VALUES ('757', '英镑', '人民币', '10.12', null, '1409740502');
INSERT INTO `t_exchange_rate` VALUES ('758', '英镑', '人民币', '10.12', null, '1409740562');
INSERT INTO `t_exchange_rate` VALUES ('759', '英镑', '人民币', '10.12', null, '1409740622');
INSERT INTO `t_exchange_rate` VALUES ('760', '英镑', '人民币', '10.12', null, '1409740681');
INSERT INTO `t_exchange_rate` VALUES ('761', '英镑', '人民币', '10.12', null, '1409740742');
INSERT INTO `t_exchange_rate` VALUES ('762', '英镑', '人民币', '10.12', null, '1409740801');
INSERT INTO `t_exchange_rate` VALUES ('763', '英镑', '人民币', '10.12', null, '1409740862');
INSERT INTO `t_exchange_rate` VALUES ('764', '英镑', '人民币', '10.12', null, '1409740921');
INSERT INTO `t_exchange_rate` VALUES ('765', '英镑', '人民币', '10.12', null, '1409740982');
INSERT INTO `t_exchange_rate` VALUES ('766', '英镑', '人民币', '10.12', null, '1409741041');
INSERT INTO `t_exchange_rate` VALUES ('767', '英镑', '人民币', '10.12', null, '1409741102');
INSERT INTO `t_exchange_rate` VALUES ('768', '英镑', '人民币', '10.12', null, '1409741161');
INSERT INTO `t_exchange_rate` VALUES ('769', '英镑', '人民币', '10.12', null, '1409741222');
INSERT INTO `t_exchange_rate` VALUES ('770', '英镑', '人民币', '10.12', null, '1409741281');
INSERT INTO `t_exchange_rate` VALUES ('771', '英镑', '人民币', '10.12', null, '1409741342');
INSERT INTO `t_exchange_rate` VALUES ('772', '英镑', '人民币', '10.12', null, '1409741402');
INSERT INTO `t_exchange_rate` VALUES ('773', '英镑', '人民币', '10.12', null, '1409741463');
INSERT INTO `t_exchange_rate` VALUES ('774', '英镑', '人民币', '10.12', null, '1409741522');
INSERT INTO `t_exchange_rate` VALUES ('775', '英镑', '人民币', '10.12', null, '1409741581');
INSERT INTO `t_exchange_rate` VALUES ('776', '英镑', '人民币', '10.12', null, '1409741642');
INSERT INTO `t_exchange_rate` VALUES ('777', '英镑', '人民币', '10.12', null, '1409741701');
INSERT INTO `t_exchange_rate` VALUES ('778', '英镑', '人民币', '10.12', null, '1409741761');
INSERT INTO `t_exchange_rate` VALUES ('779', '英镑', '人民币', '10.12', null, '1409741822');
INSERT INTO `t_exchange_rate` VALUES ('780', '英镑', '人民币', '10.11', null, '1409741882');
INSERT INTO `t_exchange_rate` VALUES ('781', '英镑', '人民币', '10.11', null, '1409741941');
INSERT INTO `t_exchange_rate` VALUES ('782', '英镑', '人民币', '10.11', null, '1409781602');
INSERT INTO `t_exchange_rate` VALUES ('783', '英镑', '人民币', '10.11', null, '1409781661');
INSERT INTO `t_exchange_rate` VALUES ('784', '英镑', '人民币', '10.11', null, '1409781722');
INSERT INTO `t_exchange_rate` VALUES ('785', '英镑', '人民币', '10.11', null, '1409781781');
INSERT INTO `t_exchange_rate` VALUES ('786', '英镑', '人民币', '10.11', null, '1409781842');
INSERT INTO `t_exchange_rate` VALUES ('787', '英镑', '人民币', '10.11', null, '1409781901');
INSERT INTO `t_exchange_rate` VALUES ('788', '英镑', '人民币', '10.11', null, '1409781963');
INSERT INTO `t_exchange_rate` VALUES ('789', '英镑', '人民币', '10.11', null, '1409782021');
INSERT INTO `t_exchange_rate` VALUES ('790', '英镑', '人民币', '10.11', null, '1409782082');
INSERT INTO `t_exchange_rate` VALUES ('791', '英镑', '人民币', '10.11', null, '1409782141');
INSERT INTO `t_exchange_rate` VALUES ('792', '英镑', '人民币', '10.11', null, '1409782202');
INSERT INTO `t_exchange_rate` VALUES ('793', '英镑', '人民币', '10.11', null, '1409782262');
INSERT INTO `t_exchange_rate` VALUES ('794', '英镑', '人民币', '10.11', null, '1409782321');
INSERT INTO `t_exchange_rate` VALUES ('795', '英镑', '人民币', '10.11', null, '1409782382');
INSERT INTO `t_exchange_rate` VALUES ('796', '英镑', '人民币', '10.11', null, '1409782441');
INSERT INTO `t_exchange_rate` VALUES ('797', '英镑', '人民币', '10.11', null, '1409782502');
INSERT INTO `t_exchange_rate` VALUES ('798', '英镑', '人民币', '10.11', null, '1409782561');
INSERT INTO `t_exchange_rate` VALUES ('799', '英镑', '人民币', '10.11', null, '1409782622');
INSERT INTO `t_exchange_rate` VALUES ('800', '英镑', '人民币', '10.11', null, '1409782681');
INSERT INTO `t_exchange_rate` VALUES ('801', '英镑', '人民币', '10.11', null, '1409782742');
INSERT INTO `t_exchange_rate` VALUES ('802', '英镑', '人民币', '10.11', null, '1409782802');
INSERT INTO `t_exchange_rate` VALUES ('803', '英镑', '人民币', '10.11', null, '1409782862');
INSERT INTO `t_exchange_rate` VALUES ('804', '英镑', '人民币', '10.11', null, '1409782921');
INSERT INTO `t_exchange_rate` VALUES ('805', '英镑', '人民币', '10.11', null, '1409782982');
INSERT INTO `t_exchange_rate` VALUES ('806', '英镑', '人民币', '10.11', null, '1409783041');
INSERT INTO `t_exchange_rate` VALUES ('807', '英镑', '人民币', '10.11', null, '1409783102');
INSERT INTO `t_exchange_rate` VALUES ('808', '英镑', '人民币', '10.11', null, '1409783163');
INSERT INTO `t_exchange_rate` VALUES ('809', '英镑', '人民币', '10.11', null, '1409783221');
INSERT INTO `t_exchange_rate` VALUES ('810', '英镑', '人民币', '10.11', null, '1409783282');
INSERT INTO `t_exchange_rate` VALUES ('811', '英镑', '人民币', '10.11', null, '1409783341');
INSERT INTO `t_exchange_rate` VALUES ('812', '英镑', '人民币', '10.11', null, '1409783402');
INSERT INTO `t_exchange_rate` VALUES ('813', '英镑', '人民币', '10.11', null, '1409783462');
INSERT INTO `t_exchange_rate` VALUES ('814', '英镑', '人民币', '10.11', null, '1409783521');
INSERT INTO `t_exchange_rate` VALUES ('815', '英镑', '人民币', '10.11', null, '1409783582');
INSERT INTO `t_exchange_rate` VALUES ('816', '英镑', '人民币', '10.11', null, '1409783641');
INSERT INTO `t_exchange_rate` VALUES ('817', '英镑', '人民币', '10.11', null, '1409783702');
INSERT INTO `t_exchange_rate` VALUES ('818', '英镑', '人民币', '10.11', null, '1409783761');
INSERT INTO `t_exchange_rate` VALUES ('819', '英镑', '人民币', '10.11', null, '1409783822');
INSERT INTO `t_exchange_rate` VALUES ('820', '英镑', '人民币', '10.11', null, '1409783881');
INSERT INTO `t_exchange_rate` VALUES ('821', '英镑', '人民币', '10.11', null, '1409783942');
INSERT INTO `t_exchange_rate` VALUES ('822', '英镑', '人民币', '10.11', null, '1409784001');
INSERT INTO `t_exchange_rate` VALUES ('823', '英镑', '人民币', '10.11', null, '1409784061');
INSERT INTO `t_exchange_rate` VALUES ('824', '英镑', '人民币', '10.11', null, '1409784122');
INSERT INTO `t_exchange_rate` VALUES ('825', '英镑', '人民币', '10.11', null, '1409784181');
INSERT INTO `t_exchange_rate` VALUES ('826', '英镑', '人民币', '10.11', null, '1409784242');
INSERT INTO `t_exchange_rate` VALUES ('827', '英镑', '人民币', '10.11', null, '1409784301');
INSERT INTO `t_exchange_rate` VALUES ('828', '英镑', '人民币', '10.12', null, '1409784362');
INSERT INTO `t_exchange_rate` VALUES ('829', '英镑', '人民币', '10.11', null, '1409784421');
INSERT INTO `t_exchange_rate` VALUES ('830', '英镑', '人民币', '10.11', null, '1409784482');
INSERT INTO `t_exchange_rate` VALUES ('831', '英镑', '人民币', '10.11', null, '1409784542');
INSERT INTO `t_exchange_rate` VALUES ('832', '英镑', '人民币', '10.11', null, '1409784601');
INSERT INTO `t_exchange_rate` VALUES ('833', '英镑', '人民币', '10.11', null, '1409784662');
INSERT INTO `t_exchange_rate` VALUES ('834', '英镑', '人民币', '10.11', null, '1409784721');
INSERT INTO `t_exchange_rate` VALUES ('835', '英镑', '人民币', '10.11', null, '1409784782');
INSERT INTO `t_exchange_rate` VALUES ('836', '英镑', '人民币', '10.11', null, '1409784841');
INSERT INTO `t_exchange_rate` VALUES ('837', '英镑', '人民币', '10.11', null, '1409784902');
INSERT INTO `t_exchange_rate` VALUES ('838', '英镑', '人民币', '10.11', null, '1409784961');
INSERT INTO `t_exchange_rate` VALUES ('839', '英镑', '人民币', '10.11', null, '1409785022');
INSERT INTO `t_exchange_rate` VALUES ('840', '英镑', '人民币', '10.11', null, '1409785081');
INSERT INTO `t_exchange_rate` VALUES ('841', '英镑', '人民币', '10.11', null, '1409785142');
INSERT INTO `t_exchange_rate` VALUES ('842', '英镑', '人民币', '10.11', null, '1409824802');
INSERT INTO `t_exchange_rate` VALUES ('843', '英镑', '人民币', '10.11', null, '1409824862');
INSERT INTO `t_exchange_rate` VALUES ('844', '英镑', '人民币', '10.10', null, '1409824921');
INSERT INTO `t_exchange_rate` VALUES ('845', '英镑', '人民币', '10.10', null, '1409824982');
INSERT INTO `t_exchange_rate` VALUES ('846', '英镑', '人民币', '10.11', null, '1409825041');
INSERT INTO `t_exchange_rate` VALUES ('847', '英镑', '人民币', '10.11', null, '1409825109');
INSERT INTO `t_exchange_rate` VALUES ('848', '英镑', '人民币', '10.11', null, '1409825162');
INSERT INTO `t_exchange_rate` VALUES ('849', '英镑', '人民币', '10.10', null, '1409825221');
INSERT INTO `t_exchange_rate` VALUES ('850', '英镑', '人民币', '10.10', null, '1409825282');
INSERT INTO `t_exchange_rate` VALUES ('851', '英镑', '人民币', '10.10', null, '1409825348');
INSERT INTO `t_exchange_rate` VALUES ('852', '英镑', '人民币', '10.10', null, '1409825402');
INSERT INTO `t_exchange_rate` VALUES ('853', '英镑', '人民币', '10.10', null, '1409825468');
INSERT INTO `t_exchange_rate` VALUES ('854', '英镑', '人民币', '10.10', null, '1409825522');
INSERT INTO `t_exchange_rate` VALUES ('855', '英镑', '人民币', '10.10', null, '1409825581');
INSERT INTO `t_exchange_rate` VALUES ('856', '英镑', '人民币', '10.10', null, '1409825642');
INSERT INTO `t_exchange_rate` VALUES ('857', '英镑', '人民币', '10.10', null, '1409825701');
INSERT INTO `t_exchange_rate` VALUES ('858', '英镑', '人民币', '10.10', null, '1409825768');
INSERT INTO `t_exchange_rate` VALUES ('859', '英镑', '人民币', '10.10', null, '1409825829');
INSERT INTO `t_exchange_rate` VALUES ('860', '英镑', '人民币', '10.10', null, '1409825888');
INSERT INTO `t_exchange_rate` VALUES ('861', '英镑', '人民币', '10.10', null, '1409825942');
INSERT INTO `t_exchange_rate` VALUES ('862', '英镑', '人民币', '10.10', null, '1409826001');
INSERT INTO `t_exchange_rate` VALUES ('863', '英镑', '人民币', '10.11', null, '1409826061');
INSERT INTO `t_exchange_rate` VALUES ('864', '英镑', '人民币', '10.10', null, '1409826122');
INSERT INTO `t_exchange_rate` VALUES ('865', '英镑', '人民币', '10.10', null, '1409826183');
INSERT INTO `t_exchange_rate` VALUES ('866', '英镑', '人民币', '10.10', null, '1409826242');
INSERT INTO `t_exchange_rate` VALUES ('867', '英镑', '人民币', '10.10', null, '1409826301');
INSERT INTO `t_exchange_rate` VALUES ('868', '英镑', '人民币', '10.10', null, '1409826368');
INSERT INTO `t_exchange_rate` VALUES ('869', '英镑', '人民币', '10.10', null, '1409826422');
INSERT INTO `t_exchange_rate` VALUES ('870', '英镑', '人民币', '10.10', null, '1409826481');
INSERT INTO `t_exchange_rate` VALUES ('871', '英镑', '人民币', '10.10', null, '1409826542');
INSERT INTO `t_exchange_rate` VALUES ('872', '英镑', '人民币', '10.10', null, '1409826604');
INSERT INTO `t_exchange_rate` VALUES ('873', '英镑', '人民币', '10.10', null, '1409826662');
INSERT INTO `t_exchange_rate` VALUES ('874', '英镑', '人民币', '10.10', null, '1409826721');
INSERT INTO `t_exchange_rate` VALUES ('875', '英镑', '人民币', '10.10', null, '1409826782');
INSERT INTO `t_exchange_rate` VALUES ('876', '英镑', '人民币', '10.10', null, '1409826841');
INSERT INTO `t_exchange_rate` VALUES ('877', '英镑', '人民币', '10.10', null, '1409826902');
INSERT INTO `t_exchange_rate` VALUES ('878', '英镑', '人民币', '10.10', null, '1409826962');
INSERT INTO `t_exchange_rate` VALUES ('879', '英镑', '人民币', '10.10', null, '1409827022');
INSERT INTO `t_exchange_rate` VALUES ('880', '英镑', '人民币', '10.10', null, '1409827088');
INSERT INTO `t_exchange_rate` VALUES ('881', '英镑', '人民币', '10.10', null, '1409827142');
INSERT INTO `t_exchange_rate` VALUES ('882', '英镑', '人民币', '10.10', null, '1409827201');
INSERT INTO `t_exchange_rate` VALUES ('883', '英镑', '人民币', '10.10', null, '1409827262');
INSERT INTO `t_exchange_rate` VALUES ('884', '英镑', '人民币', '10.10', null, '1409827321');
INSERT INTO `t_exchange_rate` VALUES ('885', '英镑', '人民币', '10.10', null, '1409827389');
INSERT INTO `t_exchange_rate` VALUES ('886', '英镑', '人民币', '10.10', null, '1409827441');
INSERT INTO `t_exchange_rate` VALUES ('887', '英镑', '人民币', '10.10', null, '1409827502');
INSERT INTO `t_exchange_rate` VALUES ('888', '英镑', '人民币', '10.10', null, '1409827561');
INSERT INTO `t_exchange_rate` VALUES ('889', '英镑', '人民币', '10.10', null, '1409827622');
INSERT INTO `t_exchange_rate` VALUES ('890', '英镑', '人民币', '10.10', null, '1409827681');
INSERT INTO `t_exchange_rate` VALUES ('891', '英镑', '人民币', '10.10', null, '1409827749');
INSERT INTO `t_exchange_rate` VALUES ('892', '英镑', '人民币', '10.10', null, '1409827802');
INSERT INTO `t_exchange_rate` VALUES ('893', '英镑', '人民币', '10.10', null, '1409827861');
INSERT INTO `t_exchange_rate` VALUES ('894', '英镑', '人民币', '10.10', null, '1409827931');
INSERT INTO `t_exchange_rate` VALUES ('895', '英镑', '人民币', '10.10', null, '1409827983');
INSERT INTO `t_exchange_rate` VALUES ('896', '英镑', '人民币', '10.10', null, '1409828048');
INSERT INTO `t_exchange_rate` VALUES ('897', '英镑', '人民币', '10.10', null, '1409828104');
INSERT INTO `t_exchange_rate` VALUES ('898', '英镑', '人民币', '10.10', null, '1409828162');
INSERT INTO `t_exchange_rate` VALUES ('899', '英镑', '人民币', '10.09', null, '1409828228');
INSERT INTO `t_exchange_rate` VALUES ('900', '英镑', '人民币', '10.10', null, '1409828282');
INSERT INTO `t_exchange_rate` VALUES ('901', '英镑', '人民币', '10.10', null, '1409828341');
INSERT INTO `t_exchange_rate` VALUES ('902', '英镑', '人民币', '10.02', null, '1409868002');
INSERT INTO `t_exchange_rate` VALUES ('903', '英镑', '人民币', '10.02', null, '1409868062');
INSERT INTO `t_exchange_rate` VALUES ('904', '英镑', '人民币', '10.02', null, '1409868121');
INSERT INTO `t_exchange_rate` VALUES ('905', '英镑', '人民币', '10.02', null, '1409868182');
INSERT INTO `t_exchange_rate` VALUES ('906', '英镑', '人民币', '10.02', null, '1409868241');
INSERT INTO `t_exchange_rate` VALUES ('907', '英镑', '人民币', '10.02', null, '1409868302');
INSERT INTO `t_exchange_rate` VALUES ('908', '英镑', '人民币', '10.02', null, '1409868361');
INSERT INTO `t_exchange_rate` VALUES ('909', '英镑', '人民币', '10.02', null, '1409868422');
INSERT INTO `t_exchange_rate` VALUES ('910', '英镑', '人民币', '10.02', null, '1409868481');
INSERT INTO `t_exchange_rate` VALUES ('911', '英镑', '人民币', '10.02', null, '1409868542');
INSERT INTO `t_exchange_rate` VALUES ('912', '英镑', '人民币', '10.02', null, '1409868601');
INSERT INTO `t_exchange_rate` VALUES ('913', '英镑', '人民币', '10.02', null, '1409868662');
INSERT INTO `t_exchange_rate` VALUES ('914', '英镑', '人民币', '10.02', null, '1409868721');
INSERT INTO `t_exchange_rate` VALUES ('915', '英镑', '人民币', '10.02', null, '1409868781');
INSERT INTO `t_exchange_rate` VALUES ('916', '英镑', '人民币', '10.02', null, '1409868842');
INSERT INTO `t_exchange_rate` VALUES ('917', '英镑', '人民币', '10.02', null, '1409868901');
INSERT INTO `t_exchange_rate` VALUES ('918', '英镑', '人民币', '10.02', null, '1409868962');
INSERT INTO `t_exchange_rate` VALUES ('919', '英镑', '人民币', '10.02', null, '1409869021');
INSERT INTO `t_exchange_rate` VALUES ('920', '英镑', '人民币', '10.02', null, '1409869082');
INSERT INTO `t_exchange_rate` VALUES ('921', '英镑', '人民币', '10.02', null, '1409869141');
INSERT INTO `t_exchange_rate` VALUES ('922', '英镑', '人民币', '10.02', null, '1409869202');
INSERT INTO `t_exchange_rate` VALUES ('923', '英镑', '人民币', '10.02', null, '1409869261');
INSERT INTO `t_exchange_rate` VALUES ('924', '英镑', '人民币', '10.02', null, '1409869322');
INSERT INTO `t_exchange_rate` VALUES ('925', '英镑', '人民币', '10.02', null, '1409869381');
INSERT INTO `t_exchange_rate` VALUES ('926', '英镑', '人民币', '10.02', null, '1409869442');
INSERT INTO `t_exchange_rate` VALUES ('927', '英镑', '人民币', '10.02', null, '1409869501');
INSERT INTO `t_exchange_rate` VALUES ('928', '英镑', '人民币', '10.02', null, '1409869562');
INSERT INTO `t_exchange_rate` VALUES ('929', '英镑', '人民币', '10.02', null, '1409869622');
INSERT INTO `t_exchange_rate` VALUES ('930', '英镑', '人民币', '10.02', null, '1409869682');
INSERT INTO `t_exchange_rate` VALUES ('931', '英镑', '人民币', '10.02', null, '1409869741');
INSERT INTO `t_exchange_rate` VALUES ('932', '英镑', '人民币', '10.02', null, '1409869802');
INSERT INTO `t_exchange_rate` VALUES ('933', '英镑', '人民币', '10.02', null, '1409869861');
INSERT INTO `t_exchange_rate` VALUES ('934', '英镑', '人民币', '10.02', null, '1409869922');
INSERT INTO `t_exchange_rate` VALUES ('935', '英镑', '人民币', '10.02', null, '1409869981');
INSERT INTO `t_exchange_rate` VALUES ('936', '英镑', '人民币', '10.02', null, '1409870042');
INSERT INTO `t_exchange_rate` VALUES ('937', '英镑', '人民币', '10.02', null, '1409870101');
INSERT INTO `t_exchange_rate` VALUES ('938', '英镑', '人民币', '10.02', null, '1409870162');
INSERT INTO `t_exchange_rate` VALUES ('939', '英镑', '人民币', '10.02', null, '1409870221');
INSERT INTO `t_exchange_rate` VALUES ('940', '英镑', '人民币', '10.02', null, '1409870282');
INSERT INTO `t_exchange_rate` VALUES ('941', '英镑', '人民币', '10.02', null, '1409870341');
INSERT INTO `t_exchange_rate` VALUES ('942', '英镑', '人民币', '10.02', null, '1409870402');
INSERT INTO `t_exchange_rate` VALUES ('943', '英镑', '人民币', '10.02', null, '1409870461');
INSERT INTO `t_exchange_rate` VALUES ('944', '英镑', '人民币', '10.02', null, '1409870522');
INSERT INTO `t_exchange_rate` VALUES ('945', '英镑', '人民币', '10.02', null, '1409870581');
INSERT INTO `t_exchange_rate` VALUES ('946', '英镑', '人民币', '10.02', null, '1409870642');
INSERT INTO `t_exchange_rate` VALUES ('947', '英镑', '人民币', '10.02', null, '1409870701');
INSERT INTO `t_exchange_rate` VALUES ('948', '英镑', '人民币', '10.02', null, '1409870762');
INSERT INTO `t_exchange_rate` VALUES ('949', '英镑', '人民币', '10.02', null, '1409870821');
INSERT INTO `t_exchange_rate` VALUES ('950', '英镑', '人民币', '10.02', null, '1409870882');
INSERT INTO `t_exchange_rate` VALUES ('951', '英镑', '人民币', '10.02', null, '1409870941');
INSERT INTO `t_exchange_rate` VALUES ('952', '英镑', '人民币', '10.02', null, '1409871002');
INSERT INTO `t_exchange_rate` VALUES ('953', '英镑', '人民币', '10.02', null, '1409871062');
INSERT INTO `t_exchange_rate` VALUES ('954', '英镑', '人民币', '10.02', null, '1409871121');
INSERT INTO `t_exchange_rate` VALUES ('955', '英镑', '人民币', '10.02', null, '1409871182');
INSERT INTO `t_exchange_rate` VALUES ('956', '英镑', '人民币', '10.02', null, '1409871241');
INSERT INTO `t_exchange_rate` VALUES ('957', '英镑', '人民币', '10.02', null, '1409871302');
INSERT INTO `t_exchange_rate` VALUES ('958', '英镑', '人民币', '10.02', null, '1409871361');
INSERT INTO `t_exchange_rate` VALUES ('959', '英镑', '人民币', '10.02', null, '1409871422');
INSERT INTO `t_exchange_rate` VALUES ('960', '英镑', '人民币', '10.02', null, '1409871481');
INSERT INTO `t_exchange_rate` VALUES ('961', '英镑', '人民币', '10.02', null, '1409871542');
INSERT INTO `t_exchange_rate` VALUES ('962', '英镑', '人民币', '10.02', null, '1409911201');
INSERT INTO `t_exchange_rate` VALUES ('963', '英镑', '人民币', '10.02', null, '1409911262');
INSERT INTO `t_exchange_rate` VALUES ('964', '英镑', '人民币', '10.02', null, '1409911321');
INSERT INTO `t_exchange_rate` VALUES ('965', '英镑', '人民币', '10.02', null, '1409911382');
INSERT INTO `t_exchange_rate` VALUES ('966', '英镑', '人民币', '10.02', null, '1409911442');
INSERT INTO `t_exchange_rate` VALUES ('967', '英镑', '人民币', '10.02', null, '1409911501');
INSERT INTO `t_exchange_rate` VALUES ('968', '英镑', '人民币', '10.02', null, '1409911561');
INSERT INTO `t_exchange_rate` VALUES ('969', '英镑', '人民币', '10.02', null, '1409911622');
INSERT INTO `t_exchange_rate` VALUES ('970', '英镑', '人民币', '10.02', null, '1409911681');
INSERT INTO `t_exchange_rate` VALUES ('971', '英镑', '人民币', '10.02', null, '1409911742');
INSERT INTO `t_exchange_rate` VALUES ('972', '英镑', '人民币', '10.02', null, '1409911801');
INSERT INTO `t_exchange_rate` VALUES ('973', '英镑', '人民币', '10.02', null, '1409911861');
INSERT INTO `t_exchange_rate` VALUES ('974', '英镑', '人民币', '10.02', null, '1409911922');
INSERT INTO `t_exchange_rate` VALUES ('975', '英镑', '人民币', '10.02', null, '1409911981');
INSERT INTO `t_exchange_rate` VALUES ('976', '英镑', '人民币', '10.02', null, '1409912042');
INSERT INTO `t_exchange_rate` VALUES ('977', '英镑', '人民币', '10.02', null, '1409912108');
INSERT INTO `t_exchange_rate` VALUES ('978', '英镑', '人民币', '10.03', null, '1409912168');
INSERT INTO `t_exchange_rate` VALUES ('979', '英镑', '人民币', '10.02', null, '1409912222');
INSERT INTO `t_exchange_rate` VALUES ('980', '英镑', '人民币', '10.02', null, '1409912282');
INSERT INTO `t_exchange_rate` VALUES ('981', '英镑', '人民币', '10.02', null, '1409912341');
INSERT INTO `t_exchange_rate` VALUES ('982', '英镑', '人民币', '10.02', null, '1409912402');
INSERT INTO `t_exchange_rate` VALUES ('983', '英镑', '人民币', '10.02', null, '1409912462');
INSERT INTO `t_exchange_rate` VALUES ('984', '英镑', '人民币', '10.02', null, '1409912522');
INSERT INTO `t_exchange_rate` VALUES ('985', '英镑', '人民币', '10.02', null, '1409912581');
INSERT INTO `t_exchange_rate` VALUES ('986', '英镑', '人民币', '10.02', null, '1409912642');
INSERT INTO `t_exchange_rate` VALUES ('987', '英镑', '人民币', '10.02', null, '1409912701');
INSERT INTO `t_exchange_rate` VALUES ('988', '英镑', '人民币', '10.02', null, '1409912768');
INSERT INTO `t_exchange_rate` VALUES ('989', '英镑', '人民币', '10.02', null, '1409912822');
INSERT INTO `t_exchange_rate` VALUES ('990', '英镑', '人民币', '10.02', null, '1409912889');
INSERT INTO `t_exchange_rate` VALUES ('991', '英镑', '人民币', '10.02', null, '1409912941');
INSERT INTO `t_exchange_rate` VALUES ('992', '英镑', '人民币', '10.02', null, '1409913002');
INSERT INTO `t_exchange_rate` VALUES ('993', '英镑', '人民币', '10.02', null, '1409913061');
INSERT INTO `t_exchange_rate` VALUES ('994', '英镑', '人民币', '10.02', null, '1409913122');
INSERT INTO `t_exchange_rate` VALUES ('995', '英镑', '人民币', '10.02', null, '1409913181');
INSERT INTO `t_exchange_rate` VALUES ('996', '英镑', '人民币', '10.02', null, '1409913242');
INSERT INTO `t_exchange_rate` VALUES ('997', '英镑', '人民币', '10.02', null, '1409913302');
INSERT INTO `t_exchange_rate` VALUES ('998', '英镑', '人民币', '10.02', null, '1409913361');
INSERT INTO `t_exchange_rate` VALUES ('999', '英镑', '人民币', '10.02', null, '1409913422');
INSERT INTO `t_exchange_rate` VALUES ('1000', '英镑', '人民币', '10.02', null, '1409913482');
INSERT INTO `t_exchange_rate` VALUES ('1001', '英镑', '人民币', '10.02', null, '1409913541');
INSERT INTO `t_exchange_rate` VALUES ('1002', '英镑', '人民币', '10.02', null, '1409913602');
INSERT INTO `t_exchange_rate` VALUES ('1003', '英镑', '人民币', '10.02', null, '1409913662');
INSERT INTO `t_exchange_rate` VALUES ('1004', '英镑', '人民币', '10.02', null, '1409913721');
INSERT INTO `t_exchange_rate` VALUES ('1005', '英镑', '人民币', '10.02', null, '1409913782');
INSERT INTO `t_exchange_rate` VALUES ('1006', '英镑', '人民币', '10.02', null, '1409913841');
INSERT INTO `t_exchange_rate` VALUES ('1007', '英镑', '人民币', '10.02', null, '1409913902');
INSERT INTO `t_exchange_rate` VALUES ('1008', '英镑', '人民币', '10.02', null, '1409913961');
INSERT INTO `t_exchange_rate` VALUES ('1009', '英镑', '人民币', '10.02', null, '1409914022');
INSERT INTO `t_exchange_rate` VALUES ('1010', '英镑', '人民币', '10.02', null, '1409914082');
INSERT INTO `t_exchange_rate` VALUES ('1011', '英镑', '人民币', '10.02', null, '1409914141');
INSERT INTO `t_exchange_rate` VALUES ('1012', '英镑', '人民币', '10.02', null, '1409914202');
INSERT INTO `t_exchange_rate` VALUES ('1013', '英镑', '人民币', '10.02', null, '1409914269');
INSERT INTO `t_exchange_rate` VALUES ('1014', '英镑', '人民币', '10.02', null, '1409914321');
INSERT INTO `t_exchange_rate` VALUES ('1015', '英镑', '人民币', '10.02', null, '1409914382');
INSERT INTO `t_exchange_rate` VALUES ('1016', '英镑', '人民币', '10.02', null, '1409914441');
INSERT INTO `t_exchange_rate` VALUES ('1017', '英镑', '人民币', '10.02', null, '1409914502');
INSERT INTO `t_exchange_rate` VALUES ('1018', '英镑', '人民币', '10.02', null, '1409914562');
INSERT INTO `t_exchange_rate` VALUES ('1019', '英镑', '人民币', '10.02', null, '1409914621');
INSERT INTO `t_exchange_rate` VALUES ('1020', '英镑', '人民币', '10.02', null, '1409914682');
INSERT INTO `t_exchange_rate` VALUES ('1021', '英镑', '人民币', '10.02', null, '1409914741');
INSERT INTO `t_exchange_rate` VALUES ('1022', '英镑', '人民币', '10.03', null, '1409954403');
INSERT INTO `t_exchange_rate` VALUES ('1023', '英镑', '人民币', '10.03', null, '1409954462');
INSERT INTO `t_exchange_rate` VALUES ('1024', '英镑', '人民币', '10.03', null, '1409954521');
INSERT INTO `t_exchange_rate` VALUES ('1025', '英镑', '人民币', '10.03', null, '1409954581');
INSERT INTO `t_exchange_rate` VALUES ('1026', '英镑', '人民币', '10.03', null, '1409954642');
INSERT INTO `t_exchange_rate` VALUES ('1027', '英镑', '人民币', '10.03', null, '1409954701');
INSERT INTO `t_exchange_rate` VALUES ('1028', '英镑', '人民币', '10.03', null, '1409954762');
INSERT INTO `t_exchange_rate` VALUES ('1029', '英镑', '人民币', '10.03', null, '1409954821');
INSERT INTO `t_exchange_rate` VALUES ('1030', '英镑', '人民币', '10.03', null, '1409954882');
INSERT INTO `t_exchange_rate` VALUES ('1031', '英镑', '人民币', '10.03', null, '1409954941');
INSERT INTO `t_exchange_rate` VALUES ('1032', '英镑', '人民币', '10.03', null, '1409955002');
INSERT INTO `t_exchange_rate` VALUES ('1033', '英镑', '人民币', '10.03', null, '1409955061');
INSERT INTO `t_exchange_rate` VALUES ('1034', '英镑', '人民币', '10.03', null, '1409955121');
INSERT INTO `t_exchange_rate` VALUES ('1035', '英镑', '人民币', '10.03', null, '1409955182');
INSERT INTO `t_exchange_rate` VALUES ('1036', '英镑', '人民币', '10.03', null, '1409955241');
INSERT INTO `t_exchange_rate` VALUES ('1037', '英镑', '人民币', '10.03', null, '1409955302');
INSERT INTO `t_exchange_rate` VALUES ('1038', '英镑', '人民币', '10.03', null, '1409955361');
INSERT INTO `t_exchange_rate` VALUES ('1039', '英镑', '人民币', '10.03', null, '1409955422');
INSERT INTO `t_exchange_rate` VALUES ('1040', '英镑', '人民币', '10.03', null, '1409955481');
INSERT INTO `t_exchange_rate` VALUES ('1041', '英镑', '人民币', '10.03', null, '1409955542');
INSERT INTO `t_exchange_rate` VALUES ('1042', '英镑', '人民币', '10.03', null, '1409955601');
INSERT INTO `t_exchange_rate` VALUES ('1043', '英镑', '人民币', '10.03', null, '1409955662');
INSERT INTO `t_exchange_rate` VALUES ('1044', '英镑', '人民币', '10.03', null, '1409955721');
INSERT INTO `t_exchange_rate` VALUES ('1045', '英镑', '人民币', '10.03', null, '1409955782');
INSERT INTO `t_exchange_rate` VALUES ('1046', '英镑', '人民币', '10.03', null, '1409955841');
INSERT INTO `t_exchange_rate` VALUES ('1047', '英镑', '人民币', '10.03', null, '1409955902');
INSERT INTO `t_exchange_rate` VALUES ('1048', '英镑', '人民币', '10.03', null, '1409955961');
INSERT INTO `t_exchange_rate` VALUES ('1049', '英镑', '人民币', '10.03', null, '1409956022');
INSERT INTO `t_exchange_rate` VALUES ('1050', '英镑', '人民币', '10.03', null, '1409956081');
INSERT INTO `t_exchange_rate` VALUES ('1051', '英镑', '人民币', '10.03', null, '1409956142');
INSERT INTO `t_exchange_rate` VALUES ('1052', '英镑', '人民币', '10.03', null, '1409956201');
INSERT INTO `t_exchange_rate` VALUES ('1053', '英镑', '人民币', '10.03', null, '1409956261');
INSERT INTO `t_exchange_rate` VALUES ('1054', '英镑', '人民币', '10.03', null, '1409956322');
INSERT INTO `t_exchange_rate` VALUES ('1055', '英镑', '人民币', '10.03', null, '1409956381');
INSERT INTO `t_exchange_rate` VALUES ('1056', '英镑', '人民币', '10.03', null, '1409956442');
INSERT INTO `t_exchange_rate` VALUES ('1057', '英镑', '人民币', '10.03', null, '1409956501');
INSERT INTO `t_exchange_rate` VALUES ('1058', '英镑', '人民币', '10.03', null, '1409956562');
INSERT INTO `t_exchange_rate` VALUES ('1059', '英镑', '人民币', '10.03', null, '1409956621');
INSERT INTO `t_exchange_rate` VALUES ('1060', '英镑', '人民币', '10.03', null, '1409956681');
INSERT INTO `t_exchange_rate` VALUES ('1061', '英镑', '人民币', '10.03', null, '1409956742');
INSERT INTO `t_exchange_rate` VALUES ('1062', '英镑', '人民币', '10.03', null, '1409956801');
INSERT INTO `t_exchange_rate` VALUES ('1063', '英镑', '人民币', '10.03', null, '1409956861');
INSERT INTO `t_exchange_rate` VALUES ('1064', '英镑', '人民币', '10.03', null, '1409956921');
INSERT INTO `t_exchange_rate` VALUES ('1065', '英镑', '人民币', '10.03', null, '1409956982');
INSERT INTO `t_exchange_rate` VALUES ('1066', '英镑', '人民币', '10.03', null, '1409957041');
INSERT INTO `t_exchange_rate` VALUES ('1067', '英镑', '人民币', '10.03', null, '1409957102');
INSERT INTO `t_exchange_rate` VALUES ('1068', '英镑', '人民币', '10.03', null, '1409957161');
INSERT INTO `t_exchange_rate` VALUES ('1069', '英镑', '人民币', '10.03', null, '1409957222');
INSERT INTO `t_exchange_rate` VALUES ('1070', '英镑', '人民币', '10.03', null, '1409957281');
INSERT INTO `t_exchange_rate` VALUES ('1071', '英镑', '人民币', '10.03', null, '1409957342');
INSERT INTO `t_exchange_rate` VALUES ('1072', '英镑', '人民币', '10.03', null, '1409957401');
INSERT INTO `t_exchange_rate` VALUES ('1073', '英镑', '人民币', '10.03', null, '1409957461');
INSERT INTO `t_exchange_rate` VALUES ('1074', '英镑', '人民币', '10.03', null, '1409957522');
INSERT INTO `t_exchange_rate` VALUES ('1075', '英镑', '人民币', '10.03', null, '1409957581');
INSERT INTO `t_exchange_rate` VALUES ('1076', '英镑', '人民币', '10.03', null, '1409957642');
INSERT INTO `t_exchange_rate` VALUES ('1077', '英镑', '人民币', '10.03', null, '1409957701');
INSERT INTO `t_exchange_rate` VALUES ('1078', '英镑', '人民币', '10.03', null, '1409957761');
INSERT INTO `t_exchange_rate` VALUES ('1079', '英镑', '人民币', '10.03', null, '1409957822');
INSERT INTO `t_exchange_rate` VALUES ('1080', '英镑', '人民币', '10.03', null, '1409957882');
INSERT INTO `t_exchange_rate` VALUES ('1081', '英镑', '人民币', '10.03', null, '1409957941');

-- ----------------------------
-- Table structure for `t_exchange_rate_show`
-- ----------------------------
DROP TABLE IF EXISTS `t_exchange_rate_show`;
CREATE TABLE `t_exchange_rate_show` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '汇率ID',
  `from` varchar(20) DEFAULT '英镑' COMMENT '当前货币种类',
  `to` varchar(20) DEFAULT '人民币' COMMENT '目标货币种类',
  `rate` float(11,2) DEFAULT '0.00' COMMENT '汇率',
  `get_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT '0' COMMENT '本地更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_exchange_rate_show
-- ----------------------------
INSERT INTO `t_exchange_rate_show` VALUES ('1', '英镑', '人民币', '10.18', '1408402741', '1408402741');

-- ----------------------------
-- Table structure for `t_favorite`
-- ----------------------------
DROP TABLE IF EXISTS `t_favorite`;
CREATE TABLE `t_favorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏表ID',
  `store_id` int(11) DEFAULT NULL COMMENT '商店ID',
  `user_id` int(11) DEFAULT '0' COMMENT '用户ID',
  `create_date` int(11) DEFAULT '0' COMMENT '收藏日期',
  `create_time` int(11) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_favorite
-- ----------------------------
INSERT INTO `t_favorite` VALUES ('1', '8', '2', '1409155200', '1409215101');
INSERT INTO `t_favorite` VALUES ('11', '8', '10010', '1409155200', '1409221906');
INSERT INTO `t_favorite` VALUES ('12', '5', '10016', '1409155200', '1409234888');
INSERT INTO `t_favorite` VALUES ('13', '4', '10011', '1409155200', '1409235716');
INSERT INTO `t_favorite` VALUES ('14', '1', '10014', '1409241600', '1409264049');
INSERT INTO `t_favorite` VALUES ('15', '7', '10004', '1409241600', '1409284408');
INSERT INTO `t_favorite` VALUES ('54', '12', '10051', '1409500800', '1409535091');
INSERT INTO `t_favorite` VALUES ('17', '8', '10004', '1409241600', '1409298175');
INSERT INTO `t_favorite` VALUES ('18', '4', '10010', '1409241600', '1409304520');
INSERT INTO `t_favorite` VALUES ('21', '3', '10032', '1409328000', '1409370056');
INSERT INTO `t_favorite` VALUES ('22', '8', '10032', '1409328000', '1409370486');
INSERT INTO `t_favorite` VALUES ('61', '2', '10012', '1409500800', '1409575177');
INSERT INTO `t_favorite` VALUES ('24', '12', '10032', '1409328000', '1409389051');
INSERT INTO `t_favorite` VALUES ('27', '12', '10038', '1409328000', '1409393969');
INSERT INTO `t_favorite` VALUES ('60', '12', '10012', '1409500800', '1409575157');
INSERT INTO `t_favorite` VALUES ('30', '8', '10039', '1409414400', '1409454250');
INSERT INTO `t_favorite` VALUES ('33', '8', '10003', '1409414400', '1409456510');
INSERT INTO `t_favorite` VALUES ('89', '12', '10091', '1409846400', '1409906838');
INSERT INTO `t_favorite` VALUES ('35', '2', '10037', '1409414400', '1409460378');
INSERT INTO `t_favorite` VALUES ('36', '12', '10037', '1409414400', '1409460383');
INSERT INTO `t_favorite` VALUES ('37', '7', '10037', '1409414400', '1409460395');
INSERT INTO `t_favorite` VALUES ('40', '6', '10037', '1409414400', '1409460423');
INSERT INTO `t_favorite` VALUES ('39', '8', '10037', '1409414400', '1409460416');
INSERT INTO `t_favorite` VALUES ('41', '4', '10037', '1409414400', '1409460427');
INSERT INTO `t_favorite` VALUES ('42', '5', '10037', '1409414400', '1409460437');
INSERT INTO `t_favorite` VALUES ('43', '3', '10037', '1409414400', '1409460450');
INSERT INTO `t_favorite` VALUES ('57', '8', '10055', '1409500800', '1409564749');
INSERT INTO `t_favorite` VALUES ('63', '7', '10002', '1409673600', '1409708530');
INSERT INTO `t_favorite` VALUES ('62', '2', '10002', '1409587200', '1409652959');
INSERT INTO `t_favorite` VALUES ('88', '12', '10002', '1409760000', '1409799185');

-- ----------------------------
-- Table structure for `t_feedback_business`
-- ----------------------------
DROP TABLE IF EXISTS `t_feedback_business`;
CREATE TABLE `t_feedback_business` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户反馈表ID',
  `content` text COMMENT '反馈内容',
  `tag` int(11) DEFAULT '1' COMMENT '终端类型（1：Android；2：IOS）',
  `user_id` int(11) DEFAULT '0' COMMENT '用户ID',
  `email` varchar(100) DEFAULT '' COMMENT '联系邮箱',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_14` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_feedback_business
-- ----------------------------

-- ----------------------------
-- Table structure for `t_feedback_customer`
-- ----------------------------
DROP TABLE IF EXISTS `t_feedback_customer`;
CREATE TABLE `t_feedback_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户反馈表ID',
  `content` text COMMENT '反馈内容',
  `tag` int(11) DEFAULT '1' COMMENT '终端类型（1：Android；2：IOS）',
  `user_id` int(11) DEFAULT '0' COMMENT '用户ID',
  `email` varchar(100) DEFAULT '' COMMENT '联系邮箱',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_14` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_feedback_customer
-- ----------------------------

-- ----------------------------
-- Table structure for `t_footprints`
-- ----------------------------
DROP TABLE IF EXISTS `t_footprints`;
CREATE TABLE `t_footprints` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '足迹表ID',
  `order_no` varchar(200) DEFAULT '' COMMENT '订单编号',
  `store_id` int(11) DEFAULT NULL COMMENT '商店ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `status` int(11) DEFAULT '1' COMMENT '状态（1、上传收据；2、等待确认；3、等待回扣；4、回扣成功）',
  `is_confirm` int(11) DEFAULT '1' COMMENT '是否确认（1、是；2、否；）',
  `type` int(11) DEFAULT '1' COMMENT '商家端类型（1、未确认；2、已确认；3、争议；4、已结款）',
  `content` text COMMENT '反对理由',
  `amount` float(11,2) DEFAULT '0.00' COMMENT '购物金额',
  `rebate` float(11,2) DEFAULT '0.00' COMMENT '用户返利金额',
  `store_rebate` float(11,2) DEFAULT '0.00' COMMENT '商家返利金额',
  `percent` int(11) DEFAULT '0' COMMENT '用户返利比例',
  `store_percent` int(11) DEFAULT '0' COMMENT '商店返利比例',
  `receipt_pic` varchar(200) DEFAULT '' COMMENT '收据图片',
  `receipt_pic_small` varchar(200) DEFAULT '' COMMENT '收据缩略图片',
  `shopping_time` int(11) DEFAULT NULL COMMENT '购物时间',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=308 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_footprints
-- ----------------------------
INSERT INTO `t_footprints` VALUES ('1', '1054545748', '8', '10003', '2', '1', '2', null, '490.00', '40.70', '67.80', '8', '14', 'Uploads/receipt/2014/20140828/2f7b5797-2b68-f330-3df9-d073c8728dcb.jpg', 'Uploads/receipt/2014/20140828/df67b061-2683-ee2d-ab90-d284f681dfba_small.jpg', null, '1409214806', '1409214806');
INSERT INTO `t_footprints` VALUES ('2', '1010157100', '8', '10004', '2', '1', '2', null, '370.00', '37.10', '58.20', '10', '16', 'Uploads/receipt/2014/20140828/ec156c2e-ce1b-b91a-97e5-ddfa3b69dc9a.jpg', 'Uploads/receipt/2014/20140828/dd0d4043-35d8-565f-d2cc-9ff1593c0e65_small.jpg', null, '1409215214', '1409215214');
INSERT INTO `t_footprints` VALUES ('3', '1057491019', '5', '10003', '4', '1', '4', null, '250.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140828/b45e4822-a03d-1cd4-5476-7a47edea1e7c.jpg', 'Uploads/receipt/2014/20140828/f00d17e6-7cf4-70fc-21b6-f10286ab8e52_small.jpg', '1409155200', '1409217401', '1409217401');
INSERT INTO `t_footprints` VALUES ('4', '1051515454', '5', '10003', '2', '2', '3', 'No Show', '500.00', '0.00', '0.00', '10', '0', 'Uploads/receipt/2014/20140828/6b73342a-0395-9396-bd17-f75f68e0c29c.jpg', 'Uploads/receipt/2014/20140828/e5d37722-663d-2d7b-bb47-dc9b370c56d0_small.jpg', '1409241600', '1409218883', '1409218883');
INSERT INTO `t_footprints` VALUES ('5', '1056102515', '1', '10010', '2', '1', '2', null, '461.00', '32.27', '36.88', '7', '8', 'Uploads/receipt/2014/20140828/7d4611ea-30e8-aa7c-786c-4b52d8a7239f.jpg', 'Uploads/receipt/2014/20140828/837a35e8-ad7b-2ca6-3491-5777de7d0eac_small.jpg', null, '1409219832', '1409219832');
INSERT INTO `t_footprints` VALUES ('6', '1050481004', '1', '10010', '2', '2', '3', 'Receipt Unclear', '1843.00', '147.44', '165.87', '8', '9', 'Uploads/receipt/2014/20140829/aad7ca0c-d9ed-e023-5b87-8afa539c63ba.jpg', 'Uploads/receipt/2014/20140829/f82d2c7e-2743-edce-43a1-5342ebbac525_small.jpg', null, '1409220098', '1409220098');
INSERT INTO `t_footprints` VALUES ('7', '1050505756', '1', '10010', '2', '1', '2', null, '1843.00', '147.44', '165.87', '8', '9', 'Uploads/receipt/2014/20140829/1bbb188c-ad6e-1db6-65fc-8bdaf19cb1a1.jpg', 'Uploads/receipt/2014/20140829/bd9008e2-8720-1eb2-2fb3-e6e9f2a5fd51_small.jpg', null, '1409220130', '1409220130');
INSERT INTO `t_footprints` VALUES ('8', '1051989950', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409220915', '1409220915');
INSERT INTO `t_footprints` VALUES ('9', '1055575249', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409220919', '1409220919');
INSERT INTO `t_footprints` VALUES ('10', '1098529854', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409220923', '1409220923');
INSERT INTO `t_footprints` VALUES ('11', '1049565098', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409220929', '1409220929');
INSERT INTO `t_footprints` VALUES ('12', '1053575352', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409220933', '1409220933');
INSERT INTO `t_footprints` VALUES ('13', '1053979997', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409220949', '1409220949');
INSERT INTO `t_footprints` VALUES ('14', '1057100545', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409220953', '1409220953');
INSERT INTO `t_footprints` VALUES ('15', '1010253499', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409220959', '1409220959');
INSERT INTO `t_footprints` VALUES ('16', '1054545156', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409220966', '1409220966');
INSERT INTO `t_footprints` VALUES ('17', '1097975297', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409220970', '1409220970');
INSERT INTO `t_footprints` VALUES ('18', '1010199545', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409220974', '1409220974');
INSERT INTO `t_footprints` VALUES ('19', '1052555150', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409220980', '1409220980');
INSERT INTO `t_footprints` VALUES ('20', '1056555510', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409220984', '1409220984');
INSERT INTO `t_footprints` VALUES ('21', '1099515349', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409220988', '1409220988');
INSERT INTO `t_footprints` VALUES ('22', '1051995455', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409220995', '1409220995');
INSERT INTO `t_footprints` VALUES ('23', '1056579955', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409221016', '1409221016');
INSERT INTO `t_footprints` VALUES ('24', '1010048481', '3', '10002', '1', '1', '1', null, '9200.00', '0.00', '736.00', '0', '8', '', '', null, '1409221021', '1409221021');
INSERT INTO `t_footprints` VALUES ('25', '1049971005', '3', '10002', '1', '1', '1', null, '8740.00', '0.00', '699.20', '0', '8', '', '', null, '1409221025', '1409221025');
INSERT INTO `t_footprints` VALUES ('26', '1054515310', '3', '10002', '1', '1', '1', null, '8280.00', '0.00', '662.40', '0', '8', '', '', null, '1409221030', '1409221030');
INSERT INTO `t_footprints` VALUES ('27', '1098505256', '3', '10002', '1', '1', '1', null, '7820.00', '0.00', '625.60', '0', '8', '', '', null, '1409221035', '1409221035');
INSERT INTO `t_footprints` VALUES ('28', '1010248565', '3', '10002', '1', '1', '1', null, '7360.00', '0.00', '588.80', '0', '8', '', '', null, '1409221039', '1409221039');
INSERT INTO `t_footprints` VALUES ('29', '1050985410', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409221042', '1409221042');
INSERT INTO `t_footprints` VALUES ('30', '1010254489', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409221055', '1409221055');
INSERT INTO `t_footprints` VALUES ('31', '1052991001', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409221060', '1409221060');
INSERT INTO `t_footprints` VALUES ('32', '1099995350', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409221068', '1409221068');
INSERT INTO `t_footprints` VALUES ('33', '1050100535', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409221074', '1409221074');
INSERT INTO `t_footprints` VALUES ('34', '1097485155', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409221082', '1409221082');
INSERT INTO `t_footprints` VALUES ('35', '1010150100', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409221086', '1409221086');
INSERT INTO `t_footprints` VALUES ('36', '1050575451', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409221090', '1409221090');
INSERT INTO `t_footprints` VALUES ('37', '1055100504', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409221095', '1409221095');
INSERT INTO `t_footprints` VALUES ('38', '1010048985', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409221101', '1409221101');
INSERT INTO `t_footprints` VALUES ('39', '1050971015', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409221106', '1409221106');
INSERT INTO `t_footprints` VALUES ('40', '1056975652', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409221112', '1409221112');
INSERT INTO `t_footprints` VALUES ('41', '1048525510', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409221120', '1409221120');
INSERT INTO `t_footprints` VALUES ('42', '1055565199', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409221127', '1409221127');
INSERT INTO `t_footprints` VALUES ('43', '1010097101', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409221133', '1409221133');
INSERT INTO `t_footprints` VALUES ('44', '1010256101', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409221199', '1409221199');
INSERT INTO `t_footprints` VALUES ('45', '1054985054', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409221206', '1409221206');
INSERT INTO `t_footprints` VALUES ('46', '1010250102', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409221215', '1409221215');
INSERT INTO `t_footprints` VALUES ('47', '1052100525', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409221220', '1409221220');
INSERT INTO `t_footprints` VALUES ('48', '1097100102', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409221226', '1409221226');
INSERT INTO `t_footprints` VALUES ('49', '1049531005', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409221233', '1409221233');
INSERT INTO `t_footprints` VALUES ('50', '1053985699', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409221237', '1409221237');
INSERT INTO `t_footprints` VALUES ('51', '1097995156', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409221242', '1409221242');
INSERT INTO `t_footprints` VALUES ('52', '1051565053', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409221251', '1409221251');
INSERT INTO `t_footprints` VALUES ('53', '1010155514', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409221262', '1409221262');
INSERT INTO `t_footprints` VALUES ('54', '1056995448', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409221272', '1409221272');
INSERT INTO `t_footprints` VALUES ('55', '1049575548', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409221281', '1409221281');
INSERT INTO `t_footprints` VALUES ('56', '1053995597', '3', '10002', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140829/2680011d-04e0-d211-f4ff-a98e3942a3c8.jpg', 'Uploads/receipt/2014/20140829/8a70df63-0dd3-62b5-e886-3c2156c402ad_small.jpg', null, '1409221285', '1409221285');
INSERT INTO `t_footprints` VALUES ('57', '1099525110', '3', '10002', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140828/6c1b0fd7-24f2-e336-9574-6a7a83153a17.jpg', 'Uploads/receipt/2014/20140828/944a28e9-ab81-1d4c-ba87-dbed0de6953f_small.jpg', null, '1409221292', '1409221292');
INSERT INTO `t_footprints` VALUES ('58', '1053579749', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409221301', '1409221301');
INSERT INTO `t_footprints` VALUES ('59', '1098995010', '3', '10002', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140829/08bb20ad-fbf8-54f5-a062-472794aa7373.jpg', 'Uploads/receipt/2014/20140829/14e6a6f7-9e79-c82c-7f00-aedc5513f6a1_small.jpg', null, '1409221371', '1409221371');
INSERT INTO `t_footprints` VALUES ('60', '1052495655', '3', '10002', '3', '1', '2', null, '46000.00', '3680.00', '4140.00', '8', '9', 'Uploads/receipt/2014/20140904/29fb9f59-1980-06a9-4ded-2c14727a5baf.jpg', 'Uploads/receipt/2014/20140904/16de4609-0a57-c4f6-167a-d3f0b708882e_small.jpg', null, '1409221380', '1409910072');
INSERT INTO `t_footprints` VALUES ('61', '1053509953', '3', '10002', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140829/ba6c8b5f-732f-9cd4-d350-f506a6e42f38.jpg', 'Uploads/receipt/2014/20140829/2e65b26f-955a-2486-7b95-2cff8e6417af_small.jpg', null, '1409221397', '1409221397');
INSERT INTO `t_footprints` VALUES ('62', '1099535757', '3', '10002', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140829/e67fabd5-4a50-43e1-39ce-4712dff7ddcd.jpg', 'Uploads/receipt/2014/20140829/de29a1f1-fd66-56ca-8f07-52b8d4c4fe38_small.jpg', null, '1409221404', '1409221404');
INSERT INTO `t_footprints` VALUES ('63', '1054511011', '3', '10002', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140829/4668ca51-de84-0307-ad7e-88cc9db7c407.jpg', 'Uploads/receipt/2014/20140829/879346d6-459c-ccb8-daff-b51bb655eecb_small.jpg', null, '1409221414', '1409221414');
INSERT INTO `t_footprints` VALUES ('64', '1010055100', '3', '10002', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140829/451717cd-49dc-a7f1-7e02-1e6b1adf3d9c.jpg', 'Uploads/receipt/2014/20140829/3a7e8672-832f-82b7-64fd-61f0097d6575_small.jpg', null, '1409221421', '1409221421');
INSERT INTO `t_footprints` VALUES ('65', '1052565054', '3', '10002', '3', '1', '2', null, '6900.00', '552.00', '621.00', '8', '9', 'Uploads/receipt/2014/20140829/1eb19567-1a32-048e-50c5-0fcef4945f3f.jpg', 'Uploads/receipt/2014/20140829/ac68669c-44e2-c990-364b-3a803a75ae24_small.jpg', null, '1409221428', '1409221428');
INSERT INTO `t_footprints` VALUES ('66', '1097575198', '3', '10002', '3', '1', '2', null, '4600.00', '368.00', '414.00', '8', '9', 'Uploads/receipt/2014/20140829/1b8b3abe-f0d1-1924-670a-47b173be7b8d.jpg', 'Uploads/receipt/2014/20140829/f7e1bb97-c686-7878-9c9e-96fe4bfc00bf_small.jpg', null, '1409221434', '1409221434');
INSERT INTO `t_footprints` VALUES ('67', '1051571001', '3', '10002', '3', '1', '2', null, '1380.00', '110.40', '124.20', '8', '9', 'Uploads/receipt/2014/20140829/2c20ca60-e953-dfff-bbda-2c04430c1e1e.jpg', 'Uploads/receipt/2014/20140829/dff8cab8-9e93-91cb-282e-8bc8c5019ac8_small.jpg', null, '1409221443', '1409221443');
INSERT INTO `t_footprints` VALUES ('68', '1097505355', '3', '10002', '3', '1', '2', null, '460.00', '36.80', '41.40', '8', '9', 'Uploads/receipt/2014/20140829/5995fee3-4fd3-aeb1-2088-ad84473b0c73.jpg', 'Uploads/receipt/2014/20140829/a06b6625-a743-37c2-8ab8-b172edbe8206_small.jpg', null, '1409221450', '1409221450');
INSERT INTO `t_footprints` VALUES ('69', '1049554848', '3', '10002', '2', '2', '3', '', '6900.00', '0.00', '552.00', '0', '8', 'Uploads/receipt/2014/20140829/31094501-1a80-ff8e-752b-dd0031077b8d.jpg', 'Uploads/receipt/2014/20140829/a536b7f4-2a97-0a89-2795-464657628246_small.jpg', null, '1409221457', '1409221457');
INSERT INTO `t_footprints` VALUES ('70', '1055575650', '3', '10002', '3', '1', '2', null, '6440.00', '0.00', '515.20', '0', '8', 'Uploads/receipt/2014/20140829/665ef2b8-2c50-da8e-8886-c183e6cacb61.jpg', 'Uploads/receipt/2014/20140829/8e47c519-b04e-997a-94a3-8ea532900ad7_small.jpg', null, '1409221463', '1409221463');
INSERT INTO `t_footprints` VALUES ('71', '1099554848', '3', '10002', '2', '2', '3', '', '5980.00', '0.00', '478.40', '0', '8', 'Uploads/receipt/2014/20140829/c4ddeb78-d927-d6fc-b1c3-27876a89e6eb.jpg', 'Uploads/receipt/2014/20140829/cc367ab4-650a-9091-2009-983cd78aa3df_small.jpg', null, '1409221468', '1409221468');
INSERT INTO `t_footprints` VALUES ('72', '1050545348', '3', '10002', '2', '2', '3', '', '5980.00', '0.00', '478.40', '0', '8', 'Uploads/receipt/2014/20140829/85cde762-8c3b-3a8a-e7eb-3f24958a49ec.jpg', 'Uploads/receipt/2014/20140829/bc1a46ea-c662-5c94-f582-664f4fee9cac_small.jpg', null, '1409221474', '1409221474');
INSERT INTO `t_footprints` VALUES ('73', '1098101541', '3', '10002', '2', '2', '3', '', '5520.00', '0.00', '441.60', '0', '8', 'Uploads/receipt/2014/20140829/846a096d-10d1-a064-597f-360f99d343ac.jpg', 'Uploads/receipt/2014/20140829/8f7b1082-ccff-3db5-1e30-2bb5d3efa0c2_small.jpg', null, '1409221483', '1409221483');
INSERT INTO `t_footprints` VALUES ('74', '1051509751', '3', '10002', '2', '2', '3', '', '5060.00', '0.00', '404.80', '0', '8', 'Uploads/receipt/2014/20140829/104173e4-a672-fb2c-c82e-3128a0d69cc5.jpg', 'Uploads/receipt/2014/20140829/6e884993-da31-9707-1dfa-357c7e59475e_small.jpg', null, '1409221491', '1409221491');
INSERT INTO `t_footprints` VALUES ('75', '1099485597', '3', '10002', '3', '1', '2', null, '4600.00', '0.00', '368.00', '0', '8', 'Uploads/receipt/2014/20140829/f1ca20d0-b6ef-2706-d6e8-42b38caec2a1.jpg', 'Uploads/receipt/2014/20140829/1e566edb-cef1-621e-3576-feb308fd4a90_small.jpg', null, '1409221500', '1409221500');
INSERT INTO `t_footprints` VALUES ('76', '1057985048', '3', '10002', '3', '1', '2', null, '4140.00', '0.00', '331.20', '0', '8', 'Uploads/receipt/2014/20140829/3436e0dc-7aba-6a1e-9389-ee85ddc16eac.jpg', 'Uploads/receipt/2014/20140829/c702fad5-3baf-4861-48d6-125439679a4a_small.jpg', null, '1409221513', '1409221513');
INSERT INTO `t_footprints` VALUES ('77', '1050485010', '3', '10002', '3', '1', '2', null, '4600.00', '0.00', '368.00', '0', '8', 'Uploads/receipt/2014/20140829/0dd03928-d672-7fa8-5652-ce9c16cba9c7.jpg', 'Uploads/receipt/2014/20140829/985649c9-8957-b09e-34e1-ab2603e5c68e_small.jpg', null, '1409221522', '1409221522');
INSERT INTO `t_footprints` VALUES ('78', '1056524810', '3', '10002', '3', '1', '2', null, '460.00', '0.00', '36.80', '0', '8', 'Uploads/receipt/2014/20140829/daada65f-ac6c-0ffc-0129-78f68700d870.jpg', 'Uploads/receipt/2014/20140829/d0fd5d80-6725-6a85-7ee6-815b41c45473_small.jpg', null, '1409221528', '1409221528');
INSERT INTO `t_footprints` VALUES ('79', '1053565599', '3', '10002', '3', '1', '2', null, '920.00', '0.00', '73.60', '0', '8', 'Uploads/receipt/2014/20140829/f0018bf3-ea52-524e-77c2-640bd3797a7f.jpg', 'Uploads/receipt/2014/20140829/c82573fa-4cb1-bdcb-47f2-7df7f7abcef9_small.jpg', null, '1409221541', '1409221541');
INSERT INTO `t_footprints` VALUES ('80', '1099535610', '3', '10002', '3', '1', '2', null, '460.00', '0.00', '36.80', '0', '8', 'Uploads/receipt/2014/20140829/cc800c6b-95ee-787d-6f77-5b313059af45.jpg', 'Uploads/receipt/2014/20140829/656c6725-9951-57ca-5019-ee5ebca7b751_small.jpg', null, '1409221548', '1409221548');
INSERT INTO `t_footprints` VALUES ('81', '1051102485', '3', '10002', '2', '2', '3', '', '460.00', '0.00', '36.80', '0', '8', 'Uploads/receipt/2014/20140829/e44becbe-dec4-c89b-35ad-f71e6482c609.jpg', 'Uploads/receipt/2014/20140829/0094ceb4-fd56-512d-48b1-418bc54389a3_small.jpg', null, '1409221555', '1409221555');
INSERT INTO `t_footprints` VALUES ('82', '1057981019', '3', '10002', '3', '1', '2', null, '3220.00', '0.00', '257.60', '0', '8', 'Uploads/receipt/2014/20140829/7277b6a1-5641-d1e9-837e-c2de4fb0bc65.jpg', 'Uploads/receipt/2014/20140829/4012ee8b-3889-0d16-351f-28dd19f4c669_small.jpg', null, '1409221561', '1409221561');
INSERT INTO `t_footprints` VALUES ('83', '1010151102', '3', '10002', '3', '1', '2', null, '2300.00', '0.00', '184.00', '0', '8', 'Uploads/receipt/2014/20140829/59fe028a-2fc0-d48a-996d-14c444c97581.jpg', 'Uploads/receipt/2014/20140829/83051bc3-8182-4565-06d7-aece7170123b_small.jpg', null, '1409221566', '1409221566');
INSERT INTO `t_footprints` VALUES ('84', '1052535054', '3', '10002', '3', '1', '2', null, '2760.00', '0.00', '220.80', '0', '8', 'Uploads/receipt/2014/20140829/13032bb6-07be-86ff-c4c7-a70ecabdd1cb.jpg', 'Uploads/receipt/2014/20140829/d0ab6098-e037-1591-b1f9-c67183fe924a_small.jpg', null, '1409221572', '1409221572');
INSERT INTO `t_footprints` VALUES ('85', '1057485149', '3', '10002', '3', '1', '2', null, '1380.00', '0.00', '110.40', '0', '8', 'Uploads/receipt/2014/20140828/de2e3b9d-6774-2394-cf1a-c76a1cfb0dad.jpg', 'Uploads/receipt/2014/20140828/b06fc3c3-b731-c5ba-f29d-38361fb98e70_small.jpg', null, '1409221577', '1409221577');
INSERT INTO `t_footprints` VALUES ('86', '1010056549', '3', '10002', '3', '1', '2', null, '2300.00', '0.00', '184.00', '0', '8', 'Uploads/receipt/2014/20140829/d419507f-6519-19e0-d3f3-d2bdeb0ee031.jpg', 'Uploads/receipt/2014/20140829/48c1807b-ab69-6030-2b3c-7e0dea45e7dd_small.jpg', null, '1409221581', '1409221581');
INSERT INTO `t_footprints` VALUES ('87', '1053515456', '3', '10002', '3', '1', '2', null, '460.00', '0.00', '36.80', '0', '8', 'Uploads/receipt/2014/20140829/5637ee1f-941e-64df-2a03-a95a86bb8755.jpg', 'Uploads/receipt/2014/20140829/4a09b731-08c1-56b5-a404-4c59b001988b_small.jpg', null, '1409221589', '1409221589');
INSERT INTO `t_footprints` VALUES ('88', '1054495156', '5', '10003', '3', '1', '2', null, '462.00', '27.72', '32.34', '6', '7', 'Uploads/receipt/2014/20140828/d0e4ab47-314a-10f4-abac-da0251a5b89d.jpg', 'Uploads/receipt/2014/20140828/c7261a3a-97c5-e935-f1a6-b747001fea3f_small.jpg', null, '1409238118', '1409238118');
INSERT INTO `t_footprints` VALUES ('89', '1099515648', '8', '10010', '2', '2', '3', 'No Show', '510.00', '93.30', '126.60', '18', '25', 'Uploads/receipt/2014/20140829/8fc0034c-7a50-ca84-0e9d-ba41cd92fa56.jpg', 'Uploads/receipt/2014/20140829/e5a046c9-0c6e-34b5-38e2-1744849c40c0_small.jpg', null, '1409277852', '1409277852');
INSERT INTO `t_footprints` VALUES ('90', '1050485053', '8', '10020', '2', '2', '3', 'No Show', '1000.00', '0.00', '0.00', '10', '20', 'Uploads/receipt/2014/20140829/feb36a73-23cc-51a1-9add-598730c2cbf5.jpg', 'Uploads/receipt/2014/20140829/da43a3ae-82a4-f294-2c70-c89dbd5b6871_small.jpg', '1409279459', '1409278978', '1409278978');
INSERT INTO `t_footprints` VALUES ('91', '1050100571', '8', '10010', '2', '2', '3', 'Refunded', '130.00', '29.90', '39.00', '23', '30', 'Uploads/receipt/2014/20140829/15f1d640-4d5c-a493-fc72-8b8db47cdb64.jpg', 'Uploads/receipt/2014/20140829/c1a6c60a-3720-4a3f-4de6-f6f2f5ff70b1_small.jpg', null, '1409281202', '1409281202');
INSERT INTO `t_footprints` VALUES ('92', '1057100501', '1', '10012', '2', '2', '3', '', '1843.00', '147.44', '165.87', '8', '9', 'Uploads/receipt/2014/20140829/6f555dcc-e5b2-f582-e657-73a6846c8ad1.jpg', 'Uploads/receipt/2014/20140829/d8170e6f-0a31-738c-c563-e55c9d4fc97d_small.jpg', null, '1409291657', '1409291657');
INSERT INTO `t_footprints` VALUES ('93', '1098979799', '8', '10012', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140829/11a4a7a6-4e2d-da11-d4db-946bdbd1bdbf.jpg', 'Uploads/receipt/2014/20140829/761b9b7b-64ba-40ef-dd3f-4e47e33ee546_small.jpg', null, '1409293595', '1409293595');
INSERT INTO `t_footprints` VALUES ('94', '1010048995', '5', '10003', '3', '1', '2', null, '924.00', '55.44', '64.68', '6', '7', 'Uploads/receipt/2014/20140829/f4a54719-f5ee-247d-2e9e-10f4b3040c45.jpg', 'Uploads/receipt/2014/20140829/f9a1069e-8c08-c834-c48e-2da86ea2cc10_small.jpg', null, '1409293661', '1409293661');
INSERT INTO `t_footprints` VALUES ('95', '1010052991', '8', '10003', '4', '1', '4', null, '260.00', '59.80', '78.00', '23', '30', 'Uploads/receipt/2014/20140829/406b2aff-bd8b-e987-81d1-88aaa4ea2082.jpg', 'Uploads/receipt/2014/20140829/e8536dde-375e-0aa4-f2a4-f8e64a731796_small.jpg', null, '1409294557', '1409294557');
INSERT INTO `t_footprints` VALUES ('96', '1098974948', '8', '10003', '2', '2', '3', 'Cancelled', '6500.00', '1495.00', '1950.00', '23', '30', 'Uploads/receipt/2014/20140829/ce9800b4-f341-64c0-3dac-835dc11665af.jpg', 'Uploads/receipt/2014/20140829/a96d8c34-073a-a527-a67c-c4c640a76ff3_small.jpg', null, '1409295387', '1409295387');
INSERT INTO `t_footprints` VALUES ('97', '1098984951', '8', '10003', '2', '2', '3', 'Wrong Received', '390.00', '89.70', '117.00', '23', '30', 'Uploads/receipt/2014/20140829/9f9e6de1-0209-6b87-27d0-acd73064ffc0.jpg', 'Uploads/receipt/2014/20140829/4cbcccc5-2d31-bdfb-6e97-7820e12e2cc1_small.jpg', null, '1409295659', '1409295659');
INSERT INTO `t_footprints` VALUES ('98', '1052102495', '3', '10002', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140904/6d964454-eb81-50a8-e60b-3eb82a4fb17e.jpg', 'Uploads/receipt/2014/20140904/03e761a3-5835-79e3-b94d-d74af3876b30_small.jpg', null, '1409295748', '1409819830');
INSERT INTO `t_footprints` VALUES ('99', '1010010150', '3', '10002', '3', '1', '2', null, '5520.00', '441.60', '496.80', '8', '9', 'Uploads/receipt/2014/20140904/1e812452-7220-39d5-4e07-1436e8c78449.jpg', 'Uploads/receipt/2014/20140904/54004e73-201d-ae34-08ca-53d08e03b30c_small.jpg', null, '1409295757', '1409910074');
INSERT INTO `t_footprints` VALUES ('100', '1010048100', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409297293', '1409297293');
INSERT INTO `t_footprints` VALUES ('101', '1056491014', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409298184', '1409298184');
INSERT INTO `t_footprints` VALUES ('102', '1057101481', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409299017', '1409299017');
INSERT INTO `t_footprints` VALUES ('103', '1010157539', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409299966', '1409299966');
INSERT INTO `t_footprints` VALUES ('104', '1099101971', '3', '10002', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140904/22235b35-5475-aec3-37b4-752f4da1b66f.jpg', 'Uploads/receipt/2014/20140904/f1c781f6-055d-aa79-c159-f37e267166a7_small.jpg', null, '1409300604', '1409819542');
INSERT INTO `t_footprints` VALUES ('105', '1010154575', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409300814', '1409300814');
INSERT INTO `t_footprints` VALUES ('106', '1010210152', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409302367', '1409302367');
INSERT INTO `t_footprints` VALUES ('107', '1057544850', '3', '10002', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140904/c384c8df-3759-7a1a-5014-f764d524cc6b.jpg', 'Uploads/receipt/2014/20140904/158ae01a-5fde-f158-9724-4041c1272334_small.jpg', null, '1409302665', '1409302665');
INSERT INTO `t_footprints` VALUES ('108', '1055100515', '3', '10002', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140904/867777fd-37ab-5b3c-fae4-295bb85ef3f1.jpg', 'Uploads/receipt/2014/20140904/162f78b2-e7e3-1c5d-7e7e-c82b323a5a63_small.jpg', null, '1409302935', '1409302935');
INSERT INTO `t_footprints` VALUES ('109', '1056519998', '3', '10002', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140904/c8c453d0-eb0d-ece5-10ab-02f97a88e907.jpg', 'Uploads/receipt/2014/20140904/a3a8db6d-6164-807e-c697-714cb8d1f44c_small.jpg', null, '1409303256', '1409303256');
INSERT INTO `t_footprints` VALUES ('110', '1057981021', '3', '10002', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140904/b7aaaed3-fa11-f466-98e1-b6a931e3e6b8.jpg', 'Uploads/receipt/2014/20140904/5e3eebb2-12bf-bc13-7817-30130b89a71c_small.jpg', null, '1409303385', '1409303385');
INSERT INTO `t_footprints` VALUES ('111', '1050514998', '3', '10002', '3', '1', '2', null, '6900.00', '552.00', '621.00', '8', '9', 'Uploads/receipt/2014/20140904/04a045ee-f36c-cc13-4312-3c67dbab6f7f.jpg', 'Uploads/receipt/2014/20140904/53c4e2b3-f1da-4869-9601-e4cc3b9b407b_small.jpg', null, '1409303394', '1409910076');
INSERT INTO `t_footprints` VALUES ('112', '1099101100', '1', '10014', '4', '1', '4', null, '1843.00', '147.44', '165.87', '8', '9', 'Uploads/receipt/2014/20140829/dc335924-ee9b-41dd-e342-d0da02b56ebb.jpg', 'Uploads/receipt/2014/20140829/18825832-3ae6-bef2-fd7b-bb2918690d23_small.jpg', null, '1409305660', '1409305660');
INSERT INTO `t_footprints` VALUES ('113', '1099551025', '8', '10003', '3', '1', '2', null, '11700.00', '2925.00', '3510.00', '25', '30', 'Uploads/receipt/2014/20140829/5047e581-9992-dbba-2acb-dbdff8659dcb.jpg', 'Uploads/receipt/2014/20140829/3e88c5f2-a76b-2d34-041b-5a16a7c5ea40_small.jpg', null, '1409306396', '1409306396');
INSERT INTO `t_footprints` VALUES ('114', '1051101504', '3', '10002', '2', '1', '1', null, '23000.00', '1840.00', '2070.00', '8', '9', 'Uploads/receipt/2014/20140904/eccdcf5c-2002-8620-76cd-4583248c35e1.jpg', 'Uploads/receipt/2014/20140904/182686fd-e7dd-b9b3-4ced-1d5353030cf2_small.jpg', null, '1409306515', '1409306515');
INSERT INTO `t_footprints` VALUES ('115', '1010053521', '3', '10002', '3', '1', '2', null, '460.00', '0.00', '36.80', '0', '8', 'Uploads/receipt/2014/20140904/99c0b300-2bc7-4c2a-1800-0c7174599edb.jpg', 'Uploads/receipt/2014/20140904/69a6adc5-e980-b955-bdae-5c80e6c44bea_small.jpg', null, '1409306541', '1409306541');
INSERT INTO `t_footprints` VALUES ('116', '1099531005', '8', '10003', '4', '1', '4', null, '11700.00', '2925.00', '3510.00', '25', '30', 'Uploads/receipt/2014/20140829/fbe3dfe7-8eb0-d84e-7374-bda114076480.jpg', 'Uploads/receipt/2014/20140829/e4f18673-0284-cabf-c6ea-591f3dcc4991_small.jpg', null, '1409307708', '1409307708');
INSERT INTO `t_footprints` VALUES ('117', '1010056495', '3', '10002', '3', '1', '2', null, '460.00', '0.00', '36.80', '0', '8', 'Uploads/receipt/2014/20140904/f45982f7-1456-bf48-f542-ea240ec25a6d.jpg', 'Uploads/receipt/2014/20140904/400e2cbf-2497-0029-9b1e-a52600da5103_small.jpg', null, '1409307805', '1409307805');
INSERT INTO `t_footprints` VALUES ('118', '1053505710', '3', '10002', '3', '1', '2', null, '460.00', '0.00', '36.80', '0', '8', 'Uploads/receipt/2014/20140904/8dc700cd-0d7e-88a0-0bc8-27e8924d3973.jpg', 'Uploads/receipt/2014/20140904/8e2ea0d1-f659-4557-4f01-523c566e88be_small.jpg', null, '1409307861', '1409307861');
INSERT INTO `t_footprints` VALUES ('119', '1048504957', '8', '10020', '2', '2', '3', 'No Show', '1300.00', '299.00', '390.00', '23', '30', 'Uploads/receipt/2014/20140829/74aaa8db-4495-bb7c-8683-3e0e37338933.jpg', 'Uploads/receipt/2014/20140829/1564a169-5abf-9140-aa66-1a0660800128_small.jpg', null, '1409308048', '1409308048');
INSERT INTO `t_footprints` VALUES ('120', '1010210199', '8', '10020', '3', '1', '2', null, '1300.00', '325.00', '390.00', '25', '30', 'Uploads/receipt/2014/20140829/9e22542a-c2c3-a8d9-b301-4b0cb5aa66b2.jpg', 'Uploads/receipt/2014/20140829/32ef540a-405f-b6f5-c9ad-4dfe1d69abec_small.jpg', null, '1409308607', '1409308607');
INSERT INTO `t_footprints` VALUES ('121', '1098489910', '1', '10025', '3', '1', '2', null, '1843.00', '0.00', '165.87', '0', '9', 'Uploads/receipt/2014/20140829/842cb378-2132-5784-2144-baaf9e108bd6.jpg', 'Uploads/receipt/2014/20140829/d893d71f-b27e-39a7-c826-fa7a54f3e473_small.jpg', null, '1409309243', '1409309243');
INSERT INTO `t_footprints` VALUES ('122', '1010254494', '5', '10026', '2', '2', '3', '', '462.00', '27.72', '32.34', '6', '7', 'Uploads/receipt/2014/20140829/4c04f0be-454c-e3bc-d9fa-c5dd31f40f1a.jpg', 'Uploads/receipt/2014/20140829/2c42e48e-c8d3-4017-9373-ae594856fc8e_small.jpg', null, '1409309903', '1409309903');
INSERT INTO `t_footprints` VALUES ('123', '1010199545', '5', '10003', '2', '2', '3', 'Cancelled', '11550.00', '0.00', '808.50', '0', '7', 'Uploads/receipt/2014/20140829/1cd648cd-ce95-847e-71c7-577f9a01932b.jpg', 'Uploads/receipt/2014/20140829/491ff9ed-23db-da7c-068d-3bbfde2dc7e6_small.jpg', null, '1409317134', '1409317134');
INSERT INTO `t_footprints` VALUES ('124', '1010148495', '5', '10003', '2', '2', '3', 'Refunded', '9240.00', '0.00', '646.80', '0', '7', 'Uploads/receipt/2014/20140829/d89061ae-7cf3-3c9a-ac92-40c615562dfc.jpg', 'Uploads/receipt/2014/20140829/9581fa53-9623-56c0-5b76-30ddd8309cfe_small.jpg', null, '1409317150', '1409317150');
INSERT INTO `t_footprints` VALUES ('125', '1056541015', '8', '10002', '2', '1', '1', null, '1690.00', '422.50', '507.00', '25', '30', 'Uploads/receipt/2014/20140830/08ee45f7-b24b-c66a-7196-6cfdd0c49370.jpg', 'Uploads/receipt/2014/20140830/f13da70c-06bb-aa6f-7d3b-705f72bba438_small.jpg', null, '1409369800', '1409369800');
INSERT INTO `t_footprints` VALUES ('126', '1056531029', '8', '10002', '2', '2', '3', 'Wrong Received', '910.00', '227.50', '273.00', '25', '30', 'Uploads/receipt/2014/20140830/bbbb4214-1fcb-49e1-12cf-a23625ffa705.jpg', 'Uploads/receipt/2014/20140830/7a780cda-ef4f-6ca8-173b-a5eb00a51f7f_small.jpg', null, '1409369848', '1409369848');
INSERT INTO `t_footprints` VALUES ('127', '1053535598', '8', '10002', '2', '1', '1', null, '480.00', '24.00', '38.40', '5', '8', 'Uploads/receipt/2014/20140830/c037e47c-52b1-142c-258f-548a89af42da.jpg', 'Uploads/receipt/2014/20140830/5582ac3e-643d-cd17-9d05-94ec2a2f0ad4_small.jpg', null, '1409369861', '1409369861');
INSERT INTO `t_footprints` VALUES ('128', '1057101525', '8', '10002', '2', '1', '1', null, '520.00', '130.00', '156.00', '25', '30', 'Uploads/receipt/2014/20140830/cf4fadf8-eaa0-d445-93ba-8dfc6b4fb629.jpg', 'Uploads/receipt/2014/20140830/8c7b59b6-79df-94dd-6448-f9dfddbea186_small.jpg', null, '1409369865', '1409369865');
INSERT INTO `t_footprints` VALUES ('129', '1054101569', '8', '10002', '2', '2', '3', 'Others', '1560.00', '390.00', '468.00', '25', '30', 'Uploads/receipt/2014/20140830/750b4f69-eda6-7599-88f1-b0aaeb7a2b8d.jpg', 'Uploads/receipt/2014/20140830/fe6a9bc9-1a62-cad5-e1ae-90627da8c1d8_small.jpg', null, '1409369878', '1409369878');
INSERT INTO `t_footprints` VALUES ('130', '1010052501', '8', '10002', '4', '1', '4', null, '1560.00', '390.00', '468.00', '25', '30', 'Uploads/receipt/2014/20140830/ef47b8d6-60a5-85be-7892-d9f267264af3.jpg', 'Uploads/receipt/2014/20140830/69906a4e-15d6-3bfe-8611-1e480e02cd21_small.jpg', null, '1409369885', '1409369885');
INSERT INTO `t_footprints` VALUES ('131', '1048994953', '8', '10002', '2', '2', '3', 'Wrong Received', '2860.00', '715.00', '858.00', '25', '30', 'Uploads/receipt/2014/20140830/eb61d1bc-e08c-290a-812e-f07fa0796d8b.jpg', 'Uploads/receipt/2014/20140830/0d2e79af-1bbf-9c58-5083-ad304eb9e20f_small.jpg', null, '1409369888', '1409369888');
INSERT INTO `t_footprints` VALUES ('132', '1054102501', '8', '10002', '2', '2', '3', 'Others', '1440.00', '72.00', '115.20', '5', '8', 'Uploads/receipt/2014/20140830/1bd4aa70-3a26-d57e-d4f0-862abf2c9f16.jpg', 'Uploads/receipt/2014/20140830/8548e678-9d7c-ffb9-d9e1-77f3351ddaa6_small.jpg', null, '1409369894', '1409369894');
INSERT INTO `t_footprints` VALUES ('133', '1050100511', '8', '10002', '2', '2', '3', 'Cancelled', '1430.00', '357.50', '429.00', '25', '30', 'Uploads/receipt/2014/20140830/5a1ca4ac-2fd9-26d6-885f-010b842695da.jpg', 'Uploads/receipt/2014/20140830/861253f6-e601-5633-fb81-e5d8145e5641_small.jpg', null, '1409369906', '1409369906');
INSERT INTO `t_footprints` VALUES ('134', '1097535555', '8', '10002', '2', '2', '3', 'Receipt Unclear', '240.00', '12.00', '19.20', '5', '8', 'Uploads/receipt/2014/20140830/ee07dad7-02c0-8d1d-1b60-18226403a215.jpg', 'Uploads/receipt/2014/20140830/c59f45f8-b211-bd06-b718-09c80862e1eb_small.jpg', null, '1409369914', '1409369914');
INSERT INTO `t_footprints` VALUES ('135', '1010155535', '8', '10002', '2', '2', '3', 'No Show', '260.00', '65.00', '78.00', '25', '30', 'Uploads/receipt/2014/20140830/201f5415-bbe8-1e1b-e5ba-b3f08fbfbfd9.jpg', 'Uploads/receipt/2014/20140830/c0a65461-d861-d192-d36d-c921911482e2_small.jpg', null, '1409369918', '1409369918');
INSERT INTO `t_footprints` VALUES ('136', '1050525056', '8', '10002', '2', '2', '3', 'Others', '120.00', '6.00', '9.60', '5', '8', 'Uploads/receipt/2014/20140830/0bbfe44b-1be8-7171-0c2b-958da9166000.jpg', 'Uploads/receipt/2014/20140830/8f373435-efbb-3b19-b71c-dfbd24864f0c_small.jpg', null, '1409369922', '1409369922');
INSERT INTO `t_footprints` VALUES ('137', '1054564955', '8', '10002', '2', '2', '3', 'Refunded', '130.00', '32.50', '39.00', '25', '30', 'Uploads/receipt/2014/20140830/95ac643f-9ab6-ff4b-9249-af9916508636.jpg', 'Uploads/receipt/2014/20140830/649affb8-61ec-f36d-81df-ac60afecaa8e_small.jpg', null, '1409369926', '1409369926');
INSERT INTO `t_footprints` VALUES ('138', '1010299102', '1', '10012', '3', '1', '2', null, '1843.00', '0.00', '165.87', '0', '9', 'Uploads/receipt/2014/20140830/b1702224-dffa-1cff-b4cd-5041460df69d.jpg', 'Uploads/receipt/2014/20140830/8be6e765-d2e8-2635-01f9-37360a4bbfa6_small.jpg', null, '1409377359', '1409377359');
INSERT INTO `t_footprints` VALUES ('139', '1010010251', '8', '10032', '3', '1', '2', null, '50000.00', '0.00', '0.00', '10', '15', 'Uploads/receipt/2014/20140830/996a4fe6-81f2-fb71-6d0b-43eae470afb0.jpg', 'Uploads/receipt/2014/20140830/f93b7d5d-81ee-f85c-40f4-2fc7c1802c62_small.jpg', '1409122121', '1409381085', '1409381085');
INSERT INTO `t_footprints` VALUES ('140', '1010110150', '1', '10012', '4', '1', '4', null, '1843.00', '147.44', '165.87', '8', '9', 'Uploads/receipt/2014/20140830/3caf8d06-b94f-a116-a29c-90ae687b95aa.jpg', 'Uploads/receipt/2014/20140830/0f5d6b8d-b530-77b6-cdd2-aeaa5224fcaf_small.jpg', null, '1409383454', '1409383454');
INSERT INTO `t_footprints` VALUES ('141', '1057975655', '8', '10032', '4', '1', '4', null, '160030.00', '40007.50', '48009.00', '25', '30', 'Uploads/receipt/2014/20140830/06606598-747d-13b1-249d-a8239bfefe90.jpg', 'Uploads/receipt/2014/20140830/99249f3d-83a6-7438-0685-0ba4a4231303_small.jpg', null, '1409389849', '1409389849');
INSERT INTO `t_footprints` VALUES ('142', '1048521005', '8', '10038', '4', '1', '4', null, '85280.00', '21320.00', '25584.00', '25', '30', 'Uploads/receipt/2014/20140830/6eb92e50-86b7-6e4f-fd81-435a93866c8d.jpg', 'Uploads/receipt/2014/20140830/254dbb9b-0ace-b17a-dbd0-2104829faf55_small.jpg', null, '1409394128', '1409394128');
INSERT INTO `t_footprints` VALUES ('143', '1048539955', '8', '10004', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409450560', '1409450560');
INSERT INTO `t_footprints` VALUES ('144', '1049985750', '8', '10039', '4', '1', '4', null, '260.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140831/6c1a6698-22c7-df5f-cfee-7df409c4e26a.jpg', 'Uploads/receipt/2014/20140831/346d3c41-baf7-abc5-2c73-d9f2feee499c_small.jpg', '1409471354', '1409450641', '1409450641');
INSERT INTO `t_footprints` VALUES ('145', '1049525753', '8', '10039', '4', '1', '4', null, '400.00', '0.00', '0.00', '12', '12', 'Uploads/receipt/2014/20140831/233239be-d361-5539-4ba5-09c6e477cbe1.jpg', 'Uploads/receipt/2014/20140831/9398a257-fc8e-77cf-6b2e-c1d6321c61ab_small.jpg', '1409414400', '1409451073', '1409451073');
INSERT INTO `t_footprints` VALUES ('146', '1010299485', '8', '10003', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140831/8aa36995-4556-72dd-1f1d-aefa1febcb1f.jpg', 'Uploads/receipt/2014/20140831/1611114a-6ae8-87a4-2890-9929f966c22d_small.jpg', null, '1409451599', '1409451599');
INSERT INTO `t_footprints` VALUES ('147', '1097975549', '8', '10003', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140831/d664c343-116c-3ca7-4417-a56d0e2cd381.jpg', 'Uploads/receipt/2014/20140831/432ab651-65d2-c901-5296-48d9f8f2ecc5_small.jpg', null, '1409451914', '1409451914');
INSERT INTO `t_footprints` VALUES ('148', '1051565757', '8', '10003', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140831/1c8eea65-d373-8762-1578-8da253f4de6a.jpg', 'Uploads/receipt/2014/20140831/d872e536-3bae-eb94-636b-a4d4d61c444c_small.jpg', null, '1409452387', '1409452387');
INSERT INTO `t_footprints` VALUES ('149', '1051995510', '8', '10003', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140831/60014993-8cf9-5f9d-8997-01c06755f8a0.jpg', 'Uploads/receipt/2014/20140831/74024aa7-8e4b-7218-f291-a6ec5a012531_small.jpg', null, '1409452579', '1409452579');
INSERT INTO `t_footprints` VALUES ('150', '1054551025', '8', '10003', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140831/5e4f429a-4ad0-db99-0deb-0e6f5802378e.jpg', 'Uploads/receipt/2014/20140831/0ee36c20-3f97-7a3c-8271-a9438b9cd5db_small.jpg', null, '1409452710', '1409452710');
INSERT INTO `t_footprints` VALUES ('151', '1054101975', '8', '10003', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140831/bfbb41d2-3281-a6dc-18da-fa6fc2db8b62.jpg', 'Uploads/receipt/2014/20140831/944ba455-9322-e76d-7327-469b6bd9affe_small.jpg', null, '1409452822', '1409452822');
INSERT INTO `t_footprints` VALUES ('152', '1010052565', '8', '10003', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140831/cb474b54-4fc6-cafb-c2f7-a63bcedecab6.jpg', 'Uploads/receipt/2014/20140831/6a7c8603-18ac-ade2-511b-0f8346c1e5b7_small.jpg', null, '1409453021', '1409453021');
INSERT INTO `t_footprints` VALUES ('153', '1051100100', '8', '10037', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140831/002e3995-358e-347e-ccb4-ff2cbd85bf08.jpg', 'Uploads/receipt/2014/20140831/92505508-c03c-a8e6-a5df-d589073281a2_small.jpg', null, '1409455411', '1409455411');
INSERT INTO `t_footprints` VALUES ('154', '1097559855', '8', '10037', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140831/a93c66ff-0a2d-060c-dba5-569e34133532.jpg', 'Uploads/receipt/2014/20140831/b53b8734-0564-c8d7-ec9f-c71d41d76d91_small.jpg', null, '1409455930', '1409455930');
INSERT INTO `t_footprints` VALUES ('155', '1053575152', '1', '10041', '4', '1', '4', null, '461.00', '32.27', '41.49', '7', '9', 'Uploads/receipt/2014/20140831/efffcc90-7d17-4b59-a4c4-7092b8972bee.jpg', 'Uploads/receipt/2014/20140831/cc171a1b-0b36-b80d-2e16-214c6f53c047_small.jpg', '1409414400', '1409455941', '1409455941');
INSERT INTO `t_footprints` VALUES ('156', '1054535157', '8', '10040', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409457030', '1409457030');
INSERT INTO `t_footprints` VALUES ('157', '1010254501', '8', '10040', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409457135', '1409457135');
INSERT INTO `t_footprints` VALUES ('158', '1098481015', '8', '10037', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140831/e039d85e-5b74-6474-657d-aa2353ca55e2.jpg', 'Uploads/receipt/2014/20140831/f985a5aa-9c56-171a-ba78-8a4ffa7aecd3_small.jpg', null, '1409457531', '1409457531');
INSERT INTO `t_footprints` VALUES ('159', '1057575010', '8', '10037', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140831/f304299b-b009-d5b6-f466-988c72379aaf.jpg', 'Uploads/receipt/2014/20140831/7977090e-1fc2-3451-6e0b-ed578a05fc53_small.jpg', null, '1409457609', '1409457609');
INSERT INTO `t_footprints` VALUES ('160', '1098989752', '8', '10037', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140831/662b2977-caf2-dc88-4a60-0652cd2d6e55.jpg', 'Uploads/receipt/2014/20140831/34230b37-9ead-815b-3ded-e75a73bf7ed9_small.jpg', null, '1409457835', '1409457835');
INSERT INTO `t_footprints` VALUES ('161', '1053100551', '8', '10037', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140831/317a04bd-516e-ba38-40e5-b4c80fc37d6c.jpg', 'Uploads/receipt/2014/20140831/86470ec1-2a4e-2506-8963-4d8d7782bd37_small.jpg', null, '1409458261', '1409458261');
INSERT INTO `t_footprints` VALUES ('162', '1098101535', '8', '10037', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140831/60a9e308-5f3b-67a4-3450-7e36eb86548a.jpg', 'Uploads/receipt/2014/20140831/db1d9479-ef35-8d60-66f4-7fda59cfa109_small.jpg', null, '1409458795', '1409458795');
INSERT INTO `t_footprints` VALUES ('163', '1098505649', '8', '10037', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140831/e1299700-f8d1-f199-d002-20a24a2b4928.jpg', 'Uploads/receipt/2014/20140831/34daa568-c622-c053-9e6e-101567755b07_small.jpg', null, '1409458891', '1409458891');
INSERT INTO `t_footprints` VALUES ('164', '1050575149', '8', '10037', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140831/44ce6b6a-8332-bae0-0389-3c8b362b2895.jpg', 'Uploads/receipt/2014/20140831/6c46bf20-b70e-28b9-9001-6208cd7afb12_small.jpg', null, '1409459010', '1409459010');
INSERT INTO `t_footprints` VALUES ('165', '1050979757', '8', '10037', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140831/33508b63-d4ff-ce06-c0cb-a1f8b7d9c3c2.jpg', 'Uploads/receipt/2014/20140831/2b98836d-a4b7-20bc-9fb7-a001088c097b_small.jpg', null, '1409459218', '1409459218');
INSERT INTO `t_footprints` VALUES ('166', '1051995252', '8', '10037', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140831/eebeb03d-42b8-dd08-c417-fe0be6b7c854.jpg', 'Uploads/receipt/2014/20140831/54d115de-a3cd-5fe8-c90a-0b5ad21157da_small.jpg', null, '1409459299', '1409459299');
INSERT INTO `t_footprints` VALUES ('167', '1097509951', '8', '10037', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140831/c1cd1672-b2f8-9bff-f832-e83d80a2ed79.jpg', 'Uploads/receipt/2014/20140831/050e58b4-f235-38ad-ad50-14c0a98debfc_small.jpg', null, '1409459610', '1409459610');
INSERT INTO `t_footprints` VALUES ('168', '1055999757', '8', '10041', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140903/81413c0c-b4ee-8eb4-bb35-811dd3a42bd8.jpg', 'Uploads/receipt/2014/20140903/1fdefe9c-8d40-93de-25fb-a16870210b71_small.jpg', null, '1409462935', '1409462935');
INSERT INTO `t_footprints` VALUES ('169', '1055555210', '8', '10037', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140831/40e9259d-e40b-57ad-2035-1384b2edfb2a.jpg', 'Uploads/receipt/2014/20140831/72e792ef-2fa3-2ef3-77db-e338c2410793_small.jpg', null, '1409464471', '1409464471');
INSERT INTO `t_footprints` VALUES ('170', '1010210249', '1', '10039', '2', '1', '1', null, '23959.00', '191.00', '215.00', '8', '9', 'Uploads/receipt/2014/20140831/6b399f4f-e3a8-2496-daa5-1926257d9883.jpg', 'Uploads/receipt/2014/20140831/91813b2d-0a3e-d358-d591-2df606654d56_small.jpg', null, '1409472991', '1409472991');
INSERT INTO `t_footprints` VALUES ('171', '1099549897', '1', '10039', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409473004', '1409473004');
INSERT INTO `t_footprints` VALUES ('172', '1098509948', '1', '10039', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409473035', '1409473035');
INSERT INTO `t_footprints` VALUES ('173', '1010250564', '8', '10039', '4', '2', '4', 'Receipt Unclear', '10530.00', '1579.50', '2106.00', '15', '20', 'Uploads/receipt/2014/20140831/b7102467-7168-279f-479e-5d08244d2707.jpg', 'Uploads/receipt/2014/20140831/a71a6c34-9800-ba2c-fb0f-f6f8a0974297_small.jpg', '1409414400', '1409473311', '1409473311');
INSERT INTO `t_footprints` VALUES ('174', '1054499853', '8', '10039', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409473318', '1409473318');
INSERT INTO `t_footprints` VALUES ('175', '1054575251', '8', '10039', '4', '1', '4', null, '130.00', '1.00', '2.00', '13', '20', 'Uploads/receipt/2014/20140831/0a036312-992f-b610-d822-35c83de39401.jpg', 'Uploads/receipt/2014/20140831/061730f0-cb1c-58a3-bb3e-1f3fd7998723_small.jpg', '1409414400', '1409473334', '1409473334');
INSERT INTO `t_footprints` VALUES ('176', '1056495610', '8', '10037', '4', '1', '4', null, '130.00', '16.90', '26.00', '13', '20', 'Uploads/receipt/2014/20140831/b13f60a1-6336-d4d2-737b-76effe070a8b.jpg', 'Uploads/receipt/2014/20140831/d00871a4-5c9e-9e76-4b13-41c20842e2ff_small.jpg', null, '1409474776', '1409474776');
INSERT INTO `t_footprints` VALUES ('177', '1048514898', '1', '10014', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140901/1e27b5d5-b87a-3658-415f-6011558208c7.jpg', 'Uploads/receipt/2014/20140901/bc5d6c86-1711-9220-f10c-d97c9755e4b9_small.jpg', null, '1409485632', '1409485632');
INSERT INTO `t_footprints` VALUES ('178', '1057511019', '5', '10003', '4', '1', '4', null, '462000.00', '3.00', '3.00', '7', '7', 'Uploads/receipt/2014/20140901/b7d57972-8131-bf42-dd32-e20b0907baa0.jpg', 'Uploads/receipt/2014/20140901/a82642d6-cd34-0e18-b114-28fb4775d729_small.jpg', null, '1409502617', '1409502617');
INSERT INTO `t_footprints` VALUES ('179', '1098559910', '1', '10049', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409514491', '1409514491');
INSERT INTO `t_footprints` VALUES ('180', '1048975753', '12', '10039', '2', '1', '2', null, '20000000.00', '10.00', '20.00', '500', '1', 'Uploads/receipt/2014/20140901/eb3356dc-dd51-a881-0b40-e875f64d260f.jpg', 'Uploads/receipt/2014/20140901/44792e58-fbd5-c577-f377-d188ba28e1dc_small.jpg', '1409500800', '1409538080', '1409538080');
INSERT INTO `t_footprints` VALUES ('181', '1056551011', '12', '10039', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140901/ad0ca1fc-05be-ab7b-6471-799e1f0d1873.jpg', 'Uploads/receipt/2014/20140901/b5adb274-5448-00c5-c314-823f65284048_small.jpg', '1409500800', '1409540120', '1409540120');
INSERT INTO `t_footprints` VALUES ('182', '1010057989', '12', '10037', '4', '1', '4', null, '10000000.00', '5.00', '10.00', '500', '1', 'Uploads/receipt/2014/20140901/157283eb-0fc5-e622-f538-2f151f8a2781.jpg', 'Uploads/receipt/2014/20140901/66a8734c-8300-b667-60a8-ae1350213acc_small.jpg', '1409500800', '1409540445', '1409540445');
INSERT INTO `t_footprints` VALUES ('183', '1098565697', '8', '10039', '4', '1', '4', null, '130.00', '19.50', '26.00', '15', '20', 'Uploads/receipt/2014/20140901/4ea2932e-8718-3ffb-49f2-0e2cccb170e5.jpg', 'Uploads/receipt/2014/20140901/82a8997d-7f25-dde2-3d06-1b52d1ce1076_small.jpg', null, '1409542075', '1409542075');
INSERT INTO `t_footprints` VALUES ('184', '1099979755', '8', '10039', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140901/7d87656e-07b2-493c-cb3b-bcc1a4dfe3de.jpg', 'Uploads/receipt/2014/20140901/6fdc3df5-9b5e-dc84-0655-a1c5fe49ee5f_small.jpg', null, '1409542316', '1409542316');
INSERT INTO `t_footprints` VALUES ('185', '1054971005', '8', '10037', '4', '1', '4', null, '1430.00', '21.00', '28.00', '15', '20', 'Uploads/receipt/2014/20140901/d3e62888-22e5-f710-e663-ae4eeb7dd42e.jpg', 'Uploads/receipt/2014/20140901/6ed036e7-b31a-9103-8381-5f178b67a718_small.jpg', null, '1409542806', '1409542806');
INSERT INTO `t_footprints` VALUES ('186', '1050971005', '8', '10037', '4', '1', '4', null, '130.00', '19.50', '26.00', '15', '20', 'Uploads/receipt/2014/20140901/fd5b591c-62f4-f4ef-5290-4a0f05e0d4ab.jpg', 'Uploads/receipt/2014/20140901/04d1dbad-3c18-acaf-7799-3da0b7f89d6a_small.jpg', null, '1409543122', '1409543122');
INSERT INTO `t_footprints` VALUES ('187', '1054559850', '12', '10039', '4', '1', '4', null, '10000000.00', '5.00', '10.00', '500', '1', 'Uploads/receipt/2014/20140901/5b01be0e-21f1-3d97-86ef-c7b8218ffa91.jpg', 'Uploads/receipt/2014/20140901/17378d03-1045-d919-a26a-bd533ba0723a_small.jpg', '1409500800', '1409544070', '1409544070');
INSERT INTO `t_footprints` VALUES ('188', '1054485350', '12', '10039', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409551286', '1409551286');
INSERT INTO `t_footprints` VALUES ('189', '1098100561', '12', '10012', '4', '1', '4', null, '190000000.00', '95.00', '190.00', '500', '1', 'Uploads/receipt/2014/20140901/b8718682-431b-2261-40cf-cc2c45c10a47jpg', 'Uploads/receipt/2014/20140901/1dffaabb-d45a-0a69-2564-15e41c4279e9_smalljpg', null, '1409551451', '1409551451');
INSERT INTO `t_footprints` VALUES ('190', '1055100561', '12', '10012', '4', '1', '4', null, '210000000.00', '105.00', '210.00', '500', '1', 'Uploads/receipt/2014/20140901/dafa5690-a90a-e12e-3ba7-1c2e051292d2jpg', 'Uploads/receipt/2014/20140901/38fce673-36d2-e146-22d6-acbd1618e22d_smalljpg', null, '1409551463', '1409551463');
INSERT INTO `t_footprints` VALUES ('191', '1010299100', '12', '10012', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409551471', '1409551471');
INSERT INTO `t_footprints` VALUES ('192', '1054491015', '12', '10012', '4', '1', '4', null, '110000000.00', '55.00', '110.00', '500', '1', 'Uploads/receipt/2014/20140901/b6226d97-62c8-658f-6349-f89595ecd339jpg', 'Uploads/receipt/2014/20140901/c09383d9-5c5e-6095-0562-94b5f743677c_smalljpg', null, '1409551478', '1409551478');
INSERT INTO `t_footprints` VALUES ('193', '1098100529', '12', '10012', '2', '1', '2', null, '10000000.00', '5.00', '10.00', '500', '1', 'Uploads/receipt/2014/20140901/3f723adf-a272-f1b1-8d85-6c50e334ea09jpg', 'Uploads/receipt/2014/20140901/1773e642-8d5a-de2d-0a78-d2ba142bc797_smalljpg', null, '1409552075', '1409552075');
INSERT INTO `t_footprints` VALUES ('194', '1010152100', '8', '10037', '4', '1', '4', null, '2210.00', '33.00', '44.00', '15', '20', 'Uploads/receipt/2014/20140901/3a981dba-8e7e-8ea4-bcfa-aa5fad018d74.jpg', 'Uploads/receipt/2014/20140901/68f5d71c-a3bd-815b-b638-ca30d8307428_small.jpg', null, '1409552974', '1409552974');
INSERT INTO `t_footprints` VALUES ('195', '1057494953', '8', '10037', '4', '1', '4', null, '130.00', '1.00', '2.00', '15', '20', 'Uploads/receipt/2014/20140901/6bfea692-ab16-a81f-a461-45a2b0184c2f.jpg', 'Uploads/receipt/2014/20140901/2e436b7c-f66e-a166-56a9-2433a0584e2b_small.jpg', null, '1409554393', '1409554393');
INSERT INTO `t_footprints` VALUES ('196', '1054485698', '12', '10012', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409557510', '1409557510');
INSERT INTO `t_footprints` VALUES ('197', '1051549799', '12', '10012', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409557539', '1409557539');
INSERT INTO `t_footprints` VALUES ('198', '1050511019', '12', '10012', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409557554', '1409557554');
INSERT INTO `t_footprints` VALUES ('199', '1010298565', '12', '10012', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409557567', '1409557567');
INSERT INTO `t_footprints` VALUES ('200', '1051541024', '12', '10012', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409557571', '1409557571');
INSERT INTO `t_footprints` VALUES ('201', '1056514853', '12', '10012', '2', '2', '3', '', '120000000.00', '60.00', '120.00', '500', '1', 'Uploads/receipt/2014/20140901/81ab703f-44ab-371c-9338-e3f6aa4b0767jpg', 'Uploads/receipt/2014/20140901/f1fa3e25-935c-d439-50eb-e32fa2da0ea3_smalljpg', null, '1409558392', '1409558392');
INSERT INTO `t_footprints` VALUES ('202', '1097985757', '12', '10012', '4', '1', '4', null, '130000000.00', '65.00', '130.00', '500', '1', 'Uploads/receipt/2014/20140901/9169df39-9096-881c-7b64-4b2831ff2eccjpg', 'Uploads/receipt/2014/20140901/b3f0c28b-789f-6d75-d519-09785b48d1b8_smalljpg', null, '1409558410', '1409558410');
INSERT INTO `t_footprints` VALUES ('203', '1055495553', '12', '10012', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140903/a15c7724-f103-529b-8cd8-f77919b53ecb.jpg', 'Uploads/receipt/2014/20140903/b37a6ad9-67f2-13eb-c372-bf437bf64c64_small.jpg', null, '1409558423', '1409558423');
INSERT INTO `t_footprints` VALUES ('204', '1098995748', '12', '10012', '4', '1', '4', null, '310000000.00', '155.00', '310.00', '500', '1', 'Uploads/receipt/2014/20140902/b7b96244-5000-ac49-0558-f3f817ff66d4.jpg', 'Uploads/receipt/2014/20140902/41f98473-2754-f3e8-7d54-a89fa9198ec0_small.jpg', '1409831894', '1409560875', '1409832629');
INSERT INTO `t_footprints` VALUES ('205', '1099555697', '12', '10012', '2', '2', '3', '', '120000000.00', '60.00', '120.00', '500', '1', 'Uploads/receipt/2014/20140902/93f78759-0451-616b-66cd-d7ae8f97a44f.jpg', 'Uploads/receipt/2014/20140902/8a1163c4-f122-ee28-7c54-8f00cef60f1c_small.jpg', null, '1409561068', '1409828350');
INSERT INTO `t_footprints` VALUES ('206', '1097575654', '12', '10012', '4', '1', '4', null, '10000000.00', '50000000.00', '100000000.00', '500', '1000', 'Uploads/receipt/2014/20140901/39d0f53e-9783-cd99-a270-c0617a2dd53f.jpg', 'Uploads/receipt/2014/20140901/36e1c5dd-95c8-b0f9-0eb7-bf36de78cd1a_small.jpg', null, '1409561754', '1409823689');
INSERT INTO `t_footprints` VALUES ('207', '1099541025', '12', '10039', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409562428', '1409562428');
INSERT INTO `t_footprints` VALUES ('208', '1057555310', '12', '10039', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409562457', '1409562457');
INSERT INTO `t_footprints` VALUES ('209', '1050521015', '12', '10039', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409562578', '1409562578');
INSERT INTO `t_footprints` VALUES ('210', '1050101101', '12', '10039', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409562594', '1409562594');
INSERT INTO `t_footprints` VALUES ('211', '1049545699', '12', '10039', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409562625', '1409562625');
INSERT INTO `t_footprints` VALUES ('212', '1054545755', '12', '10039', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409562710', '1409562710');
INSERT INTO `t_footprints` VALUES ('213', '1050521011', '5', '10003', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409566114', '1409566114');
INSERT INTO `t_footprints` VALUES ('214', '1051975549', '16', '10058', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409599683', '1409599683');
INSERT INTO `t_footprints` VALUES ('215', '1057101565', '16', '10014', '3', '1', '2', null, '500.00', '0.00', '0.00', '10', '15', 'Uploads/receipt/2014/20140902/06a8dc6b-5d31-9c2a-4f81-7089ad9af0c8.jpg', 'Uploads/receipt/2014/20140902/906e5924-ab12-38d4-fe7c-9ffa8f458672_small.jpg', '1409590633', '1409615609', '1409615609');
INSERT INTO `t_footprints` VALUES ('216', '1010250545', '12', '10060', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140903/453f0228-8250-86f5-e8b0-241ec24eda6d.jpg', 'Uploads/receipt/2014/20140903/ada94648-06d6-50e4-ab60-81a714945a55_small.jpg', null, '1409627903', '1409627903');
INSERT INTO `t_footprints` VALUES ('217', '1098985056', '12', '10060', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140903/cfa10cba-7319-f924-3885-11d70b6a0ce2.jpg', 'Uploads/receipt/2014/20140903/4248e22f-c85f-6c23-668a-c2862883ffb2_small.jpg', null, '1409627915', '1409627915');
INSERT INTO `t_footprints` VALUES ('218', '1051575256', '12', '10060', '4', '1', '4', null, '140000000.00', '70.00', '140.00', '500', '1', 'Uploads/receipt/2014/20140902/8ca3ff4d-b974-b913-67bb-9e1a089916ca.jpg', 'Uploads/receipt/2014/20140902/e1bed5b2-ea0d-23e7-0dc4-a2eab97b0b62_small.jpg', null, '1409632083', '1409632083');
INSERT INTO `t_footprints` VALUES ('219', '1010198571', '12', '10060', '4', '1', '4', null, '130000000.00', '65.00', '130.00', '500', '1', 'Uploads/receipt/2014/20140902/5df2e01f-9b61-ffe3-1da2-cb981606c758.jpg', 'Uploads/receipt/2014/20140902/6840738b-d91a-62da-aa24-0d507abf9740_small.jpg', '1409673600', '1409632094', '1409632094');
INSERT INTO `t_footprints` VALUES ('220', '1098564898', '1', '10060', '4', '1', '4', null, '3686.00', '294.88', '331.74', '8', '9', 'Uploads/receipt/2014/20140902/187e565a-6f95-7ad0-3de0-4044b5800376.jpg', 'Uploads/receipt/2014/20140902/b037e54f-e99e-39f1-769c-c484b5f88dca_small.jpg', null, '1409645211', '1409833856');
INSERT INTO `t_footprints` VALUES ('221', '1051100975', '1', '10061', '4', '1', '4', null, '20273.00', '1621.84', '1824.57', '8', '9', 'Uploads/receipt/2014/20140903/75321d77-6157-c115-59e8-6ede842e347c.jpg', 'Uploads/receipt/2014/20140903/e0fcece4-68fe-c0ed-b1db-f0b732612efd_small.jpg', '1409673600', '1409709907', '1409709907');
INSERT INTO `t_footprints` VALUES ('222', '1010252481', '1', '10061', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409709919', '1409709919');
INSERT INTO `t_footprints` VALUES ('223', '1056561015', '1', '10061', '1', '1', '1', null, '1843.00', '147.44', '165.87', '8', '9', '', '', null, '1409709928', '1409709928');
INSERT INTO `t_footprints` VALUES ('265', '1048499797', '1', '10041', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409823824', '1409823824');
INSERT INTO `t_footprints` VALUES ('264', '1010256575', '17', '10012', '2', '1', '1', null, '880.00', '70.40', '88.00', '8', '10', 'Uploads/receipt/2014/20140904/c206b2a2-73c4-37be-d159-85ae7a337ffe.jpg', 'Uploads/receipt/2014/20140904/8f910b45-5cd8-661e-0536-2062c77b7182_small.jpg', '1409821600', '1409821487', '1409827317');
INSERT INTO `t_footprints` VALUES ('263', '1099545055', '8', '10041', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140904/1fdbd085-18e6-6f7f-eae2-2945c9269d98.jpg', 'Uploads/receipt/2014/20140904/77f00cf2-1222-dcae-300c-5f8c4180ea4e_small.jpg', null, '1409818876', '1409818919');
INSERT INTO `t_footprints` VALUES ('262', '1010297555', '8', '10041', '3', '1', '2', null, '1430.00', '214.50', '286.00', '15', '20', 'Uploads/receipt/2014/20140904/e27451ba-f949-4c7b-c44a-78a5047ff6cb.jpg', 'Uploads/receipt/2014/20140904/493e6eda-1d0e-1123-c667-51d6691947d6_small.jpg', '1409819351', '1409818847', '1409914322');
INSERT INTO `t_footprints` VALUES ('261', '1049975653', '1', '10012', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409818561', '1409818561');
INSERT INTO `t_footprints` VALUES ('260', '1053100101', '12', '10012', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409818149', '1409818149');
INSERT INTO `t_footprints` VALUES ('266', '1052485652', '17', '10078', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409832180', '1409832180');
INSERT INTO `t_footprints` VALUES ('267', '1052559853', '1', '10012', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409832868', '1409832868');
INSERT INTO `t_footprints` VALUES ('268', '1010256535', '1', '10060', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409833647', '1409833647');
INSERT INTO `t_footprints` VALUES ('269', '1055571015', '12', '10060', '4', '1', '4', null, '510000000.00', '255.00', '510.00', '500', '1', 'Uploads/receipt/2014/20140904/58a8ef42-e12a-8ff1-3a20-fbee2b36556b.jpg', 'Uploads/receipt/2014/20140904/679eec54-3234-1870-94af-568142738950_small.jpg', null, '1409834455', '1409834708');
INSERT INTO `t_footprints` VALUES ('270', '1010148100', '12', '10060', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409884494', '1409884494');
INSERT INTO `t_footprints` VALUES ('271', '1010097514', '12', '10060', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409884685', '1409884685');
INSERT INTO `t_footprints` VALUES ('272', '1056539955', '17', '10060', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409885016', '1409885016');
INSERT INTO `t_footprints` VALUES ('273', '1056574998', '12', '10060', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409885032', '1409885032');
INSERT INTO `t_footprints` VALUES ('274', '1010256525', '12', '10060', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409885199', '1409885199');
INSERT INTO `t_footprints` VALUES ('275', '1098975350', '12', '10060', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409885259', '1409885259');
INSERT INTO `t_footprints` VALUES ('276', '1010110010', '12', '10060', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409885278', '1409885278');
INSERT INTO `t_footprints` VALUES ('277', '1051494854', '12', '10060', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409885299', '1409885299');
INSERT INTO `t_footprints` VALUES ('278', '1097505010', '12', '10082', '4', '1', '4', null, '110000000.00', '55.00', '110.00', '500', '1', 'Uploads/receipt/2014/20140905/61f2c958-4087-c5fd-2ffc-3d8e6551f9c5.jpg', 'Uploads/receipt/2014/20140905/22d4877b-2d9d-beea-5fbb-736041b0a4ec_small.jpg', null, '1409885994', '1409888667');
INSERT INTO `t_footprints` VALUES ('279', '1057975457', '12', '10061', '2', '1', '1', null, '210000000.00', '105.00', '210.00', '500', '1', 'Uploads/receipt/2014/20140905/95ba5e01-af2d-ba0f-1d10-845d0305a05a.jpg', 'Uploads/receipt/2014/20140905/5a76b7a6-b8e4-fbc5-f893-712bab618c80_small.jpg', null, '1409887145', '1409887165');
INSERT INTO `t_footprints` VALUES ('280', '1099101564', '12', '10061', '4', '1', '4', null, '310000000.00', '155.00', '310.00', '500', '1', 'Uploads/receipt/2014/20140905/e99dd3f4-ab0f-8cf5-bb03-ab7626cfc694.jpg', 'Uploads/receipt/2014/20140905/e5a14098-9756-4388-f884-a98d55cd2b0b_small.jpg', null, '1409887212', '1409887307');
INSERT INTO `t_footprints` VALUES ('281', '1056565553', '18', '10082', '4', '1', '4', null, '2310.00', '32.00', '36.00', '14', '16', 'Uploads/receipt/2014/20140905/ff395944-ea66-1706-17e9-ee2ac8110ca4.jpg', 'Uploads/receipt/2014/20140905/ba29527e-3057-ed49-54de-188407fbf4d9_small.jpg', null, '1409888184', '1409889056');
INSERT INTO `t_footprints` VALUES ('282', '1099515510', '12', '10086', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409900492', '1409900492');
INSERT INTO `t_footprints` VALUES ('283', '1097971019', '17', '10086', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409900954', '1409900954');
INSERT INTO `t_footprints` VALUES ('284', '1056529810', '12', '10087', '4', '1', '4', null, '110000000.00', '55.00', '110.00', '500', '1', 'Uploads/receipt/2014/20140905/dbf501ef-f2bd-98fb-b854-c16542a807f9.jpg', 'Uploads/receipt/2014/20140905/e231369c-0396-6fd1-0eb4-30727879528e_small.jpg', null, '1409901432', '1409902417');
INSERT INTO `t_footprints` VALUES ('285', '1053555410', '17', '10088', '4', '1', '4', null, '8080.00', '64.00', '80.00', '8', '10', 'Uploads/receipt/2014/20140905/9b14c53f-710c-a4fd-4156-a4e963236c1a.jpg', 'Uploads/receipt/2014/20140905/7f9351fa-a29f-0ae1-0929-653b15a93639_small.jpg', null, '1409902597', '1409903001');
INSERT INTO `t_footprints` VALUES ('286', '1053545754', '12', '10087', '4', '1', '4', null, '510000000.00', '255.00', '510.00', '500', '1', 'Uploads/receipt/2014/20140905/292afc86-205e-eb66-735b-4c1e34f1e433.jpg', 'Uploads/receipt/2014/20140905/5f1e3ca8-e375-9c99-0181-66525b3c740e_small.jpg', null, '1409903093', '1409903328');
INSERT INTO `t_footprints` VALUES ('287', '1051515798', '3', '10002', '3', '1', '2', null, '7360.00', '588.80', '662.40', '8', '9', 'Uploads/receipt/2014/20140905/f19746ce-73bd-d6df-e823-b1461492b463.jpg', 'Uploads/receipt/2014/20140905/822d55ff-b46e-31f7-a2b8-9075fd87f1e4_small.jpg', null, '1409907619', '1409910068');
INSERT INTO `t_footprints` VALUES ('288', '1010253495', '12', '10093', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409909487', '1409909487');
INSERT INTO `t_footprints` VALUES ('289', '1051539755', '12', '10093', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409909539', '1409909539');
INSERT INTO `t_footprints` VALUES ('290', '1052974852', '12', '10093', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409909588', '1409909588');
INSERT INTO `t_footprints` VALUES ('291', '1054555349', '1', '10093', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409909654', '1409909654');
INSERT INTO `t_footprints` VALUES ('292', '1097971001', '12', '10093', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409909978', '1409909978');
INSERT INTO `t_footprints` VALUES ('293', '1050979752', '12', '10041', '4', '1', '4', null, '10000000.00', '50000000.00', '100000000.00', '500', '1000', 'Uploads/receipt/2014/20140905/df66b254-7e97-aac4-c90b-8027818b5551.jpg', 'Uploads/receipt/2014/20140905/19d90349-fb86-5bb6-d6a9-ab7a56fd02be_small.jpg', null, '1409910050', '1409910324');
INSERT INTO `t_footprints` VALUES ('294', '1054561015', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409910086', '1409910086');
INSERT INTO `t_footprints` VALUES ('295', '1052519856', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409910132', '1409910132');
INSERT INTO `t_footprints` VALUES ('296', '1051100975', '12', '10093', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409910931', '1409910931');
INSERT INTO `t_footprints` VALUES ('297', '1051975657', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409911219', '1409911219');
INSERT INTO `t_footprints` VALUES ('298', '1052484848', '12', '10090', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409911396', '1409911396');
INSERT INTO `t_footprints` VALUES ('299', '1010250559', '12', '10090', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409911423', '1409911423');
INSERT INTO `t_footprints` VALUES ('300', '1049565049', '3', '10095', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409911505', '1409911505');
INSERT INTO `t_footprints` VALUES ('301', '1055100504', '12', '10090', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409911655', '1409911655');
INSERT INTO `t_footprints` VALUES ('302', '1052569956', '3', '10002', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409912148', '1409912148');
INSERT INTO `t_footprints` VALUES ('303', '1052531025', '12', '10012', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409912276', '1409912276');
INSERT INTO `t_footprints` VALUES ('304', '1010052495', '12', '10012', '4', '1', '4', null, '10000000.00', '50000000.00', '100000000.00', '500', '1000', 'Uploads/receipt/2014/20140905/d15cb1e7-b2a9-925f-2e03-b9eaf25529d2.jpg', 'Uploads/receipt/2014/20140905/630e46e3-5c58-f530-8434-b99553bd0026_small.jpg', null, '1409912333', '1409916245');
INSERT INTO `t_footprints` VALUES ('305', '1097515749', '12', '10090', '1', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', '', '', null, '1409914586', '1409914586');
INSERT INTO `t_footprints` VALUES ('306', '1056999897', '12', '10012', '2', '1', '1', null, '0.00', '0.00', '0.00', '0', '0', 'Uploads/receipt/2014/20140905/4be61f0f-acd9-097a-0fdb-863630e6339f.jpg', 'Uploads/receipt/2014/20140905/50d245e8-753e-c515-e199-4bd26e998152_small.jpg', null, '1409914728', '1409916091');
INSERT INTO `t_footprints` VALUES ('307', '1097509857', '18', '10087', '4', '1', '4', null, '1050.00', '147.00', '168.00', '14', '16', 'Uploads/receipt/2014/20140905/75968cd8-8f57-bbf0-02f3-9e839fcfd5aa.jpg', 'Uploads/receipt/2014/20140905/a15aa2bc-e27f-70dc-ad32-f9b47429bb05_small.jpg', '1409915147', '1409915034', '1409915423');

-- ----------------------------
-- Table structure for `t_footprints_commodity`
-- ----------------------------
DROP TABLE IF EXISTS `t_footprints_commodity`;
CREATE TABLE `t_footprints_commodity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT '0',
  `commodity_id` int(11) DEFAULT '0',
  `count_num` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_footprints_commodity
-- ----------------------------
INSERT INTO `t_footprints_commodity` VALUES ('1', '2', '15', '1');
INSERT INTO `t_footprints_commodity` VALUES ('2', '2', '16', '2');
INSERT INTO `t_footprints_commodity` VALUES ('3', '1', '15', '1');
INSERT INTO `t_footprints_commodity` VALUES ('4', '1', '16', '3');
INSERT INTO `t_footprints_commodity` VALUES ('5', '5', '3', '1');
INSERT INTO `t_footprints_commodity` VALUES ('6', '7', '2', '1');
INSERT INTO `t_footprints_commodity` VALUES ('7', '89', '15', '3');
INSERT INTO `t_footprints_commodity` VALUES ('8', '89', '16', '1');
INSERT INTO `t_footprints_commodity` VALUES ('9', '91', '15', '1');
INSERT INTO `t_footprints_commodity` VALUES ('10', '92', '2', '1');
INSERT INTO `t_footprints_commodity` VALUES ('11', '95', '15', '2');
INSERT INTO `t_footprints_commodity` VALUES ('12', '96', '15', '50');
INSERT INTO `t_footprints_commodity` VALUES ('13', '97', '15', '3');
INSERT INTO `t_footprints_commodity` VALUES ('14', '94', '6', '2');
INSERT INTO `t_footprints_commodity` VALUES ('15', '88', '6', '1');
INSERT INTO `t_footprints_commodity` VALUES ('16', '113', '15', '90');
INSERT INTO `t_footprints_commodity` VALUES ('17', '116', '15', '90');
INSERT INTO `t_footprints_commodity` VALUES ('18', '119', '15', '10');
INSERT INTO `t_footprints_commodity` VALUES ('19', '120', '15', '10');
INSERT INTO `t_footprints_commodity` VALUES ('20', '124', '6', '20');
INSERT INTO `t_footprints_commodity` VALUES ('21', '123', '6', '25');
INSERT INTO `t_footprints_commodity` VALUES ('22', '122', '6', '1');
INSERT INTO `t_footprints_commodity` VALUES ('23', '118', '4', '1');
INSERT INTO `t_footprints_commodity` VALUES ('24', '117', '4', '1');
INSERT INTO `t_footprints_commodity` VALUES ('25', '115', '4', '1');
INSERT INTO `t_footprints_commodity` VALUES ('26', '137', '15', '1');
INSERT INTO `t_footprints_commodity` VALUES ('27', '136', '16', '1');
INSERT INTO `t_footprints_commodity` VALUES ('28', '135', '15', '2');
INSERT INTO `t_footprints_commodity` VALUES ('29', '134', '16', '2');
INSERT INTO `t_footprints_commodity` VALUES ('30', '133', '15', '11');
INSERT INTO `t_footprints_commodity` VALUES ('31', '132', '16', '12');
INSERT INTO `t_footprints_commodity` VALUES ('32', '131', '15', '22');
INSERT INTO `t_footprints_commodity` VALUES ('33', '130', '15', '12');
INSERT INTO `t_footprints_commodity` VALUES ('34', '129', '15', '12');
INSERT INTO `t_footprints_commodity` VALUES ('35', '128', '15', '4');
INSERT INTO `t_footprints_commodity` VALUES ('36', '127', '16', '4');
INSERT INTO `t_footprints_commodity` VALUES ('37', '126', '15', '7');
INSERT INTO `t_footprints_commodity` VALUES ('38', '125', '15', '13');
INSERT INTO `t_footprints_commodity` VALUES ('39', '121', '2', '1');
INSERT INTO `t_footprints_commodity` VALUES ('40', '138', '2', '1');
INSERT INTO `t_footprints_commodity` VALUES ('41', '87', '4', '1');
INSERT INTO `t_footprints_commodity` VALUES ('42', '86', '4', '5');
INSERT INTO `t_footprints_commodity` VALUES ('43', '85', '4', '3');
INSERT INTO `t_footprints_commodity` VALUES ('44', '84', '4', '6');
INSERT INTO `t_footprints_commodity` VALUES ('45', '83', '4', '5');
INSERT INTO `t_footprints_commodity` VALUES ('46', '82', '4', '7');
INSERT INTO `t_footprints_commodity` VALUES ('47', '81', '4', '1');
INSERT INTO `t_footprints_commodity` VALUES ('48', '80', '4', '1');
INSERT INTO `t_footprints_commodity` VALUES ('49', '79', '4', '2');
INSERT INTO `t_footprints_commodity` VALUES ('50', '78', '4', '1');
INSERT INTO `t_footprints_commodity` VALUES ('51', '77', '4', '10');
INSERT INTO `t_footprints_commodity` VALUES ('52', '76', '4', '9');
INSERT INTO `t_footprints_commodity` VALUES ('53', '75', '4', '10');
INSERT INTO `t_footprints_commodity` VALUES ('54', '74', '4', '11');
INSERT INTO `t_footprints_commodity` VALUES ('55', '73', '4', '12');
INSERT INTO `t_footprints_commodity` VALUES ('56', '72', '4', '13');
INSERT INTO `t_footprints_commodity` VALUES ('57', '71', '4', '13');
INSERT INTO `t_footprints_commodity` VALUES ('58', '70', '4', '14');
INSERT INTO `t_footprints_commodity` VALUES ('59', '69', '4', '15');
INSERT INTO `t_footprints_commodity` VALUES ('60', '28', '4', '16');
INSERT INTO `t_footprints_commodity` VALUES ('61', '27', '4', '17');
INSERT INTO `t_footprints_commodity` VALUES ('62', '26', '4', '18');
INSERT INTO `t_footprints_commodity` VALUES ('63', '25', '4', '19');
INSERT INTO `t_footprints_commodity` VALUES ('64', '24', '4', '20');
INSERT INTO `t_footprints_commodity` VALUES ('65', '140', '2', '1');
INSERT INTO `t_footprints_commodity` VALUES ('66', '112', '2', '1');
INSERT INTO `t_footprints_commodity` VALUES ('67', '141', '15', '1231');
INSERT INTO `t_footprints_commodity` VALUES ('68', '142', '15', '656');
INSERT INTO `t_footprints_commodity` VALUES ('69', '155', '3', '1');
INSERT INTO `t_footprints_commodity` VALUES ('70', '6', '2', '1');
INSERT INTO `t_footprints_commodity` VALUES ('71', '175', '15', '1');
INSERT INTO `t_footprints_commodity` VALUES ('72', '173', '15', '81');
INSERT INTO `t_footprints_commodity` VALUES ('73', '176', '15', '1');
INSERT INTO `t_footprints_commodity` VALUES ('74', '180', '16', '2');
INSERT INTO `t_footprints_commodity` VALUES ('75', '182', '16', '1');
INSERT INTO `t_footprints_commodity` VALUES ('76', '183', '15', '1');
INSERT INTO `t_footprints_commodity` VALUES ('77', '185', '15', '11');
INSERT INTO `t_footprints_commodity` VALUES ('78', '186', '15', '1');
INSERT INTO `t_footprints_commodity` VALUES ('79', '187', '16', '1');
INSERT INTO `t_footprints_commodity` VALUES ('80', '189', '16', '19');
INSERT INTO `t_footprints_commodity` VALUES ('81', '190', '16', '21');
INSERT INTO `t_footprints_commodity` VALUES ('82', '192', '16', '11');
INSERT INTO `t_footprints_commodity` VALUES ('83', '194', '15', '17');
INSERT INTO `t_footprints_commodity` VALUES ('84', '193', '16', '1');
INSERT INTO `t_footprints_commodity` VALUES ('85', '195', '15', '1');
INSERT INTO `t_footprints_commodity` VALUES ('86', '201', '16', '12');
INSERT INTO `t_footprints_commodity` VALUES ('87', '202', '16', '13');
INSERT INTO `t_footprints_commodity` VALUES ('88', '178', '6', '1000');
INSERT INTO `t_footprints_commodity` VALUES ('89', '206', '16', '1');
INSERT INTO `t_footprints_commodity` VALUES ('90', '219', '16', '13');
INSERT INTO `t_footprints_commodity` VALUES ('91', '218', '16', '14');
INSERT INTO `t_footprints_commodity` VALUES ('92', '68', '4', '1');
INSERT INTO `t_footprints_commodity` VALUES ('93', '170', '2', '13');
INSERT INTO `t_footprints_commodity` VALUES ('94', '67', '4', '3');
INSERT INTO `t_footprints_commodity` VALUES ('95', '66', '4', '10');
INSERT INTO `t_footprints_commodity` VALUES ('96', '65', '4', '15');
INSERT INTO `t_footprints_commodity` VALUES ('97', '221', '2', '11');
INSERT INTO `t_footprints_commodity` VALUES ('98', '223', '2', '1');
INSERT INTO `t_footprints_commodity` VALUES ('99', '114', '4', '50');
INSERT INTO `t_footprints_commodity` VALUES ('100', '111', '4', '15');
INSERT INTO `t_footprints_commodity` VALUES ('101', '262', '15', '11');
INSERT INTO `t_footprints_commodity` VALUES ('102', '264', '17', '11');
INSERT INTO `t_footprints_commodity` VALUES ('103', '205', '16', '12');
INSERT INTO `t_footprints_commodity` VALUES ('104', '204', '16', '31');
INSERT INTO `t_footprints_commodity` VALUES ('105', '220', '2', '2');
INSERT INTO `t_footprints_commodity` VALUES ('106', '269', '16', '51');
INSERT INTO `t_footprints_commodity` VALUES ('107', '278', '16', '11');
INSERT INTO `t_footprints_commodity` VALUES ('108', '279', '16', '21');
INSERT INTO `t_footprints_commodity` VALUES ('109', '280', '16', '31');
INSERT INTO `t_footprints_commodity` VALUES ('110', '281', '18', '11');
INSERT INTO `t_footprints_commodity` VALUES ('111', '284', '16', '11');
INSERT INTO `t_footprints_commodity` VALUES ('112', '285', '17', '101');
INSERT INTO `t_footprints_commodity` VALUES ('113', '286', '16', '51');
INSERT INTO `t_footprints_commodity` VALUES ('114', '99', '4', '12');
INSERT INTO `t_footprints_commodity` VALUES ('115', '287', '4', '16');
INSERT INTO `t_footprints_commodity` VALUES ('116', '60', '4', '100');
INSERT INTO `t_footprints_commodity` VALUES ('117', '293', '16', '1');
INSERT INTO `t_footprints_commodity` VALUES ('118', '307', '18', '5');
INSERT INTO `t_footprints_commodity` VALUES ('119', '304', '16', '1');

-- ----------------------------
-- Table structure for `t_forget_password`
-- ----------------------------
DROP TABLE IF EXISTS `t_forget_password`;
CREATE TABLE `t_forget_password` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `check_code` varchar(300) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_forget_password
-- ----------------------------
INSERT INTO `t_forget_password` VALUES ('1', '252ddf90b4aa0535e57dc43a309df4f1', '10014', '1409263981', '0', '0');
INSERT INTO `t_forget_password` VALUES ('2', 'b064ae2351b40c6365911d65f81fd803', '10032', '1409368169', '1409368224', '1');
INSERT INTO `t_forget_password` VALUES ('3', '1b297517b5b10b07fd5ef7f68ecfe5dc', '10006', '1409371239', '0', '0');
INSERT INTO `t_forget_password` VALUES ('4', 'c982cfb2e17ad2199ccdf409c3654a15', '10008', '1409386166', '0', '0');
INSERT INTO `t_forget_password` VALUES ('5', '0e8ba70579a80577a344bfaca2a2e090', '10003', '1409485732', '0', '0');
INSERT INTO `t_forget_password` VALUES ('6', '0e07cffb8184985a1b65d3527ed4e4b2', '10063', '1409630014', '0', '0');

-- ----------------------------
-- Table structure for `t_global_rebate_settings`
-- ----------------------------
DROP TABLE IF EXISTS `t_global_rebate_settings`;
CREATE TABLE `t_global_rebate_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '全局返利设置ID',
  `money` float(11,2) DEFAULT '0.00' COMMENT '成为VIP用户的金额限制',
  `type` int(11) DEFAULT '1' COMMENT '货币类型（1、英镑;2、人民币）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_global_rebate_settings
-- ----------------------------
INSERT INTO `t_global_rebate_settings` VALUES ('1', '1000.00', '1');

-- ----------------------------
-- Table structure for `t_group`
-- ----------------------------
DROP TABLE IF EXISTS `t_group`;
CREATE TABLE `t_group` (
  `id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `url` varchar(25) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(1) unsigned DEFAULT '0',
  `sort` smallint(3) unsigned DEFAULT '0',
  `show` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_group
-- ----------------------------
INSERT INTO `t_group` VALUES ('2', 'Info', 'StoreManager', '讯息管理', '2013-10-08 17:35:10', null, '0', '2', '0');
INSERT INTO `t_group` VALUES ('3', 'Setting', 'AdminUser', '设置', '2013-10-08 17:35:13', null, '0', '1', '0');
INSERT INTO `t_group` VALUES ('4', 'Order', 'AllOrder', '订单管理', '2013-10-08 17:35:17', null, '0', '3', '0');
INSERT INTO `t_group` VALUES ('5', 'User', 'AllUser', '用户管理', '2013-10-08 17:35:21', null, '0', '4', '0');
INSERT INTO `t_group` VALUES ('12', 'Pay', 'ExchangeRate', '支付管理', '2014-07-21 17:32:13', '0000-00-00 00:00:00', '0', '5', '0');
INSERT INTO `t_group` VALUES ('14', 'UpdatePwd', 'UpdatePwd', '修改密码', null, '0000-00-00 00:00:00', '1', '0', '0');
INSERT INTO `t_group` VALUES ('15', 'Content', 'Setting', '内容管理', '2014-09-08 13:56:06', '0000-00-00 00:00:00', '0', '6', '0');

-- ----------------------------
-- Table structure for `t_help`
-- ----------------------------
DROP TABLE IF EXISTS `t_help`;
CREATE TABLE `t_help` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '帮助ID',
  `question` varchar(200) DEFAULT '' COMMENT '问题',
  `answer` text COMMENT '答案',
  `type` int(11) DEFAULT '1' COMMENT '类型（1：商家；2客户）',
  `create_time` int(11) DEFAULT '1' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_help
-- ----------------------------
INSERT INTO `t_help` VALUES ('1', '如何进行扫一扫！', '点击“未确认”标签，选择某个收据，点击“反对”按钮，弹出反对理由对话框，选择反对理由，而后点击确认提交。', '1', '1406188732');
INSERT INTO `t_help` VALUES ('2', '如何进行扫一扫！', '点击“未确认”标签，选择某个收据，点击“反对”按钮，弹出反对理由对话框，选择反对理由，而后点击确认提交。', '2', '1406188809');
INSERT INTO `t_help` VALUES ('5', '发撒法撒', '法撒法撒旦法撒发撒法撒旦发大水法萨芬撒方法', '2', '1406189656');
INSERT INTO `t_help` VALUES ('6', '怎么样修改密码？', '怎么样修改密码？怎么样修改密码？怎么样修改密码？怎么样修改密码？怎么样修改密码？怎么样修改密码？怎么样修改密码？怎么样修改密码？', '1', '1406544036');
INSERT INTO `t_help` VALUES ('7', '怎么找回密码？', '怎么找回密码？怎么找回密码？怎么找回密码？怎么找回密码？怎么找回密码？怎么找回密码？怎么找回密码？怎么找回密码？怎么找回密码？', '1', '1406544064');
INSERT INTO `t_help` VALUES ('8', '怎么联系我们？', '怎么联系我们？怎么联系我们？怎么联系我们？怎么联系我们？怎么联系我们？怎么联系我们？怎么联系我们？怎么联系我们？怎么联系我们？怎么联系我们？', '1', '1406544085');
INSERT INTO `t_help` VALUES ('9', '怎么搜索订单？', '怎么搜索订单？怎么搜索订单？怎么搜索订单？怎么搜索订单？怎么搜索订单？怎么搜索订单？怎么搜索订单？怎么搜索订单？怎么搜索订单？怎么搜索订单？', '1', '1406544101');
INSERT INTO `t_help` VALUES ('10', '怎么与顾客聊天？', '怎么与顾客聊天？怎么与顾客聊天？怎么与顾客聊天？怎么与顾客聊天？怎么与顾客聊天？怎么与顾客聊天？', '1', '1406544117');
INSERT INTO `t_help` VALUES ('11', '怎么和客服妹妹聊天？', '怎么和客服妹妹聊天？怎么和客服妹妹聊天？怎么和客服妹妹聊天？怎么和客服妹妹聊天？怎么和客服妹妹聊天？', '1', '1406544151');

-- ----------------------------
-- Table structure for `t_login_img`
-- ----------------------------
DROP TABLE IF EXISTS `t_login_img`;
CREATE TABLE `t_login_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '登录后图片轮换显示表索引',
  `img_name` varchar(200) DEFAULT NULL COMMENT '图片名称',
  `img_url` varchar(150) DEFAULT NULL COMMENT '图片路径',
  `m_img_url` varchar(150) DEFAULT NULL,
  `s_img_url` varchar(150) DEFAULT NULL,
  `img_start_date` int(11) DEFAULT NULL COMMENT '图片开始显示时间',
  `img_end_date` int(11) DEFAULT NULL COMMENT '图片结束显示时间',
  `type` int(11) DEFAULT '1' COMMENT '客户端类型（1、顾客端；2、商家端）',
  `img_create_time` int(11) DEFAULT NULL COMMENT '图片创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_login_img
-- ----------------------------
INSERT INTO `t_login_img` VALUES ('38', '引导图片1', 'Uploads/pic/loginImg/2014/20140409/5344f689dd8a8.png', 'Uploads/pic/loginImg/2014/20140409/m_5344f689dd8a8.png', 'Uploads/pic/loginImg/2014/20140409/s_5344f689dd8a8.png', null, null, '1', '1397028490');
INSERT INTO `t_login_img` VALUES ('39', '引导图片2', 'Uploads/pic/loginImg/2014/20140409/5344f6c138ba5.png', 'Uploads/pic/loginImg/2014/20140409/m_5344f6c138ba5.png', 'Uploads/pic/loginImg/2014/20140409/s_5344f6c138ba5.png', null, null, '1', '1397028545');
INSERT INTO `t_login_img` VALUES ('40', '引导图片3', 'Uploads/pic/loginImg/2014/20140409/5344f6dd92d33.png', 'Uploads/pic/loginImg/2014/20140409/m_5344f6dd92d33.png', 'Uploads/pic/loginImg/2014/20140409/s_5344f6dd92d33.png', null, null, '1', '1397028573');
INSERT INTO `t_login_img` VALUES ('42', '引导图片4', 'Uploads/pic/loginImg/2014/20140505/53672d81c037f.png', 'Uploads/pic/loginImg/2014/20140505/m_53672d81c037f.png', 'Uploads/pic/loginImg/2014/20140505/s_53672d81c037f.png', null, null, '1', '1399270786');
INSERT INTO `t_login_img` VALUES ('43', '商家端1', 'Uploads/pic/loginImg/2014/20140409/5344f689dd8a8.png', 'Uploads/pic/loginImg/2014/20140409/m_5344f689dd8a8.png', 'Uploads/pic/loginImg/2014/20140409/s_5344f689dd8a8.png', null, null, '2', '1397028490');
INSERT INTO `t_login_img` VALUES ('44', '商家端2', 'Uploads/pic/loginImg/2014/20140409/5344f6c138ba5.png', 'Uploads/pic/loginImg/2014/20140409/m_5344f6c138ba5.png', 'Uploads/pic/loginImg/2014/20140409/s_5344f6c138ba5.png', null, null, '2', '1397028545');
INSERT INTO `t_login_img` VALUES ('45', '商家端3', 'Uploads/pic/loginImg/2014/20140409/5344f6dd92d33.png', 'Uploads/pic/loginImg/2014/20140409/m_5344f6dd92d33.png', 'Uploads/pic/loginImg/2014/20140409/s_5344f6dd92d33.png', null, null, '2', '1397028573');
INSERT INTO `t_login_img` VALUES ('46', '商家端4', 'Uploads/pic/loginImg/2014/20140505/53672d81c037f.png', 'Uploads/pic/loginImg/2014/20140505/m_53672d81c037f.png', 'Uploads/pic/loginImg/2014/20140505/s_53672d81c037f.png', null, null, '2', '1399270786');

-- ----------------------------
-- Table structure for `t_node`
-- ----------------------------
DROP TABLE IF EXISTS `t_node`;
CREATE TABLE `t_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `url` varchar(50) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `sort` smallint(6) unsigned DEFAULT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `group_id` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=148 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_node
-- ----------------------------
INSERT INTO `t_node` VALUES ('49', 'read', 'read', '查看', '0', '', null, '30', '3', '0', '0');
INSERT INTO `t_node` VALUES ('40', 'Index', 'Index', '默认模块', '0', '', '1', '1', '2', '0', '0');
INSERT INTO `t_node` VALUES ('39', 'index', 'index', '列表', '0', '', null, '30', '3', '0', '0');
INSERT INTO `t_node` VALUES ('37', 'resume', 'resume', '恢复', '0', '', null, '30', '3', '0', '0');
INSERT INTO `t_node` VALUES ('36', 'forbid', 'forbid', '禁用', '0', '', null, '30', '3', '0', '0');
INSERT INTO `t_node` VALUES ('35', 'foreverdelete', 'foreverdelete', '删除', '0', '', null, '30', '3', '0', '0');
INSERT INTO `t_node` VALUES ('34', 'update', 'update', '更新', '0', '', null, '30', '3', '0', '0');
INSERT INTO `t_node` VALUES ('33', 'edit', 'edit', '编辑', '0', '', null, '30', '3', '0', '0');
INSERT INTO `t_node` VALUES ('32', 'insert', 'insert', '写入', '0', '', null, '30', '3', '0', '0');
INSERT INTO `t_node` VALUES ('31', 'add', 'add', '新增', '0', '', null, '30', '3', '0', '0');
INSERT INTO `t_node` VALUES ('30', 'Public', 'Public', '公共模块', '0', '', '2', '1', '2', '0', '0');
INSERT INTO `t_node` VALUES ('7', 'User', 'User', '用户管理', '0', '', '4', '1', '2', '0', '13');
INSERT INTO `t_node` VALUES ('6', 'Role', 'Role', '角色管理', '1', '', '3', '1', '2', '0', '13');
INSERT INTO `t_node` VALUES ('2', 'Node', 'Node', '节点管理', '1', '', '2', '1', '2', '0', '13');
INSERT INTO `t_node` VALUES ('1', '', 'Public', '首页', '1', '', null, '0', '1', '0', '1');
INSERT INTO `t_node` VALUES ('89', 'AdminUser', 'AdminUser', '后台用户管理', '0', null, '1', '1', '2', '0', '3');
INSERT INTO `t_node` VALUES ('90', 'ClauseByCustomer', 'ClauseByCustomer', '客户注册条款', '0', null, '3', '1', '2', '0', '3');
INSERT INTO `t_node` VALUES ('99', 'HelpForCustomer', 'HelpForCustomer', '客户帮助说明', '0', '', '4', '1', '2', '0', '3');
INSERT INTO `t_node` VALUES ('101', 'CustomerFeedback', 'CustomerFeedback', '客户APP反馈', '0', null, '5', '1', '2', '0', '3');
INSERT INTO `t_node` VALUES ('103', 'CustomerLOGO', 'CustomerLOGO', 'LOGO&Slogan', '1', null, '6', '1', '2', '0', '3');
INSERT INTO `t_node` VALUES ('105', 'ClauseByBusinesses', 'ClauseByBusinesses', '商家注册条款', '0', null, '7', '1', '2', '0', '3');
INSERT INTO `t_node` VALUES ('106', 'HelpForBusinesses', 'HelpForBusinesses', '商家帮助说明', '0', null, '8', '1', '2', '0', '3');
INSERT INTO `t_node` VALUES ('107', 'BusinessesFeedback', 'BusinessesFeedback', '商家APP反馈', '0', null, '9', '1', '2', '0', '3');
INSERT INTO `t_node` VALUES ('108', 'PartnerWithUs', 'PartnerWithUs', '加盟我们', '0', null, '10', '1', '2', '0', '3');
INSERT INTO `t_node` VALUES ('109', 'BusinessesLOGO', 'BusinessesLOGO', 'LOGO&Slogan', '1', null, '11', '1', '2', '0', '3');
INSERT INTO `t_node` VALUES ('110', 'StoreManager', 'StoreManager', '商店管理', '0', null, '1', '1', '2', '0', '2');
INSERT INTO `t_node` VALUES ('111', 'CommodityManager', 'CommodityManager', '商品管理', '0', null, '2', '1', '2', '0', '2');
INSERT INTO `t_node` VALUES ('112', 'PushToday', 'PushToday', '今日推送', '0', null, '3', '1', '2', '0', '2');
INSERT INTO `t_node` VALUES ('113', 'Slide', 'Slide', '幻灯片', '0', null, '4', '1', '2', '0', '2');
INSERT INTO `t_node` VALUES ('114', 'Brand', 'Brand', '品牌', '0', null, '5', '1', '2', '0', '2');
INSERT INTO `t_node` VALUES ('115', 'Category', 'Category', '种类', '0', null, '6', '1', '2', '0', '2');
INSERT INTO `t_node` VALUES ('116', 'City', 'City', '城市', '0', null, '7', '1', '2', '0', '2');
INSERT INTO `t_node` VALUES ('117', 'GlobalRebateSettings', 'GlobalRebateSettings', '全局返利设置', '0', null, '8', '1', '2', '0', '2');
INSERT INTO `t_node` VALUES ('118', 'AllOrder', 'AllOrder', '全部订单', '0', null, '1', '1', '2', '0', '4');
INSERT INTO `t_node` VALUES ('119', 'UploadReceipts', 'UploadReceipts', '上传收据', '0', null, '2', '1', '2', '0', '4');
INSERT INTO `t_node` VALUES ('120', 'WaitForConfirmation', 'WaitForConfirmation', '等待确认', '0', null, '3', '1', '2', '0', '4');
INSERT INTO `t_node` VALUES ('121', 'WaitingForTheRebate', 'WaitingForTheRebate', '等待回扣', '0', null, '4', '1', '2', '0', '4');
INSERT INTO `t_node` VALUES ('122', 'RebateSuccess', 'RebateSuccess', '回扣成功', '0', null, '5', '1', '2', '0', '4');
INSERT INTO `t_node` VALUES ('123', 'OrderFeedback', 'OrderFeedback', '订单反馈', '0', null, '6', '1', '2', '0', '4');
INSERT INTO `t_node` VALUES ('124', 'NotRecognised', 'NotRecognised', '未确认', '0', null, '7', '1', '2', '0', '4');
INSERT INTO `t_node` VALUES ('125', 'Confirmed', 'Confirmed', '已确认', '0', null, '8', '1', '2', '0', '4');
INSERT INTO `t_node` VALUES ('126', 'Dispute', 'Dispute', '争议', '0', null, '9', '1', '2', '0', '4');
INSERT INTO `t_node` VALUES ('127', 'Paid', 'Paid', '已结款', '0', null, '10', '1', '2', '0', '4');
INSERT INTO `t_node` VALUES ('128', 'AllUser', 'AllUser', '全部用户', '0', null, '1', '1', '2', '0', '5');
INSERT INTO `t_node` VALUES ('129', 'NotAuthUser', 'NotAuthUser', '未认证用户', '0', null, '2', '1', '2', '0', '5');
INSERT INTO `t_node` VALUES ('130', 'PendingAuditUser', 'PendingAuditUser', '待审核用户', '0', null, '3', '1', '2', '0', '5');
INSERT INTO `t_node` VALUES ('131', 'DisableUser', 'DisableUser', '禁用用户', '0', null, '4', '1', '2', '0', '5');
INSERT INTO `t_node` VALUES ('132', 'StoreUser', 'StoreUser', '商家用户', '0', null, '5', '1', '2', '0', '5');
INSERT INTO `t_node` VALUES ('133', 'ExchangeRate', 'ExchangeRate', '汇率更新', '0', null, '1', '1', '2', '0', '12');
INSERT INTO `t_node` VALUES ('134', 'BankCardTypes', 'BankCardTypes', '银行卡种类', '0', null, '2', '1', '2', '0', '12');
INSERT INTO `t_node` VALUES ('135', 'CustomersPayFor', 'CustomersPayFor', '客户支付申请', '0', null, '3', '1', '2', '0', '12');
INSERT INTO `t_node` VALUES ('136', 'PaymentRecords', 'PaymentRecords', '支付记录', '0', null, '4', '1', '2', '0', '12');
INSERT INTO `t_node` VALUES ('137', 'BusinessmenPay', 'BusinessmenPay', '商家支付管理', '0', null, '5', '1', '2', '0', '12');
INSERT INTO `t_node` VALUES ('138', 'UpdatePwd', 'Public/password', '修改密码', '0', null, '1', '1', '2', '0', '14');
INSERT INTO `t_node` VALUES ('88', 'AppVersion', 'AppVersion', '版本更新', '0', null, '2', '0', '2', '0', '3');
INSERT INTO `t_node` VALUES ('140', 'Setting', 'Setting', '站点设置', '0', null, '1', '1', '2', '0', '15');
INSERT INTO `t_node` VALUES ('141', 'Arctype', 'Arctype', '菜单管理', '0', null, '2', '1', '2', '0', '15');
INSERT INTO `t_node` VALUES ('142', 'Banner', 'Banner', 'Banner设置', '0', null, '3', '1', '2', '0', '15');
INSERT INTO `t_node` VALUES ('143', 'Case', 'Case', '案例管理', '0', null, '4', '1', '2', '0', '15');
INSERT INTO `t_node` VALUES ('144', 'CaseCate', 'CaseCate', '案例分类管理', '0', null, '5', '1', '2', '0', '15');
INSERT INTO `t_node` VALUES ('145', 'Tech', 'Tech', '技术天使', '0', null, '6', '1', '2', '0', '15');
INSERT INTO `t_node` VALUES ('146', 'Partner', 'Partner', '合作伙伴', '0', null, '8', '1', '2', '0', '15');
INSERT INTO `t_node` VALUES ('147', 'Customers', 'Customers', '我们的客户', '0', null, '7', '1', '2', '0', '15');

-- ----------------------------
-- Table structure for `t_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(20) DEFAULT '' COMMENT '订单编号',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `store_id` int(11) DEFAULT NULL COMMENT '商店ID',
  `receipt` varchar(200) DEFAULT '' COMMENT '收据图片',
  `is_confirm` int(11) DEFAULT '1' COMMENT '是否确认（1：确认；2：反对）',
  `type` int(11) DEFAULT '1' COMMENT '类型（1：未确认；2：已确认；3：争议；4：已结款）',
  `argument
argument
argument_type` int(11) DEFAULT '1' COMMENT '争议类型（1：已退货；2：已取消）',
  `amount` float(11,2) DEFAULT '0.00' COMMENT '消费金额（英镑）',
  `percentage` int(11) DEFAULT '1' COMMENT '返利比例（%）',
  `rebate` float(11,2) DEFAULT '0.00' COMMENT '返利金额（英镑）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------

-- ----------------------------
-- Table structure for `t_order_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `t_order_feedback`;
CREATE TABLE `t_order_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户反馈表ID',
  `foot_id` int(11) DEFAULT '0' COMMENT '足迹ID',
  `content` text COMMENT '反馈内容',
  `tag` int(11) DEFAULT '1' COMMENT '终端类型（1：Android；2：IOS）',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_14` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for `t_partner`
-- ----------------------------
DROP TABLE IF EXISTS `t_partner`;
CREATE TABLE `t_partner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0',
  `status` smallint(2) NOT NULL DEFAULT '1',
  `url` varchar(100) NOT NULL DEFAULT '',
  `logo` varchar(100) NOT NULL DEFAULT '',
  `created` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_partner
-- ----------------------------
INSERT INTO `t_partner` VALUES ('1', '平安', '0', '1', 'http://www.pingan.com', 'Uploads/pic/partner/2014/20140916/541722bb2709d.png', '1410802363');
INSERT INTO `t_partner` VALUES ('2', '3M', '0', '1', 'http://www.3M.com', 'Uploads/pic/partner/2014/20140916/541723571bc7a.png', '1410802519');

-- ----------------------------
-- Table structure for `t_partner_with_us`
-- ----------------------------
DROP TABLE IF EXISTS `t_partner_with_us`;
CREATE TABLE `t_partner_with_us` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '加盟我们ID',
  `company_introduction` text COMMENT '公司简介',
  `address` text COMMENT '地址',
  `email` varchar(50) DEFAULT '' COMMENT '邮箱',
  `phone` varchar(20) DEFAULT '' COMMENT '电话',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_partner_with_us
-- ----------------------------
INSERT INTO `t_partner_with_us` VALUES ('1', '    行帆科技专注于企业移动互联网解决方案，为企业提供移动应用(APP)、手机网站和微信公众平台的产品或服务，涵盖IOS、Android、Windows Phone、HTML5、微信等主流平台。2014年6月，行帆科技已为联合利华、联合技术公司(UTC)、中国平安、宏达电(HTC)、安利等世界五百强企业开发了近百款移动互联网应用精品，并与多家知名企业建立合作伙伴关系，如三星电子、 中国电信、华为、加拿大SOTI、韩国VERTEX ID等。行帆科技已在移动教育、移动金融、移动O2O、移动办公、智能硬件等领域有大量的APP开发案例，并成为安利、上海财经大学、联合技术公司(UTC)等多家公司长期服务商。    行帆科技专注于企业移动互联网解决方案，为企业提供移动应用(APP)、手机网站和微信公众平台的产品或服务，涵盖IOS、Android、Windows Phone、HTML5、微信等主流平台。2014年6月，行帆科技已为联合利华、联合技术公司(UTC)、中国平安、宏达电(HTC)、安利等世界五百强企业开发了近百款移动互联网应用精品，并与多家知名企业建立合作伙伴关系，如三星电子、 中国电信、华为、加拿大SOTI、韩国VERTEX ID等。行帆科技已在移动教育、移动金融、移动O2O、移动办公、智能硬件等领域有大量的APP开发案例，并成为安利、上海财经大学、联合技术公司(UTC)等多家公司长期服务商。    行帆科技专注于企业移动互联网解决方案，为企业提供移动应用(APP)、手机网站和微信公众平台的产品或服务，涵盖IOS、Android、Windows Phone、HTML5、微信等主流平台。2014年6月，行帆科技已为联合利华、联合技术公司(UTC)、中国平安、宏达电(HTC)、安利等世界五百强企业开发了近百款移动互联网应用精品，并与多家知名企业建立合作伙伴关系，如三星电子、 中国电信、华为、加拿大SOTI、韩国VERTEX ID等。行帆科技已在移动教育、移动金融、移动O2O、移动办公、智能硬件等领域有大量的APP开发案例，并成为安利、上海财经大学、联合技术公司(UTC)等多家公司长期服务商。', '公司地址公司地址公司地址公司地址公司地址公司地址公司地址公司地址', '110918918@qq.com', '13671786068');

-- ----------------------------
-- Table structure for `t_push_today`
-- ----------------------------
DROP TABLE IF EXISTS `t_push_today`;
CREATE TABLE `t_push_today` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '今日推送ID',
  `type` int(11) DEFAULT '1' COMMENT '推送类型（1、活动；2、商店；3、商品）',
  `other_id` int(11) DEFAULT '0' COMMENT '外键ID(根据type确定是）',
  `status` int(11) DEFAULT '0' COMMENT '推送状态（0、未推送；1、已推送；）',
  `poster` varchar(200) DEFAULT '' COMMENT '海报图片',
  `poster_big` varchar(200) DEFAULT '' COMMENT '海报图片大图',
  `show_list_pic` varchar(200) DEFAULT '' COMMENT '列表展示图片',
  `show_list_pic_big` varchar(200) DEFAULT '' COMMENT '列表展示大图',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_push_today
-- ----------------------------

-- ----------------------------
-- Table structure for `t_push_today_history`
-- ----------------------------
DROP TABLE IF EXISTS `t_push_today_history`;
CREATE TABLE `t_push_today_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '今日推送ID',
  `type` int(11) DEFAULT '1' COMMENT '推送类型（1、活动；2、商店；3、商品）',
  `other_id` int(11) DEFAULT '0' COMMENT '外键ID(根据type确定是）',
  `status` int(11) DEFAULT '0' COMMENT '推送状态（0、未推送；1、已推送；）',
  `sex` int(11) DEFAULT '0' COMMENT '推送性别（0：全部；1：男；2：女）',
  `poster` varchar(200) DEFAULT '' COMMENT '海报图片',
  `poster_big` varchar(200) DEFAULT '' COMMENT '海报图片大图',
  `show_list_pic` varchar(200) DEFAULT '' COMMENT '列表展示图片',
  `show_list_pic_big` varchar(200) DEFAULT '' COMMENT '列表展示大图',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_push_today_history
-- ----------------------------

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `ename` varchar(5) DEFAULT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `ename` (`ename`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '领导组', '0', '0', '', '', '1208784792', '1254325558');
INSERT INTO `t_role` VALUES ('2', '员工组', '0', '0', '', '', '1215496283', '1254325566');
INSERT INTO `t_role` VALUES ('7', '演示组', '0', '0', '', null, '1254325787', '0');

-- ----------------------------
-- Table structure for `t_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_user`;
CREATE TABLE `t_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_user
-- ----------------------------
INSERT INTO `t_role_user` VALUES ('3', '4');
INSERT INTO `t_role_user` VALUES ('3', '5');
INSERT INTO `t_role_user` VALUES ('3', '6');
INSERT INTO `t_role_user` VALUES ('3', '7');
INSERT INTO `t_role_user` VALUES ('3', '8');
INSERT INTO `t_role_user` VALUES ('3', '9');
INSERT INTO `t_role_user` VALUES ('7', '2');
INSERT INTO `t_role_user` VALUES ('1', '1');
INSERT INTO `t_role_user` VALUES ('3', '144');
INSERT INTO `t_role_user` VALUES ('3', '145');
INSERT INTO `t_role_user` VALUES ('3', '147');
INSERT INTO `t_role_user` VALUES ('3', '159');
INSERT INTO `t_role_user` VALUES ('3', '186');
INSERT INTO `t_role_user` VALUES ('3', '269');
INSERT INTO `t_role_user` VALUES ('3', '286');
INSERT INTO `t_role_user` VALUES ('3', '35');
INSERT INTO `t_role_user` VALUES ('3', '49');
INSERT INTO `t_role_user` VALUES ('3', '54');
INSERT INTO `t_role_user` VALUES ('3', '77');
INSERT INTO `t_role_user` VALUES ('3', '78');
INSERT INTO `t_role_user` VALUES ('3', '80');
INSERT INTO `t_role_user` VALUES ('3', '7');
INSERT INTO `t_role_user` VALUES ('3', '23');

-- ----------------------------
-- Table structure for `t_setting`
-- ----------------------------
DROP TABLE IF EXISTS `t_setting`;
CREATE TABLE `t_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `wechat` varchar(50) NOT NULL,
  `wechat_img` varchar(255) NOT NULL,
  `weibo` varchar(50) NOT NULL,
  `weibo_img` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `seo_title` varchar(100) NOT NULL,
  `seo_keywords` varchar(255) NOT NULL,
  `seo_description` varchar(255) NOT NULL,
  `copyright` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_setting
-- ----------------------------
INSERT INTO `t_setting` VALUES ('1', '行帆科技', 'Uploads/setting2014/20140908/540d73a77663e.png', '400-2525-7060', '1', 'Uploads/setting2014/20140908/540d6f8ec31a4.png', '11', 'Uploads/setting/2014/20140908/540d6f8ec517d.png', '11', '1', '1', '1', '中国一流的企业移动应用、APP开发、APP外包企业，上海APP开发、上海APP外包、上海微信开发、企业APP开发、应用外包、应用开发、Android外包、IOS外包-Sigboat.com', '@copyright;');

-- ----------------------------
-- Table structure for `t_slide`
-- ----------------------------
DROP TABLE IF EXISTS `t_slide`;
CREATE TABLE `t_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '首页幻灯片ID',
  `store_id` int(11) DEFAULT '0' COMMENT '商店ID',
  `pic` varchar(200) DEFAULT '' COMMENT '图片地址',
  `pic_name` varchar(100) DEFAULT '' COMMENT '图片名称',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_slide
-- ----------------------------
INSERT INTO `t_slide` VALUES ('1', '1', 'Uploads/pic/ppt/slide1@2x.png', '幻灯片1', '1397028490');
INSERT INTO `t_slide` VALUES ('2', '2', 'Uploads/pic/ppt/slide2@2x.png', '幻灯片2', '1403856875');
INSERT INTO `t_slide` VALUES ('3', '3', 'Uploads/pic/ppt/slide3@2x.png', '幻灯片3', '1404280720');
INSERT INTO `t_slide` VALUES ('4', '4', 'Uploads/pic/ppt/slide4@2x.png', '幻灯片4', '1404282438');
INSERT INTO `t_slide` VALUES ('5', '5', 'Uploads/pic/ppt/slide5@2x.png', '幻灯片5', '1404284744');
INSERT INTO `t_slide` VALUES ('8', '1', 'Uploads/pic/slide/2014/20140830/54014c05c7a70.jpg', '幻灯片6', '1407895093');
INSERT INTO `t_slide` VALUES ('9', '6', 'Uploads/pic/slide/2014/20140830/54014bf91e1ab.jpg', '1234', '1409370636');

-- ----------------------------
-- Table structure for `t_store`
-- ----------------------------
DROP TABLE IF EXISTS `t_store`;
CREATE TABLE `t_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商店信息表ID',
  `en_name` varchar(200) DEFAULT '' COMMENT '英文名称',
  `cn_name` varchar(200) DEFAULT '' COMMENT '中文名称',
  `user_id` int(11) DEFAULT '0' COMMENT '商店拥有者（用户ID）',
  `logo` varchar(200) DEFAULT '' COMMENT '商店logo',
  `pic` varchar(200) DEFAULT '' COMMENT '头部大图',
  `city_id` int(11) DEFAULT '0' COMMENT '城市ID',
  `phone` varchar(100) DEFAULT NULL COMMENT '联系电话',
  `en_description` text COMMENT '商店描述（英文）',
  `cn_description` text COMMENT '商店描述（中文）',
  `en_detail` text COMMENT '商店详情（英文）',
  `cn_detail` text COMMENT '商店详情（中文）',
  `en_scope_of_business` text COMMENT '经营范围（英文）',
  `cn_scope_of_business` text COMMENT '经营范围（中文）',
  `en_address` varchar(200) DEFAULT '' COMMENT '英文地址',
  `cn_address` varchar(200) DEFAULT '' COMMENT '中文地址',
  `lng` varchar(11) DEFAULT '0.000000' COMMENT '经度',
  `lat` varchar(11) DEFAULT '0.000000' COMMENT '纬度',
  `postcode` varchar(20) DEFAULT '' COMMENT '邮政编码',
  `pic_piece` varchar(200) DEFAULT '' COMMENT '小块图片',
  `keywords` text COMMENT '关键字',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_store
-- ----------------------------
INSERT INTO `t_store` VALUES ('1', 'London Bond Street LV Store', '伦敦邦德街LV店', '10008', '', '', '1', '23030398', 'this is a description', '商店简短说明', 'store information', '商店信息', 'scope of Buesiness', '经营的范围', 'No128, Bond Strret, London', '伦敦市邦德街128号', '-4.2970627', '55.8486605', '342700', null, '邦德，皮带，LV，包，专卖店', null);
INSERT INTO `t_store` VALUES ('2', 'Ya Shi Lan dai London', '雅诗兰黛伦敦专卖店', '10035', '', '', '1', '32344343', 'this is a descriptions', '商店简短说明', 'store information', '商店信息', 'scope of Buesiness', '经营的范围', 'No228, Oxford Street London', '伦敦市牛津街228号', '110.153435', '45.675433', '434332', null, '雅诗兰黛，化妆品，专卖店', null);
INSERT INTO `t_store` VALUES ('3', 'store1', '商店1', '10013', '', '', '1', '15847209841', 'This is description1', '这是商店描述1', 'This is detail1', '这是商店详情1', 'This is business1', '这是商店经营范围1', 'This is address1', '这是商店地址1', '117.160559', '39.126072', '103321', null, '商店1', '1402738862');
INSERT INTO `t_store` VALUES ('4', 'store2', '商店2', '10024', '', '', '1', '15847209842', 'This is description2', '这是商店描述2', 'This is detail2', '这是商店详情2', 'This is business2', '这是商店经营范围2', 'This is address2', '这是商店地址2', '117.158134', '39.223473', '103322', null, '商店2', '1402738862');
INSERT INTO `t_store` VALUES ('5', 'store3', '商店3', '10009', '', '', '1', '15847209843', 'This is description3', '这是商店描述3', 'This is detail3', '这是商店详情3', 'This is business3', '这是商店经营范围3', 'This is address3', '这是商店地址3', '0.0', '0.0', '103323', null, '商店3', '1402738862');
INSERT INTO `t_store` VALUES ('6', 'store4', '商店4', '10007', '', '', '1', '15847209844', 'This is description4', '这是商店描述4', 'This is detail4', '这是商店详情4', 'This is business4', '这是商店经营范围4', 'This is address4', '这是商店地址4', '0.0', '0.0', '103324', null, '商店4', '1402738862');
INSERT INTO `t_store` VALUES ('7', 'store5', '商店5', '10006', '', '', '1', '15847209845', 'This is description5', '这是商店描述5', 'This is detail5', '这是商店详情5', 'This is business5', '这是商店经营范围5', 'This is address5', '这是商店地址5', '121.5179408', '31.268626', '103325', null, '商店5', '1402738862');
INSERT INTO `t_store` VALUES ('8', 'zhonghuaStore', '中华烟草专卖店', '10001', 'Uploads/store/logo/2014/20140822/53f6f4b7bfb46.jpg', 'Uploads/store/pic/2014/20140822/53f6f4b7bfd37.jpg', '1', '1312432323', null, '我们只卖香烟', null, '我们只卖香烟', null, '我们只卖香烟', '', '江浦路245号', '0.0', '0.0', '323232', 'Uploads/store/pic_piece/2014/20140822/53f6f4b7c0030.jpg', '中华，香烟，烟草', '1408515849');
INSERT INTO `t_store` VALUES ('9', 'xiaomiStore', '小米手机专卖店', '10019', 'Uploads/store/logo/2014/20140829/53ffdfc0dbd34.jpg', 'Uploads/store/pic/2014/20140829/53ffdfc0eb48b.jpg', '1', '633202900', null, '我们只卖小米正版手机、手机配件等。', null, '我们只卖小米正版手机、手机配件等。', null, '小米手机、手机配件', '', '上海徐汇区田林路467号', '0.0', '0.0', '100086', 'Uploads/store/pic_piece/2014/20140829/53ffdfc0eb936.jpg', '小米，手机，配件', '1409277888');
INSERT INTO `t_store` VALUES ('10', 'appleStore', '苹果专卖店', '10022', 'Uploads/store/logo/2014/20140829/540013554992c.jpg', 'Uploads/store/pic/2014/20140829/5400135549b39.jpg', '1', '13129319202', null, '我们只卖苹果正版手机、手机配件等。', null, '我们只卖苹果正版手机、手机配件等。', null, '苹果手机、苹果电脑', '', '上海徐汇区田林路447号', '121.404449', '31.130791', '323232', 'Uploads/store/pic_piece/2014/20140829/540013554a6cf.jpg', '苹果、手机、电脑、专卖', '1409291093');
INSERT INTO `t_store` VALUES ('11', 'dazuihou', '大嘴猴徐汇田林旗舰店', '10023', 'Uploads/store/logo/2014/20140829/540014bc6100d.jpg', 'Uploads/store/pic/2014/20140829/540014bc61287.jpg', '1', '13120493829', null, '大嘴猴', null, '大嘴猴', null, '大嘴猴', '', '上海徐汇区田林路475号', '121.578979', '31.190783', '3423232', 'Uploads/store/pic_piece/2014/20140829/540014bc61ae1.jpg', '大嘴猴', '1409291452');
INSERT INTO `t_store` VALUES ('12', 'AOFENG', '傲风户外运动', '10052', 'Uploads/store/logo/2014/20140830/54018c35bf0cc.png', 'Uploads/store/pic/2014/20140830/54018c35bf395.png', '1', '18516323365', null, '活着就要运动', null, '所有商店卖均一致', null, '全世界', '', '上海市普陀区杨柳青路568号', null, null, '1564465', 'Uploads/store/pic_piece/2014/20140830/54018c35c03b2.jpg', '户外，运动，骑车', '1409387573');
INSERT INTO `t_store` VALUES ('13', 'Superdrug', 'Superdrug', '10045', 'Uploads/store/logo/2014/20140831/5402fb46d09d4.jpg', 'Uploads/store/pic/2014/20140831/5402fb46d0bd4.jpg', '1', '13120493829', null, 'Superdrug', null, 'Superdrug', null, 'Superdrug', '', '11 13 & 15 All Hallows Bedford - MK40 1LN', '0.470260', '52.137730', '111111', 'Uploads/store/pic_piece/2014/20140831/5402fb46d178d.jpg', 'Superdrug', '1409481542');
INSERT INTO `t_store` VALUES ('14', 'Sainsbury\'s Supermarkets Ltd', 'Sainsbury\'s Supermarkets Ltd', '10046', 'Uploads/store/logo/2014/20140831/5402fb82cd633.jpg', 'Uploads/store/pic/2014/20140831/5402fb82cd836.jpg', '1', '13120493829', null, 'Sainsbury\'s Supermarkets Ltd', null, 'Sainsbury\'s Supermarkets Ltd', null, 'Sainsbury\'s Supermarkets Ltd', '', 'Sainsbury\'s Supermarkets Ltd 14 Burnt Ash Rd London SE12 8PZ', '0.0', '0.0', '111111', 'Uploads/store/pic_piece/2014/20140831/5402fb82ce3f3.jpg', 'Sainsbury\'s Supermarkets Ltd', '1409481602');
INSERT INTO `t_store` VALUES ('15', 'Boots Opticians', 'Boots Opticians', '10047', 'Uploads/store/logo/2014/20140831/5402fbc433347.jpg', 'Uploads/store/pic/2014/20140831/5402fbc433650.jpg', '6', '13129319202', null, 'Boots Opticians', null, 'Boots Opticians', null, 'Boots Opticians', '', '101-103 Princes St Edinburgh', '-3.201521', '55.952841', '111111', 'Uploads/store/pic_piece/2014/20140831/5402fbc4343c0.jpg', 'Boots Opticians', '1409481668');
INSERT INTO `t_store` VALUES ('16', 'WHSmith', 'WHSmith', '10059', 'Uploads/store/logo/2014/20140902/5404c620dfae9.jpg', 'Uploads/store/pic/2014/20140902/5404c620dfd14.jpg', '1', '13165984657', null, 'WHSmith', null, 'WHSmith', null, 'WHSmith', '', 'Harpur Street Bedford MK40 1TG', '-0.480470', '52.140839', 'MK40 1TG', 'Uploads/store/pic_piece/2014/20140902/5404c620e2bfc.jpg', 'WHSmith', '1409599008');
INSERT INTO `t_store` VALUES ('17', 'drink', '果粒橙', '10077', 'Uploads/store/logo/2014/20140904/5407d7884bbe1.png', 'Uploads/store/pic/2014/20140904/5407d7884bec4.png', '4', '15000001234', null, '可以喝的水果', null, '可以喝的水果', null, '中国', '', '上海市杨浦区长阳路455号', '121.517594', '31.268718', '130031', 'Uploads/store/pic_piece/2014/20140904/5407d7884c09f.png', '果', '1409800072');
INSERT INTO `t_store` VALUES ('18', 'Philips', '飞利浦专卖店', '10083', 'Uploads/store/logo/2014/20140905/54092d9c9d60f.jpg', 'Uploads/store/pic/2014/20140905/54092d9c9d97d.jpg', '1', '18516323365', null, '飞利浦专卖店', null, '飞利浦专卖店', null, '飞利浦专卖店', '', '江浦路1000号', null, null, '323243', 'Uploads/store/pic_piece/2014/20140905/54092d9c9dd63.jpg', '飞利浦，电器，店', '1409887644');
INSERT INTO `t_store` VALUES ('19', '1', '1', '0', 'Uploads/store/logo/2014/20140908/540d6e10d877f.png', 'Uploads/store/pic/2014/20140908/540d6e10ef8d1.png', '1', '1', null, '1', null, '1', null, '1', '', '1', '1', '1', '1', 'Uploads/store/pic_piece/2014/20140908/540d6e10f2ea0.png', 'sd', '1410166288');

-- ----------------------------
-- Table structure for `t_store_employee`
-- ----------------------------
DROP TABLE IF EXISTS `t_store_employee`;
CREATE TABLE `t_store_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商店雇员表ID',
  `store_id` int(11) DEFAULT '0' COMMENT '商店ID',
  `user_id` int(11) DEFAULT '0' COMMENT '用户ID',
  `type` int(11) DEFAULT '2' COMMENT '1：经理；2：雇员',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_store_employee
-- ----------------------------
INSERT INTO `t_store_employee` VALUES ('1', '8', '10001', '1');
INSERT INTO `t_store_employee` VALUES ('2', '7', '10006', '1');
INSERT INTO `t_store_employee` VALUES ('3', '6', '10007', '1');
INSERT INTO `t_store_employee` VALUES ('4', '1', '10008', '1');
INSERT INTO `t_store_employee` VALUES ('5', '1', '10008', '2');
INSERT INTO `t_store_employee` VALUES ('6', '5', '10009', '1');
INSERT INTO `t_store_employee` VALUES ('7', '3', '10013', '1');
INSERT INTO `t_store_employee` VALUES ('8', '9', '10019', '1');
INSERT INTO `t_store_employee` VALUES ('9', '10', '10022', '1');
INSERT INTO `t_store_employee` VALUES ('10', '11', '10023', '1');
INSERT INTO `t_store_employee` VALUES ('11', '4', '10024', '1');
INSERT INTO `t_store_employee` VALUES ('12', '2', '10033', '1');
INSERT INTO `t_store_employee` VALUES ('13', '2', '10034', '1');
INSERT INTO `t_store_employee` VALUES ('14', '2', '10035', '1');
INSERT INTO `t_store_employee` VALUES ('15', '13', '10045', '1');
INSERT INTO `t_store_employee` VALUES ('16', '14', '10046', '1');
INSERT INTO `t_store_employee` VALUES ('17', '15', '10047', '1');
INSERT INTO `t_store_employee` VALUES ('18', '12', '10052', '1');
INSERT INTO `t_store_employee` VALUES ('19', '16', '10059', '1');
INSERT INTO `t_store_employee` VALUES ('20', '16', '10059', '2');
INSERT INTO `t_store_employee` VALUES ('21', '17', '10077', '1');
INSERT INTO `t_store_employee` VALUES ('22', '18', '10083', '1');

-- ----------------------------
-- Table structure for `t_tech`
-- ----------------------------
DROP TABLE IF EXISTS `t_tech`;
CREATE TABLE `t_tech` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `des` varchar(255) NOT NULL DEFAULT '',
  `techbg` varchar(100) NOT NULL DEFAULT '',
  `des1` text NOT NULL,
  `des2` text NOT NULL,
  `jihua_mail` varchar(50) NOT NULL DEFAULT '',
  `qq` varchar(20) NOT NULL DEFAULT '',
  `mobile` varchar(20) NOT NULL DEFAULT '',
  `des3` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tech
-- ----------------------------
INSERT INTO `t_tech` VALUES ('1', '以技术开发为条件进行的项目或产品的投资形式', '技术天使（英文为Techangel）,是一种以技术开发为条件进行的项目或产品的投资形式，2014年1月，行帆科技全球首创提出“技术天使”概念，并且成功应用在“财富宝宝”等项目上。技术天使投资的具体操作形式为，首先由行帆科技详细考察创业者有关项目的发展规划、可行性报告，在此基础上为创业者量身打造最为适合的技术团队，并在项目开发的不同时期，为创业者提供有针对性的服务。双方的合作方式为创业者主导，行帆科技技术团队入股，并根据不同创业阶段的服务特点、开发团队在创业团队中的作用，来界定技术服务在整个资本中所', 'Uploads/pic/tech/2014/20140916/54171968b083b.png', '<p>\r\n	行帆科技由三星电子韩国总部归国技术团队创立，联合创始人均毕业于全国顶尖大学（清华、复旦、上交大等），并汇聚了一批来自腾讯、HTC、金蝶等公司的资深工程师，拥有10年手机软件开发经验及8年手机UI与原型设计经验。截至2013年12月，行帆科技已为联合利华、联合技术公司（UTC）、中国平安、宏达电（HTC）、安利等世界五百强企业开发了数十款移动互联网应用精品。行帆科技的合作伙伴包括三星电子、中国电信、华为、加拿大SOTI、韩国VERTEX ID等知名企业。\r\n</p>', '<img src=\"/Uploads/attached/20140916010816_86028.png\" alt=\"\" />\r\n<ol>\r\n	<li>\r\n		由申请者向行帆科技“技术天使”投资评估部门递送商业规划书，提出“技术天使”投资申请。\r\n	</li>\r\n	<li>\r\n		<p>\r\n			行帆科技将组织由公司联合创始人及技术专家参加的项目评审会，并提出评审意见。\r\n		</p>\r\n	</li>\r\n	<li>\r\n		<p>\r\n			行帆科技技术天使投资评估部门将安排申请者与公司技术专家的沟通会，就技术问题进行沟通了解，形成深入分析报告。\r\n		</p>\r\n	</li>\r\n	<li>\r\n		<p>\r\n			行帆科技根据评审意见与深入分析报告，做出合作决断，并择期与申请者就具体合作方式、投资占比、回馈方式等细节问题进行商业谈判。\r\n		</p>\r\n	</li>\r\n	<li>\r\n		<p>\r\n			签订技术天使投资合同。\r\n		</p>\r\n	</li>\r\n	<li>\r\n		<p>\r\n			由行帆科技根据项目具体需求，组成技术团队，与申请者一起对项目细节进行进一步的研究探讨，形成项目原型。\r\n		</p>\r\n	</li>\r\n	<li>\r\n		<p>\r\n			技术团队进入申请者创业团队开始产品开发。\r\n		</p>\r\n	</li>\r\n	<li>\r\n		<p>\r\n			技术团队开发中如遇问题，可向行帆科技总部提出技术支援申请。\r\n		</p>\r\n	</li>\r\n	<li>\r\n		<p>\r\n			项目开发完成后，行帆科技可在产品上线与运营等方面与申请者展开进一步的合作。\r\n		</p>\r\n	</li>\r\n</ol>', 'bp@sigboat.com', '8450-8394', '8450-8394', '<img src=\"/Uploads/attached/20140916010636_77942.png\" alt=\"\" /><br />');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `name` varchar(50) DEFAULT '' COMMENT '名称',
  `username` varchar(50) DEFAULT '' COMMENT '用户登录名称',
  `password` varchar(200) NOT NULL DEFAULT '' COMMENT '密码',
  `email` varchar(200) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `user_id` varchar(50) DEFAULT '' COMMENT '第三方登录用户ID',
  `phone` varchar(20) DEFAULT '' COMMENT '手机',
  `photo` varchar(200) DEFAULT '' COMMENT '用户头像',
  `device_id` varchar(200) DEFAULT NULL,
  `device_type` int(11) DEFAULT '1' COMMENT '1:android;2:ios',
  `cahsback` double(11,2) DEFAULT '0.00' COMMENT '我的返利（以英镑为单位）',
  `type` int(11) DEFAULT '1' COMMENT '登录类型（1：注册用户；2：QQ用户；3：微博用户）',
  `user_type` int(11) DEFAULT '1' COMMENT '用户类型（1：客户；2：商家）',
  `birthday` varchar(11) DEFAULT '0' COMMENT '生日',
  `IDCard` varchar(200) DEFAULT '' COMMENT '身份证/护照图片',
  `is_auth` int(11) DEFAULT '1' COMMENT '是否已被认证（1：未认证；2：已认证；3：待审核）',
  `is_vip` int(11) DEFAULT '1' COMMENT '是否vip（1、不是，2、是）',
  `rqcode` varchar(50) DEFAULT '' COMMENT '用户二维码',
  `status` int(11) DEFAULT '0' COMMENT '用户状态（0：正常；1：被禁用）',
  `age` int(11) DEFAULT '1' COMMENT '年龄',
  `sex` char(10) DEFAULT '男' COMMENT '性别',
  `lng` varchar(20) DEFAULT '0.000000' COMMENT '经度',
  `lat` varchar(20) DEFAULT '0.000000' COMMENT '纬度',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) DEFAULT '1' COMMENT '上次登录时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10096 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('10001', '1124791554', '1124791554@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '1124791554@qq.com', '', '', '', '1106587417384329338', '1', '0.00', '1', '2', '0', '', '1', '1', '', '0', '1', '男', '0.0', '0.0', '1409214501', '1409914190');
INSERT INTO `t_user` VALUES ('10002', '元', '123456@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 'yuanrui_cool@163.com', '', '18920787053', 'Uploads/photo/2014/20140901/7a1a4643-3fdd-8c05-29db-ec26c27f777c.jpg', '1013382263083070602', '2', '0.00', '1', '1', '20102400', 'Uploads/photo/2014/20140901/7b64f68a-83ed-bddd-d4d2-4ab3e8e56372.jpg', '2', '2', '800c5cef-e315-5241-eead-59063595db13', '0', '44', '男', '117.160561', '39.126072', '1409214672', '1409627569');
INSERT INTO `t_user` VALUES ('10075', '', 'fujfh@qq.com', 'a9699239ed9894c042a6c8e6437d8aa2', 'fujfh@qq.com', '', '', '', '', '2', '0.00', '1', '1', '0', '', '1', '1', 'cb8cc1b8-bbb9-416c-774a-596ad0d80301', '0', '1', '男', '117.160622', '39.126041', '1409737501', '1409737501');
INSERT INTO `t_user` VALUES ('10003', '丁百计', 'dingbaiji@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '977506858@qq.com', '', '13661472838', 'Uploads/photo/2014/20140831/5402d0c66ad14.jpg', '00000000-4c1f-1825-6c57-d97b43953867', '1', '2594.88', '1', '1', '971539200', 'Uploads/IDCard/2014/20140831/5402d0c66afe0.jpg', '2', '2', '779550aa-f097-9b28-eaef-32a4ad3d3ef6', '0', '14', '男', '116.40741300000002', '39.904214', '1409214706', '1409214706');
INSERT INTO `t_user` VALUES ('10004', '', '654321@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '654321@qq.com', '', '', '', '', '1', '0.00', '1', '1', '0', '', '1', '1', '87ce6df0-355a-ec3c-bc22-6617907a82c8', '0', '1', '男', '121.517975', '31.268784', '1409215196', '1409215196');
INSERT INTO `t_user` VALUES ('10005', '', '526455@qq.com', '3dd026ec0fd8578945cd49a5b4946beb', '526455@qq.com', '', '', '', null, '1', '0.00', '1', '1', '0', '', '1', '1', 'ca09c128-6b4a-3815-eced-1e0bd62777c9', '0', '1', '男', '116.407410', '39.904213', '1409215797', '1409215797');
INSERT INTO `t_user` VALUES ('10006', 'baiji', 'baiji@sigboat.com', 'e10adc3949ba59abbe56e057f20f883e', 'baiji@sigboat.com', '', '', '', '', '1', '0.00', '1', '2', '0', '', '1', '1', '', '0', '1', '男', '121.5179408', '31.268626', '1409215805', '1409902345');
INSERT INTO `t_user` VALUES ('10007', 'baiji1', 'baiji1@sigboat.com', 'e10adc3949ba59abbe56e057f20f883e', 'baiji1@sigboat.com', '', '', '', '', '2', '0.00', '1', '2', '0', '', '1', '1', '', '0', '1', '男', '0.0', '0.0', '1409216028', '1409746156');
INSERT INTO `t_user` VALUES ('10008', 'fan.peng', 'fan.peng@sigboat.com', 'e10adc3949ba59abbe56e057f20f883e', 'fan.peng@sigboat.com', '', '', '', '587362185261231117', '1', '0.00', '1', '2', '0', '', '1', '1', '', '0', '1', '男', '-4.2970627', '55.8486605', '1409216606', '1409952073');
INSERT INTO `t_user` VALUES ('10021', '-九界之主', '', '', '', 'F15D3AED48DF352B41BCD12A2F19C6A1', '', 'http://qzapp.qlogo.cn/qzapp/100424468/F15D3AED48DF352B41BCD12A2F19C6A1/100', null, '1', '0.00', '2', '1', '0', '', '1', '1', '6510b966-8c7e-ff3f-76b9-d4c50c039284', '0', '1', '男', '116.407410', '39.904213', '1409284308', '1');
INSERT INTO `t_user` VALUES ('10009', 'baiji2', 'baiji2@sigboat.com', 'e10adc3949ba59abbe56e057f20f883e', 'baiji2@sigboat.com', '', '', '', '', '2', '0.00', '1', '2', '0', '', '1', '1', '', '0', '1', '男', '0.0', '0.0', '1409217305', '1409872167');
INSERT INTO `t_user` VALUES ('10010', '都不吃', '545567@qq.com', '3dd026ec0fd8578945cd49a5b4946beb', 'wuchvjg@163.com', '', '15427586855', 'Uploads/photo/2014/20140829/5442ebde-924b-0ce2-5d9d-cc0200730e6f.jpg', null, '1', '0.00', '1', '1', '0', '', '1', '2', 'f5aaa904-f76a-6156-43a9-ffb19859deea', '0', '1', '男', '116.407410', '39.904213', '1409217386', '1409302527');
INSERT INTO `t_user` VALUES ('10011', '', 'shaozl@live.com', 'e10adc3949ba59abbe56e057f20f883e', 'shaozl@live.com', '', '', '', '969374260296910895', '2', '0.00', '1', '1', '0', '', '1', '1', 'a1c328ea-9768-b18e-967b-1036d4ca2655', '0', '1', '男', '121.388611', '31.166822', '1409218064', '1409218064');
INSERT INTO `t_user` VALUES ('10012', '欧阳', '277088798@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '66@qq.com', '', '18920787053', 'Uploads/photo/2014/20140905/51b94ff5-0c6a-7c76-da80-063e73c22c6d.jpg', '1070134281229104866', '1', '99999974.11', '1', '1', '19843200', 'Uploads/photo/2014/20140902/40ff3d0c-3b34-262b-2768-5e4289f84560.jpg', '2', '2', '789a0427-1b3b-ff30-4ada-c94502637be7', '0', '44', '男', '116.40741300000002', '39.904214', '1409218368', '1409903884');
INSERT INTO `t_user` VALUES ('10024', 'baiji3', 'baiji3@sigboat.com', '25d55ad283aa400af464c76d713c07ad', 'baiji3@sigboat.com', '', '', '', null, '1', '0.00', '1', '2', '0', '', '1', '1', '', '0', '1', '男', '0.000000', '0.000000', '1409294504', '1');
INSERT INTO `t_user` VALUES ('10013', 'store1', 'store1@sigboat.com', 'e10adc3949ba59abbe56e057f20f883e', 'store1@sigboat.com', '', '', '', '2911145', '2', '0.00', '1', '2', '0', '', '1', '1', '', '0', '1', '男', '117.160559', '39.126072', '1409219064', '1409912141');
INSERT INTO `t_user` VALUES ('10014', '', 'jojojo574@yahoo.com', 'e165d4f2174b66a7d1a95cb204d296eb', 'jojojo574@yahoo.com', '', '', '', '588017112110686945', '1', '0.00', '1', '1', '0', '', '1', '2', '705dcb9a-eda6-178a-92a0-bd8589b67933', '0', '1', '男', '116.40741300000002', '39.904214', '1409223171', '1409223171');
INSERT INTO `t_user` VALUES ('10015', '', 'george@georgeshaef.co.uk', '22ed349c996633dd4a972f861e18fc56', 'george@georgeshaef.co.uk', '', '', '', '879263708771451471', '1', '0.00', '1', '1', '0', '', '1', '1', '23652c8c-277a-fe4c-ad9e-0100f7c2c088', '0', '1', '男', '116.40741300000002', '39.904214', '1409223175', '1409223175');
INSERT INTO `t_user` VALUES ('10016', 'a', 'a@b.com', 'e10adc3949ba59abbe56e057f20f883e', 'a@b.com', '', '13111111111', '', '', '1', '0.00', '1', '1', '0', '', '1', '1', '3f9bd8d0-374b-45c7-dab6-3a9abb696204', '0', '1', '男', '116.40741300000002', '39.904214', '1409233679', '1409757020');
INSERT INTO `t_user` VALUES ('10017', '', '', '', '', '2074887943', '', '', null, '1', '0.00', '3', '1', '0', '', '1', '1', '5f72f807-58f9-93b5-6227-d7c1969bd060', '0', '1', '男', '116.407410', '39.904213', '1409239188', '1409239901');
INSERT INTO `t_user` VALUES ('10018', '沧海一粟', '', '', '', '00AA7BFE70AFD5539784350BE7E68868', '', 'http://qzapp.qlogo.cn/qzapp/100371282/00AA7BFE70AFD5539784350BE7E68868/100', '', '1', '0.00', '2', '1', '0', '', '1', '1', '4c1a0b40-b7c8-3c49-1209-984fe7924243', '0', '1', '男', '116.407410', '39.904213', '1409239332', '1409589258');
INSERT INTO `t_user` VALUES ('10019', 'fwb', 'fwb@126.com', 'e10adc3949ba59abbe56e057f20f883e', 'fwb@126.com', '', '', '', null, '1', '0.00', '1', '2', '0', '', '1', '1', '', '0', '1', '男', '0.0', '0.0', '1409277931', '1409872471');
INSERT INTO `t_user` VALUES ('10020', '', 'aa@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 'aa@qq.com', '', '', '', null, '1', '0.00', '1', '1', '0', '', '1', '2', '70a85e62-9542-67ac-d9d7-68f472534113', '0', '1', '男', '116.407410', '39.904213', '1409278906', '1409278906');
INSERT INTO `t_user` VALUES ('10022', 'jobs', 'jobs@apple.com', 'e10adc3949ba59abbe56e057f20f883e', 'jobs@apple.com', '', '', '', null, '1', '0.00', '1', '2', '0', '', '1', '1', '', '0', '1', '男', '0.000000', '0.000000', '1409291473', '1');
INSERT INTO `t_user` VALUES ('10023', 'zeliang', 'zeliang@dazuihou.com', 'e10adc3949ba59abbe56e057f20f883e', 'zeliang@dazuihou.com', '', '', '', null, '1', '0.00', '1', '2', '0', '', '1', '1', '', '0', '1', '男', '0.000000', '0.000000', '1409291502', '1');
INSERT INTO `t_user` VALUES ('10025', '', 'a@a.com', 'e10adc3949ba59abbe56e057f20f883e', 'a@a.com', '', '', '', null, '1', '0.00', '1', '1', '0', '', '1', '2', '370e9e55-af08-4bab-024c-2ee641853d5d', '0', '1', '男', '116.407410', '39.904213', '1409304724', '1409304724');
INSERT INTO `t_user` VALUES ('10026', '丁百计', 'aaa@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '977506858@qq.com', '', '13661472838', '', null, '1', '0.00', '1', '1', '0', '', '1', '1', 'e013f5d0-7d4f-ff07-4c67-fa83f5d1aee5', '0', '1', '男', '116.407410', '39.904213', '1409309850', '1409310153');
INSERT INTO `t_user` VALUES ('10027', '', '', '', '', '3124768857', '', '', null, '1', '0.00', '3', '1', '0', '', '1', '1', '5f6f8926-bf94-1770-7186-4a59a3323369', '0', '1', '男', '116.407410', '39.904213', '1409319629', '1409320111');
INSERT INTO `t_user` VALUES ('10028', '', 'cscola1121@gmail.com', '96db0350842d1d192f00b883a034026f', 'cscola1121@gmail.com', '', '', '', null, '1', '0.00', '1', '1', '0', '', '1', '1', 'd9acc168-afed-27b6-e415-fc15c17a8b7f', '0', '1', '男', '116.407410', '39.904213', '1409324346', '1409324346');
INSERT INTO `t_user` VALUES ('10029', '瀟', '', '', '', 'C3A31E1190C32F3A46C9BA07B2D2BE77', '', 'http://qzapp.qlogo.cn/qzapp/100371282/C3A31E1190C32F3A46C9BA07B2D2BE77/100', null, '1', '0.00', '2', '1', '0', '', '1', '1', '4918856e-afff-5732-bf6e-264cd0734e7f', '0', '1', '男', '116.407410', '39.904213', '1409366616', '1409366706');
INSERT INTO `t_user` VALUES ('10030', '', '', '', '', '3352231172', '', '', null, '1', '0.00', '3', '1', '0', '', '1', '1', 'ef76f787-2f69-17df-5090-995ccc7a6fb5', '0', '1', '男', '116.407410', '39.904213', '1409367574', '1409367588');
INSERT INTO `t_user` VALUES ('10031', 'Rt', 'q@q.com', 'e10adc3949ba59abbe56e057f20f883e', 'a@a.com', '', '15867899876', '', '', '1', '0.00', '1', '1', '0', '', '1', '1', '272ac1e5-ad60-0788-63b9-f8eb5751bd09', '0', '1', '男', '116.407410', '39.904213', '1409368032', '1409575288');
INSERT INTO `t_user` VALUES ('10032', 'a', 'xtudbl2740@163.com', 'c33367701511b4f6020ec61ded352059', 'as@dd.com', '', '15963256985', 'Uploads/photo/2014/20140830/224a7e34-ade7-8f23-8bb9-2ac78bcc2361.jpg', null, '1', '39614.58', '1', '1', '0', '', '1', '2', '7ee4f8e2-f661-277a-1954-ef1ea2081cb3', '0', '1', '男', '116.407410', '39.904213', '1409368133', '1409390382');
INSERT INTO `t_user` VALUES ('10035', 'zheng', 'zheng@sigbaot.com', '25d55ad283aa400af464c76d713c07ad', 'zheng@sigbaot.com', '', '', '', '', '2', '0.00', '1', '2', '0', '', '1', '1', '', '0', '1', '男', '0.000000', '0.000000', '1409378201', '1409542481');
INSERT INTO `t_user` VALUES ('10036', '逍遥', '', '', '', 'B6ABC57BA675B2991EA15F8A76BD8784', '', 'http://qzapp.qlogo.cn/qzapp/100371282/B6ABC57BA675B2991EA15F8A76BD8784/100', '', '1', '0.00', '2', '1', '0', '', '1', '1', 'de4f1de6-abad-eace-7805-91d6e438b480', '0', '1', '男', '116.407410', '39.904213', '1409382715', '1409541533');
INSERT INTO `t_user` VALUES ('10037', '胡美乐', '1656987787@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '1124791554@qq.com', '', '18511616895', 'Uploads/photo/2014/20140903/73d70737-e5d3-2009-f751-83d8077c88e2.jpg', '1113246990714379356', '1', '0.00', '1', '1', '1157212800', '', '2', '2', '07531651-0847-a08b-a940-971b79f21fe9', '0', '8', '男', '116.40741300000002', '39.904214', '1409383348', '1409730246');
INSERT INTO `t_user` VALUES ('10043', 'hg', '523823964@qq.com', '62026aaed5419a1ceaa229bf6886443e', 'a@a.com', '', '18636363636', '', '', '1', '0.00', '1', '1', '-28800', 'Uploads/photo/2014/20140902/21726b84-d3d2-1ae0-894e-f3c4549281a7.jpg', '3', '1', 'ab9f4cfa-0698-9aa2-7bed-54060981aaff', '0', '44', '男', '116.407410', '39.904213', '1409459347', '1409640623');
INSERT INTO `t_user` VALUES ('10038', '', 'zhang@sigboat.com', 'e10adc3949ba59abbe56e057f20f883e', 'zhang@sigboat.com', '', '', '', null, '1', '20927.08', '1', '1', '0', '', '1', '2', '8b90156e-c9eb-43ea-a76a-970bcd0db196', '0', '1', '男', '0.000000', '0.000000', '1409392047', '1409392047');
INSERT INTO `t_user` VALUES ('10064', 'rfhjj', '12345678@qq.com', '25d55ad283aa400af464c76d713c07ad', 'fdfyij', '', 'fhjj', 'Uploads/photo/2014/20140902/5a969fcf-8bae-4bf9-20bb-ca475ce8207e.jpg', '', '2', '0.00', '1', '1', '257788800', 'Uploads/photo/2014/20140902/951924d7-7312-5dde-0523-a3b2d0f84dfc.jpg', '3', '1', '7a3a75c4-88db-e15d-b201-bbcb30d039b5', '0', '2147483647', '男', '117.160561', '39.126072', '1409637290', '1409651353');
INSERT INTO `t_user` VALUES ('10039', '才子', '52846553@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '1@qq.com', '', '13456784321', '', '', '1', '2790.58', '1', '1', '19843200', 'Uploads/photo/2014/20140902/fde5e992-3ecd-f792-bae9-90e3c55f6c7ejpg', '2', '2', 'ac76c60b-0dac-4234-4b9f-9345aaff1dff', '0', '44', '男', '0.000000', '0.000000', '1409450512', '1409638821');
INSERT INTO `t_user` VALUES ('10041', '一一', '56893555@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '56893555@qq.com', '', '13000001111', '', '', '1', '50000000.00', '1', '1', '631123200', '', '2', '2', '2943bfbf-d0bf-690e-14b5-3b71bf46ab8a', '0', '24', '男', '116.40741300000002', '39.904214', '1409455226', '1409455226');
INSERT INTO `t_user` VALUES ('10040', '', '938473766@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '938473766@qq.com', '', '', '', '', '1', '0.00', '1', '1', '0', '', '1', '1', '6783c8c8-8057-6f0e-fba6-e504b81440aa', '0', '1', '男', '116.407410', '39.904213', '1409455154', '1409455154');
INSERT INTO `t_user` VALUES ('10044', '', '3067982637@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '3067982637@qq.com', '', '', '', '', '1', '0.00', '1', '1', '0', '', '1', '1', 'ed1c07f4-a0d5-0f69-099a-e740a3608e5c', '0', '1', '男', '121.517914', '31.268778', '1409470043', '1409470043');
INSERT INTO `t_user` VALUES ('10042', '', '', '', '', '1786091282', '', '', '', '1', '0.00', '3', '1', '0', '', '1', '1', '8bf2faf5-0cea-73f5-b6ca-3000d355c71a', '0', '1', '男', '116.407410', '39.904213', '1409456857', '1409469301');
INSERT INTO `t_user` VALUES ('10048', '', '977506858@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '977506858@qq.com', '', '', '', '', '1', '0.00', '1', '1', '0', '', '1', '1', 'f94b62f1-d81d-7930-2420-f129c11d8868', '0', '1', '男', '116.407410', '39.904213', '1409485692', '1409485692');
INSERT INTO `t_user` VALUES ('10045', '1123232324', '1123232324@qq.com', '25d55ad283aa400af464c76d713c07ad', '1123232324@qq.com', '', '', '', null, '1', '0.00', '1', '2', '0', '', '1', '1', '', '0', '1', '男', '0.000000', '0.000000', '1409481722', '1');
INSERT INTO `t_user` VALUES ('10046', '1212121', '1212121@qq.com', '25d55ad283aa400af464c76d713c07ad', '1212121@qq.com', '', '', '', null, '1', '0.00', '1', '2', '0', '', '1', '1', '', '0', '1', '男', '0.0', '0.0', '1409481733', '1409872540');
INSERT INTO `t_user` VALUES ('10047', '232323232', '232323232@qq.com', '25d55ad283aa400af464c76d713c07ad', '232323232@qq.com', '', '', '', null, '1', '0.00', '1', '2', '0', '', '1', '1', '', '0', '1', '男', '0.000000', '0.000000', '1409481744', '1');
INSERT INTO `t_user` VALUES ('10053', '', 'q@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 'q@qq.com', '', '', '', '', '1', '0.00', '1', '1', '0', '', '1', '1', 'b65d4800-df0c-87d7-bc03-c02d926d8ad7', '0', '1', '男', '0.000000', '0.000000', '1409552496', '1409552496');
INSERT INTO `t_user` VALUES ('10049', '', 'wangqing_grace@hotmail.com', 'cffc309ca38ed340e202d93f7a19a559', 'wangqing_grace@hotmail.com', '', '', '', '756892168334647920', '2', '0.00', '1', '1', '0', '', '1', '1', '103735f5-3b65-c874-06fd-a86f085394d6', '0', '1', '男', '-0.480093', '52.141090', '1409514108', '1409514108');
INSERT INTO `t_user` VALUES ('10050', '', 'tyillyf@126.com', '0d3fa3109bb6825f6deabab6889e9c23', 'tyillyf@126.com', '', '', '', '593137343453756608', '2', '0.00', '1', '1', '0', '', '1', '1', '52978027-c11b-331b-48ec-2e3b9945344e', '0', '1', '男', '0.000000', '0.000000', '1409531507', '1409531507');
INSERT INTO `t_user` VALUES ('10051', '', '123567@11.com', '0d2c260ea50b5190eb8f243c31c856b9', '123567@11.com', '', '', 'Uploads/photo/2014/20140901/fd29260b-ce7f-901b-f105-59eb9dfef15c.jpg', '', '2', '0.00', '1', '1', '0', '', '1', '1', 'a1f2d9a2-ec4d-f486-cb96-b1ebb644055d', '0', '1', '男', '0.000000', '0.000000', '1409533900', '1409535295');
INSERT INTO `t_user` VALUES ('10055', '张', '1234567@qq.com', 'fcea920f7412b5da7be0cf42b8c93759', '123456@qq.com', '', '13209876543', 'Uploads/photo/2014/20140901/adc2f21a-d12a-6cae-bb38-aa98c40423a8.jpg', '', '2', '0.00', '1', '1', '1208', 'Uploads/photo/2014/20140901/10a85760-717a-1c36-c301-2f1208ba60ea.jpg', '3', '1', '9136759d-803f-5ed2-8b9b-b31cbae2c3ce', '0', '2147483647', '男', '117.160561', '39.126072', '1409562175', '1409563880');
INSERT INTO `t_user` VALUES ('10052', '57682344', '57682344@qq.com', '25d55ad283aa400af464c76d713c07ad', '57682344@qq.com', '', '', '', '792390792734902905', '2', '0.00', '1', '2', '0', '', '1', '1', '', '0', '1', '男', null, null, '1409537964', '1409916219');
INSERT INTO `t_user` VALUES ('10060', 'JFK', '674632@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '973757283@qq.com', '', '15245545688', '', '1020724994086083098', '2', '530.23', '1', '1', '20102400', 'Uploads/photo/2014/20140902/688be1f0-6115-aae4-2032-8162e09a4034.jpg', '2', '2', '32031dbc-0afd-fae4-1169-9117a05bd0e2', '0', '44', '男', '121.517998', '31.268839', '1409627812', '1409654309');
INSERT INTO `t_user` VALUES ('10054', 'fg', 'q@ee.com', 'e10adc3949ba59abbe56e057f20f883e', 'z@z.com', '', '15836953658', '', '', '1', '0.00', '1', '1', '0', '', '1', '1', 'b9c928cc-b8e6-0b26-3db1-aa066be0d4e7', '0', '1', '男', '116.407410', '39.904213', '1409552591', '1409625616');
INSERT INTO `t_user` VALUES ('10056', '', 'dikgtiiu@qq.com', 'ef8618336ebc1ca26e49209a4000eff7', 'dikgtiiu@qq.com', '', '', '', '', '2', '0.00', '1', '1', '0', '', '1', '1', '1d8724a4-eb6c-9ee8-354d-d360f6d71b1f', '0', '1', '男', '0.000000', '0.000000', '1409574171', '1409574171');
INSERT INTO `t_user` VALUES ('10057', '', '67896789@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '67896789@qq.com', '', '', '', '', '2', '0.00', '1', '1', '0', '', '1', '1', '1c9d12c4-092f-d20e-d0a5-15204a078019', '0', '1', '男', '0.000000', '0.000000', '1409574440', '1409574440');
INSERT INTO `t_user` VALUES ('10059', 'open', 'open@nhkeu.co.uk', 'afdd0b4ad2ec172c586e2150770fbf9e', 'open@nhkeu.co.uk', '', '', '', '', '2', '0.00', '1', '2', '0', '', '1', '1', '', '0', '1', '男', '-0.480470', '52.140839', '1409599366', '1409744964');
INSERT INTO `t_user` VALUES ('10058', '', 'ysongld@yahoo.co.uk', 'c8c605999f3d8352d7bb792cf3fdb25b', 'ysongld@yahoo.co.uk', '', '', '', '882582320489382977', '2', '0.00', '1', '1', '0', '', '1', '1', 'ad47a47a-04de-8ee6-cdd0-7ae3efa754a8', '0', '1', '男', '-0.480264', '52.141010', '1409583650', '1409583650');
INSERT INTO `t_user` VALUES ('10061', '魏武', '8486826@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '95245845@qq.com', '', '15236545549', '', '', '1', '1383.92', '1', '1', '0', '', '1', '2', '4e4de4b1-e8aa-df70-b93e-ddf9ddf2a6bb', '0', '1', '男', '116.40741300000002', '39.904214', '1409628701', '1409711126');
INSERT INTO `t_user` VALUES ('10062', '', '3637590@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '3637590@qq.com', '', '', '', '', '2', '0.00', '1', '1', '0', '', '1', '1', 'bd8a0c49-62c7-55d5-da6f-9dda4799643d', '0', '1', '男', '0.000000', '0.000000', '1409628805', '1409628805');
INSERT INTO `t_user` VALUES ('10063', '', '2010828086@qq.com', '8ed8873ea1277e1639e9bc05a864d4c3', '2010828086@qq.com', '', '', '', '', '1', '0.00', '1', '1', '0', '', '1', '1', 'e24115c4-7449-e314-c990-9bd671d71bd8', '0', '1', '男', '116.407410', '39.904213', '1409629871', '1409629871');
INSERT INTO `t_user` VALUES ('10065', 'yjh', 'bb@bb.com', 'e10adc3949ba59abbe56e057f20f883e', 'a@a.com', '', '18636363636', '', '701737326074593113', '1', '0.00', '1', '1', '-28800', 'Uploads/photo/2014/20140902/7e37b471-a250-f66e-199d-05e823c974f4.jpg', '2', '1', '38d2aca5-b46b-516c-db27-03e55a68d010', '0', '44', '男', '116.40741300000002', '39.904214', '1409645315', '1409645567');
INSERT INTO `t_user` VALUES ('10066', '', 'yiming.fan@sigboat.com', '464cc02ad0b5155932934098a9c6e4d1', 'yiming.fan@sigboat.com', '', '', '', 'ffffffff-a787-f052-d350-46b32d6fb849', '1', '0.00', '1', '1', '0', '', '1', '1', '45ad942b-0849-fbb8-f6e1-6178f68a7e8c', '0', '1', '男', '116.40741300000002', '39.904214', '1409704001', '1409704001');
INSERT INTO `t_user` VALUES ('10067', '', '164492212@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '164492212@qq.com', '', '', '', 'ffffffff-e462-5e33-ffff-ffff9d35dbf9', '1', '0.00', '1', '1', '0', '', '1', '1', 'f8219f1d-ac62-a9d0-28d0-307c00cb626e', '0', '1', '男', '116.40741300000002', '39.904214', '1409706843', '1409706843');
INSERT INTO `t_user` VALUES ('10077', 'zhimei.chen', 'zhimei.chen@sigboat.com', '25d55ad283aa400af464c76d713c07ad', 'zhimei.chen@sigboat.com', '', '', '', '1040792741451370618', '1', '0.00', '1', '2', '0', '', '1', '1', '', '0', '1', '男', '121.517594', '31.268718', '1409800148', '1409900906');
INSERT INTO `t_user` VALUES ('10068', '陆逊', '67543356@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '6469744@qq.com', '', '15257421438', '', '', '2', '0.00', '1', '1', '19650708', 'Uploads/photo/2014/20140903/3926c694-21e7-d787-92fa-21f4c7e2c170.jpg', '3', '1', '896853f1-e553-23b5-1655-7129e96b45f7', '0', '2147483647', '男', '121.517975', '31.268808', '1409714949', '1409715710');
INSERT INTO `t_user` VALUES ('10069', '', '777777@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '777777@qq.com', '', '', '', '', '2', '0.00', '1', '1', '0', '', '1', '1', 'e62ba8ec-055b-b37c-85d1-d03bb13c9f52', '0', '1', '男', '121.517975', '31.268822', '1409716431', '1409716431');
INSERT INTO `t_user` VALUES ('10073', '', '555@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '555@qq.com', '', '', '', '', '2', '0.00', '1', '1', '0', '', '1', '1', '42bd945e-6d29-019a-3cf0-5d8703dc3ac7', '0', '1', '男', '121.517990', '31.268829', '1409730979', '1409730979');
INSERT INTO `t_user` VALUES ('10070', '', '123456789@qq.com', 'c33367701511b4f6020ec61ded352059', '123456789@qq.com', '', '', '', '', '2', '0.00', '1', '1', '0', '', '1', '1', '51cd1b25-6d36-e7bc-dbfe-eaf31a9b0476', '0', '1', '男', '117.159393', '39.125111', '1409718675', '1409718675');
INSERT INTO `t_user` VALUES ('10071', '', 'qwert123@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 'qwert123@qq.com', '', '', '', '', '2', '0.00', '1', '1', '0', '', '1', '1', '1e5a554d-0a47-3a5a-d92c-83693aae1f6c', '0', '1', '男', '117.159393', '39.125111', '1409718897', '1409718897');
INSERT INTO `t_user` VALUES ('10072', '', 'Ygsjcgihxugv@qq.cn', 'e10adc3949ba59abbe56e057f20f883e', 'Ygsjcgihxugv@qq.cn', '', '', '', '', '2', '0.00', '1', '1', '0', '', '1', '1', '6ffb5fb6-73b5-9013-11be-5e366a983935', '0', '1', '男', '117.160263', '39.125828', '1409719382', '1409719382');
INSERT INTO `t_user` VALUES ('10076', '陈陈', '5421725@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '565455@qq.com', '', '15245878855', '', '597805375998835329', '1', '0.00', '1', '1', '0', '', '1', '1', '13fad489-a64f-e5bc-7210-ae2f649e30a0', '0', '1', '男', '116.40741300000002', '39.904214', '1409795571', '1409797182');
INSERT INTO `t_user` VALUES ('10074', '', 'fhbj@qq.com', '467b617fec4d9fcb63505734ee224851', 'fhbj@qq.com', '', '', '', '', '2', '0.00', '1', '1', '0', '', '1', '1', '13d56008-5769-af8b-c7ce-478b786e9bc5', '0', '1', '男', '117.160561', '39.126072', '1409737409', '1409737409');
INSERT INTO `t_user` VALUES ('10086', '', '349896@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '349896@qq.com', '', '', '', '962849350288615039', '1', '0.00', '1', '1', '0', '', '1', '1', '07ac807f-0629-1192-85e6-820fe7534ddf', '0', '1', '0', '116.40741300000002', '39.904214', '1409900447', '1409900447');
INSERT INTO `t_user` VALUES ('10078', '汪汪', '637234@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '6374585@qq.com', '', '15287374908', '', '', '2', '0.00', '1', '1', '441734400', 'Uploads/photo/2014/20140904/f363c81e-2dd3-8108-bf2e-c084e1bc7d08.jpg', '2', '1', '71615d87-fe5a-ab72-3869-cfe092692ebb', '0', '30', '男', '121.517868', '31.269072', '1409802520', '1409802690');
INSERT INTO `t_user` VALUES ('10079', '一二', '649861@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '456789@qq.com', '', '13512458696', '', '', '1', '0.00', '1', '1', '1094227200', 'Uploads/photo/2014/20140904/171f52fe-de7a-58a7-6e15-567445aab60d.jpg', '2', '1', '61a5e316-4a62-2876-8e6f-632605d896e1', '0', '10', '男', '116.40741300000002', '39.904214', '1409815510', '1409826326');
INSERT INTO `t_user` VALUES ('10088', '', '765846@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '765846@qq.com', '', '', '', '953403114650950158', '1', '64.00', '1', '1', '0', '', '1', '2', 'c24a78e9-00ff-1724-8115-ff289164bcde', '0', '1', '0', '116.40741300000002', '39.904214', '1409902578', '1409902578');
INSERT INTO `t_user` VALUES ('10081', '', '24567@qq.com', '2ae5891468287526b7f0e977d9d0e3ec', '24567@qq.com', '', '', '', '', '2', '0.00', '1', '1', '0', '', '1', '1', 'd7903d03-7906-0b19-aa36-3c2a4b047aa8', '0', '1', '0', '0.000000', '0.000000', '1409826710', '1409826710');
INSERT INTO `t_user` VALUES ('10085', 'y', '987654321@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 'f', '', 't', '', '', '2', '0.00', '1', '1', '-602323200', 'Uploads/photo/2014/20140905/a856d079-f09e-1605-26e5-1c4d17f4d744.jpg', '3', '1', '4ef7457f-a5a9-4074-ed5a-56d1b122f48f', '0', '2147483647', '0', '117.159424', '39.125134', '1409897695', '1409898528');
INSERT INTO `t_user` VALUES ('10084', '', '1234567890@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '1234567890@qq.com', '', '', '', '', '2', '0.00', '1', '1', '0', '', '1', '1', '7404906a-19b0-9339-d216-5406dee7cf00', '0', '1', '0', '0.000000', '0.000000', '1409897628', '1409897628');
INSERT INTO `t_user` VALUES ('10087', '黑李逵', '645217@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '468285@qq.com', '', '15246587953', '', '703227984124769144', '1', '240.23', '1', '1', '589388400', 'Uploads/photo/2014/20140905/680275f8-2825-a20b-0a80-385d7a6ac850.jpg', '2', '2', '0f240d96-c280-9fca-1b86-ed00d632f917', '0', '26', '男', '116.40741300000002', '39.904214', '1409901310', '1409903468');
INSERT INTO `t_user` VALUES ('10083', 'wenbo.fu', 'wenbo.fu@sigboat.com', 'e10adc3949ba59abbe56e057f20f883e', 'wenbo.fu@sigboat.com', '', '', '', '774398300518413163', '2', '0.00', '1', '2', '0', '', '1', '1', '', '0', '1', '男', null, null, '1409887675', '1409914982');
INSERT INTO `t_user` VALUES ('10082', '曹杨', '73662@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '57743@qq.com', '', '15234544357', '', '', '2', '87.00', '1', '1', '599587200', 'Uploads/photo/2014/20140905/2760075f-3fdf-3548-145a-4b3d4fa3f10d.jpg', '2', '2', 'e88e0da9-220c-ba08-4759-740c77393729', '0', '25', '男', '0.000000', '0.000000', '1409826993', '1409897846');
INSERT INTO `t_user` VALUES ('10094', '', '146787@qq.com', '2e2044b888b3040b868ab3fd7ff3e546', '146787@qq.com', '', '', '', '', '2', '0.00', '1', '1', '0', '', '1', '1', '4f6a2fa0-9e56-8119-28e1-f2d9dea5517b', '0', '1', '0', '0.000000', '0.000000', '1409911295', '1409911295');
INSERT INTO `t_user` VALUES ('10089', '', 'qwert@163.com', 'd8578edf8458ce06fbc5bb76a58c5ca4', 'qwert@163.com', '', '', '', '', '2', '0.00', '1', '1', '0', '', '1', '1', 'e6885fcc-f606-0b90-0abc-293a9aab7bb5', '0', '1', '0', '117.160561', '39.126072', '1409904129', '1409904129');
INSERT INTO `t_user` VALUES ('10090', '', '4444444@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '4444444@qq.com', '', '', '', '1085157435002725217', '2', '0.00', '1', '1', '0', '', '1', '1', 'bb77b0a7-83e9-990c-9407-8762ce3a50bb', '0', '1', '0', '0.000000', '0.000000', '1409904254', '1409904254');
INSERT INTO `t_user` VALUES ('10091', 'y', '555555@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 'y', '', 'u', '', '', '2', '0.00', '1', '1', '-620467200', 'Uploads/photo/2014/20140905/343fb80d-01aa-0534-7e2f-f4b5a6e7f4e0.jpg', '3', '1', '0e9dff35-0e04-3fdc-9afe-ffe37417e0d2', '0', '2147483647', '0', '117.160561', '39.126072', '1409904740', '1409904914');
INSERT INTO `t_user` VALUES ('10092', '', '648193@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '648193@qq.com', '', '', '', '', '2', '0.00', '1', '1', '0', '', '1', '1', '4746b4a8-8da3-e644-956e-310f10e4bb7d', '0', '1', '0', '0.000000', '0.000000', '1409906085', '1409906085');
INSERT INTO `t_user` VALUES ('10093', '李四', '56@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '56@qq.com', '', '13003037878', '', '1020724994086083098', '2', '0.00', '1', '1', '260380800', 'Uploads/photo/2014/20140905/dc99e63c-7577-29c4-4a7e-3a55f8a34060.jpg', '2', '1', '5e6fe09f-9c47-e48c-28d5-5ac68f1ff449', '0', '36', '男', '0.000000', '0.000000', '1409906813', '1409909169');
INSERT INTO `t_user` VALUES ('10095', '', '367889@qq.com', '9288115158775d3a0bf02c1410e64393', '367889@qq.com', '', '', '', '', '2', '0.00', '1', '1', '0', '', '1', '1', '4a832e0b-56a1-a4af-4113-e1f66f49a5c4', '0', '1', '0', '117.160561', '39.126072', '1409911374', '1409911374');

-- ----------------------------
-- Table structure for `t_user_bank_card`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_bank_card`;
CREATE TABLE `t_user_bank_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '绑定银行卡ID',
  `user_id` int(11) DEFAULT '0' COMMENT '用户ID',
  `card_no` varchar(20) DEFAULT '' COMMENT '银行卡号/支付宝帐号',
  `bank_id` int(11) DEFAULT '0' COMMENT '办卡银行ID',
  `card_user` varchar(100) DEFAULT '' COMMENT '持卡人',
  `type` int(11) DEFAULT '1' COMMENT '类型（1、银行卡；2、支付宝）',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_bank_card
-- ----------------------------
INSERT INTO `t_user_bank_card` VALUES ('1', '10002', 'ytuifg', '0', '', '2', '1409215140');
INSERT INTO `t_user_bank_card` VALUES ('47', '10012', '18772772777', '0', '', '2', '1409916404');
INSERT INTO `t_user_bank_card` VALUES ('3', '10015', 'tiancaiwu1984@hotmai', '0', '', '2', '1409258095');
INSERT INTO `t_user_bank_card` VALUES ('4', '10015', 'ygggvv@hvd.com', '0', '', '2', '1409258147');
INSERT INTO `t_user_bank_card` VALUES ('5', '10014', 'jojojo584@yahoo.com', '0', '', '2', '1409264125');
INSERT INTO `t_user_bank_card` VALUES ('46', '10012', null, '0', '', '2', '1409916381');
INSERT INTO `t_user_bank_card` VALUES ('7', '10010', 'gghhhhhhh', '0', '', '2', '1409316122');
INSERT INTO `t_user_bank_card` VALUES ('8', '10004', 'g g g vvvvv g g', '0', '', '2', '1409316124');
INSERT INTO `t_user_bank_card` VALUES ('45', '10012', null, '0', '', '2', '1409916335');
INSERT INTO `t_user_bank_card` VALUES ('10', '10032', '18516325698', '0', '', '2', '1409382123');
INSERT INTO `t_user_bank_card` VALUES ('44', '10012', null, '0', '', '2', '1409913247');
INSERT INTO `t_user_bank_card` VALUES ('43', '10012', null, '0', '', '2', '1409913243');
INSERT INTO `t_user_bank_card` VALUES ('13', '10041', '6227002022080848414', '2', '一一', '1', '1409457620');
INSERT INTO `t_user_bank_card` VALUES ('14', '10003', '6228480031729846910', '3', '丁百計', '1', '1409471276');
INSERT INTO `t_user_bank_card` VALUES ('15', '10012', '6227002022080848414', '2', '一一', '1', '1409472029');
INSERT INTO `t_user_bank_card` VALUES ('16', '10039', '6227002022080792414', '2', '陈志梅', '1', '1409482884');
INSERT INTO `t_user_bank_card` VALUES ('17', '10039', '18679174583', '0', '', '2', '1409484075');
INSERT INTO `t_user_bank_card` VALUES ('18', '10003', '12344', '0', '', '2', '1409554540');
INSERT INTO `t_user_bank_card` VALUES ('19', '10003', '123456', '1', '丁百計', '1', '1409556456');
INSERT INTO `t_user_bank_card` VALUES ('21', '10012', '18770088371', '0', '', '2', '1409559443');
INSERT INTO `t_user_bank_card` VALUES ('22', '10060', '6227002022080792414', '2', '陈志梅', '1', '1409713210');
INSERT INTO `t_user_bank_card` VALUES ('23', '10012', '6222000000000000111', '8', 'qw', '1', '1409757220');
INSERT INTO `t_user_bank_card` VALUES ('24', '10060', '18777885555', '0', '', '2', '1409813749');
INSERT INTO `t_user_bank_card` VALUES ('25', '10060', '187568565558', '0', '', '2', '1409815270');
INSERT INTO `t_user_bank_card` VALUES ('26', '10012', '13535358585', '0', '', '2', '1409832967');
INSERT INTO `t_user_bank_card` VALUES ('27', '10078', '6227002022080848414', '2', '帆', '1', '1409835192');
INSERT INTO `t_user_bank_card` VALUES ('28', '10078', '6227002022080848411', '2', '帆', '1', '1409835207');
INSERT INTO `t_user_bank_card` VALUES ('29', '10078', '6227002022080848537', '2', '帆', '1', '1409835243');
INSERT INTO `t_user_bank_card` VALUES ('30', '10078', '6217850800008816983', '4', '彭帆', '1', '1409835342');
INSERT INTO `t_user_bank_card` VALUES ('36', '10060', '15865888852', '0', '', '2', '1409889134');
INSERT INTO `t_user_bank_card` VALUES ('32', '10039', '6227002022080848413', '2', '张三', '1', '1409881779');
INSERT INTO `t_user_bank_card` VALUES ('33', '10012', '6222020608003554524', '1', 'yrf', '1', '1409887757');
INSERT INTO `t_user_bank_card` VALUES ('34', '10012', '6223020608003554523', '2', 'yrf', '1', '1409887793');
INSERT INTO `t_user_bank_card` VALUES ('35', '10012', '62230206080035545', '2', 'yrf', '1', '1409887811');
INSERT INTO `t_user_bank_card` VALUES ('37', '10012', '123456788908654', '1', 'yrf', '1', '1409901081');
INSERT INTO `t_user_bank_card` VALUES ('38', '10012', null, '0', '', '2', '1409902912');
INSERT INTO `t_user_bank_card` VALUES ('39', '10087', '62270020222080792414', '2', '陈志梅', '1', '1409903617');
INSERT INTO `t_user_bank_card` VALUES ('40', '10087', '18770088372', '0', '', '2', '1409904288');
INSERT INTO `t_user_bank_card` VALUES ('41', '10012', null, '0', '', '2', '1409908571');
INSERT INTO `t_user_bank_card` VALUES ('42', '10093', '6227002022080848531', '2', '123456', '1', '1409909317');

-- ----------------------------
-- Table structure for `t_user_bill`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_bill`;
CREATE TABLE `t_user_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '账单表ID',
  `user_id` int(11) DEFAULT '0' COMMENT '用户ID',
  `money` float(11,2) DEFAULT '0.00' COMMENT '操作金额',
  `is_access` int(11) DEFAULT '1' COMMENT '存取（1、存+；2、取-）',
  `status` int(11) DEFAULT '1' COMMENT '状态（1、等待交易；2、交易成功；3、交易失败；）',
  `currency` int(11) DEFAULT '1' COMMENT '币种（1、人民币，2、英镑）',
  `card_id` int(11) DEFAULT '0' COMMENT '绑定卡ID',
  `opposition_reason` text COMMENT '反对理由',
  `voucher` varchar(200) DEFAULT '' COMMENT '凭证图片',
  `create_time` int(11) DEFAULT '0' COMMENT '生成日期',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_bill
-- ----------------------------
INSERT INTO `t_user_bill` VALUES ('1', '10041', '320.00', '2', '1', '1', '2147483647', null, null, '1409457728', null);
INSERT INTO `t_user_bill` VALUES ('2', '10003', '200.00', '2', '1', '1', '2147483647', null, null, '1409471509', null);
INSERT INTO `t_user_bill` VALUES ('3', '10012', '150.00', '2', '1', '1', '2147483647', null, null, '1409472059', null);
INSERT INTO `t_user_bill` VALUES ('4', '10039', '32158.00', '2', '1', '1', '2147483647', null, null, '1409483203', null);
INSERT INTO `t_user_bill` VALUES ('5', '10039', '32158.00', '2', '1', '1', '2147483647', null, null, '1409483380', null);
INSERT INTO `t_user_bill` VALUES ('6', '10003', '20.00', '2', '1', '1', '2147483647', null, null, '1409484029', null);
INSERT INTO `t_user_bill` VALUES ('7', '10003', '4.00', '2', '1', '1', '2147483647', null, null, '1409484061', null);
INSERT INTO `t_user_bill` VALUES ('8', '10003', '10.00', '2', '1', '1', '2147483647', null, null, '1409537455', null);
INSERT INTO `t_user_bill` VALUES ('9', '10039', '2000.00', '2', '1', '1', '2147483647', null, null, '1409550523', null);
INSERT INTO `t_user_bill` VALUES ('10', '10039', '2000.00', '2', '1', '1', '2147483647', null, null, '1409550557', null);
INSERT INTO `t_user_bill` VALUES ('11', '10039', '2000.00', '2', '1', '1', '2147483647', null, null, '1409550751', null);
INSERT INTO `t_user_bill` VALUES ('12', '10039', '100.00', '2', '1', '1', '2147483647', null, null, '1409551937', null);
INSERT INTO `t_user_bill` VALUES ('46', '10012', '2000.00', '2', '1', '1', '47', null, '', '1409916404', '0');
INSERT INTO `t_user_bill` VALUES ('47', '10012', '2000.00', '2', '1', '1', '47', null, '', '1409916406', '0');
INSERT INTO `t_user_bill` VALUES ('48', '10012', '2000.00', '2', '1', '1', '47', null, '', '1409916409', '0');
INSERT INTO `t_user_bill` VALUES ('49', '10012', '2000.00', '2', '1', '1', '47', null, '', '1409916416', '0');
INSERT INTO `t_user_bill` VALUES ('50', '10012', '2000.00', '2', '1', '1', '47', null, '', '1409916418', '0');

-- ----------------------------
-- Table structure for `t_user_login`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_login`;
CREATE TABLE `t_user_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `login_token` varchar(100) NOT NULL COMMENT '登录令牌',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_login
-- ----------------------------
INSERT INTO `t_user_login` VALUES ('1', '1', '{765efcb3-ece4-8a7c-fabd-8183bf2593d0}');
INSERT INTO `t_user_login` VALUES ('2', '2', '{e8932e12-232f-2268-3816-ac72cbf7a95c}');
INSERT INTO `t_user_login` VALUES ('3', '3', '{4cacd54d-bf1a-c6ed-887c-69b582de9097}');
INSERT INTO `t_user_login` VALUES ('4', '4', '{3bd460ed-7ec5-b430-4652-dcb932636e63}');
INSERT INTO `t_user_login` VALUES ('5', '5', '{8c8522c3-fc7a-d40b-22c1-5de1a70a69f0}');
INSERT INTO `t_user_login` VALUES ('6', '10002', '{ae2589e8-9ce6-c22c-1c22-c39deeaa8aad}');
INSERT INTO `t_user_login` VALUES ('7', '10007', '{89c78a67-266d-7a3f-a7aa-5488549db66a}');
INSERT INTO `t_user_login` VALUES ('8', '10006', '{d0bfa013-11d4-6848-1de3-5c840d27e6e4}');
INSERT INTO `t_user_login` VALUES ('9', '10008', '{4471bd70-2988-d818-1c5c-db6856b5afd8}');
INSERT INTO `t_user_login` VALUES ('10', '10004', '{3f1e8b11-d29b-592a-1329-63f647342229}');
INSERT INTO `t_user_login` VALUES ('11', '10009', '{3f1e89be-c594-ebf5-56ce-ea6dcc197d1d}');
INSERT INTO `t_user_login` VALUES ('12', '10010', '{d46bc643-ac43-3840-bdcb-c75ab4bb3171}');
INSERT INTO `t_user_login` VALUES ('13', '10011', '{10e600d8-6b67-57aa-cc00-9571619e7c58}');
INSERT INTO `t_user_login` VALUES ('14', '10003', '{2984b1b1-d26e-48ba-513d-8853f0b3e8fb}');
INSERT INTO `t_user_login` VALUES ('15', '10012', '{0147fb83-3a30-6c3f-186f-9f471ea082ae}');
INSERT INTO `t_user_login` VALUES ('16', '10001', '{93d4d8b0-2d26-c980-e592-67935230fb07}');
INSERT INTO `t_user_login` VALUES ('17', '10013', '{8cba0c46-881b-2c8e-b419-004533a764f0}');
INSERT INTO `t_user_login` VALUES ('18', '10014', '{339feb3f-4cc2-c7c7-4261-c50192b40e26}');
INSERT INTO `t_user_login` VALUES ('19', '10015', '{550d8947-33c8-ae2f-a623-88689ded463b}');
INSERT INTO `t_user_login` VALUES ('20', '10016', '{03b122c6-6a75-d883-1a21-ec45ff8e31b6}');
INSERT INTO `t_user_login` VALUES ('21', '10017', '{7eeb0f0f-6929-08d6-ea91-a3cfb5ae503c}');
INSERT INTO `t_user_login` VALUES ('22', '10018', '{62160d01-1784-3a0e-39f6-86dd4eecabb1}');
INSERT INTO `t_user_login` VALUES ('23', '10020', '{971fa965-03c2-deb4-6920-b8881c50ee11}');
INSERT INTO `t_user_login` VALUES ('24', '10025', '{cacf0594-32b9-6c36-6055-2fde0c4fde7d}');
INSERT INTO `t_user_login` VALUES ('25', '10026', '{d922b538-fedf-2321-458a-46adb7151bad}');
INSERT INTO `t_user_login` VALUES ('26', '10027', '{c9641a98-96f8-b1a3-5576-2b9be62134f8}');
INSERT INTO `t_user_login` VALUES ('27', '10028', '{e56c2ea1-e6ea-db0a-1e15-b9fbc80981e8}');
INSERT INTO `t_user_login` VALUES ('28', '10029', '{96c6a742-055a-1b68-9161-922501219bbb}');
INSERT INTO `t_user_login` VALUES ('29', '10030', '{11f3f300-8a51-ad25-cb39-c11e552fc8fe}');
INSERT INTO `t_user_login` VALUES ('30', '10031', '{68b254b0-3001-0503-232b-6385f0238901}');
INSERT INTO `t_user_login` VALUES ('31', '10032', '{2e14f51a-217f-6482-d2b1-6339d478e9ba}');
INSERT INTO `t_user_login` VALUES ('32', '10022', '{a7642b24-f663-abb2-339b-c261eceb789b}');
INSERT INTO `t_user_login` VALUES ('33', '10035', '{0ef56965-8bf8-8f4a-fa81-f6245b0cda35}');
INSERT INTO `t_user_login` VALUES ('34', '10036', '{1d972151-f148-b91d-8853-3a87de26a271}');
INSERT INTO `t_user_login` VALUES ('35', '10037', '{f5f59b92-4ada-47a3-5788-cd37858e35a6}');
INSERT INTO `t_user_login` VALUES ('36', '10038', '{1302bbe0-b1bc-1699-5839-dde08eb3d218}');
INSERT INTO `t_user_login` VALUES ('37', '10039', '{507635f9-d0d3-e814-55cd-74c6bf9e36d1}');
INSERT INTO `t_user_login` VALUES ('38', '10040', '{03b26e38-1d47-9011-885b-9c953ad60a72}');
INSERT INTO `t_user_login` VALUES ('39', '10041', '{04c588f9-a3c3-93c4-2c54-73c7d644d62e}');
INSERT INTO `t_user_login` VALUES ('40', '10042', '{13ce7169-fa43-b74a-aa60-3ace2a6aabea}');
INSERT INTO `t_user_login` VALUES ('41', '10043', '{f49377b6-1410-d7e6-074c-9fb7231386b0}');
INSERT INTO `t_user_login` VALUES ('42', '10044', '{87ad050c-a9c0-c6ab-5ad6-f226e398451d}');
INSERT INTO `t_user_login` VALUES ('43', '10048', '{dcf65ac3-bf4b-4710-39ad-14fef806b0fb}');
INSERT INTO `t_user_login` VALUES ('44', '10049', '{347aabe7-b182-c6f0-2995-37746cae70a8}');
INSERT INTO `t_user_login` VALUES ('45', '10050', '{00296ec2-7118-acca-4c7b-82d707d09e2b}');
INSERT INTO `t_user_login` VALUES ('46', '10051', '{3a55c3aa-a168-0445-6267-bed1457033e6}');
INSERT INTO `t_user_login` VALUES ('47', '10052', '{25c24a5c-e450-fb3e-ad1e-1399e7e8a389}');
INSERT INTO `t_user_login` VALUES ('48', '10053', '{095a7101-43bb-d966-e3eb-fcb79880f7a1}');
INSERT INTO `t_user_login` VALUES ('49', '10054', '{bb7c5ac0-00ea-ee82-2ddc-41c2d56afd3e}');
INSERT INTO `t_user_login` VALUES ('50', '10055', '{6f929bee-9b13-cb9d-20ee-6b3f6b0400f5}');
INSERT INTO `t_user_login` VALUES ('51', '10056', '{856a8f78-d601-f9f8-6552-840d52e9ee2e}');
INSERT INTO `t_user_login` VALUES ('52', '10057', '{4e8046fa-6887-fc5a-8348-65691d5b95b2}');
INSERT INTO `t_user_login` VALUES ('53', '10058', '{ec9f1d04-63de-63cd-06b4-8c4cc572a778}');
INSERT INTO `t_user_login` VALUES ('54', '10059', '{544a6eb5-0e87-2fa1-0cc2-d22c5d7d7949}');
INSERT INTO `t_user_login` VALUES ('55', '10060', '{5bcf5d9c-b140-33d9-d1ba-312bb2cbbb68}');
INSERT INTO `t_user_login` VALUES ('56', '10061', '{c23e74f6-4a0b-1949-777e-8e1dfc6887e5}');
INSERT INTO `t_user_login` VALUES ('57', '10062', '{dcab1605-e110-1ed2-8b40-e5aab0366d82}');
INSERT INTO `t_user_login` VALUES ('58', '10063', '{015b63e3-406f-c03e-c9ab-ef53e0f8db47}');
INSERT INTO `t_user_login` VALUES ('59', '10064', '{b4527f54-e48c-4ba4-38cc-5330f240822a}');
INSERT INTO `t_user_login` VALUES ('60', '10065', '{cb293ff7-dd12-31bf-3f4d-a3f85bce6f59}');
INSERT INTO `t_user_login` VALUES ('61', '10066', '{4b73f507-9133-422d-b76e-c9effe80456d}');
INSERT INTO `t_user_login` VALUES ('62', '10067', '{d63fe7ff-21be-e36e-af55-946514797588}');
INSERT INTO `t_user_login` VALUES ('63', '10068', '{70863728-0a06-a7a5-0308-15927141e0cb}');
INSERT INTO `t_user_login` VALUES ('64', '10069', '{26540051-7182-5ba8-412e-cdba54ea9f93}');
INSERT INTO `t_user_login` VALUES ('65', '10070', '{73aee06a-8981-6c4a-ade4-239ad929a250}');
INSERT INTO `t_user_login` VALUES ('66', '10071', '{13f6bd80-a8ae-96d7-337e-fef540d20e1d}');
INSERT INTO `t_user_login` VALUES ('67', '10072', '{77965926-70d2-c12a-ab69-513497005586}');
INSERT INTO `t_user_login` VALUES ('68', '10073', '{bcbf5015-068d-6fce-44b5-ba735d4531a1}');
INSERT INTO `t_user_login` VALUES ('69', '10074', '{1492e4b9-2b9b-4436-b0d0-333d42669472}');
INSERT INTO `t_user_login` VALUES ('70', '10075', '{0ee51c84-d36b-fbcb-aa20-711ab5d95856}');
INSERT INTO `t_user_login` VALUES ('71', '10076', '{30fdce37-4e7a-82c7-39dd-3feeb3175a51}');
INSERT INTO `t_user_login` VALUES ('72', '10077', '{02888e33-d855-edaa-dc31-21a25231992b}');
INSERT INTO `t_user_login` VALUES ('73', '10078', '{301f35e3-1530-f2d3-af5d-cdd7009bb059}');
INSERT INTO `t_user_login` VALUES ('74', '10079', '{e45c119d-da3b-bea8-4019-ec94155821f0}');
INSERT INTO `t_user_login` VALUES ('75', '10080', '{80cd0328-9015-1cb1-4582-40206dc254e3}');
INSERT INTO `t_user_login` VALUES ('76', '10081', '{e576b345-8f09-ed65-d842-efafb38365fd}');
INSERT INTO `t_user_login` VALUES ('77', '10082', '{19be41e0-c618-4ce1-b64a-3faf2f26335f}');
INSERT INTO `t_user_login` VALUES ('78', '10019', '{2cdff30d-c890-2970-e1d6-b2ce3fa92297}');
INSERT INTO `t_user_login` VALUES ('79', '10046', '{e89ff4b9-06fd-7896-bb68-0eeea4137583}');
INSERT INTO `t_user_login` VALUES ('80', '10083', '{8f6bf882-9bae-c2e5-b7d1-80ca6b1301ac}');
INSERT INTO `t_user_login` VALUES ('81', '10084', '{54cf2a6d-e3ba-a926-e940-5d635691b449}');
INSERT INTO `t_user_login` VALUES ('82', '10085', '{dbd87f65-e0c0-c743-4f5d-b2e2970d7f7d}');
INSERT INTO `t_user_login` VALUES ('83', '10086', '{fe337689-52fd-e20f-9c67-dcbbbb1478e3}');
INSERT INTO `t_user_login` VALUES ('84', '10087', '{94b157ca-626e-e451-0e5a-cbc9a7856d2a}');
INSERT INTO `t_user_login` VALUES ('85', '10088', '{42185626-022a-9ab5-f849-8783f2d334dc}');
INSERT INTO `t_user_login` VALUES ('86', '10089', '{917c25e7-5818-10df-8732-0cecf9d60801}');
INSERT INTO `t_user_login` VALUES ('87', '10090', '{99901cce-273b-fc6e-7946-279794ac96fd}');
INSERT INTO `t_user_login` VALUES ('88', '10091', '{4116b028-6e64-364b-9ecb-49a73c8e9514}');
INSERT INTO `t_user_login` VALUES ('89', '10092', '{b266d3f1-367f-07fa-f93b-78c8a19f3323}');
INSERT INTO `t_user_login` VALUES ('90', '10093', '{f509cbf8-2cc5-c8d5-a424-415c25a21b72}');
INSERT INTO `t_user_login` VALUES ('91', '10094', '{1a52af77-53ca-666e-4fbc-a580fa3fc79c}');
INSERT INTO `t_user_login` VALUES ('92', '10095', '{2e5ca03f-8e1b-484c-9ea1-a365a09274cc}');
