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

 Date: 20/04/2020 10:35:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for resource_area
-- ----------------------------
DROP TABLE IF EXISTS `resource_area`;
CREATE TABLE `resource_area`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '场所id',
  `area_type_id` bigint(20) DEFAULT NULL COMMENT '物资类型id',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '场所地址',
  `longitude` decimal(30, 20) DEFAULT NULL COMMENT '经度',
  `latitude` decimal(30, 20) DEFAULT NULL COMMENT '纬度',
  `feature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '功能',
  `acreage` double(30, 5) DEFAULT NULL COMMENT '面积',
  `people_num` bigint(20) DEFAULT NULL COMMENT '人数',
  `level` bigint(10) DEFAULT NULL COMMENT '抗震设防程度',
  `use_time` datetime(0) DEFAULT NULL COMMENT '使用时间',
  `use_year` int(255) DEFAULT NULL COMMENT '设计使用年限',
  `competent_unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '主管单位',
  `emergency_flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '应急标识',
  `water_details` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '排水详情',
  `electricity_details` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '电详情',
  `wind_details` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '风状况',
  `emergency_equipment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '应急器材',
  `store_materials` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '储备物资',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `linkman_id` int(11) DEFAULT NULL COMMENT '联系人id',
  `is_deleted` int(2) DEFAULT NULL COMMENT '0 未删除 1 删除',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '场所名称',
  `platform_id` int(11) DEFAULT NULL COMMENT '平台id',
  `gmt_create` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `create_user_id` int(11) DEFAULT NULL COMMENT '创建用户id',
  `gmt_modified` datetime(0) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic comment '庇护场所';

-- ----------------------------
-- Records of resource_area
-- ----------------------------
INSERT INTO `resource_area` VALUES (1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '测试', 27, NULL, NULL, NULL);
INSERT INTO `resource_area` VALUES (2, 3, NULL, NULL, NULL, NULL, NULL, 10000, NULL, NULL, 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'test测试', 27, '2019-12-24 13:41:14', 2005, NULL);
INSERT INTO `resource_area` VALUES (4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '测试', 27, '2019-12-25 10:39:17', 2005, NULL);
INSERT INTO `resource_area` VALUES (5, NULL, '广东省广州市荔湾区多宝街道北海道蒋光鼐纪念小学', 113.23918900000000000000, 23.11689400000000000000, '', 0.00000, 0, 0, NULL, 0, '', '', '', '', '', '', '', '', NULL, 0, '等会撒打开撒', 27, '2019-12-27 16:50:40', 1510, NULL);
INSERT INTO `resource_area` VALUES (6, 10, '广东省广州市越秀区矿泉街道走马岗中心巷小区', 113.25669800000000000000, 23.15477900000000000000, '', 0.00000, 0, 0, NULL, 0, '', '', '', '', '', '', '', '', NULL, 0, '等会撒打算尽快', 27, '2019-12-27 17:05:21', 1510, NULL);
INSERT INTO `resource_area` VALUES (7, 10, '广东省广州市越秀区登峰街道广州麓湖高尔夫球乡村俱乐部麓湖', 113.27558100000000000000, 23.15193800000000000000, '', 0.00000, 0, 0, NULL, 0, '', '', '', '', '', '', '', '', NULL, 0, '等会撒打算尽快', 27, '2019-12-27 17:41:44', 1510, NULL);
INSERT INTO `resource_area` VALUES (8, 10, '广东省广州市天河区员村街道S4华南快速', 113.35317200000000000000, 23.11373600000000000000, '', 0.00000, 0, 0, NULL, 0, '', '', '', '', '', '', '', '', NULL, 0, '等会撒打算尽快', 27, '2019-12-27 17:42:34', 1510, NULL);
INSERT INTO `resource_area` VALUES (9, 10, '广东省广州市海珠区琶洲街道琶洲自选商场保利·天悦', 113.37892100000000000000, 23.09921000000000000000, '', 0.00000, 0, 0, NULL, 0, '', '', '', '', '', '', '', '', NULL, 0, '等会撒打算尽快', 27, '2019-12-27 17:59:12', 1510, NULL);
INSERT INTO `resource_area` VALUES (11, 10, '广东省广州市海珠区琶洲街道琶洲自选商场保利·天悦', 113.37892100000000000000, 23.09921000000000000000, '', 0.00000, 0, 0, NULL, 0, '', '', '', '', '', '', '', '', NULL, 0, '测试solr自动更新', 27, '2019-12-27 17:59:12', 1510, '2020-04-18 15:33:59');
INSERT INTO `resource_area` VALUES (12, 1, '广东省广州市海珠区凤阳街道中大纺织产业商会大厦C栋珠江国际纺织城', 113.30168000000000000000, 23.08383000000000000000, 'cs', 2.00000, 2, 2, '2020-04-17 00:00:00', 2, '测试', '1', '测试', '测试', '测试', '测试', '测试', '测试', NULL, 0, 'cs5', 27, '2020-04-17 17:10:16', 1510, '2020-04-17 17:10:16');

SET FOREIGN_KEY_CHECKS = 1;
