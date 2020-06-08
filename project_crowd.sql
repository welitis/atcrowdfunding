/*
 Navicat Premium Data Transfer

 Source Server         : desktop
 Source Server Type    : MySQL
 Source Server Version : 80014
 Source Host           : localhost:3306
 Source Schema         : project_crowd

 Target Server Type    : MySQL
 Target Server Version : 80014
 File Encoding         : 65001

 Date: 08/06/2020 08:44:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for inner_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `inner_admin_role`;
CREATE TABLE `inner_admin_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NULL DEFAULT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inner_admin_role
-- ----------------------------
INSERT INTO `inner_admin_role` VALUES (3, 14, 3);
INSERT INTO `inner_admin_role` VALUES (4, 14, 2);
INSERT INTO `inner_admin_role` VALUES (7, 13, 1);
INSERT INTO `inner_admin_role` VALUES (8, 13, 2);
INSERT INTO `inner_admin_role` VALUES (22, 1, 1);
INSERT INTO `inner_admin_role` VALUES (23, 258, 245);
INSERT INTO `inner_admin_role` VALUES (24, 258, 246);
INSERT INTO `inner_admin_role` VALUES (25, 259, 247);
INSERT INTO `inner_admin_role` VALUES (26, 259, 248);

-- ----------------------------
-- Table structure for inner_role_auth
-- ----------------------------
DROP TABLE IF EXISTS `inner_role_auth`;
CREATE TABLE `inner_role_auth`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NULL DEFAULT NULL,
  `auth_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inner_role_auth
-- ----------------------------
INSERT INTO `inner_role_auth` VALUES (1, 1, 2);
INSERT INTO `inner_role_auth` VALUES (2, 1, 3);
INSERT INTO `inner_role_auth` VALUES (3, 1, 1);
INSERT INTO `inner_role_auth` VALUES (4, 2, 1);
INSERT INTO `inner_role_auth` VALUES (5, 248, 4);
INSERT INTO `inner_role_auth` VALUES (6, 248, 5);
INSERT INTO `inner_role_auth` VALUES (7, 246, 1);
INSERT INTO `inner_role_auth` VALUES (8, 246, 8);

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_acct` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_pswd` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `login_acct`(`login_acct`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 261 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES (1, 'admin', '$2a$10$dp8sttOWLo5t5XH5ZAnOI.HWxsi.U.tB5zvAYlT4HqhKSwB57CeNi', 'bbv', 'aaa@qq.com', NULL);
INSERT INTO `t_admin` VALUES (13, 'ccd', 'bbb', 'bcd', 'bb@11.com', NULL);
INSERT INTO `t_admin` VALUES (14, 'ddd', 'bbb', 'bcd', 'bb@11.com', NULL);
INSERT INTO `t_admin` VALUES (19, 'aa4', 'aa4', 'aa4', 'aa4', 'aa4');
INSERT INTO `t_admin` VALUES (20, 'aa5', 'aa5', 'aa5', 'aa5', 'aa5');
INSERT INTO `t_admin` VALUES (21, 'aa6', 'aa6', 'aa6', 'aa6', 'aa6');
INSERT INTO `t_admin` VALUES (22, 'aa7', 'aa7', 'aa7', 'aa7', 'aa7');
INSERT INTO `t_admin` VALUES (23, 'aa8', 'aa8', 'aa8', 'aa8', 'aa8');
INSERT INTO `t_admin` VALUES (24, 'aa9', 'aa9', 'aa9', 'aa9', 'aa9');
INSERT INTO `t_admin` VALUES (25, 'aa10', 'aa10', 'aa10', 'aa10', 'aa10');
INSERT INTO `t_admin` VALUES (27, 'aa12', 'aa12', 'aa12', 'aa12', 'aa12');
INSERT INTO `t_admin` VALUES (33, 'aa18', 'aa18', 'aa18', 'aa18', 'aa18');
INSERT INTO `t_admin` VALUES (34, 'aa19', 'aa19', 'aa19', 'aa19', 'aa19');
INSERT INTO `t_admin` VALUES (35, 'aa20', 'aa20', 'aa20', 'aa20', 'aa20');
INSERT INTO `t_admin` VALUES (36, 'aa21', 'aa21', 'aa21', 'aa21', 'aa21');
INSERT INTO `t_admin` VALUES (37, 'aa22', 'aa22', 'aa22', 'aa22', 'aa22');
INSERT INTO `t_admin` VALUES (38, 'aa23', 'aa23', 'aa23', 'aa23', 'aa23');
INSERT INTO `t_admin` VALUES (39, 'aa24', 'aa24', 'aa24', 'aa24', 'aa24');
INSERT INTO `t_admin` VALUES (40, 'aa25', 'aa25', 'aa25', 'aa25', 'aa25');
INSERT INTO `t_admin` VALUES (41, 'aa26', 'aa26', 'aa26', 'aa26', 'aa26');
INSERT INTO `t_admin` VALUES (42, 'aa27', 'aa27', 'aa27', 'aa27', 'aa27');
INSERT INTO `t_admin` VALUES (43, 'aa28', 'aa28', 'aa28', 'aa28', 'aa28');
INSERT INTO `t_admin` VALUES (44, 'aa29', 'aa29', 'aa29', 'aa29', 'aa29');
INSERT INTO `t_admin` VALUES (45, 'aa30', 'aa30', 'aa30', 'aa30', 'aa30');
INSERT INTO `t_admin` VALUES (46, 'aa31', 'aa31', 'aa31', 'aa31', 'aa31');
INSERT INTO `t_admin` VALUES (47, 'aa32', 'aa32', 'aa32', 'aa32', 'aa32');
INSERT INTO `t_admin` VALUES (48, 'aa33', 'aa33', 'aa33', 'aa33', 'aa33');
INSERT INTO `t_admin` VALUES (49, 'aa34', 'aa34', 'aa34', 'aa34', 'aa34');
INSERT INTO `t_admin` VALUES (50, 'aa35', 'aa35', 'aa35', 'aa35', 'aa35');
INSERT INTO `t_admin` VALUES (51, 'aa36', 'aa36', 'aa36', 'aa36', 'aa36');
INSERT INTO `t_admin` VALUES (52, 'aa37', 'aa37', 'aa37', 'aa37', 'aa37');
INSERT INTO `t_admin` VALUES (53, 'aa38', 'aa38', 'aa38', 'aa38', 'aa38');
INSERT INTO `t_admin` VALUES (54, 'aa39', 'aa39', 'aa39', 'aa39', 'aa39');
INSERT INTO `t_admin` VALUES (55, 'aa40', 'aa40', 'aa40', 'aa40', 'aa40');
INSERT INTO `t_admin` VALUES (56, 'aa41', 'aa41', 'aa41', 'aa41', 'aa41');
INSERT INTO `t_admin` VALUES (57, 'aa42', 'aa42', 'aa42', 'aa42', 'aa42');
INSERT INTO `t_admin` VALUES (58, 'aa43', 'aa43', 'aa43', 'aa43', 'aa43');
INSERT INTO `t_admin` VALUES (59, 'aa44', 'aa44', 'aa44', 'aa44', 'aa44');
INSERT INTO `t_admin` VALUES (60, 'aa45', 'aa45', 'aa45', 'aa45', 'aa45');
INSERT INTO `t_admin` VALUES (61, 'aa46', 'aa46', 'aa46', 'aa46', 'aa46');
INSERT INTO `t_admin` VALUES (62, 'aa47', 'aa47', 'aa47', 'aa47', 'aa47');
INSERT INTO `t_admin` VALUES (63, 'aa48', 'aa48', 'aa48', 'aa48', 'aa48');
INSERT INTO `t_admin` VALUES (64, 'aa49', 'aa49', 'aa49', 'aa49', 'aa49');
INSERT INTO `t_admin` VALUES (65, 'aa50', 'aa50', 'aa50', 'aa50', 'aa50');
INSERT INTO `t_admin` VALUES (66, 'aa51', 'aa51', 'aa51', 'aa51', 'aa51');
INSERT INTO `t_admin` VALUES (67, 'aa52', 'aa52', 'aa52', 'aa52', 'aa52');
INSERT INTO `t_admin` VALUES (68, 'aa53', 'aa53', 'aa53', 'aa53', 'aa53');
INSERT INTO `t_admin` VALUES (69, 'aa54', 'aa54', 'aa54', 'aa54', 'aa54');
INSERT INTO `t_admin` VALUES (70, 'aa55', 'aa55', 'aa55', 'aa55', 'aa55');
INSERT INTO `t_admin` VALUES (71, 'aa56', 'aa56', 'aa56', 'aa56', 'aa56');
INSERT INTO `t_admin` VALUES (72, 'aa57', 'aa57', 'aa57', 'aa57', 'aa57');
INSERT INTO `t_admin` VALUES (73, 'aa58', 'aa58', 'aa58', 'aa58', 'aa58');
INSERT INTO `t_admin` VALUES (74, 'aa59', 'aa59', 'aa59', 'aa59', 'aa59');
INSERT INTO `t_admin` VALUES (75, 'aa60', 'aa60', 'aa60', 'aa60', 'aa60');
INSERT INTO `t_admin` VALUES (76, 'aa61', 'aa61', 'aa61', 'aa61', 'aa61');
INSERT INTO `t_admin` VALUES (77, 'aa62', 'aa62', 'aa62', 'aa62', 'aa62');
INSERT INTO `t_admin` VALUES (78, 'aa63', 'aa63', 'aa63', 'aa63', 'aa63');
INSERT INTO `t_admin` VALUES (79, 'aa64', 'aa64', 'aa64', 'aa64', 'aa64');
INSERT INTO `t_admin` VALUES (80, 'aa65', 'aa65', 'aa65', 'aa65', 'aa65');
INSERT INTO `t_admin` VALUES (81, 'aa66', 'aa66', 'aa66', 'aa66', 'aa66');
INSERT INTO `t_admin` VALUES (82, 'aa67', 'aa67', 'aa67', 'aa67', 'aa67');
INSERT INTO `t_admin` VALUES (83, 'aa68', 'aa68', 'aa68', 'aa68', 'aa68');
INSERT INTO `t_admin` VALUES (84, 'aa69', 'aa69', 'aa69', 'aa69', 'aa69');
INSERT INTO `t_admin` VALUES (85, 'aa70', 'aa70', 'aa70', 'aa70', 'aa70');
INSERT INTO `t_admin` VALUES (86, 'aa71', 'aa71', 'aa71', 'aa71', 'aa71');
INSERT INTO `t_admin` VALUES (87, 'aa72', 'aa72', 'aa72', 'aa72', 'aa72');
INSERT INTO `t_admin` VALUES (88, 'aa73', 'aa73', 'aa73', 'aa73', 'aa73');
INSERT INTO `t_admin` VALUES (89, 'aa74', 'aa74', 'aa74', 'aa74', 'aa74');
INSERT INTO `t_admin` VALUES (90, 'aa75', 'aa75', 'aa75', 'aa75', 'aa75');
INSERT INTO `t_admin` VALUES (91, 'aa76', 'aa76', 'aa76', 'aa76', 'aa76');
INSERT INTO `t_admin` VALUES (92, 'aa77', 'aa77', 'aa77', 'aa77', 'aa77');
INSERT INTO `t_admin` VALUES (93, 'aa78', 'aa78', 'aa78', 'aa78', 'aa78');
INSERT INTO `t_admin` VALUES (94, 'aa79', 'aa79', 'aa79', 'aa79', 'aa79');
INSERT INTO `t_admin` VALUES (95, 'aa80', 'aa80', 'aa80', 'aa80', 'aa80');
INSERT INTO `t_admin` VALUES (96, 'aa81', 'aa81', 'aa81', 'aa81', 'aa81');
INSERT INTO `t_admin` VALUES (97, 'aa82', 'aa82', 'aa82', 'aa82', 'aa82');
INSERT INTO `t_admin` VALUES (98, 'aa83', 'aa83', 'aa83', 'aa83', 'aa83');
INSERT INTO `t_admin` VALUES (99, 'aa84', 'aa84', 'aa84', 'aa84', 'aa84');
INSERT INTO `t_admin` VALUES (100, 'aa85', 'aa85', 'aa85', 'aa85', 'aa85');
INSERT INTO `t_admin` VALUES (101, 'aa86', 'aa86', 'aa86', 'aa86', 'aa86');
INSERT INTO `t_admin` VALUES (102, 'aa87', 'aa87', 'aa87', 'aa87', 'aa87');
INSERT INTO `t_admin` VALUES (103, 'aa88', 'aa88', 'aa88', 'aa88', 'aa88');
INSERT INTO `t_admin` VALUES (104, 'aa89', 'aa89', 'aa89', 'aa89', 'aa89');
INSERT INTO `t_admin` VALUES (105, 'aa90', 'aa90', 'aa90', 'aa90', 'aa90');
INSERT INTO `t_admin` VALUES (106, 'aa91', 'aa91', 'aa91', 'aa91', 'aa91');
INSERT INTO `t_admin` VALUES (107, 'aa92', 'aa92', 'aa92', 'aa92', 'aa92');
INSERT INTO `t_admin` VALUES (108, 'aa93', 'aa93', 'aa93', 'aa93', 'aa93');
INSERT INTO `t_admin` VALUES (109, 'aa94', 'aa94', 'aa94', 'aa94', 'aa94');
INSERT INTO `t_admin` VALUES (110, 'aa95', 'aa95', 'aa95', 'aa95', 'aa95');
INSERT INTO `t_admin` VALUES (111, 'aa96', 'aa96', 'aa96', 'aa96', 'aa96');
INSERT INTO `t_admin` VALUES (112, 'aa97', 'aa97', 'aa97', 'aa97', 'aa97');
INSERT INTO `t_admin` VALUES (113, 'aa98', 'aa98', 'aa98', 'aa98', 'aa98');
INSERT INTO `t_admin` VALUES (114, 'aa99', 'aa99', 'aa99', 'aa99', 'aa99');
INSERT INTO `t_admin` VALUES (115, 'aa100', 'aa100', 'aa100', 'aa100', 'aa100');
INSERT INTO `t_admin` VALUES (116, 'aa101', 'aa101', 'aa101', 'aa101', 'aa101');
INSERT INTO `t_admin` VALUES (117, 'aa102', 'aa102', 'aa102', 'aa102', 'aa102');
INSERT INTO `t_admin` VALUES (118, 'aa103', 'aa103', 'aa103', 'aa103', 'aa103');
INSERT INTO `t_admin` VALUES (119, 'aa104', 'aa104', 'aa104', 'aa104', 'aa104');
INSERT INTO `t_admin` VALUES (120, 'aa105', 'aa105', 'aa105', 'aa105', 'aa105');
INSERT INTO `t_admin` VALUES (121, 'aa106', 'aa106', 'aa106', 'aa106', 'aa106');
INSERT INTO `t_admin` VALUES (122, 'aa107', 'aa107', 'aa107', 'aa107', 'aa107');
INSERT INTO `t_admin` VALUES (123, 'aa108', 'aa108', 'aa108', 'aa108', 'aa108');
INSERT INTO `t_admin` VALUES (124, 'aa109', 'aa109', 'aa109', 'aa109', 'aa109');
INSERT INTO `t_admin` VALUES (125, 'aa110', 'aa110', 'aa110', 'aa110', 'aa110');
INSERT INTO `t_admin` VALUES (126, 'aa111', 'aa111', 'aa111', 'aa111', 'aa111');
INSERT INTO `t_admin` VALUES (127, 'aa112', 'aa112', 'aa112', 'aa112', 'aa112');
INSERT INTO `t_admin` VALUES (128, 'aa113', 'aa113', 'aa113', 'aa113', 'aa113');
INSERT INTO `t_admin` VALUES (129, 'aa114', 'aa114', 'aa114', 'aa114', 'aa114');
INSERT INTO `t_admin` VALUES (130, 'aa115', 'aa115', 'aa115', 'aa115', 'aa115');
INSERT INTO `t_admin` VALUES (131, 'aa116', 'aa116', 'aa116', 'aa116', 'aa116');
INSERT INTO `t_admin` VALUES (132, 'aa117', 'aa117', 'aa117', 'aa117', 'aa117');
INSERT INTO `t_admin` VALUES (133, 'aa118', 'aa118', 'aa118', 'aa118', 'aa118');
INSERT INTO `t_admin` VALUES (134, 'aa119', 'aa119', 'aa119', 'aa119', 'aa119');
INSERT INTO `t_admin` VALUES (135, 'aa120', 'aa120', 'aa120', 'aa120', 'aa120');
INSERT INTO `t_admin` VALUES (136, 'aa121', 'aa121', 'aa121', 'aa121', 'aa121');
INSERT INTO `t_admin` VALUES (137, 'aa122', 'aa122', 'aa122', 'aa122', 'aa122');
INSERT INTO `t_admin` VALUES (139, 'aa124', 'aa124', 'aa124', 'aa124', 'aa124');
INSERT INTO `t_admin` VALUES (141, 'aa126', 'aa126', 'aa126', 'aa126', 'aa126');
INSERT INTO `t_admin` VALUES (142, 'aa127', 'aa127', 'aa127', 'aa127', 'aa127');
INSERT INTO `t_admin` VALUES (143, 'aa128', 'aa128', 'aa128', 'aa128', 'aa128');
INSERT INTO `t_admin` VALUES (144, 'aa129', 'aa129', 'aa129', 'aa129', 'aa129');
INSERT INTO `t_admin` VALUES (145, 'aa130', 'aa130', 'aa130', 'aa130', 'aa130');
INSERT INTO `t_admin` VALUES (146, 'aa131', 'aa131', 'aa131', 'aa131', 'aa131');
INSERT INTO `t_admin` VALUES (147, 'aa132', 'aa132', 'aa132', 'aa132', 'aa132');
INSERT INTO `t_admin` VALUES (148, 'aa133', 'aa133', 'aa133', 'aa133', 'aa133');
INSERT INTO `t_admin` VALUES (149, 'aa134', 'aa134', 'aa134', 'aa134', 'aa134');
INSERT INTO `t_admin` VALUES (150, 'aa135', 'aa135', 'aa135', 'aa135', 'aa135');
INSERT INTO `t_admin` VALUES (151, 'aa136', 'aa136', 'aa136', 'aa136', 'aa136');
INSERT INTO `t_admin` VALUES (152, 'aa137', 'aa137', 'aa137', 'aa137', 'aa137');
INSERT INTO `t_admin` VALUES (153, 'aa138', 'aa138', 'aa138', 'aa138', 'aa138');
INSERT INTO `t_admin` VALUES (154, 'aa139', 'aa139', 'aa139', 'aa139', 'aa139');
INSERT INTO `t_admin` VALUES (155, 'aa140', 'aa140', 'aa140', 'aa140', 'aa140');
INSERT INTO `t_admin` VALUES (156, 'aa141', 'aa141', 'aa141', 'aa141', 'aa141');
INSERT INTO `t_admin` VALUES (157, 'aa142', 'aa142', 'aa142', 'aa142', 'aa142');
INSERT INTO `t_admin` VALUES (158, 'aa143', 'aa143', 'aa143', 'aa143', 'aa143');
INSERT INTO `t_admin` VALUES (159, 'aa144', 'aa144', 'aa144', 'aa144', 'aa144');
INSERT INTO `t_admin` VALUES (160, 'aa145', 'aa145', 'aa145', 'aa145', 'aa145');
INSERT INTO `t_admin` VALUES (161, 'aa146', 'aa146', 'aa146', 'aa146', 'aa146');
INSERT INTO `t_admin` VALUES (162, 'aa147', 'aa147', 'aa147', 'aa147', 'aa147');
INSERT INTO `t_admin` VALUES (163, 'aa148', 'aa148', 'aa148', 'aa148', 'aa148');
INSERT INTO `t_admin` VALUES (164, 'aa149', 'aa149', 'aa149', 'aa149', 'aa149');
INSERT INTO `t_admin` VALUES (165, 'aa150', 'aa150', 'aa150', 'aa150', 'aa150');
INSERT INTO `t_admin` VALUES (166, 'aa151', 'aa151', 'aa151', 'aa151', 'aa151');
INSERT INTO `t_admin` VALUES (167, 'aa152', 'aa152', 'aa152', 'aa152', 'aa152');
INSERT INTO `t_admin` VALUES (168, 'aa153', 'aa153', 'aa153', 'aa153', 'aa153');
INSERT INTO `t_admin` VALUES (169, 'aa154', 'aa154', 'aa154', 'aa154', 'aa154');
INSERT INTO `t_admin` VALUES (170, 'aa155', 'aa155', 'aa155', 'aa155', 'aa155');
INSERT INTO `t_admin` VALUES (171, 'aa156', 'aa156', 'aa156', 'aa156', 'aa156');
INSERT INTO `t_admin` VALUES (172, 'aa157', 'aa157', 'aa157', 'aa157', 'aa157');
INSERT INTO `t_admin` VALUES (173, 'aa158', 'aa158', 'aa158', 'aa158', 'aa158');
INSERT INTO `t_admin` VALUES (174, 'aa159', 'aa159', 'aa159', 'aa159', 'aa159');
INSERT INTO `t_admin` VALUES (175, 'aa160', 'aa160', 'aa160', 'aa160', 'aa160');
INSERT INTO `t_admin` VALUES (176, 'aa161', 'aa161', 'aa161', 'aa161', 'aa161');
INSERT INTO `t_admin` VALUES (177, 'aa162', 'aa162', 'aa162', 'aa162', 'aa162');
INSERT INTO `t_admin` VALUES (178, 'aa163', 'aa163', 'aa163', 'aa163', 'aa163');
INSERT INTO `t_admin` VALUES (179, 'aa164', 'aa164', 'aa164', 'aa164', 'aa164');
INSERT INTO `t_admin` VALUES (180, 'aa165', 'aa165', 'aa165', 'aa165', 'aa165');
INSERT INTO `t_admin` VALUES (181, 'aa166', 'aa166', 'aa166', 'aa166', 'aa166');
INSERT INTO `t_admin` VALUES (182, 'aa167', 'aa167', 'aa167', 'aa167', 'aa167');
INSERT INTO `t_admin` VALUES (183, 'aa168', 'aa168', 'aa168', 'aa168', 'aa168');
INSERT INTO `t_admin` VALUES (184, 'aa169', 'aa169', 'aa169', 'aa169', 'aa169');
INSERT INTO `t_admin` VALUES (185, 'aa170', 'aa170', 'aa170', 'aa170', 'aa170');
INSERT INTO `t_admin` VALUES (186, 'aa171', 'aa171', 'aa171', 'aa171', 'aa171');
INSERT INTO `t_admin` VALUES (187, 'aa172', 'aa172', 'aa172', 'aa172', 'aa172');
INSERT INTO `t_admin` VALUES (188, 'aa173', 'aa173', 'aa173', 'aa173', 'aa173');
INSERT INTO `t_admin` VALUES (189, 'aa174', 'aa174', 'aa174', 'aa174', 'aa174');
INSERT INTO `t_admin` VALUES (190, 'aa175', 'aa175', 'aa175', 'aa175', 'aa175');
INSERT INTO `t_admin` VALUES (191, 'aa176', 'aa176', 'aa176', 'aa176', 'aa176');
INSERT INTO `t_admin` VALUES (192, 'aa177', 'aa177', 'aa177', 'aa177', 'aa177');
INSERT INTO `t_admin` VALUES (193, 'aa178', 'aa178', 'aa178', 'aa178', 'aa178');
INSERT INTO `t_admin` VALUES (194, 'aa179', 'aa179', 'aa179', 'aa179', 'aa179');
INSERT INTO `t_admin` VALUES (195, 'aa180', 'aa180', 'aa180', 'aa180', 'aa180');
INSERT INTO `t_admin` VALUES (196, 'aa181', 'aa181', 'aa181', 'aa181', 'aa181');
INSERT INTO `t_admin` VALUES (197, 'aa182', 'aa182', 'aa182', 'aa182', 'aa182');
INSERT INTO `t_admin` VALUES (198, 'aa183', 'aa183', 'aa183', 'aa183', 'aa183');
INSERT INTO `t_admin` VALUES (199, 'aa184', 'aa184', 'aa184', 'aa184', 'aa184');
INSERT INTO `t_admin` VALUES (200, 'aa185', 'aa185', 'aa185', 'aa185', 'aa185');
INSERT INTO `t_admin` VALUES (201, 'aa186', 'aa186', 'aa186', 'aa186', 'aa186');
INSERT INTO `t_admin` VALUES (202, 'aa187', 'aa187', 'aa187', 'aa187', 'aa187');
INSERT INTO `t_admin` VALUES (203, 'aa188', 'aa188', 'aa188', 'aa188', 'aa188');
INSERT INTO `t_admin` VALUES (204, 'aa189', 'aa189', 'aa189', 'aa189', 'aa189');
INSERT INTO `t_admin` VALUES (205, 'aa190', 'aa190', 'aa190', 'aa190', 'aa190');
INSERT INTO `t_admin` VALUES (206, 'aa191', 'aa191', 'aa191', 'aa191', 'aa191');
INSERT INTO `t_admin` VALUES (207, 'aa192', 'aa192', 'aa192', 'aa192', 'aa192');
INSERT INTO `t_admin` VALUES (208, 'aa193', 'aa193', 'aa193', 'aa193', 'aa193');
INSERT INTO `t_admin` VALUES (209, 'aa194', 'aa194', 'aa194', 'aa194', 'aa194');
INSERT INTO `t_admin` VALUES (210, 'aa195', 'aa195', 'aa195', 'aa195', 'aa195');
INSERT INTO `t_admin` VALUES (211, 'aa196', 'aa196', 'aa196', 'aa196', 'aa196');
INSERT INTO `t_admin` VALUES (212, 'aa197', 'aa197', 'aa197', 'aa197', 'aa197');
INSERT INTO `t_admin` VALUES (213, 'aa198', 'aa198', 'aa198', 'aa198', 'aa198');
INSERT INTO `t_admin` VALUES (214, 'aa199', 'aa199', 'aa199', 'aa199', 'aa199');
INSERT INTO `t_admin` VALUES (215, 'aa200', 'aa200', 'aa200', 'aa200', 'aa200');
INSERT INTO `t_admin` VALUES (216, 'aa201', 'aa201', 'aa201', 'aa201', 'aa201');
INSERT INTO `t_admin` VALUES (217, 'aa202', 'aa202', 'aa202', 'aa202', 'aa202');
INSERT INTO `t_admin` VALUES (218, 'aa203', 'aa203', 'aa203', 'aa203', 'aa203');
INSERT INTO `t_admin` VALUES (219, 'aa204', 'aa204', 'aa204', 'aa204', 'aa204');
INSERT INTO `t_admin` VALUES (220, 'aa205', 'aa205', 'aa205', 'aa205', 'aa205');
INSERT INTO `t_admin` VALUES (221, 'aa206', 'aa206', 'aa206', 'aa206', 'aa206');
INSERT INTO `t_admin` VALUES (222, 'aa207', 'aa207', 'aa207', 'aa207', 'aa207');
INSERT INTO `t_admin` VALUES (223, 'aa208', 'aa208', 'aa208', 'aa208', 'aa208');
INSERT INTO `t_admin` VALUES (224, 'aa209', 'aa209', 'aa209', 'aa209', 'aa209');
INSERT INTO `t_admin` VALUES (225, 'aa210', 'aa210', 'aa210', 'aa210', 'aa210');
INSERT INTO `t_admin` VALUES (226, 'aa211', 'aa211', 'aa211', 'aa211', 'aa211');
INSERT INTO `t_admin` VALUES (227, 'aa212', 'aa212', 'aa212', 'aa212', 'aa212');
INSERT INTO `t_admin` VALUES (228, 'aa213', 'aa213', 'aa213', 'aa213', 'aa213');
INSERT INTO `t_admin` VALUES (229, 'aa214', 'aa214', 'aa214', 'aa214', 'aa214');
INSERT INTO `t_admin` VALUES (230, 'aa215', 'aa215', 'aa215', 'aa215', 'aa215');
INSERT INTO `t_admin` VALUES (231, 'aa216', 'aa216', 'aa216', 'aa216', 'aa216');
INSERT INTO `t_admin` VALUES (232, 'aa217', 'aa217', 'aa217', 'aa217', 'aa217');
INSERT INTO `t_admin` VALUES (233, 'aa218', 'aa218', 'aa218', 'aa218', 'aa218');
INSERT INTO `t_admin` VALUES (234, 'aa219', 'aa219', 'aa219', 'aa219', 'aa219');
INSERT INTO `t_admin` VALUES (235, 'aa220', 'aa220', 'aa220', 'aa220', 'aa220');
INSERT INTO `t_admin` VALUES (236, 'aa221', 'aa221', 'aa221', 'aa221', 'aa221');
INSERT INTO `t_admin` VALUES (238, 'aa223', 'aa223', 'aa223', 'aa223', 'aa223');
INSERT INTO `t_admin` VALUES (239, 'aa224', 'aa224', 'aa224', 'aa224', 'aa224');
INSERT INTO `t_admin` VALUES (240, 'aa225', 'aa225', 'aa225', 'aa225', 'aa225');
INSERT INTO `t_admin` VALUES (241, 'aa226', 'aa226', 'aa226', 'aa226', 'aa226');
INSERT INTO `t_admin` VALUES (242, 'aa227', 'aa227', 'aa227', 'aa227', 'aa227');
INSERT INTO `t_admin` VALUES (243, 'aa228', 'aa228', 'aa228', 'aa228', 'aa228');
INSERT INTO `t_admin` VALUES (244, 'aa229', 'aa229', 'aa229', 'aa229', 'aa229');
INSERT INTO `t_admin` VALUES (245, 'aa230', 'aa230', 'aa230', 'aa230', 'aa230');
INSERT INTO `t_admin` VALUES (246, 'aa231', 'aa231', 'aa231', 'aa231', 'aa231');
INSERT INTO `t_admin` VALUES (247, 'aa232', 'aa232', 'aa232', 'aa232', 'aa232');
INSERT INTO `t_admin` VALUES (248, 'aa233', 'aa233', 'aa233', 'aa233', 'aa233');
INSERT INTO `t_admin` VALUES (249, 'aa234', 'aa234', 'aa234', 'aa234', 'aa234');
INSERT INTO `t_admin` VALUES (250, 'aa235', 'aa235', 'aa235', 'aa235', 'aa235');
INSERT INTO `t_admin` VALUES (251, 'aa236', 'aa236', 'aa236', 'aa236', 'aa236');
INSERT INTO `t_admin` VALUES (253, 'bb30', '47BCE5C74F589F4867DBD57E9CA9F808', 'bb3000', 'bb3@qq.com', '2020-05-02 23:56:22');
INSERT INTO `t_admin` VALUES (256, 'bb300', '698D51A19D8A121CE581499D7B701668', 'bb3000', 'lisi@qq.com', '2020-05-03 00:00:12');
INSERT INTO `t_admin` VALUES (257, 'admin2', '$2a$10$YwL9hbBk9yK9enWAGt7EP.1Ti1sGwC9FILUxk4bUx1RGHbfd3kXG2', 'admin222', 'admin222@qq.com', '2020-05-17 22:22:15');
INSERT INTO `t_admin` VALUES (258, 'adminOperator', '$2a$10$YwL9hbBk9yK9enWAGt7EP.1Ti1sGwC9FILUxk4bUx1RGHbfd3kXG2', 'adminop', 'adminop', NULL);
INSERT INTO `t_admin` VALUES (259, 'roleOperator', '$2a$10$YwL9hbBk9yK9enWAGt7EP.1Ti1sGwC9FILUxk4bUx1RGHbfd3kXG2', 'role', 'role', NULL);
INSERT INTO `t_admin` VALUES (260, 'abcd', '$2a$10$bbeDISL3PQtE4/nrxCHDK.2soRBHh2/ZKOUqmqsJeaR3AuJCZk3li', 'abcd', 'aaa@qq.com', '2020-05-17 23:07:17');

-- ----------------------------
-- Table structure for t_auth
-- ----------------------------
DROP TABLE IF EXISTS `t_auth`;
CREATE TABLE `t_auth`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `category_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_auth
-- ----------------------------
INSERT INTO `t_auth` VALUES (1, '', '用户模块', NULL);
INSERT INTO `t_auth` VALUES (2, 'user:delete', '删除', 1);
INSERT INTO `t_auth` VALUES (3, 'user:get', '查询', 1);
INSERT INTO `t_auth` VALUES (4, '', '角色模块', NULL);
INSERT INTO `t_auth` VALUES (5, 'role:delete', '删除', 4);
INSERT INTO `t_auth` VALUES (6, 'role:get', '查询', 4);
INSERT INTO `t_auth` VALUES (7, 'role:add', '新增', 4);
INSERT INTO `t_auth` VALUES (8, 'user:save', '保存', 1);

-- ----------------------------
-- Table structure for t_member
-- ----------------------------
DROP TABLE IF EXISTS `t_member`;
CREATE TABLE `t_member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginacct` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `userpswd` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `authstatus` int(4) NULL DEFAULT NULL COMMENT '实名认证状态0 - 未实名认证， 1 - 实名认证申\r\n请中， 2 - 已实名认证',
  `usertype` int(4) NULL DEFAULT NULL COMMENT ' 0 - 个人， 1 - 企业',
  `realname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cardnum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `accttype` int(4) NULL DEFAULT NULL COMMENT '0 - 企业， 1 - 个体， 2 - 个人， 3 - 政府',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `loginacct`(`loginacct`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_member
-- ----------------------------
INSERT INTO `t_member` VALUES (1, 'jack', '$2a$10$US/BtF8XjpZ1oR8jX6mcSO1BEi/2M2xC9dMhY8u/RZZpWvdnDn9x.', ' 杰克', 'jack@qq.com', 1, 1, '杰克', '123123', 2);
INSERT INTO `t_member` VALUES (2, 'zhangsan', '$2a$10$Q9xX3HgrNVscTBarBX5oduM8bkT.IoO75kPxvl0V4qPAHMdaxd0w6', 'zhangsan', 'aa', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_member_confirm_info
-- ----------------------------
DROP TABLE IF EXISTS `t_member_confirm_info`;
CREATE TABLE `t_member_confirm_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) NULL DEFAULT NULL COMMENT '会员id',
  `paynum` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '易付宝企业账号',
  `cardnum` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '法人身份证号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_member_confirm_info
-- ----------------------------
INSERT INTO `t_member_confirm_info` VALUES (1, 2, '11', '12');

-- ----------------------------
-- Table structure for t_member_launch_info
-- ----------------------------
DROP TABLE IF EXISTS `t_member_launch_info`;
CREATE TABLE `t_member_launch_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) NULL DEFAULT NULL COMMENT '会员id',
  `description_simple` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简单介绍',
  `description_detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细介绍',
  `phone_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `service_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客服电话',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_member_launch_info
-- ----------------------------
INSERT INTO `t_member_launch_info` VALUES (1, 2, 'i am mao', '我是猫哥', '123456', '654321');

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `icon` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES (1, NULL, '系统权限菜单', NULL, 'glyphicon glyphicon-th-list');
INSERT INTO `t_menu` VALUES (2, 1, ' 控制面板', 'main.htm', 'glyphicon glyphicon-dashboard');
INSERT INTO `t_menu` VALUES (3, 1, '权限管理', NULL, 'glyphicon glyphicon glyphicon-tasks');
INSERT INTO `t_menu` VALUES (4, 3, '用户维护', 'user/index.htm', 'glyphicon glyphicon-check');
INSERT INTO `t_menu` VALUES (5, 3, ' 角色维护', 'role/index.htm', 'glyphicon glyphicon-king');
INSERT INTO `t_menu` VALUES (6, 3, ' 菜单维护', 'permission/index.htm', 'glyphicon glyphicon-lock');
INSERT INTO `t_menu` VALUES (7, 1, ' 业务审核', NULL, 'glyphicon glyphicon-ok');
INSERT INTO `t_menu` VALUES (8, 7, ' 实名认证审核', 'auth_cert/index.htm', 'glyphicon glyphicon-check');
INSERT INTO `t_menu` VALUES (9, 7, ' 广告审核', 'auth_adv/index.htm', 'glyphicon glyphicon-check');
INSERT INTO `t_menu` VALUES (10, 7, ' 项目审核', 'auth_project/index.htm', 'glyphicon glyphicon-check');
INSERT INTO `t_menu` VALUES (11, 1, ' 业务管理', NULL, 'glyphicon glyphicon-th-large');
INSERT INTO `t_menu` VALUES (12, 11, ' 资质维护', 'cert/index.htm', 'glyphicon glyphicon-picture');
INSERT INTO `t_menu` VALUES (13, 11, ' 分类管理', 'certtype/index.htm', 'glyphicon glyphicon-equalizer');
INSERT INTO `t_menu` VALUES (14, 11, ' 流程管理', 'process/index.htm', 'glyphicon glyphicon-random');
INSERT INTO `t_menu` VALUES (15, 11, '广告管理', 'advert/index.htm', 'glyphicon glyphicon-equalizer');
INSERT INTO `t_menu` VALUES (16, 11, ' 消息模板', 'message/index.htm', 'glyphicon glyphicon-comment');
INSERT INTO `t_menu` VALUES (17, 11, '项目分类', 'projectType/index.htm', 'glyphicon glyphicon-hdd');
INSERT INTO `t_menu` VALUES (18, 11, ' 项目标签', 'tag/index.htm', 'glyphicon glyphicon-tags');
INSERT INTO `t_menu` VALUES (19, 1, ' 参数管理', 'param/index.htm', 'glyphicon glyphicon-list-alt');

-- ----------------------------
-- Table structure for t_project
-- ----------------------------
DROP TABLE IF EXISTS `t_project`;
CREATE TABLE `t_project`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `project_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目描述',
  `money` bigint(11) NULL DEFAULT NULL COMMENT '筹集金额',
  `day` int(11) NULL DEFAULT NULL COMMENT '筹集天数',
  `status` int(4) NULL DEFAULT NULL COMMENT '0-即将开始，1-众筹中，2-众筹成功，3-众筹失败\r\n',
  `deploydate` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目发起时间',
  `supportmoney` bigint(11) NULL DEFAULT NULL COMMENT '已筹集到的金额',
  `supporter` int(11) NULL DEFAULT NULL COMMENT '支持人数',
  `completion` int(3) NULL DEFAULT NULL COMMENT '百分比完成度',
  `memberid` int(11) NULL DEFAULT NULL COMMENT '发起人的会员id',
  `createdate` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目创建时间',
  `follower` int(11) NULL DEFAULT NULL COMMENT '关注人数',
  `header_picture_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头图路径',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_project
-- ----------------------------
INSERT INTO `t_project` VALUES (1, 'brotherMao', '就是帅！', NULL, 30, 0, NULL, NULL, NULL, NULL, 2, '2020-06-07', NULL, 'http://atguigu190830.oss-cn-shenzhen.aliyuncs.com/20200607/7b54481f08e341c4a33a9d5eedf890f6.jpg');

-- ----------------------------
-- Table structure for t_project_item_pic
-- ----------------------------
DROP TABLE IF EXISTS `t_project_item_pic`;
CREATE TABLE `t_project_item_pic`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectid` int(11) NULL DEFAULT NULL,
  `item_pic_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_project_item_pic
-- ----------------------------
INSERT INTO `t_project_item_pic` VALUES (1, 1, 'http://atguigu190830.oss-cn-shenzhen.aliyuncs.com/20200607/feb53fe3c4fd4b61aca192b06e7fbd58.png');
INSERT INTO `t_project_item_pic` VALUES (2, 1, 'http://atguigu190830.oss-cn-shenzhen.aliyuncs.com/20200607/e60cb9ca4511443da4e29b083ebb4554.png');

-- ----------------------------
-- Table structure for t_project_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_project_tag`;
CREATE TABLE `t_project_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectid` int(11) NULL DEFAULT NULL,
  `tagid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_project_tag
-- ----------------------------
INSERT INTO `t_project_tag` VALUES (1, 1, 9);

-- ----------------------------
-- Table structure for t_project_type
-- ----------------------------
DROP TABLE IF EXISTS `t_project_type`;
CREATE TABLE `t_project_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectid` int(11) NULL DEFAULT NULL,
  `typeid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_project_type
-- ----------------------------
INSERT INTO `t_project_type` VALUES (1, 1, 2);
INSERT INTO `t_project_type` VALUES (2, 1, 4);

-- ----------------------------
-- Table structure for t_return
-- ----------------------------
DROP TABLE IF EXISTS `t_return`;
CREATE TABLE `t_return`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectid` int(11) NULL DEFAULT NULL,
  `type` int(4) NULL DEFAULT NULL COMMENT '0 - 实物回报， 1 虚拟物品回报',
  `supportmoney` int(11) NULL DEFAULT NULL COMMENT '支持金额',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回报内容',
  `count` int(11) NULL DEFAULT NULL COMMENT '回报产品限额，“0”为不限回报数量',
  `signalpurchase` int(11) NULL DEFAULT NULL COMMENT '是否设置单笔限购',
  `purchase` int(11) NULL DEFAULT NULL COMMENT '具体限购数量',
  `freight` int(11) NULL DEFAULT NULL COMMENT '运费，“0”为包邮',
  `invoice` int(4) NULL DEFAULT NULL COMMENT '0 - 不开发票， 1 - 开发票',
  `returndate` int(11) NULL DEFAULT NULL COMMENT '项目结束后多少天向支持者发送回报',
  `describ_pic_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '说明图片路径',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_return
-- ----------------------------
INSERT INTO `t_return` VALUES (1, 1, 1, 10, '以身相许', 5, 1, 8, 0, 0, 15, 'http://atguigu190830.oss-cn-shenzhen.aliyuncs.com/20200607/cb9423ed5a8d4ba49822c96ec0449723.png');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 249 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, 'PM - 项目经理');
INSERT INTO `t_role` VALUES (2, '	SE - 软件工程师');
INSERT INTO `t_role` VALUES (3, 'PG - 程序员');
INSERT INTO `t_role` VALUES (9, '70b19265-7d71-4ddf-8431-43a9d18b4b6a');
INSERT INTO `t_role` VALUES (10, '115395a5-4e57-4376-93d5-2dc2ac168b01');
INSERT INTO `t_role` VALUES (28, 'eaaf601e-7416-458f-a00f-4e004c121637');
INSERT INTO `t_role` VALUES (29, '74965cf5-0e04-4660-b92a-f3aff32aa53b');
INSERT INTO `t_role` VALUES (30, '04ac4a03-f7a7-43fd-b0c3-7a7b89780c63');
INSERT INTO `t_role` VALUES (31, 'bee0171f-10b0-4b6f-8839-d552690dd396');
INSERT INTO `t_role` VALUES (32, '78e88221-7c4c-43ed-b802-3c94eab63407');
INSERT INTO `t_role` VALUES (38, '44e90e82-9395-4cde-a6d4-f2b6925e255e');
INSERT INTO `t_role` VALUES (39, '9839a70f-adfc-4d2e-a271-65345f039423');
INSERT INTO `t_role` VALUES (40, '1d3097cc-4f95-44f2-b60f-b0fce8e97568');
INSERT INTO `t_role` VALUES (41, 'df94df58-e235-4fc4-9b4a-34051ea2b323');
INSERT INTO `t_role` VALUES (42, 'e3108ad2-b04f-4daa-a958-01adf5ca14bc');
INSERT INTO `t_role` VALUES (43, '2e64576f-2043-4f31-b7c8-3cd4c9e59e29');
INSERT INTO `t_role` VALUES (44, 'b0667901-3a51-466f-b766-3f0867e7a0ae');
INSERT INTO `t_role` VALUES (45, 'dd350d78-754a-4d9b-9c20-b06aa8ac5daf');
INSERT INTO `t_role` VALUES (46, 'd26be003-43e8-46c8-96c9-b003d2ed8174');
INSERT INTO `t_role` VALUES (47, 'eb3f1efa-3efc-447a-a47d-be210ff2b5d3');
INSERT INTO `t_role` VALUES (48, '7516eb25-77f1-4c79-8857-75b33a12821f');
INSERT INTO `t_role` VALUES (49, '5a655a0b-2627-42f0-b069-d41f19e1de2d');
INSERT INTO `t_role` VALUES (50, '612cf4a7-ed55-41a1-9669-836df5b0f582');
INSERT INTO `t_role` VALUES (51, 'b609a969-0020-49ad-bd7f-73b54450479a');
INSERT INTO `t_role` VALUES (52, '6e308c9d-7717-46c3-98dd-642e49e4b985');
INSERT INTO `t_role` VALUES (53, '003c5ebe-9d10-409a-8fc4-5174f5d88b9a');
INSERT INTO `t_role` VALUES (54, 'be77c869-c178-40e6-9277-ee564d00bdc8');
INSERT INTO `t_role` VALUES (55, '1da512f7-9695-4d61-8080-8f7944b5e481');
INSERT INTO `t_role` VALUES (56, '57b7cf05-0761-4b96-ba7e-e9a699f29a95');
INSERT INTO `t_role` VALUES (57, '66a337c6-078c-4c93-a8fc-c85b575f287f');
INSERT INTO `t_role` VALUES (58, '5f78a0cd-9bdf-4b46-892e-ad942c3ff6e5');
INSERT INTO `t_role` VALUES (59, 'a3702741-bae4-4fad-a6ba-3b7f74162132');
INSERT INTO `t_role` VALUES (60, '4ab49de7-25b7-490e-b380-2f1117cf925e');
INSERT INTO `t_role` VALUES (61, '29aadf77-5bdb-4fa4-bc80-8f053318179a');
INSERT INTO `t_role` VALUES (62, '2213eec1-8706-4ac6-ad97-665625c1f750');
INSERT INTO `t_role` VALUES (63, '684f65ae-9bd1-44d3-a201-72b3c73d1dc3');
INSERT INTO `t_role` VALUES (64, '636774b6-20ae-4c99-b13b-70a9003978e3');
INSERT INTO `t_role` VALUES (65, 'b37fcdf6-8f29-436b-a5af-0b8aef623d7d');
INSERT INTO `t_role` VALUES (66, 'f6942eee-4992-4ebe-bc5d-bd942fa8a2bc');
INSERT INTO `t_role` VALUES (67, '12e88d75-8deb-4c20-a8c7-5f4fb71f6958');
INSERT INTO `t_role` VALUES (68, 'aca65902-5d21-4674-8f8d-6bb5b7d7ca76');
INSERT INTO `t_role` VALUES (69, '5e799151-eff8-4663-a047-2383ad3a534c');
INSERT INTO `t_role` VALUES (70, 'e34eb71a-eb37-4d88-9c0b-e9a86bc7ef44');
INSERT INTO `t_role` VALUES (71, '3aa0c8b7-d8ad-41ee-ab9e-dfffff80d935');
INSERT INTO `t_role` VALUES (72, '75b960f7-e652-413c-b9cd-2c5fa138b4cd');
INSERT INTO `t_role` VALUES (73, 'a3afc2f4-6bf3-46ac-bf0f-08722c27fc5a');
INSERT INTO `t_role` VALUES (74, '52800e60-12d9-4c22-a327-fccc038d5389');
INSERT INTO `t_role` VALUES (75, '1e16d19a-0011-4c36-b926-223edce49177');
INSERT INTO `t_role` VALUES (76, 'ebab23f5-3057-4fdd-831b-c2459ec4c02e');
INSERT INTO `t_role` VALUES (77, '8d0848c2-09a3-45f1-b697-3120bcecb490');
INSERT INTO `t_role` VALUES (78, 'c3ce24f5-981c-46dc-ab87-ab3408a2b94a');
INSERT INTO `t_role` VALUES (79, 'be5861e5-0db5-4ad0-9428-0d404e1d4953');
INSERT INTO `t_role` VALUES (80, 'a2a3ddc9-49c1-47df-a5d4-4ba4764ba075');
INSERT INTO `t_role` VALUES (81, '5466c86f-5be8-463e-8560-eea48c01c66e');
INSERT INTO `t_role` VALUES (82, 'cfa1c680-24a2-43e8-8189-0057d47f6cce');
INSERT INTO `t_role` VALUES (83, '0cd2d2ce-05c8-421b-9bda-d19093462393');
INSERT INTO `t_role` VALUES (84, 'efecc319-7e01-4368-a592-526457af6c1f');
INSERT INTO `t_role` VALUES (85, 'b8ab8343-66df-4c60-ae1e-f88939f12555');
INSERT INTO `t_role` VALUES (86, 'fc337cdf-4fdf-45f5-b6a8-2f9e39962c42');
INSERT INTO `t_role` VALUES (87, 'f3f30090-7c73-4870-9ac8-c0ee2455debc');
INSERT INTO `t_role` VALUES (88, 'd55b057c-596f-4c01-b8f1-eedad042c085');
INSERT INTO `t_role` VALUES (89, '02296d2c-f177-483b-b8d1-99aec1b90cb7');
INSERT INTO `t_role` VALUES (90, 'aa95efb9-3567-4791-8bb0-52bc04467f5b');
INSERT INTO `t_role` VALUES (91, '5d08acb3-bb01-44a1-8506-c41580ca6f7e');
INSERT INTO `t_role` VALUES (92, '1e1652da-9c64-44d0-94bb-24fc69539270');
INSERT INTO `t_role` VALUES (93, '2b85fb36-bf33-4db1-b97c-aef113de7f76');
INSERT INTO `t_role` VALUES (94, '7c2ba7ad-b694-4845-9e67-b9c5de621c65');
INSERT INTO `t_role` VALUES (95, '5fd5f79f-6823-4b08-919e-b1702be714e2');
INSERT INTO `t_role` VALUES (96, 'd35b4b6a-4755-442b-a38e-7889da0752ac');
INSERT INTO `t_role` VALUES (97, 'b0597786-6553-4e68-a75f-e167c307f1fd');
INSERT INTO `t_role` VALUES (98, '798f86bc-7016-4dc6-b3a1-cd2f533c5b71');
INSERT INTO `t_role` VALUES (99, 'd5d48490-72d0-4bd3-a405-fb271f90a8ad');
INSERT INTO `t_role` VALUES (100, '9265a878-e7bb-4882-b049-948b7b3f8eb0');
INSERT INTO `t_role` VALUES (101, '8812adac-3f08-4541-8c9c-3b85020e64f4');
INSERT INTO `t_role` VALUES (102, 'b7d5f4cb-a41f-4b1c-9793-40e6642c618c');
INSERT INTO `t_role` VALUES (103, '6d6236cd-bd4a-4b25-930b-f4c01a6eddfe');
INSERT INTO `t_role` VALUES (104, '94df7663-28f5-40db-b3e3-96fc7b7da341');
INSERT INTO `t_role` VALUES (105, '8eb75ac9-a31f-46d2-8ce7-b2397ba0a7a5');
INSERT INTO `t_role` VALUES (106, 'b99a24c2-0ba5-4334-8e9f-4231d18f7714');
INSERT INTO `t_role` VALUES (107, 'b38a2e63-8be7-4229-a220-5e48a392159e');
INSERT INTO `t_role` VALUES (108, 'b296a631-872f-4177-887e-3e04de2695bc');
INSERT INTO `t_role` VALUES (109, '742cff94-44da-4864-b953-caed092b656e');
INSERT INTO `t_role` VALUES (110, 'ad79cd84-9048-481e-9b5e-bada80bd820d');
INSERT INTO `t_role` VALUES (111, '55784dd3-cc0f-43fd-a75d-951fcbe74ce8');
INSERT INTO `t_role` VALUES (112, 'fc81c5f0-cd9a-4197-a662-f78926e05410');
INSERT INTO `t_role` VALUES (113, 'd284f30d-7288-4fe6-aa91-46e8e4a43d42');
INSERT INTO `t_role` VALUES (114, 'b1aa9075-cf46-4583-a02b-0fd9c662267c');
INSERT INTO `t_role` VALUES (115, 'ac29e294-8d66-43f4-b150-a3cd13de4a89');
INSERT INTO `t_role` VALUES (116, '6e4fd014-01bc-4a78-ad13-765d333775cf');
INSERT INTO `t_role` VALUES (117, '0c905a37-8913-4002-bc57-2780ab0ec191');
INSERT INTO `t_role` VALUES (118, '6fcee3b4-6cb0-4e5d-81bc-beed534d0ddb');
INSERT INTO `t_role` VALUES (119, '297ccea8-701e-49cc-a21d-53fb0a6337d1');
INSERT INTO `t_role` VALUES (120, '914c0709-668a-47d6-a223-bb921f0e991e');
INSERT INTO `t_role` VALUES (121, 'c33a09cd-9147-48e5-a21f-296b52ae27eb');
INSERT INTO `t_role` VALUES (122, '288e57c8-3ca7-45b7-8d2e-f6dd367cbd0d');
INSERT INTO `t_role` VALUES (123, 'da3b58c8-8a56-49f5-89db-61054534d538');
INSERT INTO `t_role` VALUES (124, 'a4084cc3-66fb-4b2e-890d-1f05e3115efb');
INSERT INTO `t_role` VALUES (125, '5d715ce0-42e6-4aca-b83d-07d4b3be958b');
INSERT INTO `t_role` VALUES (126, 'd008e6e8-d2bf-49b5-a2f0-50941c84dd28');
INSERT INTO `t_role` VALUES (127, '3704a0d6-b0b8-4211-96f2-c1307a7c64ac');
INSERT INTO `t_role` VALUES (128, '03e82d28-462a-40f6-8e97-9a087cc4afab');
INSERT INTO `t_role` VALUES (129, '8dd03dd1-31a3-4070-bb5a-5ed220e98e55');
INSERT INTO `t_role` VALUES (130, '336afa67-13da-411f-99d5-7ad556b1e9e8');
INSERT INTO `t_role` VALUES (131, '7b5df3cd-d181-4b06-9fbc-090d1658cfad');
INSERT INTO `t_role` VALUES (132, '228d5741-a864-486b-b1df-d90238d39c4c');
INSERT INTO `t_role` VALUES (133, 'd40cde8a-6380-4664-a96d-5c271469f95d');
INSERT INTO `t_role` VALUES (134, 'af1e7c9a-1610-4091-924b-0b44d8c28980');
INSERT INTO `t_role` VALUES (135, '93bd866c-a5c9-4933-9c72-94b0312fb3e5');
INSERT INTO `t_role` VALUES (136, 'd1cfff9b-429d-44b4-8cce-271f13fe0e28');
INSERT INTO `t_role` VALUES (137, 'be8f5153-3131-441a-ab02-eabc48db40ba');
INSERT INTO `t_role` VALUES (138, 'bc09f15f-51b8-43e8-8948-53580cbf2d8c');
INSERT INTO `t_role` VALUES (139, 'ef2d04ed-cbd3-44bc-bfb9-5aa7e5656814');
INSERT INTO `t_role` VALUES (140, '22f21f83-5bfc-47a7-9121-d29ce5ba7188');
INSERT INTO `t_role` VALUES (141, '10e8b86e-8d64-480d-bd45-de68fabce63a');
INSERT INTO `t_role` VALUES (142, 'd5fd97d9-f21b-454e-aa92-514fa98bab58');
INSERT INTO `t_role` VALUES (143, 'c367d222-3377-47df-a939-5ba25d0e5a31');
INSERT INTO `t_role` VALUES (144, '1ec7263b-056d-44a6-817e-bdbf83f9e6b3');
INSERT INTO `t_role` VALUES (145, 'ececeb3f-083d-4c61-882b-5402bb999822');
INSERT INTO `t_role` VALUES (146, 'd72649ff-c717-405d-9764-0626816009da');
INSERT INTO `t_role` VALUES (147, '807b223f-b776-4f74-a023-7eb48ddc7f28');
INSERT INTO `t_role` VALUES (148, 'ba49f541-ecad-4110-997e-c63837e9419d');
INSERT INTO `t_role` VALUES (149, '7d5c4da4-fb4f-4f9b-b0cf-fe4c914cd677');
INSERT INTO `t_role` VALUES (150, '82ed028a-f90f-4ab9-bee4-ae911ddcc1b8');
INSERT INTO `t_role` VALUES (151, '7f27a5ec-f296-41c3-af1a-757e53bb4bc6');
INSERT INTO `t_role` VALUES (152, 'e9af42a9-5cce-431e-a366-17d25cd53089');
INSERT INTO `t_role` VALUES (153, 'cbdfa350-09dc-4db5-999f-6058547a6206');
INSERT INTO `t_role` VALUES (154, '089b1207-3547-4444-9908-ce86c77257ca');
INSERT INTO `t_role` VALUES (155, '18c6607c-6e3a-4ee4-99eb-25064d9c0c42');
INSERT INTO `t_role` VALUES (156, '99877c56-38ca-45a4-96b9-1c4f4a468da7');
INSERT INTO `t_role` VALUES (157, 'e52fcf69-8d68-4701-bbbc-2a800155c6a7');
INSERT INTO `t_role` VALUES (158, '4cfcc9bb-a879-4902-b95c-2609d4ff86b2');
INSERT INTO `t_role` VALUES (159, '35bd4f91-3b78-47b4-bf74-cf7d6a59487e');
INSERT INTO `t_role` VALUES (160, 'ed3d37d9-e508-471f-99e4-d95ded724ad0');
INSERT INTO `t_role` VALUES (161, 'fede106c-2531-430d-a9e9-28ca8da53798');
INSERT INTO `t_role` VALUES (162, '00705329-44b7-4965-9d2d-54d0b6832a9a');
INSERT INTO `t_role` VALUES (163, '0159a888-12f3-4475-bb40-3c6d46a1524f');
INSERT INTO `t_role` VALUES (164, '48671fc9-6b2f-4e99-b1a2-a4dbb85715a4');
INSERT INTO `t_role` VALUES (165, '726dc9b3-da65-4e42-85fa-622c1a48744e');
INSERT INTO `t_role` VALUES (166, 'b9e48f1a-e6d7-48e8-8002-c6306f635d91');
INSERT INTO `t_role` VALUES (167, '7fe4ad95-5405-4945-8371-efb3fb4356e8');
INSERT INTO `t_role` VALUES (168, 'f38c8dc5-c881-4129-af2b-42438f8f64bd');
INSERT INTO `t_role` VALUES (169, 'a5f82ff4-10c0-4218-ae13-999226b79f34');
INSERT INTO `t_role` VALUES (170, '06d8368a-c139-4690-9620-4bc329dce0b0');
INSERT INTO `t_role` VALUES (171, 'e2338f14-959d-4732-9141-75fd0f310f02');
INSERT INTO `t_role` VALUES (172, '176450a2-9574-4703-a99e-bbcb2f2a4200');
INSERT INTO `t_role` VALUES (173, '641ab695-1093-47c9-99b9-7e2dcc25da48');
INSERT INTO `t_role` VALUES (174, 'fbbfe1a1-2065-43a3-9453-2df475d57bb6');
INSERT INTO `t_role` VALUES (175, '2d45ae48-c22e-4e52-9a15-61273e47507f');
INSERT INTO `t_role` VALUES (176, '8e4f0058-f543-4f93-9d79-a125d0dc7d5e');
INSERT INTO `t_role` VALUES (177, 'cdd61bd3-2273-4dd7-8613-c601b6abb17d');
INSERT INTO `t_role` VALUES (178, 'c05e18b9-66d3-4c8b-b258-25fed3718553');
INSERT INTO `t_role` VALUES (179, '6cc4fbc4-1d5d-4b4c-853c-b121a85314e8');
INSERT INTO `t_role` VALUES (180, '17da4a7d-9d09-4ced-b9d9-41a44fe73598');
INSERT INTO `t_role` VALUES (181, '45ff080a-d23b-4359-8918-e7a1e14c451a');
INSERT INTO `t_role` VALUES (182, '2a7836bb-5bf8-47be-9814-3c41e5de353b');
INSERT INTO `t_role` VALUES (183, 'a2137bf6-5032-496f-95c0-5ed7782754cf');
INSERT INTO `t_role` VALUES (184, '22d445f5-8ce1-4dea-9326-7056a18aface');
INSERT INTO `t_role` VALUES (185, '69d1b1c7-e5e6-4a45-907b-5d3ed2f7102a');
INSERT INTO `t_role` VALUES (186, '0a6ebb42-f772-4856-af89-1d0f8f6d7aea');
INSERT INTO `t_role` VALUES (187, 'edb37c17-2bfd-439d-951a-fd278f815947');
INSERT INTO `t_role` VALUES (188, '3bee577b-4dbc-4ae6-8a3d-a45ffb96c47c');
INSERT INTO `t_role` VALUES (189, '36908a92-1407-499e-a748-5f218531bc13');
INSERT INTO `t_role` VALUES (190, '40283580-8fec-4754-bf62-dd5d3bf79bcd');
INSERT INTO `t_role` VALUES (191, '57d6d371-57c4-4817-918d-e5d95761a271');
INSERT INTO `t_role` VALUES (192, '2415d339-2e9a-4e81-a97e-ef9d3ad3d752');
INSERT INTO `t_role` VALUES (193, 'cca21dcf-1f03-4dc5-a530-ce4f54ecd956');
INSERT INTO `t_role` VALUES (194, '38a859f7-7d6c-4202-b04a-107f46a8b144');
INSERT INTO `t_role` VALUES (195, '5121bb08-3cd3-414c-a63d-e493aac29945');
INSERT INTO `t_role` VALUES (196, 'de1ae3c9-1e7c-4b86-9383-a480c1ab6023');
INSERT INTO `t_role` VALUES (197, 'c0cb451b-779d-42c9-a387-d27dfadaadcf');
INSERT INTO `t_role` VALUES (198, '93332776-f093-4716-b328-1da34c049c33');
INSERT INTO `t_role` VALUES (199, '3352b8b7-c114-4333-8751-18cdb1e8bebc');
INSERT INTO `t_role` VALUES (200, '8462fe93-46a4-487a-8e24-fea8563909f8');
INSERT INTO `t_role` VALUES (201, 'cb30ec80-7187-4882-8bf3-54a8faeaff5f');
INSERT INTO `t_role` VALUES (202, '4a70be0a-f7c3-4a75-9960-15b83caedca0');
INSERT INTO `t_role` VALUES (203, 'b5bfb9e7-40ea-42ca-a6d4-9a93ef063eb3');
INSERT INTO `t_role` VALUES (204, '8cb63cba-afa4-42ac-a660-a13b071857d8');
INSERT INTO `t_role` VALUES (205, '2cf81336-7164-4e38-bffa-c64e598da05b');
INSERT INTO `t_role` VALUES (206, 'ec7ad540-52a6-440c-8b93-ea8f70c6c6aa');
INSERT INTO `t_role` VALUES (207, 'a3076dfb-8d7e-4441-98bd-608e18def278');
INSERT INTO `t_role` VALUES (208, '3c48eff0-a8c8-4e71-aa56-29ad9bd50d95');
INSERT INTO `t_role` VALUES (209, 'c4d61b67-0f30-44e1-8ed3-766952544a0c');
INSERT INTO `t_role` VALUES (210, '285bbe33-8082-424c-a983-77407d602d5a');
INSERT INTO `t_role` VALUES (211, 'f4ef58b3-4370-4ba7-998c-2a7d7f0757ba');
INSERT INTO `t_role` VALUES (212, 'a89168b7-8a43-46fa-98d2-aa07d4552b8a');
INSERT INTO `t_role` VALUES (213, '851f60f5-e858-4206-bffc-8d79be0ae53b');
INSERT INTO `t_role` VALUES (214, '58f64448-8bf1-4ec3-9b77-b44cc405542a');
INSERT INTO `t_role` VALUES (215, 'f7629e41-6971-417e-b4d4-67cf2402618d');
INSERT INTO `t_role` VALUES (216, '1dcf788a-6301-4fa2-b140-e4e2448f43c2');
INSERT INTO `t_role` VALUES (217, 'ab5f37ae-46b1-4a7e-aa93-c7e212eee52a');
INSERT INTO `t_role` VALUES (218, 'a5bb0a1c-9ce2-480e-9da7-228163b7219a');
INSERT INTO `t_role` VALUES (219, 'd9257d05-6fc9-43ce-8e0f-fdc178b1195b');
INSERT INTO `t_role` VALUES (220, '17082a2e-0772-47eb-b9fe-fe25e4c95e8b');
INSERT INTO `t_role` VALUES (221, '8f9b5ae1-26a0-4afa-a608-6aa05516b4cb');
INSERT INTO `t_role` VALUES (222, '67cabd7c-6caa-4622-b0a2-00f92e3f3316');
INSERT INTO `t_role` VALUES (223, '8f02a5e0-17ae-46b4-8058-c36e3c4e4b10');
INSERT INTO `t_role` VALUES (224, '42ffe555-75b6-41bd-9859-6becd2a12af6');
INSERT INTO `t_role` VALUES (225, '635fcfad-0867-4de2-95af-5660da4f7c68');
INSERT INTO `t_role` VALUES (226, '5aec9005-d245-4c40-aa54-938d11d23b13');
INSERT INTO `t_role` VALUES (227, '869018e7-b0d7-4624-b7ee-f19b623006ec');
INSERT INTO `t_role` VALUES (228, 'f2aa8e27-2695-4acd-8611-2c1c5ac53181');
INSERT INTO `t_role` VALUES (229, 'b0ba0acd-e825-4e83-bede-e0a5ad3f0af5');
INSERT INTO `t_role` VALUES (230, '4ef62c5c-4f04-4b74-9bd1-970254cedc86');
INSERT INTO `t_role` VALUES (231, 'cdc1813f-17b2-4339-84ce-b9b046fa55e8');
INSERT INTO `t_role` VALUES (232, 'ec67ed94-9a38-4243-8763-82136c623264');
INSERT INTO `t_role` VALUES (233, '49082311-1f4f-497f-a239-dfeebcc4cee2');
INSERT INTO `t_role` VALUES (234, '5ed9a215-d0ce-44fd-a4a3-e5bdb5b617e3');
INSERT INTO `t_role` VALUES (235, 'b2203579-f74f-46db-ad8a-117a3440b61b');
INSERT INTO `t_role` VALUES (236, 'b26c8439-adeb-4f70-b862-b81e2c3d24ba');
INSERT INTO `t_role` VALUES (237, 'c17e06ab-01fc-4ad0-9b95-8f835521b81f');
INSERT INTO `t_role` VALUES (238, '312c3ad6-a8ae-4a72-be10-6d3cceec2239');
INSERT INTO `t_role` VALUES (239, '1851a378-d504-436b-b004-394871d862dd');
INSERT INTO `t_role` VALUES (240, '2892c99c-75e2-45d6-b2cc-ab8871548332');
INSERT INTO `t_role` VALUES (241, '5f6fa543-a0cb-4f5e-adc7-c14cb8879a53');
INSERT INTO `t_role` VALUES (242, 'python后端开发工程师');
INSERT INTO `t_role` VALUES (243, 'java开发工程师');
INSERT INTO `t_role` VALUES (244, 'java高级工程师');
INSERT INTO `t_role` VALUES (245, '经理');
INSERT INTO `t_role` VALUES (246, '经理操作者');
INSERT INTO `t_role` VALUES (247, '部长');
INSERT INTO `t_role` VALUES (248, '部长操作者');

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_tag
-- ----------------------------
INSERT INTO `t_tag` VALUES (1, NULL, '手机');
INSERT INTO `t_tag` VALUES (2, NULL, '数码');
INSERT INTO `t_tag` VALUES (3, NULL, '电脑');
INSERT INTO `t_tag` VALUES (4, 1, '大屏');
INSERT INTO `t_tag` VALUES (5, 1, '美颜');
INSERT INTO `t_tag` VALUES (6, 1, '续航');
INSERT INTO `t_tag` VALUES (7, 2, '高解析度');
INSERT INTO `t_tag` VALUES (8, 2, '高清');
INSERT INTO `t_tag` VALUES (9, 3, '大内存');
INSERT INTO `t_tag` VALUES (10, 3, '固态');

-- ----------------------------
-- Table structure for t_type
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类介绍',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_type
-- ----------------------------
INSERT INTO `t_type` VALUES (1, '科技', '开启智慧未来');
INSERT INTO `t_type` VALUES (2, '设计', '创意改变生活');
INSERT INTO `t_type` VALUES (3, '公益', '网络天下肥美');
INSERT INTO `t_type` VALUES (4, '农业', '发现更多惊喜');

SET FOREIGN_KEY_CHECKS = 1;
