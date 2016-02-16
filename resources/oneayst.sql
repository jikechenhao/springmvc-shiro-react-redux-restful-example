/*
Navicat MySQL Data Transfer

Source Server         : 台式机
Source Server Version : 50710
Source Host           :
Source Database       : oneayst

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2016-02-17 00:29:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_apply
-- ----------------------------
DROP TABLE IF EXISTS `t_apply`;
CREATE TABLE `t_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apply_amount` int(11) NOT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `apply_user` varchar(45) DEFAULT NULL,
  `t_module_id` int(11) NOT NULL,
  `t_material_id` int(11) NOT NULL,
  `t_sp_id` int(11) NOT NULL,
  `serial_no` int(11) NOT NULL,
  `t_brand_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_t_manager_t_material1_idx` (`t_material_id`) USING BTREE,
  KEY `fk_t_manager_t_specification1_idx` (`t_sp_id`) USING BTREE,
  KEY `fk_t_manager_t_serial_no1_idx` (`serial_no`) USING BTREE,
  KEY `fk_t_manager_t_brand1_idx` (`t_brand_id`) USING BTREE,
  KEY `fk_t_manager_t_module1_idx` (`t_module_id`) USING BTREE,
  CONSTRAINT `fk_t_manager_t_brand1` FOREIGN KEY (`t_brand_id`) REFERENCES `t_brand` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_manager_t_material1` FOREIGN KEY (`t_material_id`) REFERENCES `t_material` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_manager_t_module` FOREIGN KEY (`t_module_id`) REFERENCES `t_module` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=562 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_apply
-- ----------------------------

-- ----------------------------
-- Table structure for t_brand
-- ----------------------------
DROP TABLE IF EXISTS `t_brand`;
CREATE TABLE `t_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(45) NOT NULL,
  `t_project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_projecct_id_idx` (`t_project_id`) USING BTREE,
  CONSTRAINT `fk_t_brand_1` FOREIGN KEY (`t_project_id`) REFERENCES `t_project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_brand
-- ----------------------------
INSERT INTO `t_brand` VALUES ('188', '未知', '69');

-- ----------------------------
-- Table structure for t_err_log
-- ----------------------------
DROP TABLE IF EXISTS `t_err_log`;
CREATE TABLE `t_err_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(16) DEFAULT NULL,
  `host` varchar(45) DEFAULT NULL,
  `method_name` varchar(100) DEFAULT NULL,
  `exception` varchar(300) DEFAULT NULL,
  `occur_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_err_log
-- ----------------------------
INSERT INTO `t_err_log` VALUES ('5', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.deleteModule', 'java.lang.RuntimeException:java.lang.RuntimeException: 删除密码错误', '2016-01-26 21:40:36');
INSERT INTO `t_err_log` VALUES ('6', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.deleteModule', 'java.lang.Exception: 删除密码错误', '2016-01-26 22:06:47');
INSERT INTO `t_err_log` VALUES ('7', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.deleteModule', 'java.lang.Exception: 删除密码错误', '2016-01-26 22:13:36');
INSERT INTO `t_err_log` VALUES ('8', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.deleteModule', 'java.lang.RuntimeException: java.lang.Exception', '2016-01-26 22:24:09');
INSERT INTO `t_err_log` VALUES ('9', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.deleteMaterial', 'java.lang.Exception: 删材料除失败, 有记录正在使用该材料或者该材料有规格型号未删除', '2016-01-27 13:48:33');
INSERT INTO `t_err_log` VALUES ('10', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.deleteModule', 'java.lang.Exception: 删除密码错误', '2016-01-27 13:49:03');
INSERT INTO `t_err_log` VALUES ('11', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.BrandController.deleteBrand', 'java.lang.Exception: 删除品牌失败, 有记录正在使用该品牌', '2016-01-27 13:55:43');
INSERT INTO `t_err_log` VALUES ('12', 'admin', '192.168.1.201', 'cn.oneayst.controller.BrandController.deleteBrand', 'java.lang.Exception: 删除品牌失败, 有记录正在使用该品牌', '2016-01-27 13:56:52');
INSERT INTO `t_err_log` VALUES ('13', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', 'java.lang.Exception: 创建项目失败', '2016-01-30 17:03:15');
INSERT INTO `t_err_log` VALUES ('14', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', 'java.lang.Exception: 删除密码错误', '2016-01-30 21:46:57');
INSERT INTO `t_err_log` VALUES ('15', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', 'org.apache.shiro.authc.UnknownAccountException: 账号或密码错误', '2016-01-31 00:28:39');
INSERT INTO `t_err_log` VALUES ('16', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', 'org.apache.shiro.authc.UnknownAccountException: 账号或密码错误', '2016-01-31 00:28:50');
INSERT INTO `t_err_log` VALUES ('17', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', 'org.apache.shiro.authc.UnknownAccountException: 账号或密码错误', '2016-01-31 00:30:01');
INSERT INTO `t_err_log` VALUES ('18', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', 'org.apache.shiro.authc.UnknownAccountException: 账号或密码错误', '2016-01-31 00:32:52');
INSERT INTO `t_err_log` VALUES ('19', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', 'org.apache.shiro.authc.UnknownAccountException: 账号或密码错误', '2016-01-31 00:35:31');
INSERT INTO `t_err_log` VALUES ('20', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', 'java.lang.Exception: 请先设置删除密码', '2016-01-31 00:39:15');
INSERT INTO `t_err_log` VALUES ('21', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', 'java.lang.Exception: 删除密码错误', '2016-01-31 00:39:31');
INSERT INTO `t_err_log` VALUES ('22', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', 'java.lang.Exception: 删除密码错误', '2016-01-31 14:54:07');
INSERT INTO `t_err_log` VALUES ('23', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', 'java.lang.Exception: 删除密码错误', '2016-01-31 14:54:12');
INSERT INTO `t_err_log` VALUES ('24', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', 'java.lang.Exception: 删除密码错误', '2016-01-31 17:47:28');
INSERT INTO `t_err_log` VALUES ('25', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', 'java.lang.Exception: 删除密码错误', '2016-02-12 23:48:21');
INSERT INTO `t_err_log` VALUES ('26', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', 'java.lang.Exception: 删除密码错误', '2016-02-13 00:33:03');
INSERT INTO `t_err_log` VALUES ('27', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', 'java.lang.Exception: 删除密码错误', '2016-02-13 16:24:46');
INSERT INTO `t_err_log` VALUES ('28', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.deleteModule', 'java.lang.Exception: 删除密码错误', '2016-02-13 16:58:03');
INSERT INTO `t_err_log` VALUES ('29', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', 'java.lang.Exception: 删除密码错误', '2016-02-14 16:08:19');
INSERT INTO `t_err_log` VALUES ('30', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.BrandController.deleteBrand', 'java.lang.Exception: 删除品牌失败, 有记录正在使用该品牌', '2016-02-14 17:26:44');
INSERT INTO `t_err_log` VALUES ('31', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.BrandController.deleteBrand', 'java.lang.Exception: 删除品牌失败, 有记录正在使用该品牌', '2016-02-14 17:26:48');
INSERT INTO `t_err_log` VALUES ('32', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.updateUser', 'org.apache.shiro.authc.UnknownAccountException: 账号或密码错误', '2016-02-14 17:42:36');
INSERT INTO `t_err_log` VALUES ('33', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.updateUser', 'java.lang.Exception: 原来密码错误', '2016-02-14 17:44:16');
INSERT INTO `t_err_log` VALUES ('34', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.updateUser', 'java.lang.Exception: 原来密码错误', '2016-02-14 17:44:25');
INSERT INTO `t_err_log` VALUES ('35', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.updateUser', 'java.lang.Exception: 原来密码错误', '2016-02-14 17:44:29');
INSERT INTO `t_err_log` VALUES ('36', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.updateUser', 'java.lang.Exception: 原来密码错误', '2016-02-14 17:45:25');
INSERT INTO `t_err_log` VALUES ('37', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.updateUser', 'java.lang.Exception: 原来密码错误', '2016-02-14 17:45:55');
INSERT INTO `t_err_log` VALUES ('38', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.updateUser', 'java.lang.Exception: 原来密码错误', '2016-02-14 17:48:02');
INSERT INTO `t_err_log` VALUES ('39', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', 'java.lang.Exception: 删除密码错误', '2016-02-14 17:48:16');
INSERT INTO `t_err_log` VALUES ('40', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.deleteMaterial', 'java.lang.Exception: 删材料除失败, 有记录正在使用该材料或者该材料有规格型号未删除', '2016-02-15 00:31:46');
INSERT INTO `t_err_log` VALUES ('41', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.deleteMaterial', 'java.lang.Exception: 删材料除失败, 有记录正在使用该材料或者该材料有规格型号未删除', '2016-02-16 00:59:22');
INSERT INTO `t_err_log` VALUES ('42', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.deleteMaterial', 'java.lang.Exception: 删材料除失败, 有记录正在使用该材料或者该材料有规格型号未删除', '2016-02-16 00:59:29');
INSERT INTO `t_err_log` VALUES ('43', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.BrandController.deleteBrand', 'java.lang.Exception: 删除品牌失败, 有记录正在使用该品牌', '2016-02-16 01:00:20');
INSERT INTO `t_err_log` VALUES ('44', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.updateUser', 'java.lang.Exception: 原来密码错误', '2016-02-16 01:00:36');
INSERT INTO `t_err_log` VALUES ('45', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', 'java.lang.Exception: 删除密码错误', '2016-02-16 01:00:47');
INSERT INTO `t_err_log` VALUES ('46', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', 'java.lang.Exception: 无能删除记录\n采购部已经有相应采购记录或者已填写到货量', '2016-02-16 01:46:30');
INSERT INTO `t_err_log` VALUES ('47', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', 'java.lang.Exception: 无能删除记录\n采购部已经有相应采购记录或者已填写到货量', '2016-02-16 01:46:38');
INSERT INTO `t_err_log` VALUES ('48', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', 'java.lang.Exception: 无能删除记录\n采购部已经有相应采购记录或者已填写到货量', '2016-02-16 01:46:48');
INSERT INTO `t_err_log` VALUES ('49', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', 'java.lang.Exception: 无能删除记录\n采购部已经有相应采购记录或者已填写到货量', '2016-02-16 01:47:35');
INSERT INTO `t_err_log` VALUES ('50', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', 'java.lang.Exception: 无能删除记录\n采购部已经有相应采购记录或者已填写到货量', '2016-02-16 01:49:42');
INSERT INTO `t_err_log` VALUES ('51', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', 'java.lang.Exception: 删除密码错误', '2016-02-17 00:25:50');

-- ----------------------------
-- Table structure for t_login_log
-- ----------------------------
DROP TABLE IF EXISTS `t_login_log`;
CREATE TABLE `t_login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(16) DEFAULT NULL,
  `host` varchar(45) DEFAULT NULL,
  `occur_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=450 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_login_log
-- ----------------------------
INSERT INTO `t_login_log` VALUES ('1', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 21:45:09', '登陆成功');
INSERT INTO `t_login_log` VALUES ('2', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:01:19', '登陆成功');
INSERT INTO `t_login_log` VALUES ('3', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:01:23', '登陆成功');
INSERT INTO `t_login_log` VALUES ('4', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:01:24', '登陆成功');
INSERT INTO `t_login_log` VALUES ('5', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:01:28', '登陆成功');
INSERT INTO `t_login_log` VALUES ('6', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:01:56', '登陆成功');
INSERT INTO `t_login_log` VALUES ('7', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:02:26', '登陆成功');
INSERT INTO `t_login_log` VALUES ('8', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:09:53', '登陆成功');
INSERT INTO `t_login_log` VALUES ('9', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:10:21', '登陆成功');
INSERT INTO `t_login_log` VALUES ('10', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:10:39', '登陆成功');
INSERT INTO `t_login_log` VALUES ('11', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:10:42', '登陆成功');
INSERT INTO `t_login_log` VALUES ('12', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:11:01', '登陆成功');
INSERT INTO `t_login_log` VALUES ('13', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:11:15', '登陆成功');
INSERT INTO `t_login_log` VALUES ('14', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:11:16', '登陆成功');
INSERT INTO `t_login_log` VALUES ('15', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:11:23', '登陆成功');
INSERT INTO `t_login_log` VALUES ('16', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:11:25', '登陆成功');
INSERT INTO `t_login_log` VALUES ('17', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:11:27', '登陆成功');
INSERT INTO `t_login_log` VALUES ('18', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:18:22', '登陆成功');
INSERT INTO `t_login_log` VALUES ('19', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:18:25', '登陆成功');
INSERT INTO `t_login_log` VALUES ('20', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:18:35', '登陆成功');
INSERT INTO `t_login_log` VALUES ('21', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:18:36', '登陆成功');
INSERT INTO `t_login_log` VALUES ('22', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:18:39', '登陆成功');
INSERT INTO `t_login_log` VALUES ('23', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:18:43', '登陆成功');
INSERT INTO `t_login_log` VALUES ('24', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:18:45', '登陆成功');
INSERT INTO `t_login_log` VALUES ('25', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:19:24', '登陆成功');
INSERT INTO `t_login_log` VALUES ('26', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:19:26', '登陆成功');
INSERT INTO `t_login_log` VALUES ('27', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:19:28', '登陆成功');
INSERT INTO `t_login_log` VALUES ('28', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:19:53', '登陆成功');
INSERT INTO `t_login_log` VALUES ('29', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:19:55', '登陆成功');
INSERT INTO `t_login_log` VALUES ('30', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:19:57', '登陆成功');
INSERT INTO `t_login_log` VALUES ('31', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:19:58', '登陆成功');
INSERT INTO `t_login_log` VALUES ('32', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:20:01', '登陆成功');
INSERT INTO `t_login_log` VALUES ('33', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:20:42', '登陆成功');
INSERT INTO `t_login_log` VALUES ('34', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:20:45', '登陆成功');
INSERT INTO `t_login_log` VALUES ('35', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:20:47', '登陆成功');
INSERT INTO `t_login_log` VALUES ('36', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:20:49', '登陆成功');
INSERT INTO `t_login_log` VALUES ('37', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:20:50', '登陆成功');
INSERT INTO `t_login_log` VALUES ('38', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:24:46', '登陆成功');
INSERT INTO `t_login_log` VALUES ('39', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:25:21', '登陆成功');
INSERT INTO `t_login_log` VALUES ('40', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:25:37', '登陆成功');
INSERT INTO `t_login_log` VALUES ('41', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:26:38', '登陆成功');
INSERT INTO `t_login_log` VALUES ('42', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:27:18', '登陆成功');
INSERT INTO `t_login_log` VALUES ('43', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:36:03', '登陆成功');
INSERT INTO `t_login_log` VALUES ('44', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:43:43', '登陆成功');
INSERT INTO `t_login_log` VALUES ('45', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:45:28', '登陆成功');
INSERT INTO `t_login_log` VALUES ('46', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:48:02', '登陆成功');
INSERT INTO `t_login_log` VALUES ('47', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-27 22:49:42', '登陆成功');
INSERT INTO `t_login_log` VALUES ('48', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 10:18:53', '登陆成功');
INSERT INTO `t_login_log` VALUES ('49', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 10:33:22', '登陆成功');
INSERT INTO `t_login_log` VALUES ('50', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 10:37:56', '登陆成功');
INSERT INTO `t_login_log` VALUES ('51', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 10:44:26', '登陆成功');
INSERT INTO `t_login_log` VALUES ('52', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 10:48:32', '登陆成功');
INSERT INTO `t_login_log` VALUES ('53', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:12:11', '登陆成功');
INSERT INTO `t_login_log` VALUES ('54', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:17:06', '登陆成功');
INSERT INTO `t_login_log` VALUES ('55', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:22:27', '登陆成功');
INSERT INTO `t_login_log` VALUES ('56', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:23:09', '登陆成功');
INSERT INTO `t_login_log` VALUES ('57', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:23:15', '登陆成功');
INSERT INTO `t_login_log` VALUES ('58', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:23:17', '登陆成功');
INSERT INTO `t_login_log` VALUES ('59', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:23:20', '登陆成功');
INSERT INTO `t_login_log` VALUES ('60', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:23:22', '登陆成功');
INSERT INTO `t_login_log` VALUES ('61', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:23:23', '登陆成功');
INSERT INTO `t_login_log` VALUES ('62', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:24:38', '登陆成功');
INSERT INTO `t_login_log` VALUES ('63', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:24:40', '登陆成功');
INSERT INTO `t_login_log` VALUES ('64', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:24:42', '登陆成功');
INSERT INTO `t_login_log` VALUES ('65', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:24:46', '登陆成功');
INSERT INTO `t_login_log` VALUES ('66', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:24:48', '登陆成功');
INSERT INTO `t_login_log` VALUES ('67', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:27:20', '登陆成功');
INSERT INTO `t_login_log` VALUES ('68', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:27:56', '登陆成功');
INSERT INTO `t_login_log` VALUES ('69', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:28:17', '登陆成功');
INSERT INTO `t_login_log` VALUES ('70', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:34:38', '登陆成功');
INSERT INTO `t_login_log` VALUES ('71', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:34:42', '登陆成功');
INSERT INTO `t_login_log` VALUES ('72', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:34:44', '登陆成功');
INSERT INTO `t_login_log` VALUES ('73', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:34:46', '登陆成功');
INSERT INTO `t_login_log` VALUES ('74', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:34:48', '登陆成功');
INSERT INTO `t_login_log` VALUES ('75', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:40:21', '登陆成功');
INSERT INTO `t_login_log` VALUES ('76', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:40:23', '登陆成功');
INSERT INTO `t_login_log` VALUES ('77', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:40:25', '登陆成功');
INSERT INTO `t_login_log` VALUES ('78', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:40:26', '登陆成功');
INSERT INTO `t_login_log` VALUES ('79', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:40:28', '登陆成功');
INSERT INTO `t_login_log` VALUES ('80', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:40:30', '登陆成功');
INSERT INTO `t_login_log` VALUES ('81', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:40:32', '登陆成功');
INSERT INTO `t_login_log` VALUES ('82', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:40:33', '登陆成功');
INSERT INTO `t_login_log` VALUES ('83', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:40:36', '登陆成功');
INSERT INTO `t_login_log` VALUES ('84', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:40:38', '登陆成功');
INSERT INTO `t_login_log` VALUES ('85', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:42:02', '登陆成功');
INSERT INTO `t_login_log` VALUES ('86', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:42:16', '登陆成功');
INSERT INTO `t_login_log` VALUES ('87', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:42:29', '登陆成功');
INSERT INTO `t_login_log` VALUES ('88', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:42:30', '登陆成功');
INSERT INTO `t_login_log` VALUES ('89', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:42:32', '登陆成功');
INSERT INTO `t_login_log` VALUES ('90', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:42:33', '登陆成功');
INSERT INTO `t_login_log` VALUES ('91', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:42:35', '登陆成功');
INSERT INTO `t_login_log` VALUES ('92', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:42:36', '登陆成功');
INSERT INTO `t_login_log` VALUES ('93', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:42:38', '登陆成功');
INSERT INTO `t_login_log` VALUES ('94', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:42:40', '登陆成功');
INSERT INTO `t_login_log` VALUES ('95', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:45:16', '登陆成功');
INSERT INTO `t_login_log` VALUES ('96', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:45:19', '登陆成功');
INSERT INTO `t_login_log` VALUES ('97', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:45:20', '登陆成功');
INSERT INTO `t_login_log` VALUES ('98', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:45:23', '登陆成功');
INSERT INTO `t_login_log` VALUES ('99', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:45:25', '登陆成功');
INSERT INTO `t_login_log` VALUES ('100', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:45:27', '登陆成功');
INSERT INTO `t_login_log` VALUES ('101', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:45:28', '登陆成功');
INSERT INTO `t_login_log` VALUES ('102', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:45:30', '登陆成功');
INSERT INTO `t_login_log` VALUES ('103', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:58:40', '登陆成功');
INSERT INTO `t_login_log` VALUES ('104', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:58:45', '登陆成功');
INSERT INTO `t_login_log` VALUES ('105', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:58:47', '登陆成功');
INSERT INTO `t_login_log` VALUES ('106', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:58:50', '登陆成功');
INSERT INTO `t_login_log` VALUES ('107', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:58:52', '登陆成功');
INSERT INTO `t_login_log` VALUES ('108', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:58:54', '登陆成功');
INSERT INTO `t_login_log` VALUES ('109', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:58:56', '登陆成功');
INSERT INTO `t_login_log` VALUES ('110', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 11:59:11', '登陆成功');
INSERT INTO `t_login_log` VALUES ('111', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:05:31', '登陆成功');
INSERT INTO `t_login_log` VALUES ('112', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:05:33', '登陆成功');
INSERT INTO `t_login_log` VALUES ('113', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:05:35', '登陆成功');
INSERT INTO `t_login_log` VALUES ('114', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:05:37', '登陆成功');
INSERT INTO `t_login_log` VALUES ('115', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:05:38', '登陆成功');
INSERT INTO `t_login_log` VALUES ('116', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:06:27', '登陆成功');
INSERT INTO `t_login_log` VALUES ('117', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:06:33', '登陆成功');
INSERT INTO `t_login_log` VALUES ('118', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:06:58', '登陆成功');
INSERT INTO `t_login_log` VALUES ('119', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:07:02', '登陆成功');
INSERT INTO `t_login_log` VALUES ('120', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:07:04', '登陆成功');
INSERT INTO `t_login_log` VALUES ('121', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:07:07', '登陆成功');
INSERT INTO `t_login_log` VALUES ('122', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:07:09', '登陆成功');
INSERT INTO `t_login_log` VALUES ('123', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:07:10', '登陆成功');
INSERT INTO `t_login_log` VALUES ('124', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:07:12', '登陆成功');
INSERT INTO `t_login_log` VALUES ('125', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:07:13', '登陆成功');
INSERT INTO `t_login_log` VALUES ('126', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:09:04', '登陆成功');
INSERT INTO `t_login_log` VALUES ('127', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:13:36', '登陆成功');
INSERT INTO `t_login_log` VALUES ('128', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:14:14', '登陆成功');
INSERT INTO `t_login_log` VALUES ('129', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:14:18', '登陆成功');
INSERT INTO `t_login_log` VALUES ('130', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:14:20', '登陆成功');
INSERT INTO `t_login_log` VALUES ('131', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:14:25', '登陆成功');
INSERT INTO `t_login_log` VALUES ('132', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:14:27', '登陆成功');
INSERT INTO `t_login_log` VALUES ('133', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:14:32', '登陆成功');
INSERT INTO `t_login_log` VALUES ('134', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:14:34', '登陆成功');
INSERT INTO `t_login_log` VALUES ('135', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:14:36', '登陆成功');
INSERT INTO `t_login_log` VALUES ('136', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:14:38', '登陆成功');
INSERT INTO `t_login_log` VALUES ('137', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:14:41', '登陆成功');
INSERT INTO `t_login_log` VALUES ('138', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:16:04', '登陆成功');
INSERT INTO `t_login_log` VALUES ('139', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:16:05', '登陆成功');
INSERT INTO `t_login_log` VALUES ('140', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:16:07', '登陆成功');
INSERT INTO `t_login_log` VALUES ('141', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:16:19', '登陆成功');
INSERT INTO `t_login_log` VALUES ('142', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:16:20', '登陆成功');
INSERT INTO `t_login_log` VALUES ('143', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:16:22', '登陆成功');
INSERT INTO `t_login_log` VALUES ('144', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:16:32', '登陆成功');
INSERT INTO `t_login_log` VALUES ('145', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:16:34', '登陆成功');
INSERT INTO `t_login_log` VALUES ('146', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:16:36', '登陆成功');
INSERT INTO `t_login_log` VALUES ('147', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:16:37', '登陆成功');
INSERT INTO `t_login_log` VALUES ('148', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:16:40', '登陆成功');
INSERT INTO `t_login_log` VALUES ('149', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:23:23', '登陆成功');
INSERT INTO `t_login_log` VALUES ('150', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:23:32', '登陆成功');
INSERT INTO `t_login_log` VALUES ('151', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:23:34', '登陆成功');
INSERT INTO `t_login_log` VALUES ('152', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:23:35', '登陆成功');
INSERT INTO `t_login_log` VALUES ('153', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:23:36', '登陆成功');
INSERT INTO `t_login_log` VALUES ('154', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:23:38', '登陆成功');
INSERT INTO `t_login_log` VALUES ('155', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 12:23:40', '登陆成功');
INSERT INTO `t_login_log` VALUES ('156', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 17:27:23', '登陆成功');
INSERT INTO `t_login_log` VALUES ('157', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 17:29:37', '登陆成功');
INSERT INTO `t_login_log` VALUES ('158', '未登录', '0:0:0:0:0:0:0:1', '2016-01-28 17:49:25', '登陆成功');
INSERT INTO `t_login_log` VALUES ('159', '未登录', '0:0:0:0:0:0:0:1', '2016-01-28 17:49:30', '登陆成功');
INSERT INTO `t_login_log` VALUES ('160', '未登录', '0:0:0:0:0:0:0:1', '2016-01-28 17:49:32', '登陆成功');
INSERT INTO `t_login_log` VALUES ('161', '未登录', '0:0:0:0:0:0:0:1', '2016-01-28 17:49:34', '登陆成功');
INSERT INTO `t_login_log` VALUES ('162', '未登录', '0:0:0:0:0:0:0:1', '2016-01-28 17:49:36', '登陆成功');
INSERT INTO `t_login_log` VALUES ('163', '未登录', '0:0:0:0:0:0:0:1', '2016-01-28 17:49:37', '登陆成功');
INSERT INTO `t_login_log` VALUES ('164', '未登录', '0:0:0:0:0:0:0:1', '2016-01-28 17:49:39', '登陆成功');
INSERT INTO `t_login_log` VALUES ('165', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:04:03', '登陆成功');
INSERT INTO `t_login_log` VALUES ('166', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:04:06', '登陆成功');
INSERT INTO `t_login_log` VALUES ('167', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:04:08', '登陆成功');
INSERT INTO `t_login_log` VALUES ('168', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:04:09', '登陆成功');
INSERT INTO `t_login_log` VALUES ('169', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:04:11', '登陆成功');
INSERT INTO `t_login_log` VALUES ('170', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:04:13', '登陆成功');
INSERT INTO `t_login_log` VALUES ('171', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:04:14', '登陆成功');
INSERT INTO `t_login_log` VALUES ('172', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:04:27', '登陆成功');
INSERT INTO `t_login_log` VALUES ('173', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:09:18', '登陆成功');
INSERT INTO `t_login_log` VALUES ('174', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:09:20', '登陆成功');
INSERT INTO `t_login_log` VALUES ('175', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:09:22', '登陆成功');
INSERT INTO `t_login_log` VALUES ('176', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:09:23', '登陆成功');
INSERT INTO `t_login_log` VALUES ('177', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:09:25', '登陆成功');
INSERT INTO `t_login_log` VALUES ('178', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:09:26', '登陆成功');
INSERT INTO `t_login_log` VALUES ('179', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:09:28', '登陆成功');
INSERT INTO `t_login_log` VALUES ('180', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:09:29', '登陆成功');
INSERT INTO `t_login_log` VALUES ('181', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:30:18', '登陆成功');
INSERT INTO `t_login_log` VALUES ('182', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:30:24', '登陆成功');
INSERT INTO `t_login_log` VALUES ('183', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:30:26', '登陆成功');
INSERT INTO `t_login_log` VALUES ('184', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:30:29', '登陆成功');
INSERT INTO `t_login_log` VALUES ('185', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:30:31', '登陆成功');
INSERT INTO `t_login_log` VALUES ('186', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:30:33', '登陆成功');
INSERT INTO `t_login_log` VALUES ('187', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:30:35', '登陆成功');
INSERT INTO `t_login_log` VALUES ('188', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:30:37', '登陆成功');
INSERT INTO `t_login_log` VALUES ('189', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:30:51', '登陆成功');
INSERT INTO `t_login_log` VALUES ('190', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:30:57', '登陆成功');
INSERT INTO `t_login_log` VALUES ('191', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:30:59', '登陆成功');
INSERT INTO `t_login_log` VALUES ('192', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:31:00', '登陆成功');
INSERT INTO `t_login_log` VALUES ('193', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:31:01', '登陆成功');
INSERT INTO `t_login_log` VALUES ('194', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:31:03', '登陆成功');
INSERT INTO `t_login_log` VALUES ('195', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:31:04', '登陆成功');
INSERT INTO `t_login_log` VALUES ('196', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:31:06', '登陆成功');
INSERT INTO `t_login_log` VALUES ('197', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:32:54', '登陆成功');
INSERT INTO `t_login_log` VALUES ('198', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:33:02', '登陆成功');
INSERT INTO `t_login_log` VALUES ('199', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:33:04', '登陆成功');
INSERT INTO `t_login_log` VALUES ('200', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:33:05', '登陆成功');
INSERT INTO `t_login_log` VALUES ('201', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:33:07', '登陆成功');
INSERT INTO `t_login_log` VALUES ('202', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-28 18:33:08', '登陆成功');
INSERT INTO `t_login_log` VALUES ('203', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-30 16:48:04', '登陆成功');
INSERT INTO `t_login_log` VALUES ('204', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-30 16:48:14', '登陆成功');
INSERT INTO `t_login_log` VALUES ('205', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-30 16:48:16', '登陆成功');
INSERT INTO `t_login_log` VALUES ('206', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-30 16:48:18', '登陆成功');
INSERT INTO `t_login_log` VALUES ('207', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-30 16:48:20', '登陆成功');
INSERT INTO `t_login_log` VALUES ('208', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-30 16:48:23', '登陆成功');
INSERT INTO `t_login_log` VALUES ('209', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-30 16:48:25', '登陆成功');
INSERT INTO `t_login_log` VALUES ('210', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-30 16:48:27', '登陆成功');
INSERT INTO `t_login_log` VALUES ('211', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-30 16:48:28', '登陆成功');
INSERT INTO `t_login_log` VALUES ('212', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-30 16:48:30', '登陆成功');
INSERT INTO `t_login_log` VALUES ('213', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-30 16:58:10', '登陆成功');
INSERT INTO `t_login_log` VALUES ('214', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-30 16:59:33', '登陆成功');
INSERT INTO `t_login_log` VALUES ('215', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-30 17:00:47', '登陆成功');
INSERT INTO `t_login_log` VALUES ('216', 'bossboss', '0:0:0:0:0:0:0:1', '2016-01-30 17:01:20', '登陆成功');
INSERT INTO `t_login_log` VALUES ('217', 'admin', '0:0:0:0:0:0:0:1', '2016-01-30 17:01:37', '登陆成功');
INSERT INTO `t_login_log` VALUES ('218', 'admin', '0:0:0:0:0:0:0:1', '2016-01-30 21:46:43', '登陆成功');
INSERT INTO `t_login_log` VALUES ('219', 'admin', '0:0:0:0:0:0:0:1', '2016-01-31 00:28:31', '登陆成功');
INSERT INTO `t_login_log` VALUES ('220', 'admin', '0:0:0:0:0:0:0:1', '2016-01-31 00:31:08', '登陆成功');
INSERT INTO `t_login_log` VALUES ('221', 'admin', '0:0:0:0:0:0:0:1', '2016-01-31 00:35:17', '登陆成功');
INSERT INTO `t_login_log` VALUES ('222', 'admin', '0:0:0:0:0:0:0:1', '2016-01-31 00:39:11', '登陆成功');
INSERT INTO `t_login_log` VALUES ('223', '未登录', '0:0:0:0:0:0:0:1', '2016-01-31 13:55:16', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('224', 'admin', '0:0:0:0:0:0:0:1', '2016-01-31 13:57:48', '登陆成功');
INSERT INTO `t_login_log` VALUES ('225', 'admin', '0:0:0:0:0:0:0:1', '2016-01-31 13:58:39', '登陆成功');
INSERT INTO `t_login_log` VALUES ('226', 'admin', '0:0:0:0:0:0:0:1', '2016-01-31 13:59:56', '登陆成功');
INSERT INTO `t_login_log` VALUES ('227', 'admin', '0:0:0:0:0:0:0:1', '2016-01-31 14:48:22', '登陆成功');
INSERT INTO `t_login_log` VALUES ('228', 'admin', '0:0:0:0:0:0:0:1', '2016-01-31 15:57:54', '登陆成功');
INSERT INTO `t_login_log` VALUES ('229', '未登录', '0:0:0:0:0:0:0:1', '2016-01-31 15:57:59', '请输入账号密码');
INSERT INTO `t_login_log` VALUES ('230', '未登录', '0:0:0:0:0:0:0:1', '2016-01-31 16:16:54', '密码错误次数过多, 请5分钟后重试');
INSERT INTO `t_login_log` VALUES ('231', '未登录', '0:0:0:0:0:0:0:1', '2016-01-31 16:18:33', '密码错误次数过多, 请5分钟后重试');
INSERT INTO `t_login_log` VALUES ('232', '未登录', '0:0:0:0:0:0:0:1', '2016-01-31 16:20:27', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('233', 'admin', '0:0:0:0:0:0:0:1', '2016-01-31 16:28:50', '登陆成功');
INSERT INTO `t_login_log` VALUES ('234', '未登录', '0:0:0:0:0:0:0:1', '2016-01-31 16:28:54', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('235', 'projectmanager', '0:0:0:0:0:0:0:1', '2016-01-31 16:29:07', '登陆成功');
INSERT INTO `t_login_log` VALUES ('236', '未登录', '0:0:0:0:0:0:0:1', '2016-01-31 16:29:18', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('237', 'projectmanager', '0:0:0:0:0:0:0:1', '2016-01-31 16:29:37', '登陆成功');
INSERT INTO `t_login_log` VALUES ('238', 'projectmanager', '0:0:0:0:0:0:0:1', '2016-01-31 16:54:34', '登陆成功');
INSERT INTO `t_login_log` VALUES ('239', 'admin', '0:0:0:0:0:0:0:1', '2016-01-31 17:25:29', '登陆成功');
INSERT INTO `t_login_log` VALUES ('240', 'admin', '0:0:0:0:0:0:0:1', '2016-01-31 17:35:47', '登陆成功');
INSERT INTO `t_login_log` VALUES ('241', 'admin', '0:0:0:0:0:0:0:1', '2016-01-31 17:43:17', '登陆成功');
INSERT INTO `t_login_log` VALUES ('242', 'admin', '0:0:0:0:0:0:0:1', '2016-01-31 17:46:35', '登陆成功');
INSERT INTO `t_login_log` VALUES ('243', 'admin', '0:0:0:0:0:0:0:1', '2016-01-31 17:46:52', '登陆成功');
INSERT INTO `t_login_log` VALUES ('244', 'admin', '0:0:0:0:0:0:0:1', '2016-01-31 17:48:09', '登陆成功');
INSERT INTO `t_login_log` VALUES ('245', 'admin', '0:0:0:0:0:0:0:1', '2016-01-31 17:51:36', '登陆成功');
INSERT INTO `t_login_log` VALUES ('246', 'admin', '0:0:0:0:0:0:0:1', '2016-01-31 17:51:42', '登陆成功');
INSERT INTO `t_login_log` VALUES ('247', 'admin', '0:0:0:0:0:0:0:1', '2016-02-09 18:09:36', '登陆成功');
INSERT INTO `t_login_log` VALUES ('248', 'admin', '0:0:0:0:0:0:0:1', '2016-02-09 18:32:54', '登陆成功');
INSERT INTO `t_login_log` VALUES ('249', 'admin', '0:0:0:0:0:0:0:1', '2016-02-09 21:31:27', '登陆成功');
INSERT INTO `t_login_log` VALUES ('250', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 16:22:53', '请输入账号密码');
INSERT INTO `t_login_log` VALUES ('251', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 16:23:02', '请输入账号密码');
INSERT INTO `t_login_log` VALUES ('252', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 16:30:29', '请输入账号密码');
INSERT INTO `t_login_log` VALUES ('253', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 16:31:04', '请输入账号密码');
INSERT INTO `t_login_log` VALUES ('254', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 16:31:17', '请输入账号密码');
INSERT INTO `t_login_log` VALUES ('255', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 16:33:21', '请输入账号密码');
INSERT INTO `t_login_log` VALUES ('256', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 16:35:26', '登陆成功');
INSERT INTO `t_login_log` VALUES ('257', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 16:36:03', '登陆成功');
INSERT INTO `t_login_log` VALUES ('258', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 16:36:50', '登陆成功');
INSERT INTO `t_login_log` VALUES ('259', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 16:37:24', '登陆成功');
INSERT INTO `t_login_log` VALUES ('260', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 16:37:43', '登陆成功');
INSERT INTO `t_login_log` VALUES ('261', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 16:37:49', '登陆成功');
INSERT INTO `t_login_log` VALUES ('262', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 16:42:20', '登陆成功');
INSERT INTO `t_login_log` VALUES ('263', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 16:43:10', '登陆成功');
INSERT INTO `t_login_log` VALUES ('264', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 16:44:39', '登陆成功');
INSERT INTO `t_login_log` VALUES ('265', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 16:45:47', '登陆成功');
INSERT INTO `t_login_log` VALUES ('266', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 16:46:21', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('267', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 16:47:48', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('268', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 16:47:52', '登陆成功');
INSERT INTO `t_login_log` VALUES ('269', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 16:47:56', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('270', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 16:47:59', '登陆成功');
INSERT INTO `t_login_log` VALUES ('271', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 16:48:20', '登陆成功');
INSERT INTO `t_login_log` VALUES ('272', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 16:48:29', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('273', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 16:48:34', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('274', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 16:48:36', '登陆成功');
INSERT INTO `t_login_log` VALUES ('275', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 16:48:37', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('276', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 16:49:13', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('277', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 16:59:56', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('278', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 17:00:03', '登陆成功');
INSERT INTO `t_login_log` VALUES ('279', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 17:00:23', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('280', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 17:00:26', '登陆成功');
INSERT INTO `t_login_log` VALUES ('281', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 17:00:29', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('282', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 17:06:49', '登陆成功');
INSERT INTO `t_login_log` VALUES ('283', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 17:07:01', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('284', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 17:07:06', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('285', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 17:07:12', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('286', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 17:07:13', '登陆成功');
INSERT INTO `t_login_log` VALUES ('287', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 17:09:19', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('288', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 17:09:21', '登陆成功');
INSERT INTO `t_login_log` VALUES ('289', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 17:19:17', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('290', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 17:19:22', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('291', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 17:19:24', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('292', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 17:53:38', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('293', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 17:53:48', '登陆成功');
INSERT INTO `t_login_log` VALUES ('294', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 17:53:49', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('295', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 17:56:38', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('296', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 17:57:31', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('297', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 17:57:47', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('298', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 17:57:51', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('299', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 17:57:52', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('300', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 17:57:59', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('301', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 17:58:25', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('302', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 17:58:56', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('303', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 18:09:26', '登陆成功');
INSERT INTO `t_login_log` VALUES ('304', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 18:10:40', '登陆成功');
INSERT INTO `t_login_log` VALUES ('305', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 18:10:44', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('306', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 18:31:02', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('307', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 18:31:10', '登陆成功');
INSERT INTO `t_login_log` VALUES ('308', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 18:44:07', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('309', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 18:44:15', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('310', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 18:44:18', '登陆成功');
INSERT INTO `t_login_log` VALUES ('311', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 18:44:55', '登陆成功');
INSERT INTO `t_login_log` VALUES ('312', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 18:45:26', '登陆成功');
INSERT INTO `t_login_log` VALUES ('313', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 18:45:50', '登陆成功');
INSERT INTO `t_login_log` VALUES ('314', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 18:47:45', '登陆成功');
INSERT INTO `t_login_log` VALUES ('315', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 18:59:08', '登陆成功');
INSERT INTO `t_login_log` VALUES ('316', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 19:00:52', '登陆成功');
INSERT INTO `t_login_log` VALUES ('317', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 19:00:58', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('318', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 19:11:53', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('319', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 19:11:58', '登陆成功');
INSERT INTO `t_login_log` VALUES ('320', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 19:12:22', '登陆成功');
INSERT INTO `t_login_log` VALUES ('321', 'storage', '0:0:0:0:0:0:0:1', '2016-02-11 19:12:35', '登陆成功');
INSERT INTO `t_login_log` VALUES ('322', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 19:14:01', '登陆成功');
INSERT INTO `t_login_log` VALUES ('323', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 19:19:36', '登陆成功');
INSERT INTO `t_login_log` VALUES ('324', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 19:20:21', '登陆成功');
INSERT INTO `t_login_log` VALUES ('325', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 19:22:01', '登陆成功');
INSERT INTO `t_login_log` VALUES ('326', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 19:22:55', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('327', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 20:54:50', '登陆成功');
INSERT INTO `t_login_log` VALUES ('328', 'storage', '0:0:0:0:0:0:0:1', '2016-02-11 20:56:34', '登陆成功');
INSERT INTO `t_login_log` VALUES ('329', '未登录', '0:0:0:0:0:0:0:1', '2016-02-11 21:54:48', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('330', 'storage', '0:0:0:0:0:0:0:1', '2016-02-11 21:55:51', '登陆成功');
INSERT INTO `t_login_log` VALUES ('331', 'storage', '0:0:0:0:0:0:0:1', '2016-02-11 22:02:17', '登陆成功');
INSERT INTO `t_login_log` VALUES ('332', 'storage', '0:0:0:0:0:0:0:1', '2016-02-11 22:05:29', '登陆成功');
INSERT INTO `t_login_log` VALUES ('333', 'storage', '0:0:0:0:0:0:0:1', '2016-02-11 22:11:09', '登陆成功');
INSERT INTO `t_login_log` VALUES ('334', 'storage', '0:0:0:0:0:0:0:1', '2016-02-11 22:11:34', '登陆成功');
INSERT INTO `t_login_log` VALUES ('335', 'storage', '0:0:0:0:0:0:0:1', '2016-02-11 22:11:38', '登陆成功');
INSERT INTO `t_login_log` VALUES ('336', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 22:16:53', '登陆成功');
INSERT INTO `t_login_log` VALUES ('337', 'admin', '0:0:0:0:0:0:0:1', '2016-02-11 22:17:00', '登陆成功');
INSERT INTO `t_login_log` VALUES ('338', 'admin', '0:0:0:0:0:0:0:1', '2016-02-12 16:38:27', '登陆成功');
INSERT INTO `t_login_log` VALUES ('339', 'admin', '0:0:0:0:0:0:0:1', '2016-02-12 16:39:12', '登陆成功');
INSERT INTO `t_login_log` VALUES ('340', '未登录', '0:0:0:0:0:0:0:1', '2016-02-12 16:39:28', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('341', '未登录', '0:0:0:0:0:0:0:1', '2016-02-12 16:43:54', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('342', '未登录', '0:0:0:0:0:0:0:1', '2016-02-12 16:44:43', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('343', '未登录', '0:0:0:0:0:0:0:1', '2016-02-12 16:45:12', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('344', '未登录', '0:0:0:0:0:0:0:1', '2016-02-12 16:46:54', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('345', '未登录', '0:0:0:0:0:0:0:1', '2016-02-12 17:16:37', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('346', '未登录', '0:0:0:0:0:0:0:1', '2016-02-12 17:58:15', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('347', 'admin', '0:0:0:0:0:0:0:1', '2016-02-12 18:32:34', '登陆成功');
INSERT INTO `t_login_log` VALUES ('348', 'admin', '0:0:0:0:0:0:0:1', '2016-02-12 18:33:38', '登陆成功');
INSERT INTO `t_login_log` VALUES ('349', 'admin', '0:0:0:0:0:0:0:1', '2016-02-12 18:34:33', '登陆成功');
INSERT INTO `t_login_log` VALUES ('350', 'admin', '0:0:0:0:0:0:0:1', '2016-02-12 18:36:35', '登陆成功');
INSERT INTO `t_login_log` VALUES ('351', 'admin', '0:0:0:0:0:0:0:1', '2016-02-12 18:55:22', '登陆成功');
INSERT INTO `t_login_log` VALUES ('352', 'admin', '0:0:0:0:0:0:0:1', '2016-02-13 00:30:19', '登陆成功');
INSERT INTO `t_login_log` VALUES ('353', 'admin', '0:0:0:0:0:0:0:1', '2016-02-13 00:37:00', '登陆成功');
INSERT INTO `t_login_log` VALUES ('354', 'admin', '0:0:0:0:0:0:0:1', '2016-02-13 00:37:16', '登陆成功');
INSERT INTO `t_login_log` VALUES ('355', 'storage', '0:0:0:0:0:0:0:1', '2016-02-13 00:37:24', '登陆成功');
INSERT INTO `t_login_log` VALUES ('356', 'admin', '0:0:0:0:0:0:0:1', '2016-02-13 00:39:32', '登陆成功');
INSERT INTO `t_login_log` VALUES ('357', 'admin', '0:0:0:0:0:0:0:1', '2016-02-13 00:42:48', '登陆成功');
INSERT INTO `t_login_log` VALUES ('358', 'admin', '0:0:0:0:0:0:0:1', '2016-02-13 00:43:57', '登陆成功');
INSERT INTO `t_login_log` VALUES ('359', 'admin', '0:0:0:0:0:0:0:1', '2016-02-13 00:46:31', '登陆成功');
INSERT INTO `t_login_log` VALUES ('360', 'admin', '0:0:0:0:0:0:0:1', '2016-02-13 00:49:03', '登陆成功');
INSERT INTO `t_login_log` VALUES ('361', 'storage', '0:0:0:0:0:0:0:1', '2016-02-13 00:49:13', '登陆成功');
INSERT INTO `t_login_log` VALUES ('362', 'admin', '0:0:0:0:0:0:0:1', '2016-02-13 00:50:41', '登陆成功');
INSERT INTO `t_login_log` VALUES ('363', 'storage', '0:0:0:0:0:0:0:1', '2016-02-13 00:50:56', '登陆成功');
INSERT INTO `t_login_log` VALUES ('364', 'admin', '0:0:0:0:0:0:0:1', '2016-02-13 14:46:31', '登陆成功');
INSERT INTO `t_login_log` VALUES ('365', 'admin', '0:0:0:0:0:0:0:1', '2016-02-13 17:34:01', '登陆成功');
INSERT INTO `t_login_log` VALUES ('366', 'admin', '0:0:0:0:0:0:0:1', '2016-02-13 19:35:58', '登陆成功');
INSERT INTO `t_login_log` VALUES ('367', 'admin', '0:0:0:0:0:0:0:1', '2016-02-14 00:33:23', '登陆成功');
INSERT INTO `t_login_log` VALUES ('368', 'admin', '0:0:0:0:0:0:0:1', '2016-02-14 11:40:51', '登陆成功');
INSERT INTO `t_login_log` VALUES ('369', '未登录', '0:0:0:0:0:0:0:1', '2016-02-14 11:42:09', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('370', 'admin', '0:0:0:0:0:0:0:1', '2016-02-14 11:42:13', '登陆成功');
INSERT INTO `t_login_log` VALUES ('371', '未登录', '0:0:0:0:0:0:0:1', '2016-02-14 11:42:47', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('372', 'admin', '0:0:0:0:0:0:0:1', '2016-02-14 11:42:51', '登陆成功');
INSERT INTO `t_login_log` VALUES ('373', '未登录', '0:0:0:0:0:0:0:1', '2016-02-14 11:44:07', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('374', 'admin', '0:0:0:0:0:0:0:1', '2016-02-14 11:44:09', '登陆成功');
INSERT INTO `t_login_log` VALUES ('375', '未登录', '0:0:0:0:0:0:0:1', '2016-02-14 11:45:36', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('376', 'admin', '0:0:0:0:0:0:0:1', '2016-02-14 11:46:22', '登陆成功');
INSERT INTO `t_login_log` VALUES ('377', '未登录', '0:0:0:0:0:0:0:1', '2016-02-14 11:46:27', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('378', 'admin', '0:0:0:0:0:0:0:1', '2016-02-14 11:46:29', '登陆成功');
INSERT INTO `t_login_log` VALUES ('379', '未登录', '0:0:0:0:0:0:0:1', '2016-02-14 11:47:55', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('380', 'admin', '0:0:0:0:0:0:0:1', '2016-02-14 11:48:06', '登陆成功');
INSERT INTO `t_login_log` VALUES ('381', 'admin', '0:0:0:0:0:0:0:1', '2016-02-14 11:49:17', '登陆成功');
INSERT INTO `t_login_log` VALUES ('382', '未登录', '0:0:0:0:0:0:0:1', '2016-02-14 11:50:05', '账号或密码错误');
INSERT INTO `t_login_log` VALUES ('383', 'admin', '0:0:0:0:0:0:0:1', '2016-02-14 11:50:07', '登陆成功');
INSERT INTO `t_login_log` VALUES ('384', 'admin', '0:0:0:0:0:0:0:1', '2016-02-14 17:49:12', '登陆成功');
INSERT INTO `t_login_log` VALUES ('385', 'admin', '0:0:0:0:0:0:0:1', '2016-02-14 17:51:41', '登陆成功');
INSERT INTO `t_login_log` VALUES ('386', 'projectmanager', '0:0:0:0:0:0:0:1', '2016-02-14 20:11:15', '登陆成功');
INSERT INTO `t_login_log` VALUES ('387', 'projectmanager', '0:0:0:0:0:0:0:1', '2016-02-14 20:11:42', '登陆成功');
INSERT INTO `t_login_log` VALUES ('388', 'projectmanager', '0:0:0:0:0:0:0:1', '2016-02-14 20:13:57', '登陆成功');
INSERT INTO `t_login_log` VALUES ('389', 'projectmanager', '0:0:0:0:0:0:0:1', '2016-02-14 20:14:05', '登陆成功');
INSERT INTO `t_login_log` VALUES ('390', 'projectmanager', '0:0:0:0:0:0:0:1', '2016-02-14 21:11:27', '登陆成功');
INSERT INTO `t_login_log` VALUES ('391', 'admin', '0:0:0:0:0:0:0:1', '2016-02-15 00:26:21', '登陆成功');
INSERT INTO `t_login_log` VALUES ('392', 'projectmanager', '0:0:0:0:0:0:0:1', '2016-02-15 00:40:13', '登陆成功');
INSERT INTO `t_login_log` VALUES ('393', 'projectmanager', '0:0:0:0:0:0:0:1', '2016-02-15 01:05:19', '登陆成功');
INSERT INTO `t_login_log` VALUES ('394', 'projectmanager', '0:0:0:0:0:0:0:1', '2016-02-15 14:03:59', '登陆成功');
INSERT INTO `t_login_log` VALUES ('395', 'projectmanager', '0:0:0:0:0:0:0:1', '2016-02-15 15:05:23', '登陆成功');
INSERT INTO `t_login_log` VALUES ('396', 'purchase', '0:0:0:0:0:0:0:1', '2016-02-15 15:11:22', '登陆成功');
INSERT INTO `t_login_log` VALUES ('397', 'projectmanager', '0:0:0:0:0:0:0:1', '2016-02-15 16:57:03', '登陆成功');
INSERT INTO `t_login_log` VALUES ('398', 'purchase', '0:0:0:0:0:0:0:1', '2016-02-15 16:57:40', '登陆成功');
INSERT INTO `t_login_log` VALUES ('399', 'projectmanager', '0:0:0:0:0:0:0:1', '2016-02-15 16:57:57', '登陆成功');
INSERT INTO `t_login_log` VALUES ('400', 'purchase', '0:0:0:0:0:0:0:1', '2016-02-15 16:58:17', '登陆成功');
INSERT INTO `t_login_log` VALUES ('401', 'projectmanager', '0:0:0:0:0:0:0:1', '2016-02-15 17:01:49', '登陆成功');
INSERT INTO `t_login_log` VALUES ('402', 'purchase', '0:0:0:0:0:0:0:1', '2016-02-15 17:03:12', '登陆成功');
INSERT INTO `t_login_log` VALUES ('403', 'projectmanager', '0:0:0:0:0:0:0:1', '2016-02-15 20:05:15', '登陆成功');
INSERT INTO `t_login_log` VALUES ('404', 'projectmanager', '0:0:0:0:0:0:0:1', '2016-02-15 20:31:04', '登陆成功');
INSERT INTO `t_login_log` VALUES ('405', 'purchase', '0:0:0:0:0:0:0:1', '2016-02-15 21:03:55', '登陆成功');
INSERT INTO `t_login_log` VALUES ('406', 'purchase', '0:0:0:0:0:0:0:1', '2016-02-15 22:35:10', '登陆成功');
INSERT INTO `t_login_log` VALUES ('407', 'purchase', '0:0:0:0:0:0:0:1', '2016-02-15 22:36:56', '登陆成功');
INSERT INTO `t_login_log` VALUES ('408', 'projectmanager', '0:0:0:0:0:0:0:1', '2016-02-15 22:41:44', '登陆成功');
INSERT INTO `t_login_log` VALUES ('409', 'purchase', '0:0:0:0:0:0:0:1', '2016-02-15 22:42:06', '登陆成功');
INSERT INTO `t_login_log` VALUES ('410', 'projectmanager', '0:0:0:0:0:0:0:1', '2016-02-15 22:44:10', '登陆成功');
INSERT INTO `t_login_log` VALUES ('411', 'storage', '0:0:0:0:0:0:0:1', '2016-02-15 23:29:24', '登陆成功');
INSERT INTO `t_login_log` VALUES ('412', 'bossboss', '0:0:0:0:0:0:0:1', '2016-02-16 00:29:17', '登陆成功');
INSERT INTO `t_login_log` VALUES ('413', 'admin', '0:0:0:0:0:0:0:1', '2016-02-16 00:33:55', '登陆成功');
INSERT INTO `t_login_log` VALUES ('414', 'storage', '0:0:0:0:0:0:0:1', '2016-02-16 00:51:34', '登陆成功');
INSERT INTO `t_login_log` VALUES ('415', 'admin', '0:0:0:0:0:0:0:1', '2016-02-16 00:53:16', '登陆成功');
INSERT INTO `t_login_log` VALUES ('416', 'admin', '0:0:0:0:0:0:0:1', '2016-02-16 00:54:06', '登陆成功');
INSERT INTO `t_login_log` VALUES ('417', 'projectmanager', '0:0:0:0:0:0:0:1', '2016-02-16 01:01:07', '登陆成功');
INSERT INTO `t_login_log` VALUES ('418', 'purchase', '0:0:0:0:0:0:0:1', '2016-02-16 01:03:37', '登陆成功');
INSERT INTO `t_login_log` VALUES ('419', 'projectmanager', '0:0:0:0:0:0:0:1', '2016-02-16 01:05:03', '登陆成功');
INSERT INTO `t_login_log` VALUES ('420', 'purchase', '0:0:0:0:0:0:0:1', '2016-02-16 01:05:43', '登陆成功');
INSERT INTO `t_login_log` VALUES ('421', 'projectmanager', '0:0:0:0:0:0:0:1', '2016-02-16 01:12:28', '登陆成功');
INSERT INTO `t_login_log` VALUES ('422', 'storage', '0:0:0:0:0:0:0:1', '2016-02-16 01:12:41', '登陆成功');
INSERT INTO `t_login_log` VALUES ('423', 'projectmanager', '0:0:0:0:0:0:0:1', '2016-02-16 01:14:32', '登陆成功');
INSERT INTO `t_login_log` VALUES ('424', 'storage', '0:0:0:0:0:0:0:1', '2016-02-16 01:14:46', '登陆成功');
INSERT INTO `t_login_log` VALUES ('425', 'storage', '0:0:0:0:0:0:0:1', '2016-02-16 01:17:47', '登陆成功');
INSERT INTO `t_login_log` VALUES ('426', 'projectmanager', '0:0:0:0:0:0:0:1', '2016-02-16 01:17:51', '登陆成功');
INSERT INTO `t_login_log` VALUES ('427', 'storage', '0:0:0:0:0:0:0:1', '2016-02-16 01:17:56', '登陆成功');
INSERT INTO `t_login_log` VALUES ('428', 'projectmanager', '0:0:0:0:0:0:0:1', '2016-02-16 01:19:37', '登陆成功');
INSERT INTO `t_login_log` VALUES ('429', 'storage', '0:0:0:0:0:0:0:1', '2016-02-16 01:19:46', '登陆成功');
INSERT INTO `t_login_log` VALUES ('430', 'storage', '0:0:0:0:0:0:0:1', '2016-02-16 01:20:01', '登陆成功');
INSERT INTO `t_login_log` VALUES ('431', 'storage', '0:0:0:0:0:0:0:1', '2016-02-16 01:21:43', '登陆成功');
INSERT INTO `t_login_log` VALUES ('432', 'projectmanager', '0:0:0:0:0:0:0:1', '2016-02-16 01:25:45', '登陆成功');
INSERT INTO `t_login_log` VALUES ('433', 'storage', '0:0:0:0:0:0:0:1', '2016-02-16 01:25:51', '登陆成功');
INSERT INTO `t_login_log` VALUES ('434', 'purchase', '0:0:0:0:0:0:0:1', '2016-02-16 01:44:59', '登陆成功');
INSERT INTO `t_login_log` VALUES ('435', 'projectmanager', '0:0:0:0:0:0:0:1', '2016-02-16 01:46:23', '登陆成功');
INSERT INTO `t_login_log` VALUES ('436', 'projectmanager', '0:0:0:0:0:0:0:1', '2016-02-16 01:49:38', '登陆成功');
INSERT INTO `t_login_log` VALUES ('437', 'storage', '0:0:0:0:0:0:0:1', '2016-02-16 01:50:49', '登陆成功');
INSERT INTO `t_login_log` VALUES ('438', 'purchase', '0:0:0:0:0:0:0:1', '2016-02-16 01:50:54', '登陆成功');
INSERT INTO `t_login_log` VALUES ('439', 'storage', '0:0:0:0:0:0:0:1', '2016-02-16 01:51:12', '登陆成功');
INSERT INTO `t_login_log` VALUES ('440', 'admin', '0:0:0:0:0:0:0:1', '2016-02-16 01:51:19', '登陆成功');
INSERT INTO `t_login_log` VALUES ('441', 'bossboss', '0:0:0:0:0:0:0:1', '2016-02-16 01:51:23', '登陆成功');
INSERT INTO `t_login_log` VALUES ('442', 'bossboss', '0:0:0:0:0:0:0:1', '2016-02-16 01:57:19', '登陆成功');
INSERT INTO `t_login_log` VALUES ('443', 'admin', '0:0:0:0:0:0:0:1', '2016-02-16 17:37:16', '登陆成功');
INSERT INTO `t_login_log` VALUES ('444', 'admin', '0:0:0:0:0:0:0:1', '2016-02-16 17:41:33', '登陆成功');
INSERT INTO `t_login_log` VALUES ('445', 'admin', '0:0:0:0:0:0:0:1', '2016-02-16 22:45:01', '登陆成功');
INSERT INTO `t_login_log` VALUES ('446', 'admin', '0:0:0:0:0:0:0:1', '2016-02-16 22:45:07', '登陆成功');
INSERT INTO `t_login_log` VALUES ('447', 'admin', '0:0:0:0:0:0:0:1', '2016-02-16 23:22:41', '登陆成功');
INSERT INTO `t_login_log` VALUES ('448', 'admin', '0:0:0:0:0:0:0:1', '2016-02-17 00:18:59', '登陆成功');
INSERT INTO `t_login_log` VALUES ('449', 'admin', '0:0:0:0:0:0:0:1', '2016-02-17 00:21:01', '登陆成功');

-- ----------------------------
-- Table structure for t_material
-- ----------------------------
DROP TABLE IF EXISTS `t_material`;
CREATE TABLE `t_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `material_name` varchar(45) NOT NULL,
  `t_module_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_t_material_t_project1_idx1` (`t_module_id`) USING BTREE,
  CONSTRAINT `fk_t_material2_t_module` FOREIGN KEY (`t_module_id`) REFERENCES `t_module` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3661 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_material
-- ----------------------------
INSERT INTO `t_material` VALUES ('3640', '分区器', '299');
INSERT INTO `t_material` VALUES ('3641', '录音/报警信号发生器', '299');
INSERT INTO `t_material` VALUES ('3642', '室外仿生音响', '299');
INSERT INTO `t_material` VALUES ('3643', '十路强切电源', '299');
INSERT INTO `t_material` VALUES ('3644', '中心控制主机', '299');
INSERT INTO `t_material` VALUES ('3645', '节目播放服务器', '299');
INSERT INTO `t_material` VALUES ('3646', '远程呼叫话筒', '299');
INSERT INTO `t_material` VALUES ('3647', '消防智能接口', '299');
INSERT INTO `t_material` VALUES ('3648', '前置放大器', '299');
INSERT INTO `t_material` VALUES ('3649', 'CD/DVD/VCD/MP3播放器', '299');
INSERT INTO `t_material` VALUES ('3650', '吸顶音箱', '299');
INSERT INTO `t_material` VALUES ('3651', '音箱线', '299');
INSERT INTO `t_material` VALUES ('3652', '设备机柜', '299');
INSERT INTO `t_material` VALUES ('3653', '音柱', '299');
INSERT INTO `t_material` VALUES ('3654', '电源时序器', '299');
INSERT INTO `t_material` VALUES ('3655', '音量控制器120W', '299');
INSERT INTO `t_material` VALUES ('3656', '功率放大器', '299');
INSERT INTO `t_material` VALUES ('3657', '音量控制器60W', '299');
INSERT INTO `t_material` VALUES ('3658', '壁挂音箱', '299');
INSERT INTO `t_material` VALUES ('3659', '主备功放切换器', '299');
INSERT INTO `t_material` VALUES ('3660', '话筒', '299');

-- ----------------------------
-- Table structure for t_module
-- ----------------------------
DROP TABLE IF EXISTS `t_module`;
CREATE TABLE `t_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(45) NOT NULL,
  `t_project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_t_module_t_project1_idx` (`t_project_id`) USING BTREE,
  CONSTRAINT `fk_t_module_t_project1` FOREIGN KEY (`t_project_id`) REFERENCES `t_project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=300 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_module
-- ----------------------------
INSERT INTO `t_module` VALUES ('299', '公共广播系统-0', '69');

-- ----------------------------
-- Table structure for t_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `t_oper_log`;
CREATE TABLE `t_oper_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(16) DEFAULT NULL,
  `host` varchar(45) DEFAULT NULL,
  `method_name` varchar(100) DEFAULT NULL,
  `spent_time` int(11) DEFAULT NULL,
  `occur_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=493 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_oper_log
-- ----------------------------
INSERT INTO `t_oper_log` VALUES ('23', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.deleteModule', '15', '2016-01-26 22:02:57');
INSERT INTO `t_oper_log` VALUES ('24', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.createModule', '16', '2016-01-26 22:11:38');
INSERT INTO `t_oper_log` VALUES ('25', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.deleteModule', '32', '2016-01-26 22:13:53');
INSERT INTO `t_oper_log` VALUES ('26', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.createModule', '8', '2016-01-26 22:23:14');
INSERT INTO `t_oper_log` VALUES ('27', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '11', '2016-01-27 13:48:05');
INSERT INTO `t_oper_log` VALUES ('28', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.createModule', '4', '2016-01-27 13:48:10');
INSERT INTO `t_oper_log` VALUES ('29', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.createMaterial', '4', '2016-01-27 13:48:13');
INSERT INTO `t_oper_log` VALUES ('30', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.createMaterial', '33', '2016-01-27 13:48:22');
INSERT INTO `t_oper_log` VALUES ('31', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.deleteSp', '6', '2016-01-27 13:48:24');
INSERT INTO `t_oper_log` VALUES ('32', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.createMaterial', '38', '2016-01-27 13:48:30');
INSERT INTO `t_oper_log` VALUES ('33', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.deleteSp', '5', '2016-01-27 13:48:42');
INSERT INTO `t_oper_log` VALUES ('34', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.updateMaterial', '4', '2016-01-27 13:48:47');
INSERT INTO `t_oper_log` VALUES ('35', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.deleteMaterial', '5', '2016-01-27 13:48:50');
INSERT INTO `t_oper_log` VALUES ('36', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.createMaterial', '3', '2016-01-27 13:48:55');
INSERT INTO `t_oper_log` VALUES ('37', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.deleteModule', '42', '2016-01-27 13:49:22');
INSERT INTO `t_oper_log` VALUES ('38', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.createModule', '4', '2016-01-27 13:49:34');
INSERT INTO `t_oper_log` VALUES ('39', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.upload', '1890', '2016-01-27 13:50:05');
INSERT INTO `t_oper_log` VALUES ('40', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.BrandController.createBrand', '3', '2016-01-27 13:50:41');
INSERT INTO `t_oper_log` VALUES ('41', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.BrandController.deleteBrand', '44', '2016-01-27 13:52:29');
INSERT INTO `t_oper_log` VALUES ('42', 'admin', '192.168.1.201', 'cn.oneayst.controller.BrandController.deleteBrand', '7', '2016-01-27 13:56:36');
INSERT INTO `t_oper_log` VALUES ('43', 'admin', '192.168.1.201', 'cn.oneayst.controller.BrandController.deleteBrand', '8', '2016-01-27 13:56:45');
INSERT INTO `t_oper_log` VALUES ('44', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.createApply', '38', '2016-01-27 13:58:40');
INSERT INTO `t_oper_log` VALUES ('45', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.createApply', '7', '2016-01-27 14:00:39');
INSERT INTO `t_oper_log` VALUES ('46', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', '6', '2016-01-27 14:01:24');
INSERT INTO `t_oper_log` VALUES ('47', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-01-27 14:02:00');
INSERT INTO `t_oper_log` VALUES ('48', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-01-27 14:12:19');
INSERT INTO `t_oper_log` VALUES ('49', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.generateExcel', '43', '2016-01-27 14:12:19');
INSERT INTO `t_oper_log` VALUES ('50', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-01-27 14:12:26');
INSERT INTO `t_oper_log` VALUES ('51', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.generateExcel', '36', '2016-01-27 14:12:26');
INSERT INTO `t_oper_log` VALUES ('52', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-01-27 14:13:52');
INSERT INTO `t_oper_log` VALUES ('53', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.generateExcel', '28', '2016-01-27 14:13:52');
INSERT INTO `t_oper_log` VALUES ('54', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-01-27 14:15:09');
INSERT INTO `t_oper_log` VALUES ('55', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.generateExcel', '30', '2016-01-27 14:15:09');
INSERT INTO `t_oper_log` VALUES ('56', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-01-27 14:16:21');
INSERT INTO `t_oper_log` VALUES ('57', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.generateExcel', '36', '2016-01-27 14:16:21');
INSERT INTO `t_oper_log` VALUES ('58', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-01-27 14:16:27');
INSERT INTO `t_oper_log` VALUES ('59', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.generateExcel', '19', '2016-01-27 14:16:27');
INSERT INTO `t_oper_log` VALUES ('60', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-01-27 14:19:07');
INSERT INTO `t_oper_log` VALUES ('61', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.generateExcel', '31', '2016-01-27 14:19:07');
INSERT INTO `t_oper_log` VALUES ('62', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-01-27 14:19:19');
INSERT INTO `t_oper_log` VALUES ('63', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.generateExcel', '55', '2016-01-27 14:19:19');
INSERT INTO `t_oper_log` VALUES ('64', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-01-27 14:21:09');
INSERT INTO `t_oper_log` VALUES ('65', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.generateExcel', '21', '2016-01-27 14:21:09');
INSERT INTO `t_oper_log` VALUES ('66', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-01-27 14:21:21');
INSERT INTO `t_oper_log` VALUES ('67', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.generateExcel', '18', '2016-01-27 14:21:21');
INSERT INTO `t_oper_log` VALUES ('68', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-01-27 14:26:23');
INSERT INTO `t_oper_log` VALUES ('69', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.generateExcel', '34', '2016-01-27 14:26:23');
INSERT INTO `t_oper_log` VALUES ('70', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-01-27 14:29:01');
INSERT INTO `t_oper_log` VALUES ('71', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.generateExcel', '21', '2016-01-27 14:29:01');
INSERT INTO `t_oper_log` VALUES ('72', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-01-27 14:31:21');
INSERT INTO `t_oper_log` VALUES ('73', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.generateExcel', '30', '2016-01-27 14:31:21');
INSERT INTO `t_oper_log` VALUES ('74', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-01-27 14:31:30');
INSERT INTO `t_oper_log` VALUES ('75', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.generateExcel', '17', '2016-01-27 14:31:30');
INSERT INTO `t_oper_log` VALUES ('76', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-01-27 14:32:19');
INSERT INTO `t_oper_log` VALUES ('77', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.generateExcel', '20', '2016-01-27 14:32:19');
INSERT INTO `t_oper_log` VALUES ('78', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.createPurchase', '13', '2016-01-27 14:36:24');
INSERT INTO `t_oper_log` VALUES ('79', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.createPurchase', '11', '2016-01-27 14:38:46');
INSERT INTO `t_oper_log` VALUES ('80', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-01-27 14:39:05');
INSERT INTO `t_oper_log` VALUES ('81', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.download', '29', '2016-01-27 14:39:05');
INSERT INTO `t_oper_log` VALUES ('82', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-01-27 14:39:26');
INSERT INTO `t_oper_log` VALUES ('83', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.download', '10', '2016-01-27 14:39:26');
INSERT INTO `t_oper_log` VALUES ('84', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-01-27 14:41:16');
INSERT INTO `t_oper_log` VALUES ('85', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.download', '25', '2016-01-27 14:41:16');
INSERT INTO `t_oper_log` VALUES ('86', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-01-27 14:41:26');
INSERT INTO `t_oper_log` VALUES ('87', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.download', '17', '2016-01-27 14:41:26');
INSERT INTO `t_oper_log` VALUES ('88', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-01-27 14:42:28');
INSERT INTO `t_oper_log` VALUES ('89', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.download', '19', '2016-01-27 14:42:28');
INSERT INTO `t_oper_log` VALUES ('90', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-01-27 14:48:39');
INSERT INTO `t_oper_log` VALUES ('91', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.download', '11', '2016-01-27 14:48:39');
INSERT INTO `t_oper_log` VALUES ('92', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-01-27 14:48:54');
INSERT INTO `t_oper_log` VALUES ('93', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.download', '12', '2016-01-27 14:48:54');
INSERT INTO `t_oper_log` VALUES ('94', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-01-27 14:49:51');
INSERT INTO `t_oper_log` VALUES ('95', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.download', '10', '2016-01-27 14:49:51');
INSERT INTO `t_oper_log` VALUES ('96', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-01-27 14:50:10');
INSERT INTO `t_oper_log` VALUES ('97', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.download', '10', '2016-01-27 14:50:10');
INSERT INTO `t_oper_log` VALUES ('98', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.updateArrived', '30', '2016-01-27 14:50:35');
INSERT INTO `t_oper_log` VALUES ('99', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.updateArrived', '3', '2016-01-27 14:50:44');
INSERT INTO `t_oper_log` VALUES ('100', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.createPurchase', '5', '2016-01-27 14:51:15');
INSERT INTO `t_oper_log` VALUES ('101', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-01-27 14:51:34');
INSERT INTO `t_oper_log` VALUES ('102', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.download', '10', '2016-01-27 14:51:34');
INSERT INTO `t_oper_log` VALUES ('103', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-01-27 14:51:37');
INSERT INTO `t_oper_log` VALUES ('104', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.download', '17', '2016-01-27 14:51:37');
INSERT INTO `t_oper_log` VALUES ('105', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-01-27 14:51:41');
INSERT INTO `t_oper_log` VALUES ('106', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.download', '15', '2016-01-27 14:51:41');
INSERT INTO `t_oper_log` VALUES ('107', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.updateArrived', '4', '2016-01-27 14:52:43');
INSERT INTO `t_oper_log` VALUES ('108', 'storage', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-01-27 14:53:46');
INSERT INTO `t_oper_log` VALUES ('109', 'storage', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.download', '20', '2016-01-27 14:53:46');
INSERT INTO `t_oper_log` VALUES ('110', 'storage', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-01-27 14:54:20');
INSERT INTO `t_oper_log` VALUES ('111', 'storage', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.download', '18', '2016-01-27 14:54:20');
INSERT INTO `t_oper_log` VALUES ('112', 'storage', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-01-27 14:54:29');
INSERT INTO `t_oper_log` VALUES ('113', 'storage', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.download', '9', '2016-01-27 14:54:29');
INSERT INTO `t_oper_log` VALUES ('114', 'bossboss', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-01-27 14:55:27');
INSERT INTO `t_oper_log` VALUES ('115', 'bossboss', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.download', '66', '2016-01-27 14:55:27');
INSERT INTO `t_oper_log` VALUES ('116', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '22', '2016-01-30 17:04:46');
INSERT INTO `t_oper_log` VALUES ('117', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.createUser', '27', '2016-01-31 00:39:27');
INSERT INTO `t_oper_log` VALUES ('118', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '71', '2016-01-31 00:39:37');
INSERT INTO `t_oper_log` VALUES ('119', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '13', '2016-01-31 13:58:55');
INSERT INTO `t_oper_log` VALUES ('120', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '38', '2016-01-31 14:01:06');
INSERT INTO `t_oper_log` VALUES ('121', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '10', '2016-01-31 14:04:12');
INSERT INTO `t_oper_log` VALUES ('122', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '59', '2016-01-31 14:49:23');
INSERT INTO `t_oper_log` VALUES ('123', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '9', '2016-01-31 14:53:54');
INSERT INTO `t_oper_log` VALUES ('124', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '16', '2016-01-31 14:54:26');
INSERT INTO `t_oper_log` VALUES ('125', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '12', '2016-01-31 16:06:02');
INSERT INTO `t_oper_log` VALUES ('126', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '76', '2016-01-31 17:26:19');
INSERT INTO `t_oper_log` VALUES ('127', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '19', '2016-01-31 17:30:38');
INSERT INTO `t_oper_log` VALUES ('128', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.createModule', '7', '2016-01-31 17:31:09');
INSERT INTO `t_oper_log` VALUES ('129', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.createModule', '7', '2016-01-31 17:44:42');
INSERT INTO `t_oper_log` VALUES ('130', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '84', '2016-01-31 17:45:43');
INSERT INTO `t_oper_log` VALUES ('131', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '8', '2016-01-31 17:46:44');
INSERT INTO `t_oper_log` VALUES ('132', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.createModule', '5', '2016-01-31 17:47:08');
INSERT INTO `t_oper_log` VALUES ('133', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.createModule', '12', '2016-01-31 17:47:17');
INSERT INTO `t_oper_log` VALUES ('134', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '24', '2016-01-31 17:47:32');
INSERT INTO `t_oper_log` VALUES ('135', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.updateModule', '5', '2016-01-31 17:53:07');
INSERT INTO `t_oper_log` VALUES ('136', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.createMaterial', '116', '2016-01-31 17:53:38');
INSERT INTO `t_oper_log` VALUES ('137', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.updateModule', '5', '2016-01-31 17:53:59');
INSERT INTO `t_oper_log` VALUES ('138', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '16', '2016-02-12 23:43:12');
INSERT INTO `t_oper_log` VALUES ('139', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '8', '2016-02-12 23:44:17');
INSERT INTO `t_oper_log` VALUES ('140', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '10', '2016-02-12 23:44:29');
INSERT INTO `t_oper_log` VALUES ('141', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '9', '2016-02-12 23:44:37');
INSERT INTO `t_oper_log` VALUES ('142', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '84', '2016-02-12 23:46:20');
INSERT INTO `t_oper_log` VALUES ('143', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '16', '2016-02-12 23:46:57');
INSERT INTO `t_oper_log` VALUES ('144', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '20', '2016-02-12 23:47:14');
INSERT INTO `t_oper_log` VALUES ('145', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '17', '2016-02-12 23:48:09');
INSERT INTO `t_oper_log` VALUES ('146', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '9', '2016-02-12 23:48:12');
INSERT INTO `t_oper_log` VALUES ('147', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '9', '2016-02-12 23:48:14');
INSERT INTO `t_oper_log` VALUES ('148', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '8', '2016-02-12 23:48:17');
INSERT INTO `t_oper_log` VALUES ('149', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '13', '2016-02-12 23:48:26');
INSERT INTO `t_oper_log` VALUES ('150', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '54', '2016-02-12 23:48:30');
INSERT INTO `t_oper_log` VALUES ('151', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '17', '2016-02-12 23:48:33');
INSERT INTO `t_oper_log` VALUES ('152', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '12', '2016-02-12 23:49:28');
INSERT INTO `t_oper_log` VALUES ('153', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '21', '2016-02-12 23:49:34');
INSERT INTO `t_oper_log` VALUES ('154', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.updateProject', '11', '2016-02-13 00:31:18');
INSERT INTO `t_oper_log` VALUES ('155', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '14', '2016-02-13 00:32:56');
INSERT INTO `t_oper_log` VALUES ('156', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.updateProject', '6', '2016-02-13 00:33:01');
INSERT INTO `t_oper_log` VALUES ('157', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '55', '2016-02-13 00:33:06');
INSERT INTO `t_oper_log` VALUES ('158', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.updateProject', '7', '2016-02-13 16:23:01');
INSERT INTO `t_oper_log` VALUES ('159', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.updateProject', '5', '2016-02-13 16:24:31');
INSERT INTO `t_oper_log` VALUES ('160', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '12', '2016-02-13 16:24:38');
INSERT INTO `t_oper_log` VALUES ('161', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '11', '2016-02-13 16:24:41');
INSERT INTO `t_oper_log` VALUES ('162', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '43', '2016-02-13 16:24:49');
INSERT INTO `t_oper_log` VALUES ('163', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.updateProject', '10', '2016-02-13 16:24:56');
INSERT INTO `t_oper_log` VALUES ('164', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '58', '2016-02-13 16:25:00');
INSERT INTO `t_oper_log` VALUES ('165', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.createModule', '70', '2016-02-13 16:55:14');
INSERT INTO `t_oper_log` VALUES ('166', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.deleteModule', '33', '2016-02-13 16:58:05');
INSERT INTO `t_oper_log` VALUES ('167', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.upload', '1932', '2016-02-13 19:45:24');
INSERT INTO `t_oper_log` VALUES ('168', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '9', '2016-02-13 19:45:45');
INSERT INTO `t_oper_log` VALUES ('169', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.upload', '602', '2016-02-13 19:45:53');
INSERT INTO `t_oper_log` VALUES ('170', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '67', '2016-02-13 19:49:07');
INSERT INTO `t_oper_log` VALUES ('171', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '9', '2016-02-13 19:49:09');
INSERT INTO `t_oper_log` VALUES ('172', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.upload', '455', '2016-02-13 19:49:14');
INSERT INTO `t_oper_log` VALUES ('173', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '48', '2016-02-13 19:50:49');
INSERT INTO `t_oper_log` VALUES ('174', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '9', '2016-02-13 19:50:51');
INSERT INTO `t_oper_log` VALUES ('175', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.upload', '521', '2016-02-13 19:50:57');
INSERT INTO `t_oper_log` VALUES ('176', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '49', '2016-02-13 19:52:07');
INSERT INTO `t_oper_log` VALUES ('177', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '6', '2016-02-13 19:52:09');
INSERT INTO `t_oper_log` VALUES ('178', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.upload', '423', '2016-02-13 19:52:23');
INSERT INTO `t_oper_log` VALUES ('179', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '5', '2016-02-13 19:58:46');
INSERT INTO `t_oper_log` VALUES ('180', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.upload', '512', '2016-02-13 19:58:57');
INSERT INTO `t_oper_log` VALUES ('181', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '40', '2016-02-13 19:59:20');
INSERT INTO `t_oper_log` VALUES ('182', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '45', '2016-02-13 19:59:24');
INSERT INTO `t_oper_log` VALUES ('183', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '5', '2016-02-13 19:59:27');
INSERT INTO `t_oper_log` VALUES ('184', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '10', '2016-02-13 19:59:35');
INSERT INTO `t_oper_log` VALUES ('185', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '7', '2016-02-13 19:59:44');
INSERT INTO `t_oper_log` VALUES ('186', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '6', '2016-02-13 19:59:46');
INSERT INTO `t_oper_log` VALUES ('187', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '6', '2016-02-13 19:59:53');
INSERT INTO `t_oper_log` VALUES ('188', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '37', '2016-02-13 19:59:55');
INSERT INTO `t_oper_log` VALUES ('189', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '6', '2016-02-13 19:59:57');
INSERT INTO `t_oper_log` VALUES ('190', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '9', '2016-02-13 20:00:54');
INSERT INTO `t_oper_log` VALUES ('191', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '16', '2016-02-13 20:00:56');
INSERT INTO `t_oper_log` VALUES ('192', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '7', '2016-02-13 20:00:57');
INSERT INTO `t_oper_log` VALUES ('193', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '8', '2016-02-13 20:00:58');
INSERT INTO `t_oper_log` VALUES ('194', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '6', '2016-02-13 20:01:00');
INSERT INTO `t_oper_log` VALUES ('195', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '5', '2016-02-13 20:02:43');
INSERT INTO `t_oper_log` VALUES ('196', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '7', '2016-02-13 20:02:44');
INSERT INTO `t_oper_log` VALUES ('197', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '14', '2016-02-13 20:05:38');
INSERT INTO `t_oper_log` VALUES ('198', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '8', '2016-02-13 20:05:40');
INSERT INTO `t_oper_log` VALUES ('199', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '15', '2016-02-13 20:07:42');
INSERT INTO `t_oper_log` VALUES ('200', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '6', '2016-02-13 20:07:44');
INSERT INTO `t_oper_log` VALUES ('201', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '11', '2016-02-13 20:09:07');
INSERT INTO `t_oper_log` VALUES ('202', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '8', '2016-02-13 20:09:09');
INSERT INTO `t_oper_log` VALUES ('203', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '11', '2016-02-13 20:13:31');
INSERT INTO `t_oper_log` VALUES ('204', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '9', '2016-02-13 20:13:32');
INSERT INTO `t_oper_log` VALUES ('205', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '13', '2016-02-13 20:13:40');
INSERT INTO `t_oper_log` VALUES ('206', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '7', '2016-02-13 20:13:42');
INSERT INTO `t_oper_log` VALUES ('207', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '7', '2016-02-13 20:13:53');
INSERT INTO `t_oper_log` VALUES ('208', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.upload', '408', '2016-02-13 20:13:58');
INSERT INTO `t_oper_log` VALUES ('209', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.upload', '420', '2016-02-13 20:14:12');
INSERT INTO `t_oper_log` VALUES ('210', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.upload', '390', '2016-02-13 20:16:14');
INSERT INTO `t_oper_log` VALUES ('211', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.upload', '384', '2016-02-13 20:17:27');
INSERT INTO `t_oper_log` VALUES ('212', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.upload', '440', '2016-02-13 20:43:45');
INSERT INTO `t_oper_log` VALUES ('213', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.upload', '392', '2016-02-13 20:44:17');
INSERT INTO `t_oper_log` VALUES ('214', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.upload', '363', '2016-02-13 20:49:12');
INSERT INTO `t_oper_log` VALUES ('215', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.upload', '486', '2016-02-13 20:51:48');
INSERT INTO `t_oper_log` VALUES ('216', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.upload', '385', '2016-02-13 21:10:11');
INSERT INTO `t_oper_log` VALUES ('217', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.upload', '368', '2016-02-13 21:10:48');
INSERT INTO `t_oper_log` VALUES ('218', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.upload', '315', '2016-02-13 21:11:08');
INSERT INTO `t_oper_log` VALUES ('219', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.upload', '382', '2016-02-13 21:21:43');
INSERT INTO `t_oper_log` VALUES ('220', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.upload', '328', '2016-02-13 21:22:25');
INSERT INTO `t_oper_log` VALUES ('221', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '235', '2016-02-13 21:28:02');
INSERT INTO `t_oper_log` VALUES ('222', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '9', '2016-02-13 21:28:07');
INSERT INTO `t_oper_log` VALUES ('223', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '5', '2016-02-13 22:49:24');
INSERT INTO `t_oper_log` VALUES ('224', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '15', '2016-02-13 22:49:43');
INSERT INTO `t_oper_log` VALUES ('225', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '43', '2016-02-13 22:49:54');
INSERT INTO `t_oper_log` VALUES ('226', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '8', '2016-02-13 22:49:56');
INSERT INTO `t_oper_log` VALUES ('227', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '8', '2016-02-13 22:50:03');
INSERT INTO `t_oper_log` VALUES ('228', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '11', '2016-02-13 22:50:05');
INSERT INTO `t_oper_log` VALUES ('229', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.updateProject', '4', '2016-02-13 22:54:08');
INSERT INTO `t_oper_log` VALUES ('230', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.updateProject', '4', '2016-02-13 22:55:09');
INSERT INTO `t_oper_log` VALUES ('231', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.updateProject', '2', '2016-02-13 22:58:10');
INSERT INTO `t_oper_log` VALUES ('232', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.updateProject', '4', '2016-02-13 23:09:52');
INSERT INTO `t_oper_log` VALUES ('233', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.updateProject', '4', '2016-02-13 23:11:58');
INSERT INTO `t_oper_log` VALUES ('234', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.createMaterial', '7', '2016-02-14 15:06:07');
INSERT INTO `t_oper_log` VALUES ('235', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.createMaterial', '4', '2016-02-14 15:14:40');
INSERT INTO `t_oper_log` VALUES ('236', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.updateMaterial', '8', '2016-02-14 15:15:25');
INSERT INTO `t_oper_log` VALUES ('237', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.updateMaterial', '4', '2016-02-14 15:16:49');
INSERT INTO `t_oper_log` VALUES ('238', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.updateMaterial', '5', '2016-02-14 15:20:10');
INSERT INTO `t_oper_log` VALUES ('239', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.updateMaterial', '4', '2016-02-14 15:20:22');
INSERT INTO `t_oper_log` VALUES ('240', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.deleteMaterial', '8', '2016-02-14 15:20:54');
INSERT INTO `t_oper_log` VALUES ('241', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.createMaterial', '3', '2016-02-14 15:20:57');
INSERT INTO `t_oper_log` VALUES ('242', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.deleteMaterial', '7', '2016-02-14 15:21:01');
INSERT INTO `t_oper_log` VALUES ('243', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '20', '2016-02-14 16:08:21');
INSERT INTO `t_oper_log` VALUES ('244', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '10', '2016-02-14 16:08:23');
INSERT INTO `t_oper_log` VALUES ('245', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.updateProject', '4', '2016-02-14 16:10:35');
INSERT INTO `t_oper_log` VALUES ('246', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.createModule', '7', '2016-02-14 16:10:45');
INSERT INTO `t_oper_log` VALUES ('247', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.upload', '1367', '2016-02-14 16:11:09');
INSERT INTO `t_oper_log` VALUES ('248', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.createModule', '4', '2016-02-14 16:14:19');
INSERT INTO `t_oper_log` VALUES ('249', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.updateModule', '3', '2016-02-14 16:14:22');
INSERT INTO `t_oper_log` VALUES ('250', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.deleteModule', '30', '2016-02-14 16:14:24');
INSERT INTO `t_oper_log` VALUES ('251', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.createMaterial', '3', '2016-02-14 16:14:43');
INSERT INTO `t_oper_log` VALUES ('252', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.updateMaterial', '3', '2016-02-14 16:14:46');
INSERT INTO `t_oper_log` VALUES ('253', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.deleteMaterial', '4', '2016-02-14 16:14:48');
INSERT INTO `t_oper_log` VALUES ('254', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.createMaterial', '3', '2016-02-14 16:15:53');
INSERT INTO `t_oper_log` VALUES ('255', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.updateMaterial', '4', '2016-02-14 16:15:57');
INSERT INTO `t_oper_log` VALUES ('256', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.deleteMaterial', '6', '2016-02-14 16:15:59');
INSERT INTO `t_oper_log` VALUES ('257', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.createMaterial', '5', '2016-02-14 16:37:07');
INSERT INTO `t_oper_log` VALUES ('258', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.createMaterial', '30', '2016-02-14 16:37:17');
INSERT INTO `t_oper_log` VALUES ('259', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.createMaterial', '8', '2016-02-14 16:37:19');
INSERT INTO `t_oper_log` VALUES ('260', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.createMaterial', '3', '2016-02-14 16:37:25');
INSERT INTO `t_oper_log` VALUES ('261', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.deleteSp', '7', '2016-02-14 16:37:26');
INSERT INTO `t_oper_log` VALUES ('262', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.createMaterial', '3', '2016-02-14 16:37:28');
INSERT INTO `t_oper_log` VALUES ('263', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.createMaterial', '40', '2016-02-14 16:37:32');
INSERT INTO `t_oper_log` VALUES ('264', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.deleteSp', '6', '2016-02-14 16:38:02');
INSERT INTO `t_oper_log` VALUES ('265', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.deleteSp', '5', '2016-02-14 16:38:04');
INSERT INTO `t_oper_log` VALUES ('266', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.deleteSp', '6', '2016-02-14 16:38:05');
INSERT INTO `t_oper_log` VALUES ('267', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.createMaterial', '8', '2016-02-14 16:38:27');
INSERT INTO `t_oper_log` VALUES ('268', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.createMaterial', '4', '2016-02-14 16:38:29');
INSERT INTO `t_oper_log` VALUES ('269', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.createMaterial', '5', '2016-02-14 16:39:32');
INSERT INTO `t_oper_log` VALUES ('270', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.createMaterial', '11', '2016-02-14 16:39:51');
INSERT INTO `t_oper_log` VALUES ('271', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.createMaterial', '7', '2016-02-14 16:43:10');
INSERT INTO `t_oper_log` VALUES ('272', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.createMaterial', '5', '2016-02-14 16:43:11');
INSERT INTO `t_oper_log` VALUES ('273', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.createMaterial', '5', '2016-02-14 16:43:42');
INSERT INTO `t_oper_log` VALUES ('274', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.createMaterial', '7', '2016-02-14 16:43:44');
INSERT INTO `t_oper_log` VALUES ('275', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.createMaterial', '6', '2016-02-14 16:43:46');
INSERT INTO `t_oper_log` VALUES ('276', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.createMaterial', '3', '2016-02-14 16:43:48');
INSERT INTO `t_oper_log` VALUES ('277', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.createMaterial', '8', '2016-02-14 16:43:50');
INSERT INTO `t_oper_log` VALUES ('278', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.deleteSp', '5', '2016-02-14 16:44:36');
INSERT INTO `t_oper_log` VALUES ('279', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.deleteSp', '6', '2016-02-14 16:44:38');
INSERT INTO `t_oper_log` VALUES ('280', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.deleteSp', '5', '2016-02-14 16:44:39');
INSERT INTO `t_oper_log` VALUES ('281', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.deleteSp', '4', '2016-02-14 16:44:41');
INSERT INTO `t_oper_log` VALUES ('282', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.deleteSp', '14', '2016-02-14 16:44:42');
INSERT INTO `t_oper_log` VALUES ('283', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.deleteSp', '4', '2016-02-14 16:44:43');
INSERT INTO `t_oper_log` VALUES ('284', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.deleteSp', '6', '2016-02-14 16:44:45');
INSERT INTO `t_oper_log` VALUES ('285', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.deleteSp', '4', '2016-02-14 16:44:47');
INSERT INTO `t_oper_log` VALUES ('286', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.deleteSp', '9', '2016-02-14 16:44:48');
INSERT INTO `t_oper_log` VALUES ('287', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.deleteSp', '5', '2016-02-14 16:44:49');
INSERT INTO `t_oper_log` VALUES ('288', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.deleteSp', '4', '2016-02-14 16:44:51');
INSERT INTO `t_oper_log` VALUES ('289', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.createMaterial', '9', '2016-02-14 16:44:59');
INSERT INTO `t_oper_log` VALUES ('290', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.createMaterial', '6', '2016-02-14 16:45:00');
INSERT INTO `t_oper_log` VALUES ('291', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.createMaterial', '3', '2016-02-14 16:45:02');
INSERT INTO `t_oper_log` VALUES ('292', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.deleteSp', '4', '2016-02-14 16:45:03');
INSERT INTO `t_oper_log` VALUES ('293', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.createMaterial', '3', '2016-02-14 16:45:04');
INSERT INTO `t_oper_log` VALUES ('294', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.deleteSp', '4', '2016-02-14 16:45:05');
INSERT INTO `t_oper_log` VALUES ('295', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.createMaterial', '3', '2016-02-14 16:49:47');
INSERT INTO `t_oper_log` VALUES ('296', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.createMaterial', '3', '2016-02-14 16:49:48');
INSERT INTO `t_oper_log` VALUES ('297', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.createMaterial', '5', '2016-02-14 16:49:49');
INSERT INTO `t_oper_log` VALUES ('298', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.createMaterial', '5', '2016-02-14 16:49:49');
INSERT INTO `t_oper_log` VALUES ('299', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.createMaterial', '33', '2016-02-14 16:50:38');
INSERT INTO `t_oper_log` VALUES ('300', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.deleteSp', '6', '2016-02-14 16:53:03');
INSERT INTO `t_oper_log` VALUES ('301', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.deleteSp', '6', '2016-02-14 16:53:05');
INSERT INTO `t_oper_log` VALUES ('302', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.deleteSp', '5', '2016-02-14 16:53:06');
INSERT INTO `t_oper_log` VALUES ('303', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.deleteSp', '4', '2016-02-14 16:53:08');
INSERT INTO `t_oper_log` VALUES ('304', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.deleteSp', '5', '2016-02-14 16:53:09');
INSERT INTO `t_oper_log` VALUES ('305', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.deleteSp', '6', '2016-02-14 16:53:10');
INSERT INTO `t_oper_log` VALUES ('306', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.deleteSp', '4', '2016-02-14 16:53:11');
INSERT INTO `t_oper_log` VALUES ('307', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.deleteSp', '3', '2016-02-14 16:53:13');
INSERT INTO `t_oper_log` VALUES ('308', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.createMaterial', '6', '2016-02-14 16:53:16');
INSERT INTO `t_oper_log` VALUES ('309', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.updateMaterial', '8', '2016-02-14 16:56:33');
INSERT INTO `t_oper_log` VALUES ('310', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.updateMaterial', '3', '2016-02-14 16:56:37');
INSERT INTO `t_oper_log` VALUES ('311', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.updateMaterial', '3', '2016-02-14 16:58:43');
INSERT INTO `t_oper_log` VALUES ('312', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.updateMaterial', '3', '2016-02-14 16:59:50');
INSERT INTO `t_oper_log` VALUES ('313', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.updateMaterial', '3', '2016-02-14 17:00:17');
INSERT INTO `t_oper_log` VALUES ('314', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.BrandController.updateBrand', '5', '2016-02-14 17:24:19');
INSERT INTO `t_oper_log` VALUES ('315', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.BrandController.updateBrand', '3', '2016-02-14 17:24:47');
INSERT INTO `t_oper_log` VALUES ('316', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.BrandController.deleteBrand', '9', '2016-02-14 17:24:54');
INSERT INTO `t_oper_log` VALUES ('317', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.BrandController.deleteBrand', '5', '2016-02-14 17:25:03');
INSERT INTO `t_oper_log` VALUES ('318', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.BrandController.createBrand', '3', '2016-02-14 17:26:40');
INSERT INTO `t_oper_log` VALUES ('319', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.BrandController.deleteBrand', '4', '2016-02-14 17:26:41');
INSERT INTO `t_oper_log` VALUES ('320', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.BrandController.deleteBrand', '6', '2016-02-14 17:26:43');
INSERT INTO `t_oper_log` VALUES ('321', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.BrandController.deleteBrand', '4', '2016-02-14 17:26:48');
INSERT INTO `t_oper_log` VALUES ('322', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '12', '2016-02-14 17:45:46');
INSERT INTO `t_oper_log` VALUES ('323', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '27', '2016-02-14 17:45:49');
INSERT INTO `t_oper_log` VALUES ('324', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.updateUser', '17', '2016-02-14 17:48:06');
INSERT INTO `t_oper_log` VALUES ('325', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '7', '2016-02-14 17:48:09');
INSERT INTO `t_oper_log` VALUES ('326', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '23', '2016-02-14 17:48:20');
INSERT INTO `t_oper_log` VALUES ('327', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.updateUser', '17', '2016-02-14 17:48:29');
INSERT INTO `t_oper_log` VALUES ('328', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.createUser', '8', '2016-02-14 17:50:11');
INSERT INTO `t_oper_log` VALUES ('329', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.createUser', '5', '2016-02-14 17:51:48');
INSERT INTO `t_oper_log` VALUES ('330', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '7', '2016-02-14 17:51:53');
INSERT INTO `t_oper_log` VALUES ('331', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '19', '2016-02-14 17:51:55');
INSERT INTO `t_oper_log` VALUES ('332', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.createApply', '31', '2016-02-14 23:52:17');
INSERT INTO `t_oper_log` VALUES ('333', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-02-15 00:04:54');
INSERT INTO `t_oper_log` VALUES ('334', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-02-15 00:06:28');
INSERT INTO `t_oper_log` VALUES ('335', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.generateExcel', '904', '2016-02-15 00:06:28');
INSERT INTO `t_oper_log` VALUES ('336', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.createMaterial', '3', '2016-02-15 00:26:26');
INSERT INTO `t_oper_log` VALUES ('337', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.createMaterial', '10', '2016-02-15 00:26:30');
INSERT INTO `t_oper_log` VALUES ('338', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.createMaterial', '7', '2016-02-15 00:31:26');
INSERT INTO `t_oper_log` VALUES ('339', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.deleteSp', '5', '2016-02-15 00:31:30');
INSERT INTO `t_oper_log` VALUES ('340', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.updateMaterial', '7', '2016-02-15 00:31:36');
INSERT INTO `t_oper_log` VALUES ('341', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.createMaterial', '4', '2016-02-15 00:31:42');
INSERT INTO `t_oper_log` VALUES ('342', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.updateMaterial', '3', '2016-02-15 00:31:45');
INSERT INTO `t_oper_log` VALUES ('343', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.deleteMaterial', '3', '2016-02-15 00:32:01');
INSERT INTO `t_oper_log` VALUES ('344', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.createMaterial', '3', '2016-02-15 00:32:03');
INSERT INTO `t_oper_log` VALUES ('345', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.deleteMaterial', '4', '2016-02-15 00:32:06');
INSERT INTO `t_oper_log` VALUES ('346', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.createModule', '14', '2016-02-15 00:32:12');
INSERT INTO `t_oper_log` VALUES ('347', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.updateModule', '3', '2016-02-15 00:32:16');
INSERT INTO `t_oper_log` VALUES ('348', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.deleteModule', '8', '2016-02-15 00:32:18');
INSERT INTO `t_oper_log` VALUES ('349', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '6', '2016-02-15 00:32:22');
INSERT INTO `t_oper_log` VALUES ('350', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.updateProject', '5', '2016-02-15 00:32:26');
INSERT INTO `t_oper_log` VALUES ('351', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.BrandController.createBrand', '6', '2016-02-15 00:32:33');
INSERT INTO `t_oper_log` VALUES ('352', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.BrandController.createBrand', '2', '2016-02-15 00:32:35');
INSERT INTO `t_oper_log` VALUES ('353', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.BrandController.updateBrand', '3', '2016-02-15 00:32:39');
INSERT INTO `t_oper_log` VALUES ('354', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.BrandController.deleteBrand', '4', '2016-02-15 00:32:41');
INSERT INTO `t_oper_log` VALUES ('355', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '12', '2016-02-15 00:32:46');
INSERT INTO `t_oper_log` VALUES ('356', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', '5', '2016-02-15 00:49:16');
INSERT INTO `t_oper_log` VALUES ('357', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', '5', '2016-02-15 00:50:41');
INSERT INTO `t_oper_log` VALUES ('358', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.createApply', '9', '2016-02-15 00:52:00');
INSERT INTO `t_oper_log` VALUES ('359', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', '5', '2016-02-15 00:52:05');
INSERT INTO `t_oper_log` VALUES ('360', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.createApply', '7', '2016-02-15 00:53:29');
INSERT INTO `t_oper_log` VALUES ('361', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', '5', '2016-02-15 00:53:34');
INSERT INTO `t_oper_log` VALUES ('362', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.createApply', '8', '2016-02-15 00:55:51');
INSERT INTO `t_oper_log` VALUES ('363', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', '4', '2016-02-15 00:55:59');
INSERT INTO `t_oper_log` VALUES ('364', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', '4', '2016-02-15 00:57:53');
INSERT INTO `t_oper_log` VALUES ('365', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', '5', '2016-02-15 00:58:45');
INSERT INTO `t_oper_log` VALUES ('366', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.createApply', '10', '2016-02-15 01:01:59');
INSERT INTO `t_oper_log` VALUES ('367', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', '6', '2016-02-15 01:02:05');
INSERT INTO `t_oper_log` VALUES ('368', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', '4', '2016-02-15 01:03:22');
INSERT INTO `t_oper_log` VALUES ('369', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', '8', '2016-02-15 01:03:24');
INSERT INTO `t_oper_log` VALUES ('370', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', '11', '2016-02-15 01:04:38');
INSERT INTO `t_oper_log` VALUES ('371', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.createApply', '12', '2016-02-15 01:06:06');
INSERT INTO `t_oper_log` VALUES ('372', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', '5', '2016-02-15 01:06:15');
INSERT INTO `t_oper_log` VALUES ('373', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', '5', '2016-02-15 01:06:42');
INSERT INTO `t_oper_log` VALUES ('374', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', '4', '2016-02-15 01:07:26');
INSERT INTO `t_oper_log` VALUES ('375', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', '5', '2016-02-15 01:07:41');
INSERT INTO `t_oper_log` VALUES ('376', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', '6', '2016-02-15 01:08:35');
INSERT INTO `t_oper_log` VALUES ('377', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', '4', '2016-02-15 01:11:09');
INSERT INTO `t_oper_log` VALUES ('378', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', '5', '2016-02-15 01:11:15');
INSERT INTO `t_oper_log` VALUES ('379', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.createApply', '8', '2016-02-15 01:12:44');
INSERT INTO `t_oper_log` VALUES ('380', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', '4', '2016-02-15 01:12:52');
INSERT INTO `t_oper_log` VALUES ('381', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', '5', '2016-02-15 01:17:38');
INSERT INTO `t_oper_log` VALUES ('382', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', '5', '2016-02-15 01:17:40');
INSERT INTO `t_oper_log` VALUES ('383', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.createApply', '7', '2016-02-15 01:20:37');
INSERT INTO `t_oper_log` VALUES ('384', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', '9', '2016-02-15 14:51:44');
INSERT INTO `t_oper_log` VALUES ('385', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', '8', '2016-02-15 14:51:46');
INSERT INTO `t_oper_log` VALUES ('386', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', '7', '2016-02-15 14:52:48');
INSERT INTO `t_oper_log` VALUES ('387', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', '8', '2016-02-15 14:53:55');
INSERT INTO `t_oper_log` VALUES ('388', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.createApply', '46', '2016-02-15 14:54:20');
INSERT INTO `t_oper_log` VALUES ('389', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', '28', '2016-02-15 14:54:26');
INSERT INTO `t_oper_log` VALUES ('390', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', '7', '2016-02-15 14:54:30');
INSERT INTO `t_oper_log` VALUES ('391', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', '6', '2016-02-15 14:54:32');
INSERT INTO `t_oper_log` VALUES ('392', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', '5', '2016-02-15 14:54:33');
INSERT INTO `t_oper_log` VALUES ('393', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.createApply', '8', '2016-02-15 16:57:16');
INSERT INTO `t_oper_log` VALUES ('394', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.createApply', '11', '2016-02-15 16:57:35');
INSERT INTO `t_oper_log` VALUES ('395', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.createApply', '8', '2016-02-15 16:58:14');
INSERT INTO `t_oper_log` VALUES ('396', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.createPurchase', '11', '2016-02-15 17:04:34');
INSERT INTO `t_oper_log` VALUES ('397', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '1', '2016-02-15 20:03:51');
INSERT INTO `t_oper_log` VALUES ('398', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.download', '1157', '2016-02-15 20:03:51');
INSERT INTO `t_oper_log` VALUES ('399', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-02-15 20:04:40');
INSERT INTO `t_oper_log` VALUES ('400', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.download', '81', '2016-02-15 20:04:41');
INSERT INTO `t_oper_log` VALUES ('401', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.updateArrived', '33', '2016-02-15 20:16:01');
INSERT INTO `t_oper_log` VALUES ('402', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.updateArrived', '6', '2016-02-15 20:18:29');
INSERT INTO `t_oper_log` VALUES ('403', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.updateArrived', '6', '2016-02-15 20:22:06');
INSERT INTO `t_oper_log` VALUES ('404', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.updateArrived', '5', '2016-02-15 20:24:36');
INSERT INTO `t_oper_log` VALUES ('405', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.updateArrived', '23', '2016-02-15 20:24:45');
INSERT INTO `t_oper_log` VALUES ('406', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.updateArrived', '6', '2016-02-15 20:25:14');
INSERT INTO `t_oper_log` VALUES ('407', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.updateArrived', '6', '2016-02-15 20:25:25');
INSERT INTO `t_oper_log` VALUES ('408', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.updateArrived', '5', '2016-02-15 20:28:51');
INSERT INTO `t_oper_log` VALUES ('409', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.updateArrived', '5', '2016-02-15 20:29:11');
INSERT INTO `t_oper_log` VALUES ('410', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.updateArrived', '17', '2016-02-15 20:29:32');
INSERT INTO `t_oper_log` VALUES ('411', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.updateArrived', '10', '2016-02-15 20:29:36');
INSERT INTO `t_oper_log` VALUES ('412', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.updateArrived', '6', '2016-02-15 20:29:40');
INSERT INTO `t_oper_log` VALUES ('413', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.updateArrived', '3', '2016-02-15 20:29:43');
INSERT INTO `t_oper_log` VALUES ('414', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.updateArrived', '4', '2016-02-15 21:03:15');
INSERT INTO `t_oper_log` VALUES ('415', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.updateArrived', '8', '2016-02-15 21:03:19');
INSERT INTO `t_oper_log` VALUES ('416', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.updateArrived', '3', '2016-02-15 21:03:41');
INSERT INTO `t_oper_log` VALUES ('417', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.updateArrived', '5', '2016-02-15 21:03:43');
INSERT INTO `t_oper_log` VALUES ('418', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.updateArrived', '3', '2016-02-15 21:03:47');
INSERT INTO `t_oper_log` VALUES ('419', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.updateArrived', '8', '2016-02-15 21:03:50');
INSERT INTO `t_oper_log` VALUES ('420', 'storage', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '1', '2016-02-16 00:18:11');
INSERT INTO `t_oper_log` VALUES ('421', 'storage', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.download', '1226', '2016-02-16 00:18:11');
INSERT INTO `t_oper_log` VALUES ('422', 'storage', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '1', '2016-02-16 00:19:39');
INSERT INTO `t_oper_log` VALUES ('423', 'storage', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.download', '33', '2016-02-16 00:19:39');
INSERT INTO `t_oper_log` VALUES ('424', 'storage', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-02-16 00:20:01');
INSERT INTO `t_oper_log` VALUES ('425', 'storage', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.download', '28', '2016-02-16 00:20:01');
INSERT INTO `t_oper_log` VALUES ('426', 'bossboss', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-02-16 00:31:15');
INSERT INTO `t_oper_log` VALUES ('427', 'bossboss', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.download', '61', '2016-02-16 00:31:15');
INSERT INTO `t_oper_log` VALUES ('428', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.updateProject', '7', '2016-02-16 00:34:10');
INSERT INTO `t_oper_log` VALUES ('429', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '116', '2016-02-16 00:34:13');
INSERT INTO `t_oper_log` VALUES ('430', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '9', '2016-02-16 00:34:20');
INSERT INTO `t_oper_log` VALUES ('431', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.upload', '1087', '2016-02-16 00:34:32');
INSERT INTO `t_oper_log` VALUES ('432', 'storage', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-02-16 00:52:10');
INSERT INTO `t_oper_log` VALUES ('433', 'storage', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.download', '32', '2016-02-16 00:52:10');
INSERT INTO `t_oper_log` VALUES ('434', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.createModule', '4', '2016-02-16 00:57:57');
INSERT INTO `t_oper_log` VALUES ('435', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.updateModule', '3', '2016-02-16 00:58:03');
INSERT INTO `t_oper_log` VALUES ('436', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.updateModule', '5', '2016-02-16 00:58:13');
INSERT INTO `t_oper_log` VALUES ('437', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.createMaterial', '5', '2016-02-16 00:58:17');
INSERT INTO `t_oper_log` VALUES ('438', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.createMaterial', '3', '2016-02-16 00:58:21');
INSERT INTO `t_oper_log` VALUES ('439', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.updateMaterial', '9', '2016-02-16 00:58:34');
INSERT INTO `t_oper_log` VALUES ('440', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.MaterialController.deleteMaterial', '4', '2016-02-16 00:58:36');
INSERT INTO `t_oper_log` VALUES ('441', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.createMaterial', '8', '2016-02-16 00:58:45');
INSERT INTO `t_oper_log` VALUES ('442', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.createMaterial', '6', '2016-02-16 00:58:48');
INSERT INTO `t_oper_log` VALUES ('443', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.updateMaterial', '3', '2016-02-16 00:59:00');
INSERT INTO `t_oper_log` VALUES ('444', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.updateMaterial', '8', '2016-02-16 00:59:02');
INSERT INTO `t_oper_log` VALUES ('445', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.updateMaterial', '4', '2016-02-16 00:59:06');
INSERT INTO `t_oper_log` VALUES ('446', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.deleteSp', '9', '2016-02-16 00:59:08');
INSERT INTO `t_oper_log` VALUES ('447', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.deleteSp', '8', '2016-02-16 00:59:11');
INSERT INTO `t_oper_log` VALUES ('448', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.SpController.createMaterial', '5', '2016-02-16 00:59:19');
INSERT INTO `t_oper_log` VALUES ('449', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.deleteModule', '11', '2016-02-16 00:59:44');
INSERT INTO `t_oper_log` VALUES ('450', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.BrandController.createBrand', '3', '2016-02-16 01:00:07');
INSERT INTO `t_oper_log` VALUES ('451', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.BrandController.deleteBrand', '4', '2016-02-16 01:00:10');
INSERT INTO `t_oper_log` VALUES ('452', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.BrandController.updateBrand', '5', '2016-02-16 01:00:15');
INSERT INTO `t_oper_log` VALUES ('453', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.BrandController.deleteBrand', '6', '2016-02-16 01:00:17');
INSERT INTO `t_oper_log` VALUES ('454', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.BrandController.deleteBrand', '6', '2016-02-16 01:00:19');
INSERT INTO `t_oper_log` VALUES ('455', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.updateUser', '11', '2016-02-16 01:00:41');
INSERT INTO `t_oper_log` VALUES ('456', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.updateUser', '9', '2016-02-16 01:00:55');
INSERT INTO `t_oper_log` VALUES ('457', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '13', '2016-02-16 01:01:01');
INSERT INTO `t_oper_log` VALUES ('458', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '24', '2016-02-16 01:01:03');
INSERT INTO `t_oper_log` VALUES ('459', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.createApply', '22', '2016-02-16 01:01:41');
INSERT INTO `t_oper_log` VALUES ('460', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.createApply', '8', '2016-02-16 01:02:15');
INSERT INTO `t_oper_log` VALUES ('461', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', '6', '2016-02-16 01:02:41');
INSERT INTO `t_oper_log` VALUES ('462', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.deleteApplyRecord', '5', '2016-02-16 01:02:45');
INSERT INTO `t_oper_log` VALUES ('463', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-02-16 01:02:59');
INSERT INTO `t_oper_log` VALUES ('464', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.generateExcel', '30', '2016-02-16 01:02:59');
INSERT INTO `t_oper_log` VALUES ('465', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.createPurchase', '11', '2016-02-16 01:04:25');
INSERT INTO `t_oper_log` VALUES ('466', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.updateArrived', '10', '2016-02-16 01:05:18');
INSERT INTO `t_oper_log` VALUES ('467', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.updateArrived', '5', '2016-02-16 01:05:26');
INSERT INTO `t_oper_log` VALUES ('468', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.updateArrived', '3', '2016-02-16 01:05:29');
INSERT INTO `t_oper_log` VALUES ('469', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.updateArrived', '5', '2016-02-16 01:05:33');
INSERT INTO `t_oper_log` VALUES ('470', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.createPurchase', '7', '2016-02-16 01:12:22');
INSERT INTO `t_oper_log` VALUES ('471', 'storage', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-02-16 01:42:51');
INSERT INTO `t_oper_log` VALUES ('472', 'storage', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.download', '20', '2016-02-16 01:42:51');
INSERT INTO `t_oper_log` VALUES ('473', 'storage', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-02-16 01:44:03');
INSERT INTO `t_oper_log` VALUES ('474', 'storage', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.download', '20', '2016-02-16 01:44:03');
INSERT INTO `t_oper_log` VALUES ('475', 'storage', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-02-16 01:44:43');
INSERT INTO `t_oper_log` VALUES ('476', 'storage', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.download', '15', '2016-02-16 01:44:43');
INSERT INTO `t_oper_log` VALUES ('477', 'purchase', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.createPurchase', '6', '2016-02-16 01:46:15');
INSERT INTO `t_oper_log` VALUES ('478', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.updateArrived', '3', '2016-02-16 01:46:28');
INSERT INTO `t_oper_log` VALUES ('479', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.updateArrived', '8', '2016-02-16 01:46:46');
INSERT INTO `t_oper_log` VALUES ('480', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.updateArrived', '6', '2016-02-16 01:47:23');
INSERT INTO `t_oper_log` VALUES ('481', 'projectmanager', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.updateArrived', '5', '2016-02-16 01:47:30');
INSERT INTO `t_oper_log` VALUES ('482', 'bossboss', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.UserController.generateTempToken', '0', '2016-02-16 01:51:28');
INSERT INTO `t_oper_log` VALUES ('483', 'bossboss', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.OrderController.download', '666', '2016-02-16 01:51:28');
INSERT INTO `t_oper_log` VALUES ('484', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '10', '2016-02-17 00:21:10');
INSERT INTO `t_oper_log` VALUES ('485', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.upload', '724', '2016-02-17 00:21:23');
INSERT INTO `t_oper_log` VALUES ('486', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '27', '2016-02-17 00:25:45');
INSERT INTO `t_oper_log` VALUES ('487', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '56', '2016-02-17 00:25:52');
INSERT INTO `t_oper_log` VALUES ('488', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '112', '2016-02-17 00:25:56');
INSERT INTO `t_oper_log` VALUES ('489', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '44', '2016-02-17 00:26:01');
INSERT INTO `t_oper_log` VALUES ('490', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.deleteProject', '51', '2016-02-17 00:26:05');
INSERT INTO `t_oper_log` VALUES ('491', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ProjectController.createProject', '6', '2016-02-17 00:26:08');
INSERT INTO `t_oper_log` VALUES ('492', 'admin', '0:0:0:0:0:0:0:1', 'cn.oneayst.controller.ModuleController.upload', '290', '2016-02-17 00:26:13');

-- ----------------------------
-- Table structure for t_project
-- ----------------------------
DROP TABLE IF EXISTS `t_project`;
CREATE TABLE `t_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(45) NOT NULL,
  `create_date` date NOT NULL,
  `contract_no` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_project
-- ----------------------------
INSERT INTO `t_project` VALUES ('69', 'asda', '2016-02-17', 'dasdasd');

-- ----------------------------
-- Table structure for t_purchase
-- ----------------------------
DROP TABLE IF EXISTS `t_purchase`;
CREATE TABLE `t_purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_price` decimal(9,4) NOT NULL,
  `total_cost` decimal(11,4) NOT NULL,
  `purchase_amount` int(11) NOT NULL,
  `supplier` varchar(45) NOT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `arrived_amount` int(11) DEFAULT NULL,
  `serial_no` int(11) DEFAULT NULL,
  `list_no` varchar(45) DEFAULT NULL,
  `t_apply_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_t_purchase_t_manager1_idx` (`t_apply_id`) USING BTREE,
  KEY `idx_supplier` (`supplier`) USING BTREE,
  KEY `idx_serial_no` (`serial_no`) USING BTREE,
  KEY `idx_list_no` (`list_no`) USING BTREE,
  CONSTRAINT `fk_t_purchase_t_manager1` FOREIGN KEY (`t_apply_id`) REFERENCES `t_apply` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_purchase
-- ----------------------------

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(45) NOT NULL,
  `url` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_UNIQUE` (`role`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('13', 'admin', '/admin');
INSERT INTO `t_role` VALUES ('14', 'pm', '/pm');
INSERT INTO `t_role` VALUES ('15', 'purchase', '/purchase');
INSERT INTO `t_role` VALUES ('16', 'storage', '/storage');
INSERT INTO `t_role` VALUES ('18', 'boss', '/boss');

-- ----------------------------
-- Table structure for t_serial_no
-- ----------------------------
DROP TABLE IF EXISTS `t_serial_no`;
CREATE TABLE `t_serial_no` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `t_project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_table1_t_project1_idx` (`t_project_id`) USING BTREE,
  CONSTRAINT `fk_table1_t_project1` FOREIGN KEY (`t_project_id`) REFERENCES `t_project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_serial_no
-- ----------------------------
INSERT INTO `t_serial_no` VALUES ('123', '0', 'A', '69');
INSERT INTO `t_serial_no` VALUES ('124', '0', 'B', '69');

-- ----------------------------
-- Table structure for t_sp
-- ----------------------------
DROP TABLE IF EXISTS `t_sp`;
CREATE TABLE `t_sp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sp_name` varchar(1200) NOT NULL,
  `unit` varchar(20) NOT NULL,
  `t_material_id` int(11) NOT NULL,
  `contract_amount` int(11) NOT NULL,
  `t_brand_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_t_specification_t_material1_idx` (`t_material_id`) USING BTREE,
  KEY `fk_t_brand_id_idx` (`t_brand_id`) USING BTREE,
  CONSTRAINT `fk_t_brand_id` FOREIGN KEY (`t_brand_id`) REFERENCES `t_brand` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_specification_t_material1` FOREIGN KEY (`t_material_id`) REFERENCES `t_material` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3886 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_sp
-- ----------------------------
INSERT INTO `t_sp` VALUES ('3863', 'EK-2202M', '台', '3640', '1', '188');
INSERT INTO `t_sp` VALUES ('3864', 'EK-2219M', '台', '3641', '1', '188');
INSERT INTO `t_sp` VALUES ('3865', '这里空了。。', '/', '3642', '322', '188');
INSERT INTO `t_sp` VALUES ('3866', '10个通道，警报激活24V直流电源输入', '台', '3643', '1', '188');
INSERT INTO `t_sp` VALUES ('3867', 'EK-3302M', '台', '3644', '1', '188');
INSERT INTO `t_sp` VALUES ('3868', '', '台', '3645', '1', '188');
INSERT INTO `t_sp` VALUES ('3869', '可遥控10台CE-8010P十分区寻呼器', '台', '3646', '1', '188');
INSERT INTO `t_sp` VALUES ('3870', '这里也控了', '台', '3647', '1', '188');
INSERT INTO `t_sp` VALUES ('3871', 'EK-2302M', '台', '3648', '1', '188');
INSERT INTO `t_sp` VALUES ('3872', 'EK-2217M', '台', '3649', '1', '188');
INSERT INTO `t_sp` VALUES ('3873', 'EK-601', '只', '3650', '80', '188');
INSERT INTO `t_sp` VALUES ('3874', 'RVSP2*2.5', '/', '3651', '123', '188');
INSERT INTO `t_sp` VALUES ('3875', 'RVV2*1.5', '米', '3651', '5000', '188');
INSERT INTO `t_sp` VALUES ('3876', '2000*600*800', '台', '3652', '123', '188');
INSERT INTO `t_sp` VALUES ('3877', '32U', '台', '3652', '1', '188');
INSERT INTO `t_sp` VALUES ('3878', 'EB-240', '只', '3653', '12', '188');
INSERT INTO `t_sp` VALUES ('3879', 'EK-2110M', '台', '3654', '1', '188');
INSERT INTO `t_sp` VALUES ('3880', '额定功率：120W', '套', '3655', '4', '188');
INSERT INTO `t_sp` VALUES ('3881', 'EA-1200S', '台', '3656', '2', '188');
INSERT INTO `t_sp` VALUES ('3882', '额定功率：60W', '套', '3657', '49', '188');
INSERT INTO `t_sp` VALUES ('3883', 'AG-610', '只', '3658', '86', '188');
INSERT INTO `t_sp` VALUES ('3884', '4个独立通道，共4主/备功放', '台', '3659', '1', '188');
INSERT INTO `t_sp` VALUES ('3885', 'LM-418', '支', '3660', '1', '188');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `account` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `credentials_salt` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_account` (`account`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('19', '管理员', 'admin', '334f78dc5d9a5095e98d1329d80bc1d5', 'efc9ed4a0114a543954be92bedee0e62');
INSERT INTO `t_user` VALUES ('20', '项目经理', 'projectmanager', '50c79b116f9ab18aeacf9dd1938a3396', 'e27ec602a39889d1e7b5a448a71cd6d0');
INSERT INTO `t_user` VALUES ('21', '采购部', 'purchase', '67a34ac3a45b9ceab4703f22c37fb53e', 'a94c59c483594b29fc46c4fa2fc66aae');
INSERT INTO `t_user` VALUES ('22', '库管', 'storage', 'db3fdece61090f872f28c65ede1b21a5', 'f49f5f1b171563342c9d0db6fbb3a8b6');
INSERT INTO `t_user` VALUES ('27', '老板', 'bossboss', '3b9a9a2fe21fd7492c665d4b6ff67693', '350b4db31635e63aa0ba0d38f46c64ac');
INSERT INTO `t_user` VALUES ('32', '______', '_delete_', 'e1b33bf8b992cafeff446d27423ba6f9', '3e91ec5b28ce94fc109159b8ef7cac1a');

-- ----------------------------
-- Table structure for t_user_t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_t_role`;
CREATE TABLE `t_user_t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `t_user_id` int(11) NOT NULL,
  `t_role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_id1` (`t_user_id`),
  KEY `fk_role_id1` (`t_role_id`),
  CONSTRAINT `fk_role_id1` FOREIGN KEY (`t_role_id`) REFERENCES `t_role` (`id`),
  CONSTRAINT `fk_user_id1` FOREIGN KEY (`t_user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_t_role
-- ----------------------------
INSERT INTO `t_user_t_role` VALUES ('1', '19', '13');
INSERT INTO `t_user_t_role` VALUES ('2', '20', '14');
INSERT INTO `t_user_t_role` VALUES ('3', '21', '15');
INSERT INTO `t_user_t_role` VALUES ('4', '22', '16');
INSERT INTO `t_user_t_role` VALUES ('6', '27', '18');
