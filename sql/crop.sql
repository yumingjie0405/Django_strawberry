/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : crop

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 09/06/2023 15:54:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for apple_prices
-- ----------------------------
DROP TABLE IF EXISTS `apple_prices`;
CREATE TABLE `apple_prices`  (
  `date` date NULL DEFAULT NULL,
  `price_min` float NULL DEFAULT NULL,
  `price_max` float NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of apple_prices
-- ----------------------------
INSERT INTO `apple_prices` VALUES ('2022-02-08', 0.8, 2.9);
INSERT INTO `apple_prices` VALUES ('2022-01-04', 1, 2.9);
INSERT INTO `apple_prices` VALUES ('2021-11-03', 1, 2.6);
INSERT INTO `apple_prices` VALUES ('2021-10-11', 1, 2.4);
INSERT INTO `apple_prices` VALUES ('2021-09-08', 1.4, 3);
INSERT INTO `apple_prices` VALUES ('2021-08-16', 0.8, 2.4);
INSERT INTO `apple_prices` VALUES ('2021-08-09', 1, 2.4);
INSERT INTO `apple_prices` VALUES ('2021-08-02', 1.35, 2.4);
INSERT INTO `apple_prices` VALUES ('2021-07-26', 1.2, 2.4);
INSERT INTO `apple_prices` VALUES ('2021-07-23', 1.2, 2.5);
INSERT INTO `apple_prices` VALUES ('2021-07-21', 1.5, 2.4);
INSERT INTO `apple_prices` VALUES ('2021-07-12', 1.8, 2.4);
INSERT INTO `apple_prices` VALUES ('2021-07-07', 1.8, 2.5);
INSERT INTO `apple_prices` VALUES ('2021-07-06', 1.3, 2.5);
INSERT INTO `apple_prices` VALUES ('2021-06-30', 1.35, 2.5);
INSERT INTO `apple_prices` VALUES ('2021-06-14', 0.8, 2.8);
INSERT INTO `apple_prices` VALUES ('2021-02-02', 0.9, 2.5);
INSERT INTO `apple_prices` VALUES ('2020-10-01', 1.2, 2.2);
INSERT INTO `apple_prices` VALUES ('2020-09-08', 1, 1.8);
INSERT INTO `apple_prices` VALUES ('2020-09-01', 1, 1.5);
INSERT INTO `apple_prices` VALUES ('2020-08-03', 1, 3);
INSERT INTO `apple_prices` VALUES ('2020-07-13', 1.2, 2.6);
INSERT INTO `apple_prices` VALUES ('2020-05-11', 2, 3.2);
INSERT INTO `apple_prices` VALUES ('2019-12-13', 1.1, 2.1);
INSERT INTO `apple_prices` VALUES ('2019-10-05', 1.1, 1.9);
INSERT INTO `apple_prices` VALUES ('2019-05-08', 1, 2.2);
INSERT INTO `apple_prices` VALUES ('2018-11-15', 0.8, 2.1);
INSERT INTO `apple_prices` VALUES ('2018-10-23', 0.7, 1.7);
INSERT INTO `apple_prices` VALUES ('2018-10-18', 0.7, 1.2);
INSERT INTO `apple_prices` VALUES ('2018-10-08', 0.7, 1.4);
INSERT INTO `apple_prices` VALUES ('2018-09-14', 1, 1.6);
INSERT INTO `apple_prices` VALUES ('2018-09-10', 1, 1.8);
INSERT INTO `apple_prices` VALUES ('2018-09-07', 1.2, 1.8);
INSERT INTO `apple_prices` VALUES ('2018-09-03', 0.9, 1.8);
INSERT INTO `apple_prices` VALUES ('2018-08-30', 0.9, 1.6);
INSERT INTO `apple_prices` VALUES ('2018-08-20', 0.9, 1.7);
INSERT INTO `apple_prices` VALUES ('2018-08-13', 1, 1.85);
INSERT INTO `apple_prices` VALUES ('2018-08-02', 1, 2.1);
INSERT INTO `apple_prices` VALUES ('2018-07-25', 1, 2.3);
INSERT INTO `apple_prices` VALUES ('2018-07-18', 1.2, 2.4);
INSERT INTO `apple_prices` VALUES ('2018-07-13', 1.2, 2.3);
INSERT INTO `apple_prices` VALUES ('2018-07-09', 1, 2.3);
INSERT INTO `apple_prices` VALUES ('2018-07-04', 1, 2.2);
INSERT INTO `apple_prices` VALUES ('2018-06-26', 1.6, 2.7);
INSERT INTO `apple_prices` VALUES ('2018-06-18', 1.6, 2.2);
INSERT INTO `apple_prices` VALUES ('2018-06-11', 2, 2.2);
INSERT INTO `apple_prices` VALUES ('2018-06-04', 2, 2.6);
INSERT INTO `apple_prices` VALUES ('2018-05-30', 1.8, 2.7);
INSERT INTO `apple_prices` VALUES ('2018-05-08', 1.7, 2.9);
INSERT INTO `apple_prices` VALUES ('2018-05-01', 1.4, 2.9);
INSERT INTO `apple_prices` VALUES ('2018-04-16', 1.2, 2.9);
INSERT INTO `apple_prices` VALUES ('2018-03-31', 1.2, 2.8);
INSERT INTO `apple_prices` VALUES ('2018-03-13', 0.8, 2.8);
INSERT INTO `apple_prices` VALUES ('2018-01-09', 0.8, 2.5);
INSERT INTO `apple_prices` VALUES ('2017-12-01', 0.8, 2.2);
INSERT INTO `apple_prices` VALUES ('2017-10-30', 0.6, 2.1);
INSERT INTO `apple_prices` VALUES ('2017-09-28', 0.6, 1.6);
INSERT INTO `apple_prices` VALUES ('2017-09-25', 0.6, 1.5);
INSERT INTO `apple_prices` VALUES ('2017-09-21', 0.6, 1.6);
INSERT INTO `apple_prices` VALUES ('2017-09-05', 0.6, 1.8);
INSERT INTO `apple_prices` VALUES ('2017-08-29', 0.7, 1.9);
INSERT INTO `apple_prices` VALUES ('2017-08-23', 0.7, 1.6);
INSERT INTO `apple_prices` VALUES ('2017-08-17', 0.8, 1.9);
INSERT INTO `apple_prices` VALUES ('2017-08-10', 1, 1.9);
INSERT INTO `apple_prices` VALUES ('2017-08-08', 1, 1.8);
INSERT INTO `apple_prices` VALUES ('2017-08-02', 1.2, 1.9);
INSERT INTO `apple_prices` VALUES ('2017-07-28', 0.9, 1.8);
INSERT INTO `apple_prices` VALUES ('2017-07-21', 1, 1.8);
INSERT INTO `apple_prices` VALUES ('2017-07-14', 1, 2);
INSERT INTO `apple_prices` VALUES ('2017-07-09', 1, 2.4);
INSERT INTO `apple_prices` VALUES ('2017-06-22', 1.1, 2.5);
INSERT INTO `apple_prices` VALUES ('2017-06-21', 1.6, 2.6);
INSERT INTO `apple_prices` VALUES ('2017-06-19', 1.5, 2.5);
INSERT INTO `apple_prices` VALUES ('2017-06-08', 1, 2.5);
INSERT INTO `apple_prices` VALUES ('2017-06-01', 1.3, 1.8);
INSERT INTO `apple_prices` VALUES ('2017-05-15', 1, 1.9);
INSERT INTO `apple_prices` VALUES ('2017-05-05', 1.3, 2);
INSERT INTO `apple_prices` VALUES ('2017-04-24', 0.6, 1.9);
INSERT INTO `apple_prices` VALUES ('2017-04-13', 0.8, 2.2);
INSERT INTO `apple_prices` VALUES ('2017-01-23', 0.7, 2.2);
INSERT INTO `apple_prices` VALUES ('2017-01-09', 0.7, 2);
INSERT INTO `apple_prices` VALUES ('2017-01-05', 0.8, 2);
INSERT INTO `apple_prices` VALUES ('2017-01-03', 0.8, 2);
INSERT INTO `apple_prices` VALUES ('2016-12-22', 0.8, 2);
INSERT INTO `apple_prices` VALUES ('2016-12-12', 0.8, 2);
INSERT INTO `apple_prices` VALUES ('2016-11-15', 0.6, 2);
INSERT INTO `apple_prices` VALUES ('2016-11-07', 0.6, 1.7);
INSERT INTO `apple_prices` VALUES ('2016-10-24', 0.8, 1.7);
INSERT INTO `apple_prices` VALUES ('2016-10-17', 0.8, 1.3);
INSERT INTO `apple_prices` VALUES ('2016-10-10', 0.8, 1.8);
INSERT INTO `apple_prices` VALUES ('2016-09-19', 1, 1.6);
INSERT INTO `apple_prices` VALUES ('2016-09-13', 1, 1.8);
INSERT INTO `apple_prices` VALUES ('2016-08-30', 0.8, 1.8);
INSERT INTO `apple_prices` VALUES ('2016-08-10', 1, 1.9);
INSERT INTO `apple_prices` VALUES ('2016-08-08', 1, 1.4);
INSERT INTO `apple_prices` VALUES ('2016-08-03', 1, 1.4);
INSERT INTO `apple_prices` VALUES ('2016-07-20', 1, 1.5);
INSERT INTO `apple_prices` VALUES ('2016-07-14', 1, 1.3);
INSERT INTO `apple_prices` VALUES ('2016-07-11', 1.2, 2.2);
INSERT INTO `apple_prices` VALUES ('2016-07-06', 1.1, 2.2);
INSERT INTO `apple_prices` VALUES ('2016-07-04', 1, 2.2);
INSERT INTO `apple_prices` VALUES ('2016-07-01', 1.1, 2.2);
INSERT INTO `apple_prices` VALUES ('2016-06-24', 1, 2.2);
INSERT INTO `apple_prices` VALUES ('2016-06-23', 1, 2.3);
INSERT INTO `apple_prices` VALUES ('2016-06-20', 1.2, 2.3);
INSERT INTO `apple_prices` VALUES ('2016-06-15', 1, 2.3);
INSERT INTO `apple_prices` VALUES ('2016-06-13', 0.85, 2.3);
INSERT INTO `apple_prices` VALUES ('2016-06-06', 1, 2.2);
INSERT INTO `apple_prices` VALUES ('2016-06-03', 1.3, 2.2);
INSERT INTO `apple_prices` VALUES ('2016-06-01', 1.2, 2.2);
INSERT INTO `apple_prices` VALUES ('2016-04-25', 1, 2.2);
INSERT INTO `apple_prices` VALUES ('2016-04-15', 0.7, 2.2);
INSERT INTO `apple_prices` VALUES ('2016-04-12', 0.6, 2.2);
INSERT INTO `apple_prices` VALUES ('2016-03-30', 0.7, 2.1);
INSERT INTO `apple_prices` VALUES ('2016-03-08', 0.4, 2);
INSERT INTO `apple_prices` VALUES ('2016-03-01', 0.7, 2);
INSERT INTO `apple_prices` VALUES ('2016-02-22', 0.7, 2.5);
INSERT INTO `apple_prices` VALUES ('2016-02-09', 0.6, 2.5);
INSERT INTO `apple_prices` VALUES ('2016-01-19', 0.7, 2);
INSERT INTO `apple_prices` VALUES ('2016-01-12', 0.7, 1.9);
INSERT INTO `apple_prices` VALUES ('2016-01-04', 0.7, 1.2);
INSERT INTO `apple_prices` VALUES ('2015-12-16', 0.6, 1.2);
INSERT INTO `apple_prices` VALUES ('2015-12-08', 0.6, 1.4);
INSERT INTO `apple_prices` VALUES ('2015-12-01', 0.6, 1.5);
INSERT INTO `apple_prices` VALUES ('2015-11-23', 1, 1.5);
INSERT INTO `apple_prices` VALUES ('2015-11-04', 0.6, 1.3);
INSERT INTO `apple_prices` VALUES ('2015-10-28', 0.7, 1.3);
INSERT INTO `apple_prices` VALUES ('2015-10-20', 0.8, 1.3);
INSERT INTO `apple_prices` VALUES ('2015-09-23', 0.8, 1.5);
INSERT INTO `apple_prices` VALUES ('2015-09-04', 0.6, 1.5);
INSERT INTO `apple_prices` VALUES ('2015-09-01', 1, 1.5);
INSERT INTO `apple_prices` VALUES ('2015-08-25', 0.8, 1.4);
INSERT INTO `apple_prices` VALUES ('2015-08-12', 1, 1.5);
INSERT INTO `apple_prices` VALUES ('2015-08-06', 0.7, 1.5);
INSERT INTO `apple_prices` VALUES ('2015-08-04', 0.8, 1.8);
INSERT INTO `apple_prices` VALUES ('2015-07-16', 1, 2);
INSERT INTO `apple_prices` VALUES ('2015-07-01', 1, 2.1);
INSERT INTO `apple_prices` VALUES ('2015-06-22', 1.3, 2);
INSERT INTO `apple_prices` VALUES ('2015-06-16', 1.4, 2.1);
INSERT INTO `apple_prices` VALUES ('2015-06-09', 1.2, 2.1);
INSERT INTO `apple_prices` VALUES ('2015-05-21', 1, 2.1);
INSERT INTO `apple_prices` VALUES ('2015-05-20', 1.3, 2.1);
INSERT INTO `apple_prices` VALUES ('2015-05-07', 0.7, 2.1);
INSERT INTO `apple_prices` VALUES ('2015-05-04', 0.7, 2.2);
INSERT INTO `apple_prices` VALUES ('2015-04-15', 0.8, 2);
INSERT INTO `apple_prices` VALUES ('2015-04-01', 0.6, 2);
INSERT INTO `apple_prices` VALUES ('2015-03-11', 0.6, 2.2);
INSERT INTO `apple_prices` VALUES ('2015-03-04', 0.6, 1.85);
INSERT INTO `apple_prices` VALUES ('2015-02-16', 0.7, 1.8);
INSERT INTO `apple_prices` VALUES ('2015-02-02', 0.7, 2);
INSERT INTO `apple_prices` VALUES ('2015-01-21', 0.7, 1.7);
INSERT INTO `apple_prices` VALUES ('2015-01-16', 0.7, 1.6);
INSERT INTO `apple_prices` VALUES ('2015-01-08', 0.7, 1.5);
INSERT INTO `apple_prices` VALUES ('2014-12-18', 0.8, 1.6);
INSERT INTO `apple_prices` VALUES ('2014-12-11', 0.8, 1.8);
INSERT INTO `apple_prices` VALUES ('2014-12-09', 0.8, 2);
INSERT INTO `apple_prices` VALUES ('2014-12-05', 0.8, 1.8);
INSERT INTO `apple_prices` VALUES ('2014-12-01', 0.9, 1.8);
INSERT INTO `apple_prices` VALUES ('2014-11-14', 0.8, 1.1);
INSERT INTO `apple_prices` VALUES ('2014-11-10', 0.9, 1.2);
INSERT INTO `apple_prices` VALUES ('2014-11-04', 0.8, 1.2);
INSERT INTO `apple_prices` VALUES ('2014-10-30', 0.8, 1.3);
INSERT INTO `apple_prices` VALUES ('2014-10-14', 0.8, 1.2);
INSERT INTO `apple_prices` VALUES ('2014-10-06', 0.9, 1.2);
INSERT INTO `apple_prices` VALUES ('2014-09-26', 0.8, 1.2);
INSERT INTO `apple_prices` VALUES ('2014-09-25', 0.9, 1.3);
INSERT INTO `apple_prices` VALUES ('2014-09-15', 0.9, 1.8);
INSERT INTO `apple_prices` VALUES ('2014-09-11', 1, 1.3);
INSERT INTO `apple_prices` VALUES ('2014-09-08', 0.8, 1.3);
INSERT INTO `apple_prices` VALUES ('2014-08-26', 0.8, 2);
INSERT INTO `apple_prices` VALUES ('2014-08-20', 0.6, 2);
INSERT INTO `apple_prices` VALUES ('2014-08-11', 0.8, 2);
INSERT INTO `apple_prices` VALUES ('2014-08-04', 1, 2);
INSERT INTO `apple_prices` VALUES ('2014-07-30', 1, 1.6);
INSERT INTO `apple_prices` VALUES ('2014-07-21', 1, 2);
INSERT INTO `apple_prices` VALUES ('2014-07-07', 1, 2.1);
INSERT INTO `apple_prices` VALUES ('2014-06-24', 1.3, 2);
INSERT INTO `apple_prices` VALUES ('2014-06-13', 1.35, 2);
INSERT INTO `apple_prices` VALUES ('2014-06-12', 1.35, 1.6);
INSERT INTO `apple_prices` VALUES ('2014-05-27', 0.6, 1.5);
INSERT INTO `apple_prices` VALUES ('2014-05-26', 1, 1.9);
INSERT INTO `apple_prices` VALUES ('2014-05-22', 1.2, 2);
INSERT INTO `apple_prices` VALUES ('2014-05-21', 1, 2);
INSERT INTO `apple_prices` VALUES ('2014-05-19', 1, 1.5);
INSERT INTO `apple_prices` VALUES ('2014-05-15', 1, 1.9);
INSERT INTO `apple_prices` VALUES ('2014-05-14', 1.2, 1.9);
INSERT INTO `apple_prices` VALUES ('2014-05-12', 1, 2);
INSERT INTO `apple_prices` VALUES ('2014-05-07', 1.2, 1.9);
INSERT INTO `apple_prices` VALUES ('2014-04-30', 0.6, 2.1);
INSERT INTO `apple_prices` VALUES ('2014-04-29', 0.6, 2.1);
INSERT INTO `apple_prices` VALUES ('2014-04-28', 0.6, 2);
INSERT INTO `apple_prices` VALUES ('2014-04-25', 0.6, 2);
INSERT INTO `apple_prices` VALUES ('2014-04-24', 0.6, 2);
INSERT INTO `apple_prices` VALUES ('2014-04-23', 0.6, 2);
INSERT INTO `apple_prices` VALUES ('2014-04-22', 0.6, 1.8);
INSERT INTO `apple_prices` VALUES ('2014-04-17', 0.6, 2.1);
INSERT INTO `apple_prices` VALUES ('2014-04-16', 0.6, 1.8);
INSERT INTO `apple_prices` VALUES ('2014-04-15', 0.6, 2);
INSERT INTO `apple_prices` VALUES ('2014-04-14', 0.8, 2);
INSERT INTO `apple_prices` VALUES ('2014-04-08', 0.6, 2.2);
INSERT INTO `apple_prices` VALUES ('2014-04-07', 0.6, 2);
INSERT INTO `apple_prices` VALUES ('2014-04-04', 0.4, 2);
INSERT INTO `apple_prices` VALUES ('2014-04-03', 0.5, 2);
INSERT INTO `apple_prices` VALUES ('2014-04-01', 0.7, 1.5);
INSERT INTO `apple_prices` VALUES ('2014-03-28', 0.7, 1.7);
INSERT INTO `apple_prices` VALUES ('2014-03-24', 0.5, 2);
INSERT INTO `apple_prices` VALUES ('2014-03-17', 0.5, 1.5);
INSERT INTO `apple_prices` VALUES ('2014-03-13', 0.5, 1.9);
INSERT INTO `apple_prices` VALUES ('2014-03-11', 0.5, 2);
INSERT INTO `apple_prices` VALUES ('2014-03-05', 0.6, 2);
INSERT INTO `apple_prices` VALUES ('2014-03-04', 0.6, 1.4);
INSERT INTO `apple_prices` VALUES ('2014-02-26', 0.5, 2.1);
INSERT INTO `apple_prices` VALUES ('2014-02-24', 0.5, 1.5);
INSERT INTO `apple_prices` VALUES ('2014-02-21', 0, 1);
INSERT INTO `apple_prices` VALUES ('2014-02-19', 0.8, 2);
INSERT INTO `apple_prices` VALUES ('2014-02-14', 0.4, 2.2);
INSERT INTO `apple_prices` VALUES ('2014-02-12', 0.4, 1);
INSERT INTO `apple_prices` VALUES ('2014-02-10', 0.7, 2);
INSERT INTO `apple_prices` VALUES ('2014-02-07', 0.7, 2.2);
INSERT INTO `apple_prices` VALUES ('2014-02-05', 0.6, 1.7);
INSERT INTO `apple_prices` VALUES ('2014-01-31', 0.6, 2);
INSERT INTO `apple_prices` VALUES ('2014-01-24', 0.5, 2);
INSERT INTO `apple_prices` VALUES ('2014-01-22', 0.8, 2);
INSERT INTO `apple_prices` VALUES ('2014-01-17', 0.6, 1.4);
INSERT INTO `apple_prices` VALUES ('2014-01-15', 0.6, 1.9);
INSERT INTO `apple_prices` VALUES ('2014-01-13', 0.5, 1.9);
INSERT INTO `apple_prices` VALUES ('2014-01-10', 0.7, 1.3);
INSERT INTO `apple_prices` VALUES ('2014-01-08', 0.5, 1.2);
INSERT INTO `apple_prices` VALUES ('2014-01-06', 0.5, 1.3);
INSERT INTO `apple_prices` VALUES ('2014-01-03', 0.7, 1.3);

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add userinfo', 7, 'add_userinfo');
INSERT INTO `auth_permission` VALUES (26, 'Can change userinfo', 7, 'change_userinfo');
INSERT INTO `auth_permission` VALUES (27, 'Can delete userinfo', 7, 'delete_userinfo');
INSERT INTO `auth_permission` VALUES (28, 'Can view userinfo', 7, 'view_userinfo');
INSERT INTO `auth_permission` VALUES (29, 'Can add img', 8, 'add_img');
INSERT INTO `auth_permission` VALUES (30, 'Can change img', 8, 'change_img');
INSERT INTO `auth_permission` VALUES (31, 'Can delete img', 8, 'delete_img');
INSERT INTO `auth_permission` VALUES (32, 'Can view img', 8, 'view_img');
INSERT INTO `auth_permission` VALUES (33, 'Can add admin', 9, 'add_admin');
INSERT INTO `auth_permission` VALUES (34, 'Can change admin', 9, 'change_admin');
INSERT INTO `auth_permission` VALUES (35, 'Can delete admin', 9, 'delete_admin');
INSERT INTO `auth_permission` VALUES (36, 'Can view admin', 9, 'view_admin');
INSERT INTO `auth_permission` VALUES (37, 'Can add diseases pests', 10, 'add_diseasespests');
INSERT INTO `auth_permission` VALUES (38, 'Can change diseases pests', 10, 'change_diseasespests');
INSERT INTO `auth_permission` VALUES (39, 'Can delete diseases pests', 10, 'delete_diseasespests');
INSERT INTO `auth_permission` VALUES (40, 'Can view diseases pests', 10, 'view_diseasespests');
INSERT INTO `auth_permission` VALUES (41, 'Can add question', 11, 'add_question');
INSERT INTO `auth_permission` VALUES (42, 'Can change question', 11, 'change_question');
INSERT INTO `auth_permission` VALUES (43, 'Can delete question', 11, 'delete_question');
INSERT INTO `auth_permission` VALUES (44, 'Can view question', 11, 'view_question');
INSERT INTO `auth_permission` VALUES (45, 'Can add answer', 12, 'add_answer');
INSERT INTO `auth_permission` VALUES (46, 'Can change answer', 12, 'change_answer');
INSERT INTO `auth_permission` VALUES (47, 'Can delete answer', 12, 'delete_answer');
INSERT INTO `auth_permission` VALUES (48, 'Can view answer', 12, 'view_answer');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for crop_env
-- ----------------------------
DROP TABLE IF EXISTS `crop_env`;
CREATE TABLE `crop_env`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `N` int NULL DEFAULT NULL,
  `P` int NULL DEFAULT NULL,
  `K` int NULL DEFAULT NULL,
  `temperature` float NULL DEFAULT NULL,
  `humidity` float NULL DEFAULT NULL,
  `ph` float NULL DEFAULT NULL,
  `rainfall` float NULL DEFAULT NULL,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crop_env
-- ----------------------------
INSERT INTO `crop_env` VALUES (1, 90, 42, 43, 20.8797, 82.0027, 6.50299, 202.936, 'strawberry');
INSERT INTO `crop_env` VALUES (2, 85, 58, 41, 21.7705, 80.3196, 7.0381, 226.656, 'strawberry');
INSERT INTO `crop_env` VALUES (3, 60, 55, 44, 23.0045, 82.3208, 7.84021, 263.964, 'strawberry');
INSERT INTO `crop_env` VALUES (4, 74, 35, 40, 26.4911, 80.1584, 6.9804, 242.864, 'strawberry');
INSERT INTO `crop_env` VALUES (5, 78, 42, 42, 20.1302, 81.6049, 7.62847, 262.717, 'strawberry');
INSERT INTO `crop_env` VALUES (6, 69, 37, 42, 23.058, 83.3701, 7.07345, 251.055, 'strawberry');
INSERT INTO `crop_env` VALUES (7, 69, 55, 38, 22.7088, 82.6394, 5.70081, 271.325, 'strawberry');
INSERT INTO `crop_env` VALUES (8, 94, 53, 40, 20.2777, 82.8941, 5.71863, 241.974, 'strawberry');
INSERT INTO `crop_env` VALUES (9, 89, 54, 38, 24.5159, 83.5352, 6.68535, 230.446, 'strawberry');
INSERT INTO `crop_env` VALUES (10, 68, 58, 38, 23.224, 83.0332, 6.33625, 221.209, 'strawberry');
INSERT INTO `crop_env` VALUES (11, 91, 53, 40, 26.5272, 81.4175, 5.38617, 264.615, 'strawberry');
INSERT INTO `crop_env` VALUES (12, 90, 46, 42, 23.979, 81.4506, 7.50283, 250.083, 'strawberry');
INSERT INTO `crop_env` VALUES (13, 78, 58, 44, 26.8008, 80.8868, 5.10868, 284.436, 'strawberry');
INSERT INTO `crop_env` VALUES (14, 93, 56, 36, 24.015, 82.0569, 6.98435, 185.277, 'strawberry');
INSERT INTO `crop_env` VALUES (15, 94, 50, 37, 25.6659, 80.6638, 6.94802, 209.587, 'strawberry');
INSERT INTO `crop_env` VALUES (16, 60, 48, 39, 24.2821, 80.3003, 7.0423, 231.086, 'strawberry');
INSERT INTO `crop_env` VALUES (17, 85, 38, 41, 21.5871, 82.7884, 6.24905, 276.655, 'strawberry');
INSERT INTO `crop_env` VALUES (18, 91, 35, 39, 23.7939, 80.4182, 6.97086, 206.261, 'strawberry');
INSERT INTO `crop_env` VALUES (19, 77, 38, 36, 21.8653, 80.1923, 5.95393, 224.555, 'strawberry');
INSERT INTO `crop_env` VALUES (20, 88, 35, 40, 23.5794, 83.5876, 5.85393, 291.299, 'strawberry');
INSERT INTO `crop_env` VALUES (21, 89, 45, 36, 21.325, 80.4748, 6.44248, 185.497, 'strawberry');
INSERT INTO `crop_env` VALUES (22, 76, 40, 43, 25.1575, 83.1171, 5.07018, 231.384, 'strawberry');
INSERT INTO `crop_env` VALUES (23, 67, 59, 41, 21.9477, 80.9738, 6.01263, 213.356, 'strawberry');
INSERT INTO `crop_env` VALUES (24, 83, 41, 43, 21.0525, 82.6784, 6.25403, 233.108, 'strawberry');
INSERT INTO `crop_env` VALUES (25, 98, 47, 37, 23.4838, 81.3326, 7.37548, 224.058, 'strawberry');
INSERT INTO `crop_env` VALUES (26, 66, 53, 41, 25.0756, 80.5239, 7.77891, 257.004, 'strawberry');
INSERT INTO `crop_env` VALUES (27, 97, 59, 43, 26.3593, 84.044, 6.2865, 271.359, 'strawberry');
INSERT INTO `crop_env` VALUES (28, 97, 50, 41, 24.5292, 80.545, 7.07096, 260.263, 'strawberry');
INSERT INTO `crop_env` VALUES (29, 60, 49, 44, 20.7758, 84.4977, 6.24484, 240.081, 'strawberry');
INSERT INTO `crop_env` VALUES (30, 84, 51, 35, 22.3016, 80.6442, 6.0433, 197.979, 'strawberry');
INSERT INTO `crop_env` VALUES (31, 73, 57, 41, 21.4465, 84.9438, 5.82471, 272.202, 'strawberry');
INSERT INTO `crop_env` VALUES (32, 92, 35, 40, 22.1793, 80.3313, 6.35739, 200.088, 'strawberry');
INSERT INTO `crop_env` VALUES (33, 85, 37, 39, 24.5278, 82.7369, 6.36413, 224.676, 'strawberry');
INSERT INTO `crop_env` VALUES (34, 98, 53, 38, 20.2671, 81.639, 5.01451, 270.442, 'strawberry');
INSERT INTO `crop_env` VALUES (35, 88, 54, 44, 25.7354, 83.8827, 6.14941, 233.132, 'strawberry');
INSERT INTO `crop_env` VALUES (36, 95, 55, 42, 26.7953, 82.1481, 5.95066, 193.347, 'strawberry');
INSERT INTO `crop_env` VALUES (37, 99, 57, 35, 26.7575, 81.1773, 5.96037, 272.3, 'strawberry');
INSERT INTO `crop_env` VALUES (38, 95, 39, 36, 23.8633, 83.1525, 5.5614, 285.249, 'strawberry');
INSERT INTO `crop_env` VALUES (39, 60, 43, 44, 21.0194, 82.9522, 7.41624, 298.402, 'strawberry');
INSERT INTO `crop_env` VALUES (40, 63, 44, 41, 24.173, 83.7288, 5.58337, 257.034, 'strawberry');
INSERT INTO `crop_env` VALUES (41, 62, 42, 36, 22.7813, 82.0672, 6.43001, 248.718, 'strawberry');
INSERT INTO `crop_env` VALUES (42, 64, 45, 43, 25.6298, 83.5284, 5.53488, 209.9, 'strawberry');
INSERT INTO `crop_env` VALUES (43, 83, 60, 36, 25.597, 80.1451, 6.90399, 200.835, 'strawberry');
INSERT INTO `crop_env` VALUES (44, 82, 40, 40, 23.8307, 84.8136, 6.27148, 298.56, 'strawberry');
INSERT INTO `crop_env` VALUES (45, 85, 52, 45, 26.3136, 82.367, 7.22429, 265.536, 'strawberry');
INSERT INTO `crop_env` VALUES (46, 91, 35, 38, 24.8973, 80.5259, 6.13429, 183.679, 'strawberry');
INSERT INTO `crop_env` VALUES (47, 76, 49, 42, 24.9588, 84.4796, 5.20637, 196.956, 'strawberry');
INSERT INTO `crop_env` VALUES (48, 74, 39, 38, 23.2411, 84.592, 7.78205, 233.045, 'strawberry');
INSERT INTO `crop_env` VALUES (49, 79, 43, 39, 21.6663, 80.7096, 7.06278, 210.814, 'strawberry');
INSERT INTO `crop_env` VALUES (50, 88, 55, 45, 24.6354, 80.4136, 7.73037, 253.72, 'strawberry');
INSERT INTO `crop_env` VALUES (51, 60, 36, 43, 23.4312, 83.0631, 5.2862, 219.905, 'strawberry');
INSERT INTO `crop_env` VALUES (52, 76, 60, 39, 20.0454, 80.3478, 6.76624, 208.581, 'strawberry');
INSERT INTO `crop_env` VALUES (53, 93, 56, 42, 23.8572, 82.2257, 7.38276, 195.095, 'strawberry');
INSERT INTO `crop_env` VALUES (54, 65, 60, 43, 21.972, 81.8992, 5.65817, 227.364, 'strawberry');
INSERT INTO `crop_env` VALUES (55, 95, 52, 36, 26.2292, 83.8363, 5.54336, 286.508, 'strawberry');
INSERT INTO `crop_env` VALUES (56, 75, 38, 39, 23.4468, 84.7935, 6.21511, 283.934, 'strawberry');
INSERT INTO `crop_env` VALUES (57, 74, 54, 38, 25.6555, 83.4702, 7.12027, 217.379, 'strawberry');
INSERT INTO `crop_env` VALUES (58, 91, 36, 45, 24.4435, 82.4543, 5.95065, 267.976, 'strawberry');
INSERT INTO `crop_env` VALUES (59, 71, 46, 40, 20.2802, 82.1235, 7.23671, 191.954, 'strawberry');
INSERT INTO `crop_env` VALUES (60, 99, 55, 35, 21.7238, 80.239, 6.5017, 277.963, 'strawberry');
INSERT INTO `crop_env` VALUES (61, 72, 40, 38, 20.4145, 82.208, 7.59249, 245.151, 'strawberry');
INSERT INTO `crop_env` VALUES (62, 83, 58, 45, 25.7553, 83.5183, 5.87535, 245.663, 'strawberry');
INSERT INTO `crop_env` VALUES (63, 93, 58, 38, 20.6152, 83.7735, 6.9324, 279.545, 'strawberry');
INSERT INTO `crop_env` VALUES (64, 70, 36, 42, 21.8411, 80.7289, 6.94621, 202.384, 'strawberry');
INSERT INTO `crop_env` VALUES (65, 76, 47, 42, 20.0837, 83.2911, 5.73917, 263.637, 'strawberry');
INSERT INTO `crop_env` VALUES (66, 99, 41, 36, 24.458, 82.7484, 6.73865, 182.562, 'strawberry');
INSERT INTO `crop_env` VALUES (67, 99, 54, 37, 21.1435, 80.335, 5.59482, 198.673, 'strawberry');
INSERT INTO `crop_env` VALUES (68, 86, 59, 35, 25.7872, 82.1112, 6.94664, 243.512, 'strawberry');
INSERT INTO `crop_env` VALUES (69, 69, 46, 41, 23.6412, 80.286, 5.01214, 263.11, 'strawberry');
INSERT INTO `crop_env` VALUES (70, 91, 56, 37, 23.4319, 80.5689, 6.36347, 269.504, 'strawberry');
INSERT INTO `crop_env` VALUES (71, 61, 52, 41, 24.9767, 83.8918, 6.88043, 204.8, 'strawberry');
INSERT INTO `crop_env` VALUES (72, 67, 45, 38, 22.7279, 82.1707, 7.30041, 260.888, 'strawberry');
INSERT INTO `crop_env` VALUES (73, 79, 42, 37, 24.873, 82.8402, 6.58792, 295.609, 'strawberry');
INSERT INTO `crop_env` VALUES (74, 78, 43, 42, 21.3238, 83.0032, 7.28374, 192.32, 'strawberry');
INSERT INTO `crop_env` VALUES (75, 75, 54, 36, 26.2947, 84.5692, 7.02394, 257.491, 'strawberry');
INSERT INTO `crop_env` VALUES (76, 97, 36, 45, 22.2287, 81.8587, 6.93908, 278.079, 'strawberry');
INSERT INTO `crop_env` VALUES (77, 67, 47, 44, 26.7307, 81.786, 7.86847, 280.404, 'strawberry');
INSERT INTO `crop_env` VALUES (78, 73, 35, 38, 24.8892, 81.9793, 5.00531, 185.946, 'strawberry');
INSERT INTO `crop_env` VALUES (79, 77, 36, 37, 26.8844, 81.4603, 6.13613, 194.577, 'strawberry');
INSERT INTO `crop_env` VALUES (80, 81, 41, 38, 22.6785, 83.7287, 7.52408, 200.913, 'strawberry');
INSERT INTO `crop_env` VALUES (81, 68, 57, 43, 26.0887, 80.3798, 5.70694, 182.904, 'strawberry');
INSERT INTO `crop_env` VALUES (82, 72, 45, 35, 25.4298, 82.9468, 5.75851, 195.357, 'strawberry');
INSERT INTO `crop_env` VALUES (83, 61, 53, 43, 26.4032, 81.0564, 6.34961, 223.367, 'strawberry');
INSERT INTO `crop_env` VALUES (84, 67, 43, 39, 26.0437, 84.9691, 5.99997, 186.754, 'strawberry');
INSERT INTO `crop_env` VALUES (85, 67, 58, 39, 25.2827, 80.5437, 5.45359, 220.116, 'strawberry');
INSERT INTO `crop_env` VALUES (86, 66, 60, 38, 22.0858, 83.4704, 6.37258, 231.736, 'strawberry');
INSERT INTO `crop_env` VALUES (87, 82, 43, 38, 23.2862, 81.4332, 5.10559, 242.317, 'strawberry');
INSERT INTO `crop_env` VALUES (88, 84, 50, 44, 25.4859, 81.4063, 5.93534, 182.655, 'strawberry');
INSERT INTO `crop_env` VALUES (89, 81, 53, 42, 23.6758, 81.0357, 5.17782, 233.703, 'strawberry');
INSERT INTO `crop_env` VALUES (90, 91, 50, 40, 20.8248, 84.1342, 6.46239, 230.224, 'strawberry');
INSERT INTO `crop_env` VALUES (91, 93, 53, 38, 26.93, 81.9141, 7.06917, 290.679, 'strawberry');
INSERT INTO `crop_env` VALUES (92, 90, 44, 38, 23.8351, 83.8839, 7.47313, 241.201, 'strawberry');
INSERT INTO `crop_env` VALUES (93, 81, 45, 35, 26.5287, 80.1227, 6.15838, 218.916, 'strawberry');
INSERT INTO `crop_env` VALUES (94, 78, 40, 38, 26.4643, 83.8564, 7.54987, 248.226, 'strawberry');
INSERT INTO `crop_env` VALUES (95, 60, 51, 36, 22.6966, 82.8109, 6.02832, 256.996, 'strawberry');
INSERT INTO `crop_env` VALUES (96, 88, 46, 42, 22.6832, 83.4636, 6.60499, 194.265, 'strawberry');
INSERT INTO `crop_env` VALUES (97, 93, 47, 37, 21.5335, 82.14, 6.50034, 295.925, 'strawberry');
INSERT INTO `crop_env` VALUES (98, 60, 55, 45, 21.4087, 83.3293, 5.93575, 287.577, 'strawberry');
INSERT INTO `crop_env` VALUES (99, 78, 35, 44, 26.5435, 84.6735, 7.07266, 183.622, 'strawberry');
INSERT INTO `crop_env` VALUES (100, 65, 37, 40, 23.3591, 83.5951, 5.33332, 188.414, 'strawberry');

-- ----------------------------
-- Table structure for diseasespests
-- ----------------------------
DROP TABLE IF EXISTS `diseasespests`;
CREATE TABLE `diseasespests`  (
  `did` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `symptoms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nature` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `basicdesc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detailsdesc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `score` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dmethods` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`did`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of diseasespests
-- ----------------------------
INSERT INTO `diseasespests` VALUES ('1', '稻瘟病', '火烧瘟、嗑头瘟。', '稻瘟病在水稻整个生育期中都可发生，为害秧', '病害', '稻瘟病又名稻热病、火烧瘟、叩头瘟等，是由稻瘟病原菌引起的、发生在水稻的一种病害。稻瘟病在水稻整个生育期中都可发生，为害秧苗、叶片、穗、节等，分别称为苗瘟、叶瘟、穗瘟和节瘟', '稻瘟病分布遍及世界稻区，是稻作生产中的主要病害，其中以亚洲、非洲稻区发病为重。在中国地区一般山区重于平原，粳、糯重于籼稻，除华南稻区早稻重于晚稻外，其他稻区晚稻重于早稻。流行年份，一般减产10-20%，重的达40-50%，局部田块甚至颗粒无收,稻瘟病的防治方法主要有选用抗病品种，培育优质秧苗、肥水管理技术措施、加强田间管理、落实防治措施、化学药剂控制等。在稻瘟病流行以后，要切实掌握稻瘟病的发病症状、发病规律和发病原因，结合种植情况，采取科学可行的稻瘟病防治技术措施，树立起良好的预防理念，降低稻瘟病发生的可能性，避免给稻谷产量和质量造成损失', NULL, '使用化学药剂控制稻瘟病是最常见和最有效的方式，主要的药剂包括苯菌灵、三环唑、异丙硫脲和抗生素（如杀稻瘟菌素和春日霉素）。这些农药中含有植物活化剂、胆碱生物合成抑制剂和黑色素生物合成抑制剂，持续多年的使用表明，保留不同类别的化学物质以干扰稻瘟菌的抗性，对防治稻瘟病有很好的效果');
INSERT INTO `diseasespests` VALUES ('10', '暗黑金龟子', '蛴螬', '成虫黑褐色无光泽；腹部臀板不呈半月形，腹部节与节间中央部分分界线明显。', '虫害', '暗黑金龟子在华北各省发生，严重区在北京以南至淮河流域地区，特别是黄河沿岸县份，较为严重。', '暗黑金龟子，其腹部脂肪含量丰富(腹部能见脂肪粒和一条黑色带状物) ， 当受到攻击时会发出思思叫声。它是一种夜间活动的昆虫，可能会在夜间在有树木道路上或小树林里走路时在不知不觉中飞掉在动物和人的身上，偶尔要咬一小口骚扰宿主。白天它几乎会处于装死状态活动迟缓(装死时能在水表面漂浮而不被淹死)，晚间则变得十分活跃。', NULL, '防治成虫的措施:⑴在成虫盛发期，于闷热无风的傍晚或天黑以后8－10点钟点灯捕捉。⑵用2.5%敌百粉，或90%晶体敌百虫1,500～2,000倍液，于成虫主要栖息地和其活动、取食场所，进行地面喷布，效果也较好。⒉防治幼虫的措施:(1)药剂拌种：与防治蝼蛄的方法相同。⑵毒土防治：小麦返青后，开始发现蛴螬为害时，可每亩用2.5%敌百虫粉3－4斤加细土150斤拌匀，在麦垅旁开沟并须沟均匀撒下，然后耙平。玉米每亩用2.5%敌百虫粉4－5斤，效果较好。');
INSERT INTO `diseasespests` VALUES ('11', '玉米黄呆蓟马', '玉米蓟马、玉米黄蓟马、草蓟马', '长翅型雌成虫体长1．0—1．2mm，黄色', '虫害', '昆虫名，属缨翅目，蓟马科。分布在华北、新疆、甘肃、宁夏、江苏、四川、西藏、台湾等。寄主于玉米、蚕豆；苦英菜及小麦等禾本科作物。为害叶背致叶背面呈现断续的银白色条斑，伴随有小污点，叶正面与银白色相对的部', '英文名Grass thrips异名玉米蓟马、玉米黄蓟马、草蓟马 玉米黄呆蓟马,学名Anaphothrips obscurus (Müller)，异名Anaphothrips striatus (Osborn)。又称为玉米蓟马、玉米黄蓟马、草蓟马。属缨翅目，蓟马科。为害玉米、麦类、谷子、高粱、水稻等，苗期常见害虫。国内分布区北起北京、甘肃、新疆，南抵台湾、海南及广东、云南南境，东面滨海，西达新疆西陲，并由甘肃折入四川、云南，再向西发展，采于西藏的江孜、阿里～带在新疆及四川，均有严重为害报道国外分布于日本、澳大利亚及欧洲、非洲、北美洲等地。', NULL, '虫口密度大或有可能大发生的地块及时喷洒20%丁硫克百威乳油或10%吡虫啉可湿性粉剂、1，8%爱比菌素乳油、10%除尽乳油2000倍液、40%氧化乐果乳油1500倍液、25%辉丰快克乳油1500—2000倍液。');
INSERT INTO `diseasespests` VALUES ('12', '粘虫', '粟夜盗虫、剃枝虫。俗名五彩虫、麦蚕等', '体长15～17mm，翅展36～40mm。', '虫害', '粘虫是一种昆虫，为鳞翅目，夜蛾科。在中国除新疆未见报道外，遍布各地。寄主于麦、稻、粟、玉米等禾谷类粮食作物及棉花、豆类、蔬菜等16科104种以上植物。', '粘虫是一种昆虫，为鳞翅目，夜蛾科。在中国除新疆未见报道外，遍布各地。寄主于麦、稻、粟、玉米等禾谷类粮食作物及棉花、豆类、蔬菜等16科104种以上植物。幼虫食叶，大发生时可将作物叶片全部食光，造成严重损失。因其群聚性、迁飞性、杂食性、暴食性，成为全国性重要农业害虫。2012年8月14日，全国粘虫发生面积近5000万亩，危害程度近十年最重。2020年9月15日，粘虫被农业农村部列入一类农作物病虫害名录。', NULL, '生物诱杀成虫。利用成虫（夜蛾科）其成虫交配产卵前需要采食以补充能量的生物习性，采用具有其成虫喜欢气味配比出来的诱饵，配合少量杀虫剂进行生物诱杀。可以减少90%以上的化学农药使用量，大量诱杀成虫可以大大减少落卵量及幼虫危害。只需80～100米左右喷洒一行，大大减少人工成本，同时减少化学农药对食品以及环境的影响。');
INSERT INTO `diseasespests` VALUES ('13', '番茄畸形果病', '无', '花芽细咆分裂过旺，心皮数日增多，从而形成多心室的畸形果。', '病害', '番茄畸形果是番茄常见的病害之一，保护地、露地栽培均可危害，但保护地栽培重于露地栽培。果实产生畸形后，使果实降低或失去商品价值。', '番茄畸形果是番茄常见的病害之一，保护地、露地栽培均可危害，但保护地栽培重于露地栽培。果实产生畸形后，使果实降低或失去商品价值。', NULL, '选用不易产生畸形果的品种，发生畸形果后要及时摘除，以利正常花果的发育。(2)作好光温调控，培育抗逆力强的壮苗。提倡采用电热线快速育苗；苗床要光照充足并适时适量通风，幼苗破心后，直控制昼温20～25℃，夜温、3～17℃，以利花芽分化，育出节间短60天左右的适龄壮苗。(3)加强肥水管理，防止植株徒长。采用配方施肥，满足植株生长发育所需的营养条件，避免偏施氮肥，防止分化出多心皮及形成带状扁形花。(4)合理使用生长调节剂。幼苗出现徒长寸。勿过分采用降温或干旱控苗措施，而应在加强通风、适当控湿的基础上，喷施85%比久(B9)可溶性粉剂2000ppm控制徒长，这样既可提高幼苗质量，又不影响花芽分化。');
INSERT INTO `diseasespests` VALUES ('14', '番茄脐腐病', '蒂腐病', '番茄脐腐病仅发生在番茄果实上。以青果期至着色期前最易发病，发病初始在幼果脐部、花器残余部位及其附近产生水浸状斑，暗绿色，后扩大为暗褐色大斑。', '病害', '番茄脐腐病是番茄遇不适宜的环境条件时常见的生理失调症，仅发生在番茄果实上。', '番茄脐腐病是番茄遇不适宜的环境条件时常见的生理失调症，仅发生在番茄果实上。番茄脐腐病为番茄种植中的重要病害。特别是连茬种植的土地，发病率达3-5%，减产20-30%，严重时绝收，造成了很大的经济损失。', NULL, '补充钙素、施足基肥、合理配合。土壤缺钙时，每亩用消石灰或碳酸钙50千克均匀撒于地面并翻入耕层中。施足腐熟的农家肥人粪尿或鸡粪，增加追肥中的氮肥，并降低基肥氮的使用率。在番茄施氮时，若纯氮施用超过30千克/亩，就会导致脐腐病发病严重，所以控制氮肥用量成为了番茄增产的关键。另外，钙磷与钙钾合理配合，可显著提高番茄吸收总钙量和实吸钙量，改善番茄果实的品质。');
INSERT INTO `diseasespests` VALUES ('15', '棉铃虫', '棉铃实夜蛾', '前翅翅尖突伸，外缘较直，斑纹模糊不清，中横线由肾形斑下斜至翅后缘。', '虫害', '棉铃虫，Helicoverpa armigera （Hübner），鳞翅目，夜蛾科 [1]  ，广泛分布在中国及世界各地，中国棉区和蔬菜种植区均有发生。黄河流域棉区、长江流域棉区受害较重。近年来，新疆', '棉铃虫，Helicoverpa armigera （Hübner），鳞翅目，夜蛾科 [1]  ，广泛分布在中国及世界各地，中国棉区和蔬菜种植区均有发生。黄河流域棉区、长江流域棉区受害较重。近年来，新疆棉区也时有发生。寄主植物有30多科200余种。棉铃虫是棉花蕾铃期重要钻蛀性害虫，主要蛀食蕾、花、铃，也取食嫩叶。', NULL, '棉铃虫的防治要强化农业防治，从农业生产的整体出发合理布局作物，推广抗虫品种，改进栽培技术，压低棉铃虫发生基数。采用生物防治、诱杀成虫等无公害防治措施，控制各代虫口密度。针对主要为害世代，选用高效、低毒农药，以卵期和初龄幼虫阶段为防治重点，科学合理使用农药。');
INSERT INTO `diseasespests` VALUES ('16', '温室白粉虱', '小白蛾子', '成虫体长1-1.5mm，淡黄色。翅面覆盖白蜡粉，停息时双翅在体上合成屋脊状如蛾类，翅端半圆状遮住整个腹部，翅脉简单。', '虫害', '温室白粉虱是属同翅目、粉虱科的一种昆虫。1975年始于北京，现几乎遍布中国。寄主于黄瓜、菜豆、茄子、番茄、青椒、甘蓝、甜瓜、西瓜、花椰菜、白菜、油菜、萝卜、莴苣、魔芋、芹菜等各种蔬菜及花卉、农作物等2', '温室白粉虱是属同翅目、粉虱科的一种昆虫。1975年始于北京，现几乎遍布中国。寄主于黄瓜、菜豆、茄子、番茄、青椒、甘蓝、甜瓜、西瓜、花椰菜、白菜、油菜、萝卜、莴苣、魔芋、芹菜等各种蔬菜及花卉、农作物等200余种。成虫和若虫吸食植物汁液，被害叶片褪绿、变黄、萎蔫，甚至全株枯死。此外，由于其繁殖力强，繁殖速度快，种群数量庞大，群聚为害，并分泌大量蜜液，严重污染叶片和果实，往往引起煤污病的大发生，使蔬菜失去商品价值。除严重为害番茄、青椒、茄子、马铃薯等茄科作物外，也是严重为害黄瓜、菜豆的害虫。', NULL, '药剂防治应在虫口密度较低时早期施用，可选用25%噻嗪酮(扑虱灵)可湿性粉剂1000～1500倍液、10%联苯菊酯(天王星)乳油2000倍液、2.5%溴氰菊酯(敌杀死)乳油2000倍液、20%氰戊菊酯(速灭杀丁)乳油2000倍液、2.5%三氟氯氰菊酯(功夫)乳油3000倍液、灭扫利乳油2000～3000倍液等，每隔7～10天喷1次，连续防治3次。');
INSERT INTO `diseasespests` VALUES ('17', '柑橘黄龙病', '黄梢病、黄枯病、青果病', '春梢叶片转绿后，先在叶脉基部转黄后部分叶肉褪绿，叶脉逐渐黄化，叶片现不规则黄绿斑块。', '病害', '柑橘黄龙病又称黄梢病、黄枯病，是由亚洲韧皮杆菌所侵染所引起的、发生在柑橘上一种的毁性病害。严重影响产量和品质，甚至造成柑橘树枯死。', '世界上近50个国家和地区的柑橘种植区均会感染该病害，该病主要分布在南北美洲、亚洲、大洋洲、非洲等地，中国19个柑橘生产省（市、自治区）已有11个受到危害。 [2]  5月下旬开始发病，8-9月份最严重。春、夏季多雨，秋季干旱，发病重。施肥不足，果园地势低洼，排水不良，树冠郁闭，发病重。幼龄树较老龄树抗病，4-8年生树发病重。柑橘木虱发生重，柑橘黄龙病发生亦重。', NULL, '重技术，转观念：当前依然有很多果农没有意识到对田地大量施用农药、化肥会使土壤酸化，土质中的养分失去平衡，因此要转变果农对柑橘黄龙病的防治观念。另外，种植面积没有得到合理控制，病情发生后，为避免经济损失而不愿意砍除病树，加剧了病害的传播。对此应做到一经发现立即喷杀木虱，之后彻底挖除柑橘黄龙病树；用药控梢或杀梢，结合人工抹梢。利用药物控梢，在枝梢充分老熟后统一放梢、用药杀梢，可把新梢和早抽出的统一杀除，而人工很难把刚出的新梢芽抹除。此外，农业部门派遣专家对果农进行柑橘黄龙病和柑橘木虱相关知识的培训，组织果农利用早期物理技术、生物防治技术等控制木虱的繁殖和传播。');
INSERT INTO `diseasespests` VALUES ('18', '柑桔溃疡病', '柑橘溃疡病', '柑桔溃疡病主要为害叶片，枝梢、果实和萼片，形成木栓化稍隆起的病斑。病斑大小、形状、色泽因品种而异。', '病害', '柑桔溃疡病是由地毯黄单胞杆菌引起的、发生在柑桔的病害。主要为害叶片、枝梢、果实和萼片。植株受害后落叶、落果、树势衰弱，受害果实外形恶劣；受害苗木，叶片脱落，枝梢干枯，生长受阻，延迟出圃，严重时叶片落光', '柑桔溃疡病是一种世界性病害，也是中国柑桔产区重要病害之一。在中国除四川的大部分和贵州的部分地区外，都有不同程度的发生。发病果园损失率一般10-20%，严重的可达30%以上。在25-30℃条件下，雨量与发病成正相关。每次新梢生长都有一个发病高峰，尤以夏、秋梢较重。', NULL, '一般在春梢、夏梢、秋梢抽出后20毫升左右喷药预防，尤其是夏梢最易染病，即在新梢长出1厘米长时喷第一次药，以后每星期喷一次。春梢80%自剪时喷第1次药，使用“靓果安+沃丰素”，7-10毫升再喷1次（约谢花2/3时）。挂果树的夏梢一律抹除。秋梢于3-5厘米长时喷第1次药，隔7-10毫升喷1次。使用“靓果安”喷3次，遇台风多雨季节可再加喷1次。挂果树以保果为主，果实于谢花后20毫升喷第1次药，使用“靓果安+沃丰素”隔15毫升喷1次，连喷3次。掌握在谢花后的第10毫升、32毫升、55毫升各喷一次。预防药物可选用6000单位/毫升的“农用链霉素”加1%酒精、77%“可杀得”可湿性粉剂300倍液、“氧氯化铜”胶悬剂400倍等。治疗药物可选用克菌特700倍液，防治率可达90%。');
INSERT INTO `diseasespests` VALUES ('19', '粉虱', '烟粉虱、甘薯粉虱，俗称“小白蛾子”', '虫体淡黄色，翅白色，附有蜡粉，没有斑点，前翅脉一条不分叉，左右翅合拢呈屋脊状。', '虫害', '粉虱是同翅目粉虱科动物 ，是一类体型微小的植食性刺吸式昆虫，分布在世界各大动物区系，主要是热带和亚热带。', '粉虱是同翅目粉虱科动物 [1]  ，是一类体型微小的植食性刺吸式昆虫，分布在世界各大动物区系，主要是热带和亚热带。粉函科的科名来自希腊语：aleuro=wheaten flou白色的粉；aleurodes=like flour似粉状；粉风whitefly—词来源于其颜色和体型，\"粉\"指翅为白色，像小蛾子为其蜡腺分泌的白色蜡粉被其足涂抹到身体上而成，与鳞翅目昆虫的鳞片性质不同，但也有的种类的翅为黑色、红色或淡黄色的；\"虱“”形容其体型微小，最大不超过3mm。', NULL, '对温室作物而言，可应用防虫网来阻止粉虱进入；烟粉虱对黄色有强烈趋性，可在温室内设置黄板诱杀成虫；也有利用苘麻进行诱集防治的报道。另外一种减少农药使用次数、延缓害虫抗药性产生的方法就是高温闷杀法。该方法的具体处理方法是：温度在 45-48 ℃左右，相对湿度 90 %以上，保持 2h 的闷棚时间，这样处理烟粉虱可使其死亡率达到 100%。田间铺设反光膜驱避成虫，或悬挂黄板诱杀成虫，另外覆盖作物残茬或种植诱集作物对减轻烟粉虱的危害也有一定作用。');
INSERT INTO `diseasespests` VALUES ('2', '水稻白叶枯病', '着凤、过火风、白叶瘟', '水稻白叶枯病主要为害叶片，也可侵染叶鞘。', '病害', '水稻白叶枯病俗称着凤、过火风、白叶瘟等，是由水稻白叶枯病原细菌引起的、发生在水稻的一种病害。该病为害叶片，也可侵染叶鞘。是中国植物检疫对象', '水稻白叶枯病主要在华东、华中、华南稻区发生；一般在沿海、沿湖、丘陵和低洼易涝地区发生较为频繁，籼稻发病重于粳、糯稻， 双季晚稻重于双季早稻，单季中稻重于单季晚稻。多发生在孕穗抽穗阶段，如提前发病，可使抽穗延迟，穗形变小，粒数减少。孕穗后发病，粒重减轻，不实率增加。病株结实差，青粒多，米质松脆，出米率低，发芽率也低。如在分蘖期出现雕萎型白叶枯，造成稻株大量枯死，损失更大', NULL, '在水稻三叶期和移栽前5天各喷施1次10%三氯异氰脲酸500倍液，预防本田发病。大田施药适期应掌握在零星发病阶段，以消灭发病中心为主，防止扩大蔓延。常用的药剂有35%克壮·叶唑可湿性粉剂1500倍液，或50%氯溴异氰尿酸可湿性粉剂2000-3000倍液，或20%噻菌铜悬浮剂2000倍液，或3%中生菌素可湿性粉剂10000倍液，或15%叶枯唑可湿性粉剂2000倍液，或20%噻菌茂可湿性粉剂1500倍液，或72%硫酸链霉素可溶性粉剂3000倍液，或20%噻森铜悬浮剂2500倍液，或5%菌毒清水剂5000倍液，或45%代森铵水剂2000倍液喷雾');
INSERT INTO `diseasespests` VALUES ('20', '红蜘蛛', '红叶螨', '有足3对。越冬代幼螨红色，非越冬代幼螨黄色。越冬代若螨红色，非越冬代若螨黄色，体两侧有黑斑。', '虫害', '红蜘蛛，又名棉红蜘蛛，俗称大蜘蛛、大龙、砂龙等，学名叶螨，我国的种类以朱砂叶螨为主，属蛛形纲、蜱螨目、叶螨科。分布广泛，食性杂，可危害110多种植物。', '红蜘蛛，又名棉红蜘蛛，俗称大蜘蛛、大龙、砂龙等，学名叶螨，我国的种类以朱砂叶螨为主，属蛛形纲、蜱螨目、叶螨科。分布广泛，食性杂，可危害110多种植物。', NULL, '物理防治 可在枣树发芽和枣红蜘蛛即将上树为害前(约4月下旬)，应用无毒不干粘虫胶在树干中涂一闭合粘胶环，环宽约1厘米，2个月左右再涂一次，即可阻止枣红蜘蛛向树上转移为害，效果可达95%以上。');
INSERT INTO `diseasespests` VALUES ('21', '白腐病', '腐烂病、水烂或穗烂', '果穗腐烂', '病害', '葡萄白腐病是葡萄的主要病害，在中国各地均有发生，北方产区果实损失率15-20%，严重高达60%以上，甚至绝收。南方高温高湿地区发病更加严重。', '葡萄白腐病俗称腐烂病、水烂或穗烂，是由白腐垫壳孢侵染所引起的、发生在葡萄上的病害。主要危害果穗，也危害新梢、叶片等部位。白腐病是葡萄生长时期引起果实腐烂的最主要病害，高温多雨的夏秋季节是其多发期。发病后病果逐渐干缩，果粒或果穗易脱落，葡萄减产严重，病害大流行年份可能造成绝收。', NULL, '对重病果园，发病前将50%福美双粉剂、硫黄粉、碳酸钙混匀后撒在葡萄园地面上，每亩撒1-2千克，或用200倍液五氯酚钠、退菌特喷洒地面。');
INSERT INTO `diseasespests` VALUES ('22', '葡萄黑痘病', '蛤蟆眼、火龙黑斑、鸟眼病', '葡萄黑痘病主要危害葡萄的绿色幼嫩部位，如果实、果梗、叶片、叶柄、新梢和卷须等。', '病害', '葡萄黑痘病又称疮痂病，俗称蛤蟆眼、火龙黑斑、鸟眼病，是由葡萄痂囊腔菌侵染所引起的、发生在葡萄上的病害。主要危害葡萄的绿色幼嫩部位，如果实、果梗、叶片、叶柄、新梢和卷须等。', '葡萄黑痘病又称疮痂病，俗称蛤蟆眼、火龙黑斑、鸟眼病，是由葡萄痂囊腔菌侵染所引起的、发生在葡萄上的病害。主要危害葡萄的绿色幼嫩部位，如果实、果梗、叶片、叶柄、新梢和卷须等。幼果受害，初期在果面上产生深褐色圆形小斑点，后扩大为圆形凹陷病斑，中部灰白色，外部深褐色，边缘紫褐色，似“鸟眼”状。葡萄黑痘病在中国各地均有发生。葡萄黑痘病的流行，和降雨、大气湿度及植株幼嫩情况有密切关系，尤以春季及初夏（4-6月）雨水多少的关系最大。多雨高湿有利于分生孢子的形成、传播和萌发侵入；同时，多雨、高湿，又造成寄主幼嫩组织的迅速成长，因此病害发生严重。天旱年份或少雨地区，发病显著减轻。葡萄黑痘病的发生时期因地区而异。', NULL, '由于葡萄黑痘病的无距离传播主要通过带病菌的苗木或插条，因此，葡萄园定西时应选择无病的苗木，或进行苗木消毒处理。常用的苗木消毒剂有：①10-15%的硫酸铵溶液；②3-5%的硫酸铜液；③硫酸亚铁硫酸液（10%的硫酸亚铁加1%的粗硫酸）；④3-5度波美的石硫合剂等。方法是将苗木或插条在上述任一种药液中浸泡3-5分钟取出即可定植或育苗。');
INSERT INTO `diseasespests` VALUES ('23', '蓟马', '蓟虫', '蓟马以成虫和若虫锉吸植株幼嫩组织（枝梢、叶片、花、果实等）汁液，被害的嫩叶、嫩梢变硬卷曲枯萎，植株生长缓慢，节间缩短。', '虫害', '蓟马是昆虫纲缨翅目的统称。幼虫呈白色、黄色、或橘色，成虫黄色、棕色或黑色；取食植物汁液或真菌。体微小，体长0.5-2mm，很少超过7mm。', '蓟马科Thripidae隶属于缨翅目Thysanoptera蓟马总科Thripoidea，全世界已知276属2000余种，包括针蓟马亚科Panchaetothripinae、棍蓟马亚科Dendrothripinae、绢蓟马亚科Sericothripinae和蓟马亚Thripinae 4个亚科。 该科昆虫广泛分布在世界各地，食性复杂，主要有植食性、菌食性和捕食性，其中植食性占一半以上，是重要的经济害虫之一。', NULL, '水稻苗期蓟马、飞虱：推荐用噻虫嗪类品种，进口品种锐胜30%噻虫嗪悬浮种衣剂，国内试验品种百瑞35%噻虫嗪悬浮种衣剂；');
INSERT INTO `diseasespests` VALUES ('24', '金龟子', '无', '长椭圆形，背翅坚硬，体长约20mm，宽约10mm。羽化初期为红棕色。', '虫害', '金龟子是鞘翅目金龟总科(Scarabaeoidea)的通称。其幼虫(蛴螬)是主要地下害虫之一，危害严重，常将植物的幼苗咬断，导致枯黄死亡。多种成虫又是农作物、林木、果树的大害虫，因此，正确鉴定种类学名', '金龟子是鞘翅目金龟总科(Scarabaeoidea)的通称。其幼虫(蛴螬)是主要地下害虫之一，危害严重，常将植物的幼苗咬断，导致枯黄死亡。多种成虫又是农作物、林木、果树的大害虫，因此，正确鉴定种类学名，研究和掌握其分类特征及生物学特性，对控制金龟子的危害，确保农、林业增产是至关重要的。金龟子的种类繁多，形态多样，是鞘翅目中大类群之一，全世界已记有20 000余种，我国目前已记录约1800种', NULL, '利用白僵菌，消灭幼虫；保护步行虫、青蛙、蟾蜍和鸟类，控制虫口密度上升。');
INSERT INTO `diseasespests` VALUES ('25', '霜霉病', '无', '主要危害叶片，由基部向上部叶发展。发病初期在叶面形成浅黄色近圆形至多角形病斑，容易并发角斑病。', '病害', '霜霉病指的是由真菌中的霜霉菌引起的植物病害。霜霉菌是专性寄生菌，极少数的霜霉菌已可人工培养，如引起谷子白发病的禾生指梗霉、引起白菜霜霉病的寄生霜霉。', '霜霉病指的是由真菌中的霜霉菌引起的植物病害。霜霉菌是专性寄生菌，极少数的霜霉菌已可人工培养，如引起谷子白发病的禾生指梗霉、引起白菜霜霉病的寄生霜霉。', NULL, '一是重病田要实行2-3年轮作。施足腐熟的有机肥，提高植株抗病能力。二是合理密植，科学浇水，防止大水漫灌，以防病害随水流传播。加强放风，降低湿度。三是如发现被霜霉病菌侵染的病株，要及时拔除，带出田外烧毁或深埋，同时，撒施生石灰处理定植穴，防止病源扩散。收获时，彻底清除残株落叶，并将其带到田外深埋或烧毁。');
INSERT INTO `diseasespests` VALUES ('26', '软腐病', '无', '由细菌引起的软腐病常因伴随的杂菌分解蛋白胶产生吲哚而发生恶臭；由黑根霉引起的软腐病在病组织表面生有灰黑色霉状物。', '病害', '结球甘蓝易发病，且发病较重。在结球甘蓝包心期至贮藏期发生。包心期被害时，发病初外叶在晴天呈萎蔫状下垂，而阴天或早晚均能恢复正常状态。', '结球甘蓝易发病，且发病较重。在结球甘蓝包心期至贮藏期发生。包心期被害时，发病初外叶在晴天呈萎蔫状下垂，而阴天或早晚均能恢复正常状态。随着病害不断加重，植株逐渐失去恢复能力而使整个或大部分叶片青枯。菜帮基部、茎基部或根上部先产生水渍状病斑，淡灰黄色，植物组织粘稠湿腐，成烂泥状，有恶臭味，病斑向上、下、左、右扩展蔓延，造成茎基和根、叶柄腐烂。', NULL, '提高栽培管理技术，加强农业防病措施：定植前土壤需深翻曝晒，前茬以豆类和葱蒜等作物最好；地势要排灌方便防止土壤粘重；适期播种定植，以避免包心期感病阶段与当地雨季相遇；缺水肥或蹲苗时间过长时，土壤于裂伤根或大水漫灌后幼苗猛长，叶柄上易产生自然裂口，常会给病菌侵染造成可乘之机，因此要增施底肥，及时灌水追肥，“一促到底”，不断清除病株烂叶，穴内施以消石灰进行灭菌。');
INSERT INTO `diseasespests` VALUES ('27', '菜粉蝶', '菜青虫、白粉蝶', '菜粉蝶属完全变态发育，分卵，幼虫，蛹，成虫四个阶段。', '虫害', '菜粉蝶，别名菜白蝶，幼虫又称菜青虫 [1]  ，是我国分布最普遍，危害最严重。', '菜粉蝶，别名菜白蝶，幼虫又称菜青虫 [1]  ，是我国分布最普遍，危害最严重，经常成灾的害虫。已知的寄主植物有9科35种之多，嗜食十字花科植物，特别偏食厚叶片的甘蓝、花椰菜、白菜、萝卜等。在缺少十字花科植物时，也可取食其他寄主植物，如菊科、白花菜科、金莲花科、百合科、紫草科、木犀科等植物。', NULL, '注意天敌的自然控制作用，保护广赤眼蜂、微红绒茧蜂、凤蝶金小蜂等天敌。在绒茧蜂发生盛期用每克含活孢子数100亿以上的青虫菌，或Bt可湿性粉剂800倍液喷雾。');
INSERT INTO `diseasespests` VALUES ('28', '蚜虫', '腻虫、蜜虫', '体长1.5～4.9毫米，多数约2毫米。有时被蜡粉，但缺蜡片。触角6节，少数5节，罕见4节。', '虫害', '蚜虫，又称腻虫、蜜虫，是一类植食性昆虫，包括蚜总科（又称蚜虫总科，学名：Aphidoidea）下的所有成员。已经发现的蚜虫总共有10个科约4400种，其中多数属于蚜科。', '蚜虫在世界范围内的分布十分广泛，但主要集中于温带地区。另外，物种的多样性在热带比在温带要低得多。蚜虫可以进行远程迁移，主要是通过随风飘荡的形式来进行扩散；例如，莴苣蚜虫被认为就是通过这种方式从新西兰传播到塔斯马尼亚。而一些人类活动也可以帮助蚜虫的迁移，例如对附着蚜虫的植物进行运输的过程。', NULL, '发现大量蚜虫时，及时喷施农药。用50%马拉松乳剂1000倍液，或 50%杀螟松乳剂1000倍液，或50%抗蚜威可湿性粉剂3000倍液，或2.5%溴氰菊酯乳剂3000倍液，或2.5%灭扫利乳剂3000倍液，或40%吡虫啉水溶剂1500～2000倍液等，喷洒植株1～2次；用1:6—1:8的比例配制辣椒水（煮半小时左右），或用1:20—1:30的比例配制洗衣粉水喷洒，或用1:20:400的比例配制洗衣粉、尿素、水混合溶液喷洒，连续喷洒植株2～3次；对桃粉蚜一类本身披有蜡粉的蚜虫，施用任何药剂时，均应加入1%肥皂水或洗衣粉,增加粘附力，提高防治效果。');
INSERT INTO `diseasespests` VALUES ('3', '水稻纹枯病', '云纹病、花足秆、烂脚瘟、眉目斑', '叶鞘染病在近水面处产生暗绿色水浸状边缘模', '病害', '水稻纹枯病是由立枯丝核菌侵染所引起的、发生在水稻上的病害。该病主要发生在叶鞘和叶片上。发病初期，先在近水面的叶鞘上发生椭圆形暗绿色的水渍状病斑，以后逐渐扩大成为云纹状，中部灰白色，潮湿时变为灰绿色。', '水稻纹枯病在中国稻区为害严重，主要分布在浙江、江苏、福建、广东、广西、湖南、湖北和台湾等省。该病多在高温、高湿条件下发生。水稻纹枯病的防治方法主要分为农业防治和药剂防治，药剂防治主要选用井冈霉素、甲基硫菌灵等进行防治。', NULL, '井冈霉素与枯草芽孢杆菌或蜡质芽孢杆菌的复配剂如纹曲宁等药剂，持效期比井冈霉素长，可以选用。丙环唑、烯唑醇、己唑醇等部分唑类杀菌剂对水稻纹枯病防治效果好，持效期较长。烯唑醇、丙环唑等唑类杀菌剂对水稻体内的赤霉素形成有影响，能抑制水稻茎节拔长。但这些杀菌农药在水稻上部3个拔长节间拔长期使用，特别是超量使用，可能影响这些节间的拔长，严重的可造成水稻抽穗不良，出现包颈现象，其中烯唑醇等药制的抑制作用更为明显。高科恶霉灵或苯醚甲环唑与丙环唑或腈菌唑等三唑类的复配剂在水稻抽穗前后可以使用。');
INSERT INTO `diseasespests` VALUES ('4', '稻螟虫', '水稻钻心虫', '三化螟雄蛾翅展18～23毫米，前翅灰褐色', '虫害', '稻螟虫，昆虫纲鳞翅目(Lepidoptera)螟蛾科蛀禾螟属的一种昆虫。 水稻害虫。俗名水稻钻心虫。', '稻螟虫rice stem borers   稻的害虫。属鳞翅目。中国的常见种类有：螟蛾科的三化螟、褐边螟、二化螟、台湾稻螟和夜蛾科的大螟。三化螟、二化螟和大螟是水稻的历史性大害虫。    在中国，三化螟主要分布在北纬37°～38°以南各稻区；', NULL, '一般在秋播时有计划地将绿肥留种田、迟熟冬作田，安排在旱地或螟害较轻的晚稻田上。冬耕冬沤，提早春耕灌水，使稻螟在预蛹期被淹死，从而压低有效虫源基数。选用螟害较轻的田块作绿肥田，以减少越冬虫源。合理布局，避免单、双季稻混栽和多品种插花种植，选种抗螟水稻品种和采取适宜的栽培技术。');
INSERT INTO `diseasespests` VALUES ('5', '稻瘿蚊', '稻瘿蝇', '似葫芦状，中间收缩，好像2节。中胸小盾板', '虫害', '稻瘿蚊，学名 Orseoia oryzae (Wood-Mason) ，双翅目，瘿蚊科的一种昆虫。别名 稻瘿蝇。', '在幼虫期吸食水稻生长点汁液，致使水稻不能抽穗。现分布于广东、广西、福建、云南、贵州、海南、江西、湖南、台湾。据江西广昌县观察，该虫从石城县进入广昌县以后，每年仍以10一20km的速度向北蔓延。寄主 水稻、李氏禾等。', NULL, '利用抗性资源，示范推广种植抗蚊品种如植选一号等。⑥注意保护利用天敌。⑧科学用药。秧田用药防治主要采用毒土畦面撒施方法。于秧苗起针到二叶一针期或移栽前5—7天，每667平方米用10%益舒宝或5%爱卡士、3%米乐尔颗粒剂1.25—1.5kg，也可用3%呋喃丹或3%甲基异柳磷颗粒剂3.5—4kg拌土10一15kg均匀撒施。施药秧田要保持浅薄水层，并让其自然落干，让田土带药，为了防止秧苗带虫，用90%晶体敌百虫800倍液或40%乐果乳油500倍液浸秧根后用薄膜覆盖5小时后移栽。');
INSERT INTO `diseasespests` VALUES ('6', '灰飞虱', '蛔虫', '头顶与前胸背板黄色雌虫则中部淡黄色，两侧暗褐色。前翅近于透明，具翅斑。胸、腹部腹面雄虫为黑褐色，雌虫色黄褐色，足皆淡褐色。', '虫害', '水稻灰飞虱，学名Laodelphax striatellus(Fallen)，属于同翅目，飞虱科。分布在中国各省，长江中下游和华北发生多。', '灰飞虱 Laodelphax striatellus ，是指属于同翅目飞虱科灰飞虱属的一种。主要分布区域，南自海南岛，北至黑龙江，东自台湾省和东部沿海各地，西至新疆均有发生，以长江中下游和华北地区发生较多。灰飞虱也是上海郊区普遍发生的稻飞虱,其危害方式与褐飞虱、白背飞虱类似。由于寄主是各种草坪禾草及水稻、麦类、玉米、稗等禾本科植物，所以对农业危害很大。是近年来间歇性大发生的害虫。它的带毒个体与稻、麦、玉米病毒病的流行直接有关。一般冬季气候温暖、春季比较干旱,是第一代灰飞虱大发生的预兆。', NULL, '根据水稻品种类型和飞虱发生情况，采取重点防治主害代低龄若虫高峰期的防治对策，如果成虫迁入量特别大而集中的年份和地区，采取防治迁入峰成虫和主害代低龄若虫高峰期相结合的对策。防治药剂：70%吡虫啉（高搏），20%吡蚜酮，0.5%藜芦碱可湿性粉剂，90%敌敌畏等常规防治');
INSERT INTO `diseasespests` VALUES ('7', '黑穗病', '散黑穗病', '丝黑穗病在抽穗后症状明显，病株一般较矮，抽穗前病穗的下部膨大苞叶紧实。', '病害', '黑穗病是高粱玉米等植物上发生普遍的病害，它包括丝黑穗病、散黑穗病、坚黑穗病。', '黑穗病是高粱玉米等植物上发生普遍的病害，它包括丝黑穗病、散黑穗病、坚黑穗病。', NULL, '提倡适期晚播，争取早出苗、出全苗。及时砍倒病株，在灰包破裂之前，将病株砍倒拉出地外集中销毁。');
INSERT INTO `diseasespests` VALUES ('8', '玉米炭疽病', '无', '病斑梭形至近梭形，中央浅褐色，四周深褐色。', '病害', '玉米炭疽病（corn anthracnose) 是一种针对玉米发作的真菌性病害。这是一个常见的玉米病害. 病原菌侵染玉米叶片和茎杆, 引起玉米茎基腐，造成玉米减产。', '玉米炭疽病（corn anthracnose) 是一种针对玉米发作的真菌性病害。这是一个常见的玉米病害. 病原菌侵染玉米叶片和茎杆, 引起玉米茎基腐，造成玉米减产。\n	危害的真菌为禾生炭疽菌 (Colletotrichum graminicola)，属于半知菌亚门。主要为害叶片：病斑梭形至近梭形，中央浅褐色，四周深褐色，大小2～4×1～2（mm），病部生有黑色小粒点，即病菌分生孢子盘，后期病斑融合，致叶片枯死。', NULL, '选用抗病品种。 垦粘2号、渝糯1号、西玉7号、白粘早玉米、黄粘早玉米等优良品种。');
INSERT INTO `diseasespests` VALUES ('9', '玉米叶斑病', '无', '主要为害叶片和苞叶。病斑不规则、透光，中央灰白色，边缘褐色。', '病害', '主要为害叶片和苞叶。病斑不规则、透光，中央灰白色，边缘褐色，上生黑色小点，即病原菌的子囊座。分布在吉林、辽宁、河南等省。', '主要为害叶片和苞叶。病斑不规则、透光，中央灰白色，边缘褐色，上生黑色小点，即病原菌的子囊座。分布在吉林、辽宁、河南等省。', NULL, '结合防治玉米其它叶斑病，及早喷洒75%百菌清可湿性粉剂1000倍液加70%甲基硫菌灵可湿性粉剂1000倍液或75%百菌清可湿性粉剂1000倍液加70%代森锰锌可湿性粉剂1000倍液、40%多·硫悬浮剂500倍液、50%复方硫菌灵可湿性粉剂800倍液，隔10天左右1次，连续防治1～2次。');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (9, 'HelloWorld', 'admin');
INSERT INTO `django_content_type` VALUES (12, 'HelloWorld', 'answer');
INSERT INTO `django_content_type` VALUES (10, 'HelloWorld', 'diseasespests');
INSERT INTO `django_content_type` VALUES (8, 'HelloWorld', 'img');
INSERT INTO `django_content_type` VALUES (11, 'HelloWorld', 'question');
INSERT INTO `django_content_type` VALUES (7, 'HelloWorld', 'userinfo');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0001_initial', '2023-04-28 07:29:20.258411');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2023-04-28 07:29:20.710297');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0001_initial', '2023-04-28 07:29:20.817658');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0002_logentry_remove_auto_add', '2023-04-28 07:29:20.826442');
INSERT INTO `django_migrations` VALUES (6, 'admin', '0003_logentry_add_action_flag_choices', '2023-04-28 07:29:20.834250');
INSERT INTO `django_migrations` VALUES (7, 'contenttypes', '0002_remove_content_type_name', '2023-04-28 07:29:20.921114');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0002_alter_permission_name_max_length', '2023-04-28 07:29:20.971866');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0003_alter_user_email_max_length', '2023-04-28 07:29:21.018714');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0004_alter_user_username_opts', '2023-04-28 07:29:21.026522');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0005_alter_user_last_login_null', '2023-04-28 07:29:21.071418');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0006_require_contenttypes_0002', '2023-04-28 07:29:21.075322');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0007_alter_validators_add_error_messages', '2023-04-28 07:29:21.083130');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0008_alter_user_username_max_length', '2023-04-28 07:29:21.130954');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0009_alter_user_last_name_max_length', '2023-04-28 07:29:21.181706');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0010_alter_group_name_max_length', '2023-04-28 07:29:21.229530');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0011_update_proxy_permissions', '2023-04-28 07:29:21.237339');
INSERT INTO `django_migrations` VALUES (18, 'auth', '0012_alter_user_first_name_max_length', '2023-04-28 07:29:21.286138');
INSERT INTO `django_migrations` VALUES (19, 'sessions', '0001_initial', '2023-04-28 07:29:21.314442');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('baycl85c0ukjmx4amuh42foh4zli7fn8', 'eyJpbmZvIjp7InVzZXJuYW1lIjoieW1qIiwicGFzc3dvcmQiOiIxMjM0NTYifX0:1pz86Y:ST7fmCVUBREwjo5godyB1zhGasgMoeo9BriVGoV0SPE', '2023-05-31 03:45:34.142124');
INSERT INTO `django_session` VALUES ('e5zeh59zt6scbi3xgwld8boiw6qvbt7x', 'eyJpbmZvIjp7InVzZXJuYW1lIjoieW1qIiwicGFzc3dvcmQiOiIxMjM0NTYifX0:1pwHM9:lHLtcgco2xB1AomBVtMzNVu6qyCf97y_6HQCVBSERJY', '2023-05-23 07:01:53.778567');
INSERT INTO `django_session` VALUES ('hugwa1i8q4dpn00ve8g4cg5w935j4a25', 'eyJpbmZvIjp7InVzZXJuYW1lIjoieW1qIiwicGFzc3dvcmQiOiIxMjM0NTYifX0:1q74np:-buC0MVAhYk5-gt_TmrEvkseNkYh8A4mPpDetINF7CI', '2023-06-22 01:51:05.508950');
INSERT INTO `django_session` VALUES ('msh1p0u2bzvo771ahtl7eosgvcw1n4ja', 'eyJpbmZvIjp7InVzZXJuYW1lIjoieW1qIiwicGFzc3dvcmQiOiIxMjM0NTYifX0:1pwCTN:HOJJqrsnzw770NOO8CAubE0xWl-0Fuz9W01nreo-LHA', '2023-05-09 02:49:01.627970');
INSERT INTO `django_session` VALUES ('p67e0r610q54yw7zugymob1865ymr7om', 'eyJpbmZvIjp7InVzZXJuYW1lIjoieW1qIiwicGFzc3dvcmQiOiIxMjM0NTYifX0:1pvwxB:2roaDP11id66a2R8g-xSw2sZIpt2mznfTA_tZsfyRUE', '2023-05-08 10:14:45.271059');
INSERT INTO `django_session` VALUES ('sauyvkvpuy1bm13gesjengetsyasoejn', 'eyJpbmZvIjp7InVzZXJuYW1lIjoieW1qIiwicGFzc3dvcmQiOiIxMjM0NTYifX0:1pwHOA:ELnkvjN57_j_Vq_VPxP76QAu5VSox64RGL8jYtK1_UY', '2023-05-23 07:03:58.383418');

