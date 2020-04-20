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

 Date: 20/04/2020 10:39:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for resource_team
-- ----------------------------
DROP TABLE IF EXISTS `resource_team`;
CREATE TABLE `resource_team`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '队伍名称',
  `team_type_id` bigint(20) DEFAULT NULL COMMENT '队伍类型id',
  `people_number` int(20) DEFAULT NULL COMMENT '队伍人数',
  `qualification_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '资质等级',
  `creation_time` datetime(0) DEFAULT NULL COMMENT '成立时间',
  `nature` tinyint(1) DEFAULT NULL COMMENT '性质: 1:专职 2:兼职 3:专业自愿者',
  `level` tinyint(1) DEFAULT NULL COMMENT '级别  1:国家级2:省级3:市级 4:县级 5:乡镇级 5:其他',
  `secret_level` tinyint(1) DEFAULT NULL COMMENT '机密等级  1机密 2秘密 3限制  4公开  5其他',
  `area_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '行政区域编码',
  `postal_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮政编码',
  `fax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '传真',
  `longitude` decimal(30, 20) DEFAULT NULL COMMENT '经度',
  `latitude` decimal(30, 20) DEFAULT NULL COMMENT '纬度',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址',
  `duties` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '主要职责',
  `specialty` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '专长',
  `equipment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '装备描述',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `group_id` bigint(20) DEFAULT NULL COMMENT '主管单位 / 分组id',
  `unit_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '单位地址',
  `coordinate_type` tinyint(1) DEFAULT NULL COMMENT '坐标类型',
  `preparation_time` int(20) DEFAULT NULL COMMENT '应急准备时间(分钟)',
  `telephone_num` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '值班电话',
  `rescue_experience` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '应急救援经历',
  `communication_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '应急通讯方式',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除 0：未删除  1：已删除',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_user_id` bigint(20) DEFAULT NULL COMMENT '修改者Id',
  `gmt_modified` datetime(0) DEFAULT NULL COMMENT '修改时间',
  `platform_id` bigint(20) DEFAULT NULL COMMENT '平台id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic  comment '救援队伍';

