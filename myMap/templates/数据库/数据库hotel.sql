/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : hotel

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-03-07 09:44:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('14', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('16', 'Can view user', '4', 'view_user');
INSERT INTO `auth_permission` VALUES ('17', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('18', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('20', 'Can view content type', '5', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('21', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('22', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('24', 'Can view session', '6', 'view_session');
INSERT INTO `auth_permission` VALUES ('25', 'Can add basic info', '7', 'add_basicinfo');
INSERT INTO `auth_permission` VALUES ('26', 'Can change basic info', '7', 'change_basicinfo');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete basic info', '7', 'delete_basicinfo');
INSERT INTO `auth_permission` VALUES ('28', 'Can view basic info', '7', 'view_basicinfo');
INSERT INTO `auth_permission` VALUES ('29', 'Can add detail info', '8', 'add_detailinfo');
INSERT INTO `auth_permission` VALUES ('30', 'Can change detail info', '8', 'change_detailinfo');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete detail info', '8', 'delete_detailinfo');
INSERT INTO `auth_permission` VALUES ('32', 'Can view detail info', '8', 'view_detailinfo');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `basic`
-- ----------------------------
DROP TABLE IF EXISTS `basic`;
CREATE TABLE `basic` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `lng_lat` varchar(60) NOT NULL COMMENT '经纬',
  `name` varchar(60) DEFAULT '未知' COMMENT '酒店名',
  `address` varchar(60) DEFAULT '未知' COMMENT '酒店地址',
  `telephone` varchar(20) DEFAULT '未知' COMMENT '电话',
  `imgurl` varchar(300) DEFAULT 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2774277168,3696497128&fm=26&gp=0.jpg' COMMENT '酒店图片链接',
  `price` varchar(10) DEFAULT '0' COMMENT '酒店最低价格',
  `uid` varchar(200) DEFAULT NULL COMMENT '获取酒店信息接口的酒店代码',
  PRIMARY KEY (`id`),
  KEY `lng_lat` (`lng_lat`),
  KEY `uid` (`uid`),
  KEY `tr` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of basic
-- ----------------------------
INSERT INTO `basic` VALUES ('1', '115.58070398601,38.880896109179', '汉庭酒店(保定七一东路店)', '保定市莲池区七一东路3158号', '(0312)6786077', '/static/img/fail.jpg', '170.0', '5f17dac71ed3ac1a04026fbe');
INSERT INTO `basic` VALUES ('2', '115.57578773961,38.894462598839', '艾尚客主题酒店(河大新区保定东站店)', '河北省保定市莲池区百楼乡河北大学工商学院学苑街北头', '(0312)5050555', '/static/img/fail.jpg', '86.0', '3a84bcefecf96577c7f50d7b');
INSERT INTO `basic` VALUES ('3', '115.5771270233,38.894221096386', '雕刻时光主题宾馆', '河北省保定市莲池区隆兴东路与学苑街交叉口河北大学新校区附近', '(0312)6791010', '/static/img/fail.jpg', '61.0', 'ed87f70847b062b09ff77954');
INSERT INTO `basic` VALUES ('4', '115.57909745643,38.885532846055', '保定青年公寓', '保定市莲池区河大新校区东200米十七中后面', '13582627164', '/static/img/fail.jpg', '49.0', 'd5d2b3792d200e366cc02ce5');
INSERT INTO `basic` VALUES ('5', '115.57924998871,38.880679136462', '保定驿缕阳光主题酒店', '河北省保定市莲池区七一中路未来像素', '15733223335', '/static/img/fail.jpg', '68.0', '4417ae25f218ef42a10464e1');
INSERT INTO `basic` VALUES ('6', '115.57830703741,38.886388105172', '保定大学城公寓', '河北省保定市莲池区河大新区东200米(大学城内)', '13784991543', '/static/img/fail.jpg', '39.0', '72ce9be04b189ad4853304a7');
INSERT INTO `basic` VALUES ('7', '115.57571740229,38.894210214715', '月亮湾宾馆', '河北省保定市莲池区河北大学新校区学苑街与隆兴东路交叉口南行50米', '18633203685', '/static/img/fail.jpg', '58.0', '78e4decd9f20c2b7a8175a29');
INSERT INTO `basic` VALUES ('8', '115.57912296831,38.885595124941', '保定洋洋公寓', '河北省保定市莲池区河大新区大学城校区94号门脸', '13930832817', '/static/img/fail.jpg', '32.0', '8a38dd8957edf1a483a00c67');
INSERT INTO `basic` VALUES ('9', '115.57881808342,38.886224159663', '保定如家短租公寓', '河北省保定市莲池区学院街大学城小区5号楼66号', '15720100228', '/static/img/fail.jpg', '36.0', 'b787fc4be7a98c899fec2bd2');
INSERT INTO `basic` VALUES ('10', '115.57628899409,38.894003111629', '嘉亿华连锁酒店', '河北省保定市莲池区学苑街与隆兴东路交叉口南150米', '(0312)3363288', '/static/img/fail.jpg', '70.0', '6f2d3cf49ea683ca108824e2');
INSERT INTO `basic` VALUES ('11', '115.58653201249,38.891519090835', '保定艾尚旅馆', '河北省保定市莲池区市保定清苑区保定学院北侧', '13784275644', '/static/img/fail.jpg', '49.0', '11b478ea6a1e5cfbf942b2f6');
INSERT INTO `basic` VALUES ('12', '104.08269699572,37.199343969936', '栋盛国际酒店', '甘肃省白银市景泰县寿鹿街与东环路交汇处西北', '(0943)5994888', '/static/img/fail.jpg', '188.0', '9ebb06bced84f52694ec84bf');
INSERT INTO `basic` VALUES ('13', '104.08393602851,37.203187952106', '华隆商旅宾馆', '景泰东环路与大安路交叉口', '(0943)5529911', '/static/img/fail.jpg', '59.0', 'e7abcc0008d0c2b95fd4fec3');
INSERT INTO `basic` VALUES ('14', '104.07553803979,37.19644993018', '嘉缘商务宾馆', '景泰一条山镇永泰路6号', '(0943)5590666', '/static/img/fail.jpg', '120.0', '727e5d77650226d530f71dd0');
INSERT INTO `basic` VALUES ('15', '104.07540095837,37.198342987344', '鼎盛招待所', '一条山镇景泰县人民医院对面', '', '/static/img/fail.jpg', '', 'b9418af54e3e4804c17da261');
INSERT INTO `basic` VALUES ('16', '104.0687361603,37.198755196313', '景电宾馆', '甘肃省白银市景泰县昌林路与寿鹿街交叉口向东50米', '(0943)5592999', '/static/img/fail.jpg', '99.0', '6113ef77acb470148e772725');
INSERT INTO `basic` VALUES ('17', '104.06669053899,37.19204782303', '康辉主题商务酒店', '甘肃省白银市景泰县昌林路与长城路交叉口西南200米', '(0943)5915222', '/static/img/fail.jpg', '78.0', 'dc7b05a5ccd2c40c744ff171');
INSERT INTO `basic` VALUES ('18', '104.06277302866,37.200015955262', '白银景泰县锦御宫大酒店', '甘肃省白银市景泰县一条山镇火车站路224号', '(0943)5596699', '/static/img/fail.jpg', '80.0', '68ccd2586afa70148d77279d');
INSERT INTO `basic` VALUES ('19', '104.0675532716,37.199246739605', '博格豪森商务酒店', '一条山镇昌林路中国工商银行旁', '(0943)5537333', '/static/img/fail.jpg', '67.0', 'b30c6a4bf0ca04ebc26c148a');
INSERT INTO `basic` VALUES ('20', '104.06584397588,37.198597959268', '麒源快捷宾馆贵宾楼', '甘肃省白银市景泰县一条山镇705路人民文化广场南侧', '(0943)5525555', '/static/img/fail.jpg', '', '16da29e2b76a3bffafee7a95');
INSERT INTO `basic` VALUES ('21', '104.06722898331,37.198706976029', '白银麒源快捷宾馆', '甘肃省白银市景泰县一条山镇昌林路人民文化广场东口', '(0943)5951111', '/static/img/fail.jpg', '', '8fec44f0d9298931abf0cd5e');
INSERT INTO `basic` VALUES ('22', '104.06678926277,37.199147640713', '景泰龙门假日宾馆', '甘肃省白银市景泰县人民文化广场东侧10米', '(0943)5521588', '/static/img/fail.jpg', '0.0', '682d8b588628091bf50e772e');
INSERT INTO `basic` VALUES ('23', '104.07047393231,37.193320912607', '石林快捷宾馆(1店)', '甘肃省白银市景泰县长城路197号', '(0943)5555568', '/static/img/fail.jpg', '0.0', '35dda15ba92038772db96dd9');
INSERT INTO `basic` VALUES ('24', '104.06792499042,37.200619953606', '白银景泰县人民政府招待所', '甘肃省白银市景泰县人民路2号', '(0943)5533800', '/static/img/fail.jpg', '0.0', 'ef773a0f2e13b83422022025');
INSERT INTO `basic` VALUES ('25', '104.07010526773,37.207871649214', '景泰福水源商务宾馆', '甘肃省白银市景泰县一条山镇705路100号(近308省道)', '(0943)5572979', '/static/img/fail.jpg', '77.0', '97aa2aabfef99189223bf21e');
INSERT INTO `basic` VALUES ('26', '104.07070201208,37.210757990253', '银丰宾馆', '甘肃省白银市景泰县建材路与昌林路交叉口东100米', '(0943)5952111', '/static/img/fail.jpg', '', '2f9a0b357cc276d0f603b8ea');
INSERT INTO `basic` VALUES ('27', '104.06998426597,37.207543345118', '景泰金鹏招待所', '甘肃省白银市景泰县一条山镇705北路(林业局旁)', '15336088789', '/static/img/fail.jpg', '0.0', '131abb233d5fc71400ec0136');
INSERT INTO `basic` VALUES ('28', '121.812644114,31.156014511574', '大众空港宾馆(上海浦东国际机场店)', '上海市浦东新区迎宾大道6000号', '(021)38799999', '/static/img/fail.jpg', '476.0', 'd52831f9b8bdffbe2efaa716');
INSERT INTO `basic` VALUES ('29', '121.81214753071,31.157453029521', '大众空港宾馆北楼', '迎宾大道6001号', '', '/static/img/fail.jpg', '', 'c44c19e7f2f1088796ca0754');
INSERT INTO `basic` VALUES ('30', '121.81272720726,31.156028572383', '大众空港宾馆-南楼', '上海市浦东新区迎宾大道6001号', '', '/static/img/fail.jpg', '', '8fe10be282081561a20464bd');
INSERT INTO `basic` VALUES ('31', '121.81255257666,31.15647295465', '大众空港宾馆南楼-商务中心', '上海市浦东新区迎宾大道6001号大众空港宾馆南楼1层', '(021)38799999', '/static/img/fail.jpg', '', 'a0fb7e20bbe9241fa8059d6c');
INSERT INTO `basic` VALUES ('32', '121.7739179838,31.156102893764', '上海笛波人力资源有限公司住宿基地', '上海市浦东新区施新路1281号', '', '/static/img/fail.jpg', '', '3e10942c17fc861f2b201aa6');
INSERT INTO `basic` VALUES ('33', '121.76949203255,31.149632927549', '维也纳国际酒店(浦东机场自贸区店)', '上海市浦东新区祝桥镇施湾六路566号', '(021)58389888', '/static/img/fail.jpg', '166.0', 'e2608a3f5d448d125a3ac81a');
INSERT INTO `basic` VALUES ('34', '121.75742895735,31.152354844142', '上海浦东机场亚朵酒店', '上海市浦东新区施新路551号', '(021)68002333', '/static/img/fail.jpg', '390.0', 'cdbdd287e1a4a034d813181f');
INSERT INTO `basic` VALUES ('35', '121.77069297719,31.147919848908', '新爵皇家酒店(上海浦东机场店)', '上海市浦东新区远航路669号', '(021)50968900', '/static/img/fail.jpg', '231.0', 'be7eebfbc5508429e311039b');
INSERT INTO `basic` VALUES ('36', '121.76426155889,31.153276708416', '万信慧选酒店(上海浦东机场一店)', '上海市浦东新区施新路802弄2号楼', '(021)50640198', '/static/img/fail.jpg', '120.0', '0bae28cbf50ece9f9e95de4a');
INSERT INTO `basic` VALUES ('37', '121.7658335037,31.153621362185', '丽豪世纪大酒店(上海浦东机场迪士尼店)', '上海市浦东新区施湾镇施新路958号', '(021)68969777', '/static/img/fail.jpg', '', '1a3202661807a13c734b8764');
INSERT INTO `basic` VALUES ('38', '121.76564198497,31.157758885569', '98连锁旅店', '上海市浦东新区施宏路427号', '(021)68960197', '/static/img/fail.jpg', '90.0', '7ce2d7a524ae08b701294f8a');
INSERT INTO `basic` VALUES ('39', '121.76645270569,31.153970186668', '和颐至格酒店(上海浦东机场自贸区店)', '上海市浦东新区施新路958号', '(021)50965255', '/static/img/fail.jpg', '119.0', 'f322106320080ecf1d580017');
INSERT INTO `basic` VALUES ('40', '121.76531221701,31.157430007227', 'Q加·上海世佳慧选酒店(浦东国际机场店)', '上海浦东新区施宏路396号，近川南奉公路', '(021)50492066', '/static/img/fail.jpg', '102.0', '6ea1acfdde6546da2d47338d');
INSERT INTO `basic` VALUES ('41', '121.76343502799,31.160258848623', '美聚汇酒店(浦东机场祝桥店)', '上海市浦东新区航城路508号', '(021)58819298', '/static/img/fail.jpg', '51.0', 'ab89a3f9cd7f090f7702696d');
INSERT INTO `basic` VALUES ('42', '121.76719380774,31.157777735972', '绘家宾馆', '上海市浦东新区机场施湾镇水闸北路243号', '(021)50966188', '/static/img/fail.jpg', '75.0', '69fcd6dfa5ce2051cb29158c');
INSERT INTO `basic` VALUES ('43', '121.73198553175,31.161092566855', '敏祥精品酒店(上海浦东机场店)', '上海市浦东新区德兴街158号', '(021)68810236', '/static/img/fail.jpg', '81.0', '2f35cb5f598d3c0e601c6762');
INSERT INTO `basic` VALUES ('44', '121.73532695875,31.157886821018', '上海普庆商务宾馆(浦东机场川沙店)', '上海市浦东新区川普新路80号', '(021)58387591', '/static/img/fail.jpg', '60.0', '801778960b9425b68af15d59');
INSERT INTO `basic` VALUES ('45', '121.732418515,31.160453759507', '天普宾馆(普园路)', '六团镇德兴路219号', '(021)58598560', '/static/img/fail.jpg', '100.0', '0a15c7ec166babfdec74f8a0');
INSERT INTO `basic` VALUES ('46', '121.73807146175,31.160941691597', '上海Trueland纯然独栋别墅', '上海市浦东新区六团镇吴店村东乔家宅,凌空路(迪士尼度假区)', '(021)80187829-50456', '/static/img/fail.jpg', '1655.0', '082f2ca350b3188ebbdf8f5e');
INSERT INTO `basic` VALUES ('47', '121.74469996827,31.149272883849', '景园酒店生态园林', '上海市浦东新区闻六路西50米', '', '/static/img/fail.jpg', '', 'aa0423af1105bd1ec356ace2');
INSERT INTO `basic` VALUES ('48', '121.73989834566,31.152089145911', '上海九万里园林休闲山庄迪士尼店', '上海市浦东新区长桥路588号', '(021)20963027', '/static/img/fail.jpg', '', '8b4522b1b4e4dfcb9868b468');
INSERT INTO `basic` VALUES ('49', '121.73531707739,31.160589725639', '小众旅馆', '上海市浦东新区川六公路1867号', '(021)58597927', '/static/img/fail.jpg', '0.0', '2b8fd755fbc0ff784afd3f7c');
INSERT INTO `basic` VALUES ('50', '121.73227604375,31.16028727798', '六团旅馆', '德兴街212-214号', '', '/static/img/fail.jpg', '', '337ea9579f953d9b2a02e126');
INSERT INTO `basic` VALUES ('51', '121.73625203377,31.161069854466', '天泉会旅馆', '上海市浦东新区六团镇川六公路1909号', '(021)68405881', '/static/img/fail.jpg', '', 'd2f4bd63de9da9233a13fd6a');
INSERT INTO `basic` VALUES ('52', '121.73383523262,31.160258848623', '普陀旅社', '川六公路1795号', '', '/static/img/fail.jpg', '', '3e4061c44f9fc6b322f01745');

-- ----------------------------
-- Table structure for `detail`
-- ----------------------------
DROP TABLE IF EXISTS `detail`;
CREATE TABLE `detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(200) NOT NULL COMMENT '被参照',
  `detail_url` varchar(100) DEFAULT 'http://localhost:8000/index/' COMMENT '详情链接',
  `level` varchar(20) DEFAULT '未知' COMMENT '经济型、豪华',
  `overall_rating` varchar(10) DEFAULT '未知' COMMENT '总体指数',
  `service_rating` varchar(10) DEFAULT '未知' COMMENT '服务指数',
  `hygiene_rating` varchar(10) DEFAULT '未知' COMMENT '卫生指数',
  `facility_rating` varchar(10) DEFAULT '未知' COMMENT '设备指数',
  `hotel_facility` varchar(300) DEFAULT '未知' COMMENT '酒店设施详情',
  `hotel_service` varchar(300) DEFAULT '未知' COMMENT '酒店服务详情',
  `inner_facility` varchar(400) DEFAULT '未知' COMMENT '房间里面的设施详情',
  `create_time` datetime DEFAULT NULL COMMENT '第一次点击酒店的时间',
  PRIMARY KEY (`id`,`uid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of detail
-- ----------------------------
INSERT INTO `detail` VALUES ('1', '5f17dac71ed3ac1a04026fbe', 'http://api.map.baidu.com/place/detail?uid=5f17dac71ed3ac1a04026fbe&output=html&source=placeapi_v2', '经济型', '4.5', '4.6', '4.7', '4.5', '前台贵重物品保险柜 免费停车场 电梯 有可无线上网的公共区域 免费 暖气 公共音响系统 非经营性客人休息区 公共区域闭路电视监控系统', '邮政服务 行李寄存 叫醒服务 24小时前台服务 快速办理入住/退房手续 信用卡结算服务 一次性账单结算服务 部分时段大堂经理 商务服务', '拖鞋 书桌 24小时热水 电热水壶 免费洗漱用品(6样以上) 免费瓶装水 多种规格电源插座 独立淋浴间 吹风机 空调 有线频道 液晶电视机 暖气 220V电压插座 遮光窗帘 手动窗帘 床具:毯子或被子 沙发 房间内高速上网 电话 淋浴 客房WIFI覆盖免费 智能门锁', '2019-03-07 09:41:02');
INSERT INTO `detail` VALUES ('2', '3a84bcefecf96577c7f50d7b', 'http://api.map.baidu.com/place/detail?uid=3a84bcefecf96577c7f50d7b&output=html&source=placeapi_v2', '经济型', '3.9', '4.2', '4.0', '3.8', '电梯 有可无线上网的公共区域 免费', '24小时前台服务', '24小时热水 电热水壶 独立淋浴间 空调 液晶电视机 手动窗帘 床具:毯子或被子', '2019-03-07 09:41:02');
INSERT INTO `detail` VALUES ('3', 'ed87f70847b062b09ff77954', 'http://api.map.baidu.com/place/detail?uid=ed87f70847b062b09ff77954&output=html&source=placeapi_v2', '经济型', '3.8', '4.3', '4.4', '4.2', '免费停车场 充电车位', '', '电视机 手动窗帘 床具:毯子或被子', '2019-03-07 09:41:02');
INSERT INTO `detail` VALUES ('4', 'd5d2b3792d200e366cc02ce5', 'http://api.map.baidu.com/place/detail?uid=d5d2b3792d200e366cc02ce5&output=html&source=placeapi_v2', '经济型', '4.8', '4.7', '4.7', '4.6', '有可无线上网的公共区域 免费', '行李寄存 叫醒服务 24小时前台服务', '拖鞋 书桌 24小时热水 电热水壶 免费洗漱用品(6样以上) 独立淋浴间 空调 电视机 手动窗帘 床具:毯子或被子', '2019-03-07 09:41:02');
INSERT INTO `detail` VALUES ('5', '4417ae25f218ef42a10464e1', 'http://api.map.baidu.com/place/detail?uid=4417ae25f218ef42a10464e1&output=html&source=placeapi_v2', '', '3.2', '0.0', '0.0', '0.0', '', '', '', '2019-03-07 09:41:03');
INSERT INTO `detail` VALUES ('6', '72ce9be04b189ad4853304a7', 'http://api.map.baidu.com/place/detail?uid=72ce9be04b189ad4853304a7&output=html&source=placeapi_v2', '经济型', '5.0', '5.0', '5.0', '5.0', '有可无线上网的公共区域 有可无线上网的公共区域 免费', '', '24小时热水 电热水器 电视机 手动窗帘 床具:毯子或被子', '2019-03-07 09:41:03');
INSERT INTO `detail` VALUES ('7', '78e4decd9f20c2b7a8175a29', 'http://api.map.baidu.com/place/detail?uid=78e4decd9f20c2b7a8175a29&output=html&source=placeapi_v2', '经济型', '4.3', '3.6', '3.5', '2.3', '停车场 有可无线上网的公共区域 免费 暖气', '洗衣服务 接机服务 接站服务', '24小时热水 独立淋浴间 空调 电视机 手动窗帘 床具:毯子或被子', '2019-03-07 09:41:03');
INSERT INTO `detail` VALUES ('8', '8a38dd8957edf1a483a00c67', 'http://api.map.baidu.com/place/detail?uid=8a38dd8957edf1a483a00c67&output=html&source=placeapi_v2', '经济型', '4.6', '4.5', '4.5', '4.5', '停车场 有可无线上网的公共区域', '', '24小时热水 独立淋浴间 空调 电视机 手动窗帘 床具:毯子或被子 客房WIFI覆盖免费', '2019-03-07 09:41:03');
INSERT INTO `detail` VALUES ('9', 'b787fc4be7a98c899fec2bd2', 'http://api.map.baidu.com/place/detail?uid=b787fc4be7a98c899fec2bd2&output=html&source=placeapi_v2', '经济型', '4.9', '4.0', '4.0', '3.9', '停车场 有可无线上网的公共区域 免费 暖气', '洗衣服务 接机服务 接站服务', '24小时热水 独立淋浴间 空调 电视机 手动窗帘 床具:毯子或被子', '2019-03-07 09:41:03');
INSERT INTO `detail` VALUES ('10', '6f2d3cf49ea683ca108824e2', 'http://api.map.baidu.com/place/detail?uid=6f2d3cf49ea683ca108824e2&output=html&source=placeapi_v2', '经济型', '4.0', '4.2', '4.4', '4.0', '', '', '', '2019-03-07 09:41:04');
INSERT INTO `detail` VALUES ('11', '11b478ea6a1e5cfbf942b2f6', 'http://api.map.baidu.com/place/detail?uid=11b478ea6a1e5cfbf942b2f6&output=html&source=placeapi_v2', '经济型', '4.1', '3.9', '4.1', '3.8', '', '', '', '2019-03-07 09:41:04');
INSERT INTO `detail` VALUES ('12', '9ebb06bced84f52694ec84bf', 'http://api.map.baidu.com/place/detail?uid=9ebb06bced84f52694ec84bf&output=html&source=placeapi_v2', '经济型', '4.4', '4.6', '4.7', '4.6', '中餐厅 前台贵重物品保险柜 免费停车场 免费旅游交通图(可赠送) 电梯 有可无线上网的公共区域 免费 大堂免费报纸 非经营性客人休息区 公共区域闭路电视监控系统', '旅游票务服务 送餐服务 邮政服务 行李寄存 叫醒服务 24小时前台服务 一次性账单结算服务', '拖鞋 书桌 24小时热水 电热水壶 咖啡壶/茶壶 免费洗漱用品(6样以上) 免费瓶装水 小冰箱 多种规格电源插座 独立淋浴间 吹风机 空调 有线频道 液晶电视机 闹钟 针线包 220V电压插座 遮光窗帘 手动窗帘 备用床具 床具:毯子或被子 沙发 电话 免费国内长途电话 客房WIFI覆盖免费', '2019-03-07 09:41:37');
INSERT INTO `detail` VALUES ('13', 'e7abcc0008d0c2b95fd4fec3', 'http://api.map.baidu.com/place/detail?uid=e7abcc0008d0c2b95fd4fec3&output=html&source=placeapi_v2', '经济型', '4.7', '4.2', '4.2', '4.2', '停车场 免费停车场 有可无线上网的公共区域 免费 吸烟区 暖气 非经营性客人休息区 公共区域闭路电视监控系统', '行李寄存 接机服务 快速办理入住/退房手续 接站服务', '24小时热水 独立淋浴间 空调 共用浴室 电视机 手动窗帘 床具:毯子或被子 共用卫生间 免费国内长途电话 客房WIFI覆盖免费', '2019-03-07 09:41:37');
INSERT INTO `detail` VALUES ('14', '727e5d77650226d530f71dd0', 'http://api.map.baidu.com/place/detail?uid=727e5d77650226d530f71dd0&output=html&source=placeapi_v2', '', '4.4', '4.5', '4.5', '4.5', '免费旅游交通图(可赠送) 电梯 有可无线上网的公共区域 免费 非经营性客人休息区 多媒体演示系统 公共区域闭路电视监控系统', '邮政服务 行李寄存 叫醒服务 租车服务 24小时前台服务 信用卡结算服务 商务服务 外送洗衣服务', '国内长途电话 拖鞋 书桌 24小时热水 电热水壶 免费洗漱用品(6样以上) 免费瓶装水 多种规格电源插座 独立淋浴间 吹风机 空调 有线频道 液晶电视机 220V电压插座 遮光窗帘 手动窗帘 备用床具 床具:毯子或被子 沙发 房间内高速上网 客房WIFI覆盖免费', '2019-03-07 09:41:38');
INSERT INTO `detail` VALUES ('15', 'b9418af54e3e4804c17da261', 'http://api.map.baidu.com/place/detail?uid=b9418af54e3e4804c17da261&output=html&source=placeapi_v2', '', '', '0', '0', '0', '', '', '', '2019-03-07 09:41:38');
INSERT INTO `detail` VALUES ('16', '6113ef77acb470148e772725', 'http://api.map.baidu.com/place/detail?uid=6113ef77acb470148e772725&output=html&source=placeapi_v2', '经济型', '4.6', '4.1', '4.1', '4.0', '中餐厅 免费停车场 电梯 有可无线上网的公共区域 免费 暖气 大堂免费报纸 多功能厅', '会议厅 送餐服务 行李寄存 叫醒服务 24小时前台服务', '拖鞋 24小时热水 电热水壶 空调 电视机 手动窗帘 床具:毯子或被子 免费洗漱用品(6样以内) 电话 淋浴', '2019-03-07 09:42:00');
INSERT INTO `detail` VALUES ('17', '1f4de62666113462afee7ad8', 'http://api.map.baidu.com/place/detail?uid=1f4de62666113462afee7ad8&output=html&source=placeapi_v2', '经济型', '5.0', '4.8', '4.7', '4.7', '停车场 前台贵重物品保险柜 免费停车场 电梯 有可无线上网的公共区域 免费 暖气 大堂免费报纸 公共区域闭路电视监控系统', '行李寄存 叫醒服务 部分时段前台服务', '拖鞋 电热水壶 空调 电视机 220V电压插座 手动窗帘 床具:毯子或被子', '2019-03-07 09:42:01');
INSERT INTO `detail` VALUES ('18', 'dc7b05a5ccd2c40c744ff171', 'http://api.map.baidu.com/place/detail?uid=dc7b05a5ccd2c40c744ff171&output=html&source=placeapi_v2', '经济型', '4.7', '4.7', '4.5', '4.5', '免费停车场 免费旅游交通图(可赠送) 电梯 有可无线上网的公共区域 免费 大堂免费报纸 公共音响系统 非经营性客人休息区 公共区域闭路电视监控系统', '旅游票务服务 邮政服务 行李寄存 叫醒服务 24小时前台服务 代客泊车 信用卡结算服务 一次性账单结算服务 部分时段大堂经理 商务服务 外送洗衣服务', '拖鞋 书桌 24小时热水 电热水壶 免费洗漱用品(6样以上) 免费瓶装水 迷你吧 多种规格电源插座 独立淋浴间 吹风机 空调 有线频道 液晶电视机 针线包 220V电压插座 遮光窗帘 手动窗帘 备用床具 床具:毯子或被子 房间内高速上网 电话 淋浴 免费国内长途电话 客房WIFI覆盖免费', '2019-03-07 09:42:01');
INSERT INTO `detail` VALUES ('19', '68ccd2586afa70148d77279d', 'http://api.map.baidu.com/place/detail?uid=68ccd2586afa70148d77279d&output=html&source=placeapi_v2', '经济型', '3.7', '4.0', '4.4', '4.3', '中餐厅 前台贵重物品保险柜 免费停车场 有可无线上网的公共区域 大堂吧 电梯', '会议厅 商务中心 旅游票务服务 邮政服务 行李寄存 叫醒服务', '国内长途电话 拖鞋 书桌 24小时热水 电热水壶 免费洗漱用品(6样以上) 多种规格电源插座 独立淋浴间 吹风机 空调', '2019-03-07 09:42:01');
INSERT INTO `detail` VALUES ('20', 'b30c6a4bf0ca04ebc26c148a', 'http://api.map.baidu.com/place/detail?uid=b30c6a4bf0ca04ebc26c148a&output=html&source=placeapi_v2', '经济型', '3.4', '3.8', '3.8', '3.8', '', '', '24小时热水 电热水壶 免费洗漱用品(6样以上) 电视机 单一规格电源插座 手动窗帘 床具:毯子或被子', '2019-03-07 09:42:02');
INSERT INTO `detail` VALUES ('21', '16da29e2b76a3bffafee7a95', 'http://api.map.baidu.com/place/detail?uid=16da29e2b76a3bffafee7a95&output=html&source=placeapi_v2', '经济型', '4.7', '4.1', '4.2', '4.1', '中餐厅 前台贵重物品保险柜 免费停车场 电梯 有可无线上网的公共区域 免费 公共音响系统 非经营性客人休息区 多媒体演示系统 公共区域闭路电视监控系统', '邮政服务 行李寄存 叫醒服务 24小时前台服务 信用卡结算服务 商务服务 外送洗衣服务', '国内长途电话 拖鞋 书桌 24小时热水 电热水壶 免费洗漱用品(6样以上) 免费瓶装水 多种规格电源插座 独立淋浴间 吹风机 空调 有线频道 液晶电视机 电视机 电脑 遮光窗帘 手动窗帘 床具:毯子或被子 免费洗漱用品(6样以内) 房间内高速上网 电话 客房WIFI覆盖免费', '2019-03-07 09:42:02');
INSERT INTO `detail` VALUES ('22', '0e305012a56c41142e473325', 'http://api.map.baidu.com/place/detail?uid=0e305012a56c41142e473325&output=html&source=placeapi_v2', '经济型', '3.3', '4.5', '4.5', '4.5', '免费停车场 公共区域闭路电视监控系统', '叫醒服务', '独立淋浴间 空调 共用浴室 电视机 手动窗帘 床具:毯子或被子 共用卫生间', '2019-03-07 09:42:02');
INSERT INTO `detail` VALUES ('23', '8fec44f0d9298931abf0cd5e', 'http://api.map.baidu.com/place/detail?uid=8fec44f0d9298931abf0cd5e&output=html&source=placeapi_v2', '经济型', '0.0', '0.0', '0.0', '0.0', '', '', '', '2019-03-07 09:42:02');
INSERT INTO `detail` VALUES ('24', '682d8b588628091bf50e772e', 'http://api.map.baidu.com/place/detail?uid=682d8b588628091bf50e772e&output=html&source=placeapi_v2', '经济型', '4.5', '4.6', '4.6', '4.6', '有可无线上网的公共区域 免费 非经营性客人休息区 公共区域闭路电视监控系统', '行李寄存', '110V电压插座 电视机 单一规格电源插座 手动窗帘 床具:毯子或被子', '2019-03-07 09:42:03');
INSERT INTO `detail` VALUES ('25', '35dda15ba92038772db96dd9', 'http://api.map.baidu.com/place/detail?uid=35dda15ba92038772db96dd9&output=html&source=placeapi_v2', '经济型', '0.0', '0.0', '0.0', '0.0', '免费停车场', '行李寄存 24小时前台服务', '拖鞋 24小时热水 电热水壶 空调 电视机 手动窗帘 床具:毯子或被子 免费洗漱用品(6样以内)', '2019-03-07 09:42:03');
INSERT INTO `detail` VALUES ('26', 'ef773a0f2e13b83422022025', 'http://api.map.baidu.com/place/detail?uid=ef773a0f2e13b83422022025&output=html&source=placeapi_v2', '经济型', '0.0', '0.0', '0.0', '0.0', '', '', '', '2019-03-07 09:42:03');
INSERT INTO `detail` VALUES ('27', '45488b1c3708ec4ed7851fa4', 'http://api.map.baidu.com/place/detail?uid=45488b1c3708ec4ed7851fa4&output=html&source=placeapi_v2', '经济型', '4.6', '3.9', '3.9', '3.9', '免费停车场', '叫醒服务', '空调 电视机 无插座 手动窗帘 床具:毯子或被子 淋浴', '2019-03-07 09:42:57');
INSERT INTO `detail` VALUES ('28', '97aa2aabfef99189223bf21e', 'http://api.map.baidu.com/place/detail?uid=97aa2aabfef99189223bf21e&output=html&source=placeapi_v2', '经济型', '0.0', '3.0', '2.0', '1.0', '停车场 有可无线上网的公共区域 免费 暖气', '', '24小时热水 独立淋浴间 空调 电视机 手动窗帘 床具:毯子或被子 客房WIFI覆盖', '2019-03-07 09:42:57');
INSERT INTO `detail` VALUES ('29', '2f9a0b357cc276d0f603b8ea', 'http://api.map.baidu.com/place/detail?uid=2f9a0b357cc276d0f603b8ea&output=html&source=placeapi_v2', '', '0.0', '0.0', '3.4', '3.8', '', '', '', '2019-03-07 09:42:58');
INSERT INTO `detail` VALUES ('30', '131abb233d5fc71400ec0136', 'http://api.map.baidu.com/place/detail?uid=131abb233d5fc71400ec0136&output=html&source=placeapi_v2', '经济型', '0.0', '0.0', '0.0', '0.0', '停车场 有可无线上网的公共区域 免费 暖气', '洗衣服务 接机服务 接站服务', '24小时热水 独立淋浴间 空调 电视机 手动窗帘 床具:毯子或被子', '2019-03-07 09:42:58');
INSERT INTO `detail` VALUES ('31', 'd52831f9b8bdffbe2efaa716', 'http://api.map.baidu.com/place/detail?uid=d52831f9b8bdffbe2efaa716&output=html&source=placeapi_v2', '舒适型', '4.2', '4.3', '4.4', '4.2', '中餐厅 酒吧 前台贵重物品保险柜 收费停车场 有可无线上网的公共区域 电梯 所有公共及私人场所严禁吸烟 公共音响系统 非经营性客人休息区 无烟楼层 公共区域闭路电视监控系统 无充电车位', '会议厅 商务中心 叫车服务 专职行李员 行李寄存 叫醒服务 礼宾服务 传真/复印 24小时前台服务 快速办理入住/退房手续 信用卡结算服务 24小时大堂经理 外送洗衣服务', '国内长途电话 国际长途电话 拖鞋 书桌 24小时热水 电热水壶 免费洗漱用品(6样以上) 免费瓶装水 小冰箱 多种规格电源插座 110V电压插座 独立淋浴间 吹风机 房内保险箱 空调 液晶电视机 衣柜/衣橱 闹钟 针线包 220V电压插座 遮光窗帘 手动窗帘 床具:毯子或被子 唤醒服务 地标景 沙发 房间内高速上网 电话 淋浴 客房WIFI覆盖 客房WIFI覆盖免费 茶包', '2019-03-07 09:43:07');
INSERT INTO `detail` VALUES ('32', 'edd4aa3f474b744f77026970', 'http://api.map.baidu.com/place/detail?uid=edd4aa3f474b744f77026970&output=html&source=placeapi_v2', '舒适型', '4.7', '4.5', '4.5', '4.4', '中餐厅 商场 理发美容中心 前台贵重物品保险柜 自动取款机 收费停车场 大堂吧 电梯 所有公共及私人场所严禁吸烟 暖气 大堂免费报纸 礼品廊 公共音响系统 非经营性客人休息区 无烟楼层 行政酒廊 公共区域闭路电视监控系统', '会议厅 商务中心 外币兑换服务 旅游票务服务 送餐服务 叫车服务 穿梭机场班车 邮政服务 专职行李员 叫醒服务 接机服务 租车服务 礼宾服务 干洗 熨衣服务 擦鞋服务 多国语言工作人员 24小时前台服务 快速办理入住/退房手续 代客泊车 专职门童 信用卡结算服务 一次性账单结算服务 24小时大堂经理 外送洗衣服务 接站服务', '国内长途电话 国际长途电话 拖鞋 雨伞 书桌 浴室化妆放大镜 24小时热水 电热水壶 咖啡壶/茶壶 免费洗漱用品(6样以上) 免费瓶装水 熨衣设备 小冰箱 浴衣 多种规格电源插座 吹风机 空调 有线频道 卫星频道 液晶电视机 衣柜/衣橱 闹钟 针线包 220V电压插座 遮光窗帘 手动窗帘 备用床具 床具:毯子或被子 唤醒服务 欢迎礼品 享有风景 地标景 开夜床 电话 淋浴', '2019-03-07 09:43:07');
INSERT INTO `detail` VALUES ('33', 'c44c19e7f2f1088796ca0754', 'http://api.map.baidu.com/place/detail?uid=c44c19e7f2f1088796ca0754&output=html&source=placeapi_v2', '', '', '0', '0', '0', '', '', '', '2019-03-07 09:43:08');
INSERT INTO `detail` VALUES ('34', '8fe10be282081561a20464bd', 'http://api.map.baidu.com/place/detail?uid=8fe10be282081561a20464bd&output=html&source=placeapi_v2', '', '0.0', '0', '0', '0', '', '', '', '2019-03-07 09:43:08');
INSERT INTO `detail` VALUES ('35', 'a0fb7e20bbe9241fa8059d6c', 'http://api.map.baidu.com/place/detail?uid=a0fb7e20bbe9241fa8059d6c&output=html&source=placeapi_v2', '', '0.0', '0', '0', '0', '', '', '', '2019-03-07 09:43:08');
INSERT INTO `detail` VALUES ('36', 'edd4aa3f474b744f77026970', 'http://api.map.baidu.com/place/detail?uid=edd4aa3f474b744f77026970&output=html&source=placeapi_v2', '舒适型', '4.7', '4.5', '4.5', '4.4', '中餐厅 商场 理发美容中心 前台贵重物品保险柜 自动取款机 收费停车场 大堂吧 电梯 所有公共及私人场所严禁吸烟 暖气 大堂免费报纸 礼品廊 公共音响系统 非经营性客人休息区 无烟楼层 行政酒廊 公共区域闭路电视监控系统', '会议厅 商务中心 外币兑换服务 旅游票务服务 送餐服务 叫车服务 穿梭机场班车 邮政服务 专职行李员 叫醒服务 接机服务 租车服务 礼宾服务 干洗 熨衣服务 擦鞋服务 多国语言工作人员 24小时前台服务 快速办理入住/退房手续 代客泊车 专职门童 信用卡结算服务 一次性账单结算服务 24小时大堂经理 外送洗衣服务 接站服务', '国内长途电话 国际长途电话 拖鞋 雨伞 书桌 浴室化妆放大镜 24小时热水 电热水壶 咖啡壶/茶壶 免费洗漱用品(6样以上) 免费瓶装水 熨衣设备 小冰箱 浴衣 多种规格电源插座 吹风机 空调 有线频道 卫星频道 液晶电视机 衣柜/衣橱 闹钟 针线包 220V电压插座 遮光窗帘 手动窗帘 备用床具 床具:毯子或被子 唤醒服务 欢迎礼品 享有风景 地标景 开夜床 电话 淋浴', '2019-03-07 09:43:14');
INSERT INTO `detail` VALUES ('37', '3e10942c17fc861f2b201aa6', 'http://api.map.baidu.com/place/detail?uid=3e10942c17fc861f2b201aa6&output=html&source=placeapi_v2', '', '', '0', '0', '0', '', '', '', '2019-03-07 09:43:25');
INSERT INTO `detail` VALUES ('38', 'e2608a3f5d448d125a3ac81a', 'http://api.map.baidu.com/place/detail?uid=e2608a3f5d448d125a3ac81a&output=html&source=placeapi_v2', '高档型', '4.7', '4.8', '4.8', '4.8', '中餐厅 前台贵重物品保险柜 免费停车场 免费旅游交通图(可赠送) 大堂吧 电梯 有可无线上网的公共区域 免费 所有公共及私人场所严禁吸烟 吸烟区 大堂免费报纸 公共音响系统 非经营性客人休息区 无烟楼层 多媒体演示系统 公共区域闭路电视监控系统', '旅游票务服务 洗衣服务 送餐服务 叫车服务 邮政服务 行李寄存 叫醒服务 接机服务 穿梭机场班车 免费 传真/复印 熨衣服务 办理私人登记入住/退房手续 擦鞋服务 班车服务 翻译服务 24小时前台服务 快速办理入住/退房手续 代客泊车 信用卡结算服务 一次性账单结算服务 24小时大堂经理 商务服务 接站服务', '国际长途电话 拖鞋 雨伞 书桌 浴室化妆放大镜 24小时热水 电热水壶 免费洗漱用品(6样以上) 免费瓶装水 小冰箱 浴衣 多种规格电源插座 浴缸 独立淋浴间 吹风机 房内保险箱 空调 收费电影 有线频道 液晶电视机 针线包 220V电压插座 遮光窗帘 手动窗帘 床具:毯子或被子 欢迎礼品 沙发 电子秤 房间内高速上网 免费国内长途电话 客房WIFI覆盖免费', '2019-03-07 09:43:31');
INSERT INTO `detail` VALUES ('39', 'cdbdd287e1a4a034d813181f', 'http://api.map.baidu.com/place/detail?uid=cdbdd287e1a4a034d813181f&output=html&source=placeapi_v2', '高档型', '4.8', '4.8', '4.8', '4.8', '中餐厅 前台贵重物品保险柜 免费停车场 免费旅游交通图(可赠送) 大堂吧 电梯 有可无线上网的公共区域 免费 所有公共及私人场所严禁吸烟 大堂免费报纸 公共音响系统 非经营性客人休息区 无烟楼层 多媒体演示系统 公共区域闭路电视监控系统 充电车位', '会议厅 商务中心 旅游票务服务 送餐服务 邮政服务 行李寄存 叫醒服务 接机服务 穿梭机场班车 免费 24小时前台服务 代客泊车 信用卡结算服务 24小时大堂经理 外送洗衣服务 接站服务 儿童牙刷', '国内长途电话 国际长途电话 拖鞋 雨伞 书桌 浴室化妆放大镜 24小时热水 电热水壶 咖啡壶/茶壶 免费瓶装水 熨衣设备 多种规格电源插座 110V电压插座 独立淋浴间 吹风机 房内保险箱 空调 有线频道 液晶电视机 电脑 闹钟 针线包 220V电压插座 遮光窗帘 手动窗帘 备用床具 床具:鸭绒被 床具:毯子或被子 欢迎礼品 免费洗漱用品(6样以内) 沙发 免费报纸 电子秤 房间内高速上网 客房WIFI覆盖免费 智能门锁', '2019-03-07 09:43:32');
INSERT INTO `detail` VALUES ('40', 'be7eebfbc5508429e311039b', 'http://api.map.baidu.com/place/detail?uid=be7eebfbc5508429e311039b&output=html&source=placeapi_v2', '舒适型', '3.8', '4.7', '4.7', '4.6', '中餐厅 前台贵重物品保险柜 免费停车场 免费旅游交通图(可赠送) 电梯 有可无线上网的公共区域 免费 所有公共及私人场所严禁吸烟 大堂免费报纸 公共音响系统 非经营性客人休息区 无烟楼层 公共区域闭路电视监控系统', '旅游票务服务 叫车服务 邮政服务 行李寄存 叫醒服务 接机服务 穿梭机场班车 免费 租车服务 24小时前台服务 快速办理入住/退房手续 信用卡结算服务 一次性账单结算服务 部分时段大堂经理 接站服务', '拖鞋 书桌 24小时热水 电热水壶 免费洗漱用品(6样以上) 免费瓶装水 多种规格电源插座 独立淋浴间 吹风机 空调 液晶电视机 针线包 遮光窗帘 手动窗帘 备用床具 床具:鸭绒被 沙发 电子秤 房间内高速上网 客房WIFI覆盖免费', '2019-03-07 09:43:33');
INSERT INTO `detail` VALUES ('41', '0bae28cbf50ece9f9e95de4a', 'http://api.map.baidu.com/place/detail?uid=0bae28cbf50ece9f9e95de4a&output=html&source=placeapi_v2', '舒适型', '4.1', '4.5', '4.5', '4.5', '中餐厅 前台贵重物品保险柜 免费停车场 免费旅游交通图(可赠送) 电梯 有可无线上网的公共区域 免费 所有公共及私人场所严禁吸烟 大堂免费报纸 公共音响系统 非经营性客人休息区 无烟楼层 多媒体演示系统 公共区域闭路电视监控系统 充电车位', '会议厅 旅游票务服务 叫车服务 邮政服务 行李寄存 叫醒服务 接机服务 穿梭机场班车 免费 礼宾服务 传真/复印 24小时前台服务 快速办理入住/退房手续 信用卡结算服务 一次性账单结算服务 部分时段大堂经理 商务服务 外送洗衣服务 接站服务', '国内长途电话 国际长途电话 拖鞋 书桌 24小时热水 电热水壶 咖啡壶/茶壶 免费洗漱用品(6样以上) 免费瓶装水 多种规格电源插座 独立淋浴间 吹风机 房内保险箱 空调 电热水器 有线频道 液晶电视机 衣柜/衣橱 220V电压插座 遮光窗帘 手动窗帘 床具:鸭绒被 床具:毯子或被子 唤醒服务 河景 享有风景 阳台 沙发 房间内高速上网 电话 淋浴 客房WIFI覆盖免费 智能门锁', '2019-03-07 09:43:33');
INSERT INTO `detail` VALUES ('42', '1a3202661807a13c734b8764', 'http://api.map.baidu.com/place/detail?uid=1a3202661807a13c734b8764&output=html&source=placeapi_v2', '', '4.1', '4.4', '4.5', '4.4', '中餐厅 西餐厅 咖啡厅 前台贵重物品保险柜 免费停车场 免费旅游交通图(可赠送) 大堂吧 电梯 有可无线上网的公共区域 免费 所有公共及私人场所严禁吸烟 大堂免费报纸 礼品廊 多功能厅 公共音响系统 非经营性客人休息区 无烟楼层 多媒体演示系统 公共区域闭路电视监控系统 充电车位', '会议厅 商务中心 外币兑换服务 旅游票务服务 送餐服务 专职行李员 行李寄存 叫醒服务 接机服务 穿梭机场班车 免费 租车服务 礼宾服务 干洗 传真/复印 办理私人登记入住/退房手续 班车服务 婚宴服务 24小时前台服务 专职门童 信用卡结算服务 一次性账单结算服务 24小时大堂经理 外送洗衣服务 携程行李寄送', '拖鞋 雨伞 书桌 浴室化妆放大镜 24小时热水 电热水壶 免费洗漱用品(6样以上) 免费瓶装水 迷你吧 熨衣设备 小冰箱 浴衣 多种规格电源插座 110V电压插座 浴缸 独立淋浴间 吹风机 房内保险箱 空调 有线频道 液晶电视机 衣柜/衣橱 连通房 闹钟 针线包 220V电压插座 遮光窗帘 手动窗帘 备用床具 床具:鸭绒被 花园景 洗浴间电话 沙发 开夜床 电子秤 房间内高速上网 电话 淋浴 免费国内长途电话 客房WIFI覆盖免费', '2019-03-07 09:43:34');
INSERT INTO `detail` VALUES ('43', '7ce2d7a524ae08b701294f8a', 'http://api.map.baidu.com/place/detail?uid=7ce2d7a524ae08b701294f8a&output=html&source=placeapi_v2', '经济型', '3.8', '4.1', '4.0', '3.8', '前台贵重物品保险柜 免费停车场 大堂吧 无电梯 有可无线上网的公共区域 免费 所有公共及私人场所严禁吸烟', '商务中心 旅游票务服务 洗衣服务 行李寄存 叫醒服务 接机服务 穿梭机场班车 免费', '国内长途电话 拖鞋 书桌 浴室化妆放大镜 24小时热水 电热水壶 咖啡壶/茶壶 免费洗漱用品(6样以上) 多种规格电源插座 独立淋浴间 吹风机 空调 液晶电视机 电视机 手动窗帘 床具:毯子或被子 浴室 客房WIFI覆盖 客房WIFI覆盖免费', '2019-03-07 09:43:34');
INSERT INTO `detail` VALUES ('44', 'f322106320080ecf1d580017', 'http://api.map.baidu.com/place/detail?uid=f322106320080ecf1d580017&output=html&source=placeapi_v2', '高档型', '4.8', '4.5', '4.6', '4.4', '前台贵重物品保险柜 免费停车场 免费旅游交通图(可赠送) 电梯 有可无线上网的公共区域 免费 暖气 大堂免费报纸 餐厅 非经营性客人休息区 无烟楼层', '会议厅 商务中心 旅游票务服务 洗衣服务 鲜花店 叫车服务 邮政服务 行李寄存 叫醒服务 接机服务 穿梭机场班车 免费 租车服务 传真/复印 熨衣服务 班车服务 24小时前台服务 快速办理入住/退房手续 信用卡结算服务 24小时大堂经理 外送洗衣服务', '书桌 24小时热水 电热水壶 免费洗漱用品(6样以上) 免费瓶装水 浴衣 独立淋浴间 吹风机 空调 液晶电视机 衣柜/衣橱 220V电压插座 遮光窗帘 手动窗帘 床具:鸭绒被 行政酒廊 沙发 客房WIFI覆盖免费 智能门锁', '2019-03-07 09:43:34');
INSERT INTO `detail` VALUES ('45', '6ea1acfdde6546da2d47338d', 'http://api.map.baidu.com/place/detail?uid=6ea1acfdde6546da2d47338d&output=html&source=placeapi_v2', '经济型', '4.2', '4.4', '4.3', '4.1', '免费旅游交通图(可赠送) 大堂吧 电梯 有可无线上网的公共区域 免费 所有公共及私人场所严禁吸烟 公共区域闭路电视监控系统', '叫车服务 行李寄存 叫醒服务 接机服务 传真/复印 24小时前台服务 信用卡结算服务 24小时大堂经理 商务服务', '拖鞋 雨伞 24小时热水 电热水壶 咖啡壶/茶壶 多种规格电源插座 独立淋浴间 吹风机 空调 有线频道 液晶电视机 电视机 针线包 遮光窗帘 手动窗帘 床具:毯子或被子 沙发 开夜床 电子秤 房间内高速上网 淋浴 客房WIFI覆盖 客房WIFI覆盖免费', '2019-03-07 09:43:34');
INSERT INTO `detail` VALUES ('46', 'ab89a3f9cd7f090f7702696d', 'http://api.map.baidu.com/place/detail?uid=ab89a3f9cd7f090f7702696d&output=html&source=placeapi_v2', '经济型', '4.2', '4.1', '4.0', '3.8', '无电梯 有可无线上网的公共区域 免费 所有公共及私人场所严禁吸烟 非经营性客人休息区 无烟楼层 公共区域闭路电视监控系统', '邮政服务 行李寄存 叫醒服务 接机服务 24小时前台服务 快速办理入住/退房手续 信用卡结算服务 一次性账单结算服务 部分时段大堂经理 商务服务', '拖鞋 书桌 24小时热水 电热水壶 多种规格电源插座 独立淋浴间 吹风机 空调 有线频道 液晶电视机 220V电压插座 遮光窗帘 手动窗帘 床具:毯子或被子 免费洗漱用品(6样以内) 房间内高速上网 淋浴 客房WIFI覆盖免费', '2019-03-07 09:43:35');
INSERT INTO `detail` VALUES ('47', '69fcd6dfa5ce2051cb29158c', 'http://api.map.baidu.com/place/detail?uid=69fcd6dfa5ce2051cb29158c&output=html&source=placeapi_v2', '经济型', '3.8', '4.2', '4.1', '4.0', '商场 前台贵重物品保险柜 自动取款机 免费停车场 有可无线上网的公共区域 大堂吧 电梯 所有公共及私人场所严禁吸烟 无烟楼层', '送餐服务 鲜花店 叫车服务 行李寄存 叫醒服务 接机服务 传真/复印 24小时前台服务', '国内长途电话 国际长途电话 拖鞋 雨伞 书桌 浴室化妆放大镜 24小时热水 咖啡壶/茶壶 免费洗漱用品(6样以上) 免费瓶装水 多种规格电源插座 110V电压插座 独立淋浴间 吹风机 空调 有线频道 液晶电视机 洗衣机 衣柜/衣橱 针线包 220V电压插座 坐卧两用长沙发 唤醒服务 河景 湖景 传真 沙发 电子秤 房间内高速上网 电话 客房WIFI覆盖免费', '2019-03-07 09:43:35');
INSERT INTO `detail` VALUES ('48', '2f35cb5f598d3c0e601c6762', 'http://api.map.baidu.com/place/detail?uid=2f35cb5f598d3c0e601c6762&output=html&source=placeapi_v2', '经济型', '4.6', '4.7', '4.5', '4.5', '免费停车场 免费旅游交通图(可赠送) 电梯 有可无线上网的公共区域 免费 所有公共及私人场所严禁吸烟 非经营性客人休息区 无烟楼层 公共区域闭路电视监控系统', '旅游票务服务 叫车服务 邮政服务 行李寄存 叫醒服务 接机服务 班车服务 24小时前台服务 快速办理入住/退房手续 24小时大堂经理 商务服务', '拖鞋 书桌 24小时热水 电热水壶 多种规格电源插座 独立淋浴间 吹风机 空调 液晶电视机 220V电压插座 遮光窗帘 手动窗帘 免费洗漱用品(6样以内) 沙发 房间内高速上网 电话 淋浴 客房WIFI覆盖免费', '2019-03-07 09:43:45');
INSERT INTO `detail` VALUES ('49', '801778960b9425b68af15d59', 'http://api.map.baidu.com/place/detail?uid=801778960b9425b68af15d59&output=html&source=placeapi_v2', '经济型', '4.5', '4.6', '4.5', '4.5', '商场 免费停车场 有可无线上网的公共区域 免费 所有公共及私人场所严禁吸烟', '叫车服务 专职行李员 行李寄存 接机服务 租车服务 班车服务 24小时前台服务 一次性账单结算服务 24小时大堂经理 商务服务', '拖鞋 24小时热水 电热水壶 多种规格电源插座 空调 电视机 电脑 手动窗帘 床具:毯子或被子 免费洗漱用品(6样以内) 电话 淋浴', '2019-03-07 09:43:45');
INSERT INTO `detail` VALUES ('50', '0a15c7ec166babfdec74f8a0', 'http://api.map.baidu.com/place/detail?uid=0a15c7ec166babfdec74f8a0&output=html&source=placeapi_v2', '经济型', '0.0', '0.0', '0.0', '0.0', '', '', '', '2019-03-07 09:43:45');
INSERT INTO `detail` VALUES ('51', '082f2ca350b3188ebbdf8f5e', 'http://api.map.baidu.com/place/detail?uid=082f2ca350b3188ebbdf8f5e&output=html&source=placeapi_v2', '豪华型', '0.0', '0.0', '0.0', '0.0', '免费停车场 免费旅游交通图(可赠送) 无电梯 有可无线上网的公共区域 免费 所有公共及私人场所严禁吸烟 餐厅 公共音响系统 非经营性客人休息区 公共区域闭路电视监控系统', '儿童乐园 邮政服务 行李寄存 管家服务 儿童拖鞋 儿童玩具', '拖鞋 雨伞 书桌 24小时热水 电热水壶 咖啡壶/茶壶 免费洗漱用品(6样以上) 免费瓶装水 小冰箱 多种规格电源插座 浴缸 独立淋浴间 吹风机 空调 有线频道 液晶电视机 电视机 厨房 厨房用具 微波炉 洗衣机 衣柜/衣橱 220V电压插座 遮光窗帘 手动窗帘 备用床具 床具:毯子或被子 浴室 花园景 沙发 房间内高速上网 淋浴 客房WIFI覆盖免费 空气净化器 调味品', '2019-03-07 09:43:45');
INSERT INTO `detail` VALUES ('52', 'aa0423af1105bd1ec356ace2', 'http://api.map.baidu.com/place/detail?uid=aa0423af1105bd1ec356ace2&output=html&source=placeapi_v2', '', '', '0', '0', '0', '', '', '', '2019-03-07 09:43:46');
INSERT INTO `detail` VALUES ('53', '8b4522b1b4e4dfcb9868b468', 'http://api.map.baidu.com/place/detail?uid=8b4522b1b4e4dfcb9868b468&output=html&source=placeapi_v2', '经济型', '0.0', '0.0', '0.0', '0.0', '', '', '', '2019-03-07 09:43:46');
INSERT INTO `detail` VALUES ('54', '2b8fd755fbc0ff784afd3f7c', 'http://api.map.baidu.com/place/detail?uid=2b8fd755fbc0ff784afd3f7c&output=html&source=placeapi_v2', '', '0.0', '0.0', '0.0', '0.0', '', '行李寄存', '24小时热水 空调 吹风机', '2019-03-07 09:43:46');
INSERT INTO `detail` VALUES ('55', '337ea9579f953d9b2a02e126', 'http://api.map.baidu.com/place/detail?uid=337ea9579f953d9b2a02e126&output=html&source=placeapi_v2', '经济型', '0.0', '0.0', '0.0', '0.0', '', '', '', '2019-03-07 09:43:46');
INSERT INTO `detail` VALUES ('56', 'd2f4bd63de9da9233a13fd6a', 'http://api.map.baidu.com/place/detail?uid=d2f4bd63de9da9233a13fd6a&output=html&source=placeapi_v2', '', '', '0', '0', '0', '', '', '', '2019-03-07 09:43:46');
INSERT INTO `detail` VALUES ('57', '3e4061c44f9fc6b322f01745', 'http://api.map.baidu.com/place/detail?uid=3e4061c44f9fc6b322f01745&output=html&source=placeapi_v2', '', '', '0', '0', '0', '', '', '', '2019-03-07 09:43:47');

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('7', 'myMap', 'basicinfo');
INSERT INTO `django_content_type` VALUES ('8', 'myMap', 'detailinfo');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2019-03-04 14:39:34.659285');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2019-03-04 14:39:36.122635');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2019-03-04 14:39:36.482476');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2019-03-04 14:39:36.532381');
INSERT INTO `django_migrations` VALUES ('5', 'admin', '0003_logentry_add_action_flag_choices', '2019-03-04 14:39:36.584281');
INSERT INTO `django_migrations` VALUES ('6', 'contenttypes', '0002_remove_content_type_name', '2019-03-04 14:39:36.805361');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0002_alter_permission_name_max_length', '2019-03-04 14:39:36.994992');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0003_alter_user_email_max_length', '2019-03-04 14:39:37.064366');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0004_alter_user_username_opts', '2019-03-04 14:39:37.112268');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0005_alter_user_last_login_null', '2019-03-04 14:39:37.225561');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0006_require_contenttypes_0002', '2019-03-04 14:39:37.239036');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0007_alter_validators_add_error_messages', '2019-03-04 14:39:37.282454');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0008_alter_user_username_max_length', '2019-03-04 14:39:37.412699');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0009_alter_user_last_name_max_length', '2019-03-04 14:39:37.545454');
INSERT INTO `django_migrations` VALUES ('15', 'myMap', '0001_initial', '2019-03-04 14:39:37.760046');
INSERT INTO `django_migrations` VALUES ('16', 'sessions', '0001_initial', '2019-03-04 14:39:37.940700');
INSERT INTO `django_migrations` VALUES ('17', 'myMap', '0002_auto_20190305_1406', '2019-03-05 06:07:08.784193');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of django_session
-- ----------------------------