-- ----------------------------
-- Table structure for helloworld_admin
-- ----------------------------
DROP TABLE IF EXISTS `helloworld_admin`;
CREATE TABLE `helloworld_admin`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of helloworld_admin
-- ----------------------------
INSERT INTO `helloworld_admin` VALUES (1, 'ymj', '123456');
INSERT INTO `helloworld_admin` VALUES (2, 'ymj', '123456');
INSERT INTO `helloworld_admin` VALUES (3, 'ymj', '123456');

-- ----------------------------
-- Table structure for helloworld_img
-- ----------------------------
DROP TABLE IF EXISTS `helloworld_img`;
CREATE TABLE `helloworld_img`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of helloworld_img
-- ----------------------------
INSERT INTO `helloworld_img` VALUES (1, 'img/14.jpg', '14.jpg');
INSERT INTO `helloworld_img` VALUES (2, 'img/14.jpg', '14.jpg');
INSERT INTO `helloworld_img` VALUES (3, 'img/14.jpg', '14.jpg');
INSERT INTO `helloworld_img` VALUES (4, 'img/14.jpg', '14.jpg');
INSERT INTO `helloworld_img` VALUES (5, 'img/14.jpg', '14.jpg');
INSERT INTO `helloworld_img` VALUES (6, 'img/14.jpg', '14.jpg');
INSERT INTO `helloworld_img` VALUES (7, 'img/14.jpg', '14.jpg');
INSERT INTO `helloworld_img` VALUES (8, 'img/14.jpg', '14.jpg');
INSERT INTO `helloworld_img` VALUES (9, 'img/14.jpg', '14.jpg');