-- ----------------------------
-- Records of resource_team
-- ----------------------------
INSERT INTO `resource_team` VALUES (1, '测试solr自动更新', 7, 1, '资质等级', '2019-08-26 16:12:13', 1, 1, 1, NULL, NULL, '123', NULL, NULL, NULL, '主要职责', '专长', '装备描述', '备注', 1, '单位地址', 1, 1, '值班电话', '应急救援经历', '应急通讯方式', 0, 1, '2019-08-26 16:13:19', NULL, '2020-04-17 15:50:41', 4);
INSERT INTO `resource_team` VALUES (2, '蛇丸队', 17, 28040, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, '', '', '', '', '', NULL, '', 0, NULL, '', '', '', 1, 23, '2019-08-28 09:59:21', NULL, NULL, 4);
INSERT INTO `resource_team` VALUES (3, '蛇丸队', 17, 2054054, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, '', '', '', '', '', NULL, '', 0, NULL, '', '', '', 1, 23, '2019-08-28 10:04:15', NULL, NULL, 4);
INSERT INTO `resource_team` VALUES (4, '大狗队', 17, 254325434, '飞洒', '2019-08-30 00:00:00', 1, 4, 4, '', '法撒法扇', '法撒法扇', 113.35447800000000000000, 23.11420400000000000000, '广东省广州市天河区员村街道南富大街105号', '发撒疯撒', '法撒法扇', '发撒疯撒', '发撒疯撒', NULL, '', 0, NULL, '', '', '', 1, 23, '2019-08-28 14:34:39', NULL, NULL, 4);
INSERT INTO `resource_team` VALUES (5, '竟翊队', 22, 5464645, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, '', '', '', '', '', NULL, '', 0, NULL, '', '', '', 1, 23, '2019-08-28 14:47:38', NULL, NULL, 4);
INSERT INTO `resource_team` VALUES (6, '竟翊队', 22, 456415631, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, '', '', '', '', '', NULL, '', 0, NULL, '', '', '', 1, 23, '2019-08-28 14:49:44', NULL, NULL, 4);
INSERT INTO `resource_team` VALUES (7, '中大队', 22, 25454, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, '', '', '', '', '', NULL, '', 0, NULL, '', '', '', 0, 23, '2019-08-28 15:02:24', 23, '2019-08-28 18:50:29', 4);
INSERT INTO `resource_team` VALUES (8, '伟星队', 22, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 23, '2019-08-28 15:21:08', NULL, NULL, 4);
INSERT INTO `resource_team` VALUES (9, '广园队', 22, 254245, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, '', '', '', '', '', 40, '', 0, NULL, '', '', '', 0, 23, '2019-08-28 16:21:08', 23, '2019-08-28 18:50:42', 4);
INSERT INTO `resource_team` VALUES (10, '天河队', 22, 5454, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, '', '', '', '', '', NULL, '', 0, NULL, '', '', '', 0, 23, '2019-08-28 16:45:45', 23, '2019-08-28 18:50:52', 4);
INSERT INTO `resource_team` VALUES (11, '铁蛋队', 25, 656545, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, '', '', '', '', '', NULL, '', 0, NULL, '', '', '', 0, 23, '2019-08-28 18:03:00', 23, '2019-08-28 18:51:03', 4);
INSERT INTO `resource_team` VALUES (12, '沙河应急小分队', 27, 12, '', '2019-01-01 00:00:00', NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123456789', 1, 14, '2019-08-28 20:08:06', NULL, NULL, 4);
INSERT INTO `resource_team` VALUES (13, '沙河应急小分队2', 27, 12, NULL, '2019-01-11 00:00:00', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 14, '2019-08-28 20:08:06', NULL, NULL, 4);
INSERT INTO `resource_team` VALUES (14, '沙河应急小分队', 29, 12, '', '2019-01-01 00:00:00', NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123456789', 1, 14, '2019-08-28 20:09:53', NULL, NULL, 4);
INSERT INTO `resource_team` VALUES (15, '沙河应急小分队2', 29, 12, NULL, '2019-01-11 00:00:00', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 14, '2019-08-28 20:09:53', NULL, NULL, 4);
INSERT INTO `resource_team` VALUES (16, '法法队', 30, 575454, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, '', '', '', '', '', NULL, '', 0, NULL, '', '', '', 0, 23, '2019-08-29 09:59:16', NULL, NULL, 4);
INSERT INTO `resource_team` VALUES (17, '发生队', 31, 254545, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, '', '', '', '', '', NULL, '', 0, NULL, '', '', '', 0, 23, '2019-08-29 10:03:13', NULL, NULL, 4);
INSERT INTO `resource_team` VALUES (18, '僧伽队', 32, 0, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, '', '', '', '', '', NULL, '', 0, 0, '', '', '', 0, 49, '2019-08-29 18:03:31', NULL, NULL, 27);
INSERT INTO `resource_team` VALUES (19, '飞洒', 32, 4564563, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, '', '', '', '', '', NULL, '', 0, 0, '', '', '', 0, 49, '2019-08-29 18:05:31', 49, '2019-08-29 18:38:17', 27);
INSERT INTO `resource_team` VALUES (20, '发撒疯撒', 32, 34873, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, '', '', '', '', '', NULL, '', 0, 0, '', '', '', 0, 49, '2019-08-29 19:57:44', NULL, NULL, 27);
INSERT INTO `resource_team` VALUES (21, '发生', 32, 52242, '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, '', '', '', '', '', NULL, '', 0, 0, '', '', '', 0, 49, '2019-08-29 20:02:47', NULL, NULL, 27);
INSERT INTO `resource_team` VALUES (22, '嘎嘎队', 32, 42123, '', NULL, NULL, NULL, NULL, '', '', '', 113.80635800000000000000, 23.30873600000000000000, '广东省广州市增城区荔城街道对田', '', '', '', '', NULL, '', 0, 0, '', '', '', 0, 49, '2019-08-29 20:06:27', 1, '2019-09-05 08:52:58', 27);
INSERT INTO `resource_team` VALUES (23, '飞洒队', 32, 455, '', NULL, NULL, NULL, NULL, '', '', '', 113.85219100000000000000, 23.26237300000000000000, '广东省广州市增城区增江街道经二路经2路3号之1', '', '', '', '', NULL, '', 0, 0, '', '', '', 0, 49, '2019-08-29 20:07:24', 1, '2019-09-05 08:53:17', 27);
INSERT INTO `resource_team` VALUES (24, '圣诞节才收到', 36, 234234, '', NULL, 1, 1, 1, '', '', '', 113.32012700000000000000, 23.09510500000000000000, '广东省广州市海珠区赤岗街道屈臣氏(广州丽影广场店)(装修中)', '', '', '', '', 5, '', 0, 0, '10086', '', '15016424670', 0, 1, '2019-09-04 12:01:32', NULL, NULL, 27);
INSERT INTO `resource_team` VALUES (25, '沙河应急小分队', 38, 12, '', '2019-01-01 00:00:00', NULL, 6, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123456789', 0, 14, '2019-09-10 13:46:58', NULL, NULL, 27);
INSERT INTO `resource_team` VALUES (26, '沙河应急小分队', 38, 12, '', '2019-01-01 00:00:00', NULL, 6, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123456789', 0, 14, '2019-09-10 13:48:34', NULL, NULL, 27);
INSERT INTO `resource_team` VALUES (27, '沙河应急小分队', 38, 12, '', '2019-01-01 00:00:00', NULL, 6, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123456789', 0, 14, '2019-09-10 13:49:34', NULL, NULL, 27);
INSERT INTO `resource_team` VALUES (28, '沙河应急小分队', 38, 12, '', '2019-01-01 00:00:00', NULL, 6, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123456789', 0, 14, '2019-09-10 13:53:26', NULL, NULL, 27);
INSERT INTO `resource_team` VALUES (29, '沙河应急小分队', 38, 12, '', '2019-01-01 00:00:00', NULL, 6, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123456789', 0, 14, '2019-09-10 13:56:03', NULL, NULL, 27);
INSERT INTO `resource_team` VALUES (30, '沙河应急小分队', 36, 12, '', '2019-01-01 00:00:00', NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123456789', 0, 14, '2019-09-10 13:56:03', NULL, NULL, 27);
INSERT INTO `resource_team` VALUES (31, '沙河应急小分队', 39, 12, '', '2019-01-01 00:00:00', NULL, 6, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123456789', 0, 14, '2019-09-10 13:56:03', NULL, NULL, 27);
INSERT INTO `resource_team` VALUES (32, '沙河应急小分队', 38, 12, '', '2019-01-01 00:00:00', NULL, 6, 1, NULL, NULL, NULL, 113.36180200000000000000, 23.05896600000000000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123456789', 0, 14, '2019-09-10 13:59:40', NULL, NULL, 27);
INSERT INTO `resource_team` VALUES (33, '沙河应急小分队', 36, 12, '', '2019-01-01 00:00:00', NULL, 6, 2, NULL, NULL, NULL, 113.36180200000000000000, 23.05896600000000000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123456789', 0, 14, '2019-09-10 13:59:40', NULL, NULL, 27);
INSERT INTO `resource_team` VALUES (34, '沙河应急小分队', 39, 12, '', '2019-01-01 00:00:00', NULL, 6, 3, NULL, NULL, NULL, 113.36180200000000000000, 23.05896600000000000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123456789', 0, 14, '2019-09-10 13:59:40', NULL, NULL, 27);
INSERT INTO `resource_team` VALUES (35, '沙河应急小分队', 40, 12, '', '2019-01-01 00:00:00', NULL, 6, 3, NULL, NULL, NULL, 113.36180200000000000000, 23.05896600000000000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123456789', 0, 14, '2019-09-10 13:59:40', NULL, NULL, 27);
INSERT INTO `resource_team` VALUES (36, '沙河应急小分队', 42, 12, '', '2019-01-01 00:00:00', NULL, 6, 1, NULL, NULL, NULL, 113.36180200000000000000, 23.05896600000000000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123456789', 0, 14, '2019-09-10 14:01:51', NULL, NULL, 27);
INSERT INTO `resource_team` VALUES (37, '沙河应急小分队', 43, 12, '', '2019-01-01 00:00:00', NULL, 6, 2, NULL, NULL, NULL, 113.36180200000000000000, 23.05896600000000000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123456789', 0, 14, '2019-09-10 14:01:51', NULL, NULL, 27);
INSERT INTO `resource_team` VALUES (38, '沙河应急小分队', 44, 12, '', '2019-01-01 00:00:00', NULL, 6, 3, NULL, NULL, NULL, 113.36180200000000000000, 23.05896600000000000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123456789', 0, 14, '2019-09-10 14:01:51', NULL, NULL, 27);
INSERT INTO `resource_team` VALUES (39, '沙河应急小分队', 45, 12, '', '2019-01-01 00:00:00', NULL, 6, 3, NULL, NULL, NULL, 113.36180200000000000000, 23.05896600000000000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123456789', 0, 14, '2019-09-10 14:01:51', NULL, NULL, 27);
INSERT INTO `resource_team` VALUES (40, '沙河应急小分队', 42, 12, '', '2019-01-01 00:00:00', NULL, 6, 1, NULL, NULL, NULL, 113.36180200000000000000, 23.05896600000000000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123456789', 0, 14, '2019-09-10 14:02:05', NULL, NULL, 27);
INSERT INTO `resource_team` VALUES (41, '沙河应急小分队', 43, 12, '', '2019-01-01 00:00:00', NULL, 6, 2, NULL, NULL, NULL, 113.36180200000000000000, 23.05896600000000000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123456789', 0, 14, '2019-09-10 14:02:05', NULL, NULL, 27);
INSERT INTO `resource_team` VALUES (42, '沙河应急小分队', 44, 12, '', '2019-01-01 00:00:00', NULL, 6, 3, NULL, NULL, NULL, 113.36180200000000000000, 23.05896600000000000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123456789', 0, 14, '2019-09-10 14:02:05', NULL, NULL, 27);
INSERT INTO `resource_team` VALUES (43, '沙河应急小分队', 45, 12, '', '2019-01-01 00:00:00', NULL, 6, 3, NULL, NULL, NULL, 113.36180200000000000000, 23.05896600000000000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123456789', 1, 14, '2019-09-10 14:02:05', NULL, NULL, 27);
INSERT INTO `resource_team` VALUES (44, '产品应急小分队', 46, 55, '1', '2019-10-09 00:00:00', 1, 1, 4, '', '51000', '123123', 113.36180200000000000000, 23.05896600000000000000, '123123', '123123', '123123', '123123', '123', 157, '213123', 0, 60, '12333', '12333', '微信', 1, 85, '2019-10-10 13:51:35', 1510, '2020-04-02 14:08:33', 27);
INSERT INTO `resource_team` VALUES (45, '危化品事故队伍', 49, 120, '', NULL, 1, 4, 5, '', '', '', 113.36180200000000000000, 23.05896600000000000000, '', '事故救援', '危化品事故救援', '', '', NULL, '', 0, 0, '13809281780', '', '', 1, 1520, '2019-11-21 16:02:48', NULL, NULL, 572);
INSERT INTO `resource_team` VALUES (46, '防汛抢险队伍', 50, 200, '', NULL, 1, 5, 5, NULL, NULL, NULL, 113.36180200000000000000, 23.05896600000000000000, NULL, NULL, '防汛抢险', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '13928913131', 1, 1520, '2019-11-21 16:27:57', NULL, NULL, 572);
INSERT INTO `resource_team` VALUES (47, '危化品事故队伍', 49, 120, '', NULL, 1, 5, 5, NULL, NULL, NULL, 113.36180200000000000000, 23.05896600000000000000, NULL, '事故救援', '危化品事故救援', NULL, NULL, 1778, NULL, 0, 0, '13809281780', NULL, '13928913131', 1, 1520, '2019-11-21 16:30:21', NULL, NULL, 572);
INSERT INTO `resource_team` VALUES (48, '防汛抢险队伍', 50, 200, '', NULL, 1, 4, 5, '', '', '', 113.36180200000000000000, 23.05896600000000000000, '', '抢险救援', '防汛抢险救援', '', '', 1779, '', 0, 0, '13928913131', '', '', 1, 1520, '2019-11-21 16:31:42', 1520, '2019-11-21 16:46:44', 572);
INSERT INTO `resource_team` VALUES (49, '医疗救援队伍', 52, 35, '', NULL, 1, 4, 5, '', '', '', 113.36180200000000000000, 23.05896600000000000000, '', '公共安全', '医疗救援', '', '', 1780, '', 0, 0, '13802803978', '', '', 1, 1520, '2019-11-21 16:32:44', 1520, '2019-11-21 16:47:20', 572);
INSERT INTO `resource_team` VALUES (50, '维稳应急队伍', 51, 50, '', NULL, 1, 4, 5, '', '', '', 113.36180200000000000000, 23.05896600000000000000, '', '维稳应急救援', '维稳应急救援', '', '', 1781, '', 0, 0, '1392886018', '', '', 1, 1520, '2019-11-21 16:34:03', 1520, '2019-11-21 16:47:06', 572);
INSERT INTO `resource_team` VALUES (51, '水上救援队伍', 49, 30, '', NULL, 1, 4, 5, '', '', '', 113.36180200000000000000, 23.05896600000000000000, '', '事故灾难救援', '水上救援', '', '', NULL, '', 0, 0, '13802803610', '', '', 1, 1520, '2019-11-21 16:35:22', 1520, '2019-11-21 16:45:43', 572);
INSERT INTO `resource_team` VALUES (52, '供水抢修队伍', 49, 50, '', NULL, 1, 4, 5, '', '', '', 113.36180200000000000000, 23.05896600000000000000, '', '事故灾难', '供水抢修', '', '', 1783, '', 0, 0, '13302263688', '', '', 1, 1520, '2019-11-21 16:36:49', 1520, '2019-11-21 16:45:54', 572);
INSERT INTO `resource_team` VALUES (53, '电力抢修队伍', 49, 50, '', NULL, 1, 4, 5, '', '', '', 113.36180200000000000000, 23.05896600000000000000, '', '事故灾难救援', '电力抢修', '', '', 1784, '', 0, 0, '13902338103', '', '', 1, 1520, '2019-11-21 16:38:10', 1520, '2019-11-21 16:46:06', 572);
INSERT INTO `resource_team` VALUES (54, '通信抢修队伍', 49, 60, '', NULL, 1, 4, 5, '', '', '', NULL, NULL, '', '通信抢修', '通信抢修', '', '', 1785, '', 0, 0, '13392661388', '', '', 1, 1520, '2019-11-21 16:39:18', 1520, '2019-11-21 16:46:21', 572);
INSERT INTO `resource_team` VALUES (55, 'C队伍', 50, 230, '', NULL, 1, 4, 5, '', '', '', NULL, NULL, '', '森林火灾救援', '森林火灾救援', '', '', 1786, '', 0, 0, '13609092219', '', '', 1, 1520, '2019-11-21 16:40:34', 1520, '2019-11-21 16:46:53', 572);
INSERT INTO `resource_team` VALUES (56, '动物疫病队伍', 52, 80, '', NULL, 1, 4, 5, '', '', '', NULL, NULL, '', '动物疫病处理', '动物疫病处理', '', '', 1787, '', 0, 0, '13602224489', '', '', 1, 1520, '2019-11-21 16:41:47', 1520, '2019-11-21 16:47:29', 572);
INSERT INTO `resource_team` VALUES (57, '路桥抢修队伍', 49, 85, '', NULL, 1, 4, 5, '', '', '', NULL, NULL, '', '路桥抢修', '路桥抢修', '', '', 1789, '', 0, 0, '13902331668', '', '', 1, 1520, '2019-11-21 16:42:55', 1520, '2019-11-21 16:46:30', 572);
INSERT INTO `resource_team` VALUES (58, '后勤保障队伍', 51, 50, '', NULL, 1, 4, 5, '', '', '', NULL, NULL, '', '后勤保障', '后勤保障', '', '', 1790, '', 0, 0, '13430393964', '', '', 1, 1520, '2019-11-21 16:43:53', NULL, NULL, 572);
INSERT INTO `resource_team` VALUES (59, '交通保障队伍', 51, 50, '', NULL, 1, 4, 5, '', '', '', NULL, NULL, '', '后勤保障', '后勤保障', '', '', 1791, '', 0, 0, '13902339688', '', '', 1, 1520, '2019-11-21 16:44:43', NULL, NULL, 572);
INSERT INTO `resource_team` VALUES (60, '蓝天救援队伍', 50, 5, '', '2020-02-26 00:00:00', NULL, NULL, NULL, '', '', '123', NULL, NULL, '', '', '', '', '', 2528, '', 0, 0, '', '', '', 1, 2038, '2020-03-26 15:48:36', 2038, '2020-03-26 15:49:31', 1382);