-- ----------------------------
-- Table structure for `mymap_basicinfo`
-- ----------------------------
DROP TABLE IF EXISTS `mymap_basicinfo`;
CREATE TABLE `mymap_basicinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lng_lat` varchar(60) NOT NULL,
  `name` varchar(60) NOT NULL,
  `address` varchar(60) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `img_url` varchar(200) NOT NULL,
  `price` varchar(10) NOT NULL,
  `uid` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myMap_basicinfo_uid_27fe32c5` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=421 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of mymap_basicinfo
-- ----------------------------
INSERT INTO `mymap_basicinfo` VALUES ('1', '(\'115.58070398601,38.880896109179\',)', '(\'汉庭酒店(保定七一东路店)\',)', '(\'保定市莲池区七一东路3158号\',)', '(\'(0312)6786077\',)', '(\'http://www.test.com\',)', '(\'170.0\',)', '(\'5f17dac71ed3ac1a04026fbe\',)');
INSERT INTO `mymap_basicinfo` VALUES ('2', '(\'115.5771270233,38.894221096386\',)', '(\'雕刻时光主题宾馆\',)', '(\'河北省保定市莲池区隆兴东路与学苑街交叉口河北大学新校区附近\',)', '(\'(0312)6791010\',)', '(\'http://www.test.com\',)', '(\'61.0\',)', '(\'ed87f70847b062b09ff77954\',)');
INSERT INTO `mymap_basicinfo` VALUES ('3', '(\'115.57578773961,38.894462598839\',)', '(\'艾尚客主题酒店(河大新区保定东站店)\',)', '(\'河北省保定市莲池区百楼乡河北大学工商学院学苑街北头\',)', '(\'(0312)5050555\',)', '(\'http://www.test.com\',)', '(\'54.0\',)', '(\'3a84bcefecf96577c7f50d7b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('4', '(\'115.57924998871,38.880679136462\',)', '(\'保定驿缕阳光主题酒店\',)', '(\'河北省保定市莲池区七一中路未来像素\',)', '(\'15733223335\',)', '(\'http://www.test.com\',)', '(\'68.0\',)', '(\'4417ae25f218ef42a10464e1\',)');
INSERT INTO `mymap_basicinfo` VALUES ('5', '(\'115.57571740229,38.894210214715\',)', '(\'月亮湾宾馆\',)', '(\'河北省保定市莲池区河北大学新校区学苑街与隆兴东路交叉口南行50米\',)', '(\'18633203685\',)', '(\'http://www.test.com\',)', '(\'58.0\',)', '(\'78e4decd9f20c2b7a8175a29\',)');
INSERT INTO `mymap_basicinfo` VALUES ('6', '(\'115.57909745643,38.885532846055\',)', '(\'保定青年公寓\',)', '(\'保定市莲池区河大新校区东200米十七中后面\',)', '(\'13582627164\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'d5d2b3792d200e366cc02ce5\',)');
INSERT INTO `mymap_basicinfo` VALUES ('7', '(\'115.58070398601,38.880896109179\',)', '(\'汉庭酒店(保定七一东路店)\',)', '(\'保定市莲池区七一东路3158号\',)', '(\'(0312)6786077\',)', '(\'http://www.test.com\',)', '(\'170.0\',)', '(\'5f17dac71ed3ac1a04026fbe\',)');
INSERT INTO `mymap_basicinfo` VALUES ('8', '(\'115.5771270233,38.894221096386\',)', '(\'雕刻时光主题宾馆\',)', '(\'河北省保定市莲池区隆兴东路与学苑街交叉口河北大学新校区附近\',)', '(\'(0312)6791010\',)', '(\'http://www.test.com\',)', '(\'61.0\',)', '(\'ed87f70847b062b09ff77954\',)');
INSERT INTO `mymap_basicinfo` VALUES ('9', '(\'115.57578773961,38.894462598839\',)', '(\'艾尚客主题酒店(河大新区保定东站店)\',)', '(\'河北省保定市莲池区百楼乡河北大学工商学院学苑街北头\',)', '(\'(0312)5050555\',)', '(\'http://www.test.com\',)', '(\'54.0\',)', '(\'3a84bcefecf96577c7f50d7b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('10', '(\'115.57924998871,38.880679136462\',)', '(\'保定驿缕阳光主题酒店\',)', '(\'河北省保定市莲池区七一中路未来像素\',)', '(\'15733223335\',)', '(\'http://www.test.com\',)', '(\'68.0\',)', '(\'4417ae25f218ef42a10464e1\',)');
INSERT INTO `mymap_basicinfo` VALUES ('11', '(\'115.57571740229,38.894210214715\',)', '(\'月亮湾宾馆\',)', '(\'河北省保定市莲池区河北大学新校区学苑街与隆兴东路交叉口南行50米\',)', '(\'18633203685\',)', '(\'http://www.test.com\',)', '(\'58.0\',)', '(\'78e4decd9f20c2b7a8175a29\',)');
INSERT INTO `mymap_basicinfo` VALUES ('12', '(\'115.57909745643,38.885532846055\',)', '(\'保定青年公寓\',)', '(\'保定市莲池区河大新校区东200米十七中后面\',)', '(\'13582627164\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'d5d2b3792d200e366cc02ce5\',)');
INSERT INTO `mymap_basicinfo` VALUES ('13', '(\'115.57628899409,38.894003111629\',)', '(\'嘉亿华连锁酒店\',)', '(\'河北省保定市莲池区学苑街与隆兴东路交叉口南150米\',)', '(\'(0312)3363288\',)', '(\'http://www.test.com\',)', '(\'70.0\',)', '(\'6f2d3cf49ea683ca108824e2\',)');
INSERT INTO `mymap_basicinfo` VALUES ('14', '(\'115.58653201249,38.891519090835\',)', '(\'保定艾尚旅馆\',)', '(\'河北省保定市莲池区市保定清苑区保定学院北侧\',)', '(\'13784275644\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'11b478ea6a1e5cfbf942b2f6\',)');
INSERT INTO `mymap_basicinfo` VALUES ('15', '(\'115.57597898886,38.891896101495\',)', '(\'保定智都公寓\',)', '(\'河北省保定市莲池区学苑街河北大学新区工商学院北行100米路东\',)', '(\'13582382098\',)', '(\'http://www.test.com\',)', '(\'55.0\',)', '(\'d39a4ef3f7dab2ba0e3dda34\',)');
INSERT INTO `mymap_basicinfo` VALUES ('16', '(\'115.57830703741,38.886388105172\',)', '(\'保定大学城公寓\',)', '(\'河北省保定市莲池区河大新区东200米(大学城内)\',)', '(\'13784991543\',)', '(\'http://www.test.com\',)', '(\'39.0\',)', '(\'72ce9be04b189ad4853304a7\',)');
INSERT INTO `mymap_basicinfo` VALUES ('17', '(\'115.57889803261,38.881187090312\',)', '(\'保定遇见你精品公寓\',)', '(\'保定莲池区七一路与凤栖街交叉路口未来像素2号楼15层1512\',)', '(\'17183148888\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'96e07ddf3b33faf46018099e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('18', '(\'115.58070398601,38.880896109179\',)', '(\'汉庭酒店(保定七一东路店)\',)', '(\'保定市莲池区七一东路3158号\',)', '(\'(0312)6786077\',)', '(\'http://www.test.com\',)', '(\'170.0\',)', '(\'5f17dac71ed3ac1a04026fbe\',)');
INSERT INTO `mymap_basicinfo` VALUES ('19', '(\'115.5771270233,38.894221096386\',)', '(\'雕刻时光主题宾馆\',)', '(\'河北省保定市莲池区隆兴东路与学苑街交叉口河北大学新校区附近\',)', '(\'(0312)6791010\',)', '(\'http://www.test.com\',)', '(\'61.0\',)', '(\'ed87f70847b062b09ff77954\',)');
INSERT INTO `mymap_basicinfo` VALUES ('20', '(\'115.57578773961,38.894462598839\',)', '(\'艾尚客主题酒店(河大新区保定东站店)\',)', '(\'河北省保定市莲池区百楼乡河北大学工商学院学苑街北头\',)', '(\'(0312)5050555\',)', '(\'http://www.test.com\',)', '(\'54.0\',)', '(\'3a84bcefecf96577c7f50d7b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('21', '(\'115.57924998871,38.880679136462\',)', '(\'保定驿缕阳光主题酒店\',)', '(\'河北省保定市莲池区七一中路未来像素\',)', '(\'15733223335\',)', '(\'http://www.test.com\',)', '(\'68.0\',)', '(\'4417ae25f218ef42a10464e1\',)');
INSERT INTO `mymap_basicinfo` VALUES ('22', '(\'115.57571740229,38.894210214715\',)', '(\'月亮湾宾馆\',)', '(\'河北省保定市莲池区河北大学新校区学苑街与隆兴东路交叉口南行50米\',)', '(\'18633203685\',)', '(\'http://www.test.com\',)', '(\'58.0\',)', '(\'78e4decd9f20c2b7a8175a29\',)');
INSERT INTO `mymap_basicinfo` VALUES ('23', '(\'115.57909745643,38.885532846055\',)', '(\'保定青年公寓\',)', '(\'保定市莲池区河大新校区东200米十七中后面\',)', '(\'13582627164\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'d5d2b3792d200e366cc02ce5\',)');
INSERT INTO `mymap_basicinfo` VALUES ('24', '(\'115.57628899409,38.894003111629\',)', '(\'嘉亿华连锁酒店\',)', '(\'河北省保定市莲池区学苑街与隆兴东路交叉口南150米\',)', '(\'(0312)3363288\',)', '(\'http://www.test.com\',)', '(\'70.0\',)', '(\'6f2d3cf49ea683ca108824e2\',)');
INSERT INTO `mymap_basicinfo` VALUES ('25', '(\'115.58653201249,38.891519090835\',)', '(\'保定艾尚旅馆\',)', '(\'河北省保定市莲池区市保定清苑区保定学院北侧\',)', '(\'13784275644\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'11b478ea6a1e5cfbf942b2f6\',)');
INSERT INTO `mymap_basicinfo` VALUES ('26', '(\'115.57597898886,38.891896101495\',)', '(\'保定智都公寓\',)', '(\'河北省保定市莲池区学苑街河北大学新区工商学院北行100米路东\',)', '(\'13582382098\',)', '(\'http://www.test.com\',)', '(\'55.0\',)', '(\'d39a4ef3f7dab2ba0e3dda34\',)');
INSERT INTO `mymap_basicinfo` VALUES ('27', '(\'115.57830703741,38.886388105172\',)', '(\'保定大学城公寓\',)', '(\'河北省保定市莲池区河大新区东200米(大学城内)\',)', '(\'13784991543\',)', '(\'http://www.test.com\',)', '(\'39.0\',)', '(\'72ce9be04b189ad4853304a7\',)');
INSERT INTO `mymap_basicinfo` VALUES ('28', '(\'115.57889803261,38.881187090312\',)', '(\'保定遇见你精品公寓\',)', '(\'保定莲池区七一路与凤栖街交叉路口未来像素2号楼15层1512\',)', '(\'17183148888\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'96e07ddf3b33faf46018099e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('29', '(\'115.57862701384,38.88101512791\',)', '(\'保定云住精品公寓\',)', '(\'河北省保定市莲池区七一东路2788号未来像素2号公寓\',)', '(\'15833337878\',)', '(\'http://www.test.com\',)', '(\'188.0\',)', '(\'7f4a63ba4938c879c7f50d81\',)');
INSERT INTO `mymap_basicinfo` VALUES ('30', '(\'115.57851499514,38.880709119463\',)', '(\'寓美尽美(凤栖街北口分店)\',)', '(\'河北省保定市莲池区七一东路2788号未来像素2号公寓楼底商54号商铺\',)', '(None,)', '(\'http://www.test.com\',)', '(None,)', '(\'d3840fa432e113bdca1b955b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('31', '(\'115.57889704447,38.881057117952\',)', '(\'保定优家青年酒店式公寓\',)', '(\'保定莲池区东金庄乡七一东路未来像素2号楼2606\',)', '(\'15632222522\',)', '(\'http://www.test.com\',)', '(\'118.0\',)', '(\'deb1355c73caa95ec91b9531\',)');
INSERT INTO `mymap_basicinfo` VALUES ('32', '(\'115.57609100755,38.892274093024\',)', '(\'北街公寓\',)', '(\'河北省保定市莲池区河北大学新区北行400米\',)', '(\'13831209828\',)', '(\'http://www.test.com\',)', '(\'150.0\',)', '(\'2408ce965c46ed92f5c59c3d\',)');
INSERT INTO `mymap_basicinfo` VALUES ('33', '(\'115.58070398601,38.880896109179\',)', '(\'汉庭酒店(保定七一东路店)\',)', '(\'保定市莲池区七一东路3158号\',)', '(\'(0312)6786077\',)', '(\'http://www.test.com\',)', '(\'170.0\',)', '(\'5f17dac71ed3ac1a04026fbe\',)');
INSERT INTO `mymap_basicinfo` VALUES ('34', '(\'115.5771270233,38.894221096386\',)', '(\'雕刻时光主题宾馆\',)', '(\'河北省保定市莲池区隆兴东路与学苑街交叉口河北大学新校区附近\',)', '(\'(0312)6791010\',)', '(\'http://www.test.com\',)', '(\'61.0\',)', '(\'ed87f70847b062b09ff77954\',)');
INSERT INTO `mymap_basicinfo` VALUES ('35', '(\'115.57578773961,38.894462598839\',)', '(\'艾尚客主题酒店(河大新区保定东站店)\',)', '(\'河北省保定市莲池区百楼乡河北大学工商学院学苑街北头\',)', '(\'(0312)5050555\',)', '(\'http://www.test.com\',)', '(\'54.0\',)', '(\'3a84bcefecf96577c7f50d7b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('36', '(\'115.57924998871,38.880679136462\',)', '(\'保定驿缕阳光主题酒店\',)', '(\'河北省保定市莲池区七一中路未来像素\',)', '(\'15733223335\',)', '(\'http://www.test.com\',)', '(\'68.0\',)', '(\'4417ae25f218ef42a10464e1\',)');
INSERT INTO `mymap_basicinfo` VALUES ('37', '(\'115.57571740229,38.894210214715\',)', '(\'月亮湾宾馆\',)', '(\'河北省保定市莲池区河北大学新校区学苑街与隆兴东路交叉口南行50米\',)', '(\'18633203685\',)', '(\'http://www.test.com\',)', '(\'58.0\',)', '(\'78e4decd9f20c2b7a8175a29\',)');
INSERT INTO `mymap_basicinfo` VALUES ('38', '(\'115.57909745643,38.885532775842\',)', '(\'保定青年公寓\',)', '(\'保定市莲池区河大新校区东200米十七中后面\',)', '(\'13582627164\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'d5d2b3792d200e366cc02ce5\',)');
INSERT INTO `mymap_basicinfo` VALUES ('39', '(\'115.57628899409,38.894003111629\',)', '(\'嘉亿华连锁酒店\',)', '(\'河北省保定市莲池区学苑街与隆兴东路交叉口南150米\',)', '(\'(0312)3363288\',)', '(\'http://www.test.com\',)', '(\'70.0\',)', '(\'6f2d3cf49ea683ca108824e2\',)');
INSERT INTO `mymap_basicinfo` VALUES ('40', '(\'115.58653201249,38.891519090835\',)', '(\'保定艾尚旅馆\',)', '(\'河北省保定市莲池区市保定清苑区保定学院北侧\',)', '(\'13784275644\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'11b478ea6a1e5cfbf942b2f6\',)');
INSERT INTO `mymap_basicinfo` VALUES ('41', '(\'115.57597898886,38.891896101495\',)', '(\'保定智都公寓\',)', '(\'河北省保定市莲池区学苑街河北大学新区工商学院北行100米路东\',)', '(\'13582382098\',)', '(\'http://www.test.com\',)', '(\'55.0\',)', '(\'d39a4ef3f7dab2ba0e3dda34\',)');
INSERT INTO `mymap_basicinfo` VALUES ('42', '(\'115.57830703741,38.886388105172\',)', '(\'保定大学城公寓\',)', '(\'河北省保定市莲池区河大新区东200米(大学城内)\',)', '(\'13784991543\',)', '(\'http://www.test.com\',)', '(\'39.0\',)', '(\'72ce9be04b189ad4853304a7\',)');
INSERT INTO `mymap_basicinfo` VALUES ('43', '(\'115.57889803261,38.881187090312\',)', '(\'保定遇见你精品公寓\',)', '(\'保定莲池区七一路与凤栖街交叉路口未来像素2号楼15层1512\',)', '(\'17183148888\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'96e07ddf3b33faf46018099e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('44', '(\'115.58070398601,38.880896109179\',)', '(\'汉庭酒店(保定七一东路店)\',)', '(\'保定市莲池区七一东路3158号\',)', '(\'(0312)6786077\',)', '(\'http://www.test.com\',)', '(\'170.0\',)', '(\'5f17dac71ed3ac1a04026fbe\',)');
INSERT INTO `mymap_basicinfo` VALUES ('45', '(\'115.5771270233,38.894221096386\',)', '(\'雕刻时光主题宾馆\',)', '(\'河北省保定市莲池区隆兴东路与学苑街交叉口河北大学新校区附近\',)', '(\'(0312)6791010\',)', '(\'http://www.test.com\',)', '(\'61.0\',)', '(\'ed87f70847b062b09ff77954\',)');
INSERT INTO `mymap_basicinfo` VALUES ('46', '(\'115.57578773961,38.894462598839\',)', '(\'艾尚客主题酒店(河大新区保定东站店)\',)', '(\'河北省保定市莲池区百楼乡河北大学工商学院学苑街北头\',)', '(\'(0312)5050555\',)', '(\'http://www.test.com\',)', '(\'54.0\',)', '(\'3a84bcefecf96577c7f50d7b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('47', '(\'115.57924998871,38.880679136462\',)', '(\'保定驿缕阳光主题酒店\',)', '(\'河北省保定市莲池区七一中路未来像素\',)', '(\'15733223335\',)', '(\'http://www.test.com\',)', '(\'68.0\',)', '(\'4417ae25f218ef42a10464e1\',)');
INSERT INTO `mymap_basicinfo` VALUES ('48', '(\'115.57571740229,38.894210214715\',)', '(\'月亮湾宾馆\',)', '(\'河北省保定市莲池区河北大学新校区学苑街与隆兴东路交叉口南行50米\',)', '(\'18633203685\',)', '(\'http://www.test.com\',)', '(\'58.0\',)', '(\'78e4decd9f20c2b7a8175a29\',)');
INSERT INTO `mymap_basicinfo` VALUES ('49', '(\'115.57909745643,38.885532846055\',)', '(\'保定青年公寓\',)', '(\'保定市莲池区河大新校区东200米十七中后面\',)', '(\'13582627164\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'d5d2b3792d200e366cc02ce5\',)');
INSERT INTO `mymap_basicinfo` VALUES ('50', '(\'115.57628899409,38.894003111629\',)', '(\'嘉亿华连锁酒店\',)', '(\'河北省保定市莲池区学苑街与隆兴东路交叉口南150米\',)', '(\'(0312)3363288\',)', '(\'http://www.test.com\',)', '(\'70.0\',)', '(\'6f2d3cf49ea683ca108824e2\',)');
INSERT INTO `mymap_basicinfo` VALUES ('51', '(\'115.58653201249,38.891519090835\',)', '(\'保定艾尚旅馆\',)', '(\'河北省保定市莲池区市保定清苑区保定学院北侧\',)', '(\'13784275644\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'11b478ea6a1e5cfbf942b2f6\',)');
INSERT INTO `mymap_basicinfo` VALUES ('52', '(\'115.57597898886,38.891896101495\',)', '(\'保定智都公寓\',)', '(\'河北省保定市莲池区学苑街河北大学新区工商学院北行100米路东\',)', '(\'13582382098\',)', '(\'http://www.test.com\',)', '(\'55.0\',)', '(\'d39a4ef3f7dab2ba0e3dda34\',)');
INSERT INTO `mymap_basicinfo` VALUES ('53', '(\'115.57830703741,38.886388105172\',)', '(\'保定大学城公寓\',)', '(\'河北省保定市莲池区河大新区东200米(大学城内)\',)', '(\'13784991543\',)', '(\'http://www.test.com\',)', '(\'39.0\',)', '(\'72ce9be04b189ad4853304a7\',)');
INSERT INTO `mymap_basicinfo` VALUES ('54', '(\'115.57889803261,38.881187020095\',)', '(\'保定遇见你精品公寓\',)', '(\'保定莲池区七一路与凤栖街交叉路口未来像素2号楼15层1512\',)', '(\'17183148888\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'96e07ddf3b33faf46018099e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('55', '(\'115.58070398601,38.880896109179\',)', '(\'汉庭酒店(保定七一东路店)\',)', '(\'保定市莲池区七一东路3158号\',)', '(\'(0312)6786077\',)', '(\'http://www.test.com\',)', '(\'170.0\',)', '(\'5f17dac71ed3ac1a04026fbe\',)');
INSERT INTO `mymap_basicinfo` VALUES ('56', '(\'115.5771270233,38.894221096386\',)', '(\'雕刻时光主题宾馆\',)', '(\'河北省保定市莲池区隆兴东路与学苑街交叉口河北大学新校区附近\',)', '(\'(0312)6791010\',)', '(\'http://www.test.com\',)', '(\'61.0\',)', '(\'ed87f70847b062b09ff77954\',)');
INSERT INTO `mymap_basicinfo` VALUES ('57', '(\'115.57578773961,38.894462598839\',)', '(\'艾尚客主题酒店(河大新区保定东站店)\',)', '(\'河北省保定市莲池区百楼乡河北大学工商学院学苑街北头\',)', '(\'(0312)5050555\',)', '(\'http://www.test.com\',)', '(\'54.0\',)', '(\'3a84bcefecf96577c7f50d7b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('58', '(\'115.57924998871,38.880679136462\',)', '(\'保定驿缕阳光主题酒店\',)', '(\'河北省保定市莲池区七一中路未来像素\',)', '(\'15733223335\',)', '(\'http://www.test.com\',)', '(\'68.0\',)', '(\'4417ae25f218ef42a10464e1\',)');
INSERT INTO `mymap_basicinfo` VALUES ('59', '(\'115.57571740229,38.894210214715\',)', '(\'月亮湾宾馆\',)', '(\'河北省保定市莲池区河北大学新校区学苑街与隆兴东路交叉口南行50米\',)', '(\'18633203685\',)', '(\'http://www.test.com\',)', '(\'58.0\',)', '(\'78e4decd9f20c2b7a8175a29\',)');
INSERT INTO `mymap_basicinfo` VALUES ('60', '(\'115.57909745643,38.885532846055\',)', '(\'保定青年公寓\',)', '(\'保定市莲池区河大新校区东200米十七中后面\',)', '(\'13582627164\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'d5d2b3792d200e366cc02ce5\',)');
INSERT INTO `mymap_basicinfo` VALUES ('61', '(\'115.57628899409,38.894003111629\',)', '(\'嘉亿华连锁酒店\',)', '(\'河北省保定市莲池区学苑街与隆兴东路交叉口南150米\',)', '(\'(0312)3363288\',)', '(\'http://www.test.com\',)', '(\'70.0\',)', '(\'6f2d3cf49ea683ca108824e2\',)');
INSERT INTO `mymap_basicinfo` VALUES ('62', '(\'115.58653201249,38.891519090835\',)', '(\'保定艾尚旅馆\',)', '(\'河北省保定市莲池区市保定清苑区保定学院北侧\',)', '(\'13784275644\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'11b478ea6a1e5cfbf942b2f6\',)');
INSERT INTO `mymap_basicinfo` VALUES ('63', '(\'115.57830703741,38.886388105172\',)', '(\'保定大学城公寓\',)', '(\'河北省保定市莲池区河大新区东200米(大学城内)\',)', '(\'13784991543\',)', '(\'http://www.test.com\',)', '(\'39.0\',)', '(\'72ce9be04b189ad4853304a7\',)');
INSERT INTO `mymap_basicinfo` VALUES ('64', '(\'115.57889803261,38.881187090312\',)', '(\'保定遇见你精品公寓\',)', '(\'保定莲池区七一路与凤栖街交叉路口未来像素2号楼15层1512\',)', '(\'17183148888\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'96e07ddf3b33faf46018099e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('65', '(\'115.57884700886,38.881075093614\',)', '(\'保定初心精品日租自助公寓\',)', '(\'河北省保定市莲池区七一东路未来像素2号公寓楼1620室\',)', '(\'15188767066\',)', '(\'http://www.test.com\',)', '(\'118.0\',)', '(\'92eb258f09e4666db21e36ef\',)');
INSERT INTO `mymap_basicinfo` VALUES ('66', '(\'115.58070398601,38.880896109179\',)', '(\'汉庭酒店(保定七一东路店)\',)', '(\'保定市莲池区七一东路3158号\',)', '(\'(0312)6786077\',)', '(\'http://www.test.com\',)', '(\'170.0\',)', '(\'5f17dac71ed3ac1a04026fbe\',)');
INSERT INTO `mymap_basicinfo` VALUES ('67', '(\'115.5771270233,38.894221096386\',)', '(\'雕刻时光主题宾馆\',)', '(\'河北省保定市莲池区隆兴东路与学苑街交叉口河北大学新校区附近\',)', '(\'(0312)6791010\',)', '(\'http://www.test.com\',)', '(\'61.0\',)', '(\'ed87f70847b062b09ff77954\',)');
INSERT INTO `mymap_basicinfo` VALUES ('68', '(\'115.57578773961,38.894462598839\',)', '(\'艾尚客主题酒店(河大新区保定东站店)\',)', '(\'河北省保定市莲池区百楼乡河北大学工商学院学苑街北头\',)', '(\'(0312)5050555\',)', '(\'http://www.test.com\',)', '(\'54.0\',)', '(\'3a84bcefecf96577c7f50d7b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('69', '(\'115.57924998871,38.880679136462\',)', '(\'保定驿缕阳光主题酒店\',)', '(\'河北省保定市莲池区七一中路未来像素\',)', '(\'15733223335\',)', '(\'http://www.test.com\',)', '(\'68.0\',)', '(\'4417ae25f218ef42a10464e1\',)');
INSERT INTO `mymap_basicinfo` VALUES ('70', '(\'115.57571740229,38.894210214715\',)', '(\'月亮湾宾馆\',)', '(\'河北省保定市莲池区河北大学新校区学苑街与隆兴东路交叉口南行50米\',)', '(\'18633203685\',)', '(\'http://www.test.com\',)', '(\'58.0\',)', '(\'78e4decd9f20c2b7a8175a29\',)');
INSERT INTO `mymap_basicinfo` VALUES ('71', '(\'115.57909745643,38.885532846055\',)', '(\'保定青年公寓\',)', '(\'保定市莲池区河大新校区东200米十七中后面\',)', '(\'13582627164\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'d5d2b3792d200e366cc02ce5\',)');
INSERT INTO `mymap_basicinfo` VALUES ('72', '(\'115.57628899409,38.894003111629\',)', '(\'嘉亿华连锁酒店\',)', '(\'河北省保定市莲池区学苑街与隆兴东路交叉口南150米\',)', '(\'(0312)3363288\',)', '(\'http://www.test.com\',)', '(\'70.0\',)', '(\'6f2d3cf49ea683ca108824e2\',)');
INSERT INTO `mymap_basicinfo` VALUES ('73', '(\'115.58653201249,38.891519090835\',)', '(\'保定艾尚旅馆\',)', '(\'河北省保定市莲池区市保定清苑区保定学院北侧\',)', '(\'13784275644\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'11b478ea6a1e5cfbf942b2f6\',)');
INSERT INTO `mymap_basicinfo` VALUES ('74', '(\'115.57830703741,38.886388105172\',)', '(\'保定大学城公寓\',)', '(\'河北省保定市莲池区河大新区东200米(大学城内)\',)', '(\'13784991543\',)', '(\'http://www.test.com\',)', '(\'39.0\',)', '(\'72ce9be04b189ad4853304a7\',)');
INSERT INTO `mymap_basicinfo` VALUES ('75', '(\'115.57889803261,38.881187090312\',)', '(\'保定遇见你精品公寓\',)', '(\'保定莲池区七一路与凤栖街交叉路口未来像素2号楼15层1512\',)', '(\'17183148888\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'96e07ddf3b33faf46018099e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('76', '(\'115.57884700886,38.881075093614\',)', '(\'保定初心精品日租自助公寓\',)', '(\'河北省保定市莲池区七一东路未来像素2号公寓楼1620室\',)', '(\'15188767066\',)', '(\'http://www.test.com\',)', '(\'118.0\',)', '(\'92eb258f09e4666db21e36ef\',)');
INSERT INTO `mymap_basicinfo` VALUES ('77', '(\'115.57578773961,38.894462598839\',)', '(\'艾尚客主题酒店(河大新区保定东站店)\',)', '(\'河北省保定市莲池区百楼乡河北大学工商学院学苑街北头\',)', '(\'(0312)5050555\',)', '(\'http://www.test.com\',)', '(\'54.0\',)', '(\'3a84bcefecf96577c7f50d7b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('78', '(\'115.58070398601,38.880896109179\',)', '(\'汉庭酒店(保定七一东路店)\',)', '(\'保定市莲池区七一东路3158号\',)', '(\'(0312)6786077\',)', '(\'http://www.test.com\',)', '(\'170.0\',)', '(\'5f17dac71ed3ac1a04026fbe\',)');
INSERT INTO `mymap_basicinfo` VALUES ('79', '(\'115.5771270233,38.894221096386\',)', '(\'雕刻时光主题宾馆\',)', '(\'河北省保定市莲池区隆兴东路与学苑街交叉口河北大学新校区附近\',)', '(\'(0312)6791010\',)', '(\'http://www.test.com\',)', '(\'61.0\',)', '(\'ed87f70847b062b09ff77954\',)');
INSERT INTO `mymap_basicinfo` VALUES ('80', '(\'115.57578773961,38.894462598839\',)', '(\'艾尚客主题酒店(河大新区保定东站店)\',)', '(\'河北省保定市莲池区百楼乡河北大学工商学院学苑街北头\',)', '(\'(0312)5050555\',)', '(\'http://www.test.com\',)', '(\'54.0\',)', '(\'3a84bcefecf96577c7f50d7b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('81', '(\'115.57924998871,38.880679136462\',)', '(\'保定驿缕阳光主题酒店\',)', '(\'河北省保定市莲池区七一中路未来像素\',)', '(\'15733223335\',)', '(\'http://www.test.com\',)', '(\'68.0\',)', '(\'4417ae25f218ef42a10464e1\',)');
INSERT INTO `mymap_basicinfo` VALUES ('82', '(\'115.57571740229,38.894210214715\',)', '(\'月亮湾宾馆\',)', '(\'河北省保定市莲池区河北大学新校区学苑街与隆兴东路交叉口南行50米\',)', '(\'18633203685\',)', '(\'http://www.test.com\',)', '(\'58.0\',)', '(\'78e4decd9f20c2b7a8175a29\',)');
INSERT INTO `mymap_basicinfo` VALUES ('83', '(\'115.57909745643,38.885532846055\',)', '(\'保定青年公寓\',)', '(\'保定市莲池区河大新校区东200米十七中后面\',)', '(\'13582627164\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'d5d2b3792d200e366cc02ce5\',)');
INSERT INTO `mymap_basicinfo` VALUES ('84', '(\'115.57628899409,38.894003111629\',)', '(\'嘉亿华连锁酒店\',)', '(\'河北省保定市莲池区学苑街与隆兴东路交叉口南150米\',)', '(\'(0312)3363288\',)', '(\'http://www.test.com\',)', '(\'70.0\',)', '(\'6f2d3cf49ea683ca108824e2\',)');
INSERT INTO `mymap_basicinfo` VALUES ('85', '(\'115.58653201249,38.891519090835\',)', '(\'保定艾尚旅馆\',)', '(\'河北省保定市莲池区市保定清苑区保定学院北侧\',)', '(\'13784275644\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'11b478ea6a1e5cfbf942b2f6\',)');
INSERT INTO `mymap_basicinfo` VALUES ('86', '(\'115.57830703741,38.886388105172\',)', '(\'保定大学城公寓\',)', '(\'河北省保定市莲池区河大新区东200米(大学城内)\',)', '(\'13784991543\',)', '(\'http://www.test.com\',)', '(\'39.0\',)', '(\'72ce9be04b189ad4853304a7\',)');
INSERT INTO `mymap_basicinfo` VALUES ('87', '(\'115.57889803261,38.881187090312\',)', '(\'保定遇见你精品公寓\',)', '(\'保定莲池区七一路与凤栖街交叉路口未来像素2号楼15层1512\',)', '(\'17183148888\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'96e07ddf3b33faf46018099e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('88', '(\'115.57884700886,38.881075093614\',)', '(\'保定初心精品日租自助公寓\',)', '(\'河北省保定市莲池区七一东路未来像素2号公寓楼1620室\',)', '(\'15188767066\',)', '(\'http://www.test.com\',)', '(\'118.0\',)', '(\'92eb258f09e4666db21e36ef\',)');
INSERT INTO `mymap_basicinfo` VALUES ('90', '(\'115.58070398601,38.880896109179\',)', '(\'汉庭酒店(保定七一东路店)\',)', '(\'保定市莲池区七一东路3158号\',)', '(\'(0312)6786077\',)', '(\'http://www.test.com\',)', '(\'170.0\',)', '(\'5f17dac71ed3ac1a04026fbe\',)');
INSERT INTO `mymap_basicinfo` VALUES ('91', '(\'115.5771270233,38.894221096386\',)', '(\'雕刻时光主题宾馆\',)', '(\'河北省保定市莲池区隆兴东路与学苑街交叉口河北大学新校区附近\',)', '(\'(0312)6791010\',)', '(\'http://www.test.com\',)', '(\'61.0\',)', '(\'ed87f70847b062b09ff77954\',)');
INSERT INTO `mymap_basicinfo` VALUES ('92', '(\'115.57578773961,38.894462598839\',)', '(\'艾尚客主题酒店(河大新区保定东站店)\',)', '(\'河北省保定市莲池区百楼乡河北大学工商学院学苑街北头\',)', '(\'(0312)5050555\',)', '(\'http://www.test.com\',)', '(\'54.0\',)', '(\'3a84bcefecf96577c7f50d7b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('93', '(\'115.57924998871,38.880679136462\',)', '(\'保定驿缕阳光主题酒店\',)', '(\'河北省保定市莲池区七一中路未来像素\',)', '(\'15733223335\',)', '(\'http://www.test.com\',)', '(\'68.0\',)', '(\'4417ae25f218ef42a10464e1\',)');
INSERT INTO `mymap_basicinfo` VALUES ('94', '(\'115.57571740229,38.894210214715\',)', '(\'月亮湾宾馆\',)', '(\'河北省保定市莲池区河北大学新校区学苑街与隆兴东路交叉口南行50米\',)', '(\'18633203685\',)', '(\'http://www.test.com\',)', '(\'58.0\',)', '(\'78e4decd9f20c2b7a8175a29\',)');
INSERT INTO `mymap_basicinfo` VALUES ('95', '(\'115.57909745643,38.885532846055\',)', '(\'保定青年公寓\',)', '(\'保定市莲池区河大新校区东200米十七中后面\',)', '(\'13582627164\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'d5d2b3792d200e366cc02ce5\',)');
INSERT INTO `mymap_basicinfo` VALUES ('96', '(\'115.57628899409,38.894003111629\',)', '(\'嘉亿华连锁酒店\',)', '(\'河北省保定市莲池区学苑街与隆兴东路交叉口南150米\',)', '(\'(0312)3363288\',)', '(\'http://www.test.com\',)', '(\'70.0\',)', '(\'6f2d3cf49ea683ca108824e2\',)');
INSERT INTO `mymap_basicinfo` VALUES ('97', '(\'115.58653201249,38.891519090835\',)', '(\'保定艾尚旅馆\',)', '(\'河北省保定市莲池区市保定清苑区保定学院北侧\',)', '(\'13784275644\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'11b478ea6a1e5cfbf942b2f6\',)');
INSERT INTO `mymap_basicinfo` VALUES ('98', '(\'115.57830703741,38.886388105172\',)', '(\'保定大学城公寓\',)', '(\'河北省保定市莲池区河大新区东200米(大学城内)\',)', '(\'13784991543\',)', '(\'http://www.test.com\',)', '(\'39.0\',)', '(\'72ce9be04b189ad4853304a7\',)');
INSERT INTO `mymap_basicinfo` VALUES ('99', '(\'115.57889803261,38.881187090312\',)', '(\'保定遇见你精品公寓\',)', '(\'保定莲池区七一路与凤栖街交叉路口未来像素2号楼15层1512\',)', '(\'17183148888\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'96e07ddf3b33faf46018099e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('100', '(\'115.57884700886,38.881075093614\',)', '(\'保定初心精品日租自助公寓\',)', '(\'河北省保定市莲池区七一东路未来像素2号公寓楼1620室\',)', '(\'15188767066\',)', '(\'http://www.test.com\',)', '(\'118.0\',)', '(\'92eb258f09e4666db21e36ef\',)');
INSERT INTO `mymap_basicinfo` VALUES ('101', '(\'115.58070398601,38.880896109179\',)', '(\'汉庭酒店(保定七一东路店)\',)', '(\'保定市莲池区七一东路3158号\',)', '(\'(0312)6786077\',)', '(\'http://www.test.com\',)', '(\'170.0\',)', '(\'5f17dac71ed3ac1a04026fbe\',)');
INSERT INTO `mymap_basicinfo` VALUES ('102', '(\'115.5771270233,38.894221096386\',)', '(\'雕刻时光主题宾馆\',)', '(\'河北省保定市莲池区隆兴东路与学苑街交叉口河北大学新校区附近\',)', '(\'(0312)6791010\',)', '(\'http://www.test.com\',)', '(\'61.0\',)', '(\'ed87f70847b062b09ff77954\',)');
INSERT INTO `mymap_basicinfo` VALUES ('103', '(\'115.57578773961,38.894462598839\',)', '(\'艾尚客主题酒店(河大新区保定东站店)\',)', '(\'河北省保定市莲池区百楼乡河北大学工商学院学苑街北头\',)', '(\'(0312)5050555\',)', '(\'http://www.test.com\',)', '(\'54.0\',)', '(\'3a84bcefecf96577c7f50d7b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('104', '(\'115.57924998871,38.880679136462\',)', '(\'保定驿缕阳光主题酒店\',)', '(\'河北省保定市莲池区七一中路未来像素\',)', '(\'15733223335\',)', '(\'http://www.test.com\',)', '(\'68.0\',)', '(\'4417ae25f218ef42a10464e1\',)');
INSERT INTO `mymap_basicinfo` VALUES ('105', '(\'115.57571740229,38.894210214715\',)', '(\'月亮湾宾馆\',)', '(\'河北省保定市莲池区河北大学新校区学苑街与隆兴东路交叉口南行50米\',)', '(\'18633203685\',)', '(\'http://www.test.com\',)', '(\'58.0\',)', '(\'78e4decd9f20c2b7a8175a29\',)');
INSERT INTO `mymap_basicinfo` VALUES ('106', '(\'115.57909745643,38.885532846055\',)', '(\'保定青年公寓\',)', '(\'保定市莲池区河大新校区东200米十七中后面\',)', '(\'13582627164\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'d5d2b3792d200e366cc02ce5\',)');
INSERT INTO `mymap_basicinfo` VALUES ('107', '(\'115.57628899409,38.894003111629\',)', '(\'嘉亿华连锁酒店\',)', '(\'河北省保定市莲池区学苑街与隆兴东路交叉口南150米\',)', '(\'(0312)3363288\',)', '(\'http://www.test.com\',)', '(\'70.0\',)', '(\'6f2d3cf49ea683ca108824e2\',)');
INSERT INTO `mymap_basicinfo` VALUES ('108', '(\'115.58653201249,38.891519090835\',)', '(\'保定艾尚旅馆\',)', '(\'河北省保定市莲池区市保定清苑区保定学院北侧\',)', '(\'13784275644\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'11b478ea6a1e5cfbf942b2f6\',)');
INSERT INTO `mymap_basicinfo` VALUES ('109', '(\'115.57597898886,38.891896101495\',)', '(\'保定智都公寓\',)', '(\'河北省保定市莲池区学苑街河北大学新区工商学院北行100米路东\',)', '(\'13582382098\',)', '(\'http://www.test.com\',)', '(\'55.0\',)', '(\'d39a4ef3f7dab2ba0e3dda34\',)');
INSERT INTO `mymap_basicinfo` VALUES ('110', '(\'115.57830703741,38.886388105172\',)', '(\'保定大学城公寓\',)', '(\'河北省保定市莲池区河大新区东200米(大学城内)\',)', '(\'13784991543\',)', '(\'http://www.test.com\',)', '(\'39.0\',)', '(\'72ce9be04b189ad4853304a7\',)');
INSERT INTO `mymap_basicinfo` VALUES ('111', '(\'115.57889803261,38.881187090312\',)', '(\'保定遇见你精品公寓\',)', '(\'保定莲池区七一路与凤栖街交叉路口未来像素2号楼15层1512\',)', '(\'17183148888\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'96e07ddf3b33faf46018099e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('112', '(\'115.58070398601,38.880896109179\',)', '(\'汉庭酒店(保定七一东路店)\',)', '(\'保定市莲池区七一东路3158号\',)', '(\'(0312)6786077\',)', '(\'http://www.test.com\',)', '(\'170.0\',)', '(\'5f17dac71ed3ac1a04026fbe\',)');
INSERT INTO `mymap_basicinfo` VALUES ('113', '(\'115.5771270233,38.894221096386\',)', '(\'雕刻时光主题宾馆\',)', '(\'河北省保定市莲池区隆兴东路与学苑街交叉口河北大学新校区附近\',)', '(\'(0312)6791010\',)', '(\'http://www.test.com\',)', '(\'61.0\',)', '(\'ed87f70847b062b09ff77954\',)');
INSERT INTO `mymap_basicinfo` VALUES ('114', '(\'115.57578773961,38.894462598839\',)', '(\'艾尚客主题酒店(河大新区保定东站店)\',)', '(\'河北省保定市莲池区百楼乡河北大学工商学院学苑街北头\',)', '(\'(0312)5050555\',)', '(\'http://www.test.com\',)', '(\'54.0\',)', '(\'3a84bcefecf96577c7f50d7b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('115', '(\'115.57924998871,38.880679136462\',)', '(\'保定驿缕阳光主题酒店\',)', '(\'河北省保定市莲池区七一中路未来像素\',)', '(\'15733223335\',)', '(\'http://www.test.com\',)', '(\'68.0\',)', '(\'4417ae25f218ef42a10464e1\',)');
INSERT INTO `mymap_basicinfo` VALUES ('116', '(\'115.57571740229,38.894210214715\',)', '(\'月亮湾宾馆\',)', '(\'河北省保定市莲池区河北大学新校区学苑街与隆兴东路交叉口南行50米\',)', '(\'18633203685\',)', '(\'http://www.test.com\',)', '(\'58.0\',)', '(\'78e4decd9f20c2b7a8175a29\',)');
INSERT INTO `mymap_basicinfo` VALUES ('117', '(\'115.57909745643,38.885532846055\',)', '(\'保定青年公寓\',)', '(\'保定市莲池区河大新校区东200米十七中后面\',)', '(\'13582627164\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'d5d2b3792d200e366cc02ce5\',)');
INSERT INTO `mymap_basicinfo` VALUES ('118', '(\'115.57628899409,38.894003111629\',)', '(\'嘉亿华连锁酒店\',)', '(\'河北省保定市莲池区学苑街与隆兴东路交叉口南150米\',)', '(\'(0312)3363288\',)', '(\'http://www.test.com\',)', '(\'70.0\',)', '(\'6f2d3cf49ea683ca108824e2\',)');
INSERT INTO `mymap_basicinfo` VALUES ('119', '(\'115.58653201249,38.891519090835\',)', '(\'保定艾尚旅馆\',)', '(\'河北省保定市莲池区市保定清苑区保定学院北侧\',)', '(\'13784275644\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'11b478ea6a1e5cfbf942b2f6\',)');
INSERT INTO `mymap_basicinfo` VALUES ('120', '(\'115.57597898886,38.891896101495\',)', '(\'保定智都公寓\',)', '(\'河北省保定市莲池区学苑街河北大学新区工商学院北行100米路东\',)', '(\'13582382098\',)', '(\'http://www.test.com\',)', '(\'55.0\',)', '(\'d39a4ef3f7dab2ba0e3dda34\',)');
INSERT INTO `mymap_basicinfo` VALUES ('121', '(\'115.57830703741,38.886388105172\',)', '(\'保定大学城公寓\',)', '(\'河北省保定市莲池区河大新区东200米(大学城内)\',)', '(\'13784991543\',)', '(\'http://www.test.com\',)', '(\'39.0\',)', '(\'72ce9be04b189ad4853304a7\',)');
INSERT INTO `mymap_basicinfo` VALUES ('122', '(\'115.57889803261,38.881187090312\',)', '(\'保定遇见你精品公寓\',)', '(\'保定莲池区七一路与凤栖街交叉路口未来像素2号楼15层1512\',)', '(\'17183148888\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'96e07ddf3b33faf46018099e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('123', '(\'115.58070398601,38.880896109179\',)', '(\'汉庭酒店(保定七一东路店)\',)', '(\'保定市莲池区七一东路3158号\',)', '(\'(0312)6786077\',)', '(\'http://www.test.com\',)', '(\'170.0\',)', '(\'5f17dac71ed3ac1a04026fbe\',)');
INSERT INTO `mymap_basicinfo` VALUES ('124', '(\'115.57571740229,38.894210214715\',)', '(\'月亮湾宾馆\',)', '(\'河北省保定市莲池区河北大学新校区学苑街与隆兴东路交叉口南行50米\',)', '(\'18633203685\',)', '(\'http://www.test.com\',)', '(\'58.0\',)', '(\'78e4decd9f20c2b7a8175a29\',)');
INSERT INTO `mymap_basicinfo` VALUES ('125', '(\'115.57597898886,38.891896101495\',)', '(\'保定智都公寓\',)', '(\'河北省保定市莲池区学苑街河北大学新区工商学院北行100米路东\',)', '(\'13582382098\',)', '(\'http://www.test.com\',)', '(\'55.0\',)', '(\'d39a4ef3f7dab2ba0e3dda34\',)');
INSERT INTO `mymap_basicinfo` VALUES ('126', '(\'115.57889803261,38.881187090312\',)', '(\'保定遇见你精品公寓\',)', '(\'保定莲池区七一路与凤栖街交叉路口未来像素2号楼15层1512\',)', '(\'17183148888\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'96e07ddf3b33faf46018099e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('127', '(\'115.57881808342,38.886224159663\',)', '(\'保定如家短租公寓\',)', '(\'河北省保定市莲池区学院街大学城小区5号楼66号\',)', '(\'15720100228\',)', '(\'http://www.test.com\',)', '(\'44.0\',)', '(\'b787fc4be7a98c899fec2bd2\',)');
INSERT INTO `mymap_basicinfo` VALUES ('128', '(\'115.57884700886,38.881075093614\',)', '(\'保定初心精品日租自助公寓\',)', '(\'河北省保定市莲池区七一东路未来像素2号公寓楼1620室\',)', '(\'15188767066\',)', '(\'http://www.test.com\',)', '(\'118.0\',)', '(\'92eb258f09e4666db21e36ef\',)');
INSERT INTO `mymap_basicinfo` VALUES ('129', '(\'115.57889704447,38.881057117952\',)', '(\'保定优家青年酒店式公寓\',)', '(\'保定莲池区东金庄乡七一东路未来像素2号楼2606\',)', '(\'15632222522\',)', '(\'http://www.test.com\',)', '(\'118.0\',)', '(\'deb1355c73caa95ec91b9531\',)');
INSERT INTO `mymap_basicinfo` VALUES ('130', '(\'115.57940602438,38.885526105609\',)', '(\'保定e家公寓\',)', '(\'河北省保定市莲池区七一东路大学城小区30号门面\',)', '(\'15176355539\',)', '(\'http://www.test.com\',)', '(\'44.0\',)', '(\'d0b309c1e5c2d602b64f5451\',)');
INSERT INTO `mymap_basicinfo` VALUES ('131', '(\'115.57888698345,38.881055081646\',)', '(\'保定依恋公寓\',)', '(\'河北省保定市莲池区未来像素\',)', '(None,)', '(\'http://www.test.com\',)', '(\'137.0\',)', '(\'72a326a13a1a3e6a8d772703\',)');
INSERT INTO `mymap_basicinfo` VALUES ('132', '(\'115.57880703426,38.88105908404\',)', '(\'保定苹果日租公寓\',)', '(\'河北省保定市莲池区七一东路与凤栖街交汇处未来像素2号楼一单元1212房间\',)', '(\'18830230922\',)', '(\'http://www.test.com\',)', '(\'60.0\',)', '(\'06e9a13fdacfbd0509b93a0b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('133', '(\'115.5771270233,38.894221096386\',)', '(\'雕刻时光主题宾馆\',)', '(\'河北省保定市莲池区隆兴东路与学苑街交叉口河北大学新校区附近\',)', '(\'(0312)6791010\',)', '(\'http://www.test.com\',)', '(\'61.0\',)', '(\'ed87f70847b062b09ff77954\',)');
INSERT INTO `mymap_basicinfo` VALUES ('134', '(\'115.57578773961,38.894462598839\',)', '(\'艾尚客主题酒店(河大新区保定东站店)\',)', '(\'河北省保定市莲池区百楼乡河北大学工商学院学苑街北头\',)', '(\'(0312)5050555\',)', '(\'http://www.test.com\',)', '(\'54.0\',)', '(\'3a84bcefecf96577c7f50d7b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('135', '(\'115.57924998871,38.880679136462\',)', '(\'保定驿缕阳光主题酒店\',)', '(\'河北省保定市莲池区七一中路未来像素\',)', '(\'15733223335\',)', '(\'http://www.test.com\',)', '(\'68.0\',)', '(\'4417ae25f218ef42a10464e1\',)');
INSERT INTO `mymap_basicinfo` VALUES ('136', '(\'115.57628899409,38.894003111629\',)', '(\'嘉亿华连锁酒店\',)', '(\'河北省保定市莲池区学苑街与隆兴东路交叉口南150米\',)', '(\'(0312)3363288\',)', '(\'http://www.test.com\',)', '(\'70.0\',)', '(\'6f2d3cf49ea683ca108824e2\',)');
INSERT INTO `mymap_basicinfo` VALUES ('137', '(\'115.58653201249,38.891519090835\',)', '(\'保定艾尚旅馆\',)', '(\'河北省保定市莲池区市保定清苑区保定学院北侧\',)', '(\'13784275644\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'11b478ea6a1e5cfbf942b2f6\',)');
INSERT INTO `mymap_basicinfo` VALUES ('138', '(\'115.57909745643,38.885532846055\',)', '(\'保定青年公寓\',)', '(\'保定市莲池区河大新校区东200米十七中后面\',)', '(\'13582627164\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'d5d2b3792d200e366cc02ce5\',)');
INSERT INTO `mymap_basicinfo` VALUES ('139', '(\'115.58070398601,38.880896109179\',)', '(\'汉庭酒店(保定七一东路店)\',)', '(\'保定市莲池区七一东路3158号\',)', '(\'(0312)6786077\',)', '(\'http://www.test.com\',)', '(\'170.0\',)', '(\'5f17dac71ed3ac1a04026fbe\',)');
INSERT INTO `mymap_basicinfo` VALUES ('140', '(\'115.5771270233,38.894221096386\',)', '(\'雕刻时光主题宾馆\',)', '(\'河北省保定市莲池区隆兴东路与学苑街交叉口河北大学新校区附近\',)', '(\'(0312)6791010\',)', '(\'http://www.test.com\',)', '(\'61.0\',)', '(\'ed87f70847b062b09ff77954\',)');
INSERT INTO `mymap_basicinfo` VALUES ('141', '(\'115.57578773961,38.894462598839\',)', '(\'艾尚客主题酒店(河大新区保定东站店)\',)', '(\'河北省保定市莲池区百楼乡河北大学工商学院学苑街北头\',)', '(\'(0312)5050555\',)', '(\'http://www.test.com\',)', '(\'54.0\',)', '(\'3a84bcefecf96577c7f50d7b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('142', '(\'115.57924998871,38.880679136462\',)', '(\'保定驿缕阳光主题酒店\',)', '(\'河北省保定市莲池区七一中路未来像素\',)', '(\'15733223335\',)', '(\'http://www.test.com\',)', '(\'68.0\',)', '(\'4417ae25f218ef42a10464e1\',)');
INSERT INTO `mymap_basicinfo` VALUES ('143', '(\'115.57571740229,38.894210214715\',)', '(\'月亮湾宾馆\',)', '(\'河北省保定市莲池区河北大学新校区学苑街与隆兴东路交叉口南行50米\',)', '(\'18633203685\',)', '(\'http://www.test.com\',)', '(\'58.0\',)', '(\'78e4decd9f20c2b7a8175a29\',)');
INSERT INTO `mymap_basicinfo` VALUES ('144', '(\'115.57909745643,38.885532846055\',)', '(\'保定青年公寓\',)', '(\'保定市莲池区河大新校区东200米十七中后面\',)', '(\'13582627164\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'d5d2b3792d200e366cc02ce5\',)');
INSERT INTO `mymap_basicinfo` VALUES ('145', '(\'115.57628899409,38.894003111629\',)', '(\'嘉亿华连锁酒店\',)', '(\'河北省保定市莲池区学苑街与隆兴东路交叉口南150米\',)', '(\'(0312)3363288\',)', '(\'http://www.test.com\',)', '(\'70.0\',)', '(\'6f2d3cf49ea683ca108824e2\',)');
INSERT INTO `mymap_basicinfo` VALUES ('146', '(\'115.58653201249,38.891519090835\',)', '(\'保定艾尚旅馆\',)', '(\'河北省保定市莲池区市保定清苑区保定学院北侧\',)', '(\'13784275644\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'11b478ea6a1e5cfbf942b2f6\',)');
INSERT INTO `mymap_basicinfo` VALUES ('147', '(\'115.57597898886,38.891896101495\',)', '(\'保定智都公寓\',)', '(\'河北省保定市莲池区学苑街河北大学新区工商学院北行100米路东\',)', '(\'13582382098\',)', '(\'http://www.test.com\',)', '(\'55.0\',)', '(\'d39a4ef3f7dab2ba0e3dda34\',)');
INSERT INTO `mymap_basicinfo` VALUES ('148', '(\'115.57830703741,38.886388105172\',)', '(\'保定大学城公寓\',)', '(\'河北省保定市莲池区河大新区东200米(大学城内)\',)', '(\'13784991543\',)', '(\'http://www.test.com\',)', '(\'39.0\',)', '(\'72ce9be04b189ad4853304a7\',)');
INSERT INTO `mymap_basicinfo` VALUES ('149', '(\'115.57889803261,38.881187090312\',)', '(\'保定遇见你精品公寓\',)', '(\'保定莲池区七一路与凤栖街交叉路口未来像素2号楼15层1512\',)', '(\'17183148888\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'96e07ddf3b33faf46018099e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('150', '(\'115.58070398601,38.880896109179\',)', '(\'汉庭酒店(保定七一东路店)\',)', '(\'保定市莲池区七一东路3158号\',)', '(\'(0312)6786077\',)', '(\'http://www.test.com\',)', '(\'170.0\',)', '(\'5f17dac71ed3ac1a04026fbe\',)');
INSERT INTO `mymap_basicinfo` VALUES ('151', '(\'115.5771270233,38.894221096386\',)', '(\'雕刻时光主题宾馆\',)', '(\'河北省保定市莲池区隆兴东路与学苑街交叉口河北大学新校区附近\',)', '(\'(0312)6791010\',)', '(\'http://www.test.com\',)', '(\'61.0\',)', '(\'ed87f70847b062b09ff77954\',)');
INSERT INTO `mymap_basicinfo` VALUES ('152', '(\'115.57578773961,38.894462598839\',)', '(\'艾尚客主题酒店(河大新区保定东站店)\',)', '(\'河北省保定市莲池区百楼乡河北大学工商学院学苑街北头\',)', '(\'(0312)5050555\',)', '(\'http://www.test.com\',)', '(\'54.0\',)', '(\'3a84bcefecf96577c7f50d7b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('153', '(\'115.57924998871,38.880679136462\',)', '(\'保定驿缕阳光主题酒店\',)', '(\'河北省保定市莲池区七一中路未来像素\',)', '(\'15733223335\',)', '(\'http://www.test.com\',)', '(\'68.0\',)', '(\'4417ae25f218ef42a10464e1\',)');
INSERT INTO `mymap_basicinfo` VALUES ('154', '(\'115.57571740229,38.894210214715\',)', '(\'月亮湾宾馆\',)', '(\'河北省保定市莲池区河北大学新校区学苑街与隆兴东路交叉口南行50米\',)', '(\'18633203685\',)', '(\'http://www.test.com\',)', '(\'58.0\',)', '(\'78e4decd9f20c2b7a8175a29\',)');
INSERT INTO `mymap_basicinfo` VALUES ('155', '(\'115.57909745643,38.885532846055\',)', '(\'保定青年公寓\',)', '(\'保定市莲池区河大新校区东200米十七中后面\',)', '(\'13582627164\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'d5d2b3792d200e366cc02ce5\',)');
INSERT INTO `mymap_basicinfo` VALUES ('156', '(\'115.57628899409,38.894003111629\',)', '(\'嘉亿华连锁酒店\',)', '(\'河北省保定市莲池区学苑街与隆兴东路交叉口南150米\',)', '(\'(0312)3363288\',)', '(\'http://www.test.com\',)', '(\'70.0\',)', '(\'6f2d3cf49ea683ca108824e2\',)');
INSERT INTO `mymap_basicinfo` VALUES ('157', '(\'115.58653201249,38.891519090835\',)', '(\'保定艾尚旅馆\',)', '(\'河北省保定市莲池区市保定清苑区保定学院北侧\',)', '(\'13784275644\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'11b478ea6a1e5cfbf942b2f6\',)');
INSERT INTO `mymap_basicinfo` VALUES ('158', '(\'115.57597898886,38.891896101495\',)', '(\'保定智都公寓\',)', '(\'河北省保定市莲池区学苑街河北大学新区工商学院北行100米路东\',)', '(\'13582382098\',)', '(\'http://www.test.com\',)', '(\'55.0\',)', '(\'d39a4ef3f7dab2ba0e3dda34\',)');
INSERT INTO `mymap_basicinfo` VALUES ('159', '(\'115.57830703741,38.886388105172\',)', '(\'保定大学城公寓\',)', '(\'河北省保定市莲池区河大新区东200米(大学城内)\',)', '(\'13784991543\',)', '(\'http://www.test.com\',)', '(\'39.0\',)', '(\'72ce9be04b189ad4853304a7\',)');
INSERT INTO `mymap_basicinfo` VALUES ('160', '(\'115.57889803261,38.881187090312\',)', '(\'保定遇见你精品公寓\',)', '(\'保定莲池区七一路与凤栖街交叉路口未来像素2号楼15层1512\',)', '(\'17183148888\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'96e07ddf3b33faf46018099e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('161', '(\'115.58070398601,38.880896109179\',)', '(\'汉庭酒店(保定七一东路店)\',)', '(\'保定市莲池区七一东路3158号\',)', '(\'(0312)6786077\',)', '(\'http://www.test.com\',)', '(\'170.0\',)', '(\'5f17dac71ed3ac1a04026fbe\',)');
INSERT INTO `mymap_basicinfo` VALUES ('162', '(\'115.57571740229,38.894210214715\',)', '(\'月亮湾宾馆\',)', '(\'河北省保定市莲池区河北大学新校区学苑街与隆兴东路交叉口南行50米\',)', '(\'18633203685\',)', '(\'http://www.test.com\',)', '(\'58.0\',)', '(\'78e4decd9f20c2b7a8175a29\',)');
INSERT INTO `mymap_basicinfo` VALUES ('163', '(\'115.57597898886,38.891896101495\',)', '(\'保定智都公寓\',)', '(\'河北省保定市莲池区学苑街河北大学新区工商学院北行100米路东\',)', '(\'13582382098\',)', '(\'http://www.test.com\',)', '(\'55.0\',)', '(\'d39a4ef3f7dab2ba0e3dda34\',)');
INSERT INTO `mymap_basicinfo` VALUES ('164', '(\'115.57889803261,38.881187090312\',)', '(\'保定遇见你精品公寓\',)', '(\'保定莲池区七一路与凤栖街交叉路口未来像素2号楼15层1512\',)', '(\'17183148888\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'96e07ddf3b33faf46018099e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('165', '(\'115.57881808342,38.886224159663\',)', '(\'保定如家短租公寓\',)', '(\'河北省保定市莲池区学院街大学城小区5号楼66号\',)', '(\'15720100228\',)', '(\'http://www.test.com\',)', '(\'44.0\',)', '(\'b787fc4be7a98c899fec2bd2\',)');
INSERT INTO `mymap_basicinfo` VALUES ('166', '(\'115.57884700886,38.881075093614\',)', '(\'保定初心精品日租自助公寓\',)', '(\'河北省保定市莲池区七一东路未来像素2号公寓楼1620室\',)', '(\'15188767066\',)', '(\'http://www.test.com\',)', '(\'118.0\',)', '(\'92eb258f09e4666db21e36ef\',)');
INSERT INTO `mymap_basicinfo` VALUES ('167', '(\'115.57889704447,38.881057117952\',)', '(\'保定优家青年酒店式公寓\',)', '(\'保定莲池区东金庄乡七一东路未来像素2号楼2606\',)', '(\'15632222522\',)', '(\'http://www.test.com\',)', '(\'118.0\',)', '(\'deb1355c73caa95ec91b9531\',)');
INSERT INTO `mymap_basicinfo` VALUES ('168', '(\'115.57940602438,38.885526105609\',)', '(\'保定e家公寓\',)', '(\'河北省保定市莲池区七一东路大学城小区30号门面\',)', '(\'15176355539\',)', '(\'http://www.test.com\',)', '(\'44.0\',)', '(\'d0b309c1e5c2d602b64f5451\',)');
INSERT INTO `mymap_basicinfo` VALUES ('169', '(\'115.57888698345,38.881055081646\',)', '(\'保定依恋公寓\',)', '(\'河北省保定市莲池区未来像素\',)', '(None,)', '(\'http://www.test.com\',)', '(\'137.0\',)', '(\'72a326a13a1a3e6a8d772703\',)');
INSERT INTO `mymap_basicinfo` VALUES ('170', '(\'115.57893701907,38.886119121998\',)', '(\'保定芳芳公寓\',)', '(\'河北省保定市莲池区河大新区大学城小区5号楼九单元201\',)', '(\'13292900588\',)', '(\'http://www.test.com\',)', '(\'35.0\',)', '(\'bf2b750131938ea0d23ce3df\',)');
INSERT INTO `mymap_basicinfo` VALUES ('171', '(\'115.5771270233,38.894221096386\',)', '(\'雕刻时光主题宾馆\',)', '(\'河北省保定市莲池区隆兴东路与学苑街交叉口河北大学新校区附近\',)', '(\'(0312)6791010\',)', '(\'http://www.test.com\',)', '(\'61.0\',)', '(\'ed87f70847b062b09ff77954\',)');
INSERT INTO `mymap_basicinfo` VALUES ('172', '(\'115.57578773961,38.894462598839\',)', '(\'艾尚客主题酒店(河大新区保定东站店)\',)', '(\'河北省保定市莲池区百楼乡河北大学工商学院学苑街北头\',)', '(\'(0312)5050555\',)', '(\'http://www.test.com\',)', '(\'54.0\',)', '(\'3a84bcefecf96577c7f50d7b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('173', '(\'115.57924998871,38.880679136462\',)', '(\'保定驿缕阳光主题酒店\',)', '(\'河北省保定市莲池区七一中路未来像素\',)', '(\'15733223335\',)', '(\'http://www.test.com\',)', '(\'68.0\',)', '(\'4417ae25f218ef42a10464e1\',)');
INSERT INTO `mymap_basicinfo` VALUES ('174', '(\'115.57628899409,38.894003111629\',)', '(\'嘉亿华连锁酒店\',)', '(\'河北省保定市莲池区学苑街与隆兴东路交叉口南150米\',)', '(\'(0312)3363288\',)', '(\'http://www.test.com\',)', '(\'70.0\',)', '(\'6f2d3cf49ea683ca108824e2\',)');
INSERT INTO `mymap_basicinfo` VALUES ('175', '(\'115.58653201249,38.891519090835\',)', '(\'保定艾尚旅馆\',)', '(\'河北省保定市莲池区市保定清苑区保定学院北侧\',)', '(\'13784275644\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'11b478ea6a1e5cfbf942b2f6\',)');
INSERT INTO `mymap_basicinfo` VALUES ('176', '(\'115.57909745643,38.885532846055\',)', '(\'保定青年公寓\',)', '(\'保定市莲池区河大新校区东200米十七中后面\',)', '(\'13582627164\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'d5d2b3792d200e366cc02ce5\',)');
INSERT INTO `mymap_basicinfo` VALUES ('177', '(\'115.58070398601,38.880896109179\',)', '(\'汉庭酒店(保定七一东路店)\',)', '(\'保定市莲池区七一东路3158号\',)', '(\'(0312)6786077\',)', '(\'http://www.test.com\',)', '(\'170.0\',)', '(\'5f17dac71ed3ac1a04026fbe\',)');
INSERT INTO `mymap_basicinfo` VALUES ('178', '(\'115.5771270233,38.894221096386\',)', '(\'雕刻时光主题宾馆\',)', '(\'河北省保定市莲池区隆兴东路与学苑街交叉口河北大学新校区附近\',)', '(\'(0312)6791010\',)', '(\'http://www.test.com\',)', '(\'61.0\',)', '(\'ed87f70847b062b09ff77954\',)');
INSERT INTO `mymap_basicinfo` VALUES ('179', '(\'115.57578773961,38.894462598839\',)', '(\'艾尚客主题酒店(河大新区保定东站店)\',)', '(\'河北省保定市莲池区百楼乡河北大学工商学院学苑街北头\',)', '(\'(0312)5050555\',)', '(\'http://www.test.com\',)', '(\'54.0\',)', '(\'3a84bcefecf96577c7f50d7b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('180', '(\'115.57924998871,38.880679136462\',)', '(\'保定驿缕阳光主题酒店\',)', '(\'河北省保定市莲池区七一中路未来像素\',)', '(\'15733223335\',)', '(\'http://www.test.com\',)', '(\'68.0\',)', '(\'4417ae25f218ef42a10464e1\',)');
INSERT INTO `mymap_basicinfo` VALUES ('181', '(\'115.57571740229,38.894210214715\',)', '(\'月亮湾宾馆\',)', '(\'河北省保定市莲池区河北大学新校区学苑街与隆兴东路交叉口南行50米\',)', '(\'18633203685\',)', '(\'http://www.test.com\',)', '(\'58.0\',)', '(\'78e4decd9f20c2b7a8175a29\',)');
INSERT INTO `mymap_basicinfo` VALUES ('182', '(\'115.57909745643,38.885532846055\',)', '(\'保定青年公寓\',)', '(\'保定市莲池区河大新校区东200米十七中后面\',)', '(\'13582627164\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'d5d2b3792d200e366cc02ce5\',)');
INSERT INTO `mymap_basicinfo` VALUES ('183', '(\'115.57628899409,38.894003111629\',)', '(\'嘉亿华连锁酒店\',)', '(\'河北省保定市莲池区学苑街与隆兴东路交叉口南150米\',)', '(\'(0312)3363288\',)', '(\'http://www.test.com\',)', '(\'70.0\',)', '(\'6f2d3cf49ea683ca108824e2\',)');
INSERT INTO `mymap_basicinfo` VALUES ('184', '(\'115.58653201249,38.891519090835\',)', '(\'保定艾尚旅馆\',)', '(\'河北省保定市莲池区市保定清苑区保定学院北侧\',)', '(\'13784275644\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'11b478ea6a1e5cfbf942b2f6\',)');
INSERT INTO `mymap_basicinfo` VALUES ('185', '(\'115.57597898886,38.891896101495\',)', '(\'保定智都公寓\',)', '(\'河北省保定市莲池区学苑街河北大学新区工商学院北行100米路东\',)', '(\'13582382098\',)', '(\'http://www.test.com\',)', '(\'55.0\',)', '(\'d39a4ef3f7dab2ba0e3dda34\',)');
INSERT INTO `mymap_basicinfo` VALUES ('186', '(\'115.57830703741,38.886388105172\',)', '(\'保定大学城公寓\',)', '(\'河北省保定市莲池区河大新区东200米(大学城内)\',)', '(\'13784991543\',)', '(\'http://www.test.com\',)', '(\'39.0\',)', '(\'72ce9be04b189ad4853304a7\',)');
INSERT INTO `mymap_basicinfo` VALUES ('187', '(\'115.57889803261,38.881187090312\',)', '(\'保定遇见你精品公寓\',)', '(\'保定莲池区七一路与凤栖街交叉路口未来像素2号楼15层1512\',)', '(\'17183148888\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'96e07ddf3b33faf46018099e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('188', '(\'115.58070398601,38.880896109179\',)', '(\'汉庭酒店(保定七一东路店)\',)', '(\'保定市莲池区七一东路3158号\',)', '(\'(0312)6786077\',)', '(\'http://www.test.com\',)', '(\'170.0\',)', '(\'5f17dac71ed3ac1a04026fbe\',)');
INSERT INTO `mymap_basicinfo` VALUES ('189', '(\'115.5771270233,38.894221096386\',)', '(\'雕刻时光主题宾馆\',)', '(\'河北省保定市莲池区隆兴东路与学苑街交叉口河北大学新校区附近\',)', '(\'(0312)6791010\',)', '(\'http://www.test.com\',)', '(\'61.0\',)', '(\'ed87f70847b062b09ff77954\',)');
INSERT INTO `mymap_basicinfo` VALUES ('190', '(\'115.57578773961,38.894462598839\',)', '(\'艾尚客主题酒店(河大新区保定东站店)\',)', '(\'河北省保定市莲池区百楼乡河北大学工商学院学苑街北头\',)', '(\'(0312)5050555\',)', '(\'http://www.test.com\',)', '(\'54.0\',)', '(\'3a84bcefecf96577c7f50d7b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('191', '(\'115.57924998871,38.880679136462\',)', '(\'保定驿缕阳光主题酒店\',)', '(\'河北省保定市莲池区七一中路未来像素\',)', '(\'15733223335\',)', '(\'http://www.test.com\',)', '(\'68.0\',)', '(\'4417ae25f218ef42a10464e1\',)');
INSERT INTO `mymap_basicinfo` VALUES ('192', '(\'115.57571740229,38.894210214715\',)', '(\'月亮湾宾馆\',)', '(\'河北省保定市莲池区河北大学新校区学苑街与隆兴东路交叉口南行50米\',)', '(\'18633203685\',)', '(\'http://www.test.com\',)', '(\'58.0\',)', '(\'78e4decd9f20c2b7a8175a29\',)');
INSERT INTO `mymap_basicinfo` VALUES ('193', '(\'115.57909745643,38.885532846055\',)', '(\'保定青年公寓\',)', '(\'保定市莲池区河大新校区东200米十七中后面\',)', '(\'13582627164\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'d5d2b3792d200e366cc02ce5\',)');
INSERT INTO `mymap_basicinfo` VALUES ('194', '(\'115.57628899409,38.894003111629\',)', '(\'嘉亿华连锁酒店\',)', '(\'河北省保定市莲池区学苑街与隆兴东路交叉口南150米\',)', '(\'(0312)3363288\',)', '(\'http://www.test.com\',)', '(\'70.0\',)', '(\'6f2d3cf49ea683ca108824e2\',)');
INSERT INTO `mymap_basicinfo` VALUES ('195', '(\'115.58653201249,38.891519090835\',)', '(\'保定艾尚旅馆\',)', '(\'河北省保定市莲池区市保定清苑区保定学院北侧\',)', '(\'13784275644\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'11b478ea6a1e5cfbf942b2f6\',)');
INSERT INTO `mymap_basicinfo` VALUES ('196', '(\'115.57597898886,38.891896101495\',)', '(\'保定智都公寓\',)', '(\'河北省保定市莲池区学苑街河北大学新区工商学院北行100米路东\',)', '(\'13582382098\',)', '(\'http://www.test.com\',)', '(\'55.0\',)', '(\'d39a4ef3f7dab2ba0e3dda34\',)');
INSERT INTO `mymap_basicinfo` VALUES ('197', '(\'115.57830703741,38.886388105172\',)', '(\'保定大学城公寓\',)', '(\'河北省保定市莲池区河大新区东200米(大学城内)\',)', '(\'13784991543\',)', '(\'http://www.test.com\',)', '(\'39.0\',)', '(\'72ce9be04b189ad4853304a7\',)');
INSERT INTO `mymap_basicinfo` VALUES ('198', '(\'115.57889803261,38.881187090312\',)', '(\'保定遇见你精品公寓\',)', '(\'保定莲池区七一路与凤栖街交叉路口未来像素2号楼15层1512\',)', '(\'17183148888\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'96e07ddf3b33faf46018099e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('199', '(\'115.58070398601,38.880896109179\',)', '(\'汉庭酒店(保定七一东路店)\',)', '(\'保定市莲池区七一东路3158号\',)', '(\'(0312)6786077\',)', '(\'http://www.test.com\',)', '(\'170.0\',)', '(\'5f17dac71ed3ac1a04026fbe\',)');
INSERT INTO `mymap_basicinfo` VALUES ('200', '(\'115.5771270233,38.894221096386\',)', '(\'雕刻时光主题宾馆\',)', '(\'河北省保定市莲池区隆兴东路与学苑街交叉口河北大学新校区附近\',)', '(\'(0312)6791010\',)', '(\'http://www.test.com\',)', '(\'61.0\',)', '(\'ed87f70847b062b09ff77954\',)');
INSERT INTO `mymap_basicinfo` VALUES ('201', '(\'115.57578773961,38.894462598839\',)', '(\'艾尚客主题酒店(河大新区保定东站店)\',)', '(\'河北省保定市莲池区百楼乡河北大学工商学院学苑街北头\',)', '(\'(0312)5050555\',)', '(\'http://www.test.com\',)', '(\'54.0\',)', '(\'3a84bcefecf96577c7f50d7b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('202', '(\'115.57924998871,38.880679136462\',)', '(\'保定驿缕阳光主题酒店\',)', '(\'河北省保定市莲池区七一中路未来像素\',)', '(\'15733223335\',)', '(\'http://www.test.com\',)', '(\'68.0\',)', '(\'4417ae25f218ef42a10464e1\',)');
INSERT INTO `mymap_basicinfo` VALUES ('203', '(\'115.57571740229,38.894210214715\',)', '(\'月亮湾宾馆\',)', '(\'河北省保定市莲池区河北大学新校区学苑街与隆兴东路交叉口南行50米\',)', '(\'18633203685\',)', '(\'http://www.test.com\',)', '(\'58.0\',)', '(\'78e4decd9f20c2b7a8175a29\',)');
INSERT INTO `mymap_basicinfo` VALUES ('204', '(\'115.57909745643,38.885532846055\',)', '(\'保定青年公寓\',)', '(\'保定市莲池区河大新校区东200米十七中后面\',)', '(\'13582627164\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'d5d2b3792d200e366cc02ce5\',)');
INSERT INTO `mymap_basicinfo` VALUES ('205', '(\'115.57628899409,38.894003111629\',)', '(\'嘉亿华连锁酒店\',)', '(\'河北省保定市莲池区学苑街与隆兴东路交叉口南150米\',)', '(\'(0312)3363288\',)', '(\'http://www.test.com\',)', '(\'70.0\',)', '(\'6f2d3cf49ea683ca108824e2\',)');
INSERT INTO `mymap_basicinfo` VALUES ('206', '(\'115.58653201249,38.891519090835\',)', '(\'保定艾尚旅馆\',)', '(\'河北省保定市莲池区市保定清苑区保定学院北侧\',)', '(\'13784275644\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'11b478ea6a1e5cfbf942b2f6\',)');
INSERT INTO `mymap_basicinfo` VALUES ('207', '(\'115.57597898886,38.891896101495\',)', '(\'保定智都公寓\',)', '(\'河北省保定市莲池区学苑街河北大学新区工商学院北行100米路东\',)', '(\'13582382098\',)', '(\'http://www.test.com\',)', '(\'55.0\',)', '(\'d39a4ef3f7dab2ba0e3dda34\',)');
INSERT INTO `mymap_basicinfo` VALUES ('208', '(\'115.57830703741,38.886388105172\',)', '(\'保定大学城公寓\',)', '(\'河北省保定市莲池区河大新区东200米(大学城内)\',)', '(\'13784991543\',)', '(\'http://www.test.com\',)', '(\'39.0\',)', '(\'72ce9be04b189ad4853304a7\',)');
INSERT INTO `mymap_basicinfo` VALUES ('209', '(\'115.57889803261,38.881187090312\',)', '(\'保定遇见你精品公寓\',)', '(\'保定莲池区七一路与凤栖街交叉路口未来像素2号楼15层1512\',)', '(\'17183148888\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'96e07ddf3b33faf46018099e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('210', '(\'115.58070398601,38.880896109179\',)', '(\'汉庭酒店(保定七一东路店)\',)', '(\'保定市莲池区七一东路3158号\',)', '(\'(0312)6786077\',)', '(\'http://www.test.com\',)', '(\'170.0\',)', '(\'5f17dac71ed3ac1a04026fbe\',)');
INSERT INTO `mymap_basicinfo` VALUES ('211', '(\'115.5771270233,38.894221096386\',)', '(\'雕刻时光主题宾馆\',)', '(\'河北省保定市莲池区隆兴东路与学苑街交叉口河北大学新校区附近\',)', '(\'(0312)6791010\',)', '(\'http://www.test.com\',)', '(\'61.0\',)', '(\'ed87f70847b062b09ff77954\',)');
INSERT INTO `mymap_basicinfo` VALUES ('212', '(\'115.57578773961,38.894462598839\',)', '(\'艾尚客主题酒店(河大新区保定东站店)\',)', '(\'河北省保定市莲池区百楼乡河北大学工商学院学苑街北头\',)', '(\'(0312)5050555\',)', '(\'http://www.test.com\',)', '(\'54.0\',)', '(\'3a84bcefecf96577c7f50d7b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('213', '(\'115.57924998871,38.880679136462\',)', '(\'保定驿缕阳光主题酒店\',)', '(\'河北省保定市莲池区七一中路未来像素\',)', '(\'15733223335\',)', '(\'http://www.test.com\',)', '(\'68.0\',)', '(\'4417ae25f218ef42a10464e1\',)');
INSERT INTO `mymap_basicinfo` VALUES ('214', '(\'115.57571740229,38.894210214715\',)', '(\'月亮湾宾馆\',)', '(\'河北省保定市莲池区河北大学新校区学苑街与隆兴东路交叉口南行50米\',)', '(\'18633203685\',)', '(\'http://www.test.com\',)', '(\'58.0\',)', '(\'78e4decd9f20c2b7a8175a29\',)');
INSERT INTO `mymap_basicinfo` VALUES ('215', '(\'115.57909745643,38.885532846055\',)', '(\'保定青年公寓\',)', '(\'保定市莲池区河大新校区东200米十七中后面\',)', '(\'13582627164\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'d5d2b3792d200e366cc02ce5\',)');
INSERT INTO `mymap_basicinfo` VALUES ('216', '(\'115.57628899409,38.894003111629\',)', '(\'嘉亿华连锁酒店\',)', '(\'河北省保定市莲池区学苑街与隆兴东路交叉口南150米\',)', '(\'(0312)3363288\',)', '(\'http://www.test.com\',)', '(\'70.0\',)', '(\'6f2d3cf49ea683ca108824e2\',)');
INSERT INTO `mymap_basicinfo` VALUES ('217', '(\'115.58653201249,38.891519090835\',)', '(\'保定艾尚旅馆\',)', '(\'河北省保定市莲池区市保定清苑区保定学院北侧\',)', '(\'13784275644\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'11b478ea6a1e5cfbf942b2f6\',)');
INSERT INTO `mymap_basicinfo` VALUES ('218', '(\'115.57597898886,38.891896101495\',)', '(\'保定智都公寓\',)', '(\'河北省保定市莲池区学苑街河北大学新区工商学院北行100米路东\',)', '(\'13582382098\',)', '(\'http://www.test.com\',)', '(\'55.0\',)', '(\'d39a4ef3f7dab2ba0e3dda34\',)');
INSERT INTO `mymap_basicinfo` VALUES ('219', '(\'115.57830703741,38.886388105172\',)', '(\'保定大学城公寓\',)', '(\'河北省保定市莲池区河大新区东200米(大学城内)\',)', '(\'13784991543\',)', '(\'http://www.test.com\',)', '(\'39.0\',)', '(\'72ce9be04b189ad4853304a7\',)');
INSERT INTO `mymap_basicinfo` VALUES ('220', '(\'115.57889803261,38.881187090312\',)', '(\'保定遇见你精品公寓\',)', '(\'保定莲池区七一路与凤栖街交叉路口未来像素2号楼15层1512\',)', '(\'17183148888\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'96e07ddf3b33faf46018099e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('221', '(\'115.58070398601,38.880896109179\',)', '(\'汉庭酒店(保定七一东路店)\',)', '(\'保定市莲池区七一东路3158号\',)', '(\'(0312)6786077\',)', '(\'http://www.test.com\',)', '(\'170.0\',)', '(\'5f17dac71ed3ac1a04026fbe\',)');
INSERT INTO `mymap_basicinfo` VALUES ('222', '(\'115.5771270233,38.894221096386\',)', '(\'雕刻时光主题宾馆\',)', '(\'河北省保定市莲池区隆兴东路与学苑街交叉口河北大学新校区附近\',)', '(\'(0312)6791010\',)', '(\'http://www.test.com\',)', '(\'61.0\',)', '(\'ed87f70847b062b09ff77954\',)');
INSERT INTO `mymap_basicinfo` VALUES ('223', '(\'115.57578773961,38.894462598839\',)', '(\'艾尚客主题酒店(河大新区保定东站店)\',)', '(\'河北省保定市莲池区百楼乡河北大学工商学院学苑街北头\',)', '(\'(0312)5050555\',)', '(\'http://www.test.com\',)', '(\'54.0\',)', '(\'3a84bcefecf96577c7f50d7b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('224', '(\'115.57924998871,38.880679136462\',)', '(\'保定驿缕阳光主题酒店\',)', '(\'河北省保定市莲池区七一中路未来像素\',)', '(\'15733223335\',)', '(\'http://www.test.com\',)', '(\'68.0\',)', '(\'4417ae25f218ef42a10464e1\',)');
INSERT INTO `mymap_basicinfo` VALUES ('225', '(\'115.57571740229,38.894210214715\',)', '(\'月亮湾宾馆\',)', '(\'河北省保定市莲池区河北大学新校区学苑街与隆兴东路交叉口南行50米\',)', '(\'18633203685\',)', '(\'http://www.test.com\',)', '(\'58.0\',)', '(\'78e4decd9f20c2b7a8175a29\',)');
INSERT INTO `mymap_basicinfo` VALUES ('226', '(\'115.57909745643,38.885532846055\',)', '(\'保定青年公寓\',)', '(\'保定市莲池区河大新校区东200米十七中后面\',)', '(\'13582627164\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'d5d2b3792d200e366cc02ce5\',)');
INSERT INTO `mymap_basicinfo` VALUES ('227', '(\'115.57628899409,38.894003111629\',)', '(\'嘉亿华连锁酒店\',)', '(\'河北省保定市莲池区学苑街与隆兴东路交叉口南150米\',)', '(\'(0312)3363288\',)', '(\'http://www.test.com\',)', '(\'70.0\',)', '(\'6f2d3cf49ea683ca108824e2\',)');
INSERT INTO `mymap_basicinfo` VALUES ('228', '(\'115.58653201249,38.891519090835\',)', '(\'保定艾尚旅馆\',)', '(\'河北省保定市莲池区市保定清苑区保定学院北侧\',)', '(\'13784275644\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'11b478ea6a1e5cfbf942b2f6\',)');
INSERT INTO `mymap_basicinfo` VALUES ('229', '(\'115.57597898886,38.891896101495\',)', '(\'保定智都公寓\',)', '(\'河北省保定市莲池区学苑街河北大学新区工商学院北行100米路东\',)', '(\'13582382098\',)', '(\'http://www.test.com\',)', '(\'55.0\',)', '(\'d39a4ef3f7dab2ba0e3dda34\',)');
INSERT INTO `mymap_basicinfo` VALUES ('230', '(\'115.57830703741,38.886388105172\',)', '(\'保定大学城公寓\',)', '(\'河北省保定市莲池区河大新区东200米(大学城内)\',)', '(\'13784991543\',)', '(\'http://www.test.com\',)', '(\'39.0\',)', '(\'72ce9be04b189ad4853304a7\',)');
INSERT INTO `mymap_basicinfo` VALUES ('231', '(\'115.57889803261,38.881187090312\',)', '(\'保定遇见你精品公寓\',)', '(\'保定莲池区七一路与凤栖街交叉路口未来像素2号楼15层1512\',)', '(\'17183148888\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'96e07ddf3b33faf46018099e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('232', '(\'115.58070398601,38.880896109179\',)', '(\'汉庭酒店(保定七一东路店)\',)', '(\'保定市莲池区七一东路3158号\',)', '(\'(0312)6786077\',)', '(\'http://www.test.com\',)', '(\'170.0\',)', '(\'5f17dac71ed3ac1a04026fbe\',)');
INSERT INTO `mymap_basicinfo` VALUES ('233', '(\'115.5771270233,38.894221096386\',)', '(\'雕刻时光主题宾馆\',)', '(\'河北省保定市莲池区隆兴东路与学苑街交叉口河北大学新校区附近\',)', '(\'(0312)6791010\',)', '(\'http://www.test.com\',)', '(\'61.0\',)', '(\'ed87f70847b062b09ff77954\',)');
INSERT INTO `mymap_basicinfo` VALUES ('234', '(\'115.57578773961,38.894462598839\',)', '(\'艾尚客主题酒店(河大新区保定东站店)\',)', '(\'河北省保定市莲池区百楼乡河北大学工商学院学苑街北头\',)', '(\'(0312)5050555\',)', '(\'http://www.test.com\',)', '(\'54.0\',)', '(\'3a84bcefecf96577c7f50d7b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('235', '(\'115.57924998871,38.880679136462\',)', '(\'保定驿缕阳光主题酒店\',)', '(\'河北省保定市莲池区七一中路未来像素\',)', '(\'15733223335\',)', '(\'http://www.test.com\',)', '(\'68.0\',)', '(\'4417ae25f218ef42a10464e1\',)');
INSERT INTO `mymap_basicinfo` VALUES ('236', '(\'115.57571740229,38.894210214715\',)', '(\'月亮湾宾馆\',)', '(\'河北省保定市莲池区河北大学新校区学苑街与隆兴东路交叉口南行50米\',)', '(\'18633203685\',)', '(\'http://www.test.com\',)', '(\'58.0\',)', '(\'78e4decd9f20c2b7a8175a29\',)');
INSERT INTO `mymap_basicinfo` VALUES ('237', '(\'115.57909745643,38.885532846055\',)', '(\'保定青年公寓\',)', '(\'保定市莲池区河大新校区东200米十七中后面\',)', '(\'13582627164\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'d5d2b3792d200e366cc02ce5\',)');
INSERT INTO `mymap_basicinfo` VALUES ('238', '(\'115.57628899409,38.894003111629\',)', '(\'嘉亿华连锁酒店\',)', '(\'河北省保定市莲池区学苑街与隆兴东路交叉口南150米\',)', '(\'(0312)3363288\',)', '(\'http://www.test.com\',)', '(\'70.0\',)', '(\'6f2d3cf49ea683ca108824e2\',)');
INSERT INTO `mymap_basicinfo` VALUES ('239', '(\'115.58653201249,38.891519090835\',)', '(\'保定艾尚旅馆\',)', '(\'河北省保定市莲池区市保定清苑区保定学院北侧\',)', '(\'13784275644\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'11b478ea6a1e5cfbf942b2f6\',)');
INSERT INTO `mymap_basicinfo` VALUES ('240', '(\'115.57597898886,38.891896101495\',)', '(\'保定智都公寓\',)', '(\'河北省保定市莲池区学苑街河北大学新区工商学院北行100米路东\',)', '(\'13582382098\',)', '(\'http://www.test.com\',)', '(\'55.0\',)', '(\'d39a4ef3f7dab2ba0e3dda34\',)');
INSERT INTO `mymap_basicinfo` VALUES ('241', '(\'115.57830703741,38.886388105172\',)', '(\'保定大学城公寓\',)', '(\'河北省保定市莲池区河大新区东200米(大学城内)\',)', '(\'13784991543\',)', '(\'http://www.test.com\',)', '(\'39.0\',)', '(\'72ce9be04b189ad4853304a7\',)');
INSERT INTO `mymap_basicinfo` VALUES ('242', '(\'115.57889803261,38.881187090312\',)', '(\'保定遇见你精品公寓\',)', '(\'保定莲池区七一路与凤栖街交叉路口未来像素2号楼15层1512\',)', '(\'17183148888\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'96e07ddf3b33faf46018099e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('243', '(\'115.58070398601,38.880896109179\',)', '(\'汉庭酒店(保定七一东路店)\',)', '(\'保定市莲池区七一东路3158号\',)', '(\'(0312)6786077\',)', '(\'http://www.test.com\',)', '(\'170.0\',)', '(\'5f17dac71ed3ac1a04026fbe\',)');
INSERT INTO `mymap_basicinfo` VALUES ('244', '(\'115.5771270233,38.894221096386\',)', '(\'雕刻时光主题宾馆\',)', '(\'河北省保定市莲池区隆兴东路与学苑街交叉口河北大学新校区附近\',)', '(\'(0312)6791010\',)', '(\'http://www.test.com\',)', '(\'61.0\',)', '(\'ed87f70847b062b09ff77954\',)');
INSERT INTO `mymap_basicinfo` VALUES ('245', '(\'115.57578773961,38.894462598839\',)', '(\'艾尚客主题酒店(河大新区保定东站店)\',)', '(\'河北省保定市莲池区百楼乡河北大学工商学院学苑街北头\',)', '(\'(0312)5050555\',)', '(\'http://www.test.com\',)', '(\'54.0\',)', '(\'3a84bcefecf96577c7f50d7b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('246', '(\'115.57924998871,38.880679136462\',)', '(\'保定驿缕阳光主题酒店\',)', '(\'河北省保定市莲池区七一中路未来像素\',)', '(\'15733223335\',)', '(\'http://www.test.com\',)', '(\'68.0\',)', '(\'4417ae25f218ef42a10464e1\',)');
INSERT INTO `mymap_basicinfo` VALUES ('247', '(\'115.57571740229,38.894210214715\',)', '(\'月亮湾宾馆\',)', '(\'河北省保定市莲池区河北大学新校区学苑街与隆兴东路交叉口南行50米\',)', '(\'18633203685\',)', '(\'http://www.test.com\',)', '(\'58.0\',)', '(\'78e4decd9f20c2b7a8175a29\',)');
INSERT INTO `mymap_basicinfo` VALUES ('248', '(\'115.57909745643,38.885532846055\',)', '(\'保定青年公寓\',)', '(\'保定市莲池区河大新校区东200米十七中后面\',)', '(\'13582627164\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'d5d2b3792d200e366cc02ce5\',)');
INSERT INTO `mymap_basicinfo` VALUES ('249', '(\'115.57628899409,38.894003111629\',)', '(\'嘉亿华连锁酒店\',)', '(\'河北省保定市莲池区学苑街与隆兴东路交叉口南150米\',)', '(\'(0312)3363288\',)', '(\'http://www.test.com\',)', '(\'70.0\',)', '(\'6f2d3cf49ea683ca108824e2\',)');
INSERT INTO `mymap_basicinfo` VALUES ('250', '(\'115.58653201249,38.891519090835\',)', '(\'保定艾尚旅馆\',)', '(\'河北省保定市莲池区市保定清苑区保定学院北侧\',)', '(\'13784275644\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'11b478ea6a1e5cfbf942b2f6\',)');
INSERT INTO `mymap_basicinfo` VALUES ('251', '(\'115.57597898886,38.891896101495\',)', '(\'保定智都公寓\',)', '(\'河北省保定市莲池区学苑街河北大学新区工商学院北行100米路东\',)', '(\'13582382098\',)', '(\'http://www.test.com\',)', '(\'55.0\',)', '(\'d39a4ef3f7dab2ba0e3dda34\',)');
INSERT INTO `mymap_basicinfo` VALUES ('252', '(\'115.57830703741,38.886388105172\',)', '(\'保定大学城公寓\',)', '(\'河北省保定市莲池区河大新区东200米(大学城内)\',)', '(\'13784991543\',)', '(\'http://www.test.com\',)', '(\'39.0\',)', '(\'72ce9be04b189ad4853304a7\',)');
INSERT INTO `mymap_basicinfo` VALUES ('253', '(\'115.57889803261,38.881187090312\',)', '(\'保定遇见你精品公寓\',)', '(\'保定莲池区七一路与凤栖街交叉路口未来像素2号楼15层1512\',)', '(\'17183148888\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'96e07ddf3b33faf46018099e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('254', '(\'115.58070398601,38.880896109179\',)', '(\'汉庭酒店(保定七一东路店)\',)', '(\'保定市莲池区七一东路3158号\',)', '(\'(0312)6786077\',)', '(\'http://www.test.com\',)', '(\'170.0\',)', '(\'5f17dac71ed3ac1a04026fbe\',)');
INSERT INTO `mymap_basicinfo` VALUES ('255', '(\'115.5771270233,38.894221096386\',)', '(\'雕刻时光主题宾馆\',)', '(\'河北省保定市莲池区隆兴东路与学苑街交叉口河北大学新校区附近\',)', '(\'(0312)6791010\',)', '(\'http://www.test.com\',)', '(\'61.0\',)', '(\'ed87f70847b062b09ff77954\',)');
INSERT INTO `mymap_basicinfo` VALUES ('256', '(\'115.57578773961,38.894462598839\',)', '(\'艾尚客主题酒店(河大新区保定东站店)\',)', '(\'河北省保定市莲池区百楼乡河北大学工商学院学苑街北头\',)', '(\'(0312)5050555\',)', '(\'http://www.test.com\',)', '(\'54.0\',)', '(\'3a84bcefecf96577c7f50d7b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('257', '(\'115.57924998871,38.880679136462\',)', '(\'保定驿缕阳光主题酒店\',)', '(\'河北省保定市莲池区七一中路未来像素\',)', '(\'15733223335\',)', '(\'http://www.test.com\',)', '(\'68.0\',)', '(\'4417ae25f218ef42a10464e1\',)');
INSERT INTO `mymap_basicinfo` VALUES ('258', '(\'115.57571740229,38.894210214715\',)', '(\'月亮湾宾馆\',)', '(\'河北省保定市莲池区河北大学新校区学苑街与隆兴东路交叉口南行50米\',)', '(\'18633203685\',)', '(\'http://www.test.com\',)', '(\'58.0\',)', '(\'78e4decd9f20c2b7a8175a29\',)');
INSERT INTO `mymap_basicinfo` VALUES ('259', '(\'115.57909745643,38.885532846055\',)', '(\'保定青年公寓\',)', '(\'保定市莲池区河大新校区东200米十七中后面\',)', '(\'13582627164\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'d5d2b3792d200e366cc02ce5\',)');
INSERT INTO `mymap_basicinfo` VALUES ('260', '(\'115.57628899409,38.894003111629\',)', '(\'嘉亿华连锁酒店\',)', '(\'河北省保定市莲池区学苑街与隆兴东路交叉口南150米\',)', '(\'(0312)3363288\',)', '(\'http://www.test.com\',)', '(\'70.0\',)', '(\'6f2d3cf49ea683ca108824e2\',)');
INSERT INTO `mymap_basicinfo` VALUES ('261', '(\'115.58653201249,38.891519090835\',)', '(\'保定艾尚旅馆\',)', '(\'河北省保定市莲池区市保定清苑区保定学院北侧\',)', '(\'13784275644\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'11b478ea6a1e5cfbf942b2f6\',)');
INSERT INTO `mymap_basicinfo` VALUES ('262', '(\'115.57597898886,38.891896101495\',)', '(\'保定智都公寓\',)', '(\'河北省保定市莲池区学苑街河北大学新区工商学院北行100米路东\',)', '(\'13582382098\',)', '(\'http://www.test.com\',)', '(\'55.0\',)', '(\'d39a4ef3f7dab2ba0e3dda34\',)');
INSERT INTO `mymap_basicinfo` VALUES ('263', '(\'115.57830703741,38.886388105172\',)', '(\'保定大学城公寓\',)', '(\'河北省保定市莲池区河大新区东200米(大学城内)\',)', '(\'13784991543\',)', '(\'http://www.test.com\',)', '(\'39.0\',)', '(\'72ce9be04b189ad4853304a7\',)');
INSERT INTO `mymap_basicinfo` VALUES ('264', '(\'115.57889803261,38.881187090312\',)', '(\'保定遇见你精品公寓\',)', '(\'保定莲池区七一路与凤栖街交叉路口未来像素2号楼15层1512\',)', '(\'17183148888\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'96e07ddf3b33faf46018099e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('265', '(\'115.58070398601,38.880896109179\',)', '(\'汉庭酒店(保定七一东路店)\',)', '(\'保定市莲池区七一东路3158号\',)', '(\'(0312)6786077\',)', '(\'http://www.test.com\',)', '(\'170.0\',)', '(\'5f17dac71ed3ac1a04026fbe\',)');
INSERT INTO `mymap_basicinfo` VALUES ('266', '(\'115.5771270233,38.894221096386\',)', '(\'雕刻时光主题宾馆\',)', '(\'河北省保定市莲池区隆兴东路与学苑街交叉口河北大学新校区附近\',)', '(\'(0312)6791010\',)', '(\'http://www.test.com\',)', '(\'61.0\',)', '(\'ed87f70847b062b09ff77954\',)');
INSERT INTO `mymap_basicinfo` VALUES ('267', '(\'115.57578773961,38.894462598839\',)', '(\'艾尚客主题酒店(河大新区保定东站店)\',)', '(\'河北省保定市莲池区百楼乡河北大学工商学院学苑街北头\',)', '(\'(0312)5050555\',)', '(\'http://www.test.com\',)', '(\'54.0\',)', '(\'3a84bcefecf96577c7f50d7b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('268', '(\'115.57924998871,38.880679136462\',)', '(\'保定驿缕阳光主题酒店\',)', '(\'河北省保定市莲池区七一中路未来像素\',)', '(\'15733223335\',)', '(\'http://www.test.com\',)', '(\'68.0\',)', '(\'4417ae25f218ef42a10464e1\',)');
INSERT INTO `mymap_basicinfo` VALUES ('269', '(\'115.57571740229,38.894210214715\',)', '(\'月亮湾宾馆\',)', '(\'河北省保定市莲池区河北大学新校区学苑街与隆兴东路交叉口南行50米\',)', '(\'18633203685\',)', '(\'http://www.test.com\',)', '(\'58.0\',)', '(\'78e4decd9f20c2b7a8175a29\',)');
INSERT INTO `mymap_basicinfo` VALUES ('270', '(\'115.57909745643,38.885532846055\',)', '(\'保定青年公寓\',)', '(\'保定市莲池区河大新校区东200米十七中后面\',)', '(\'13582627164\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'d5d2b3792d200e366cc02ce5\',)');
INSERT INTO `mymap_basicinfo` VALUES ('271', '(\'115.57628899409,38.894003111629\',)', '(\'嘉亿华连锁酒店\',)', '(\'河北省保定市莲池区学苑街与隆兴东路交叉口南150米\',)', '(\'(0312)3363288\',)', '(\'http://www.test.com\',)', '(\'70.0\',)', '(\'6f2d3cf49ea683ca108824e2\',)');
INSERT INTO `mymap_basicinfo` VALUES ('272', '(\'115.58653201249,38.891519090835\',)', '(\'保定艾尚旅馆\',)', '(\'河北省保定市莲池区市保定清苑区保定学院北侧\',)', '(\'13784275644\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'11b478ea6a1e5cfbf942b2f6\',)');
INSERT INTO `mymap_basicinfo` VALUES ('273', '(\'115.57597898886,38.891896101495\',)', '(\'保定智都公寓\',)', '(\'河北省保定市莲池区学苑街河北大学新区工商学院北行100米路东\',)', '(\'13582382098\',)', '(\'http://www.test.com\',)', '(\'55.0\',)', '(\'d39a4ef3f7dab2ba0e3dda34\',)');
INSERT INTO `mymap_basicinfo` VALUES ('274', '(\'115.57830703741,38.886388105172\',)', '(\'保定大学城公寓\',)', '(\'河北省保定市莲池区河大新区东200米(大学城内)\',)', '(\'13784991543\',)', '(\'http://www.test.com\',)', '(\'39.0\',)', '(\'72ce9be04b189ad4853304a7\',)');
INSERT INTO `mymap_basicinfo` VALUES ('275', '(\'115.57889803261,38.881187090312\',)', '(\'保定遇见你精品公寓\',)', '(\'保定莲池区七一路与凤栖街交叉路口未来像素2号楼15层1512\',)', '(\'17183148888\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'96e07ddf3b33faf46018099e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('276', '(\'115.58070398601,38.880896109179\',)', '(\'汉庭酒店(保定七一东路店)\',)', '(\'保定市莲池区七一东路3158号\',)', '(\'(0312)6786077\',)', '(\'http://www.test.com\',)', '(\'170.0\',)', '(\'5f17dac71ed3ac1a04026fbe\',)');
INSERT INTO `mymap_basicinfo` VALUES ('277', '(\'115.5771270233,38.894221096386\',)', '(\'雕刻时光主题宾馆\',)', '(\'河北省保定市莲池区隆兴东路与学苑街交叉口河北大学新校区附近\',)', '(\'(0312)6791010\',)', '(\'http://www.test.com\',)', '(\'61.0\',)', '(\'ed87f70847b062b09ff77954\',)');
INSERT INTO `mymap_basicinfo` VALUES ('278', '(\'115.57578773961,38.894462598839\',)', '(\'艾尚客主题酒店(河大新区保定东站店)\',)', '(\'河北省保定市莲池区百楼乡河北大学工商学院学苑街北头\',)', '(\'(0312)5050555\',)', '(\'http://www.test.com\',)', '(\'54.0\',)', '(\'3a84bcefecf96577c7f50d7b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('279', '(\'115.57924998871,38.880679136462\',)', '(\'保定驿缕阳光主题酒店\',)', '(\'河北省保定市莲池区七一中路未来像素\',)', '(\'15733223335\',)', '(\'http://www.test.com\',)', '(\'68.0\',)', '(\'4417ae25f218ef42a10464e1\',)');
INSERT INTO `mymap_basicinfo` VALUES ('280', '(\'115.57571740229,38.894210214715\',)', '(\'月亮湾宾馆\',)', '(\'河北省保定市莲池区河北大学新校区学苑街与隆兴东路交叉口南行50米\',)', '(\'18633203685\',)', '(\'http://www.test.com\',)', '(\'58.0\',)', '(\'78e4decd9f20c2b7a8175a29\',)');
INSERT INTO `mymap_basicinfo` VALUES ('281', '(\'115.57909745643,38.885532846055\',)', '(\'保定青年公寓\',)', '(\'保定市莲池区河大新校区东200米十七中后面\',)', '(\'13582627164\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'d5d2b3792d200e366cc02ce5\',)');
INSERT INTO `mymap_basicinfo` VALUES ('282', '(\'115.57628899409,38.894003111629\',)', '(\'嘉亿华连锁酒店\',)', '(\'河北省保定市莲池区学苑街与隆兴东路交叉口南150米\',)', '(\'(0312)3363288\',)', '(\'http://www.test.com\',)', '(\'70.0\',)', '(\'6f2d3cf49ea683ca108824e2\',)');
INSERT INTO `mymap_basicinfo` VALUES ('283', '(\'115.58653201249,38.891519090835\',)', '(\'保定艾尚旅馆\',)', '(\'河北省保定市莲池区市保定清苑区保定学院北侧\',)', '(\'13784275644\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'11b478ea6a1e5cfbf942b2f6\',)');
INSERT INTO `mymap_basicinfo` VALUES ('284', '(\'115.57597898886,38.891896101495\',)', '(\'保定智都公寓\',)', '(\'河北省保定市莲池区学苑街河北大学新区工商学院北行100米路东\',)', '(\'13582382098\',)', '(\'http://www.test.com\',)', '(\'55.0\',)', '(\'d39a4ef3f7dab2ba0e3dda34\',)');
INSERT INTO `mymap_basicinfo` VALUES ('285', '(\'115.57830703741,38.886388105172\',)', '(\'保定大学城公寓\',)', '(\'河北省保定市莲池区河大新区东200米(大学城内)\',)', '(\'13784991543\',)', '(\'http://www.test.com\',)', '(\'39.0\',)', '(\'72ce9be04b189ad4853304a7\',)');
INSERT INTO `mymap_basicinfo` VALUES ('286', '(\'115.57889803261,38.881187090312\',)', '(\'保定遇见你精品公寓\',)', '(\'保定莲池区七一路与凤栖街交叉路口未来像素2号楼15层1512\',)', '(\'17183148888\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'96e07ddf3b33faf46018099e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('287', '(\'115.58070398601,38.880896109179\',)', '(\'汉庭酒店(保定七一东路店)\',)', '(\'保定市莲池区七一东路3158号\',)', '(\'(0312)6786077\',)', '(\'http://www.test.com\',)', '(\'170.0\',)', '(\'5f17dac71ed3ac1a04026fbe\',)');
INSERT INTO `mymap_basicinfo` VALUES ('288', '(\'115.5771270233,38.894221096386\',)', '(\'雕刻时光主题宾馆\',)', '(\'河北省保定市莲池区隆兴东路与学苑街交叉口河北大学新校区附近\',)', '(\'(0312)6791010\',)', '(\'http://www.test.com\',)', '(\'61.0\',)', '(\'ed87f70847b062b09ff77954\',)');
INSERT INTO `mymap_basicinfo` VALUES ('289', '(\'115.57578773961,38.894462598839\',)', '(\'艾尚客主题酒店(河大新区保定东站店)\',)', '(\'河北省保定市莲池区百楼乡河北大学工商学院学苑街北头\',)', '(\'(0312)5050555\',)', '(\'http://www.test.com\',)', '(\'54.0\',)', '(\'3a84bcefecf96577c7f50d7b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('290', '(\'115.57924998871,38.880679136462\',)', '(\'保定驿缕阳光主题酒店\',)', '(\'河北省保定市莲池区七一中路未来像素\',)', '(\'15733223335\',)', '(\'http://www.test.com\',)', '(\'68.0\',)', '(\'4417ae25f218ef42a10464e1\',)');
INSERT INTO `mymap_basicinfo` VALUES ('291', '(\'115.57571740229,38.894210214715\',)', '(\'月亮湾宾馆\',)', '(\'河北省保定市莲池区河北大学新校区学苑街与隆兴东路交叉口南行50米\',)', '(\'18633203685\',)', '(\'http://www.test.com\',)', '(\'58.0\',)', '(\'78e4decd9f20c2b7a8175a29\',)');
INSERT INTO `mymap_basicinfo` VALUES ('292', '(\'115.57909745643,38.885532846055\',)', '(\'保定青年公寓\',)', '(\'保定市莲池区河大新校区东200米十七中后面\',)', '(\'13582627164\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'d5d2b3792d200e366cc02ce5\',)');
INSERT INTO `mymap_basicinfo` VALUES ('293', '(\'115.57628899409,38.894003111629\',)', '(\'嘉亿华连锁酒店\',)', '(\'河北省保定市莲池区学苑街与隆兴东路交叉口南150米\',)', '(\'(0312)3363288\',)', '(\'http://www.test.com\',)', '(\'70.0\',)', '(\'6f2d3cf49ea683ca108824e2\',)');
INSERT INTO `mymap_basicinfo` VALUES ('294', '(\'115.58653201249,38.891519090835\',)', '(\'保定艾尚旅馆\',)', '(\'河北省保定市莲池区市保定清苑区保定学院北侧\',)', '(\'13784275644\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'11b478ea6a1e5cfbf942b2f6\',)');
INSERT INTO `mymap_basicinfo` VALUES ('295', '(\'115.57597898886,38.891896101495\',)', '(\'保定智都公寓\',)', '(\'河北省保定市莲池区学苑街河北大学新区工商学院北行100米路东\',)', '(\'13582382098\',)', '(\'http://www.test.com\',)', '(\'55.0\',)', '(\'d39a4ef3f7dab2ba0e3dda34\',)');
INSERT INTO `mymap_basicinfo` VALUES ('296', '(\'115.57830703741,38.886388105172\',)', '(\'保定大学城公寓\',)', '(\'河北省保定市莲池区河大新区东200米(大学城内)\',)', '(\'13784991543\',)', '(\'http://www.test.com\',)', '(\'39.0\',)', '(\'72ce9be04b189ad4853304a7\',)');
INSERT INTO `mymap_basicinfo` VALUES ('297', '(\'115.57889803261,38.881187090312\',)', '(\'保定遇见你精品公寓\',)', '(\'保定莲池区七一路与凤栖街交叉路口未来像素2号楼15层1512\',)', '(\'17183148888\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'96e07ddf3b33faf46018099e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('298', '(\'115.58070398601,38.880896109179\',)', '(\'汉庭酒店(保定七一东路店)\',)', '(\'保定市莲池区七一东路3158号\',)', '(\'(0312)6786077\',)', '(\'http://www.test.com\',)', '(\'170.0\',)', '(\'5f17dac71ed3ac1a04026fbe\',)');
INSERT INTO `mymap_basicinfo` VALUES ('299', '(\'115.5771270233,38.894221096386\',)', '(\'雕刻时光主题宾馆\',)', '(\'河北省保定市莲池区隆兴东路与学苑街交叉口河北大学新校区附近\',)', '(\'(0312)6791010\',)', '(\'http://www.test.com\',)', '(\'61.0\',)', '(\'ed87f70847b062b09ff77954\',)');
INSERT INTO `mymap_basicinfo` VALUES ('300', '(\'115.57578773961,38.894462598839\',)', '(\'艾尚客主题酒店(河大新区保定东站店)\',)', '(\'河北省保定市莲池区百楼乡河北大学工商学院学苑街北头\',)', '(\'(0312)5050555\',)', '(\'http://www.test.com\',)', '(\'54.0\',)', '(\'3a84bcefecf96577c7f50d7b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('301', '(\'115.57924998871,38.880679136462\',)', '(\'保定驿缕阳光主题酒店\',)', '(\'河北省保定市莲池区七一中路未来像素\',)', '(\'15733223335\',)', '(\'http://www.test.com\',)', '(\'68.0\',)', '(\'4417ae25f218ef42a10464e1\',)');
INSERT INTO `mymap_basicinfo` VALUES ('302', '(\'115.57571740229,38.894210214715\',)', '(\'月亮湾宾馆\',)', '(\'河北省保定市莲池区河北大学新校区学苑街与隆兴东路交叉口南行50米\',)', '(\'18633203685\',)', '(\'http://www.test.com\',)', '(\'58.0\',)', '(\'78e4decd9f20c2b7a8175a29\',)');
INSERT INTO `mymap_basicinfo` VALUES ('303', '(\'115.57909745643,38.885532846055\',)', '(\'保定青年公寓\',)', '(\'保定市莲池区河大新校区东200米十七中后面\',)', '(\'13582627164\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'d5d2b3792d200e366cc02ce5\',)');
INSERT INTO `mymap_basicinfo` VALUES ('304', '(\'115.57628899409,38.894003111629\',)', '(\'嘉亿华连锁酒店\',)', '(\'河北省保定市莲池区学苑街与隆兴东路交叉口南150米\',)', '(\'(0312)3363288\',)', '(\'http://www.test.com\',)', '(\'70.0\',)', '(\'6f2d3cf49ea683ca108824e2\',)');
INSERT INTO `mymap_basicinfo` VALUES ('305', '(\'115.58653201249,38.891519090835\',)', '(\'保定艾尚旅馆\',)', '(\'河北省保定市莲池区市保定清苑区保定学院北侧\',)', '(\'13784275644\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'11b478ea6a1e5cfbf942b2f6\',)');
INSERT INTO `mymap_basicinfo` VALUES ('306', '(\'115.57597898886,38.891896101495\',)', '(\'保定智都公寓\',)', '(\'河北省保定市莲池区学苑街河北大学新区工商学院北行100米路东\',)', '(\'13582382098\',)', '(\'http://www.test.com\',)', '(\'55.0\',)', '(\'d39a4ef3f7dab2ba0e3dda34\',)');
INSERT INTO `mymap_basicinfo` VALUES ('307', '(\'115.57830703741,38.886388105172\',)', '(\'保定大学城公寓\',)', '(\'河北省保定市莲池区河大新区东200米(大学城内)\',)', '(\'13784991543\',)', '(\'http://www.test.com\',)', '(\'39.0\',)', '(\'72ce9be04b189ad4853304a7\',)');
INSERT INTO `mymap_basicinfo` VALUES ('308', '(\'115.57889803261,38.881187090312\',)', '(\'保定遇见你精品公寓\',)', '(\'保定莲池区七一路与凤栖街交叉路口未来像素2号楼15层1512\',)', '(\'17183148888\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'96e07ddf3b33faf46018099e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('309', '(\'115.58070398601,38.880896109179\',)', '(\'汉庭酒店(保定七一东路店)\',)', '(\'保定市莲池区七一东路3158号\',)', '(\'(0312)6786077\',)', '(\'http://www.test.com\',)', '(\'170.0\',)', '(\'5f17dac71ed3ac1a04026fbe\',)');
INSERT INTO `mymap_basicinfo` VALUES ('310', '(\'115.57571740229,38.894210214715\',)', '(\'月亮湾宾馆\',)', '(\'河北省保定市莲池区河北大学新校区学苑街与隆兴东路交叉口南行50米\',)', '(\'18633203685\',)', '(\'http://www.test.com\',)', '(\'58.0\',)', '(\'78e4decd9f20c2b7a8175a29\',)');
INSERT INTO `mymap_basicinfo` VALUES ('311', '(\'115.57597898886,38.891896101495\',)', '(\'保定智都公寓\',)', '(\'河北省保定市莲池区学苑街河北大学新区工商学院北行100米路东\',)', '(\'13582382098\',)', '(\'http://www.test.com\',)', '(\'55.0\',)', '(\'d39a4ef3f7dab2ba0e3dda34\',)');
INSERT INTO `mymap_basicinfo` VALUES ('312', '(\'115.57889803261,38.881187090312\',)', '(\'保定遇见你精品公寓\',)', '(\'保定莲池区七一路与凤栖街交叉路口未来像素2号楼15层1512\',)', '(\'17183148888\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'96e07ddf3b33faf46018099e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('313', '(\'115.57881808342,38.886224159663\',)', '(\'保定如家短租公寓\',)', '(\'河北省保定市莲池区学院街大学城小区5号楼66号\',)', '(\'15720100228\',)', '(\'http://www.test.com\',)', '(\'44.0\',)', '(\'b787fc4be7a98c899fec2bd2\',)');
INSERT INTO `mymap_basicinfo` VALUES ('314', '(\'115.57884700886,38.881075093614\',)', '(\'保定初心精品日租自助公寓\',)', '(\'河北省保定市莲池区七一东路未来像素2号公寓楼1620室\',)', '(\'15188767066\',)', '(\'http://www.test.com\',)', '(\'118.0\',)', '(\'92eb258f09e4666db21e36ef\',)');
INSERT INTO `mymap_basicinfo` VALUES ('315', '(\'115.57884404445,38.881070108177\',)', '(\'若意公寓\',)', '(\'未来像素2号楼1218室\',)', '(\'13333227663\',)', '(\'http://www.test.com\',)', '(\'59.0\',)', '(\'40ec1428b2afc187430245f2\',)');
INSERT INTO `mymap_basicinfo` VALUES ('316', '(\'115.57889704447,38.881057117952\',)', '(\'保定优家青年酒店式公寓\',)', '(\'保定莲池区东金庄乡七一东路未来像素2号楼2606\',)', '(\'15632222522\',)', '(\'http://www.test.com\',)', '(\'118.0\',)', '(\'deb1355c73caa95ec91b9531\',)');
INSERT INTO `mymap_basicinfo` VALUES ('317', '(\'115.57880703426,38.88105908404\',)', '(\'保定苹果日租公寓\',)', '(\'河北省保定市莲池区七一东路与凤栖街交汇处未来像素2号楼一单元1212房间\',)', '(\'18830230922\',)', '(\'http://www.test.com\',)', '(\'60.0\',)', '(\'06e9a13fdacfbd0509b93a0b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('318', '(\'115.57888698345,38.881055081646\',)', '(\'保定依恋公寓\',)', '(\'河北省保定市莲池区未来像素\',)', '(None,)', '(\'http://www.test.com\',)', '(\'137.0\',)', '(\'72a326a13a1a3e6a8d772703\',)');
INSERT INTO `mymap_basicinfo` VALUES ('319', '(\'115.5771270233,38.894221096386\',)', '(\'雕刻时光主题宾馆\',)', '(\'河北省保定市莲池区隆兴东路与学苑街交叉口河北大学新校区附近\',)', '(\'(0312)6791010\',)', '(\'http://www.test.com\',)', '(\'61.0\',)', '(\'ed87f70847b062b09ff77954\',)');
INSERT INTO `mymap_basicinfo` VALUES ('320', '(\'115.57578773961,38.894462598839\',)', '(\'艾尚客主题酒店(河大新区保定东站店)\',)', '(\'河北省保定市莲池区百楼乡河北大学工商学院学苑街北头\',)', '(\'(0312)5050555\',)', '(\'http://www.test.com\',)', '(\'54.0\',)', '(\'3a84bcefecf96577c7f50d7b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('321', '(\'115.57924998871,38.880679136462\',)', '(\'保定驿缕阳光主题酒店\',)', '(\'河北省保定市莲池区七一中路未来像素\',)', '(\'15733223335\',)', '(\'http://www.test.com\',)', '(\'68.0\',)', '(\'4417ae25f218ef42a10464e1\',)');
INSERT INTO `mymap_basicinfo` VALUES ('322', '(\'115.57628899409,38.894003111629\',)', '(\'嘉亿华连锁酒店\',)', '(\'河北省保定市莲池区学苑街与隆兴东路交叉口南150米\',)', '(\'(0312)3363288\',)', '(\'http://www.test.com\',)', '(\'70.0\',)', '(\'6f2d3cf49ea683ca108824e2\',)');
INSERT INTO `mymap_basicinfo` VALUES ('323', '(\'115.58653201249,38.891519090835\',)', '(\'保定艾尚旅馆\',)', '(\'河北省保定市莲池区市保定清苑区保定学院北侧\',)', '(\'13784275644\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'11b478ea6a1e5cfbf942b2f6\',)');
INSERT INTO `mymap_basicinfo` VALUES ('324', '(\'115.57909745643,38.885532846055\',)', '(\'保定青年公寓\',)', '(\'保定市莲池区河大新校区东200米十七中后面\',)', '(\'13582627164\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'d5d2b3792d200e366cc02ce5\',)');
INSERT INTO `mymap_basicinfo` VALUES ('325', '(\'115.58653201249,38.891519090835\',)', '(\'保定艾尚旅馆\',)', '(\'河北省保定市莲池区市保定清苑区保定学院北侧\',)', '(\'13784275644\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'11b478ea6a1e5cfbf942b2f6\',)');
INSERT INTO `mymap_basicinfo` VALUES ('326', '(\'115.58653201249,38.891519090835\',)', '(\'保定艾尚旅馆\',)', '(\'河北省保定市莲池区市保定清苑区保定学院北侧\',)', '(\'13784275644\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'11b478ea6a1e5cfbf942b2f6\',)');
INSERT INTO `mymap_basicinfo` VALUES ('327', '(\'115.57597898886,38.891896101495\',)', '(\'保定智都公寓\',)', '(\'河北省保定市莲池区学苑街河北大学新区工商学院北行100米路东\',)', '(\'13582382098\',)', '(\'http://www.test.com\',)', '(\'55.0\',)', '(\'d39a4ef3f7dab2ba0e3dda34\',)');
INSERT INTO `mymap_basicinfo` VALUES ('328', '(\'115.57881808342,38.886224159663\',)', '(\'保定如家短租公寓\',)', '(\'河北省保定市莲池区学院街大学城小区5号楼66号\',)', '(\'15720100228\',)', '(\'http://www.test.com\',)', '(\'44.0\',)', '(\'b787fc4be7a98c899fec2bd2\',)');
INSERT INTO `mymap_basicinfo` VALUES ('329', '(\'104.0687361603,37.198755196313\',)', '(\'景电宾馆\',)', '(\'甘肃省白银市景泰县昌林路与寿鹿街交叉口向东50米\',)', '(\'(0943)5592999\',)', '(\'http://www.test.com\',)', '(\'99.0\',)', '(\'6113ef77acb470148e772725\',)');
INSERT INTO `mymap_basicinfo` VALUES ('330', '(\'104.08269699572,37.199343969936\',)', '(\'栋盛国际酒店\',)', '(\'甘肃省白银市景泰县寿鹿街与东环路交汇处西北\',)', '(\'(0943)5994888\',)', '(\'http://www.test.com\',)', '(\'188.0\',)', '(\'9ebb06bced84f52694ec84bf\',)');
INSERT INTO `mymap_basicinfo` VALUES ('331', '(\'104.08256009396,37.193857984041\',)', '(\'万豪酒店\',)', '(\'甘肃省白银市景泰县环城路中段\',)', '(\'(0943)5937666\',)', '(\'http://www.test.com\',)', '(\'142.0\',)', '(\'660fa5eee547e09e1676436c\',)');
INSERT INTO `mymap_basicinfo` VALUES ('332', '(\'104.07577501278,37.186333961436\',)', '(\'沙洲假日酒店\',)', '(\'甘肃省白银市景泰县一条山镇永泰路369号(体育场对面)\',)', '(\'(0943)5581000\',)', '(\'http://www.test.com\',)', '(\'87.0\',)', '(\'d868418b6303ee065abbbc84\',)');
INSERT INTO `mymap_basicinfo` VALUES ('333', '(\'104.08189085636,37.193988855541\',)', '(\'欣和园大酒店\',)', '(\'甘肃省白银市景泰县长城东路3号\',)', '(\'(0943)5904999\',)', '(\'http://www.test.com\',)', '(\'144.0\',)', '(\'c1c92f44ac507513ae31e5e0\',)');
INSERT INTO `mymap_basicinfo` VALUES ('334', '(\'104.08171218339,37.192734894499\',)', '(\'景泰县兴建大酒店\',)', '(\'甘肃省白银市景泰县长城东路3号\',)', '(\'(0943)5596888\',)', '(\'http://www.test.com\',)', '(\'0.0\',)', '(\'39a7192b203610d5bfa82215\',)');
INSERT INTO `mymap_basicinfo` VALUES ('335', '(\'104.07553803979,37.19644993018\',)', '(\'嘉缘商务宾馆\',)', '(\'景泰一条山镇永泰路6号\',)', '(\'(0943)5590666\',)', '(\'http://www.test.com\',)', '(\'120.0\',)', '(\'727e5d77650226d530f71dd0\',)');
INSERT INTO `mymap_basicinfo` VALUES ('336', '(\'104.07617197399,37.194342947683\',)', '(\'白银景泰亿源商务宾馆\',)', '(\'甘肃省白银市景泰县公园南60处\',)', '(\'(0943)5572699\',)', '(\'http://www.test.com\',)', '(\'0.0\',)', '(\'8ecbc34497e66bbdda2f28fa\',)');
INSERT INTO `mymap_basicinfo` VALUES ('337', '(\'104.07189505162,37.197129918489\',)', '(\'天旌宾馆\',)', '(\'甘肃省白银市景泰县中泉路10号\',)', '(\'13309439822\',)', '(\'http://www.test.com\',)', '(None,)', '(\'2d8f5c63b3b9861aa80dd80b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('338', '(\'104.07047393231,37.193320912607\',)', '(\'石林快捷宾馆(1店)\',)', '(\'甘肃省白银市景泰县长城路197号\',)', '(\'(0943)5555568\',)', '(\'http://www.test.com\',)', '(\'0.0\',)', '(\'35dda15ba92038772db96dd9\',)');
INSERT INTO `mymap_basicinfo` VALUES ('339', '(\'104.07611502142,37.195689948618\',)', '(\'白银顺源招待所\',)', '(\'甘肃省白银市景泰县(永泰路人民公园大门北侧)\',)', '(\'(0943)5527715\',)', '(\'http://www.test.com\',)', '(\'0.0\',)', '(\'fbb38cbeeaad02ada11de9c3\',)');
INSERT INTO `mymap_basicinfo` VALUES ('340', '(\'104.07351613375,37.19919578885\',)', '(\'景泰景泉宾馆\',)', '(\'甘肃省白银市景泰县寿鹿街\',)', '(\'(0943)5529893\',)', '(\'http://www.test.com\',)', '(\'0.0\',)', '(\'7d281b6be9562ea9fe0eb049\',)');
INSERT INTO `mymap_basicinfo` VALUES ('341', '(\'104.07617197399,37.194342947683\',)', '(\'白银景泰亿源商务宾馆\',)', '(\'甘肃省白银市景泰县公园南60处\',)', '(\'(0943)5572699\',)', '(\'http://www.test.com\',)', '(\'0.0\',)', '(\'8ecbc34497e66bbdda2f28fa\',)');
INSERT INTO `mymap_basicinfo` VALUES ('342', '(\'104.07611502142,37.195689948618\',)', '(\'白银顺源招待所\',)', '(\'甘肃省白银市景泰县(永泰路人民公园大门北侧)\',)', '(\'(0943)5527715\',)', '(\'http://www.test.com\',)', '(\'0.0\',)', '(\'fbb38cbeeaad02ada11de9c3\',)');
INSERT INTO `mymap_basicinfo` VALUES ('343', '(\'104.07047393231,37.193320912607\',)', '(\'石林快捷宾馆(1店)\',)', '(\'甘肃省白银市景泰县长城路197号\',)', '(\'(0943)5555568\',)', '(\'http://www.test.com\',)', '(\'0.0\',)', '(\'35dda15ba92038772db96dd9\',)');
INSERT INTO `mymap_basicinfo` VALUES ('344', '(\'104.07189505162,37.197129918489\',)', '(\'天旌宾馆\',)', '(\'甘肃省白银市景泰县中泉路10号\',)', '(\'13309439822\',)', '(\'http://www.test.com\',)', '(None,)', '(\'2d8f5c63b3b9861aa80dd80b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('345', '(\'104.0687361603,37.198755196313\',)', '(\'景电宾馆\',)', '(\'甘肃省白银市景泰县昌林路与寿鹿街交叉口向东50米\',)', '(\'(0943)5592999\',)', '(\'http://www.test.com\',)', '(\'99.0\',)', '(\'6113ef77acb470148e772725\',)');
INSERT INTO `mymap_basicinfo` VALUES ('346', '(\'117.06857602592,30.547686102594\',)', '(\'君澜豪庭酒店\',)', '(\'安庆市宜秀区湖心北路59号\',)', '(\'(0556)5699999\',)', '(\'http://www.test.com\',)', '(\'128.0\',)', '(\'a6116f8466150b58f60e775e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('347', '(\'117.06317478438,30.553138345969\',)', '(\'安庆天域时代酒店\',)', '(\'安徽省安庆市宜秀区中兴大街146号(中兴大道与雷池路交叉口)\',)', '(\'(0556)8754087\',)', '(\'http://www.test.com\',)', '(\'167.0\',)', '(\'f8c2c03246c375255ed4fe04\',)');
INSERT INTO `mymap_basicinfo` VALUES ('348', '(\'117.06173785488,30.547447554052\',)', '(\'英德利大酒店\',)', '(\'安徽省安庆市宜秀区经济技术开发区中兴大道122号\',)', '(\'(0556)8710000\',)', '(\'http://www.test.com\',)', '(\'143.0\',)', '(\'4fc3161a74e34bb03b13fd8b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('349', '(\'117.07576902763,30.549155868892\',)', '(\'香澜酒店\',)', '(\'安徽省安庆市宜秀区同安路199号\',)', '(\'(0556)5326666\',)', '(\'http://www.test.com\',)', '(\'148.0\',)', '(\'53461b3271c1b70a9fec2b1d\',)');
INSERT INTO `mymap_basicinfo` VALUES ('350', '(\'117.06571761778,30.554802787594\',)', '(\'尊尚国际大酒店\',)', '(\'安徽省安庆市宜秀区迎宾西路293号\',)', '(\'(0556)5192222\',)', '(\'http://www.test.com\',)', '(\'59.0\',)', '(\'1661895b8fcdf44abb17e71d\',)');
INSERT INTO `mymap_basicinfo` VALUES ('351', '(\'117.07601201927,30.548315982973\',)', '(\'OYO易程快捷酒店\',)', '(\'安徽省安庆市宜秀区同安路102号(光彩大市场2期)\',)', '(\'(0556)5361616\',)', '(\'http://www.test.com\',)', '(\'45.0\',)', '(\'db49cb87aba1175ba4c7562e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('352', '(\'117.07521297652,30.550992909094\',)', '(\'亿鑫酒店(同安路店)\',)', '(\'安徽省安庆市宜秀区同安路239号(双龙大酒店隔壁)\',)', '(\'(0556)5977188\',)', '(\'http://www.test.com\',)', '(\'60.0\',)', '(\'376bd6a24c9652a53686f440\',)');
INSERT INTO `mymap_basicinfo` VALUES ('353', '(\'117.06911087702,30.553719753136\',)', '(\'安庆市天仙河大酒店\',)', '(\'安徽省安庆市宜秀区迎宾路233号(火车站斜对面)\',)', '(\'(0556)5396666\',)', '(\'http://www.test.com\',)', '(\'222.0\',)', '(\'fe165ca74e2f3350d23ce393\',)');
INSERT INTO `mymap_basicinfo` VALUES ('354', '(\'117.0750929629,30.552419940173\',)', '(\'7天酒店(安庆火车站店)\',)', '(\'安庆市宜秀区迎宾路39号\',)', '(\'(0556)5568899\',)', '(\'http://www.test.com\',)', '(\'126.0\',)', '(\'2f508a96952b204515a1908c\',)');
INSERT INTO `mymap_basicinfo` VALUES ('355', '(\'117.06848502757,30.553946934814\',)', '(\'明星商务168酒店\',)', '(\'安徽省安庆市宜秀区天柱商贸城c栋\',)', '(\'(0556)5920168\',)', '(\'http://www.test.com\',)', '(\'70.0\',)', '(\'4dfa736f2fc691e835b06c65\',)');
INSERT INTO `mymap_basicinfo` VALUES ('356', '(\'117.06987102314,30.550244941657\',)', '(\'金百合商务大酒店\',)', '(\'安徽省安庆市宜秀区湖心北路95号\',)', '(\'(0556)5397777\',)', '(\'http://www.test.com\',)', '(None,)', '(\'a8bd06901629a7000bf5ebfe\',)');
INSERT INTO `mymap_basicinfo` VALUES ('357', '(\'117.07601201927,30.548315982973\',)', '(\'OYO易程快捷酒店\',)', '(\'安徽省安庆市宜秀区同安路102号(光彩大市场2期)\',)', '(\'(0556)5361616\',)', '(\'http://www.test.com\',)', '(\'45.0\',)', '(\'db49cb87aba1175ba4c7562e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('358', '(\'117.06857602592,30.547686102594\',)', '(\'君澜豪庭酒店\',)', '(\'安庆市宜秀区湖心北路59号\',)', '(\'(0556)5699999\',)', '(\'http://www.test.com\',)', '(\'128.0\',)', '(\'a6116f8466150b58f60e775e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('359', '(\'117.07521297652,30.550992909094\',)', '(\'亿鑫酒店(同安路店)\',)', '(\'安徽省安庆市宜秀区同安路239号(双龙大酒店隔壁)\',)', '(\'(0556)5977188\',)', '(\'http://www.test.com\',)', '(\'60.0\',)', '(\'376bd6a24c9652a53686f440\',)');
INSERT INTO `mymap_basicinfo` VALUES ('360', '(\'117.06987102314,30.550244941657\',)', '(\'金百合商务大酒店\',)', '(\'安徽省安庆市宜秀区湖心北路95号\',)', '(\'(0556)5397777\',)', '(\'http://www.test.com\',)', '(None,)', '(\'a8bd06901629a7000bf5ebfe\',)');
INSERT INTO `mymap_basicinfo` VALUES ('361', '(\'117.0750929629,30.552419940173\',)', '(\'7天酒店(安庆火车站店)\',)', '(\'安庆市宜秀区迎宾路39号\',)', '(\'(0556)5568899\',)', '(\'http://www.test.com\',)', '(\'126.0\',)', '(\'2f508a96952b204515a1908c\',)');
INSERT INTO `mymap_basicinfo` VALUES ('362', '(\'117.0750929629,30.552419940173\',)', '(\'7天酒店(安庆火车站店)\',)', '(\'安庆市宜秀区迎宾路39号\',)', '(\'(0556)5568899\',)', '(\'http://www.test.com\',)', '(\'126.0\',)', '(\'2f508a96952b204515a1908c\',)');
INSERT INTO `mymap_basicinfo` VALUES ('363', '(\'117.07521297652,30.550992909094\',)', '(\'亿鑫酒店(同安路店)\',)', '(\'安徽省安庆市宜秀区同安路239号(双龙大酒店隔壁)\',)', '(\'(0556)5977188\',)', '(\'http://www.test.com\',)', '(\'60.0\',)', '(\'376bd6a24c9652a53686f440\',)');
INSERT INTO `mymap_basicinfo` VALUES ('364', '(\'117.07576902763,30.549155868892\',)', '(\'香澜酒店\',)', '(\'安徽省安庆市宜秀区同安路199号\',)', '(\'(0556)5326666\',)', '(\'http://www.test.com\',)', '(\'148.0\',)', '(\'53461b3271c1b70a9fec2b1d\',)');
INSERT INTO `mymap_basicinfo` VALUES ('365', '(\'117.07601201927,30.548315982973\',)', '(\'OYO易程快捷酒店\',)', '(\'安徽省安庆市宜秀区同安路102号(光彩大市场2期)\',)', '(\'(0556)5361616\',)', '(\'http://www.test.com\',)', '(\'45.0\',)', '(\'db49cb87aba1175ba4c7562e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('366', '(\'117.06857602592,30.547686102594\',)', '(\'君澜豪庭酒店\',)', '(\'安庆市宜秀区湖心北路59号\',)', '(\'(0556)5699999\',)', '(\'http://www.test.com\',)', '(\'128.0\',)', '(\'a6116f8466150b58f60e775e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('367', '(\'117.07601201927,30.548315982973\',)', '(\'OYO易程快捷酒店\',)', '(\'安徽省安庆市宜秀区同安路102号(光彩大市场2期)\',)', '(\'(0556)5361616\',)', '(\'http://www.test.com\',)', '(\'45.0\',)', '(\'db49cb87aba1175ba4c7562e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('368', '(\'117.07521297652,30.550992909094\',)', '(\'亿鑫酒店(同安路店)\',)', '(\'安徽省安庆市宜秀区同安路239号(双龙大酒店隔壁)\',)', '(\'(0556)5977188\',)', '(\'http://www.test.com\',)', '(\'60.0\',)', '(\'376bd6a24c9652a53686f440\',)');
INSERT INTO `mymap_basicinfo` VALUES ('369', '(\'117.07521297652,30.550992909094\',)', '(\'亿鑫酒店(同安路店)\',)', '(\'安徽省安庆市宜秀区同安路239号(双龙大酒店隔壁)\',)', '(\'(0556)5977188\',)', '(\'http://www.test.com\',)', '(\'60.0\',)', '(\'376bd6a24c9652a53686f440\',)');
INSERT INTO `mymap_basicinfo` VALUES ('370', '(\'117.07576902763,30.549155868892\',)', '(\'香澜酒店\',)', '(\'安徽省安庆市宜秀区同安路199号\',)', '(\'(0556)5326666\',)', '(\'http://www.test.com\',)', '(\'148.0\',)', '(\'53461b3271c1b70a9fec2b1d\',)');
INSERT INTO `mymap_basicinfo` VALUES ('371', '(\'117.07601201927,30.548315982973\',)', '(\'OYO易程快捷酒店\',)', '(\'安徽省安庆市宜秀区同安路102号(光彩大市场2期)\',)', '(\'(0556)5361616\',)', '(\'http://www.test.com\',)', '(\'45.0\',)', '(\'db49cb87aba1175ba4c7562e\',)');
INSERT INTO `mymap_basicinfo` VALUES ('372', '(\'115.50126296705,38.873856092136\',)', '(\'吾朵酒店(保定东风路店)\',)', '(\'河北省保定市莲池区东风中路506号\',)', '(\'(0312)6778666\',)', '(\'http://www.test.com\',)', '(\'99.0\',)', '(\'98cedfa2c9f700e003ff2d14\',)');
INSERT INTO `mymap_basicinfo` VALUES ('373', '(\'115.48781901661,38.865975115767\',)', '(\'摩登水晶酒店\',)', '(\'保定莲池区建华南大街711号(火车站东广场斜对面，近银座商城)\',)', '(\'(0312)7933111\',)', '(\'http://www.test.com\',)', '(\'98.0\',)', '(\'ef79bb42b6c0e836471a320b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('374', '(\'115.48765399789,38.867085131118\',)', '(\'锦江之星酒店(保定火车站东广场店)\',)', '(\'保定市莲池区建华大街670号(火车站东广场南侧)\',)', '(\'(0312)2057999\',)', '(\'http://www.test.com\',)', '(\'60.0\',)', '(\'f1ece4086b0bf962c27da292\',)');
INSERT INTO `mymap_basicinfo` VALUES ('375', '(\'115.48950998691,38.869280107816\',)', '(\'悦为漫酒店\',)', '(\'河北省保定市莲池区建华大街558号(建华大街与西关大街交叉口西南角)\',)', '(\'(0312)5955222\',)', '(\'http://www.test.com\',)', '(\'58.0\',)', '(\'8d90e6b5ca4bc04b2cb96dd1\',)');
INSERT INTO `mymap_basicinfo` VALUES ('376', '(\'115.49036436528,38.869050738968\',)', '(\'保定燕赵大酒店\',)', '(\'河北省保定市莲池区建华北大街559号\',)', '(\'(0312)2099300\',)', '(\'http://www.test.com\',)', '(\'132.0\',)', '(\'6880d6f39f0522438c55ec2d\',)');
INSERT INTO `mymap_basicinfo` VALUES ('377', '(\'115.48971102768,38.86732511126\',)', '(\'如家酒店(保定火车站裕华西路银座商城店)\',)', '(\'保定市莲池区西下关街8号\',)', '(\'(0312)5929666\',)', '(\'http://www.test.com\',)', '(\'100.0\',)', '(\'25ec69fcc5f7d064c36c1490\',)');
INSERT INTO `mymap_basicinfo` VALUES ('378', '(\'115.4922879967,38.873237129676\',)', '(\'世纪花园大酒店\',)', '(\'河北省保定市莲池区建华大街359号\',)', '(\'(0312)5927650\',)', '(\'http://www.test.com\',)', '(\'150.0\',)', '(\'be54cde973f5754179f7968a\',)');
INSERT INTO `mymap_basicinfo` VALUES ('379', '(\'115.48811375065,38.863110977735\',)', '(\'都市花园酒店(保定火车站店)\',)', '(\'河北省保定市莲池区建华大街811号\',)', '(\'(0312)6778777\',)', '(\'http://www.test.com\',)', '(\'66.0\',)', '(\'b66a5244d3443aa7932ca3dd\',)');
INSERT INTO `mymap_basicinfo` VALUES ('380', '(\'115.48672200593,38.865663072241\',)', '(\'如家酒店(保定火车站东广场建华大街店)\',)', '(\'保定市莲池区建华大街736号\',)', '(\'(0312)7927222\',)', '(\'http://www.test.com\',)', '(\'100.0\',)', '(\'00433ae09e86a0afbfa2409c\',)');
INSERT INTO `mymap_basicinfo` VALUES ('381', '(\'115.48999201764,38.868155097739\',)', '(\'京华连锁酒店(保定火车站店)\',)', '(\'河北省保定市莲池区建华大街8号(东方广场对面鑫业大厦)\',)', '(\'(0312)8911158\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'878dda7edfbd71b97bf7961a\',)');
INSERT INTO `mymap_basicinfo` VALUES ('382', '(\'115.48876601028,38.869048070251\',)', '(\'7天酒店(保定火车站店)\',)', '(\'保定市莲池区建华大街606号\',)', '(\'(0312)2023707\',)', '(\'http://www.test.com\',)', '(\'65.0\',)', '(\'ef1e99ad00360c7431f71d80\',)');
INSERT INTO `mymap_basicinfo` VALUES ('383', '(\'115.48971102768,38.86732511126\',)', '(\'如家酒店(保定火车站裕华西路银座商城店)\',)', '(\'保定市莲池区西下关街8号\',)', '(\'(0312)5929666\',)', '(\'http://www.test.com\',)', '(\'100.0\',)', '(\'25ec69fcc5f7d064c36c1490\',)');
INSERT INTO `mymap_basicinfo` VALUES ('384', '(\'115.48781901661,38.865975115767\',)', '(\'摩登水晶酒店\',)', '(\'保定莲池区建华南大街711号(火车站东广场斜对面，近银座商城)\',)', '(\'(0312)7933111\',)', '(\'http://www.test.com\',)', '(\'98.0\',)', '(\'ef79bb42b6c0e836471a320b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('385', '(\'115.48672200593,38.865663072241\',)', '(\'如家酒店(保定火车站东广场建华大街店)\',)', '(\'保定市莲池区建华大街736号\',)', '(\'(0312)7927222\',)', '(\'http://www.test.com\',)', '(\'100.0\',)', '(\'00433ae09e86a0afbfa2409c\',)');
INSERT INTO `mymap_basicinfo` VALUES ('386', '(\'115.48811375065,38.863110977735\',)', '(\'都市花园酒店(保定火车站店)\',)', '(\'河北省保定市莲池区建华大街811号\',)', '(\'(0312)6778777\',)', '(\'http://www.test.com\',)', '(\'66.0\',)', '(\'b66a5244d3443aa7932ca3dd\',)');
INSERT INTO `mymap_basicinfo` VALUES ('387', '(\'115.4922879967,38.873237129676\',)', '(\'世纪花园大酒店\',)', '(\'河北省保定市莲池区建华大街359号\',)', '(\'(0312)5927650\',)', '(\'http://www.test.com\',)', '(\'150.0\',)', '(\'be54cde973f5754179f7968a\',)');
INSERT INTO `mymap_basicinfo` VALUES ('388', '(\'115.4922879967,38.873237129676\',)', '(\'世纪花园大酒店\',)', '(\'河北省保定市莲池区建华大街359号\',)', '(\'(0312)5927650\',)', '(\'http://www.test.com\',)', '(\'150.0\',)', '(\'be54cde973f5754179f7968a\',)');
INSERT INTO `mymap_basicinfo` VALUES ('389', '(\'115.49036436528,38.869050738968\',)', '(\'保定燕赵大酒店\',)', '(\'河北省保定市莲池区建华北大街559号\',)', '(\'(0312)2099300\',)', '(\'http://www.test.com\',)', '(\'132.0\',)', '(\'6880d6f39f0522438c55ec2d\',)');
INSERT INTO `mymap_basicinfo` VALUES ('390', '(\'115.48950998691,38.869280107816\',)', '(\'悦为漫酒店\',)', '(\'河北省保定市莲池区建华大街558号(建华大街与西关大街交叉口西南角)\',)', '(\'(0312)5955222\',)', '(\'http://www.test.com\',)', '(\'58.0\',)', '(\'8d90e6b5ca4bc04b2cb96dd1\',)');
INSERT INTO `mymap_basicinfo` VALUES ('391', '(\'115.48876601028,38.869048070251\',)', '(\'7天酒店(保定火车站店)\',)', '(\'保定市莲池区建华大街606号\',)', '(\'(0312)2023707\',)', '(\'http://www.test.com\',)', '(\'65.0\',)', '(\'ef1e99ad00360c7431f71d80\',)');
INSERT INTO `mymap_basicinfo` VALUES ('392', '(\'115.48950998691,38.869280107816\',)', '(\'悦为漫酒店\',)', '(\'河北省保定市莲池区建华大街558号(建华大街与西关大街交叉口西南角)\',)', '(\'(0312)5955222\',)', '(\'http://www.test.com\',)', '(\'58.0\',)', '(\'8d90e6b5ca4bc04b2cb96dd1\',)');
INSERT INTO `mymap_basicinfo` VALUES ('393', '(\'115.50126296705,38.873856092136\',)', '(\'吾朵酒店(保定东风路店)\',)', '(\'河北省保定市莲池区东风中路506号\',)', '(\'(0312)6778666\',)', '(\'http://www.test.com\',)', '(\'99.0\',)', '(\'98cedfa2c9f700e003ff2d14\',)');
INSERT INTO `mymap_basicinfo` VALUES ('394', '(\'115.4922879967,38.873237129676\',)', '(\'世纪花园大酒店\',)', '(\'河北省保定市莲池区建华大街359号\',)', '(\'(0312)5927650\',)', '(\'http://www.test.com\',)', '(\'150.0\',)', '(\'be54cde973f5754179f7968a\',)');
INSERT INTO `mymap_basicinfo` VALUES ('395', '(\'115.48999201764,38.868155097739\',)', '(\'京华连锁酒店(保定火车站店)\',)', '(\'河北省保定市莲池区建华大街8号(东方广场对面鑫业大厦)\',)', '(\'(0312)8911158\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'878dda7edfbd71b97bf7961a\',)');
INSERT INTO `mymap_basicinfo` VALUES ('396', '(\'115.48765399789,38.867085131118\',)', '(\'锦江之星酒店(保定火车站东广场店)\',)', '(\'保定市莲池区建华大街670号(火车站东广场南侧)\',)', '(\'(0312)2057999\',)', '(\'http://www.test.com\',)', '(\'60.0\',)', '(\'f1ece4086b0bf962c27da292\',)');
INSERT INTO `mymap_basicinfo` VALUES ('397', '(\'115.49036436528,38.869050738968\',)', '(\'保定燕赵大酒店\',)', '(\'河北省保定市莲池区建华北大街559号\',)', '(\'(0312)2099300\',)', '(\'http://www.test.com\',)', '(\'132.0\',)', '(\'6880d6f39f0522438c55ec2d\',)');
INSERT INTO `mymap_basicinfo` VALUES ('398', '(\'115.50126296705,38.873856092136\',)', '(\'吾朵酒店(保定东风路店)\',)', '(\'河北省保定市莲池区东风中路506号\',)', '(\'(0312)6778666\',)', '(\'http://www.test.com\',)', '(\'99.0\',)', '(\'98cedfa2c9f700e003ff2d14\',)');
INSERT INTO `mymap_basicinfo` VALUES ('399', '(\'115.48781901661,38.865975115767\',)', '(\'摩登水晶酒店\',)', '(\'保定莲池区建华南大街711号(火车站东广场斜对面，近银座商城)\',)', '(\'(0312)7933111\',)', '(\'http://www.test.com\',)', '(\'98.0\',)', '(\'ef79bb42b6c0e836471a320b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('400', '(\'115.48765399789,38.867085131118\',)', '(\'锦江之星酒店(保定火车站东广场店)\',)', '(\'保定市莲池区建华大街670号(火车站东广场南侧)\',)', '(\'(0312)2057999\',)', '(\'http://www.test.com\',)', '(\'60.0\',)', '(\'f1ece4086b0bf962c27da292\',)');
INSERT INTO `mymap_basicinfo` VALUES ('401', '(\'115.48950998691,38.869280107816\',)', '(\'悦为漫酒店\',)', '(\'河北省保定市莲池区建华大街558号(建华大街与西关大街交叉口西南角)\',)', '(\'(0312)5955222\',)', '(\'http://www.test.com\',)', '(\'58.0\',)', '(\'8d90e6b5ca4bc04b2cb96dd1\',)');
INSERT INTO `mymap_basicinfo` VALUES ('402', '(\'115.49036436528,38.869050738968\',)', '(\'保定燕赵大酒店\',)', '(\'河北省保定市莲池区建华北大街559号\',)', '(\'(0312)2099300\',)', '(\'http://www.test.com\',)', '(\'132.0\',)', '(\'6880d6f39f0522438c55ec2d\',)');
INSERT INTO `mymap_basicinfo` VALUES ('403', '(\'115.48971102768,38.86732511126\',)', '(\'如家酒店(保定火车站裕华西路银座商城店)\',)', '(\'保定市莲池区西下关街8号\',)', '(\'(0312)5929666\',)', '(\'http://www.test.com\',)', '(\'100.0\',)', '(\'25ec69fcc5f7d064c36c1490\',)');
INSERT INTO `mymap_basicinfo` VALUES ('404', '(\'115.4922879967,38.873237129676\',)', '(\'世纪花园大酒店\',)', '(\'河北省保定市莲池区建华大街359号\',)', '(\'(0312)5927650\',)', '(\'http://www.test.com\',)', '(\'150.0\',)', '(\'be54cde973f5754179f7968a\',)');
INSERT INTO `mymap_basicinfo` VALUES ('405', '(\'115.48811375065,38.863110977735\',)', '(\'都市花园酒店(保定火车站店)\',)', '(\'河北省保定市莲池区建华大街811号\',)', '(\'(0312)6778777\',)', '(\'http://www.test.com\',)', '(\'66.0\',)', '(\'b66a5244d3443aa7932ca3dd\',)');
INSERT INTO `mymap_basicinfo` VALUES ('406', '(\'115.48672200593,38.865663072241\',)', '(\'如家酒店(保定火车站东广场建华大街店)\',)', '(\'保定市莲池区建华大街736号\',)', '(\'(0312)7927222\',)', '(\'http://www.test.com\',)', '(\'100.0\',)', '(\'00433ae09e86a0afbfa2409c\',)');
INSERT INTO `mymap_basicinfo` VALUES ('407', '(\'115.50109597205,38.860556121828\',)', '(\'城市之家酒店(保定永华店)\',)', '(\'河北省保定市莲池区永华南大街638号\',)', '(\'(0312)5921777\',)', '(\'http://www.test.com\',)', '(\'58.0\',)', '(\'1195afb30c0ca939a9175a62\',)');
INSERT INTO `mymap_basicinfo` VALUES ('408', '(\'115.48999201764,38.868155097739\',)', '(\'京华连锁酒店(保定火车站店)\',)', '(\'河北省保定市莲池区建华大街8号(东方广场对面鑫业大厦)\',)', '(\'(0312)8911158\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'878dda7edfbd71b97bf7961a\',)');
INSERT INTO `mymap_basicinfo` VALUES ('409', '(\'115.48876601028,38.869048070251\',)', '(\'7天酒店(保定火车站店)\',)', '(\'保定市莲池区建华大街606号\',)', '(\'(0312)2023707\',)', '(\'http://www.test.com\',)', '(\'65.0\',)', '(\'ef1e99ad00360c7431f71d80\',)');
INSERT INTO `mymap_basicinfo` VALUES ('410', '(\'115.50126296705,38.873856092136\',)', '(\'吾朵酒店(保定东风路店)\',)', '(\'河北省保定市莲池区东风中路506号\',)', '(\'(0312)6778666\',)', '(\'http://www.test.com\',)', '(\'99.0\',)', '(\'98cedfa2c9f700e003ff2d14\',)');
INSERT INTO `mymap_basicinfo` VALUES ('411', '(\'115.48781901661,38.865975115767\',)', '(\'摩登水晶酒店\',)', '(\'保定莲池区建华南大街711号(火车站东广场斜对面，近银座商城)\',)', '(\'(0312)7933111\',)', '(\'http://www.test.com\',)', '(\'98.0\',)', '(\'ef79bb42b6c0e836471a320b\',)');
INSERT INTO `mymap_basicinfo` VALUES ('412', '(\'115.48765399789,38.867085131118\',)', '(\'锦江之星酒店(保定火车站东广场店)\',)', '(\'保定市莲池区建华大街670号(火车站东广场南侧)\',)', '(\'(0312)2057999\',)', '(\'http://www.test.com\',)', '(\'60.0\',)', '(\'f1ece4086b0bf962c27da292\',)');
INSERT INTO `mymap_basicinfo` VALUES ('413', '(\'115.48950998691,38.869280107816\',)', '(\'悦为漫酒店\',)', '(\'河北省保定市莲池区建华大街558号(建华大街与西关大街交叉口西南角)\',)', '(\'(0312)5955222\',)', '(\'http://www.test.com\',)', '(\'58.0\',)', '(\'8d90e6b5ca4bc04b2cb96dd1\',)');
INSERT INTO `mymap_basicinfo` VALUES ('414', '(\'115.49036436528,38.869050738968\',)', '(\'保定燕赵大酒店\',)', '(\'河北省保定市莲池区建华北大街559号\',)', '(\'(0312)2099300\',)', '(\'http://www.test.com\',)', '(\'132.0\',)', '(\'6880d6f39f0522438c55ec2d\',)');
INSERT INTO `mymap_basicinfo` VALUES ('415', '(\'115.48971102768,38.86732511126\',)', '(\'如家酒店(保定火车站裕华西路银座商城店)\',)', '(\'保定市莲池区西下关街8号\',)', '(\'(0312)5929666\',)', '(\'http://www.test.com\',)', '(\'100.0\',)', '(\'25ec69fcc5f7d064c36c1490\',)');
INSERT INTO `mymap_basicinfo` VALUES ('416', '(\'115.4922879967,38.873237129676\',)', '(\'世纪花园大酒店\',)', '(\'河北省保定市莲池区建华大街359号\',)', '(\'(0312)5927650\',)', '(\'http://www.test.com\',)', '(\'150.0\',)', '(\'be54cde973f5754179f7968a\',)');
INSERT INTO `mymap_basicinfo` VALUES ('417', '(\'115.48811375065,38.863110977735\',)', '(\'都市花园酒店(保定火车站店)\',)', '(\'河北省保定市莲池区建华大街811号\',)', '(\'(0312)6778777\',)', '(\'http://www.test.com\',)', '(\'66.0\',)', '(\'b66a5244d3443aa7932ca3dd\',)');
INSERT INTO `mymap_basicinfo` VALUES ('418', '(\'115.48672200593,38.865663072241\',)', '(\'如家酒店(保定火车站东广场建华大街店)\',)', '(\'保定市莲池区建华大街736号\',)', '(\'(0312)7927222\',)', '(\'http://www.test.com\',)', '(\'100.0\',)', '(\'00433ae09e86a0afbfa2409c\',)');
INSERT INTO `mymap_basicinfo` VALUES ('419', '(\'115.48999201764,38.868155097739\',)', '(\'京华连锁酒店(保定火车站店)\',)', '(\'河北省保定市莲池区建华大街8号(东方广场对面鑫业大厦)\',)', '(\'(0312)8911158\',)', '(\'http://www.test.com\',)', '(\'49.0\',)', '(\'878dda7edfbd71b97bf7961a\',)');
INSERT INTO `mymap_basicinfo` VALUES ('420', '(\'115.48876601028,38.869048070251\',)', '(\'7天酒店(保定火车站店)\',)', '(\'保定市莲池区建华大街606号\',)', '(\'(0312)2023707\',)', '(\'http://www.test.com\',)', '(\'65.0\',)', '(\'ef1e99ad00360c7431f71d80\',)');

-- ----------------------------
-- Table structure for `mymap_detailinfo`
-- ----------------------------
DROP TABLE IF EXISTS `mymap_detailinfo`;
CREATE TABLE `mymap_detailinfo` (
  `uid` varchar(200) NOT NULL,
  `detail_url` varchar(200) NOT NULL,
  `level` varchar(20) NOT NULL,
  `overall_rating` varchar(10) NOT NULL,
  `service_rating` varchar(10) NOT NULL,
  `hygiene_rating` varchar(10) NOT NULL,
  `facility_rating` varchar(10) NOT NULL,
  `hotel_facility` varchar(300) NOT NULL,
  `hotel_service` varchar(300) NOT NULL,
  `inner_facility` varchar(400) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of mymap_detailinfo
-- ----------------------------
INSERT INTO `mymap_detailinfo` VALUES ('(\'00433ae09e86a0afbfa2409c\',)', '(\'http://api.map.baidu.com/place/detail?uid=00433ae09e86a0afbfa2409c&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'4.8\',)', '(\'4.7\',)', '(\'4.7\',)', '(\'4.6\',)', '(\'前台贵重物品保险柜 免费停车场 有可无线上网的公共区域 电梯 非经营性客人休息区 公共区域闭路电视监控系统\',)', '(\'行李寄存 叫醒服务 24小时前台服务 商务服务 外送洗衣服务\',)', '(\'国内长途电话 拖鞋 24小时热水 电热水壶 免费洗漱用品(6样以上) 免费瓶装水 多种规格电源插座 独立淋浴间 吹风机 空调 有线频道 液晶电视机 电视机 遮光窗帘 手动窗帘 床具:毯子或被子 房间内高速上网\',)', '2019-03-05 14:43:57.817030');
INSERT INTO `mymap_detailinfo` VALUES ('(\'06e9a13fdacfbd0509b93a0b\',)', '(\'http://api.map.baidu.com/place/detail?uid=06e9a13fdacfbd0509b93a0b&output=html&source=placeapi_v2\',)', '(None,)', '(\'0.0\',)', '(\'0.0\',)', '(\'0.0\',)', '(\'0.0\',)', '(None,)', '(None,)', '(None,)', '2019-03-05 07:45:48.247635');
INSERT INTO `mymap_detailinfo` VALUES ('(\'11b478ea6a1e5cfbf942b2f6\',)', '(\'http://api.map.baidu.com/place/detail?uid=11b478ea6a1e5cfbf942b2f6&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'4.1\',)', '(\'3.9\',)', '(\'4.1\',)', '(\'3.8\',)', '(None,)', '(None,)', '(None,)', '2019-03-05 07:46:09.926302');
INSERT INTO `mymap_detailinfo` VALUES ('(\'1661895b8fcdf44abb17e71d\',)', '(\'http://api.map.baidu.com/place/detail?uid=1661895b8fcdf44abb17e71d&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'4.7\',)', '(\'4.4\',)', '(\'4.5\',)', '(\'4.4\',)', '(\'中餐厅 前台贵重物品保险柜 免费停车场 有可无线上网的公共区域 大堂吧 电梯 暖气 大堂免费报纸 多功能厅 行政楼层 公共区域闭路电视监控系统\',)', '(\'会议厅 商务中心 洗衣服务 送餐服务 鲜花店 行李寄存 叫醒服务 传真/复印 婚宴服务 24小时前台服务 快速办理入住/退房手续 24小时大堂经理\',)', '(\'雨伞 24小时热水 免费瓶装水 110V电压插座 浴缸 独立淋浴间 吹风机 空调 有线频道 电视机 衣柜/衣橱 暖气 遮光窗帘 手动窗帘 坐卧两用长沙发 备用床具 床具:毯子或被子 唤醒服务 无免费洗漱用品 传真 沙发 免费报纸 开夜床 房间内高速上网 电话 淋浴 客房WIFI覆盖免费\',)', '2019-03-05 07:47:10.380857');
INSERT INTO `mymap_detailinfo` VALUES ('(\'2408ce965c46ed92f5c59c3d\',)', '(\'http://api.map.baidu.com/place/detail?uid=2408ce965c46ed92f5c59c3d&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'0.0\',)', '(\'0.0\',)', '(\'0.0\',)', '(\'0.0\',)', '(None,)', '(None,)', '(\'电视机 手动窗帘 床具:毯子或被子\',)', '2019-03-05 06:15:54.139205');
INSERT INTO `mymap_detailinfo` VALUES ('(\'25ec69fcc5f7d064c36c1490\',)', '(\'http://api.map.baidu.com/place/detail?uid=25ec69fcc5f7d064c36c1490&output=html&source=placeapi_v2\',)', '(None,)', '(\'4.5\',)', '(\'4.6\',)', '(\'4.6\',)', '(\'4.4\',)', '(\'停车场 前台贵重物品保险柜 电梯\',)', '(\'商务中心 行李寄存 叫醒服务 24小时前台服务\',)', '(\'国内长途电话 国际长途电话 雨伞 书桌 24小时热水 电热水壶 免费洗漱用品(6样以上) 独立淋浴间 吹风机 空调 液晶电视机 电视机 电脑 单一规格电源插座 遮光窗帘 手动窗帘 床具:毯子或被子 唤醒服务 免费洗漱用品(6样以内) 沙发 客房WIFI覆盖 客房WIFI覆盖免费\',)', '2019-03-05 14:43:55.370534');
INSERT INTO `mymap_detailinfo` VALUES ('(\'2d8f5c63b3b9861aa80dd80b\',)', '(\'http://api.map.baidu.com/place/detail?uid=2d8f5c63b3b9861aa80dd80b&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'0.0\',)', '(\'2.9\',)', '(\'2.5\',)', '(\'2.2\',)', '(None,)', '(None,)', '(None,)', '2019-03-05 07:46:51.736005');
INSERT INTO `mymap_detailinfo` VALUES ('(\'2f508a96952b204515a1908c\',)', '(\'http://api.map.baidu.com/place/detail?uid=2f508a96952b204515a1908c&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'5.0\',)', '(\'4.9\',)', '(\'4.9\',)', '(\'4.7\',)', '(\'前台贵重物品保险柜 免费停车场 电梯 有可无线上网的公共区域 免费 吸烟区 餐厅 公共音响系统\',)', '(\'邮政服务 行李寄存 叫醒服务 24小时前台服务 部分时段大堂经理\',)', '(\'24小时热水 电热水壶 免费洗漱用品(6样以上) 免费瓶装水 多种规格电源插座 独立淋浴间 吹风机 空调 液晶电视机 衣柜/衣橱 遮光窗帘 坐卧两用长沙发 沙发 客房WIFI覆盖\',)', '2019-03-05 07:48:47.472471');
INSERT INTO `mymap_detailinfo` VALUES ('(\'35dda15ba92038772db96dd9\',)', '(\'http://api.map.baidu.com/place/detail?uid=35dda15ba92038772db96dd9&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'0.0\',)', '(\'0.0\',)', '(\'0.0\',)', '(\'0.0\',)', '(\'免费停车场\',)', '(\'行李寄存 24小时前台服务\',)', '(\'拖鞋 24小时热水 电热水壶 空调 电视机 手动窗帘 床具:毯子或被子 免费洗漱用品(6样以内)\',)', '2019-03-05 07:46:49.845091');
INSERT INTO `mymap_detailinfo` VALUES ('(\'376bd6a24c9652a53686f440\',)', '(\'http://api.map.baidu.com/place/detail?uid=376bd6a24c9652a53686f440&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'4.6\',)', '(\'4.6\',)', '(\'4.5\',)', '(\'4.6\',)', '(\'前台贵重物品保险柜 免费停车场 电梯 有可无线上网的公共区域 免费\',)', '(\'行李寄存 叫醒服务 24小时前台服务\',)', '(\'空调 电视机 手动窗帘 床具:毯子或被子\',)', '2019-03-05 07:49:28.005970');
INSERT INTO `mymap_detailinfo` VALUES ('(\'39a7192b203610d5bfa82215\',)', '(\'http://api.map.baidu.com/place/detail?uid=39a7192b203610d5bfa82215&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'3.8\',)', '(\'4.3\',)', '(\'4.2\',)', '(\'4.2\',)', '(\'中餐厅 免费停车场 电梯 有可无线上网的公共区域 免费\',)', '(\'行李寄存 叫醒服务 24小时前台服务\',)', '(\'国内长途电话 拖鞋 雨伞 浴室化妆放大镜 24小时热水 电热水壶 免费洗漱用品(6样以上) 浴缸 独立淋浴间 吹风机 房内保险箱 空调 非24小时热水 有线频道 卫星频道 液晶电视机 电视机 电脑 针线包 遮光窗帘 手动窗帘 坐卧两用长沙发 床具:鸭绒被 床具:毯子或被子 唤醒服务 免费洗漱用品(6样以内) 公用吹风机 按摩浴缸 浴室 山景 享有风景 阳台 电子秤 房间内高速上网 电话 淋浴 客房WIFI覆盖 免费国内长途电话 客房WIFI覆盖免费\',)', '2019-03-05 07:46:43.119327');
INSERT INTO `mymap_detailinfo` VALUES ('(\'3a84bcefecf96577c7f50d7b\',)', '(\'http://api.map.baidu.com/place/detail?uid=3a84bcefecf96577c7f50d7b&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'3.9\',)', '(\'4.3\',)', '(\'4.1\',)', '(\'3.9\',)', '(\'电梯 有可无线上网的公共区域 免费\',)', '(\'24小时前台服务\',)', '(\'24小时热水 电热水壶 独立淋浴间 空调 液晶电视机 手动窗帘 床具:毯子或被子\',)', '2019-03-05 07:45:49.155593');
INSERT INTO `mymap_detailinfo` VALUES ('(\'40ec1428b2afc187430245f2\',)', '(\'http://api.map.baidu.com/place/detail?uid=40ec1428b2afc187430245f2&output=html&source=placeapi_v2\',)', '(None,)', '(\'4.8\',)', '(\'0\',)', '(\'0\',)', '(\'0\',)', '(None,)', '(None,)', '(\'暖气\',)', '2019-03-05 07:45:47.408299');
INSERT INTO `mymap_detailinfo` VALUES ('(\'4417ae25f218ef42a10464e1\',)', '(\'http://api.map.baidu.com/place/detail?uid=4417ae25f218ef42a10464e1&output=html&source=placeapi_v2\',)', '(None,)', '(\'3.2\',)', '(\'0.0\',)', '(\'0.0\',)', '(\'0.0\',)', '(None,)', '(None,)', '(None,)', '2019-03-05 07:45:49.425803');
INSERT INTO `mymap_detailinfo` VALUES ('(\'4dfa736f2fc691e835b06c65\',)', '(\'http://api.map.baidu.com/place/detail?uid=4dfa736f2fc691e835b06c65&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'4.4\',)', '(\'4.1\',)', '(\'4.3\',)', '(\'4.3\',)', '(\'停车场 前台贵重物品保险柜 电梯 大堂免费报纸 非经营性客人休息区 公共区域闭路电视监控系统 无充电车位\',)', '(\'行李寄存 叫醒服务 24小时前台服务 24小时大堂经理\',)', '(None,)', '2019-03-05 07:47:12.478112');
INSERT INTO `mymap_detailinfo` VALUES ('(\'4fc3161a74e34bb03b13fd8b\',)', '(\'http://api.map.baidu.com/place/detail?uid=4fc3161a74e34bb03b13fd8b&output=html&source=placeapi_v2\',)', '(\'舒适型\',)', '(\'3.9\',)', '(\'4.2\',)', '(\'4.3\',)', '(\'4.1\',)', '(\'中餐厅 前台贵重物品保险柜 免费停车场 电梯 有可无线上网的公共区域 免费\',)', '(\'行李寄存 叫醒服务 24小时前台服务\',)', '(\'拖鞋 24小时热水 电热水壶 吹风机 空调 电视机 免费洗漱用品(6样以内) 电话 淋浴\',)', '2019-03-05 07:47:09.465948');
INSERT INTO `mymap_detailinfo` VALUES ('(\'53461b3271c1b70a9fec2b1d\',)', '(\'http://api.map.baidu.com/place/detail?uid=53461b3271c1b70a9fec2b1d&output=html&source=placeapi_v2\',)', '(\'舒适型\',)', '(\'4.8\',)', '(\'4.7\',)', '(\'4.7\',)', '(\'4.6\',)', '(\'中餐厅 前台贵重物品保险柜 免费停车场 免费旅游交通图(可赠送) 电梯 有可无线上网的公共区域 免费 大堂免费报纸 多功能厅 公共音响系统 非经营性客人休息区 多媒体演示系统 公共区域闭路电视监控系统\',)', '(\'会议厅 旅游票务服务 送餐服务 行李寄存 叫醒服务 24小时前台服务 信用卡结算服务 一次性账单结算服务 部分时段大堂经理 商务服务\',)', '(\'拖鞋 雨伞 书桌 24小时热水 电热水壶 免费瓶装水 迷你吧 浴衣 多种规格电源插座 独立淋浴间 吹风机 空调 有线频道 液晶电视机 闹钟 针线包 220V电压插座 遮光窗帘 手动窗帘 欢迎礼品 免费洗漱用品(6样以内) 沙发 电子秤 房间内高速上网 淋浴 免费国内长途电话 客房WIFI覆盖免费\',)', '2019-03-05 07:49:44.393764');
INSERT INTO `mymap_detailinfo` VALUES ('(\'5f17dac71ed3ac1a04026fbe\',)', '(\'http://api.map.baidu.com/place/detail?uid=5f17dac71ed3ac1a04026fbe&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'4.5\',)', '(\'4.6\',)', '(\'4.7\',)', '(\'4.5\',)', '(\'前台贵重物品保险柜 免费停车场 电梯 有可无线上网的公共区域 免费 暖气 公共音响系统 非经营性客人休息区 公共区域闭路电视监控系统\',)', '(\'邮政服务 行李寄存 叫醒服务 24小时前台服务 快速办理入住/退房手续 信用卡结算服务 一次性账单结算服务 部分时段大堂经理 商务服务\',)', '(\'拖鞋 书桌 24小时热水 电热水壶 免费洗漱用品(6样以上) 免费瓶装水 多种规格电源插座 独立淋浴间 吹风机 空调 有线频道 液晶电视机 暖气 220V电压插座 遮光窗帘 手动窗帘 床具:毯子或被子 沙发 房间内高速上网 电话 淋浴 客房WIFI覆盖免费 智能门锁\',)', '2019-03-05 07:45:42.446090');
INSERT INTO `mymap_detailinfo` VALUES ('(\'6113ef77acb470148e772725\',)', '(\'http://api.map.baidu.com/place/detail?uid=6113ef77acb470148e772725&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'4.6\',)', '(\'4.1\',)', '(\'4.1\',)', '(\'4.0\',)', '(\'中餐厅 免费停车场 电梯 有可无线上网的公共区域 免费 暖气 大堂免费报纸 多功能厅\',)', '(\'会议厅 送餐服务 行李寄存 叫醒服务 24小时前台服务\',)', '(\'拖鞋 24小时热水 电热水壶 空调 电视机 手动窗帘 床具:毯子或被子 免费洗漱用品(6样以内) 电话 淋浴\',)', '2019-03-05 07:46:59.508201');
INSERT INTO `mymap_detailinfo` VALUES ('(\'660fa5eee547e09e1676436c\',)', '(\'http://api.map.baidu.com/place/detail?uid=660fa5eee547e09e1676436c&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'4.8\',)', '(\'4.3\',)', '(\'4.4\',)', '(\'4.3\',)', '(\'免费停车场 电梯 有可无线上网的公共区域 免费\',)', '(\'行李寄存 叫醒服务 24小时前台服务\',)', '(\'拖鞋 24小时热水 电热水壶 空调 电视机 手动窗帘 床具:毯子或被子 免费洗漱用品(6样以内) 淋浴\',)', '2019-03-05 07:46:41.839247');
INSERT INTO `mymap_detailinfo` VALUES ('(\'6880d6f39f0522438c55ec2d\',)', '(\'http://api.map.baidu.com/place/detail?uid=6880d6f39f0522438c55ec2d&output=html&source=placeapi_v2\',)', '(None,)', '(\'4.2\',)', '(\'4.6\',)', '(\'4.7\',)', '(\'4.6\',)', '(\'免费停车场 电梯 有可无线上网的公共区域 免费 大堂免费报纸 公共音响系统 非经营性客人休息区 公共区域闭路电视监控系统\',)', '(\'会议厅 叫车服务 邮政服务 行李寄存 叫醒服务 24小时前台服务 信用卡结算服务 24小时大堂经理\',)', '(\'拖鞋 书桌 24小时热水 电热水壶 免费瓶装水 迷你吧 多种规格电源插座 独立淋浴间 吹风机 空调 有线频道 液晶电视机 220V电压插座 遮光窗帘 手动窗帘 床具:鸭绒被 免费洗漱用品(6样以内) 沙发 房间内高速上网 电话 淋浴 客房WIFI覆盖免费\',)', '2019-03-05 14:44:30.623858');
INSERT INTO `mymap_detailinfo` VALUES ('(\'6f2d3cf49ea683ca108824e2\',)', '(\'http://api.map.baidu.com/place/detail?uid=6f2d3cf49ea683ca108824e2&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'3.9\',)', '(\'4.0\',)', '(\'4.4\',)', '(\'3.9\',)', '(None,)', '(None,)', '(None,)', '2019-03-05 07:45:49.720409');
INSERT INTO `mymap_detailinfo` VALUES ('(\'727e5d77650226d530f71dd0\',)', '(\'http://api.map.baidu.com/place/detail?uid=727e5d77650226d530f71dd0&output=html&source=placeapi_v2\',)', '(None,)', '(\'4.4\',)', '(\'4.5\',)', '(\'4.5\',)', '(\'4.5\',)', '(\'免费旅游交通图(可赠送) 电梯 有可无线上网的公共区域 免费 非经营性客人休息区 多媒体演示系统 公共区域闭路电视监控系统\',)', '(\'邮政服务 行李寄存 叫醒服务 租车服务 24小时前台服务 信用卡结算服务 商务服务 外送洗衣服务\',)', '(\'国内长途电话 拖鞋 书桌 24小时热水 电热水壶 免费洗漱用品(6样以上) 免费瓶装水 多种规格电源插座 独立淋浴间 吹风机 空调 有线频道 液晶电视机 220V电压插座 遮光窗帘 手动窗帘 备用床具 床具:毯子或被子 沙发 房间内高速上网 客房WIFI覆盖免费\',)', '2019-03-05 07:46:43.545048');
INSERT INTO `mymap_detailinfo` VALUES ('(\'72a326a13a1a3e6a8d772703\',)', '(\'http://api.map.baidu.com/place/detail?uid=72a326a13a1a3e6a8d772703&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'4.9\',)', '(\'0.0\',)', '(\'0.0\',)', '(\'0.0\',)', '(\'电梯 餐厅\',)', '(None,)', '(\'拖鞋 24小时热水 免费洗漱用品(6样以上) 独立淋浴间 吹风机 空调 电视机 洗衣机 暖气 房间内高速上网 客房WIFI覆盖 智能马桶\',)', '2019-03-05 07:45:48.545551');
INSERT INTO `mymap_detailinfo` VALUES ('(\'72ce9be04b189ad4853304a7\',)', '(\'http://api.map.baidu.com/place/detail?uid=72ce9be04b189ad4853304a7&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'5.0\',)', '(\'5.0\',)', '(\'5.0\',)', '(\'5.0\',)', '(\'有可无线上网的公共区域 有可无线上网的公共区域 免费\',)', '(None,)', '(\'24小时热水 电热水器 电视机 手动窗帘 床具:毯子或被子\',)', '2019-03-05 07:25:35.296042');
INSERT INTO `mymap_detailinfo` VALUES ('(\'78e4decd9f20c2b7a8175a29\',)', '(\'http://api.map.baidu.com/place/detail?uid=78e4decd9f20c2b7a8175a29&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'4.3\',)', '(\'3.6\',)', '(\'3.5\',)', '(\'2.3\',)', '(\'停车场 有可无线上网的公共区域 免费 暖气\',)', '(\'洗衣服务 接机服务 接站服务\',)', '(\'24小时热水 独立淋浴间 空调 电视机 手动窗帘 床具:毯子或被子\',)', '2019-03-05 07:45:42.782431');
INSERT INTO `mymap_detailinfo` VALUES ('(\'7d281b6be9562ea9fe0eb049\',)', '(\'http://api.map.baidu.com/place/detail?uid=7d281b6be9562ea9fe0eb049&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'0.0\',)', '(\'0.0\',)', '(\'4.0\',)', '(\'4.0\',)', '(\'停车场 免费停车场 有可无线上网的公共区域 免费 暖气\',)', '(None,)', '(\'24小时热水 电热水壶 独立淋浴间 空调 非24小时热水 电视机 手动窗帘 床具:毯子或被子 客房WIFI覆盖\',)', '2019-03-05 07:46:45.379316');
INSERT INTO `mymap_detailinfo` VALUES ('(\'7f4a63ba4938c879c7f50d81\',)', '(\'http://api.map.baidu.com/place/detail?uid=7f4a63ba4938c879c7f50d81&output=html&source=placeapi_v2\',)', '(None,)', '(\'0.0\',)', '(\'0.0\',)', '(\'0.0\',)', '(\'0.0\',)', '(None,)', '(\'行李寄存 叫醒服务\',)', '(\'空调\',)', '2019-03-05 06:15:52.625494');
INSERT INTO `mymap_detailinfo` VALUES ('(\'878dda7edfbd71b97bf7961a\',)', '(\'http://api.map.baidu.com/place/detail?uid=878dda7edfbd71b97bf7961a&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'3.9\',)', '(\'4.1\',)', '(\'4.1\',)', '(\'3.9\',)', '(\'免费停车场 电梯 有可无线上网的公共区域 免费\',)', '(\'商务中心 洗衣服务 行李寄存 叫醒服务\',)', '(\'拖鞋 书桌 24小时热水 免费洗漱用品(6样以上) 110V电压插座 独立淋浴间 空调 电视机 电脑 手动窗帘 床具:毯子或被子\',)', '2019-03-05 14:44:14.400841');
INSERT INTO `mymap_detailinfo` VALUES ('(\'8d90e6b5ca4bc04b2cb96dd1\',)', '(\'http://api.map.baidu.com/place/detail?uid=8d90e6b5ca4bc04b2cb96dd1&output=html&source=placeapi_v2\',)', '(\'舒适型\',)', '(\'5.0\',)', '(\'4.8\',)', '(\'4.8\',)', '(\'4.8\',)', '(\'中餐厅 咖啡厅 前台贵重物品保险柜 免费停车场 免费旅游交通图(可赠送) 大堂吧 电梯 有可无线上网的公共区域 免费 大堂免费报纸 公共音响系统 非经营性客人休息区 无烟楼层 行政楼层 多媒体演示系统 公共区域闭路电视监控系统\',)', '(\'会议厅 洗衣服务 送餐服务 叫车服务 行李寄存 叫醒服务 传真/复印 24小时前台服务 信用卡结算服务 一次性账单结算服务 24小时大堂经理 商务服务\',)', '(\'国内长途电话 拖鞋 书桌 24小时热水 电热水壶 免费洗漱用品(6样以上) 免费瓶装水 迷你吧 小冰箱 多种规格电源插座 独立淋浴间 吹风机 空调 有线频道 液晶电视机 220V电压插座 遮光窗帘 手动窗帘 床具:鸭绒被 床具:毯子或被子 沙发 电话 淋浴 客房WIFI覆盖免费\',)', '2019-03-05 14:44:09.838641');
INSERT INTO `mymap_detailinfo` VALUES ('(\'8ecbc34497e66bbdda2f28fa\',)', '(\'http://api.map.baidu.com/place/detail?uid=8ecbc34497e66bbdda2f28fa&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'0.0\',)', '(\'0.0\',)', '(\'0.0\',)', '(\'0.0\',)', '(None,)', '(None,)', '(None,)', '2019-03-05 07:46:47.477444');
INSERT INTO `mymap_detailinfo` VALUES ('(\'92eb258f09e4666db21e36ef\',)', '(\'http://api.map.baidu.com/place/detail?uid=92eb258f09e4666db21e36ef&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'3.5\',)', '(\'3.0\',)', '(\'3.0\',)', '(\'3.0\',)', '(\'停车场 电梯 暖气\',)', '(\'部分时段前台服务\',)', '(\'拖鞋 24小时热水 电热水壶 独立淋浴间 吹风机 空调 电视机 单一规格电源插座 220V电压插座 遮光窗帘 手动窗帘 床具:毯子或被子 客房WIFI覆盖免费\',)', '2019-03-05 07:45:44.088715');
INSERT INTO `mymap_detailinfo` VALUES ('(\'96e07ddf3b33faf46018099e\',)', '(\'http://api.map.baidu.com/place/detail?uid=96e07ddf3b33faf46018099e&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'4.6\',)', '(\'4.6\',)', '(\'4.6\',)', '(\'4.8\',)', '(\'电梯 有可无线上网的公共区域 免费 非经营性客人休息区 公共区域闭路电视监控系统\',)', '(\'行李寄存 叫醒服务 24小时前台服务\',)', '(\'拖鞋 书桌 24小时热水 电热水壶 多种规格电源插座 独立淋浴间 吹风机 空调 有线频道 液晶电视机 220V电压插座 遮光窗帘 手动窗帘 床具:毯子或被子 免费洗漱用品(6样以内) 沙发 淋浴 客房WIFI覆盖免费\',)', '2019-03-05 07:45:43.477822');
INSERT INTO `mymap_detailinfo` VALUES ('(\'98cedfa2c9f700e003ff2d14\',)', '(\'http://api.map.baidu.com/place/detail?uid=98cedfa2c9f700e003ff2d14&output=html&source=placeapi_v2\',)', '(None,)', '(\'4.3\',)', '(\'4.8\',)', '(\'4.8\',)', '(\'4.8\',)', '(\'前台贵重物品保险柜 免费停车场 免费旅游交通图(可赠送) 电梯 有可无线上网的公共区域 免费 所有公共及私人场所严禁吸烟 大堂免费报纸 餐厅 公共音响系统 非经营性客人休息区 无烟楼层 多媒体演示系统 公共区域闭路电视监控系统 中文指示\',)', '(\'会议厅 旅游票务服务 洗衣服务 送餐服务 叫车服务 邮政服务 行李寄存 叫醒服务 接机服务 礼宾服务 干洗 传真/复印 熨衣服务 办理私人登记入住/退房手续 擦鞋服务 翻译服务 多国语言工作人员 24小时前台服务 快速办理入住/退房手续 代客泊车 信用卡结算服务 一次性账单结算服务 部分时段大堂经理 外送洗衣服务 接站服务 中文服务 儿童餐 儿童拖鞋 儿童浴袍 儿童牙刷 儿童玩具\',)', '(\'拖鞋 书桌 浴室化妆放大镜 24小时热水 电热水壶 免费洗漱用品(6样以上) 免费瓶装水 熨衣设备 小冰箱 多种规格电源插座 110V电压插座 独立淋浴间 吹风机 房内保险箱 空调 有线频道 卫星频道 液晶电视机 洗衣机 衣柜/衣橱 针线包 遮光窗帘 手动窗帘 床具:鸭绒被 欢迎礼品 城景 地标景 沙发 电子秤 房间内高速上网 电话 免费国内长途电话 客房WIFI覆盖免费\',)', '2019-03-05 14:44:10.324359');
INSERT INTO `mymap_detailinfo` VALUES ('(\'9ebb06bced84f52694ec84bf\',)', '(\'http://api.map.baidu.com/place/detail?uid=9ebb06bced84f52694ec84bf&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'4.4\',)', '(\'4.6\',)', '(\'4.7\',)', '(\'4.6\',)', '(\'中餐厅 前台贵重物品保险柜 免费停车场 免费旅游交通图(可赠送) 电梯 有可无线上网的公共区域 免费 大堂免费报纸 非经营性客人休息区 公共区域闭路电视监控系统\',)', '(\'旅游票务服务 送餐服务 邮政服务 行李寄存 叫醒服务 24小时前台服务 一次性账单结算服务\',)', '(\'拖鞋 书桌 24小时热水 电热水壶 咖啡壶/茶壶 免费洗漱用品(6样以上) 免费瓶装水 小冰箱 多种规格电源插座 独立淋浴间 吹风机 空调 有线频道 液晶电视机 闹钟 针线包 220V电压插座 遮光窗帘 手动窗帘 备用床具 床具:毯子或被子 沙发 电话 免费国内长途电话 客房WIFI覆盖免费\',)', '2019-03-05 07:46:41.396171');
INSERT INTO `mymap_detailinfo` VALUES ('(\'a6116f8466150b58f60e775e\',)', '(\'http://api.map.baidu.com/place/detail?uid=a6116f8466150b58f60e775e&output=html&source=placeapi_v2\',)', '(\'四星级\',)', '(\'4.7\',)', '(\'4.7\',)', '(\'4.7\',)', '(\'4.6\',)', '(\'中餐厅 西餐厅 咖啡厅 酒吧 商场 前台贵重物品保险柜 免费停车场 电梯 有可无线上网的公共区域 免费 吸烟区 暖气 大堂免费报纸 礼品廊 多功能厅 公共音响系统 非经营性客人休息区 行政楼层 多媒体演示系统 公共区域闭路电视监控系统\',)', '(\'会议厅 洗衣服务 送餐服务 叫车服务 专职行李员 行李寄存 叫醒服务 礼宾服务 干洗 传真/复印 熨衣服务 办理私人登记入住/退房手续 婚宴服务 24小时前台服务 专职门童 信用卡结算服务 一次性账单结算服务 部分时段大堂经理 商务服务 外送洗衣服务 接站服务\',)', '(\'国内长途电话 国际长途电话 拖鞋 雨伞 书桌 浴室化妆放大镜 24小时热水 电热水壶 咖啡壶/茶壶 免费洗漱用品(6样以上) 免费瓶装水 迷你吧 熨衣设备 小冰箱 浴衣 多种规格电源插座 110V电压插座 浴缸 独立淋浴间 吹风机 房内保险箱 空调 有线频道 卫星频道 液晶电视机 电脑 iPad 咖啡机 烤面包机 用餐区 厨房 电风扇 微波炉 洗衣机 衣柜/衣橱 连通房 暖气 闹钟 针线包 220V电压插座 遮光窗帘 手动窗帘 坐卧两用长沙发 备用床具 床具:鸭绒被 床具:毯子或被子 唤醒服务 语音留言 欢迎礼品 按摩浴缸 桑拿 城景 享有风景 地标景 洗浴间电视 洗浴间电话 沙发 免费报纸 开夜床 电子秤 房间内高速上网 电话 淋浴 客房WIFI覆盖免费\',)', '2019-03-05 07:48:59.146873');
INSERT INTO `mymap_detailinfo` VALUES ('(\'a8bd06901629a7000bf5ebfe\',)', '(\'http://api.map.baidu.com/place/detail?uid=a8bd06901629a7000bf5ebfe&output=html&source=placeapi_v2\',)', '(\'舒适型\',)', '(\'4.8\',)', '(\'4.7\',)', '(\'4.7\',)', '(\'4.6\',)', '(\'前台贵重物品保险柜 自动取款机 免费停车场 电梯 大堂免费报纸 公共音响系统 行政楼层\',)', '(\'商务中心 洗衣服务 送餐服务 叫车服务 行李寄存 叫醒服务 办理私人登记入住/退房手续 婚宴服务 24小时前台服务 信用卡结算服务 一次性账单结算服务 部分时段大堂经理 外送洗衣服务\',)', '(\'国内长途电话 国际长途电话 拖鞋 书桌 24小时热水 电热水壶 免费洗漱用品(6样以上) 免费瓶装水 迷你吧 小冰箱 吹风机 空调 电热水器 有线频道 液晶电视机 电视机 电脑 用餐区 电风扇 衣柜/衣橱 闹钟 针线包 单一规格电源插座 220V电压插座 无插座 坐卧两用长沙发 备用床具 床具:毯子或被子 唤醒服务 浴室 沙发 免费报纸 开夜床 房间内高速上网 电话 淋浴\',)', '2019-03-05 07:47:21.571215');
INSERT INTO `mymap_detailinfo` VALUES ('(\'b66a5244d3443aa7932ca3dd\',)', '(\'http://api.map.baidu.com/place/detail?uid=b66a5244d3443aa7932ca3dd&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'5.0\',)', '(\'4.6\',)', '(\'4.6\',)', '(\'4.6\',)', '(None,)', '(None,)', '(\'电视机 手动窗帘 床具:毯子或被子\',)', '2019-03-05 14:43:59.424042');
INSERT INTO `mymap_detailinfo` VALUES ('(\'b787fc4be7a98c899fec2bd2\',)', '(\'http://api.map.baidu.com/place/detail?uid=b787fc4be7a98c899fec2bd2&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'4.9\',)', '(\'4.0\',)', '(\'4.0\',)', '(\'3.9\',)', '(\'停车场 有可无线上网的公共区域 免费 暖气\',)', '(\'洗衣服务 接机服务 接站服务\',)', '(\'24小时热水 独立淋浴间 空调 电视机 手动窗帘 床具:毯子或被子\',)', '2019-03-05 07:46:17.443932');
INSERT INTO `mymap_detailinfo` VALUES ('(\'be54cde973f5754179f7968a\',)', '(\'http://api.map.baidu.com/place/detail?uid=be54cde973f5754179f7968a&output=html&source=placeapi_v2\',)', '(\'舒适型\',)', '(\'4.5\',)', '(\'4.3\',)', '(\'4.3\',)', '(\'4.1\',)', '(\'残疾人客房 前台贵重物品保险柜 免费停车场 免费旅游交通图(可赠送) 大堂吧 电梯 有可无线上网的公共区域 免费 大堂免费报纸 公共音响系统 非经营性客人休息区 无烟楼层 多媒体演示系统 公共区域闭路电视监控系统\',)', '(\'会议厅 商务中心 洗衣服务 叫车服务 邮政服务 专职行李员 行李寄存 叫醒服务 租车服务 礼宾服务 熨衣服务 办理私人登记入住/退房手续 婚宴服务 24小时前台服务 快速办理入住/退房手续 代客泊车 信用卡结算服务 一次性账单结算服务 24小时大堂经理 外送洗衣服务\',)', '(\'国内长途电话 拖鞋 书桌 浴室化妆放大镜 24小时热水 电热水壶 免费洗漱用品(6样以上) 免费瓶装水 迷你吧 小冰箱 浴衣 多种规格电源插座 110V电压插座 浴缸 吹风机 房内保险箱 空调 有线频道 液晶电视机 电脑 衣柜/衣橱 闹钟 针线包 220V电压插座 遮光窗帘 手动窗帘 床具:鸭绒被 唤醒服务 欢迎礼品 行政酒廊 按摩浴缸 城景 花园景 地标景 洗浴间电话 沙发 免费报纸 开夜床 电子秤 房间内高速上网 客房WIFI覆盖免费\',)', '2019-03-05 14:44:12.835796');
INSERT INTO `mymap_detailinfo` VALUES ('(\'bf2b750131938ea0d23ce3df\',)', '(\'http://api.map.baidu.com/place/detail?uid=bf2b750131938ea0d23ce3df&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'4.3\',)', '(\'4.4\',)', '(\'4.5\',)', '(\'4.3\',)', '(\'停车场 免费停车场 有可无线上网的公共区域 有可无线上网的公共区域 免费\',)', '(None,)', '(\'24小时热水 电热水器 电视机 手动窗帘 床具:毯子或被子\',)', '2019-03-05 07:06:20.459957');
INSERT INTO `mymap_detailinfo` VALUES ('(\'c1c92f44ac507513ae31e5e0\',)', '(\'http://api.map.baidu.com/place/detail?uid=c1c92f44ac507513ae31e5e0&output=html&source=placeapi_v2\',)', '(\'舒适型\',)', '(\'3.0\',)', '(\'2.8\',)', '(\'2.8\',)', '(\'2.7\',)', '(\'中餐厅 前台贵重物品保险柜 免费停车场 免费旅游交通图(可赠送) 电梯 有可无线上网的公共区域 免费 大堂免费报纸 礼品廊 多功能厅 公共音响系统 非经营性客人休息区 无烟楼层 行政楼层 多媒体演示系统 公共区域闭路电视监控系统\',)', '(\'会议厅 旅游票务服务 送餐服务 邮政服务 专职行李员 行李寄存 接机服务 婚宴服务 24小时前台服务 代客泊车 信用卡结算服务 一次性账单结算服务 部分时段大堂经理 商务服务 外送洗衣服务 接站服务\',)', '(\'国际长途电话 拖鞋 雨伞 书桌 24小时热水 电热水壶 免费瓶装水 小冰箱 多种规格电源插座 110V电压插座 独立淋浴间 吹风机 房内保险箱 空调 有线频道 液晶电视机 针线包 220V电压插座 遮光窗帘 手动窗帘 备用床具 床具:毯子或被子 免费洗漱用品(6样以内) 沙发 开夜床 房间内高速上网 淋浴 免费国内长途电话 客房WIFI覆盖免费\',)', '2019-03-05 07:46:42.715467');
INSERT INTO `mymap_detailinfo` VALUES ('(\'c8ef77bf29848df4f2193714\',)', '(\'http://api.map.baidu.com/place/detail?uid=c8ef77bf29848df4f2193714&output=html&source=placeapi_v2\',)', '(None,)', '(None,)', '(None,)', '(None,)', '(None,)', '(None,)', '(None,)', '(None,)', '2019-03-05 06:15:52.141255');
INSERT INTO `mymap_detailinfo` VALUES ('(\'d0b309c1e5c2d602b64f5451\',)', '(\'http://api.map.baidu.com/place/detail?uid=d0b309c1e5c2d602b64f5451&output=html&source=placeapi_v2\',)', '(\'一星级\',)', '(\'5.0\',)', '(\'5.0\',)', '(\'5.0\',)', '(\'5.0\',)', '(\'有可无线上网的公共区域 有可无线上网的公共区域 免费\',)', '(\'洗衣服务\',)', '(\'24小时热水 空调 电热水器 电视机 手动窗帘 床具:毯子或被子\',)', '2019-03-05 07:06:19.655507');
INSERT INTO `mymap_detailinfo` VALUES ('(\'d3840fa432e113bdca1b955b\',)', '(\'http://api.map.baidu.com/place/detail?uid=d3840fa432e113bdca1b955b&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'0.0\',)', '(\'0.0\',)', '(\'0.0\',)', '(\'0.0\',)', '(\'电梯 餐厅\',)', '(None,)', '(\'24小时热水 独立淋浴间 免费洗漱用品(6样以内) 浴室 客房WIFI覆盖\',)', '2019-03-05 06:15:53.097871');
INSERT INTO `mymap_detailinfo` VALUES ('(\'d39a4ef3f7dab2ba0e3dda34\',)', '(\'http://api.map.baidu.com/place/detail?uid=d39a4ef3f7dab2ba0e3dda34&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'4.8\',)', '(\'3.5\',)', '(\'4.0\',)', '(\'3.5\',)', '(\'停车场 免费停车场 有可无线上网的公共区域 有可无线上网的公共区域 免费\',)', '(None,)', '(\'24小时热水 电热水器 电视机 手动窗帘 床具:毯子或被子\',)', '2019-03-05 07:46:15.622039');
INSERT INTO `mymap_detailinfo` VALUES ('(\'d5d2b3792d200e366cc02ce5\',)', '(\'http://api.map.baidu.com/place/detail?uid=d5d2b3792d200e366cc02ce5&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'4.8\',)', '(\'4.7\',)', '(\'4.7\',)', '(\'4.6\',)', '(\'有可无线上网的公共区域 免费\',)', '(\'行李寄存 叫醒服务 24小时前台服务\',)', '(\'拖鞋 书桌 24小时热水 电热水壶 免费洗漱用品(6样以上) 独立淋浴间 空调 电视机 手动窗帘 床具:毯子或被子\',)', '2019-03-05 07:45:50.290193');
INSERT INTO `mymap_detailinfo` VALUES ('(\'d868418b6303ee065abbbc84\',)', '(\'http://api.map.baidu.com/place/detail?uid=d868418b6303ee065abbbc84&output=html&source=placeapi_v2\',)', '(\'舒适型\',)', '(\'4.5\',)', '(\'4.1\',)', '(\'4.5\',)', '(\'4.2\',)', '(\'中餐厅 前台贵重物品保险柜 免费停车场 免费旅游交通图(可赠送) 电梯 有可无线上网的公共区域 免费 大堂免费报纸 公共音响系统 非经营性客人休息区 公共区域闭路电视监控系统\',)', '(\'会议厅 送餐服务 行李寄存 叫醒服务 传真/复印 24小时前台服务 代客泊车 24小时大堂经理 外送洗衣服务\',)', '(\'拖鞋 书桌 24小时热水 电热水壶 免费瓶装水 浴衣 多种规格电源插座 浴缸 独立淋浴间 吹风机 空调 收费电影 有线频道 液晶电视机 针线包 220V电压插座 遮光窗帘 手动窗帘 床具:鸭绒被 床具:毯子或被子 免费洗漱用品(6样以内) 沙发 电子秤 房间内高速上网 淋浴 免费国内长途电话 客房WIFI覆盖免费\',)', '2019-03-05 07:46:42.285653');
INSERT INTO `mymap_detailinfo` VALUES ('(\'db49cb87aba1175ba4c7562e\',)', '(\'http://api.map.baidu.com/place/detail?uid=db49cb87aba1175ba4c7562e&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'4.3\',)', '(\'4.3\',)', '(\'4.3\',)', '(\'4.2\',)', '(\'前台贵重物品保险柜 免费停车场 电梯 有可无线上网的公共区域 免费\',)', '(\'行李寄存 24小时前台服务\',)', '(\'拖鞋 24小时热水 电热水壶 空调 电视机 手动窗帘 床具:毯子或被子 免费洗漱用品(6样以内) 电话 淋浴\',)', '2019-03-05 07:49:46.043148');
INSERT INTO `mymap_detailinfo` VALUES ('(\'deb1355c73caa95ec91b9531\',)', '(\'http://api.map.baidu.com/place/detail?uid=deb1355c73caa95ec91b9531&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'4.9\',)', '(\'3.9\',)', '(\'4.1\',)', '(\'4.0\',)', '(\'公共区域闭路电视监控系统\',)', '(\'邮政服务 叫醒服务 商务服务\',)', '(\'拖鞋 24小时热水 电热水壶 免费瓶装水 迷你吧 小冰箱 多种规格电源插座 独立淋浴间 吹风机 空调 有线频道 液晶电视机 220V电压插座 遮光窗帘 手动窗帘 床具:毯子或被子 免费洗漱用品(6样以内) 房间内高速上网 客房WIFI覆盖免费\',)', '2019-03-05 07:45:47.880379');
INSERT INTO `mymap_detailinfo` VALUES ('(\'ed87f70847b062b09ff77954\',)', '(\'http://api.map.baidu.com/place/detail?uid=ed87f70847b062b09ff77954&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'3.8\',)', '(\'4.3\',)', '(\'4.4\',)', '(\'4.2\',)', '(\'免费停车场 充电车位\',)', '(None,)', '(\'电视机 手动窗帘 床具:毯子或被子\',)', '2019-03-05 07:45:48.855568');
INSERT INTO `mymap_detailinfo` VALUES ('(\'ef1e99ad00360c7431f71d80\',)', '(\'http://api.map.baidu.com/place/detail?uid=ef1e99ad00360c7431f71d80&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'4.3\',)', '(\'4.7\',)', '(\'4.7\',)', '(\'4.6\',)', '(\'残疾人客房 免费停车场 电梯 有可无线上网的公共区域 免费 暖气 大堂免费报纸 无烟楼层 公共区域闭路电视监控系统 无充电车位\',)', '(\'叫车服务 行李寄存 叫醒服务 传真/复印 办理私人登记入住/退房手续 24小时前台服务 快速办理入住/退房手续 信用卡结算服务 一次性账单结算服务\',)', '(\'国内长途电话 拖鞋 书桌 24小时热水 电热水壶 免费洗漱用品(6样以上) 多种规格电源插座 独立淋浴间 空调 有线频道 液晶电视机 暖气 220V电压插座 遮光窗帘 手动窗帘 床具:毯子或被子 唤醒服务 公用吹风机 城景 传真 房间内高速上网 淋浴 客房WIFI覆盖免费\',)', '2019-03-05 14:44:08.374542');
INSERT INTO `mymap_detailinfo` VALUES ('(\'ef79bb42b6c0e836471a320b\',)', '(\'http://api.map.baidu.com/place/detail?uid=ef79bb42b6c0e836471a320b&output=html&source=placeapi_v2\',)', '(\'高档型\',)', '(\'4.8\',)', '(\'4.9\',)', '(\'4.8\',)', '(\'4.8\',)', '(\'西餐厅 前台贵重物品保险柜 免费停车场 电梯 有可无线上网的公共区域 免费 吸烟区 大堂免费报纸 多功能厅 公共音响系统 非经营性客人休息区 多媒体演示系统 公共区域闭路电视监控系统 无充电车位\',)', '(\'会议厅 旅游票务服务 洗衣服务 送餐服务 叫车服务 儿童乐园 邮政服务 行李寄存 叫醒服务 儿童看护 礼宾服务 干洗 传真/复印 熨衣服务 办理私人登记入住/退房手续 擦鞋服务 24小时前台服务 快速办理入住/退房手续 代客泊车 信用卡结算服务 一次性账单结算服务 部分时段大堂经理 商务服务 外送洗衣服务 中文服务 儿童餐 儿童拖鞋 儿童浴袍 儿童牙刷 儿童玩具\',)', '(\'拖鞋 书桌 浴室化妆放大镜 24小时热水 电热水壶 咖啡壶/茶壶 免费洗漱用品(6样以上) 免费瓶装水 迷你吧 小冰箱 浴衣 多种规格电源插座 110V电压插座 浴缸 独立淋浴间 吹风机 房内保险箱 空调 收费电影 有线频道 液晶电视机 电脑 衣柜/衣橱 针线包 220V电压插座 遮光窗帘 自动窗帘 备用床具 床具:鸭绒被 欢迎礼品 沙发 音响 免费报纸 开夜床 电子秤 房间内高速上网 电话 淋浴 客房WIFI覆盖免费 智能门锁 智能马桶 智能客控\',)', '2019-03-05 14:43:56.326948');
INSERT INTO `mymap_detailinfo` VALUES ('(\'f1ece4086b0bf962c27da292\',)', '(\'http://api.map.baidu.com/place/detail?uid=f1ece4086b0bf962c27da292&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'4.7\',)', '(\'4.7\',)', '(\'4.7\',)', '(\'4.7\',)', '(\'前台贵重物品保险柜 免费停车场 电梯 有可无线上网的公共区域 免费 大堂免费报纸 餐厅 非经营性客人休息区 无烟楼层 公共区域闭路电视监控系统\',)', '(\'行李寄存 叫醒服务 24小时前台服务 信用卡结算服务 部分时段大堂经理 外送洗衣服务\',)', '(\'国内长途电话 国际长途电话 拖鞋 24小时热水 电热水壶 免费洗漱用品(6样以上) 免费瓶装水 独立淋浴间 吹风机 空调 有线频道 液晶电视机 电视机 用餐区 针线包 单一规格电源插座 220V电压插座 遮光窗帘 手动窗帘 床具:毯子或被子 唤醒服务 浴室 城景 沙发 房间内高速上网 电话 淋浴\',)', '2019-03-05 14:44:19.037983');
INSERT INTO `mymap_detailinfo` VALUES ('(\'f8c2c03246c375255ed4fe04\',)', '(\'http://api.map.baidu.com/place/detail?uid=f8c2c03246c375255ed4fe04&output=html&source=placeapi_v2\',)', '(\'高档型\',)', '(\'4.5\',)', '(\'4.5\',)', '(\'4.5\',)', '(\'4.5\',)', '(\'中餐厅 残疾人客房 前台贵重物品保险柜 自动取款机 免费停车场 免费旅游交通图(可赠送) 大堂吧 电梯 有可无线上网的公共区域 免费 大堂免费报纸 多功能厅 公共音响系统 非经营性客人休息区 无烟楼层 行政楼层 多媒体演示系统 公共区域闭路电视监控系统\',)', '(\'会议厅 商务中心 洗衣服务 送餐服务 叫车服务 邮政服务 专职行李员 行李寄存 叫醒服务 租车服务 礼宾服务 干洗 熨衣服务 办理私人登记入住/退房手续 擦鞋服务 婚宴服务 24小时前台服务 快速办理入住/退房手续 信用卡结算服务 一次性账单结算服务 24小时大堂经理 外送洗衣服务\',)', '(\'国内长途电话 国际长途电话 拖鞋 书桌 浴室化妆放大镜 24小时热水 电热水壶 免费洗漱用品(6样以上) 免费瓶装水 迷你吧 小冰箱 浴衣 多种规格电源插座 110V电压插座 浴缸 独立淋浴间 吹风机 房内保险箱 空调 有线频道 卫星频道 液晶电视机 衣柜/衣橱 连通房 闹钟 针线包 220V电压插座 遮光窗帘 手动窗帘 坐卧两用长沙发 备用床具 床具:鸭绒被 唤醒服务 欢迎礼品 城景 湖景 享有风景 洗浴间电话 沙发 开夜床 电子秤 房间内高速上网 电话 客房WIFI覆盖免费\',)', '2019-03-05 07:47:09.051306');
INSERT INTO `mymap_detailinfo` VALUES ('(\'fbb38cbeeaad02ada11de9c3\',)', '(\'http://api.map.baidu.com/place/detail?uid=fbb38cbeeaad02ada11de9c3&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'0.0\',)', '(\'0.0\',)', '(\'0.0\',)', '(\'0.0\',)', '(\'暖气\',)', '(\'接站服务\',)', '(\'24小时热水 电视机 手动窗帘 床具:毯子或被子 客房WIFI覆盖\',)', '2019-03-05 07:46:48.882399');
INSERT INTO `mymap_detailinfo` VALUES ('(\'fe165ca74e2f3350d23ce393\',)', '(\'http://api.map.baidu.com/place/detail?uid=fe165ca74e2f3350d23ce393&output=html&source=placeapi_v2\',)', '(\'经济型\',)', '(\'4.2\',)', '(\'4.1\',)', '(\'4.0\',)', '(\'4.0\',)', '(\'中餐厅 商场 前台贵重物品保险柜 自动取款机 免费停车场 电梯 大堂免费报纸 多功能厅 非经营性客人休息区 公共区域闭路电视监控系统\',)', '(\'会议厅 洗衣服务 叫车服务 专职行李员 行李寄存 叫醒服务 租车服务 礼宾服务 干洗 熨衣服务 管家服务 专职门童 一次性账单结算服务 部分时段大堂经理 商务服务\',)', '(\'国内长途电话 国际长途电话 拖鞋 浴室化妆放大镜 电热水壶 免费瓶装水 多种规格电源插座 独立淋浴间 吹风机 空调 非24小时热水 电热水器 有线频道 卫星频道 液晶电视机 电视机 电脑 用餐区 衣柜/衣橱 闹钟 针线包 遮光窗帘 手动窗帘 无窗帘 坐卧两用长沙发 备用床具 床具:鸭绒被 床具:毯子或被子 唤醒服务 语音留言 免费洗漱用品(6样以内) 浴室 城景 享有风景 地标景 沙发 免费报纸 开夜床 电子秤 电话 淋浴\',)', '2019-03-05 07:47:11.635448');
INSERT INTO `mymap_detailinfo` VALUES ('1', '2', '2', '3', '5', '6', '4', '56', '55', '465', '2019-03-06 01:15:14.895550');