-- ----------------------------
-- Table structure for helloworld_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `helloworld_userinfo`;
CREATE TABLE `helloworld_userinfo`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of helloworld_userinfo
-- ----------------------------

-- ----------------------------
-- Table structure for prices
-- ----------------------------
DROP TABLE IF EXISTS `prices`;
CREATE TABLE `prices`  (
  `date` date NULL DEFAULT NULL,
  `price_min` float NULL DEFAULT NULL,
  `price_max` float NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of prices
-- ----------------------------

-- ----------------------------
-- Table structure for solove_dis
-- ----------------------------
DROP TABLE IF EXISTS `solove_dis`;
CREATE TABLE `solove_dis`  (
  `key` int NOT NULL,
  `result` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of solove_dis
-- ----------------------------

-- ----------------------------
-- Table structure for strawberry_data
-- ----------------------------
DROP TABLE IF EXISTS `strawberry_data`;
CREATE TABLE `strawberry_data`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `crop` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of strawberry_data
-- ----------------------------
INSERT INTO `strawberry_data` VALUES (1, '北京市', '草莓', 10.8);
INSERT INTO `strawberry_data` VALUES (2, '天津市', '草莓', 8.2);
INSERT INTO `strawberry_data` VALUES (3, '河北省', '草莓', 23.5);
INSERT INTO `strawberry_data` VALUES (4, '山西省', '草莓', 15.6);
INSERT INTO `strawberry_data` VALUES (5, '辽宁省', '草莓', 18.7);
INSERT INTO `strawberry_data` VALUES (6, '吉林省', '草莓', 12.9);
INSERT INTO `strawberry_data` VALUES (7, '黑龙江省', '草莓', 14.3);
INSERT INTO `strawberry_data` VALUES (8, '上海市', '草莓', 9.6);
INSERT INTO `strawberry_data` VALUES (9, '江苏省', '草莓', 32.1);
INSERT INTO `strawberry_data` VALUES (10, '浙江省', '草莓', 29.7);
INSERT INTO `strawberry_data` VALUES (11, '安徽省', '草莓', 19.3);
INSERT INTO `strawberry_data` VALUES (12, '福建省', '草莓', 26.8);
INSERT INTO `strawberry_data` VALUES (13, '江西省', '草莓', 17.2);
INSERT INTO `strawberry_data` VALUES (14, '山东省', '草莓', 36.4);
INSERT INTO `strawberry_data` VALUES (15, '河南省', '草莓', 27.8);
INSERT INTO `strawberry_data` VALUES (16, '湖北省', '草莓', 15.9);
INSERT INTO `strawberry_data` VALUES (17, '湖南省', '草莓', 21.7);
INSERT INTO `strawberry_data` VALUES (18, '广东省', '草莓', 30.6);
INSERT INTO `strawberry_data` VALUES (19, '广西壮族自治区', '草莓', 12.4);
INSERT INTO `strawberry_data` VALUES (20, '海南省', '草莓', 4.5);
INSERT INTO `strawberry_data` VALUES (21, '重庆市', '草莓', 8.1);
INSERT INTO `strawberry_data` VALUES (22, '四川省', '草莓', 14.8);
INSERT INTO `strawberry_data` VALUES (23, '贵州省', '草莓', 9.7);
INSERT INTO `strawberry_data` VALUES (24, '云南省', '草莓', 13.6);
INSERT INTO `strawberry_data` VALUES (25, '西藏自治区', '草莓', 0.2);
INSERT INTO `strawberry_data` VALUES (26, '陕西省', '草莓', 12.1);
INSERT INTO `strawberry_data` VALUES (27, '甘肃省', '草莓', 17);
INSERT INTO `strawberry_data` VALUES (28, '青海省', '草莓', 18);
INSERT INTO `strawberry_data` VALUES (29, '宁夏回族自治区', '草莓', 27);
INSERT INTO `strawberry_data` VALUES (30, '新疆维吾尔自治区', '草莓', 35);

SET FOREIGN_KEY_CHECKS = 1;
