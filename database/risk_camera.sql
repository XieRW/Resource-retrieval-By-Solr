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

 Date: 20/04/2020 10:44:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for risk_camera
-- ----------------------------
DROP TABLE IF EXISTS `risk_camera`;
CREATE TABLE `risk_camera`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `longitude` decimal(30, 10) DEFAULT NULL COMMENT '经度',
  `latitude` decimal(30, 10) DEFAULT NULL COMMENT '纬度',
  `index_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '虚假的index_code,用来mq比对数据',
  `crossing_id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '卡口编码',
  `business_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '业务编码',
  `hardware_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '硬件编码',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态：0不可用  1可用',
  `concern` tinyint(3) DEFAULT 0 COMMENT '关注程度，默认为0，上限999',
  `platform_id` bigint(20) NOT NULL COMMENT '平台id',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `modify_user_id` bigint(20) DEFAULT NULL COMMENT '修改者id',
  `modify_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  `camera_type` tinyint(1) DEFAULT NULL COMMENT '相机摄像的类型 0人  1车,3调阅摄像头',
  `device_index_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '设备编号',
  `video_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '真实的index_code,用来视频预览',
  `group_id` bigint(20) DEFAULT NULL COMMENT '相机分组id',
  `camera_platform` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '相机所属平台(华为,大华,海康)缩写',
  `stream_url` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '相机ip',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `risk_camera_idx_crossing_id`(`crossing_id`) USING BTREE,
  INDEX `risk_camera_idx_index_code`(`index_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20298 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '抓拍相机的列表' ROW_FORMAT = Dynamic  comment '预警相机';

-- ----------------------------
-- Records of risk_camera
-- ----------------------------
INSERT INTO `risk_camera` VALUES (130, '摄像头1', NULL, 113.8287192106, 23.2967545271, '44011855011328130072', NULL, NULL, NULL, 1, 0, 27, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `risk_camera` VALUES (131, '摄像头2', NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, 0, 27, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `risk_camera` VALUES (132, '摄像头3', NULL, NULL, NULL, NULL, '2', NULL, NULL, 1, 0, 27, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `risk_camera` VALUES (133, '摄像头4', NULL, NULL, NULL, NULL, '241', NULL, NULL, 1, 0, 27, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `risk_camera` VALUES (134, '摄像头5', NULL, NULL, NULL, NULL, '2746', NULL, NULL, 1, 0, 27, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `risk_camera` VALUES (135, '摄像头6', NULL, 113.8193570000, 23.2720220000, NULL, '2787', NULL, NULL, 1, 0, 1382, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `risk_camera` VALUES (136, '摄像头7', NULL, NULL, NULL, NULL, '2794', NULL, NULL, 1, 0, 27, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);


SET FOREIGN_KEY_CHECKS = 1;
