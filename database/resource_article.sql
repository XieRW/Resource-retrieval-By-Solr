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

 Date: 20/04/2020 10:35:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for resource_article
-- ----------------------------
DROP TABLE IF EXISTS `resource_article`;
CREATE TABLE `resource_article`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '物资id',
  `article_type_id` bigint(20) DEFAULT NULL COMMENT '物资类型id',
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '物资型号',
  `article_storehouse_id` bigint(20) DEFAULT NULL COMMENT '物资所属库id',
  `amount` int(255) DEFAULT NULL COMMENT '数量',
  `measure_unit` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '计量单位',
  `factory` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生产厂家',
  `expire_time` datetime(0) DEFAULT NULL COMMENT '保质期',
  `replace_time` datetime(0) DEFAULT NULL COMMENT '需要更换的时间',
  `now_status` tinyint(1) DEFAULT NULL COMMENT '现状态 :   0:可正常使用 1:不可正常使用',
  `maintain_status` tinyint(1) DEFAULT NULL COMMENT '维修保养状态 :   0:好  1:良好   2:差',
  `level` tinyint(1) DEFAULT NULL COMMENT '级别:  0: 国家级  1:省级  2: 市级  3: 县级 4:乡镇级 5:其他',
  `secret` tinyint(1) DEFAULT NULL COMMENT '保密级别: 0:机密 1:秘密 2:限制 3:公开 4:其他',
  `transfer_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '调用方式',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除 0：未删除  1：已删除',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_user_id` bigint(20) DEFAULT NULL COMMENT '修改者Id',
  `gmt_modified` datetime(0) DEFAULT NULL COMMENT '修改时间',
  `platform_id` bigint(20) DEFAULT NULL COMMENT '终端用户id',
  `consumables` tinyint(1) DEFAULT NULL COMMENT '是否易耗品  0:否   1:是',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '物资名称',
  `pic_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图片路径',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 120 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic  comment '救援物资';

-- ----------------------------
-- Records of resource_article
-- ----------------------------
INSERT INTO `resource_article` VALUES (1, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2019-08-20 19:18:19', NULL, '2020-04-17 15:40:08', 1, NULL, '测试solr自动更新', NULL);
INSERT INTO `resource_article` VALUES (2, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2019-08-20 19:18:19', NULL, NULL, 1, NULL, 'test2', NULL);
INSERT INTO `resource_article` VALUES (3, 180, '件', 24, 30, '件', '物资生产厂家', '2026-01-01 00:00:00', '2025-01-01 00:00:00', 0, NULL, 5, 4, '仓库领取', '注意巡查及保养', 0, 14, '2019-08-23 09:00:22', NULL, NULL, 4, 0, '救生衣', NULL);
INSERT INTO `resource_article` VALUES (4, 180, '件', 24, 30, '件', '物资生产厂家', '2026-01-01 00:00:00', '2025-01-01 00:00:00', 0, NULL, 5, 4, '仓库领取', '注意巡查及保养', 0, 14, '2019-08-23 09:04:09', NULL, NULL, 4, 0, '救生衣2', NULL);
INSERT INTO `resource_article` VALUES (5, 180, '件', 24, 30, '件', '物资生产厂家', '2026-01-01 00:00:00', '2025-01-01 00:00:00', 0, NULL, 5, 4, '仓库领取', '注意巡查及保养', 0, 14, '2019-08-23 09:08:33', NULL, NULL, 4, 0, '救生衣3', NULL);
INSERT INTO `resource_article` VALUES (6, 181, '件', 25, 30, '件', '物资生产厂家', '2026-01-01 00:00:00', '2025-01-01 00:00:00', 0, NULL, 5, 4, '仓库领取', '注意巡查及保养', 1, 14, '2019-08-23 09:10:24', NULL, NULL, 4, 0, '救生衣4', NULL);
INSERT INTO `resource_article` VALUES (7, 182, '件', 25, 30, '件', '物资生产厂家', '2026-01-01 00:00:00', '2025-01-01 00:00:00', 0, NULL, NULL, NULL, '仓库领取', '注意巡查及保养', 1, 14, '2019-08-23 09:10:24', NULL, NULL, 4, 0, '救生衣5', NULL);
INSERT INTO `resource_article` VALUES (8, 181, '件', 25, 0, '件', '物资生产厂家', '2026-01-01 00:00:00', '2025-01-01 00:00:00', 0, NULL, 5, 4, '仓库领取', '注意巡查及保养', 1, 14, '2019-08-23 09:18:04', NULL, NULL, 4, 0, '救生衣4', NULL);
INSERT INTO `resource_article` VALUES (9, 182, '件', 25, 0, '件', '物资生产厂家', '2026-01-01 00:00:00', '2025-01-01 00:00:00', 0, NULL, 5, 4, '仓库领取', '注意巡查及保养', 1, 14, '2019-08-23 09:18:04', NULL, NULL, 4, 0, '救生衣5', NULL);
INSERT INTO `resource_article` VALUES (10, 181, '件', 25, 0, '件', '物资生产厂家', '2026-01-01 00:00:00', '2025-01-01 00:00:00', 0, NULL, 5, 4, '仓库领取', '注意巡查及保养', 1, 14, '2019-08-23 09:25:17', NULL, NULL, 4, 0, '救生衣4', NULL);
INSERT INTO `resource_article` VALUES (11, 180, '件', 25, 0, '件', '物资生产厂家', '2026-01-01 00:00:00', '2025-01-01 00:00:00', 0, NULL, 5, 4, '仓库领取', '注意巡查及保养', 1, 14, '2019-08-23 09:34:04', NULL, NULL, 4, 0, '救生衣4', NULL);
INSERT INTO `resource_article` VALUES (12, 180, '件', 24, 30, '件', '物资生产厂家', '2026-01-01 00:00:00', '2025-01-01 00:00:00', 0, NULL, 0, NULL, '仓库领取', '注意巡查及保养', 0, 14, '2019-08-23 09:38:19', NULL, NULL, 4, 0, '救生衣', NULL);
INSERT INTO `resource_article` VALUES (13, 180, '001', 27, 1000, '个', '那霸仓库', '2019-08-30 00:00:00', '2019-08-29 00:00:00', 0, 0, 0, 0, '0', '0', 0, 23, '2019-08-24 15:20:15', NULL, NULL, 4, 0, '雨伞', NULL);
INSERT INTO `resource_article` VALUES (14, 182, '001', 27, 2000, '件', '广园仓库', '2019-08-30 00:00:00', '2019-08-30 00:00:00', 0, 0, 0, 0, '调用', '好吃', 0, 23, '2019-08-26 16:25:10', 14, '2019-08-29 09:20:38', 4, 0, '方便面', NULL);
INSERT INTO `resource_article` VALUES (15, 180, '件', 24, 30, '件', '物资生产厂家', '2026-01-01 00:00:00', '2025-01-01 00:00:00', 0, NULL, 0, 0, '仓库领取', '注意巡查及保养', 0, 23, '2019-08-26 20:12:43', NULL, NULL, 4, 0, '救生衣', NULL);
INSERT INTO `resource_article` VALUES (16, 191, '001', 30, 1000, '件', '广园仓库', '2019-08-30 00:00:00', '2019-08-30 00:00:00', 0, 0, 4, 0, '调用', '好吃', 1, 43, '2019-08-27 20:33:06', NULL, NULL, 27, 0, '救生圈', NULL);
INSERT INTO `resource_article` VALUES (17, 191, '001', 31, 1000, '年', '天幻厂家', '2019-08-30 00:00:00', '2019-08-30 00:00:00', 0, 0, 3, 3, '调用', '发发', 1, 43, '2019-08-27 20:34:05', NULL, NULL, 27, 1, '烧烤', NULL);
INSERT INTO `resource_article` VALUES (18, 181, '010', 27, 404054, '个', '发生厂家', '2019-08-30 00:00:00', '2019-08-30 00:00:00', 0, 1, 5, 0, '好吃', '发放撒', 0, 23, '2019-08-29 09:20:27', NULL, NULL, 4, 0, '三角裤', NULL);
INSERT INTO `resource_article` VALUES (19, 193, 'a', 34, 10, 'aa', 'aa', '2019-08-28 00:00:00', '2019-08-29 00:00:00', 0, 0, 0, 0, 'asd', 'asd', 1, 14, '2019-08-29 15:15:41', NULL, NULL, 27, 0, 'aaa', NULL);
INSERT INTO `resource_article` VALUES (20, 193, 'ads', 35, 10, 'sad', 'ads', '2019-08-29 00:00:00', '2019-08-30 00:00:00', 0, 0, 0, 0, 'dsa', 'dsaf', 1, 14, '2019-08-29 15:18:32', NULL, NULL, 27, 0, 'ads', NULL);
INSERT INTO `resource_article` VALUES (21, 194, '011', 36, 4524123, '件', '飞洒厂家', '2019-08-30 00:00:00', '2019-08-30 00:00:00', 1, 0, 0, 0, '', '', 1, 49, '2019-08-29 15:45:45', NULL, NULL, 27, 0, '牛仔裤', NULL);
INSERT INTO `resource_article` VALUES (22, 194, '100', 37, 4554054, '件', '飞洒厂家', '2019-08-30 00:00:00', '2019-08-30 00:00:00', 0, 0, 3, 0, '法撒法扇', '给多少给多少', 1, 49, '2019-08-29 17:20:51', 49, '2019-08-29 17:29:09', 27, 1, '牛仔裙', NULL);
INSERT INTO `resource_article` VALUES (23, 194, '120', 37, 15321, '飞洒房', '发撒疯撒', '2019-08-30 00:00:00', '2019-08-30 00:00:00', 1, 0, 2, 3, '飞洒发', '好处', 1, 49, '2019-08-29 20:08:17', NULL, NULL, 27, 1, '安全裤', NULL);
INSERT INTO `resource_article` VALUES (24, 194, '001', 37, 1200, '件', '吃撒厂家', '2019-09-02 00:00:00', '2019-09-02 00:00:00', 0, 1, 1, 0, '发', '撒搭', 1, 1, '2019-09-03 18:32:42', NULL, NULL, 27, 0, '毛衣', NULL);
INSERT INTO `resource_article` VALUES (25, 194, '054', 37, 4564563, '件', '飞洒厂家', '2019-09-02 00:00:00', '2019-09-02 00:00:00', 0, 0, 0, 0, '飞洒', '飞洒', 1, 1, '2019-09-03 18:36:45', NULL, NULL, 27, 0, '雨伞', NULL);
INSERT INTO `resource_article` VALUES (26, 194, '4545', 37, 45, '5453', '345', '2019-09-03 00:00:00', '2019-09-23 00:00:00', 0, 0, 1, 2, '', '', 1, 1, '2019-09-04 12:03:25', NULL, NULL, 27, 1, '士大夫身份', NULL);
INSERT INTO `resource_article` VALUES (27, 196, '件', 38, 30, '件', '物资生产厂家', '2026-01-01 00:00:00', '2025-01-01 00:00:00', 0, NULL, 0, 0, '仓库领取', '注意巡查及保养', 1, 14, '2019-09-10 14:24:30', NULL, NULL, 27, 0, '救生衣', NULL);
INSERT INTO `resource_article` VALUES (28, 198, '件', 39, 30, '件', '物资生产厂家', '2026-01-01 00:00:00', '2025-01-01 00:00:00', 0, NULL, 0, 0, '仓库领取', '注意巡查及保养', 1, 14, '2019-09-10 14:24:30', NULL, NULL, 27, 0, '灭火器', NULL);
INSERT INTO `resource_article` VALUES (29, 201, '件', 39, 30, '件', '物资生产厂家', '2026-01-01 00:00:00', '2025-01-01 00:00:00', 0, NULL, 0, 0, '仓库领取', '注意巡查及保养', 1, 14, '2019-09-10 14:24:30', NULL, NULL, 27, 0, '救生衣', NULL);
INSERT INTO `resource_article` VALUES (30, 203, '件', 39, 30, '件', '物资生产厂家', '2026-01-01 00:00:00', '2025-01-01 00:00:00', 0, NULL, 0, 0, '仓库领取', '注意巡查及保养', 1, 14, '2019-09-10 14:24:30', NULL, NULL, 27, 0, '吃的', NULL);
INSERT INTO `resource_article` VALUES (31, 206, '件', 39, 30, '件', '物资生产厂家', '2026-01-01 00:00:00', '2025-01-01 00:00:00', 0, NULL, 0, 0, '仓库领取', '注意巡查及保养', 1, 14, '2019-09-10 14:24:30', NULL, NULL, 27, 0, '用的', NULL);
INSERT INTO `resource_article` VALUES (32, 208, '件', 40, 30, '件', '物资生产厂家', '2026-01-01 00:00:00', '2025-01-01 00:00:00', 0, NULL, 0, 0, '仓库领取', '注意巡查及保养', 1, 14, '2019-09-10 14:28:30', NULL, NULL, 27, 0, '救生衣', NULL);
INSERT INTO `resource_article` VALUES (33, 196, '件', 41, 30, '件', '物资生产厂家', '2026-01-01 00:00:00', '2025-01-01 00:00:00', 0, NULL, 0, 0, '仓库领取', '注意巡查及保养', 1, 14, '2019-09-10 14:28:30', NULL, NULL, 27, 0, '灭火器', NULL);
INSERT INTO `resource_article` VALUES (34, 201, '件', 41, 30, '件', '物资生产厂家', '2026-01-01 00:00:00', '2025-01-01 00:00:00', 0, NULL, 0, 0, '仓库领取', '注意巡查及保养', 1, 14, '2019-09-10 14:28:30', NULL, NULL, 27, 0, '救生衣', NULL);
INSERT INTO `resource_article` VALUES (35, 196, '件', 41, 30, '件', '物资生产厂家', '2026-01-01 00:00:00', '2025-01-01 00:00:00', 0, NULL, 0, 0, '仓库领取', '注意巡查及保养', 1, 14, '2019-09-10 14:28:30', NULL, NULL, 27, 0, '吃的', NULL);
INSERT INTO `resource_article` VALUES (36, 206, '件', 41, 30, '件', '物资生产厂家', '2026-01-01 00:00:00', '2025-01-01 00:00:00', 0, NULL, 0, 0, '仓库领取', '注意巡查及保养', 1, 14, '2019-09-10 14:28:30', NULL, NULL, 27, 0, '用的', NULL);
INSERT INTO `resource_article` VALUES (37, 210, '件', 42, 30, '件', '物资生产厂家', '2026-01-01 00:00:00', '2025-01-01 00:00:00', 0, NULL, 0, 0, '仓库领取', '注意巡查及保养', 1, 14, '2019-09-10 14:36:23', NULL, NULL, 27, 0, '救生衣', NULL);
INSERT INTO `resource_article` VALUES (38, 210, '件', 43, 30, '件', '物资生产厂家', '2026-01-01 00:00:00', '2025-01-01 00:00:00', 0, NULL, 0, 0, '仓库领取', '注意巡查及保养', 1, 14, '2019-09-10 14:36:23', NULL, NULL, 27, 0, '灭火器', NULL);
INSERT INTO `resource_article` VALUES (39, 211, '件', 43, 30, '件', '物资生产厂家', '2026-01-01 00:00:00', '2025-01-01 00:00:00', 0, NULL, 0, 0, '仓库领取', '注意巡查及保养', 1, 14, '2019-09-10 14:36:23', NULL, NULL, 27, 0, '救生衣', NULL);
INSERT INTO `resource_article` VALUES (40, 210, '件', 43, 30, '件', '物资生产厂家', '2026-01-01 00:00:00', '2025-01-01 00:00:00', 0, NULL, 0, 0, '仓库领取', '注意巡查及保养', 1, 14, '2019-09-10 14:36:23', NULL, NULL, 27, 0, '吃的', NULL);
INSERT INTO `resource_article` VALUES (41, 212, '件', 43, 30, '件', '物资生产厂家', '2026-01-01 00:00:00', '2025-01-01 00:00:00', 0, NULL, 0, 0, '仓库领取', '注意巡查及保养', 1, 14, '2019-09-10 14:36:23', NULL, NULL, 27, 0, '用的', NULL);
INSERT INTO `resource_article` VALUES (42, 209, '/', 44, 100, '双', '广州地铁', '2022-03-30 00:00:00', '2019-12-30 00:00:00', 0, 1, 4, 3, '', '', 1, 85, '2019-09-25 11:21:43', NULL, NULL, 27, 1, '手套', NULL);
INSERT INTO `resource_article` VALUES (43, 209, '/', 45, 1000, '双', '广州地铁', '2021-09-29 00:00:00', '2020-09-29 00:00:00', 0, 1, 4, 3, '', '', 1, 85, '2019-09-25 11:32:44', NULL, NULL, 27, 1, '手套', NULL);
INSERT INTO `resource_article` VALUES (44, 213, '/', 46, 10000, '个', '无', '2022-09-29 00:00:00', '2021-09-27 00:00:00', 0, 1, 2, 0, '', '', 1, 85, '2019-09-25 11:40:42', NULL, NULL, 27, 0, '杯子', NULL);
INSERT INTO `resource_article` VALUES (45, 216, '/', 45, 100, '个', '/', '2021-09-29 00:00:00', '2020-09-29 00:00:00', 0, 1, 4, 4, '', '', 1, 96, '2019-09-26 16:30:51', NULL, NULL, 27, 1, 'test1', NULL);
INSERT INTO `resource_article` VALUES (46, 217, '123', 47, 999, '顶', '广州帐篷厂', '2015-10-09 00:00:00', '2012-07-11 00:00:00', 0, 0, 1, 0, '领导批示', '无', 1, 85, '2019-10-10 13:49:21', NULL, NULL, 27, 1, '应急帐篷', NULL);
INSERT INTO `resource_article` VALUES (47, 210, '件', 48, 30, '件', '物资生产厂家', '2026-01-01 00:00:00', '2025-01-01 00:00:00', 0, NULL, 0, 0, '仓库领取', '注意巡查及保养', 1, 999, '2019-10-18 17:56:30', NULL, NULL, 27, 0, '救生衣', NULL);
INSERT INTO `resource_article` VALUES (48, 210, '件', 48, 30, '件', '物资生产厂家', '2026-01-01 00:00:00', '2025-01-01 00:00:00', 0, NULL, 0, 0, '仓库领取', '注意巡查及保养', 1, 999, '2019-10-18 17:56:30', NULL, NULL, 27, 0, '救生衣2', NULL);
INSERT INTO `resource_article` VALUES (49, 210, '件', 48, 30, '件', '物资生产厂家', '2026-01-01 00:00:00', '2025-01-01 00:00:00', 0, NULL, 0, 0, '仓库领取', '注意巡查及保养', 1, 999, '2019-10-18 17:56:30', NULL, NULL, 27, 0, '救生衣3', NULL);
INSERT INTO `resource_article` VALUES (50, 219, '立白', 53, 100, '瓶', '广州立白有限公司', '2021-11-09 00:00:00', '2021-11-08 00:00:00', 0, 1, 4, 3, '电话联系', '/', 1, 1513, '2019-10-25 16:51:03', 1513, '2019-10-25 16:58:34', 572, 1, '立白洗衣液', NULL);
INSERT INTO `resource_article` VALUES (51, 219, '/', 53, 2000, '个', '/', '2022-10-06 00:00:00', '2021-10-21 00:00:00', 0, 1, 4, 3, '电话联系', '', 1, 1513, '2019-10-25 17:00:16', NULL, NULL, 572, 1, '水桶', NULL);
INSERT INTO `resource_article` VALUES (52, 218, '/', 51, 200, '把', '/', '2021-12-01 00:00:00', '2021-11-30 00:00:00', 0, 0, 4, 3, '电话联系', '', 1, 1513, '2019-10-25 18:14:37', NULL, NULL, 572, 1, '铁锹', NULL);
INSERT INTO `resource_article` VALUES (53, 218, '/', 51, 200, '把', '/', '2021-12-01 00:00:00', '2021-11-30 00:00:00', 0, 0, 4, 3, '电话联系', '', 1, 1513, '2019-10-25 18:19:47', NULL, NULL, 572, 1, '扫把', NULL);
INSERT INTO `resource_article` VALUES (54, 218, '/', 51, 68, '个', '/', '2021-12-01 00:00:00', '2021-11-30 00:00:00', 0, 0, 4, 3, '电话联系', '', 1, 1513, '2019-10-25 18:20:35', NULL, NULL, 572, 1, '防雨棚', NULL);
INSERT INTO `resource_article` VALUES (55, 218, '/', 51, 94, '个', '/', '2021-12-01 00:00:00', '2021-11-30 00:00:00', 0, 0, 4, 3, '电话联系', '', 1, 1513, '2019-10-25 18:24:11', NULL, NULL, 572, 1, '水泵', NULL);
INSERT INTO `resource_article` VALUES (56, 218, '/', 51, 198, '个', '/', '2021-12-01 00:00:00', '2021-11-30 00:00:00', 0, 0, 4, 3, '电话联系', '', 1, 1513, '2019-10-25 18:25:06', NULL, NULL, 572, 1, '安全帽', NULL);
INSERT INTO `resource_article` VALUES (57, 220, '/', 52, 620, '片', '/', '2021-12-01 00:00:00', '2021-11-30 00:00:00', 0, 0, 4, 3, '电话联系', '应急药品', 1, 1513, '2019-10-25 18:26:37', 1513, '2019-10-28 08:49:03', 572, 1, '止痛药', NULL);
INSERT INTO `resource_article` VALUES (58, 220, '/', 51, 627, '盒', '/', '2021-12-01 00:00:00', '2021-11-30 00:00:00', 0, 0, 4, 3, '电话联系', '', 1, 1513, '2019-10-25 18:28:54', NULL, NULL, 572, 1, '感冒药', NULL);
INSERT INTO `resource_article` VALUES (59, 220, '/', 52, 607, '盒', '/', '2021-12-01 00:00:00', '2021-11-30 00:00:00', 0, 0, 4, 3, '电话联系', '应急用品', 1, 1513, '2019-10-25 18:29:13', 1513, '2019-10-28 08:49:48', 572, 1, '碘酒', NULL);
INSERT INTO `resource_article` VALUES (60, 220, '/', 51, 1607, '盒', '/', '2021-12-01 00:00:00', '2021-11-30 00:00:00', 0, 0, 4, 3, '电话联系', '', 1, 1513, '2019-10-25 18:29:39', NULL, NULL, 572, 1, '棉球', NULL);
INSERT INTO `resource_article` VALUES (61, 219, '/', 51, 1007, '块', '/', '2021-12-01 00:00:00', '2021-11-30 00:00:00', 0, 0, 4, 3, '电话联系', '', 1, 1513, '2019-10-25 18:31:23', NULL, NULL, 572, 1, '抹布', NULL);
INSERT INTO `resource_article` VALUES (62, 219, '/', 51, 937, '块', '/', '2021-12-01 00:00:00', '2021-11-30 00:00:00', 0, 0, 4, 3, '电话联系', '', 1, 1513, '2019-10-25 18:31:40', NULL, NULL, 572, 1, '扫把', NULL);
INSERT INTO `resource_article` VALUES (63, 219, '/', 51, 627, '块', '/', '2021-12-01 00:00:00', '2021-11-30 00:00:00', 0, 0, 4, 3, '电话联系', '', 1, 1513, '2019-10-25 18:32:10', NULL, NULL, 572, 1, '洗衣粉', NULL);
INSERT INTO `resource_article` VALUES (64, 219, '/', 51, 607, '块', '/', '2021-12-01 00:00:00', '2021-11-30 00:00:00', 0, 0, 4, 3, '电话联系', '', 1, 1513, '2019-10-25 18:33:30', NULL, NULL, 572, 1, '水杯', NULL);
INSERT INTO `resource_article` VALUES (65, 219, '/', 51, 609, '块', '/', '2021-12-01 00:00:00', '2021-11-30 00:00:00', 0, 0, 4, 3, '电话联系', '', 1, 1513, '2019-10-25 18:33:47', NULL, NULL, 572, 1, '垃圾袋', NULL);
INSERT INTO `resource_article` VALUES (66, NULL, '3M*4N', 54, 40, '张', '新塘物资仓库', '2021-11-29 00:00:00', '2022-10-30 00:00:00', 0, 0, 4, 4, '', '', 1, 1520, '2019-11-21 17:14:35', NULL, NULL, 572, 0, '帐篷（3M*4N）', NULL);
INSERT INTO `resource_article` VALUES (67, NULL, '3M*4N', 54, 40, '张', '/', '2022-11-16 00:00:00', '2022-11-07 00:00:00', 0, 0, 4, 4, '', '', 1, 1520, '2019-11-21 17:16:39', NULL, NULL, 572, 1, '帐篷（3M*4N）', NULL);
INSERT INTO `resource_article` VALUES (68, 270, '3M*4N', 54, 40, '张', '/', '2022-11-09 00:00:00', '2022-11-17 00:00:00', 0, 0, 4, 4, '', '', 1, 1520, '2019-11-22 10:37:51', NULL, NULL, 572, 0, '帐篷(3M*4N)', NULL);
INSERT INTO `resource_article` VALUES (69, 271, '35kg', 54, 2, '个', '/', '2021-11-11 00:00:00', '2022-11-10 00:00:00', 0, 0, 4, 4, '', '', 1, 1520, '2019-11-22 10:39:20', 1520, '2019-11-22 10:48:45', 572, 1, '手提灭火器(35kg)', NULL);
INSERT INTO `resource_article` VALUES (70, 271, '4kg', 54, 20, '个', '/', '2022-11-18 00:00:00', '2022-11-09 00:00:00', 0, 0, 4, 4, '', '', 1, 1520, '2019-11-22 10:49:36', NULL, NULL, 572, 1, '灭火器', NULL);
INSERT INTO `resource_article` VALUES (71, 272, '5kw', 54, 5, '台', '/', '2023-11-13 00:00:00', '2023-11-16 00:00:00', 0, 0, 4, 4, '', '', 1, 1520, '2019-11-22 10:50:50', NULL, NULL, 572, 0, '扩音器', NULL);
INSERT INTO `resource_article` VALUES (72, 273, '/', 54, 20, '个', '/', '2022-11-17 00:00:00', '2022-11-17 00:00:00', 0, 0, 4, 4, '', '', 1, 1520, '2019-11-22 10:59:13', NULL, NULL, 572, 0, '应急灯', NULL);
INSERT INTO `resource_article` VALUES (73, 273, '/', 54, 19, '个', '/', '2021-11-21 00:00:00', '2022-11-06 00:00:00', 0, 0, 4, 4, '', '', 1, 1520, '2019-11-22 11:00:05', NULL, NULL, 572, 0, '探照灯', NULL);
INSERT INTO `resource_article` VALUES (74, 274, '5kw', 54, 1, '台', '/', '2024-11-05 00:00:00', '2024-11-13 00:00:00', 0, 0, 4, 4, '', '', 1, 1520, '2019-11-22 11:00:55', NULL, NULL, 572, 0, '发动机', NULL);
INSERT INTO `resource_article` VALUES (75, 273, '/', 55, 30, '支', '/', '2023-11-16 00:00:00', '2023-11-23 00:00:00', 0, 0, 4, 4, '', '', 1, 1520, '2019-11-22 11:01:46', NULL, NULL, 572, 0, '强光手电筒', NULL);
INSERT INTO `resource_article` VALUES (76, 275, '/', 55, 50, '条', '/', '2025-11-26 00:00:00', '2025-11-17 00:00:00', 0, 0, 4, 4, '', '', 1, 1520, '2019-11-22 11:02:54', NULL, NULL, 572, 0, '毛巾', NULL);
INSERT INTO `resource_article` VALUES (77, 275, '/', 55, 100, '个', '/', '2024-11-15 00:00:00', '2024-11-14 00:00:00', 0, 0, 4, 4, '', '', 1, 1520, '2019-11-22 11:03:42', NULL, NULL, 572, 0, '口罩', NULL);
INSERT INTO `resource_article` VALUES (78, 275, '/', 55, 50, '双', '/', '2024-11-14 00:00:00', '2024-11-12 00:00:00', 0, 0, 4, 4, '', '', 1, 1520, '2019-11-22 11:04:29', NULL, NULL, 572, 0, '胶手套', NULL);
INSERT INTO `resource_article` VALUES (79, 275, '/', 55, 50, '个', '/', '2025-11-18 00:00:00', '2025-11-06 00:00:00', 0, 0, 4, 4, '', '', 1, 1520, '2019-11-22 11:05:11', NULL, NULL, 572, 0, '防毒面具', NULL);
INSERT INTO `resource_article` VALUES (80, 277, '/', 55, 30, '件', '/', '2023-11-15 00:00:00', '2023-11-22 00:00:00', 0, 0, 4, 4, '', '', 1, 1520, '2019-11-22 11:06:09', 1520, '2019-11-22 11:06:40', 572, 0, '救生衣', NULL);
INSERT INTO `resource_article` VALUES (81, 277, '/', 55, 5, '个', '/', '2023-11-15 00:00:00', '2023-11-16 00:00:00', 0, 0, 4, 4, '', '', 1, 1520, '2019-11-22 11:12:07', NULL, NULL, 572, 0, '救生圈', NULL);
INSERT INTO `resource_article` VALUES (82, 275, '/', 55, 30, '件', '/', '2023-12-05 00:00:00', '2023-11-15 00:00:00', 0, 0, 4, 4, '', '', 1, 1520, '2019-11-22 11:13:05', NULL, NULL, 572, 0, '雨衣', NULL);
INSERT INTO `resource_article` VALUES (83, 275, '/', 55, 30, '双', '/', '2025-11-13 00:00:00', '2025-11-24 00:00:00', 0, 0, 4, 4, '', '', 1, 1520, '2019-11-22 11:13:47', NULL, NULL, 572, 0, '水鞋', NULL);
INSERT INTO `resource_article` VALUES (84, 275, '/', 55, 30, '把', '/', '2025-11-13 00:00:00', '2025-11-13 00:00:00', 0, 0, 4, 4, '', '', 1, 1520, '2019-11-22 11:14:57', NULL, NULL, 572, 0, '雨伞', NULL);
INSERT INTO `resource_article` VALUES (85, 275, '/', 55, 30, '个', '/', '2024-11-27 00:00:00', '2024-11-20 00:00:00', 0, 0, 4, 4, '', '', 1, 1520, '2019-11-22 11:16:20', NULL, NULL, 572, 0, '头盔', NULL);
INSERT INTO `resource_article` VALUES (86, 277, '/', 54, 1, '把', '/', '2024-11-20 00:00:00', '2024-11-11 00:00:00', 0, 0, 4, 4, '', '', 1, 1520, '2019-11-22 11:17:18', NULL, NULL, 572, 0, '人字梯', NULL);
INSERT INTO `resource_article` VALUES (87, 277, '/', 54, 5, '条', '/', '2026-11-18 00:00:00', '2026-10-29 00:00:00', 0, 0, 4, 4, '', '', 1, 1520, '2019-11-22 11:18:32', NULL, NULL, 572, 0, '消防救生绳索', NULL);
INSERT INTO `resource_article` VALUES (88, 275, '/', 54, 40, '张', '/', '2028-11-02 00:00:00', '2028-12-01 00:00:00', 0, 0, 4, 4, '', '', 1, 1520, '2019-11-22 11:19:27', NULL, NULL, 572, 0, '塑料凳', NULL);
INSERT INTO `resource_article` VALUES (89, 275, '/', 54, 10, '把', '/', '2024-11-21 00:00:00', '2024-11-06 00:00:00', 0, 0, 4, 4, '', '', 1, 1520, '2019-11-22 11:21:27', 1520, '2019-11-22 11:22:06', 572, 0, '太阳伞', NULL);
INSERT INTO `resource_article` VALUES (90, 275, '40L', 54, 1, '个', '/', '2024-11-14 00:00:00', '2024-11-15 00:00:00', 0, 0, 4, 4, '', '', 1, 1520, '2019-11-22 11:33:37', NULL, NULL, 572, 0, '油桶', NULL);
INSERT INTO `resource_article` VALUES (91, 271, '/', 54, 2, '把', '/', '2027-11-17 00:00:00', '2027-11-17 00:00:00', 0, 0, 4, 4, '', '', 1, 1520, '2019-11-22 11:34:21', NULL, NULL, 572, 0, '强力风扇', NULL);
INSERT INTO `resource_article` VALUES (92, 275, '/', 55, 100, '顶', '/', '2025-11-11 00:00:00', '2025-11-10 00:00:00', 0, 0, 4, 4, '', '', 1, 1520, '2019-11-22 11:35:16', NULL, NULL, 572, 0, '草帽', NULL);
INSERT INTO `resource_article` VALUES (93, 275, '/', 54, 10, '卷', '/', '2024-11-13 00:00:00', '2024-11-18 00:00:00', 0, 0, 4, 4, '', '', 1, 1520, '2019-11-22 11:36:29', NULL, NULL, 572, 0, '警戒彩带', NULL);
INSERT INTO `resource_article` VALUES (94, 218, '呜呜呜', 51, 100, '公斤', '啦啦啦', '2023-12-27 00:00:00', '2024-12-23 00:00:00', 0, 0, 1, 3, '', '测试1', 1, 1520, '2019-12-02 14:00:13', 1520, '2019-12-02 14:01:17', 572, 1, '测试物资', NULL);
INSERT INTO `resource_article` VALUES (95, 218, 'q', 51, 10, 'q', 'q', '2019-12-26 00:00:00', '2019-12-25 00:00:00', 0, 0, 1, 0, '', '', 1, 1520, '2019-12-02 14:11:10', NULL, NULL, 572, 1, 'q', NULL);
INSERT INTO `resource_article` VALUES (96, 218, 'w', 51, 100, 'w', 'w', '2019-12-05 00:00:00', '2019-12-17 00:00:00', 1, 2, 0, 4, '', '', 1, 1520, '2019-12-02 14:11:43', NULL, NULL, 572, 0, 'w', NULL);
INSERT INTO `resource_article` VALUES (97, 218, '1', 51, 1, '1', '1', '2019-12-02 00:00:00', '2019-12-03 00:00:00', 0, 0, 0, 0, '', '1', 1, 1520, '2019-12-02 14:29:20', NULL, NULL, 572, 1, '1', NULL);
INSERT INTO `resource_article` VALUES (98, 218, '2', 51, 2, '2', '2', '2019-12-02 00:00:00', '2019-12-02 00:00:00', 0, 0, 0, 0, '', '2', 1, 1520, '2019-12-02 14:29:54', NULL, NULL, 572, 0, '2', NULL);
INSERT INTO `resource_article` VALUES (99, 218, '1', 51, 1, '1', '1', '2019-12-01 00:00:00', '2019-12-02 00:00:00', 0, 0, 1, 0, '', '', 1, 1520, '2019-12-02 15:54:15', NULL, NULL, 572, 0, '1', NULL);
INSERT INTO `resource_article` VALUES (100, 218, '2', 51, 2, '2', '2', '2019-12-03 00:00:00', '2019-12-23 00:00:00', 0, 0, 0, 0, '', '', 1, 1520, '2019-12-02 15:54:41', NULL, NULL, 572, 0, '2', NULL);
INSERT INTO `resource_article` VALUES (101, 212, '243', 46, 234, '234', '234', '2019-12-23 00:00:00', '2019-12-29 00:00:00', 0, 0, 4, 2, '', '', 1, 70, '2019-12-02 16:01:42', NULL, NULL, 27, 0, '234234', NULL);
INSERT INTO `resource_article` VALUES (102, 218, '1', 51, 1, '1', '1', '2019-12-27 00:00:00', '2019-12-27 00:00:00', 0, 0, 0, 0, '', '1', 1, 2007, '2019-12-12 10:32:52', NULL, NULL, 572, 1, '1', NULL);
INSERT INTO `resource_article` VALUES (103, 219, '2', 54, 2, '2', '2', '2019-12-27 00:00:00', '2019-12-27 00:00:00', 0, 0, 0, 0, '', '2', 1, 2007, '2019-12-12 10:36:14', NULL, NULL, 572, 0, '2', NULL);
INSERT INTO `resource_article` VALUES (104, 218, '1', 51, 1, '1', '1', '2020-01-30 00:00:00', '2020-01-30 00:00:00', 0, 0, 0, 2, '', '', 1, 2007, '2020-01-07 16:57:42', NULL, NULL, 572, 1, 'cs', NULL);
INSERT INTO `resource_article` VALUES (105, 215, 'a', 45, 25, '个', 'cs', '2020-04-07 00:00:00', '2020-04-06 00:00:00', 0, 1, 0, 0, '', 'cs', 1, 1510, '2020-04-02 13:51:29', 1510, '2020-04-02 13:52:09', 27, 0, 'csssss', '');
INSERT INTO `resource_article` VALUES (106, 268, 'xxxx', 45, 22, '个', '是', '2020-04-14 00:00:00', '2020-04-23 00:00:00', 0, 0, 0, 0, '', '测试', 1, 1510, '2020-04-02 13:53:09', NULL, NULL, 27, 1, 'wuzi222', '');
INSERT INTO `resource_article` VALUES (107, 212, '12', 62, 12, '12', '大', '2020-04-14 00:00:00', '2020-04-20 00:00:00', 1, 2, 0, 0, '', '打算', 1, 2043, '2020-04-03 10:48:09', 2043, '2020-04-03 14:02:48', 27, 1, '测试大', '/fastdfs/group1/M00/00/4B/rBBk7l6GqQaAcc9lAAAKr7bYefM101.png');
INSERT INTO `resource_article` VALUES (108, 212, '123', 62, 21, '21', '21', '2020-04-06 00:00:00', '2020-04-06 00:00:00', 1, 2, 1, 1, '', '打算', 1, 2043, '2020-04-03 13:51:51', 2043, '2020-04-03 14:23:52', 27, 0, '测试11大', '');
INSERT INTO `resource_article` VALUES (109, 211, '打算', 62, 21, '21', '21', '2020-04-07 00:00:00', '2020-04-04 00:00:00', 1, 1, 1, 0, '', '', 1, 2043, '2020-04-03 13:59:24', NULL, NULL, 27, 0, '那么', '');
INSERT INTO `resource_article` VALUES (110, 213, '12', 64, 21, '21', '21', '2020-03-31 00:00:00', '2020-04-06 00:00:00', 1, 0, 1, 0, '', '', 1, 2043, '2020-04-03 17:52:28', NULL, NULL, 27, 0, 'hellp', '');
INSERT INTO `resource_article` VALUES (111, 269, '123', 46, 123, '21', '21', '2020-03-29 00:00:00', '2020-03-29 00:00:00', 0, 1, 1, 1, '', '', 1, 2043, '2020-04-03 17:53:08', NULL, NULL, 27, 1, '测试', '');
INSERT INTO `resource_article` VALUES (112, 216, '21', 46, 21, '21', '21', '2020-04-08 00:00:00', '2020-04-20 00:00:00', 1, 1, 0, 1, '', '1231', 0, 2043, '2020-04-03 17:55:21', 2043, '2020-04-07 10:02:50', 27, 0, 'name', '/fastdfs/group1/M00/00/4F/rBBk7l6L30eAN0ytAAAKr7bYefM592.png');
INSERT INTO `resource_article` VALUES (113, 275, 'N95', 54, 100000, '吨', '3M', '2023-03-31 00:00:00', '2023-03-31 00:00:00', 0, 0, 2, 2, '', '防疫物资', 1, 2036, '2020-04-07 17:02:50', NULL, NULL, 572, 1, '口罩', 'http://www.zczhzl.cn/fastdfs/group1/M00/00/51/rBBk7l6MQa6AES0GABuSUy7dyBo593.jpg');
INSERT INTO `resource_article` VALUES (114, 218, 'xx', 55, 24, 'cs', 'cs', '2020-04-29 00:00:00', '2020-04-29 00:00:00', 0, 0, 0, 0, '', '', 1, 2036, '2020-04-07 18:59:37', 2036, '2020-04-07 18:59:48', 572, 1, 'cs', '/fastdfs/group1/M00/00/51/rBBk7l6MXSKAb2gOAAPsE3bZdyw081.png');
INSERT INTO `resource_article` VALUES (115, 218, '防护用品', 67, 500, '件', '//', '2023-04-19 00:00:00', '2023-04-19 00:00:00', 0, 0, 4, 2, '', '', 0, 1520, '2020-04-14 15:54:16', NULL, NULL, 572, 1, '防护用品', '');
INSERT INTO `resource_article` VALUES (116, 218, '防护用品', 69, 300, '件', '//', '2023-04-24 00:00:00', '2023-04-24 00:00:00', 0, 0, 4, 2, '', '', 0, 1520, '2020-04-14 16:03:12', NULL, NULL, 572, 1, '防护用品', '');
INSERT INTO `resource_article` VALUES (117, 218, '防护用品', 68, 300, '件', '//', '2023-04-09 00:00:00', '2023-04-09 00:00:00', 0, 0, 4, 2, '', '', 0, 1520, '2020-04-14 16:04:27', NULL, NULL, 572, 1, '防护用品', '');
INSERT INTO `resource_article` VALUES (118, 218, '防护用品', 70, 200, '件', '//', '2023-04-14 00:00:00', '2023-04-14 00:00:00', 0, 0, 4, 2, '', '', 0, 1520, '2020-04-14 16:05:34', NULL, NULL, 572, 1, '防护用品', '');
INSERT INTO `resource_article` VALUES (119, 215, '1', 46, 1, '1', '1', '2020-04-15 00:00:00', '2020-04-15 00:00:00', 0, 0, 0, 0, '', '', 0, 2053, '2020-04-16 09:42:50', NULL, NULL, 27, 0, 'name', '');

SET FOREIGN_KEY_CHECKS = 1;