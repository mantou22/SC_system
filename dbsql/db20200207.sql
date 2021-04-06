/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : djangoadmin

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 07/02/2020 14:50:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 141 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `auth_permission` VALUES (25, 'Can add user', 7, 'add_user');
INSERT INTO `auth_permission` VALUES (26, 'Can change user', 7, 'change_user');
INSERT INTO `auth_permission` VALUES (27, 'Can delete user', 7, 'delete_user');
INSERT INTO `auth_permission` VALUES (28, 'Can view user', 7, 'view_user');
INSERT INTO `auth_permission` VALUES (29, 'Can add ftp info', 8, 'add_ftpinfo');
INSERT INTO `auth_permission` VALUES (30, 'Can change ftp info', 8, 'change_ftpinfo');
INSERT INTO `auth_permission` VALUES (31, 'Can delete ftp info', 8, 'delete_ftpinfo');
INSERT INTO `auth_permission` VALUES (32, 'Can view ftp info', 8, 'view_ftpinfo');
INSERT INTO `auth_permission` VALUES (33, 'Can add dict', 9, 'add_dict');
INSERT INTO `auth_permission` VALUES (34, 'Can change dict', 9, 'change_dict');
INSERT INTO `auth_permission` VALUES (35, 'Can delete dict', 9, 'delete_dict');
INSERT INTO `auth_permission` VALUES (36, 'Can view dict', 9, 'view_dict');
INSERT INTO `auth_permission` VALUES (37, 'Can add mt_form_upload_test', 10, 'add_mt_form_upload_test');
INSERT INTO `auth_permission` VALUES (38, 'Can change mt_form_upload_test', 10, 'change_mt_form_upload_test');
INSERT INTO `auth_permission` VALUES (39, 'Can delete mt_form_upload_test', 10, 'delete_mt_form_upload_test');
INSERT INTO `auth_permission` VALUES (40, 'Can view mt_form_upload_test', 10, 'view_mt_form_upload_test');
INSERT INTO `auth_permission` VALUES (41, 'Can add tooling_from_upload_test', 11, 'add_tooling_from_upload_test');
INSERT INTO `auth_permission` VALUES (42, 'Can change tooling_from_upload_test', 11, 'change_tooling_from_upload_test');
INSERT INTO `auth_permission` VALUES (43, 'Can delete tooling_from_upload_test', 11, 'delete_tooling_from_upload_test');
INSERT INTO `auth_permission` VALUES (44, 'Can view tooling_from_upload_test', 11, 'view_tooling_from_upload_test');
INSERT INTO `auth_permission` VALUES (45, 'Can add upload', 12, 'add_upload');
INSERT INTO `auth_permission` VALUES (46, 'Can change upload', 12, 'change_upload');
INSERT INTO `auth_permission` VALUES (47, 'Can delete upload', 12, 'delete_upload');
INSERT INTO `auth_permission` VALUES (48, 'Can view upload', 12, 'view_upload');
INSERT INTO `auth_permission` VALUES (49, 'Can add upload_test', 13, 'add_upload_test');
INSERT INTO `auth_permission` VALUES (50, 'Can change upload_test', 13, 'change_upload_test');
INSERT INTO `auth_permission` VALUES (51, 'Can delete upload_test', 13, 'delete_upload_test');
INSERT INTO `auth_permission` VALUES (52, 'Can view upload_test', 13, 'view_upload_test');
INSERT INTO `auth_permission` VALUES (53, 'Can add log', 14, 'add_log');
INSERT INTO `auth_permission` VALUES (54, 'Can change log', 14, 'change_log');
INSERT INTO `auth_permission` VALUES (55, 'Can delete log', 14, 'delete_log');
INSERT INTO `auth_permission` VALUES (56, 'Can view log', 14, 'view_log');
INSERT INTO `auth_permission` VALUES (57, 'Can add import_data', 15, 'add_import_data');
INSERT INTO `auth_permission` VALUES (58, 'Can change import_data', 15, 'change_import_data');
INSERT INTO `auth_permission` VALUES (59, 'Can delete import_data', 15, 'delete_import_data');
INSERT INTO `auth_permission` VALUES (60, 'Can view import_data', 15, 'view_import_data');
INSERT INTO `auth_permission` VALUES (61, 'Can add import_set', 16, 'add_import_set');
INSERT INTO `auth_permission` VALUES (62, 'Can change import_set', 16, 'change_import_set');
INSERT INTO `auth_permission` VALUES (63, 'Can delete import_set', 16, 'delete_import_set');
INSERT INTO `auth_permission` VALUES (64, 'Can view import_set', 16, 'view_import_set');
INSERT INTO `auth_permission` VALUES (65, 'Can add import_dict_set', 17, 'add_import_dict_set');
INSERT INTO `auth_permission` VALUES (66, 'Can change import_dict_set', 17, 'change_import_dict_set');
INSERT INTO `auth_permission` VALUES (67, 'Can delete import_dict_set', 17, 'delete_import_dict_set');
INSERT INTO `auth_permission` VALUES (68, 'Can view import_dict_set', 17, 'view_import_dict_set');
INSERT INTO `auth_permission` VALUES (69, 'Can add import_range_set', 18, 'add_import_range_set');
INSERT INTO `auth_permission` VALUES (70, 'Can change import_range_set', 18, 'change_import_range_set');
INSERT INTO `auth_permission` VALUES (71, 'Can delete import_range_set', 18, 'delete_import_range_set');
INSERT INTO `auth_permission` VALUES (72, 'Can view import_range_set', 18, 'view_import_range_set');
INSERT INTO `auth_permission` VALUES (73, 'Can add file_analysis_info', 19, 'add_file_analysis_info');
INSERT INTO `auth_permission` VALUES (74, 'Can change file_analysis_info', 19, 'change_file_analysis_info');
INSERT INTO `auth_permission` VALUES (75, 'Can delete file_analysis_info', 19, 'delete_file_analysis_info');
INSERT INTO `auth_permission` VALUES (76, 'Can view file_analysis_info', 19, 'view_file_analysis_info');
INSERT INTO `auth_permission` VALUES (77, 'Can add tip_no_create', 20, 'add_tip_no_create');
INSERT INTO `auth_permission` VALUES (78, 'Can change tip_no_create', 20, 'change_tip_no_create');
INSERT INTO `auth_permission` VALUES (79, 'Can delete tip_no_create', 20, 'delete_tip_no_create');
INSERT INTO `auth_permission` VALUES (80, 'Can view tip_no_create', 20, 'view_tip_no_create');
INSERT INTO `auth_permission` VALUES (81, 'Can add django job', 21, 'add_djangojob');
INSERT INTO `auth_permission` VALUES (82, 'Can change django job', 21, 'change_djangojob');
INSERT INTO `auth_permission` VALUES (83, 'Can delete django job', 21, 'delete_djangojob');
INSERT INTO `auth_permission` VALUES (84, 'Can view django job', 21, 'view_djangojob');
INSERT INTO `auth_permission` VALUES (85, 'Can add django job execution', 22, 'add_djangojobexecution');
INSERT INTO `auth_permission` VALUES (86, 'Can change django job execution', 22, 'change_djangojobexecution');
INSERT INTO `auth_permission` VALUES (87, 'Can delete django job execution', 22, 'delete_djangojobexecution');
INSERT INTO `auth_permission` VALUES (88, 'Can view django job execution', 22, 'view_djangojobexecution');
INSERT INTO `auth_permission` VALUES (89, 'Can add role', 23, 'add_role');
INSERT INTO `auth_permission` VALUES (90, 'Can change role', 23, 'change_role');
INSERT INTO `auth_permission` VALUES (91, 'Can delete role', 23, 'delete_role');
INSERT INTO `auth_permission` VALUES (92, 'Can view role', 23, 'view_role');
INSERT INTO `auth_permission` VALUES (93, 'Can add import_error_message', 24, 'add_import_error_message');
INSERT INTO `auth_permission` VALUES (94, 'Can change import_error_message', 24, 'change_import_error_message');
INSERT INTO `auth_permission` VALUES (95, 'Can delete import_error_message', 24, 'delete_import_error_message');
INSERT INTO `auth_permission` VALUES (96, 'Can view import_error_message', 24, 'view_import_error_message');
INSERT INTO `auth_permission` VALUES (97, 'Can add import_error_message_log', 25, 'add_import_error_message_log');
INSERT INTO `auth_permission` VALUES (98, 'Can change import_error_message_log', 25, 'change_import_error_message_log');
INSERT INTO `auth_permission` VALUES (99, 'Can delete import_error_message_log', 25, 'delete_import_error_message_log');
INSERT INTO `auth_permission` VALUES (100, 'Can view import_error_message_log', 25, 'view_import_error_message_log');
INSERT INTO `auth_permission` VALUES (101, 'Can add office', 26, 'add_office');
INSERT INTO `auth_permission` VALUES (102, 'Can change office', 26, 'change_office');
INSERT INTO `auth_permission` VALUES (103, 'Can delete office', 26, 'delete_office');
INSERT INTO `auth_permission` VALUES (104, 'Can view office', 26, 'view_office');
INSERT INTO `auth_permission` VALUES (105, 'Can add boolean_ info', 27, 'add_boolean_info');
INSERT INTO `auth_permission` VALUES (106, 'Can change boolean_ info', 27, 'change_boolean_info');
INSERT INTO `auth_permission` VALUES (107, 'Can delete boolean_ info', 27, 'delete_boolean_info');
INSERT INTO `auth_permission` VALUES (108, 'Can view boolean_ info', 27, 'view_boolean_info');
INSERT INTO `auth_permission` VALUES (109, 'Can add device_ info', 28, 'add_device_info');
INSERT INTO `auth_permission` VALUES (110, 'Can change device_ info', 28, 'change_device_info');
INSERT INTO `auth_permission` VALUES (111, 'Can delete device_ info', 28, 'delete_device_info');
INSERT INTO `auth_permission` VALUES (112, 'Can view device_ info', 28, 'view_device_info');
INSERT INTO `auth_permission` VALUES (113, 'Can add layout_ info', 29, 'add_layout_info');
INSERT INTO `auth_permission` VALUES (114, 'Can change layout_ info', 29, 'change_layout_info');
INSERT INTO `auth_permission` VALUES (115, 'Can delete layout_ info', 29, 'delete_layout_info');
INSERT INTO `auth_permission` VALUES (116, 'Can view layout_ info', 29, 'view_layout_info');
INSERT INTO `auth_permission` VALUES (117, 'Can add ml r_ info', 30, 'add_mlr_info');
INSERT INTO `auth_permission` VALUES (118, 'Can change ml r_ info', 30, 'change_mlr_info');
INSERT INTO `auth_permission` VALUES (119, 'Can delete ml r_ info', 30, 'delete_mlr_info');
INSERT INTO `auth_permission` VALUES (120, 'Can view ml r_ info', 30, 'view_mlr_info');
INSERT INTO `auth_permission` VALUES (121, 'Can add product_ info', 31, 'add_product_info');
INSERT INTO `auth_permission` VALUES (122, 'Can change product_ info', 31, 'change_product_info');
INSERT INTO `auth_permission` VALUES (123, 'Can delete product_ info', 31, 'delete_product_info');
INSERT INTO `auth_permission` VALUES (124, 'Can view product_ info', 31, 'view_product_info');
INSERT INTO `auth_permission` VALUES (125, 'Can add tapeout_ info', 32, 'add_tapeout_info');
INSERT INTO `auth_permission` VALUES (126, 'Can change tapeout_ info', 32, 'change_tapeout_info');
INSERT INTO `auth_permission` VALUES (127, 'Can delete tapeout_ info', 32, 'delete_tapeout_info');
INSERT INTO `auth_permission` VALUES (128, 'Can view tapeout_ info', 32, 'view_tapeout_info');
INSERT INTO `auth_permission` VALUES (129, 'Can add user_role', 33, 'add_user_role');
INSERT INTO `auth_permission` VALUES (130, 'Can change user_role', 33, 'change_user_role');
INSERT INTO `auth_permission` VALUES (131, 'Can delete user_role', 33, 'delete_user_role');
INSERT INTO `auth_permission` VALUES (132, 'Can view user_role', 33, 'view_user_role');
INSERT INTO `auth_permission` VALUES (133, 'Can add menu', 34, 'add_menu');
INSERT INTO `auth_permission` VALUES (134, 'Can change menu', 34, 'change_menu');
INSERT INTO `auth_permission` VALUES (135, 'Can delete menu', 34, 'delete_menu');
INSERT INTO `auth_permission` VALUES (136, 'Can view menu', 34, 'view_menu');
INSERT INTO `auth_permission` VALUES (137, 'Can add role_menu', 35, 'add_role_menu');
INSERT INTO `auth_permission` VALUES (138, 'Can change role_menu', 35, 'change_role_menu');
INSERT INTO `auth_permission` VALUES (139, 'Can delete role_menu', 35, 'delete_role_menu');
INSERT INTO `auth_permission` VALUES (140, 'Can view role_menu', 35, 'view_role_menu');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$120000$EUyXry9hEbfG$bP+XBVM3aAUpJdBZJf3xfnPD0CdNcTeVA7ATtbuds4s=', '2020-01-08 09:30:10.397867', 1, 'admin', '', '', 'admin@qxic.com', 1, 1, '2020-01-08 09:30:02.888358');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2020-01-08 09:30:40.588198', '128', 'DjangoJobExecution object (128)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (2, '2020-01-08 09:30:40.626641', '127', 'DjangoJobExecution object (127)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (3, '2020-01-08 09:30:40.638607', '126', 'DjangoJobExecution object (126)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (4, '2020-01-08 09:30:40.653141', '125', 'DjangoJobExecution object (125)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (5, '2020-01-08 09:30:40.662368', '124', 'DjangoJobExecution object (124)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (6, '2020-01-08 09:30:40.679524', '123', 'DjangoJobExecution object (123)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (7, '2020-01-08 09:30:40.696081', '122', 'DjangoJobExecution object (122)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (8, '2020-01-08 09:30:40.701494', '121', 'DjangoJobExecution object (121)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (9, '2020-01-08 09:30:40.706012', '120', 'DjangoJobExecution object (120)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (10, '2020-01-08 09:30:40.724558', '119', 'DjangoJobExecution object (119)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (11, '2020-01-08 09:30:40.736495', '118', 'DjangoJobExecution object (118)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (12, '2020-01-08 09:30:40.743433', '117', 'DjangoJobExecution object (117)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (13, '2020-01-08 09:30:40.764537', '116', 'DjangoJobExecution object (116)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (14, '2020-01-08 09:30:40.771590', '115', 'DjangoJobExecution object (115)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (15, '2020-01-08 09:30:40.777507', '114', 'DjangoJobExecution object (114)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (16, '2020-01-08 09:30:40.783221', '113', 'DjangoJobExecution object (113)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (17, '2020-01-08 09:30:40.791789', '112', 'DjangoJobExecution object (112)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (18, '2020-01-08 09:30:40.797098', '111', 'DjangoJobExecution object (111)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (19, '2020-01-08 09:30:40.799884', '110', 'DjangoJobExecution object (110)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (20, '2020-01-08 09:30:40.807816', '109', 'DjangoJobExecution object (109)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (21, '2020-01-08 09:30:40.809259', '108', 'DjangoJobExecution object (108)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (22, '2020-01-08 09:30:40.818491', '107', 'DjangoJobExecution object (107)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (23, '2020-01-08 09:30:40.823285', '106', 'DjangoJobExecution object (106)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (24, '2020-01-08 09:30:40.828157', '105', 'DjangoJobExecution object (105)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (25, '2020-01-08 09:30:40.840201', '104', 'DjangoJobExecution object (104)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (26, '2020-01-08 09:30:40.846108', '103', 'DjangoJobExecution object (103)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (27, '2020-01-08 09:30:40.850754', '102', 'DjangoJobExecution object (102)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (28, '2020-01-08 09:30:40.857569', '101', 'DjangoJobExecution object (101)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (29, '2020-01-08 09:30:40.865435', '100', 'DjangoJobExecution object (100)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (30, '2020-01-08 09:30:40.870949', '99', 'DjangoJobExecution object (99)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (31, '2020-01-08 09:30:40.876159', '98', 'DjangoJobExecution object (98)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (32, '2020-01-08 09:30:40.880132', '97', 'DjangoJobExecution object (97)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (33, '2020-01-08 09:30:40.889424', '96', 'DjangoJobExecution object (96)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (34, '2020-01-08 09:30:40.893778', '95', 'DjangoJobExecution object (95)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (35, '2020-01-08 09:30:40.899330', '94', 'DjangoJobExecution object (94)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (36, '2020-01-08 09:30:40.903294', '93', 'DjangoJobExecution object (93)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (37, '2020-01-08 09:30:40.907773', '92', 'DjangoJobExecution object (92)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (38, '2020-01-08 09:30:40.913105', '91', 'DjangoJobExecution object (91)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (39, '2020-01-08 09:30:40.923674', '90', 'DjangoJobExecution object (90)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (40, '2020-01-08 09:30:40.928654', '89', 'DjangoJobExecution object (89)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (41, '2020-01-08 09:30:40.932654', '88', 'DjangoJobExecution object (88)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (42, '2020-01-08 09:30:40.937777', '87', 'DjangoJobExecution object (87)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (43, '2020-01-08 09:30:40.951076', '86', 'DjangoJobExecution object (86)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (44, '2020-01-08 09:30:40.959361', '85', 'DjangoJobExecution object (85)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (45, '2020-01-08 09:30:40.966120', '84', 'DjangoJobExecution object (84)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (46, '2020-01-08 09:30:40.973782', '83', 'DjangoJobExecution object (83)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (47, '2020-01-08 09:30:40.987412', '82', 'DjangoJobExecution object (82)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (48, '2020-01-08 09:30:40.992237', '81', 'DjangoJobExecution object (81)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (49, '2020-01-08 09:30:41.001843', '80', 'DjangoJobExecution object (80)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (50, '2020-01-08 09:30:41.006817', '79', 'DjangoJobExecution object (79)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (51, '2020-01-08 09:30:41.011889', '78', 'DjangoJobExecution object (78)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (52, '2020-01-08 09:30:41.016955', '77', 'DjangoJobExecution object (77)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (53, '2020-01-08 09:30:41.021523', '76', 'DjangoJobExecution object (76)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (54, '2020-01-08 09:30:41.031054', '75', 'DjangoJobExecution object (75)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (55, '2020-01-08 09:30:41.041896', '74', 'DjangoJobExecution object (74)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (56, '2020-01-08 09:30:41.048080', '73', 'DjangoJobExecution object (73)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (57, '2020-01-08 09:30:41.053225', '72', 'DjangoJobExecution object (72)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (58, '2020-01-08 09:30:41.058186', '71', 'DjangoJobExecution object (71)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (59, '2020-01-08 09:30:41.062819', '70', 'DjangoJobExecution object (70)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (60, '2020-01-08 09:30:41.071433', '69', 'DjangoJobExecution object (69)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (61, '2020-01-08 09:30:41.076685', '68', 'DjangoJobExecution object (68)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (62, '2020-01-08 09:30:41.087331', '67', 'DjangoJobExecution object (67)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (63, '2020-01-08 09:30:41.092782', '66', 'DjangoJobExecution object (66)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (64, '2020-01-08 09:30:41.100915', '65', 'DjangoJobExecution object (65)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (65, '2020-01-08 09:30:41.108420', '64', 'DjangoJobExecution object (64)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (66, '2020-01-08 09:30:41.114031', '63', 'DjangoJobExecution object (63)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (67, '2020-01-08 09:30:41.119310', '62', 'DjangoJobExecution object (62)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (68, '2020-01-08 09:30:41.127186', '61', 'DjangoJobExecution object (61)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (69, '2020-01-08 09:30:41.132086', '60', 'DjangoJobExecution object (60)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (70, '2020-01-08 09:30:41.138132', '59', 'DjangoJobExecution object (59)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (71, '2020-01-08 09:30:41.142783', '58', 'DjangoJobExecution object (58)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (72, '2020-01-08 09:30:41.148842', '57', 'DjangoJobExecution object (57)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (73, '2020-01-08 09:30:41.156657', '56', 'DjangoJobExecution object (56)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (74, '2020-01-08 09:30:41.164252', '55', 'DjangoJobExecution object (55)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (75, '2020-01-08 09:30:41.175767', '54', 'DjangoJobExecution object (54)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (76, '2020-01-08 09:30:41.181773', '53', 'DjangoJobExecution object (53)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (77, '2020-01-08 09:30:41.181773', '52', 'DjangoJobExecution object (52)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (78, '2020-01-08 09:30:41.193192', '51', 'DjangoJobExecution object (51)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (79, '2020-01-08 09:30:41.201497', '50', 'DjangoJobExecution object (50)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (80, '2020-01-08 09:30:41.207147', '49', 'DjangoJobExecution object (49)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (81, '2020-01-08 09:30:41.214182', '48', 'DjangoJobExecution object (48)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (82, '2020-01-08 09:30:41.223587', '47', 'DjangoJobExecution object (47)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (83, '2020-01-08 09:30:41.230433', '46', 'DjangoJobExecution object (46)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (84, '2020-01-08 09:30:41.240285', '45', 'DjangoJobExecution object (45)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (85, '2020-01-08 09:30:41.247322', '44', 'DjangoJobExecution object (44)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (86, '2020-01-08 09:30:41.251305', '43', 'DjangoJobExecution object (43)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (87, '2020-01-08 09:30:41.256600', '42', 'DjangoJobExecution object (42)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (88, '2020-01-08 09:30:41.261620', '41', 'DjangoJobExecution object (41)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (89, '2020-01-08 09:30:41.266837', '40', 'DjangoJobExecution object (40)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (90, '2020-01-08 09:30:41.274782', '39', 'DjangoJobExecution object (39)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (91, '2020-01-08 09:30:41.283423', '38', 'DjangoJobExecution object (38)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (92, '2020-01-08 09:30:41.288072', '37', 'DjangoJobExecution object (37)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (93, '2020-01-08 09:30:41.292840', '36', 'DjangoJobExecution object (36)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (94, '2020-01-08 09:30:41.297817', '35', 'DjangoJobExecution object (35)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (95, '2020-01-08 09:30:41.312222', '34', 'DjangoJobExecution object (34)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (96, '2020-01-08 09:30:41.316605', '33', 'DjangoJobExecution object (33)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (97, '2020-01-08 09:30:41.321384', '32', 'DjangoJobExecution object (32)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (98, '2020-01-08 09:30:41.324194', '31', 'DjangoJobExecution object (31)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (99, '2020-01-08 09:30:41.331435', '30', 'DjangoJobExecution object (30)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (100, '2020-01-08 09:30:41.335875', '29', 'DjangoJobExecution object (29)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (101, '2020-01-08 09:30:49.920610', '28', 'DjangoJobExecution object (28)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (102, '2020-01-08 09:30:49.930047', '27', 'DjangoJobExecution object (27)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (103, '2020-01-08 09:30:49.938863', '26', 'DjangoJobExecution object (26)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (104, '2020-01-08 09:30:49.943905', '25', 'DjangoJobExecution object (25)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (105, '2020-01-08 09:30:49.949018', '24', 'DjangoJobExecution object (24)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (106, '2020-01-08 09:30:49.956099', '23', 'DjangoJobExecution object (23)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (107, '2020-01-08 09:30:49.961568', '22', 'DjangoJobExecution object (22)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (108, '2020-01-08 09:30:49.972931', '21', 'DjangoJobExecution object (21)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (109, '2020-01-08 09:30:49.979799', '20', 'DjangoJobExecution object (20)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (110, '2020-01-08 09:30:49.988065', '19', 'DjangoJobExecution object (19)', 3, '', 22, 1);
INSERT INTO `django_admin_log` VALUES (111, '2020-01-08 09:30:49.995859', '18', 'DjangoJobExecution object (18)', 3, '', 22, 1);

-- ----------------------------
-- Table structure for django_apscheduler_djangojob
-- ----------------------------
DROP TABLE IF EXISTS `django_apscheduler_djangojob`;
CREATE TABLE `django_apscheduler_djangojob`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `next_run_time` datetime(6) NULL DEFAULT NULL,
  `job_state` longblob NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `django_apscheduler_djangojob_next_run_time_2f022619`(`next_run_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_apscheduler_djangojob
-- ----------------------------
INSERT INTO `django_apscheduler_djangojob` VALUES (64, 'tooling.views.get_calibrewb_result_job', '2020-01-10 09:29:14.590620', 0xE282AC043F020000000000007D3F3F76657273696F6EE693AA013F6964E694B226746F6F6C696E672E76696577732E6765745F63616C6962726577625F726573756C745F6A6F62E694B20466756E63E694B226746F6F6C696E672E76696577733A6765745F63616C6962726577625F726573756C745F6A6F62E694B20774726967676572E694B21D61707363686564756C65722E74726967676572732E696E74657276616CE694B20F496E74657276616C54726967676572E695813FE4BB887D3F68014B023F74696D657A6F6E65E694B2047079747AE694B2025F70E695813FE5ADBF72417369612F5368616E67686169E693ACE991A14B003F4C4D54E69496E693B1E694B20A73746172745F64617465E694B2086461746574696D65E694B2086461746574696D65E69581E6939F0A073F0A11190E09031CE694880F2868104DE282AC704B003F435354E69496E693B1E694A9E693B1E694B208656E645F64617465E693AD3F696E74657276616CE69488153F74696D6564656C7461E69581E693AA004B3C4B00E59A8152E694B2066A6974746572E693AD75623F6578656375746F72E694B20764656661756C74E694B204617267733F3F6B7761726773E694A0E694B2046E616D65E694B2186765745F63616C6962726577625F726573756C745F6A6F62E694B2126D6973666972655F67726163655F74696D65E693AA013F636F616C65736365E694ACE5ADBF726D61785F696E7374616E636573E693AA01E5ADBF726E6578745F72756E5F74696D65E6948817430A073F0A111D0E09031CE694881BE5958D52E694972E);

-- ----------------------------
-- Table structure for django_apscheduler_djangojobexecution
-- ----------------------------
DROP TABLE IF EXISTS `django_apscheduler_djangojobexecution`;
CREATE TABLE `django_apscheduler_djangojobexecution`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `run_time` datetime(6) NOT NULL,
  `duration` decimal(15, 2) NULL DEFAULT NULL,
  `started` decimal(15, 2) NULL DEFAULT NULL,
  `finished` decimal(15, 2) NULL DEFAULT NULL,
  `exception` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `traceback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `job_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_apscheduler_d_job_id_daf5090a_fk_django_ap`(`job_id`) USING BTREE,
  INDEX `django_apscheduler_djangojobexecution_run_time_16edd96b`(`run_time`) USING BTREE,
  CONSTRAINT `django_apscheduler_d_job_id_daf5090a_fk_django_ap` FOREIGN KEY (`job_id`) REFERENCES `django_apscheduler_djangojob` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 968 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_apscheduler_djangojobexecution
-- ----------------------------
INSERT INTO `django_apscheduler_djangojobexecution` VALUES (963, 'Error!', '2020-01-10 09:22:19.084490', 20.99, 1578648139.21, 1578648160.20, 'sftp connect failed [Unable to connect to 172.16.20.242: [WinError 10060] 由于连接方在一段时间后没有正确答复或连接的主机没有反应，连接尝试失败。]', '  File \"C:\\Users\\Ziqiang.Huang\\AppData\\Local\\Programs\\Python\\Python37\\lib\\site-packages\\apscheduler\\executors\\base.py\", line 125, in run_job\n    retval = job.func(*job.args, **job.kwargs)\n  File \"C:\\Users\\Ziqiang.Huang\\eclipse-workspace\\Mask_DP\\tooling\\views.py\", line 96, in get_calibrewb_result_job\n    CheckFileService().get_ssh_calibrewb_result_job()\n  File \"C:\\Users\\Ziqiang.Huang\\eclipse-workspace\\Mask_DP\\tooling\\service\\check_files_service.py\", line 106, in get_ssh_calibrewb_result_job\n    ssh = SSHManager(self.ip, self.usr, self.passwd)\n  File \"C:\\Users\\Ziqiang.Huang\\eclipse-workspace\\Mask_DP\\utilslibrary\\utils\\ssh_utils.py\", line 33, in __init__\n    self._sftp_connect()\n  File \"C:\\Users\\Ziqiang.Huang\\eclipse-workspace\\Mask_DP\\utilslibrary\\utils\\ssh_utils.py\", line 48, in _sftp_connect\n    raise RuntimeError(\"sftp connect failed [%s]\" % str(e))\n', 64);
INSERT INTO `django_apscheduler_djangojobexecution` VALUES (964, 'Error!', '2020-01-10 09:25:14.590620', 20.96, 1578648314.74, 1578648335.70, 'sftp connect failed [Unable to connect to 172.16.20.242: [WinError 10060] 由于连接方在一段时间后没有正确答复或连接的主机没有反应，连接尝试失败。]', '  File \"C:\\Users\\Ziqiang.Huang\\AppData\\Local\\Programs\\Python\\Python37\\lib\\site-packages\\apscheduler\\executors\\base.py\", line 125, in run_job\n    retval = job.func(*job.args, **job.kwargs)\n  File \"C:\\Users\\Ziqiang.Huang\\eclipse-workspace\\Mask_DP\\tooling\\views.py\", line 96, in get_calibrewb_result_job\n    CheckFileService().get_ssh_calibrewb_result_job()\n  File \"C:\\Users\\Ziqiang.Huang\\eclipse-workspace\\Mask_DP\\tooling\\service\\check_files_service.py\", line 106, in get_ssh_calibrewb_result_job\n    ssh = SSHManager(self.ip, self.usr, self.passwd)\n  File \"C:\\Users\\Ziqiang.Huang\\eclipse-workspace\\Mask_DP\\utilslibrary\\utils\\ssh_utils.py\", line 33, in __init__\n    self._sftp_connect()\n  File \"C:\\Users\\Ziqiang.Huang\\eclipse-workspace\\Mask_DP\\utilslibrary\\utils\\ssh_utils.py\", line 48, in _sftp_connect\n    raise RuntimeError(\"sftp connect failed [%s]\" % str(e))\n', 64);
INSERT INTO `django_apscheduler_djangojobexecution` VALUES (965, 'Error!', '2020-01-10 09:26:14.590620', 20.95, 1578648374.85, 1578648395.80, 'sftp connect failed [Unable to connect to 172.16.20.242: [WinError 10060] 由于连接方在一段时间后没有正确答复或连接的主机没有反应，连接尝试失败。]', '  File \"C:\\Users\\Ziqiang.Huang\\AppData\\Local\\Programs\\Python\\Python37\\lib\\site-packages\\apscheduler\\executors\\base.py\", line 125, in run_job\n    retval = job.func(*job.args, **job.kwargs)\n  File \"C:\\Users\\Ziqiang.Huang\\eclipse-workspace\\Mask_DP\\tooling\\views.py\", line 96, in get_calibrewb_result_job\n    CheckFileService().get_ssh_calibrewb_result_job()\n  File \"C:\\Users\\Ziqiang.Huang\\eclipse-workspace\\Mask_DP\\tooling\\service\\check_files_service.py\", line 106, in get_ssh_calibrewb_result_job\n    ssh = SSHManager(self.ip, self.usr, self.passwd)\n  File \"C:\\Users\\Ziqiang.Huang\\eclipse-workspace\\Mask_DP\\utilslibrary\\utils\\ssh_utils.py\", line 33, in __init__\n    self._sftp_connect()\n  File \"C:\\Users\\Ziqiang.Huang\\eclipse-workspace\\Mask_DP\\utilslibrary\\utils\\ssh_utils.py\", line 48, in _sftp_connect\n    raise RuntimeError(\"sftp connect failed [%s]\" % str(e))\n', 64);
INSERT INTO `django_apscheduler_djangojobexecution` VALUES (966, 'Error!', '2020-01-10 09:27:14.590620', 21.01, 1578648434.80, 1578648455.81, 'sftp connect failed [Unable to connect to 172.16.20.242: [WinError 10060] 由于连接方在一段时间后没有正确答复或连接的主机没有反应，连接尝试失败。]', '  File \"C:\\Users\\Ziqiang.Huang\\AppData\\Local\\Programs\\Python\\Python37\\lib\\site-packages\\apscheduler\\executors\\base.py\", line 125, in run_job\n    retval = job.func(*job.args, **job.kwargs)\n  File \"C:\\Users\\Ziqiang.Huang\\eclipse-workspace\\Mask_DP\\tooling\\views.py\", line 96, in get_calibrewb_result_job\n    CheckFileService().get_ssh_calibrewb_result_job()\n  File \"C:\\Users\\Ziqiang.Huang\\eclipse-workspace\\Mask_DP\\tooling\\service\\check_files_service.py\", line 106, in get_ssh_calibrewb_result_job\n    ssh = SSHManager(self.ip, self.usr, self.passwd)\n  File \"C:\\Users\\Ziqiang.Huang\\eclipse-workspace\\Mask_DP\\utilslibrary\\utils\\ssh_utils.py\", line 33, in __init__\n    self._sftp_connect()\n  File \"C:\\Users\\Ziqiang.Huang\\eclipse-workspace\\Mask_DP\\utilslibrary\\utils\\ssh_utils.py\", line 48, in _sftp_connect\n    raise RuntimeError(\"sftp connect failed [%s]\" % str(e))\n', 64);
INSERT INTO `django_apscheduler_djangojobexecution` VALUES (967, 'Error!', '2020-01-10 09:28:14.590620', 20.95, 1578648494.80, 1578648515.75, 'sftp connect failed [Unable to connect to 172.16.20.242: [WinError 10060] 由于连接方在一段时间后没有正确答复或连接的主机没有反应，连接尝试失败。]', '  File \"C:\\Users\\Ziqiang.Huang\\AppData\\Local\\Programs\\Python\\Python37\\lib\\site-packages\\apscheduler\\executors\\base.py\", line 125, in run_job\n    retval = job.func(*job.args, **job.kwargs)\n  File \"C:\\Users\\Ziqiang.Huang\\eclipse-workspace\\Mask_DP\\tooling\\views.py\", line 96, in get_calibrewb_result_job\n    CheckFileService().get_ssh_calibrewb_result_job()\n  File \"C:\\Users\\Ziqiang.Huang\\eclipse-workspace\\Mask_DP\\tooling\\service\\check_files_service.py\", line 106, in get_ssh_calibrewb_result_job\n    ssh = SSHManager(self.ip, self.usr, self.passwd)\n  File \"C:\\Users\\Ziqiang.Huang\\eclipse-workspace\\Mask_DP\\utilslibrary\\utils\\ssh_utils.py\", line 33, in __init__\n    self._sftp_connect()\n  File \"C:\\Users\\Ziqiang.Huang\\eclipse-workspace\\Mask_DP\\utilslibrary\\utils\\ssh_utils.py\", line 48, in _sftp_connect\n    raise RuntimeError(\"sftp connect failed [%s]\" % str(e))\n', 64);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (21, 'django_apscheduler', 'djangojob');
INSERT INTO `django_content_type` VALUES (22, 'django_apscheduler', 'djangojobexecution');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (9, 'system', 'dict');
INSERT INTO `django_content_type` VALUES (14, 'system', 'log');
INSERT INTO `django_content_type` VALUES (34, 'system', 'menu');
INSERT INTO `django_content_type` VALUES (26, 'system', 'office');
INSERT INTO `django_content_type` VALUES (23, 'system', 'role');
INSERT INTO `django_content_type` VALUES (35, 'system', 'role_menu');
INSERT INTO `django_content_type` VALUES (7, 'system', 'user');
INSERT INTO `django_content_type` VALUES (33, 'system', 'user_role');
INSERT INTO `django_content_type` VALUES (27, 'tooling', 'boolean_info');
INSERT INTO `django_content_type` VALUES (28, 'tooling', 'device_info');
INSERT INTO `django_content_type` VALUES (19, 'tooling', 'file_analysis_info');
INSERT INTO `django_content_type` VALUES (8, 'tooling', 'ftpinfo');
INSERT INTO `django_content_type` VALUES (15, 'tooling', 'import_data');
INSERT INTO `django_content_type` VALUES (17, 'tooling', 'import_dict_set');
INSERT INTO `django_content_type` VALUES (24, 'tooling', 'import_error_message');
INSERT INTO `django_content_type` VALUES (25, 'tooling', 'import_error_message_log');
INSERT INTO `django_content_type` VALUES (18, 'tooling', 'import_range_set');
INSERT INTO `django_content_type` VALUES (16, 'tooling', 'import_set');
INSERT INTO `django_content_type` VALUES (29, 'tooling', 'layout_info');
INSERT INTO `django_content_type` VALUES (30, 'tooling', 'mlr_info');
INSERT INTO `django_content_type` VALUES (10, 'tooling', 'mt_form_upload_test');
INSERT INTO `django_content_type` VALUES (31, 'tooling', 'product_info');
INSERT INTO `django_content_type` VALUES (32, 'tooling', 'tapeout_info');
INSERT INTO `django_content_type` VALUES (20, 'tooling', 'tip_no_create');
INSERT INTO `django_content_type` VALUES (11, 'tooling', 'tooling_from_upload_test');
INSERT INTO `django_content_type` VALUES (12, 'tooling', 'upload');
INSERT INTO `django_content_type` VALUES (13, 'tooling', 'upload_test');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2019-12-23 05:16:20.379474');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2019-12-23 05:16:26.410523');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2019-12-23 05:16:27.338992');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2019-12-23 05:16:27.377092');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2019-12-23 05:16:27.406182');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2019-12-23 05:16:27.639793');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2019-12-23 05:16:27.850352');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2019-12-23 05:16:27.910511');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2019-12-23 05:16:27.955633');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2019-12-23 05:16:28.084978');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2019-12-23 05:16:28.106033');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2019-12-23 05:16:28.147142');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2019-12-23 05:16:28.270471');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2019-12-23 05:16:28.410845');
INSERT INTO `django_migrations` VALUES (15, 'sessions', '0001_initial', '2019-12-23 05:16:28.550215');
INSERT INTO `django_migrations` VALUES (16, 'system', '0001_initial', '2019-12-23 05:18:37.604862');
INSERT INTO `django_migrations` VALUES (17, 'system', '0002_auto_20191223_1321', '2019-12-23 05:21:20.783249');
INSERT INTO `django_migrations` VALUES (18, 'system', '0003_auto_20191223_1444', '2019-12-23 06:44:33.689635');
INSERT INTO `django_migrations` VALUES (19, 'system', '0004_auto_20191230_0857', '2019-12-30 00:57:39.703676');
INSERT INTO `django_migrations` VALUES (20, 'tooling', '0001_initial', '2019-12-31 05:51:36.278178');
INSERT INTO `django_migrations` VALUES (21, 'system', '0005_auto_20191231_1352', '2019-12-31 05:52:36.276658');
INSERT INTO `django_migrations` VALUES (22, 'system', '0006_auto_20200102_1439', '2020-01-02 06:39:08.732123');
INSERT INTO `django_migrations` VALUES (24, 'system', '0007_log', '2020-01-03 06:43:00.907048');
INSERT INTO `django_migrations` VALUES (25, 'system', '0008_auto_20200103_1444', '2020-01-03 06:44:36.451041');
INSERT INTO `django_migrations` VALUES (26, 'system', '0009_log_data_id', '2020-01-03 06:57:38.176569');
INSERT INTO `django_migrations` VALUES (27, 'system', '0010_auto_20200103_1459', '2020-01-03 06:59:21.254686');
INSERT INTO `django_migrations` VALUES (28, 'system', '0011_log_obj', '2020-01-03 07:12:56.358693');
INSERT INTO `django_migrations` VALUES (29, 'tooling', '0002_auto_20200103_1652', '2020-01-03 08:54:22.750321');
INSERT INTO `django_migrations` VALUES (30, 'tooling', '0003_auto_20200103_1708', '2020-01-03 09:11:34.175782');
INSERT INTO `django_migrations` VALUES (31, 'tooling', '0004_import_dict_set_import_range_set', '2020-01-04 02:52:15.008237');
INSERT INTO `django_migrations` VALUES (32, 'tooling', '0005_import_set_check_table', '2020-01-04 03:07:06.664721');
INSERT INTO `django_migrations` VALUES (33, 'tooling', '0006_auto_20200104_1348', '2020-01-04 05:48:46.975150');
INSERT INTO `django_migrations` VALUES (34, 'tooling', '0007_import_data_import_dict_set_import_range_set_import_set', '2020-01-04 05:50:08.523856');
INSERT INTO `django_migrations` VALUES (35, 'tooling', '0008_auto_20200104_1352', '2020-01-04 05:52:58.259506');
INSERT INTO `django_migrations` VALUES (36, 'tooling', '0009_import_set_multi_row', '2020-01-06 01:25:28.022018');
INSERT INTO `django_migrations` VALUES (37, 'tooling', '0009_delete_ftpinfo', '2020-01-06 01:49:41.454109');
INSERT INTO `django_migrations` VALUES (38, 'tooling', '0010_merge_20200106_1546', '2020-01-06 07:47:19.177907');
INSERT INTO `django_migrations` VALUES (39, 'tooling', '0011_file_analysis_info', '2020-01-06 07:47:19.435654');
INSERT INTO `django_migrations` VALUES (40, 'tooling', '0012_auto_20200107_1029', '2020-01-07 02:29:42.852579');
INSERT INTO `django_migrations` VALUES (41, 'tooling', '0013_auto_20200107_1030', '2020-01-07 02:30:59.378853');
INSERT INTO `django_migrations` VALUES (42, 'system', '0012_user_remarks', '2020-01-07 08:56:26.983054');
INSERT INTO `django_migrations` VALUES (43, 'system', '0013_auto_20200107_1657', '2020-01-07 08:57:24.890328');
INSERT INTO `django_migrations` VALUES (44, 'system', '0014_user_loginflag', '2020-01-07 09:03:10.221220');
INSERT INTO `django_migrations` VALUES (45, 'system', '0015_auto_20200107_1712', '2020-01-07 09:12:11.337488');
INSERT INTO `django_migrations` VALUES (46, 'system', '0016_auto_20200107_1730', '2020-01-07 09:30:08.853988');
INSERT INTO `django_migrations` VALUES (47, 'tooling', '0014_auto_20200108_0956', '2020-01-08 01:56:53.094844');
INSERT INTO `django_migrations` VALUES (48, 'tooling', '0015_tip_no_create', '2020-01-08 02:29:48.015702');
INSERT INTO `django_migrations` VALUES (49, 'tooling', '0016_auto_20200108_1326', '2020-01-08 05:27:30.428111');
INSERT INTO `django_migrations` VALUES (50, 'django_apscheduler', '0001_initial', '2020-01-08 05:39:44.097335');
INSERT INTO `django_migrations` VALUES (51, 'django_apscheduler', '0002_auto_20180412_0758', '2020-01-08 05:39:44.288595');
INSERT INTO `django_migrations` VALUES (52, 'system', '0017_role', '2020-01-08 07:25:59.134703');
INSERT INTO `django_migrations` VALUES (53, 'system', '0018_auto_20200108_1527', '2020-01-08 07:27:35.111292');
INSERT INTO `django_migrations` VALUES (54, 'tooling', '0017_auto_20200109_1135', '2020-01-09 03:36:29.568718');
INSERT INTO `django_migrations` VALUES (55, 'tooling', '0018_auto_20200109_1448', '2020-01-09 06:49:40.206914');
INSERT INTO `django_migrations` VALUES (56, 'tooling', '0019_auto_20200110_0903', '2020-01-10 01:03:52.693716');
INSERT INTO `django_migrations` VALUES (57, 'system', '0019_office', '2020-01-10 05:07:53.386150');
INSERT INTO `django_migrations` VALUES (58, 'system', '0020_auto_20200110_1309', '2020-01-10 05:10:08.219799');
INSERT INTO `django_migrations` VALUES (59, 'system', '0021_office_name', '2020-01-10 05:11:33.522535');
INSERT INTO `django_migrations` VALUES (60, 'system', '0022_auto_20200110_1313', '2020-01-10 05:13:07.388901');
INSERT INTO `django_migrations` VALUES (61, 'system', '0023_office_type', '2020-01-10 05:40:01.726296');
INSERT INTO `django_migrations` VALUES (62, 'auth', '0010_alter_group_name_max_length', '2020-02-02 09:31:31.472862');
INSERT INTO `django_migrations` VALUES (63, 'auth', '0011_update_proxy_permissions', '2020-02-02 09:31:31.556421');
INSERT INTO `django_migrations` VALUES (64, 'system', '0024_office_parent_name', '2020-02-02 09:32:56.805822');
INSERT INTO `django_migrations` VALUES (65, 'system', '0025_user_office_id', '2020-02-02 09:33:29.662975');
INSERT INTO `django_migrations` VALUES (66, 'system', '0026_user_office_name', '2020-02-02 09:33:30.264039');
INSERT INTO `django_migrations` VALUES (67, 'system', '0027_auto_20200121_1408', '2020-02-02 09:33:31.082560');
INSERT INTO `django_migrations` VALUES (68, 'system', '0028_user_role', '2020-02-02 09:34:41.383818');
INSERT INTO `django_migrations` VALUES (69, 'system', '0029_menu', '2020-02-02 09:34:41.783364');
INSERT INTO `django_migrations` VALUES (70, 'tooling', '0020_auto_20200113_1342', '2020-02-02 09:34:46.947671');
INSERT INTO `django_migrations` VALUES (71, 'tooling', '0020_auto_20200113_0935', '2020-02-02 09:40:45.524472');
INSERT INTO `django_migrations` VALUES (72, 'tooling', '0021_merge_20200114_0958', '2020-02-02 09:40:45.571490');
INSERT INTO `django_migrations` VALUES (73, 'tooling', '0022_auto_20200114_1006', '2020-02-02 09:41:58.449969');
INSERT INTO `django_migrations` VALUES (74, 'tooling', '0023_auto_20200114_1334', '2020-02-02 09:41:59.581705');
INSERT INTO `django_migrations` VALUES (75, 'tooling', '0024_auto_20200114_1730', '2020-02-02 09:42:01.256291');
INSERT INTO `django_migrations` VALUES (76, 'tooling', '0025_upload_check_status', '2020-02-02 09:42:34.474135');
INSERT INTO `django_migrations` VALUES (77, 'tooling', '0026_auto_20200115_1148', '2020-02-02 09:42:35.237507');
INSERT INTO `django_migrations` VALUES (78, 'tooling', '0027_auto_20200115_1738', '2020-02-02 09:42:36.513861');
INSERT INTO `django_migrations` VALUES (79, 'tooling', '0027_auto_20200115_1357', '2020-02-02 09:42:37.889985');
INSERT INTO `django_migrations` VALUES (80, 'tooling', '0028_merge_20200115_1936', '2020-02-02 09:42:37.924151');
INSERT INTO `django_migrations` VALUES (81, 'tooling', '0029_auto_20200115_1937', '2020-02-02 09:42:38.692532');
INSERT INTO `django_migrations` VALUES (82, 'tooling', '0030_auto_20200116_1349', '2020-02-02 09:42:40.204727');
INSERT INTO `django_migrations` VALUES (83, 'tooling', '0031_auto_20200116_1352', '2020-02-02 09:42:44.388338');
INSERT INTO `django_migrations` VALUES (84, 'tooling', '0032_auto_20200116_1401', '2020-02-02 09:42:53.764663');
INSERT INTO `django_migrations` VALUES (85, 'tooling', '0033_remove_import_error_message_log_error_status', '2020-02-02 09:42:54.404583');
INSERT INTO `django_migrations` VALUES (86, 'tooling', '0034_import_error_message_log_validate_value', '2020-02-02 09:42:55.140626');
INSERT INTO `django_migrations` VALUES (87, 'tooling', '0035_auto_20200119_1052', '2020-02-02 09:51:49.787196');
INSERT INTO `django_migrations` VALUES (88, 'system', '0030_menu_parent_name', '2020-02-02 12:11:31.970259');
INSERT INTO `django_migrations` VALUES (89, 'system', '0031_menu_haschildren', '2020-02-03 04:10:59.409549');
INSERT INTO `django_migrations` VALUES (90, 'system', '0032_menu_icon', '2020-02-03 04:52:59.188750');
INSERT INTO `django_migrations` VALUES (91, 'system', '0033_auto_20200203_1253', '2020-02-03 04:54:04.397780');
INSERT INTO `django_migrations` VALUES (92, 'system', '0034_auto_20200203_1258', '2020-02-03 04:58:48.127455');
INSERT INTO `django_migrations` VALUES (93, 'system', '0035_menu_remarks', '2020-02-03 05:55:56.591045');
INSERT INTO `django_migrations` VALUES (94, 'system', '0036_auto_20200203_1405', '2020-02-03 06:05:08.571887');
INSERT INTO `django_migrations` VALUES (95, 'system', '0037_auto_20200203_1445', '2020-02-03 06:46:04.274954');
INSERT INTO `django_migrations` VALUES (96, 'system', '0038_role_menu', '2020-02-04 01:58:06.177431');
INSERT INTO `django_migrations` VALUES (97, 'system', '0039_auto_20200206_1553', '2020-02-06 07:54:04.273767');
INSERT INTO `django_migrations` VALUES (98, 'system', '0040_auto_20200206_1555', '2020-02-06 07:55:57.029315');
INSERT INTO `django_migrations` VALUES (99, 'system', '0041_auto_20200206_1606', '2020-02-06 08:06:28.894730');
INSERT INTO `django_migrations` VALUES (100, 'system', '0042_auto_20200206_1607', '2020-02-06 08:08:04.686293');
INSERT INTO `django_migrations` VALUES (101, 'system', '0043_menu_base_href', '2020-02-06 11:26:19.550376');
INSERT INTO `django_migrations` VALUES (102, 'system', '0044_auto_20200206_2121', '2020-02-06 13:22:06.956850');
INSERT INTO `django_migrations` VALUES (103, 'system', '0045_role_menu_display_in_tree', '2020-02-07 01:37:00.164126');
INSERT INTO `django_migrations` VALUES (104, 'system', '0046_auto_20200207_0938', '2020-02-07 01:38:39.793939');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('3ugdvosaburuhqsq2wigbevv71oahx27', 'YjhhOWI5ZTE4OGNiYmUzODBmZWVmOTJiNmQyNGM5Nzg5YWJkNDRiYjp7Ik1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVJfSUQiOjEsIk1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVIiOiJ7XCJpZFwiOiAxLCBcIkxvZ2luTmFtZVwiOiBcImFkbWluXCJ9IiwiTUFTS19EUF9TRVNTSU9OX0NVUlJFTlRfVVNFUl9MT0dJTk5BTUUiOiJhZG1pbiJ9', '2020-02-03 11:25:58.936318');
INSERT INTO `django_session` VALUES ('65gloo6pv604u31k9p3gje4pfske3yn1', 'YmFmNzY0NjU5M2NjY2I3YmY4ZmRiMzQ5ZGE1ZWVlNTU2MDIxNjAxYjp7Ik1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVIiOiJ7XCJpZFwiOiAyLCBcIkxvZ2luTmFtZVwiOiBcInpoYW5nc2FuXCJ9IiwiTUFTS19EUF9TRVNTSU9OX0NVUlJFTlRfVVNFUl9MT0dJTk5BTUUiOiJ6aGFuZ3NhbiIsIk1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVJfSUQiOjJ9', '2020-01-24 06:30:03.332755');
INSERT INTO `django_session` VALUES ('6ftbh25ecvnzjo2bvuvsu7hdqb5ftrtq', 'N2QxM2IwZjhhYzhmMTExMzkyY2UzNWM3OTJkYTYxNDIxMzcxNGQxMjp7Ik1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVIiOiJ7XCJpZFwiOiAxLCBcIkxvZ2luTmFtZVwiOiBcImFkbWluXCJ9IiwiTUFTS19EUF9TRVNTSU9OX0NVUlJFTlRfVVNFUl9MT0dJTk5BTUUiOiJhZG1pbiIsIk1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVJfSUQiOjF9', '2020-01-24 06:26:56.924905');
INSERT INTO `django_session` VALUES ('98f8zzf8wxeaknml1r0b5kzzckaa84eb', 'YzYwMjEyNDU0NmM2OTQyN2VkYzkyMWNmMDgwNzMzZjRkNzA4MzNmMDp7Ik1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVIiOiJ7XCJpZFwiOiAxLCBcIkxvZ2luTmFtZVwiOiBcImFkbWluXCJ9IiwiTUFTS19EUF9TRVNTSU9OX0NVUlJFTlRfVVNFUl9MT0dJTk5BTUUiOiJhZG1pbiIsIk1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVJfSUQiOjEsIk1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVJfUEVSTUlTU0lPTl9MSVNUIjpbIi9zeXN0ZW0vcm9sZS9hZGQvIiwiL3N5c3RlbS9yb2xlL2VkaXQvIiwiL3N5c3RlbS9yb2xlL2RlbC8iLCIvc3lzdGVtL3JvbGUvbGlzdC8iLCIvc3lzdGVtL3JvbGUvdmlldy8iLCIvc3lzdGVtL21lbnUvYWRkLyIsIi9zeXN0ZW0vbWVudS9lZGl0LyIsIi9zeXN0ZW0vbWVudS9kZWwvIiwiL3N5c3RlbS9tZW51L2xpc3QvIiwiL3N5c3RlbS9tZW51L3ZpZXcvIiwiL2hvbWUvIiwiL3N5c3RlbS91c2VyL2FkZC8iLCIvc3lzdGVtL3VzZXIvZWRpdC8iLCIvc3lzdGVtL3VzZXIvZGVsLyIsIi9zeXN0ZW0vdXNlci9saXN0LyIsIi9zeXN0ZW0vdXNlci92aWV3LyIsIi9zeXN0ZW0vb2ZmaWNlL2FkZC8iLCIvc3lzdGVtL29mZmljZS9lZGl0LyIsIi9zeXN0ZW0vb2ZmaWNlL2RlbC8iLCIvc3lzdGVtL29mZmljZS9saXN0LyIsIi9zeXN0ZW0vb2ZmaWNlL3ZpZXcvIiwiL3N5c3RlbS9kaWN0L2FkZC8iLCIvc3lzdGVtL2RpY3QvZWRpdC8iLCIvc3lzdGVtL2RpY3QvZGVsLyIsIi9zeXN0ZW0vZGljdC9saXN0LyIsIi9zeXN0ZW0vZGljdC92aWV3LyIsIi9zeXN0ZW0vZGljdC92YWx1ZS9hZGQvIiwiL3N5c3RlbS9kaWN0L3ZhbHVlL2VkaXQvIiwiL3N5c3RlbS9kaWN0L3ZhbHVlL2RlbC8iLCIvc3lzdGVtL2RpY3QvdmFsdWUvbGlzdC8iLCIvc3lzdGVtL2RpY3QvdmFsdWUvdmlldy8iLCIvc3lzdGVtL3JvbGUvdXNlci9saXN0LyIsIi9zeXN0ZW0vcm9sZS91c2VyL291dC8iLCIvc3lzdGVtL3JvbGUvcGVybWlzc2lvbi92aWV3LyIsIi9zeXN0ZW0vbG9nL2xpc3QvIiwiL3N5c3RlbS9sb2cvZm9ybS8iLCIvc3lzdGVtL3JvbGUvcGVybWlzc2lvbi9zYXZlLyIsIi8iXX0=', '2020-02-07 02:12:17.556596');
INSERT INTO `django_session` VALUES ('bs4rnfkw7j8laz133bjga31in1w3ah6l', 'N2QxM2IwZjhhYzhmMTExMzkyY2UzNWM3OTJkYTYxNDIxMzcxNGQxMjp7Ik1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVIiOiJ7XCJpZFwiOiAxLCBcIkxvZ2luTmFtZVwiOiBcImFkbWluXCJ9IiwiTUFTS19EUF9TRVNTSU9OX0NVUlJFTlRfVVNFUl9MT0dJTk5BTUUiOiJhZG1pbiIsIk1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVJfSUQiOjF9', '2020-02-04 03:03:34.989697');
INSERT INTO `django_session` VALUES ('doee0q1kgjmo0rxfhjw6s8houkrdvsg9', 'N2QxM2IwZjhhYzhmMTExMzkyY2UzNWM3OTJkYTYxNDIxMzcxNGQxMjp7Ik1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVIiOiJ7XCJpZFwiOiAxLCBcIkxvZ2luTmFtZVwiOiBcImFkbWluXCJ9IiwiTUFTS19EUF9TRVNTSU9OX0NVUlJFTlRfVVNFUl9MT0dJTk5BTUUiOiJhZG1pbiIsIk1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVJfSUQiOjF9', '2020-02-06 05:01:43.368749');
INSERT INTO `django_session` VALUES ('e5y5glgoxle1ncgloz7ywz2sa6g7oc4o', 'MjYwMzZjN2M0ZGE5N2RmMGNjNjJlY2Q0OTdiOWU5Yjg0YWM3YmVlZDp7Ik1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVJfSUQiOjEsIk1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVJfUEVSTUlTU0lPTl9MSVNUIjpbIi9zeXN0ZW0vcm9sZS9hZGQvIiwiL3N5c3RlbS9yb2xlL2VkaXQvIiwiL3N5c3RlbS9yb2xlL2RlbC8iLCIvc3lzdGVtL3JvbGUvbGlzdC8iLCIvc3lzdGVtL3JvbGUvdmlldy8iLCIvc3lzdGVtL21lbnUvYWRkLyIsIi9zeXN0ZW0vbWVudS9lZGl0LyIsIi9zeXN0ZW0vbWVudS9kZWwvIiwiL3N5c3RlbS9tZW51L2xpc3QvIiwiL3N5c3RlbS9tZW51L3ZpZXcvIiwiLyIsIi9zeXN0ZW0vdXNlci9hZGQvIiwiL3N5c3RlbS91c2VyL2VkaXQvIiwiL3N5c3RlbS91c2VyL2RlbC8iLCIvc3lzdGVtL3VzZXIvbGlzdC8iLCIvc3lzdGVtL3VzZXIvdmlldy8iLCIvc3lzdGVtL29mZmljZS9hZGQvIiwiL3N5c3RlbS9vZmZpY2UvZWRpdC8iLCIvc3lzdGVtL29mZmljZS9kZWwvIiwiL3N5c3RlbS9vZmZpY2UvbGlzdC8iLCIvc3lzdGVtL29mZmljZS92aWV3LyIsIi9zeXN0ZW0vZGljdC9hZGQvIiwiL3N5c3RlbS9kaWN0L2VkaXQvIiwiL3N5c3RlbS9kaWN0L2RlbC8iLCIvc3lzdGVtL2RpY3QvbGlzdC8iLCIvc3lzdGVtL2RpY3Qvdmlldy8iLCIvc3lzdGVtL3JlcG9ydDEvYWRkLyIsIi9zeXN0ZW0vcmVwb3J0MS9lZGl0LyIsIi9zeXN0ZW0vcmVwb3J0MS9kZWwvIiwiL3N5c3RlbS9yZXBvcnQxL2xpc3QvIiwiL3N5c3RlbS9yZXBvcnQxL3ZpZXcvIl0sIk1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVIiOiJ7XCJpZFwiOiAxLCBcIkxvZ2luTmFtZVwiOiBcImFkbWluXCJ9IiwiTUFTS19EUF9TRVNTSU9OX0NVUlJFTlRfVVNFUl9MT0dJTk5BTUUiOiJhZG1pbiJ9', '2020-02-06 10:06:44.690344');
INSERT INTO `django_session` VALUES ('k27aijn74o36q1bwskyzuq9czhg3sqt6', 'N2QxM2IwZjhhYzhmMTExMzkyY2UzNWM3OTJkYTYxNDIxMzcxNGQxMjp7Ik1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVIiOiJ7XCJpZFwiOiAxLCBcIkxvZ2luTmFtZVwiOiBcImFkbWluXCJ9IiwiTUFTS19EUF9TRVNTSU9OX0NVUlJFTlRfVVNFUl9MT0dJTk5BTUUiOiJhZG1pbiIsIk1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVJfSUQiOjF9', '2020-02-02 13:07:33.521654');
INSERT INTO `django_session` VALUES ('lo3zy4q7su5hwn1h9co39nelfvmjsrbn', 'N2QxM2IwZjhhYzhmMTExMzkyY2UzNWM3OTJkYTYxNDIxMzcxNGQxMjp7Ik1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVIiOiJ7XCJpZFwiOiAxLCBcIkxvZ2luTmFtZVwiOiBcImFkbWluXCJ9IiwiTUFTS19EUF9TRVNTSU9OX0NVUlJFTlRfVVNFUl9MT0dJTk5BTUUiOiJhZG1pbiIsIk1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVJfSUQiOjF9', '2020-02-02 13:59:30.379521');
INSERT INTO `django_session` VALUES ('ptyhy7mu2pp4kumojktm2sbvmuhkhm15', 'N2QxM2IwZjhhYzhmMTExMzkyY2UzNWM3OTJkYTYxNDIxMzcxNGQxMjp7Ik1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVIiOiJ7XCJpZFwiOiAxLCBcIkxvZ2luTmFtZVwiOiBcImFkbWluXCJ9IiwiTUFTS19EUF9TRVNTSU9OX0NVUlJFTlRfVVNFUl9MT0dJTk5BTUUiOiJhZG1pbiIsIk1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVJfSUQiOjF9', '2020-02-02 08:08:03.336478');
INSERT INTO `django_session` VALUES ('q4c3olt6hgoe9d6d1f6hdqaakr9uvvs8', 'N2QxM2IwZjhhYzhmMTExMzkyY2UzNWM3OTJkYTYxNDIxMzcxNGQxMjp7Ik1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVIiOiJ7XCJpZFwiOiAxLCBcIkxvZ2luTmFtZVwiOiBcImFkbWluXCJ9IiwiTUFTS19EUF9TRVNTSU9OX0NVUlJFTlRfVVNFUl9MT0dJTk5BTUUiOiJhZG1pbiIsIk1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVJfSUQiOjF9', '2020-02-03 03:04:56.588360');
INSERT INTO `django_session` VALUES ('qls9ylr6ph3mi39ra3svl38llls8m8z2', 'NDgzNGNlOGUxMDdmOWZmY2Y2ZTM3NWMwNGU5M2YxZWYwMjc5Y2ZhZTp7Ik1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVJfSUQiOjEsIk1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVJfUEVSTUlTU0lPTl9MSVNUIjpbIi9zeXN0ZW0vcm9sZS9hZGQvIiwiL3N5c3RlbS9yb2xlL2VkaXQvIiwiL3N5c3RlbS9yb2xlL2RlbC8iLCIvc3lzdGVtL3JvbGUvbGlzdC8iLCIvc3lzdGVtL3JvbGUvdmlldy8iLCIvc3lzdGVtL21lbnUvYWRkLyIsIi9zeXN0ZW0vbWVudS9lZGl0LyIsIi9zeXN0ZW0vbWVudS9kZWwvIiwiL3N5c3RlbS9tZW51L2xpc3QvIiwiL3N5c3RlbS9tZW51L3ZpZXcvIiwiL2hvbWUvIiwiL3N5c3RlbS91c2VyL2FkZC8iLCIvc3lzdGVtL3VzZXIvZWRpdC8iLCIvc3lzdGVtL3VzZXIvZGVsLyIsIi9zeXN0ZW0vdXNlci9saXN0LyIsIi9zeXN0ZW0vdXNlci92aWV3LyIsIi9zeXN0ZW0vb2ZmaWNlL2FkZC8iLCIvc3lzdGVtL29mZmljZS9lZGl0LyIsIi9zeXN0ZW0vb2ZmaWNlL2RlbC8iLCIvc3lzdGVtL29mZmljZS9saXN0LyIsIi9zeXN0ZW0vb2ZmaWNlL3ZpZXcvIiwiL3N5c3RlbS9kaWN0L2FkZC8iLCIvc3lzdGVtL2RpY3QvZWRpdC8iLCIvc3lzdGVtL2RpY3QvZGVsLyIsIi9zeXN0ZW0vZGljdC9saXN0LyIsIi9zeXN0ZW0vZGljdC92aWV3LyIsIi9zeXN0ZW0vZGljdC92YWx1ZS9hZGQvIiwiL3N5c3RlbS9kaWN0L3ZhbHVlL2VkaXQvIiwiL3N5c3RlbS9kaWN0L3ZhbHVlL2RlbC8iLCIvc3lzdGVtL2RpY3QvdmFsdWUvbGlzdC8iLCIvc3lzdGVtL2RpY3QvdmFsdWUvdmlldy8iLCIvc3lzdGVtL3JvbGUvdXNlci9saXN0LyIsIi9zeXN0ZW0vcm9sZS91c2VyL291dC8iLCIvc3lzdGVtL3JvbGUvcGVybWlzc2lvbi92aWV3LyIsIi9zeXN0ZW0vbG9nL2xpc3QvIiwiL3N5c3RlbS9sb2cvZm9ybS8iLCIvc3lzdGVtL3JvbGUvcGVybWlzc2lvbi9zYXZlLyIsIi8iXSwiTUFTS19EUF9TRVNTSU9OX0NVUlJFTlRfVVNFUiI6IntcImlkXCI6IDEsIFwiTG9naW5OYW1lXCI6IFwiYWRtaW5cIn0iLCJNQVNLX0RQX1NFU1NJT05fQ1VSUkVOVF9VU0VSX0xPR0lOTkFNRSI6ImFkbWluIn0=', '2020-02-06 13:55:45.899526');
INSERT INTO `django_session` VALUES ('u1tckcvj5bvk6ynxwuak2ym3uh0bv9fz', 'Zjk1MGQ1M2I4NjVjYTQzMWQwMzY5YjczYmM3MzNjYTY4MDA5Mjc0Njp7Ik1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVIiOiJ7XCJpZFwiOiAxLCBcIkxvZ2luTmFtZVwiOiBcImFkbWluXCJ9IiwiTUFTS19EUF9TRVNTSU9OX0NVUlJFTlRfVVNFUl9MT0dJTk5BTUUiOiJhZG1pbiIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2ZGRhOTU0ZThiOTNjZDIxMzRhMWE1NTNmMjNlZjMwMWI4MGQ2NDQwIn0=', '2020-01-22 09:30:10.462984');
INSERT INTO `django_session` VALUES ('v6rz00j20f1in7pchmgl7t3g6bqn7ovs', 'N2QxM2IwZjhhYzhmMTExMzkyY2UzNWM3OTJkYTYxNDIxMzcxNGQxMjp7Ik1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVIiOiJ7XCJpZFwiOiAxLCBcIkxvZ2luTmFtZVwiOiBcImFkbWluXCJ9IiwiTUFTS19EUF9TRVNTSU9OX0NVUlJFTlRfVVNFUl9MT0dJTk5BTUUiOiJhZG1pbiIsIk1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVJfSUQiOjF9', '2020-02-04 07:49:36.538100');
INSERT INTO `django_session` VALUES ('va70g60yz3howrmsui8qwub6wjc7if18', 'YTI3NDU5ZWM3ZmQwYWE3YTg4ZGFiNGUzZGNjODg5Yzg4NWViNjAxMzp7Ik1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVIiOiJ7XCJpZFwiOiAxLCBcIkxvZ2luTmFtZVwiOiBcImFkbWluXCJ9IiwiTUFTS19EUF9TRVNTSU9OX0NVUlJFTlRfVVNFUl9MT0dJTk5BTUUiOiJhZG1pbiJ9', '2020-01-23 02:21:51.142224');
INSERT INTO `django_session` VALUES ('w8izil1uap34dk0q84v3cxjf8y1d81y9', 'N2QxM2IwZjhhYzhmMTExMzkyY2UzNWM3OTJkYTYxNDIxMzcxNGQxMjp7Ik1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVIiOiJ7XCJpZFwiOiAxLCBcIkxvZ2luTmFtZVwiOiBcImFkbWluXCJ9IiwiTUFTS19EUF9TRVNTSU9OX0NVUlJFTlRfVVNFUl9MT0dJTk5BTUUiOiJhZG1pbiIsIk1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVJfSUQiOjF9', '2020-02-06 07:48:21.836227');
INSERT INTO `django_session` VALUES ('x7kmfy29z9y40btm3uktxvvmdjtkgf6g', 'N2QxM2IwZjhhYzhmMTExMzkyY2UzNWM3OTJkYTYxNDIxMzcxNGQxMjp7Ik1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVIiOiJ7XCJpZFwiOiAxLCBcIkxvZ2luTmFtZVwiOiBcImFkbWluXCJ9IiwiTUFTS19EUF9TRVNTSU9OX0NVUlJFTlRfVVNFUl9MT0dJTk5BTUUiOiJhZG1pbiIsIk1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVJfSUQiOjF9', '2020-02-02 08:52:50.782802');
INSERT INTO `django_session` VALUES ('yqe932kec0lqiwf5rkf6r4a11mtit6ek', 'MTExZGQ3OThkNGUxMzhhNTNhMTY1ODlkOTZjOGFkYzI1MzdmZGVkMDp7Ik1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVJfSUQiOjEsIk1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVJfUEVSTUlTU0lPTl9MSVNUIjpbIi9zeXN0ZW0vcmVwb3J0MS8iLCIvc3lzdGVtL3JlcG9ydDEvYWRkLyIsIi9zeXN0ZW0vcmVwb3J0MS9lZGl0LyIsIi9zeXN0ZW0vcmVwb3J0MS9kZWwvIiwiL3N5c3RlbS9yZXBvcnQxL2xpc3QvIiwiL3N5c3RlbS9yZXBvcnQxL3ZpZXcvIiwiL3N5c3RlbS9yb2xlL2VkaXQvIiwiL3N5c3RlbS9yb2xlL2RlbC8iLCIvc3lzdGVtL3JvbGUvbGlzdC8iLCIvc3lzdGVtL3JvbGUvdmlldy8iLCIvc3lzdGVtL21lbnUvbGlzdC8iLCIvc3lzdGVtL21lbnUvYWRkLyIsIi9zeXN0ZW0vbWVudS9lZGl0LyIsIi9zeXN0ZW0vbWVudS9kZWwvIiwiL3N5c3RlbS9tZW51L2xpc3QvIiwiL3N5c3RlbS9tZW51L3ZpZXcvIiwiL2hvbWUvIiwiL3N5c3RlbS91c2VyL2xpc3QvIiwiL3N5c3RlbS91c2VyL2FkZC8iLCIvc3lzdGVtL3VzZXIvZWRpdC8iLCIvc3lzdGVtL3VzZXIvZGVsLyIsIi9zeXN0ZW0vdXNlci9saXN0LyIsIi9zeXN0ZW0vdXNlci92aWV3LyIsIi9zeXN0ZW0vb2ZmaWNlL2xpc3QvIiwiL3N5c3RlbS9vZmZpY2UvYWRkLyIsIi9zeXN0ZW0vb2ZmaWNlL2VkaXQvIiwiL3N5c3RlbS9vZmZpY2UvZGVsLyIsIi9zeXN0ZW0vb2ZmaWNlL2xpc3QvIiwiL3N5c3RlbS9vZmZpY2Uvdmlldy8iLCIvc3lzdGVtL2RpY3QvbGlzdC8iLCIvc3lzdGVtL2RpY3QvYWRkLyIsIi9zeXN0ZW0vZGljdC9lZGl0LyIsIi9zeXN0ZW0vZGljdC9kZWwvIiwiL3N5c3RlbS9kaWN0L2xpc3QvIiwiL3N5c3RlbS9kaWN0L3ZpZXcvIiwiL3N5c3RlbS9kaWN0L3ZhbHVlLyIsIi9zeXN0ZW0vZGljdC92YWx1ZS9hZGQvIiwiL3N5c3RlbS9kaWN0L3ZhbHVlL2VkaXQvIiwiL3N5c3RlbS9kaWN0L3ZhbHVlL2RlbC8iLCIvc3lzdGVtL2RpY3QvdmFsdWUvbGlzdC8iLCIvc3lzdGVtL2RpY3QvdmFsdWUvdmlldy8iLCIvc3lzdGVtL3JvbGUvdXNlci9saXN0LyIsIi9zeXN0ZW0vcm9sZS91c2VyL291dC8iLCIvc3lzdGVtL3JvbGUvcGVybWlzc2lvbi92aWV3LyIsIi9zeXN0ZW0vbG9nL2xpc3QvIiwiL3N5c3RlbS9sb2cvbGlzdC8iLCIvc3lzdGVtL2xvZy9mb3JtLyIsIi9zeXN0ZW0vcm9sZS9wZXJtaXNzaW9uL3NhdmUvIiwiLyIsIiIsIi9zeXN0ZW0vcm9sZS9saXN0LyIsIiJdLCJNQVNLX0RQX1NFU1NJT05fQ1VSUkVOVF9VU0VSX1BFUk1JU1NJT05fTUVOVV9JRF9MSVNUIjpbOTMsMTI2LDEyNywxMjgsMTI5LDEzMCwxMzIsMTMzLDEzNCwxMzUsMTM2LDEzNywxMzgsMTM5LDE0MCwxNDEsMTQyLDE0MywxNDQsMTQ1LDE0NiwxNDcsMTQ4LDE0OSwxNTAsMTUxLDE1MiwxNTMsMTU0LDE1NSwxNTYsMTU3LDE1OCwxNTksMTYwLDE2MSwxNjIsMTYzLDE2NCwxNjUsMTY2LDE2OCwxNjksMTcwLDE3MSwxNzUsMTc2LDE3NywxNzksNzgsODksOTJdLCJNQVNLX0RQX1NFU1NJT05fQ1VSUkVOVF9VU0VSIjoie1wiaWRcIjogMSwgXCJMb2dpbk5hbWVcIjogXCJhZG1pblwifSIsIk1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVJfTE9HSU5OQU1FIjoiYWRtaW4ifQ==', '2020-02-07 07:18:09.206475');
INSERT INTO `django_session` VALUES ('yv4cyrub8jlyyjl3txcp56muffr7ud7d', 'N2QxM2IwZjhhYzhmMTExMzkyY2UzNWM3OTJkYTYxNDIxMzcxNGQxMjp7Ik1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVIiOiJ7XCJpZFwiOiAxLCBcIkxvZ2luTmFtZVwiOiBcImFkbWluXCJ9IiwiTUFTS19EUF9TRVNTSU9OX0NVUlJFTlRfVVNFUl9MT0dJTk5BTUUiOiJhZG1pbiIsIk1BU0tfRFBfU0VTU0lPTl9DVVJSRU5UX1VTRVJfSUQiOjF9', '2020-02-03 10:47:57.099796');

-- ----------------------------
-- Table structure for system_dict
-- ----------------------------
DROP TABLE IF EXISTS `system_dict`;
CREATE TABLE `system_dict`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` int(11) NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL,
  `update_date` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL,
  `create_by` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_by` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `value` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `parent_id` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `label` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 204 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_dict
-- ----------------------------
-- ----------------------------
-- Table structure for system_log
-- ----------------------------
DROP TABLE IF EXISTS `system_log`;
CREATE TABLE `system_log`  (
  `create_date` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` int(11) NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL,
  `update_date` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL,
  `create_by` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_by` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `json` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ip` varchar(56) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `data_id` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `obj` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 344 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_log
-- ----------------------------

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu`  (
  `create_date` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` int(11) NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL,
  `update_date` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL,
  `create_by` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_by` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `parent_ids` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `href` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_show` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `parent_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `has_children` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `icon` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remarks` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `base_href` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 180 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu` VALUES ('2020-02-04 14:21:48', 1580797308, 1580981543, '2020-02-06 17:32:23', 0, '1', '1', 78, 0, '0,', 'System Setting', 91, '', 1, 1, '', 'true', '', '', '');
INSERT INTO `system_menu` VALUES ('2020-02-04 15:19:12', 1580800752, 1580989601, '2020-02-06 19:46:41', 0, '1', '1', 89, 78, '0,78,', 'Role Manage', 136, '/system/role/list/', 1, 1, '', 'false', '', '', '/system/role/');
INSERT INTO `system_menu` VALUES ('2020-02-06 12:13:43', 1580962423, 1580986944, '2020-02-06 19:02:24', 0, '1', '1', 91, 0, '0,', 'test323', 78, '/system/test32/', 1, 1, '', 'false', 'fa fa-bell-o', '', '');
INSERT INTO `system_menu` VALUES ('2020-02-06 12:22:57', 1580962977, 0, '', 0, '1', '', 92, 0, '0,', 'Report', 92, '', 1, 1, '', 'true', 'fa fa-signal', '', '');
INSERT INTO `system_menu` VALUES ('2020-02-06 12:23:08', 1580962988, 1580969611, '2020-02-06 14:13:31', 0, '1', '1', 93, 92, '0,92,', 'Report1', 93, '/system/report1/', 1, 1, '', 'false', 'fa fa-cog', '', '');
INSERT INTO `system_menu` VALUES ('2020-02-06 12:23:22', 1580963002, 1581057826, '2020-02-07 14:43:46', 0, '1', '1', 94, 92, '0,92,', 'Report2', 94, '/system/report2', 1, 1, '', 'false', 'fa fa-clock-o', '', '');
INSERT INTO `system_menu` VALUES ('2020-02-06 13:04:04', 1580965444, 0, '', 0, '1', '', 99, 0, '0,', 'test', 99, '', 1, 1, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 121, 91, '0,91,', 'add', 0, '/system/test32/add/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 122, 91, '0,91,', 'edit', 0, '/system/test32/edit/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 123, 91, '0,91,', 'del', 0, '/system/test32/del/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 124, 91, '0,91,', 'list', 0, '/system/test32/list/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 125, 91, '0,91,', 'view', 0, '/system/test32/view/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 126, 93, '0,92,93,', 'add', 0, '/system/report1/add/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 127, 93, '0,92,93,', 'edit', 0, '/system/report1/edit/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 128, 93, '0,92,93,', 'del', 0, '/system/report1/del/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 129, 93, '0,92,93,', 'list', 0, '/system/report1/list/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 130, 93, '0,92,93,', 'view', 0, '/system/report1/view/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 131, 89, '0,78,89,', 'add', 0, '/system/role/add/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 132, 89, '0,78,89,', 'edit', 0, '/system/role/edit/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 133, 89, '0,78,89,', 'del', 0, '/system/role/del/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 134, 89, '0,78,89,', 'list', 0, '/system/role/list/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 135, 89, '0,78,89,', 'view', 0, '/system/role/view/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('2020-02-06 17:01:51', 1580979711, 1580989626, '2020-02-06 19:47:06', 0, '1', '1', 136, 78, '0,78,', 'Menu Manage', 89, '/system/menu/list/', 1, 1, '', 'false', '', '', '/system/menu/');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 137, 136, '0,78,136,', 'add', 0, '/system/menu/add/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 138, 136, '0,78,136,', 'edit', 0, '/system/menu/edit/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 139, 136, '0,78,136,', 'del', 0, '/system/menu/del/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 140, 136, '0,78,136,', 'list', 0, '/system/menu/list/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 141, 136, '0,78,136,', 'view', 0, '/system/menu/view/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('2020-02-06 17:09:31', 1580980171, 1580989782, '2020-02-06 19:49:42', 0, '1', '1', 142, 0, '0,', 'Home', 142, '/home/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('2020-02-06 17:32:57', 1580981577, 1580989637, '2020-02-06 19:47:17', 0, '1', '1', 143, 78, '0,78,', 'User Manage', 143, '/system/user/list/', 1, 1, '', 'false', '', '', '/system/user/');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 144, 143, '0,78,143,', 'add', 0, '/system/user/add/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 145, 143, '0,78,143,', 'edit', 0, '/system/user/edit/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 146, 143, '0,78,143,', 'del', 0, '/system/user/del/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 147, 143, '0,78,143,', 'list', 0, '/system/user/list/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 148, 143, '0,78,143,', 'view', 0, '/system/user/view/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('2020-02-06 17:34:38', 1580981678, 1580989652, '2020-02-06 19:47:32', 0, '1', '1', 149, 78, '0,78,', 'Office Manage', 149, '/system/office/list/', 1, 1, '', 'false', '', '', '/system/office/');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 150, 149, '0,78,149,', 'add', 0, '/system/office/add/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 151, 149, '0,78,149,', 'edit', 0, '/system/office/edit/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 152, 149, '0,78,149,', 'del', 0, '/system/office/del/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 153, 149, '0,78,149,', 'list', 0, '/system/office/list/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 154, 149, '0,78,149,', 'view', 0, '/system/office/view/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('2020-02-06 17:35:16', 1580981716, 1580989663, '2020-02-06 19:47:43', 0, '1', '1', 155, 78, '0,78,', 'Dictionary Manage', 155, '/system/dict/list/', 1, 1, '', 'false', '', '', '/system/dict/');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 156, 155, '0,78,155,', 'add', 0, '/system/dict/add/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 157, 155, '0,78,155,', 'edit', 0, '/system/dict/edit/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 158, 155, '0,78,155,', 'del', 0, '/system/dict/del/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 159, 155, '0,78,155,', 'list', 0, '/system/dict/list/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 160, 155, '0,78,155,', 'view', 0, '/system/dict/view/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('2020-02-06 18:58:39', 1580986719, 0, '', 0, '1', '', 161, 78, '0,78,', 'Dictionary Value Manage', 161, '/system/dict/value/', 0, 1, '', 'true', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 162, 161, '0,78,161,', 'add', 0, '/system/dict/value/add/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 163, 161, '0,78,161,', 'edit', 0, '/system/dict/value/edit/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 164, 161, '0,78,161,', 'del', 0, '/system/dict/value/del/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 165, 161, '0,78,161,', 'list', 0, '/system/dict/value/list/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 166, 161, '0,78,161,', 'view', 0, '/system/dict/value/view/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('2020-02-06 19:07:52', 1580987272, 0, '', 0, '1', '', 168, 89, '0,78,89,', 'Role user assign', 168, '/system/role/user/list/', 0, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('2020-02-06 19:08:40', 1580987320, 0, '', 0, '1', '', 169, 89, '0,78,89,', 'Role user assign out', 169, '/system/role/user/out/', 0, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('2020-02-06 19:09:40', 1580987380, 0, '', 0, '1', '', 170, 89, '0,78,89,', 'Role Permission View', 170, '/system/role/permission/view/', 0, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('2020-02-06 19:15:58', 1580987758, 1580989679, '2020-02-06 19:47:59', 0, '1', '1', 171, 78, '0,78,', 'Logs', 171, '/system/log/list/', 1, 1, '', 'false', '', '', '/system/log/');
INSERT INTO `system_menu` VALUES ('', 0, 0, '', 0, '', '', 175, 171, '0,78,171,', 'list', 0, '/system/log/list/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('', 0, 1580988002, '2020-02-06 19:20:02', 0, '', '1', 176, 171, '0,78,171,', 'view', 0, '/system/log/form/', 1, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('2020-02-06 19:17:47', 1580987867, 0, '', 0, '1', '', 177, 89, '0,78,89,', 'Role Permission Save', 177, '/system/role/permission/save/', 0, 2, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('2020-02-06 19:38:25', 1580989105, 0, '', 0, '1', '', 178, 0, '0,', 'dsf', 178, '', 1, 1, '', 'false', '', '', '');
INSERT INTO `system_menu` VALUES ('2020-02-06 19:49:56', 1580989796, 0, '', 0, '1', '', 179, 0, '0,', 'Index', 179, '/', 0, 2, '', 'false', '', '', '');

-- ----------------------------
-- Table structure for system_office
-- ----------------------------
DROP TABLE IF EXISTS `system_office`;
CREATE TABLE `system_office`  (
  `create_date` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` int(11) NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL,
  `update_date` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL,
  `create_by` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_by` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parent_ids` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `area_id` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `code` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `useable` int(11) NOT NULL,
  `remarks` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parent_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_office
-- ----------------------------
INSERT INTO `system_office` VALUES (NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, '0', '0,', 0, NULL, '001', 1, NULL, '公司', '1', '');
INSERT INTO `system_office` VALUES (NULL, NULL, NULL, NULL, 0, NULL, NULL, 2, '1', '1', 0, NULL, '002', 1, NULL, '财务', '2', '');
INSERT INTO `system_office` VALUES ('2020-01-10 15:07:33', 1578640053, 0, '', 0, 'admin', '', 3, '1', '', 0, '', '1000001', 1, '备注		         ', '技术部', '2', '');
INSERT INTO `system_office` VALUES ('2020-02-06 13:14:18', 1580966058, 1580966130, '2020-02-06 13:15:30', 1, '1', '1', 4, '1', '', 0, '', '', 1, '', '采购', '1', '');
INSERT INTO `system_office` VALUES ('2020-02-06 19:03:58', 1580987038, 1580987045, '2020-02-06 19:04:05', 1, '1', '1', 5, '1', '', 0, '', '11002', 1, '', '采购', '1', '');

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role`  (
  `create_date` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` int(11) NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL,
  `update_date` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL,
  `create_by` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_by` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role_type` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `useable` int(11) NOT NULL,
  `remarks` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_role
-- ----------------------------
INSERT INTO `system_role` VALUES ('2020-01-08 17:24:22', 1578475462, 0, '', 0, 'admin', '', 1, 'role1', '', 1, '');
INSERT INTO `system_role` VALUES ('2020-01-08 17:32:59', 1578475979, 1578537750, '2020-01-09 10:42:30', 1, 'admin', 'admin', 2, 'role2', '', 0, 'test');
INSERT INTO `system_role` VALUES ('2020-01-09 10:49:44', 1578538184, 0, '', 0, 'admin', '', 3, 'role2', '', 0, 'test2');
INSERT INTO `system_role` VALUES ('2020-01-09 10:49:59', 1578538199, 0, '', 1, 'admin', '', 4, 'role3', '', 1, 'test3');
INSERT INTO `system_role` VALUES ('2020-01-09 10:55:55', 1578538555, 0, '', 0, 'admin', '', 5, 'role3', '', 1, '');
INSERT INTO `system_role` VALUES ('2020-01-09 10:56:04', 1578538564, 0, '', 0, 'admin', '', 6, 'role4', '', 0, '');
INSERT INTO `system_role` VALUES ('2020-01-09 10:56:10', 1578538570, 1580987066, '2020-02-06 19:04:26', 0, 'admin', '1', 7, 'role51', '', 0, '');
INSERT INTO `system_role` VALUES ('2020-01-09 10:56:23', 1578538583, 0, '', 1, 'admin', '', 9, 'role7', '', 1, '');
INSERT INTO `system_role` VALUES ('2020-01-09 10:56:30', 1578538590, 1580981735, '2020-02-06 17:35:35', 0, 'admin', '1', 10, 'administrator', '', 1, '');
INSERT INTO `system_role` VALUES ('2020-01-09 10:56:36', 1578538596, 0, '', 1, 'admin', '', 11, 'role9', '', 1, '');
INSERT INTO `system_role` VALUES ('2020-01-09 10:56:42', 1578538602, 0, '', 1, 'admin', '', 12, 'role10', '', 1, '');
INSERT INTO `system_role` VALUES ('2020-02-06 13:09:34', 1580965774, 1580965796, '2020-02-06 13:09:56', 1, '1', '1', 15, 'test1113', '', 1, '');

-- ----------------------------
-- Table structure for system_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_role_menu`;
CREATE TABLE `system_role_menu`  (
  `create_date` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` int(11) NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL,
  `update_date` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL,
  `create_by` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_by` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NULL DEFAULT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `system_role_menu_role_id_id_37c2bd80`(`role_id`) USING BTREE,
  INDEX `system_role_menu_menu_id_400f4f82_fk_system_menu_id`(`menu_id`) USING BTREE,
  CONSTRAINT `system_role_menu_menu_id_400f4f82_fk_system_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `system_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `system_role_menu_role_id_381c2e52_fk_system_role_id` FOREIGN KEY (`role_id`) REFERENCES `system_role` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 652 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_role_menu
-- ----------------------------
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 600, 10, 93, 0);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 601, 10, 126, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 602, 10, 127, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 603, 10, 128, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 604, 10, 129, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 605, 10, 130, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 606, 10, 132, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 607, 10, 133, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 608, 10, 134, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 609, 10, 135, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 610, 10, 136, 0);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 611, 10, 137, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 612, 10, 138, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 613, 10, 139, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 614, 10, 140, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 615, 10, 141, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 616, 10, 142, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 617, 10, 143, 0);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 618, 10, 144, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 619, 10, 145, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 620, 10, 146, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 621, 10, 147, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 622, 10, 148, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 623, 10, 149, 0);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 624, 10, 150, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 625, 10, 151, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 626, 10, 152, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 627, 10, 153, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 628, 10, 154, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 629, 10, 155, 0);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 630, 10, 156, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 631, 10, 157, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 632, 10, 158, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 633, 10, 159, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 634, 10, 160, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 635, 10, 161, 0);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 636, 10, 162, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 637, 10, 163, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 638, 10, 164, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 639, 10, 165, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 640, 10, 166, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 641, 10, 168, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 642, 10, 169, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 643, 10, 170, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 644, 10, 171, 0);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 645, 10, 175, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 646, 10, 176, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 647, 10, 177, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 648, 10, 179, 1);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 649, 10, 78, 0);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 650, 10, 89, 0);
INSERT INTO `system_role_menu` VALUES ('', 0, 0, '', 0, '', '', 651, 10, 92, 0);

-- ----------------------------
-- Table structure for system_user
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addr` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `icon` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `isadmin` int(11) NOT NULL,
  `loginname` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mobile` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `passwd` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `realname` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_date` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` int(11) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL,
  `update_date` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL,
  `create_by` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_by` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remarks` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `loginflag` int(11) NULL DEFAULT NULL,
  `office_id` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `office_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user` VALUES (1, '', NULL, 'admin@qq.com', NULL, 1, 'admin', '0531', 'pbkdf2_sha256$120000$kFX419JsJtNi$tsBEXXjo0I9FTH5/MIzZSJz8HnRZyoyuUHNAnE+Bs6A=', 'admin', '', '', 0, 0, '2020-01-08 09:32:47', 1578447167, '', 'admin', '', 1, NULL, NULL);
INSERT INTO `system_user` VALUES (2, '', NULL, '', NULL, 1, 'zhangsan', '135', 'pbkdf2_sha256$120000$g7ZTkLA2alnH$lti1alw9IZAgZZPBaD8frFn0d1oyU+mYCOxwodP2M7o=', 'zhangsan', '0531', '', 0, 0, '2020-01-08 13:19:30', 1578460770, '', 'admin', '', 1, NULL, NULL);
INSERT INTO `system_user` VALUES (3, NULL, NULL, NULL, NULL, 0, 'zhangsan3', '123', 'z', 'z', NULL, '', 0, 0, '', 0, '', '', NULL, 0, NULL, NULL);
INSERT INTO `system_user` VALUES (4, NULL, NULL, NULL, NULL, 0, 'zhangsan4', 's', 's', 's', 's', '', 0, 0, '', 0, '', '', NULL, 0, NULL, NULL);
INSERT INTO `system_user` VALUES (5, NULL, NULL, NULL, NULL, 0, 'zhangsan5', 'f', 'f', 'f', 'f', '', 0, 0, '', 0, '', '', NULL, 0, NULL, NULL);
INSERT INTO `system_user` VALUES (6, NULL, NULL, NULL, NULL, 0, 'zhangsan6', 'g', 'g', 'g', 'g', '', 0, 0, '', 0, '', '', NULL, 0, NULL, NULL);
INSERT INTO `system_user` VALUES (7, NULL, NULL, NULL, NULL, 0, 'zhangsan7', 'h', 'h', 'h', 'h', '', 0, 0, '', 0, '', '', NULL, 0, NULL, NULL);
INSERT INTO `system_user` VALUES (8, 'jinan', 23, '22222@qq.com', NULL, 0, 'zhangsan8', 'h', 'h', 'hj', 'j', '', 0, 0, '', 0, '', '', NULL, 0, NULL, NULL);
INSERT INTO `system_user` VALUES (9, NULL, NULL, NULL, NULL, 0, 'zhangsan9', 't', 't', 't', 't', '', 0, 0, '', 0, '', '', NULL, 0, NULL, NULL);
INSERT INTO `system_user` VALUES (10, NULL, NULL, NULL, NULL, 0, 'zhangsan10', 'u', 'u', 'u', 'u', '', 0, 1, '', 0, '', '', NULL, 0, NULL, NULL);
INSERT INTO `system_user` VALUES (11, NULL, NULL, NULL, NULL, 0, 'zhangsan11', 'u', 'u', 'u', 'u', '', 0, 1, '', 0, '', '', NULL, 0, NULL, NULL);
INSERT INTO `system_user` VALUES (12, NULL, NULL, NULL, NULL, 0, 'zhangsan12', 'i', 'i', 'i', 'ii', '', 0, 1, '', 0, '', '', NULL, 0, NULL, NULL);
INSERT INTO `system_user` VALUES (13, NULL, NULL, NULL, NULL, 0, 'zhangsan13', 'o', 'o', 'o', 'o', '', 0, 1, '', 0, '', '', NULL, 0, NULL, NULL);
INSERT INTO `system_user` VALUES (17, '山东省济南市', 0, 'dsafdsaf@qq.com', NULL, 0, 'dsafassss', '13555555555', '123', '张三', '0531e423432432', '2020-01-07 17:17:37', 1578388657, 1, '', 0, 'admin', '', '流动公司', 1, NULL, NULL);
INSERT INTO `system_user` VALUES (18, '山东济南', 0, '234234q2@qq.com', NULL, 0, 'bushi', '1358584747', 'pbkdf2_sha256$120000$tAgpjAPbAHpf$vEpCj4gwo2n4adBRLhR/kvk+EeBfwv82cor9qB92ILU=', '测试2', '05319988888', '2020-01-08 09:17:29', 1578446249, 0, '2020-01-08 15:21:29', 1578468089, 'admin', 'admin', '描述\r\n', 1, NULL, NULL);
INSERT INTO `system_user` VALUES (20, '', 0, '', NULL, 0, 'admin2', '', 'pbkdf2_sha256$120000$UWOXNkZ75nsi$SgTwhtW2HMIAk/4hS/z4gmStBPYer8AtTQfgptaKnXs=', '张三', '', '2020-01-08 16:21:59', 1578471719, 0, '', 0, 'admin', '', '', 1, NULL, NULL);
INSERT INTO `system_user` VALUES (21, '', 0, '', NULL, 0, 'test1112', '', 'pbkdf2_sha256$150000$wFG6jiAZfTYE$Gx9KoPfd9pmIJbDxyitqrlo0F0rP3T5y9IqTMBAoOtg=', 'test1112', '', '2020-02-06 13:30:42', 1580967042, 0, '2020-02-06 13:31:12', 1580967072, '1', '1', '		         \r\n		         ', 1, '', '');

-- ----------------------------
-- Table structure for system_user_role
-- ----------------------------
DROP TABLE IF EXISTS `system_user_role`;
CREATE TABLE `system_user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` int(11) NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL,
  `update_date` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL,
  `create_by` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_by` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `system_user_role_role_id_d4d57704_fk_system_role_id`(`role_id`) USING BTREE,
  INDEX `system_user_role_user_id_51214d60_fk_system_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `system_user_role_role_id_d4d57704_fk_system_role_id` FOREIGN KEY (`role_id`) REFERENCES `system_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `system_user_role_user_id_51214d60_fk_system_user_id` FOREIGN KEY (`user_id`) REFERENCES `system_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_user_role
-- ----------------------------
INSERT INTO `system_user_role` VALUES (12, '', 0, 0, '', 0, '', '', 10, 1);
INSERT INTO `system_user_role` VALUES (15, '', 0, 0, '', 0, '', '', 7, 21);
INSERT INTO `system_user_role` VALUES (16, '', 0, 0, '', 0, '', '', 7, 20);
INSERT INTO `system_user_role` VALUES (17, '', 0, 0, '', 0, '', '', 7, 18);

-- ----------------------------
-- Table structure for tooling_boolean_info
-- ----------------------------
DROP TABLE IF EXISTS `tooling_boolean_info`;
CREATE TABLE `tooling_boolean_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tip_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `boolean_index` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `source_db` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mask_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `grid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `operation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `total_bias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tooling_device_info
-- ----------------------------
DROP TABLE IF EXISTS `tooling_device_info`;
CREATE TABLE `tooling_device_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tip_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `psm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `source_db` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `device_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `device_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `boolean_index` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bias_sequence` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rotate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `top_structure` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `source_mag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `shrink` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lb_x` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lb_y` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rt_x` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rt_y` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `check_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `file_size` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;


SET FOREIGN_KEY_CHECKS = 1;
