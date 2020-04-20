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

 Date: 20/04/2020 10:38:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for resource_article_storehouse
-- ----------------------------
DROP TABLE IF EXISTS `resource_article_storehouse`;
CREATE TABLE `resource_article_storehouse`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `area_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地域编码',
  `contactor_id` bigint(20) DEFAULT NULL COMMENT '联系人id',
  `fax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '传真',
  `longitude` decimal(30, 20) DEFAULT NULL COMMENT '经度',
  `latitude` decimal(30, 20) DEFAULT NULL COMMENT '纬度',
  `coordinate_type` tinyint(1) DEFAULT NULL COMMENT '坐标类型',
  `responsible_unit_id` bigint(20) DEFAULT NULL COMMENT '主管单位/分组的id',
  `responsible_unit_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '主管单位地址',
  `around_traffic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '周边交通',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除 0：未删除  1：已删除',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者id',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_user_id` bigint(20) DEFAULT NULL COMMENT '修改者Id',
  `gmt_modified` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改时间',
  `platform_id` bigint(20) DEFAULT NULL COMMENT '终端用户id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '物资库名称',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址',
  `acreage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '面积',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic  comment '物资库';

-- ----------------------------
-- Records of resource_article_storehouse
-- ----------------------------
INSERT INTO `resource_article_storehouse` VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, '2019-08-21 11:30:46', NULL, NULL, NULL, 'test', NULL, NULL);
INSERT INTO `resource_article_storehouse` VALUES (2, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '哈哈哈', 1, NULL, '2019-08-21 16:27:59', NULL, NULL, 4, '中大', NULL, NULL);
INSERT INTO `resource_article_storehouse` VALUES (3, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '哈哈哈', 1, NULL, '2019-08-21 16:28:13', NULL, NULL, 4, '哈哈哈', NULL, NULL);
INSERT INTO `resource_article_storehouse` VALUES (4, NULL, 23, 'fsafsa', 113.36930800000000000000, 23.10521000000000000000, NULL, NULL, NULL, NULL, 'fsafsaf', 1, NULL, '2019-08-22 16:11:51', NULL, NULL, 4, '救生圈', '广东省广州市海珠区琶洲街道珠江', NULL);
INSERT INTO `resource_article_storehouse` VALUES (5, NULL, 23, '发发', 113.31369000000000000000, 23.17655800000000000000, NULL, NULL, NULL, NULL, '飞洒飞洒', 1, NULL, '2019-08-22 16:15:05', NULL, NULL, 4, '救生圈', '广东省广州市白云区同和街道白云山风景名胜区', NULL);
INSERT INTO `resource_article_storehouse` VALUES (6, NULL, 23, '发放撒', 113.26287800000000000000, 23.13949800000000000000, NULL, NULL, NULL, NULL, '发放萨法', 1, NULL, '2019-08-22 16:16:59', NULL, NULL, 4, '救生圈', '广东省广州市越秀区洪桥街道越秀公园', NULL);
INSERT INTO `resource_article_storehouse` VALUES (7, NULL, 23, '发放撒', 113.25566800000000000000, 23.16940700000000000000, NULL, NULL, NULL, NULL, '发放撒', 1, NULL, '2019-08-22 16:18:49', NULL, NULL, 4, '救生圈', '广东省广州市白云区棠景街道星汇晴轩', NULL);
INSERT INTO `resource_article_storehouse` VALUES (8, NULL, 23, '发放撒', 113.38020800000000000000, 23.06974400000000000000, NULL, NULL, NULL, NULL, '发放撒', 1, NULL, '2019-08-22 18:06:01', NULL, NULL, 4, '气球', '广东省广州市海珠区官洲街道寰宇一路广州国际生物岛山地公园', NULL);
INSERT INTO `resource_article_storehouse` VALUES (9, NULL, 23, '', NULL, NULL, NULL, NULL, NULL, NULL, '', 1, NULL, '2019-08-22 18:23:19', NULL, NULL, 4, '', '', NULL);
INSERT INTO `resource_article_storehouse` VALUES (10, NULL, 23, '', NULL, NULL, NULL, NULL, NULL, NULL, '', 1, NULL, '2019-08-22 18:27:10', NULL, NULL, 4, '', '', NULL);
INSERT INTO `resource_article_storehouse` VALUES (11, NULL, 23, '发放撒', 113.21549900000000000000, 23.14512100000000000000, NULL, NULL, NULL, NULL, '发放撒', 1, NULL, '2019-08-22 18:44:02', NULL, NULL, 4, '鸡蛋', '广东省广州市荔湾区桥中街道西海北路41号', NULL);
INSERT INTO `resource_article_storehouse` VALUES (12, NULL, 23, '发放撒', 113.44792900000000000000, 23.16917100000000000000, NULL, NULL, NULL, NULL, '发放撒', 1, NULL, '2019-08-22 18:46:55', NULL, NULL, 4, '鸡蛋啊', '广东省广州市黄埔区联和街道开泰大道6号广州科学城体育公园', NULL);
INSERT INTO `resource_article_storehouse` VALUES (13, NULL, 23, '发声法', 113.20417000000000000000, 23.17772700000000000000, NULL, NULL, NULL, NULL, '发放撒', 1, NULL, '2019-08-22 18:58:26', NULL, NULL, 4, '猪肉', '广东省佛山市南海区里水镇麦当劳(南海里广路得来速店)恒大.金名都西区', NULL);
INSERT INTO `resource_article_storehouse` VALUES (14, NULL, 23, '发放萨法', 113.21343900000000000000, 23.17427000000000000000, NULL, NULL, NULL, NULL, '发放撒', 1, NULL, '2019-08-22 19:05:34', NULL, NULL, 4, '牛肉', '广东省广州市白云区松洲街道彩滨北路188号', NULL);
INSERT INTO `resource_article_storehouse` VALUES (15, NULL, 23, '发放撒', 113.44689900000000000000, 23.17652900000000000000, NULL, NULL, NULL, NULL, '发放撒', 1, NULL, '2019-08-22 19:09:33', NULL, NULL, 4, '鸡儿', '广东省广州市黄埔区联和街道科翔路', NULL);
INSERT INTO `resource_article_storehouse` VALUES (16, NULL, 23, '发放撒', 113.21858900000000000000, 23.17747600000000000000, NULL, NULL, NULL, NULL, 'fsafsafa', 1, NULL, '2019-08-22 19:11:58', NULL, NULL, 4, '羽毛球', '广东省广州市白云区松洲街道江边楼', NULL);
INSERT INTO `resource_article_storehouse` VALUES (17, NULL, 23, '发放撒', 113.24639800000000000000, 23.17716000000000000000, NULL, NULL, NULL, NULL, '发放撒', 1, NULL, '2019-08-22 19:14:08', NULL, NULL, 4, '鸟', '广东省广州市白云区棠景街道同德围南北高架', NULL);
INSERT INTO `resource_article_storehouse` VALUES (18, NULL, 23, '发撒发生', 113.21858900000000000000, 23.17400400000000000000, NULL, NULL, NULL, NULL, '发声法', 1, NULL, '2019-08-22 19:15:42', NULL, NULL, 4, '猪', '广东省广州市白云区松洲街道西洲北路', NULL);
INSERT INTO `resource_article_storehouse` VALUES (19, NULL, 23, '发放撒', 113.24365200000000000000, 23.16579700000000000000, NULL, NULL, NULL, NULL, '发放撒', 1, NULL, '2019-08-22 19:19:43', NULL, NULL, 4, '鸟啊', '广东省广州市越秀区矿泉街道S15沈海高速广州支线广州市明德创业园', NULL);
INSERT INTO `resource_article_storehouse` VALUES (20, NULL, 23, '发放撒', 113.23094900000000000000, 23.15875400000000000000, 1, 3, '发放撒', '发放撒', '发放撒', 1, NULL, '2019-08-22 20:20:15', NULL, NULL, 4, '蛇', '广东省广州市白云区同德街道岭南雅院广州市白云区明德中学', NULL);
INSERT INTO `resource_article_storehouse` VALUES (21, NULL, 23, '发放撒', 113.36063900000000000000, 23.08616800000000000000, 1, 3, '发放撒', '发放撒', '发放撒', 1, NULL, '2019-08-23 08:48:36', NULL, NULL, 4, '猪啊你', '广东省广州市海珠区官洲街道赤沙路8', NULL);
INSERT INTO `resource_article_storehouse` VALUES (22, NULL, 23, '发放撒', 113.36063900000000000000, 23.08616800000000000000, 1, 2, '发放撒', '发放撒', '发放撒', 1, NULL, '2019-08-23 08:53:31', NULL, NULL, 4, '', '广东省广州市海珠区官洲街道赤沙路8', NULL);
INSERT INTO `resource_article_storehouse` VALUES (23, NULL, 23, '发放撒', 113.36063900000000000000, 23.08616800000000000000, 1, 2, '发放撒', '发放撒', '发放撒', 1, NULL, '2019-08-23 08:53:52', NULL, NULL, 4, '', '广东省广州市海珠区官洲街道赤沙路8', NULL);
INSERT INTO `resource_article_storehouse` VALUES (24, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, 0, 14, '2019-08-23 09:00:22', NULL, NULL, 4, '三防仓库', NULL, NULL);
INSERT INTO `resource_article_storehouse` VALUES (25, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, 1, 14, '2019-08-23 09:10:24', NULL, NULL, 4, '三防仓库1', NULL, NULL);
INSERT INTO `resource_article_storehouse` VALUES (26, NULL, 23, '发放撒', 113.41428300000000000000, 23.17614900000000000000, 1, 17, '发放撒', '发放撒', '发放撒', 1, NULL, '2019-08-23 09:27:50', NULL, NULL, 4, '鸡啊你', '广东省广州市天河区新塘街道高普路', NULL);
INSERT INTO `resource_article_storehouse` VALUES (27, NULL, 23, '啊', 113.43350900000000000000, 23.14233900000000000000, 1, 16, '啊', '啊', '啊', 0, NULL, '2019-08-23 10:01:08', NULL, NULL, 4, '大象仓库', '广东省广州市天河区珠吉街道大灵山路招商·雍华府(建设中)', NULL);
INSERT INTO `resource_article_storehouse` VALUES (28, NULL, 23, '321123231', 113.31595000000000000000, 23.12073100000000000000, 1, 0, '20323020.', '0.230..20', '', 1, NULL, '2019-08-26 19:44:20', NULL, NULL, 27, '救仓库', '广东省广州市天河区冼村街道广州大道中290邦华名悦', NULL);
INSERT INTO `resource_article_storehouse` VALUES (29, NULL, 23, '发放撒', 113.45644500000000000000, 23.14180200000000000000, 1, 11, '发放撒', '发放萨法', '发放萨法', 0, NULL, '2019-08-26 19:54:56', NULL, NULL, 4, '飞翔仓库', '广东省广州市黄埔区联和街道广州精工技术有限公司(科丰路)姬堂工业园', NULL);
INSERT INTO `resource_article_storehouse` VALUES (30, NULL, 43, '发放撒', 113.33422200000000000000, 23.06690000000000000000, 1, 16, '发放撒', '发放撒', '发放撒发生', 1, NULL, '2019-08-27 20:31:15', NULL, NULL, 27, '霸王仓库', '广东省广州市海珠区华洲街道华泰路广州海珠国家湿地公园', NULL);
INSERT INTO `resource_article_storehouse` VALUES (31, NULL, 43, '发放撒', 113.33422200000000000000, 23.16690000000000000000, 1, 16, '发放撒', '发放撒', '发放撒发生', 1, NULL, '2019-08-27 20:32:14', NULL, NULL, 27, '大蛇仓库', '广东省广州市海珠区华洲街道华泰路广州海珠国家湿地公园', NULL);
INSERT INTO `resource_article_storehouse` VALUES (32, NULL, 23, '发放', 113.37651800000000000000, 23.06968000000000000000, 1, 39, '阿福撒', '法国撒', '发放撒', 0, NULL, '2019-08-29 09:27:35', NULL, NULL, 4, '功夫帝国仓库', '广东省广州市海珠区官洲街道寰宇三路广州国际生物岛山地公园', NULL);
INSERT INTO `resource_article_storehouse` VALUES (33, NULL, 23, '发放撒', 113.32845300000000000000, 23.10101100000000000000, 1, 39, '萨法', '发放撒', '发放撒', 0, NULL, '2019-08-29 09:50:25', NULL, NULL, 4, '萨嘎仓库', '广东省广州市海珠区赤岗街道必胜客四季天地北座', NULL);
INSERT INTO `resource_article_storehouse` VALUES (34, NULL, 14, '123', 113.30742400000000000000, 23.08601000000000000000, 1, 5, '132', '132', '', 1, NULL, '2019-08-29 15:12:33', NULL, NULL, 27, 'test', '广东省广州市海珠区凤阳街道鹭江西街五社小区', NULL);
INSERT INTO `resource_article_storehouse` VALUES (35, NULL, 14, 'sad', 113.31669400000000000000, 23.09927400000000000000, 1, 5, 'asf', 'asd', 'asf', 1, NULL, '2019-08-29 15:17:59', NULL, NULL, 27, 'sad', '广东省广州市海珠区赤岗街道英国纽曼大学广东第二师范学院海外研习中心广东第二师范学院海珠校区', NULL);
INSERT INTO `resource_article_storehouse` VALUES (36, NULL, 49, '发撒疯撒', 113.35763500000000000000, 23.15294900000000000000, 1, 2, '福娃飞洒', '发撒疯撒', '好臭啊', 1, NULL, '2019-08-29 15:40:05', NULL, NULL, 27, '嘎嘎仓库', '广东省广州市天河区五山街道紫荆路华南农业大学', NULL);
INSERT INTO `resource_article_storehouse` VALUES (37, NULL, 49, '萨芬撒', 113.44380900000000000000, 23.16778500000000000000, 1, 5, '哥仨', '给多少给多少', '哥四哥都是', 1, NULL, '2019-08-29 17:20:02', NULL, NULL, 27, '雷迪嘎嘎仓库', '广东省广州市黄埔区联和街道科学大道155广州科学城体育公园', NULL);
INSERT INTO `resource_article_storehouse` VALUES (38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 14, '2019-09-10 14:24:30', NULL, NULL, 27, '三防仓库', NULL, NULL);
INSERT INTO `resource_article_storehouse` VALUES (39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 14, '2019-09-10 14:24:30', NULL, NULL, 27, '二防仓库', NULL, NULL);
INSERT INTO `resource_article_storehouse` VALUES (40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 14, '2019-09-10 14:28:30', NULL, NULL, 27, '三防仓库', NULL, NULL);
INSERT INTO `resource_article_storehouse` VALUES (41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 14, '2019-09-10 14:28:30', NULL, NULL, 27, '二防仓库', NULL, NULL);
INSERT INTO `resource_article_storehouse` VALUES (42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 14, '2019-09-10 14:36:23', NULL, NULL, 27, '三防仓库', NULL, NULL);
INSERT INTO `resource_article_storehouse` VALUES (43, NULL, NULL, '1233', 113.29266100000000000000, 23.08059200000000000000, 1, 11, '121', '121221', '', 1, 14, '2019-09-10 14:36:23', NULL, NULL, 27, '二防仓库', '广东省广州市海珠区瑞宝街道东晓南路138', NULL);
INSERT INTO `resource_article_storehouse` VALUES (44, NULL, 85, '020-13216521', NULL, NULL, 1, 89, '中大', '中大地铁站', '', 1, NULL, '2019-09-25 11:16:20', NULL, NULL, 27, '保洁仓库', '', NULL);
INSERT INTO `resource_article_storehouse` VALUES (45, NULL, 85, '020-12345678', 113.31978400000000000000, 23.09264200000000000000, 1, 88, '中大地铁A出口', '地铁', 'cs', 0, NULL, '2019-09-25 11:25:33', NULL, NULL, 27, '环保仓库', '广东省广州市海珠区江海街道金影花园金影小学', '22.00000');
INSERT INTO `resource_article_storehouse` VALUES (46, NULL, 85, '020-12345678', NULL, NULL, 1, 1, '中大地铁A出口', '中大地铁A出口', '', 0, NULL, '2019-09-25 11:30:18', NULL, NULL, 27, '易耗品仓库', '', NULL);
INSERT INTO `resource_article_storehouse` VALUES (47, NULL, 85, '123123555', NULL, NULL, 1, 159, '增城', '434', '', 0, NULL, '2019-10-10 13:46:25', NULL, NULL, 27, '应急帐篷', '', NULL);
INSERT INTO `resource_article_storehouse` VALUES (48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 999, '2019-10-18 17:56:30', NULL, NULL, 27, '三防仓库', NULL, NULL);
INSERT INTO `resource_article_storehouse` VALUES (49, NULL, 1513, '020-33692810', 113.61782700000000000000, 23.11611600000000000000, 1, 1184, '天福便利店(增城新塘金泽花园西门店)', '22路公交', '', 1, NULL, '2019-10-25 14:09:19', NULL, NULL, 572, '日常用品仓库', '天福便利店(增城新塘金泽花园西门店)', NULL);
INSERT INTO `resource_article_storehouse` VALUES (50, NULL, 1513, '020-62301782', 113.22596100000000000000, 23.29410300000000000000, 1, 1187, '英才小学教务处', '12路公交', '', 1, NULL, '2019-10-25 14:10:53', NULL, NULL, 572, '应急用品', '英才小学', NULL);
INSERT INTO `resource_article_storehouse` VALUES (51, NULL, 1513, '020-63201877', 113.61732100000000000000, 23.11688200000000000000, 1, 1184, '金泽花园物业管理处', '23、17、11路公交', '', 1, NULL, '2019-10-25 16:46:09', NULL, NULL, 572, '三防仓库', '广东省广州市增城区新塘镇新塘大道中20号金泽花园(担杆坳路)', NULL);
INSERT INTO `resource_article_storehouse` VALUES (52, NULL, 1513, '020-65278916', NULL, NULL, 1, 1185, '新康花园', '32、18、19路公交', '', 1, NULL, '2019-10-25 16:48:40', NULL, NULL, 572, '应急仓库', '', NULL);
INSERT INTO `resource_article_storehouse` VALUES (53, NULL, 1513, '020-39628577', NULL, NULL, 1, 1185, '新康花园务管理处', '20、16、25路公交', '', 1, NULL, '2019-10-25 16:56:26', NULL, NULL, 572, '保洁仓库', '', NULL);
INSERT INTO `resource_article_storehouse` VALUES (54, NULL, 1520, '82770110', 113.62831700000000000000, 23.14870700000000000000, 1, 1793, '广东省广州市增城区新塘镇民营西二路', '增城27路/增城40路/增城20路', '', 1, NULL, '2019-11-21 17:08:34', NULL, NULL, 572, '物资仓库', '广东省广州市增城区新塘镇民营西二路', NULL);
INSERT INTO `resource_article_storehouse` VALUES (55, NULL, 1520, '82770110', 113.62107800000000000000, 23.11879000000000000000, 1, 1792, '新塘镇政府(公交站)', '增城22路/增城37路/增城9路', '', 1, NULL, '2019-11-21 17:11:11', NULL, NULL, 572, '镇总值班室', '新塘镇政府(公交站)', NULL);
INSERT INTO `resource_article_storehouse` VALUES (56, NULL, 2007, '4785236', 0.00000000000000000000, 0.00000000000000000000, 1, 1803, '1351', '1', '', 1, NULL, '2019-12-12 14:19:04', NULL, NULL, 572, '11', '', NULL);
INSERT INTO `resource_article_storehouse` VALUES (57, NULL, 2007, '4785236', 0.00000000000000000000, 0.00000000000000000000, 1, 1803, '1351', '1', '', 1, NULL, '2019-12-12 14:19:04', NULL, NULL, 572, '11', '', NULL);
INSERT INTO `resource_article_storehouse` VALUES (58, NULL, 2007, '4785236', 0.00000000000000000000, 0.00000000000000000000, 1, 1803, '1351', '1', '', 1, NULL, '2019-12-12 14:19:05', NULL, NULL, 572, '11', '', NULL);
INSERT INTO `resource_article_storehouse` VALUES (59, NULL, 2007, '4785236', 0.00000000000000000000, 0.00000000000000000000, 1, 1803, '1351', '1', '', 1, NULL, '2019-12-12 14:19:05', NULL, NULL, 572, '11', '', NULL);
INSERT INTO `resource_article_storehouse` VALUES (60, NULL, 2007, '4785236', 0.00000000000000000000, 0.00000000000000000000, 1, 1803, '1351', '1', '', 1, NULL, '2019-12-12 14:19:05', NULL, NULL, 572, '11', '', NULL);
INSERT INTO `resource_article_storehouse` VALUES (61, NULL, 2038, '', 113.30696700000000000000, 23.14727600000000000000, 1, 2528, '广州市', '很好', '', 0, NULL, '2020-03-26 15:36:13', NULL, NULL, 1382, '三防物资库', '沙河(地铁站)', '100.00000');
INSERT INTO `resource_article_storehouse` VALUES (62, NULL, 1510, '', 113.32499100000000000000, 23.11189000000000000000, 1, 677, '广东', '好', '测试', 0, NULL, '2020-03-30 16:14:41', NULL, NULL, 27, '物资一', '广东省广州市天河区猎德街道海心沙亚运公园', '20.00000');
INSERT INTO `resource_article_storehouse` VALUES (63, NULL, 2043, '', 113.30055800000000000000, 23.09194700000000000000, 1, 88, '不大好看', '安全', '那么', 1, NULL, '2020-04-03 15:33:58', NULL, NULL, 27, '测试', '广东省广州市海珠区新港街道新港西路155-1号海洋雅苑', '15.00000');
INSERT INTO `resource_article_storehouse` VALUES (64, NULL, 2043, '', 113.30811100000000000000, 23.14594000000000000000, 1, 2, 'name', '大健康', '好几款', 0, NULL, '2020-04-03 15:35:27', NULL, NULL, 27, '打开了', '广东省广州市天河区沙河街道水荫一横路广州市公路局宿舍', '123.00000');
INSERT INTO `resource_article_storehouse` VALUES (65, NULL, 2043, '', 113.27000200000000000000, 23.08720900000000000000, 1, 89, '海珠', '安全', '', 0, NULL, '2020-04-03 17:40:33', NULL, NULL, 27, '东方仓库', '广东省广州市海珠区昌岗街道宝岗加油站', '23.0');
INSERT INTO `resource_article_storehouse` VALUES (66, NULL, 2037, '', 113.66088700000000000000, 23.16065500000000000000, 1, 1230, '新塘镇人民政府', '新塘公园', '消杀物资、消毒液', 1, NULL, '2020-04-10 18:15:18', NULL, NULL, 572, '防疫物资库', '新塘镇综治信访维稳中心', '300平');
INSERT INTO `resource_article_storehouse` VALUES (67, NULL, 1520, '', 113.61923000000000000000, 23.12095600000000000000, 1, 2086, '新塘镇综治办（应急组）', '畅通', '', 0, NULL, '2020-04-14 15:52:16', NULL, NULL, 572, '防灾救灾物资设备仓库', '市民文化活动中心', '--');
INSERT INTO `resource_article_storehouse` VALUES (68, NULL, 1520, '', 113.61168300000000000000, 23.12292100000000000000, 1, 1881, '新塘镇汇美社区物资仓库', '畅通', '', 0, NULL, '2020-04-14 15:58:49', NULL, NULL, 572, '汇美社区物资仓库', '汇美居委会', '100');
INSERT INTO `resource_article_storehouse` VALUES (69, NULL, 1520, '', 113.41151300000000000000, 23.15775100000000000000, 1, 1882, '新康社区物资仓库', '畅通', '', 0, NULL, '2020-04-14 16:00:27', NULL, NULL, 572, '新康社区物资仓库', '新塘社区', '100');
INSERT INTO `resource_article_storehouse` VALUES (70, NULL, 1520, '', 113.55903700000000000000, 23.13272100000000000000, 1, 1885, '翡翠绿洲社区物资仓库', '畅通', '', 0, NULL, '2020-04-14 16:01:44', NULL, NULL, 572, '翡翠绿洲社区物资仓库', '翡翠绿洲社区', '100+');

SET FOREIGN_KEY_CHECKS = 1;
