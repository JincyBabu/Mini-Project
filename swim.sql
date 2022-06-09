/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50508
Source Host           : localhost:3306
Source Database       : swim

Target Server Type    : MYSQL
Target Server Version : 50508
File Encoding         : 65001

Date: 2022-03-01 23:31:31
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `apply`
-- ----------------------------
DROP TABLE IF EXISTS `apply`;
CREATE TABLE `apply` (
  `apid` int(11) NOT NULL AUTO_INCREMENT,
  `apdate` date DEFAULT NULL,
  `stid` int(11) NOT NULL,
  `coid` varchar(100) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `pstatus` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`apid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of apply
-- ----------------------------
INSERT INTO `apply` VALUES ('1', '2022-03-01', '1', 'sdfsdf', 'approved', 'Paid');

-- ----------------------------
-- Table structure for `att`
-- ----------------------------
DROP TABLE IF EXISTS `att`;
CREATE TABLE `att` (
  `atid` int(11) NOT NULL AUTO_INCREMENT,
  `stid` int(11) NOT NULL,
  `coid` varchar(100) NOT NULL,
  `adate` date DEFAULT NULL,
  `att` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`atid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of att
-- ----------------------------
INSERT INTO `att` VALUES ('1', '1', 'sdfsdf', '2022-03-01', 'present');

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add pmodel', '7', 'add_pmodel');
INSERT INTO `auth_permission` VALUES ('20', 'Can change pmodel', '7', 'change_pmodel');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete pmodel', '7', 'delete_pmodel');
INSERT INTO `auth_permission` VALUES ('22', 'Can add pmodel1', '8', 'add_pmodel1');
INSERT INTO `auth_permission` VALUES ('23', 'Can change pmodel1', '8', 'change_pmodel1');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete pmodel1', '8', 'delete_pmodel1');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_30a071c9_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `caid` varchar(20) NOT NULL,
  `canm` varchar(20) NOT NULL,
  `cades` varchar(100) NOT NULL,
  PRIMARY KEY (`caid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of category
-- ----------------------------

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `coid` varchar(30) NOT NULL,
  `cnm` varchar(20) NOT NULL,
  `cdes` varchar(100) NOT NULL,
  `cdur` varchar(20) NOT NULL,
  `cfee` int(10) NOT NULL,
  `ctype` varchar(20) NOT NULL,
  PRIMARY KEY (`coid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('sdfsdf', 'sdf', 'sdf', '32', '324', 'weekend');

-- ----------------------------
-- Table structure for `courseassign`
-- ----------------------------
DROP TABLE IF EXISTS `courseassign`;
CREATE TABLE `courseassign` (
  `asid` int(11) NOT NULL AUTO_INCREMENT,
  `coid` varchar(20) NOT NULL,
  `trid` varchar(20) NOT NULL,
  PRIMARY KEY (`asid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of courseassign
-- ----------------------------
INSERT INTO `courseassign` VALUES ('1', 'sdfsdf', '1');

-- ----------------------------
-- Table structure for `coursetime`
-- ----------------------------
DROP TABLE IF EXISTS `coursetime`;
CREATE TABLE `coursetime` (
  `timeid` int(11) NOT NULL AUTO_INCREMENT,
  `coid` varchar(20) NOT NULL,
  `time` time NOT NULL,
  `seat` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`timeid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of coursetime
-- ----------------------------
INSERT INTO `coursetime` VALUES ('1', 'sdfsdf', '22:27:00', '32');

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_5151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_1c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('7', 'swimapp', 'pmodel');
INSERT INTO `django_content_type` VALUES ('8', 'swimapp', 'pmodel1');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2022-02-27 12:16:41');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2022-02-27 12:16:44');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2022-02-27 12:16:45');
INSERT INTO `django_migrations` VALUES ('4', 'contenttypes', '0002_remove_content_type_name', '2022-02-27 12:16:45');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0002_alter_permission_name_max_length', '2022-02-27 12:16:46');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0003_alter_user_email_max_length', '2022-02-27 12:16:46');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0004_alter_user_username_opts', '2022-02-27 12:16:46');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0005_alter_user_last_login_null', '2022-02-27 12:16:46');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0006_require_contenttypes_0002', '2022-02-27 12:16:46');
INSERT INTO `django_migrations` VALUES ('10', 'sessions', '0001_initial', '2022-02-27 12:16:47');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('4aojpsl0hd90945dromz8guixrow69k1', 'MGY1NjBjZWIzN2U2NDRkYTUxOGQyMjdiOWI3ZmE5ODY5NjdlOWJkMjp7InVuYW1lIjoiYXNkQGFzZC5hc2QiLCJ1cGFzcyI6ImFzZGFzZGFzZCJ9', '2022-03-15 17:43:22');
INSERT INTO `django_session` VALUES ('8itw0600e66u7v01yb8goxeujcj6qy6j', 'NDJiNzVhY2IzODIzZmI4NjhhZjM2NmJjNDUzZTk3YjhjNzkwMDI5Mjp7InV0eXBlIjoiYWRtaW4iLCJ1bmFtZSI6ImFkbWluIiwidXBhc3MiOiJhZG1pbiIsInVpZCI6MH0=', '2022-03-13 17:44:07');
INSERT INTO `django_session` VALUES ('zxnb90ssdo537khoe4swjjm7fptpmbe3', 'YWY2MmI3NmQ3YTg5Y2MxMjM3MTEwZmZhMzQ1NWExYjllMTA3MDhhYjp7InVuYW1lIjoiYWRtaW4iLCJ1cGFzcyI6ImFkbWluIn0=', '2022-03-13 17:02:44');

-- ----------------------------
-- Table structure for `images`
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `imgid` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `img` varchar(100) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`imgid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of images
-- ----------------------------
INSERT INTO `images` VALUES ('3', '3', '0', 'uploads/adhamdannaway-128_2Q6a3eP_Wf2m91t.jpg', null);
INSERT INTO `images` VALUES ('4', '1', '0', 'uploads/brad_frost-128_wjpSWkW.jpg', null);
INSERT INTO `images` VALUES ('5', '0', '1', 'uploads/1s_YeJusW7_pZ0Jsbt.png', null);

-- ----------------------------
-- Table structure for `item`
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `itid` varchar(20) NOT NULL,
  `inm` varchar(20) NOT NULL,
  `caid` varchar(20) NOT NULL,
  `ides` varchar(1000) NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`itid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of item
-- ----------------------------

-- ----------------------------
-- Table structure for `login`
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `uid` int(11) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `upass` varchar(20) NOT NULL,
  `utype` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES ('0', 'admin@gmail.com', 'admin', 'admin');
INSERT INTO `login` VALUES ('1', 'asd@asd.asd', 'asdasdasd', 'trainer');
INSERT INTO `login` VALUES ('2', 'asd@asd.asd', 'asdasdasd', 'trainer');
INSERT INTO `login` VALUES ('3', 'xcv@xcv.xcv', 'xcvxcvxcv', 'trainer');
INSERT INTO `login` VALUES ('1', 'qwe@qwe.qwe', 'qweqweqwe', 'student');

-- ----------------------------
-- Table structure for `purchase`
-- ----------------------------
DROP TABLE IF EXISTS `purchase`;
CREATE TABLE `purchase` (
  `purid` int(11) NOT NULL AUTO_INCREMENT,
  `vid` int(11) NOT NULL,
  `dop` date NOT NULL,
  `tqty` int(11) NOT NULL,
  `tamt` int(11) NOT NULL,
  PRIMARY KEY (`purid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of purchase
-- ----------------------------

-- ----------------------------
-- Table structure for `purchaseitem`
-- ----------------------------
DROP TABLE IF EXISTS `purchaseitem`;
CREATE TABLE `purchaseitem` (
  `chpurid` int(11) NOT NULL AUTO_INCREMENT,
  `purid` int(11) NOT NULL,
  `itid` varchar(20) NOT NULL,
  `qty` int(11) NOT NULL,
  `amt` int(11) NOT NULL,
  PRIMARY KEY (`chpurid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of purchaseitem
-- ----------------------------

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `stid` int(30) NOT NULL AUTO_INCREMENT,
  `snm` varchar(20) NOT NULL,
  `shn` varchar(30) NOT NULL,
  `sp` varchar(30) NOT NULL,
  `sdir` varchar(30) NOT NULL,
  `spin` int(10) NOT NULL,
  `g` varchar(10) NOT NULL,
  `sdob` date NOT NULL,
  `sphn` varchar(10) NOT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`stid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', 'gfgfg hfdgf', 'jhgf', 'asd', 'asd', '567656', 'female', '2000-03-02', '5765676576', 'qwe@qwe.qwe', '');

-- ----------------------------
-- Table structure for `trainer`
-- ----------------------------
DROP TABLE IF EXISTS `trainer`;
CREATE TABLE `trainer` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `tnm` varchar(20) NOT NULL,
  `thn` varchar(30) NOT NULL,
  `tp` varchar(20) NOT NULL,
  `tdir` varchar(20) NOT NULL,
  `tpin` int(20) NOT NULL,
  `g` varchar(10) NOT NULL,
  `tdob` date NOT NULL,
  `tdoj` date NOT NULL,
  `tphn` varchar(15) NOT NULL,
  `mail` varchar(20) NOT NULL,
  `tq` varchar(30) NOT NULL,
  `img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of trainer
-- ----------------------------
INSERT INTO `trainer` VALUES ('1', 'Jai', 'Jai Bhavan', 'kochi', 'ernakulam', '123123', 'female', '1991-03-15', '2022-02-01', '5765676576', 'asd@asd.asd', 'asdf', '');
INSERT INTO `trainer` VALUES ('2', 'Jai', 'Jai Bhavan', 'kochi', 'ernakulam', '123123', 'female', '1991-03-15', '2022-02-01', '5765676576', 'asd@asd.asd', 'asdf', '');
INSERT INTO `trainer` VALUES ('3', 'xcv xcvxcv', 'xcvxcvxcv', 'df', 'sdf', '324123', 'female', '1987-03-09', '2022-04-06', '3423423423', 'xcv@xcv.xcv', 'sadf', '');

-- ----------------------------
-- Table structure for `vendor`
-- ----------------------------
DROP TABLE IF EXISTS `vendor`;
CREATE TABLE `vendor` (
  `vid` int(11) NOT NULL AUTO_INCREMENT,
  `vnm` varchar(20) NOT NULL,
  `onm` varchar(20) NOT NULL,
  `bnm` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `vdt` varchar(20) NOT NULL,
  `vstate` varchar(20) NOT NULL,
  `vpin` int(11) NOT NULL,
  `vnum` varchar(15) NOT NULL,
  `vmail` varchar(100) NOT NULL,
  PRIMARY KEY (`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of vendor
-- ----------------------------
