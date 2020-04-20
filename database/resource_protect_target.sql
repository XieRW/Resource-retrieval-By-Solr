/*
 Navicat Premium Data Transfer

 Source Server         : 
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : 219.135.166.218:8105
 Source Schema         : sinvie_scg

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 20/04/2020 10:38:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for resource_protect_target
-- ----------------------------
DROP TABLE IF EXISTS `resource_protect_target`;
CREATE TABLE `resource_protect_target`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `protect_type` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '防护目标类型',
  `group_id` bigint(20) DEFAULT NULL COMMENT '防护目标组id(resoure_protect_group)',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '所在位置',
  `longitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '经度',
  `latitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '纬度',
  `level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '等级',
  `protect_level` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '防护等级',
  `area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '行政区域',
  `area_size` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '面积',
  `risk_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '风险缘由',
  `charge_unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '主管单位',
  `now_number` int(11) DEFAULT NULL COMMENT '当前人数',
  `use_time` datetime(0) DEFAULT NULL COMMENT '投入使用时间',
  `canuse_number` int(11) DEFAULT NULL COMMENT '可容纳人数',
  `layout` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '受灾形式',
  `monitor_way` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '检测方式',
  `data_source_unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '数据来源单位',
  `defense_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '防护区域',
  `traffic_conditions` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '周边交通情况',
  `general_situation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '基本情况',
  `conservatory_measure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '防护措施',
  `communication_mode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '应急通讯方式',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `platform_id` bigint(20) DEFAULT NULL COMMENT '平台id',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人Id',
  `gmt_create` datetime(0) DEFAULT NULL,
  `modified_user_id` bigint(20) DEFAULT NULL,
  `gmt_modified` datetime(0) DEFAULT NULL,
  `risk_reason_type` tinyint(5) DEFAULT NULL COMMENT '风险缘由类型',
  `is_deleted` tinyint(2) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic  comment '防护目标';

-- ----------------------------
-- Records of resource_protect_target
-- ----------------------------
INSERT INTO `resource_protect_target` VALUES (1, '的哈四栋就奥斯卡', '', 2, NULL, '113.256698', '23.129839', '', '', '', '0', '', '', 0, NULL, 0, '', '', '', '', '', '', '', '', '', 27, 1010, '2020-01-13 18:01:18', 1010, '2020-01-13 18:01:18', NULL, NULL);
INSERT INTO `resource_protect_target` VALUES (2, 'test', '2', NULL, NULL, '', '', '', '', '', '0', '', '', 0, NULL, 0, '', '', '', '', '', '', '', '', '', 27, 2005, '2020-01-15 14:45:03', 2005, '2020-01-15 14:45:03', NULL, NULL);
INSERT INTO `resource_protect_target` VALUES (3, 'test', '', NULL, NULL, '', '', '', '', '', '0', '', '', 0, NULL, 0, '', '', '', '', '', '', '', '', '', 27, 2005, '2020-01-16 10:48:51', 2005, '2020-01-16 10:48:51', NULL, NULL);
INSERT INTO `resource_protect_target` VALUES (4, 'test', '2', NULL, NULL, '', '', '', '', '', '0', '', '', 0, NULL, 0, '', '', '', '', '', '', '', '', '', 27, 2005, '2020-01-17 13:23:27', 2005, '2020-01-17 13:23:27', NULL, NULL);
INSERT INTO `resource_protect_target` VALUES (6, '人员防护', '2', NULL, NULL, '', '', '', '', '', '0', '', '', 0, NULL, 0, '', '', '', '', '', '', '', '', '', 27, 2005, '2020-01-18 10:53:03', 2005, '2020-01-18 10:53:03', NULL, NULL);
INSERT INTO `resource_protect_target` VALUES (7, '巡逻小分队', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, 2005, '2020-01-18 13:57:00', 2005, '2020-01-18 13:57:00', NULL, NULL);
INSERT INTO `resource_protect_target` VALUES (8, '纠察小分队', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, 2005, '2020-01-18 14:34:05', 2005, '2020-01-18 14:34:05', 1, NULL);
INSERT INTO `resource_protect_target` VALUES (9, '创兴小分队', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, 2005, '2020-01-18 14:57:33', 2005, '2020-01-18 14:57:33', 1, NULL);
INSERT INTO `resource_protect_target` VALUES (10, '治安巡逻队', '0', NULL, NULL, '', '', '', '', '', '0', '', '', 0, NULL, 0, '', '', '', '', '', '', '', '', '', 27, 2005, '2020-01-18 18:18:21', 2005, '2020-01-18 18:18:21', NULL, NULL);
INSERT INTO `resource_protect_target` VALUES (11, '治安巡逻队', '0', NULL, NULL, '113.329778', '23.102416', '', '4', '4', '0', '', '巡逻队', 0, NULL, 10, '', '', '', '', '地铁', '', '', '13635783832', '', 27, 2005, '2020-01-18 18:23:19', 2005, '2020-01-18 18:23:19', NULL, NULL);
INSERT INTO `resource_protect_target` VALUES (12, '的健身卡', '', NULL, NULL, '', '', '', '', '4', '0', '', '', 0, NULL, 0, '', '', '', '', '', '', '', '', '', 27, 1010, '2020-01-19 10:41:21', 1010, '2020-01-19 10:41:21', NULL, 1);
INSERT INTO `resource_protect_target` VALUES (13, '等哈数据库', '', NULL, NULL, '', '', '', '', '4', '0', '', '', 0, NULL, 0, '', '', '', '', '', '', '', '', '', 27, 1010, '2020-01-19 10:41:58', 1010, '2020-01-19 10:41:58', NULL, 1);
INSERT INTO `resource_protect_target` VALUES (14, '大厦尽快', '', NULL, NULL, '', '', '', '', '4', '0', '', '', 0, NULL, 0, '', '', '', '', '', '', '', '', '', 27, 1010, '2020-01-19 10:42:15', 1010, '2020-01-19 10:42:15', NULL, 1);
INSERT INTO `resource_protect_target` VALUES (15, '从v', '11', NULL, NULL, '113.238159', '23.081904', '', '', '', '0', '', '', 0, NULL, 0, '', '', '', '', '', '', '', '', '', 27, 104, '2020-01-19 10:43:01', 104, '2020-01-19 10:43:01', NULL, 1);
INSERT INTO `resource_protect_target` VALUES (16, '2001', '13', NULL, NULL, '113.422523', '23.13085', '', '', '', '0', '', '', 0, NULL, 0, '', '', '', '', '', '', '', '', '', 27, 104, '2020-01-19 10:43:48', 104, '2020-01-19 10:43:48', NULL, 1);
INSERT INTO `resource_protect_target` VALUES (17, '2020', '14', NULL, NULL, '113.276954', '23.134639', '', '', '', '0', '', '', 0, NULL, 0, '', '', '', '', '', '', '', '', '', 27, 104, '2020-01-19 10:45:01', 104, '2020-01-19 10:45:01', NULL, 1);
INSERT INTO `resource_protect_target` VALUES (18, '2020', '14', NULL, NULL, '', '', '', '', '', '0', '', '', 0, NULL, 0, '', '', '', '', '', '', '', '', '', 27, 104, '2020-01-19 10:46:30', 104, '2020-01-19 10:46:30', NULL, 1);