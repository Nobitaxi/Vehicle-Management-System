/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80019
Source Host           : localhost:3306
Source Database       : park

Target Server Type    : MYSQL
Target Server Version : 80019
File Encoding         : 65001

Date: 2021-05-28 11:03:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for app01_administrator
-- ----------------------------
DROP TABLE IF EXISTS `app01_administrator`;
CREATE TABLE `app01_administrator` (
  `account` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app01_administrator
-- ----------------------------
INSERT INTO `app01_administrator` VALUES ('chengminwei', '654321');
INSERT INTO `app01_administrator` VALUES ('chenxi', '123456');

-- ----------------------------
-- Table structure for app01_car_in_record
-- ----------------------------
DROP TABLE IF EXISTS `app01_car_in_record`;
CREATE TABLE `app01_car_in_record` (
  `id` int NOT NULL AUTO_INCREMENT,
  `carnum` varchar(32) NOT NULL,
  `begintime` datetime(6) NOT NULL,
  `carport` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app01_car_in_record
-- ----------------------------
INSERT INTO `app01_car_in_record` VALUES ('1', '鄂D3Z652', '2021-05-03 21:13:42.000000', '85');
INSERT INTO `app01_car_in_record` VALUES ('2', '鄂AC5U33', '2021-05-03 21:29:23.000000', '58');
INSERT INTO `app01_car_in_record` VALUES ('3', '鄂AF05V6', '2021-05-03 21:32:29.000000', '41');
INSERT INTO `app01_car_in_record` VALUES ('4', '川AFQ263', '2021-05-03 21:35:27.000000', '78');
INSERT INTO `app01_car_in_record` VALUES ('5', '鄂AH45H5', '2021-05-03 21:35:52.000000', '19');
INSERT INTO `app01_car_in_record` VALUES ('6', '鄂E57V20', '2021-05-07 13:21:44.000000', '22');
INSERT INTO `app01_car_in_record` VALUES ('7', '鄂A83P99', '2021-05-07 13:22:24.000000', '88');
INSERT INTO `app01_car_in_record` VALUES ('8', '鄂N6HF65', '2021-05-07 13:34:37.000000', '97');
INSERT INTO `app01_car_in_record` VALUES ('9', '鄂A863Q8', '2021-05-07 13:34:55.000000', '23');
INSERT INTO `app01_car_in_record` VALUES ('10', '鄂B5BM11', '2021-05-07 13:35:12.000000', '36');
INSERT INTO `app01_car_in_record` VALUES ('11', '鄂D3B331', '2021-05-07 13:36:28.000000', '56');
INSERT INTO `app01_car_in_record` VALUES ('12', '鄂AJ54P5', '2021-05-07 13:36:42.000000', '81');
INSERT INTO `app01_car_in_record` VALUES ('13', '鄂B6X708', '2021-05-07 13:37:02.000000', '68');
INSERT INTO `app01_car_in_record` VALUES ('14', '鄂A94AN8', '2021-05-07 14:50:55.000000', '44');
INSERT INTO `app01_car_in_record` VALUES ('15', '鄂A07012', '2021-05-07 14:53:14.000000', '71');
INSERT INTO `app01_car_in_record` VALUES ('16', '鄂S789A0', '2021-05-07 14:53:26.000000', '57');
INSERT INTO `app01_car_in_record` VALUES ('17', '鄂F8C520', '2021-05-07 22:50:13.000000', '78');
INSERT INTO `app01_car_in_record` VALUES ('18', '鄂L3C020', '2021-05-07 22:50:26.000000', '63');
INSERT INTO `app01_car_in_record` VALUES ('19', '鄂ADP245', '2021-05-08 11:03:23.000000', '34');
INSERT INTO `app01_car_in_record` VALUES ('20', '鄂L0Y136', '2021-05-08 13:52:10.000000', '96');
INSERT INTO `app01_car_in_record` VALUES ('21', '鄂A645K2', '2021-05-08 18:00:31.000000', '29');
INSERT INTO `app01_car_in_record` VALUES ('22', '鄂B8B529', '2021-05-08 18:13:59.000000', '73');
INSERT INTO `app01_car_in_record` VALUES ('23', '鄂A92FP2', '2021-05-08 18:14:11.000000', '80');
INSERT INTO `app01_car_in_record` VALUES ('24', '鄂FKT085', '2021-05-08 18:14:27.000000', '28');
INSERT INTO `app01_car_in_record` VALUES ('25', '鄂B38538', '2021-05-11 21:21:39.000000', '11');
INSERT INTO `app01_car_in_record` VALUES ('26', '鄂B8PD18', '2021-05-11 21:21:51.000000', '25');
INSERT INTO `app01_car_in_record` VALUES ('27', '鄂SK5X82', '2021-05-12 10:31:52.000000', '42');
INSERT INTO `app01_car_in_record` VALUES ('28', '鄂AKG067', '2021-05-12 14:47:17.000000', '21');
INSERT INTO `app01_car_in_record` VALUES ('29', '鄂AY5M47', '2021-05-13 00:08:10.000000', '86');
INSERT INTO `app01_car_in_record` VALUES ('30', '鄂E12P89', '2021-05-13 01:06:48.000000', '38');
INSERT INTO `app01_car_in_record` VALUES ('31', '鄂SK5X82', '2021-05-13 10:44:48.000000', '69');
INSERT INTO `app01_car_in_record` VALUES ('32', '鄂SC3D39', '2021-05-27 14:15:50.000000', '74');
INSERT INTO `app01_car_in_record` VALUES ('33', '鄂SKH232', '2021-05-27 14:23:05.000000', '68');
INSERT INTO `app01_car_in_record` VALUES ('34', '鄂A89WH5', '2021-05-27 14:23:19.000000', '24');
INSERT INTO `app01_car_in_record` VALUES ('35', '鄂B6CZ89', '2021-05-27 14:39:53.000000', '2');
INSERT INTO `app01_car_in_record` VALUES ('36', '鄂A99L3G', '2021-05-26 20:06:26.000000', '63');
INSERT INTO `app01_car_in_record` VALUES ('37', '鄂A90CC0', '2021-05-25 20:10:58.000000', '20');
INSERT INTO `app01_car_in_record` VALUES ('38', '鄂A645K2', '2021-05-24 20:25:55.000000', '43');
INSERT INTO `app01_car_in_record` VALUES ('39', '鄂AC9795', '2021-05-27 20:36:48.000000', '49');
INSERT INTO `app01_car_in_record` VALUES ('40', '鄂B1U997', '2021-05-27 20:37:34.000000', '10');
INSERT INTO `app01_car_in_record` VALUES ('41', '鄂A22F68', '2021-05-27 20:37:45.000000', '8');

-- ----------------------------
-- Table structure for app01_car_manage
-- ----------------------------
DROP TABLE IF EXISTS `app01_car_manage`;
CREATE TABLE `app01_car_manage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `carnum` varchar(32) DEFAULT NULL,
  `carport` int NOT NULL,
  `begintime` datetime(6) DEFAULT NULL,
  `endtime` datetime(6) DEFAULT NULL,
  `genre` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `carnum` (`carnum`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app01_car_manage
-- ----------------------------
INSERT INTO `app01_car_manage` VALUES ('1', null, '1', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('2', '鄂B6CZ89', '2', '2021-05-27 14:39:53.000000', null, '2');
INSERT INTO `app01_car_manage` VALUES ('3', null, '3', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('4', null, '4', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('5', null, '5', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('6', null, '6', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('7', '鄂FPQ007', '7', '2021-04-27 16:36:38.000000', null, '2');
INSERT INTO `app01_car_manage` VALUES ('8', '鄂A22F68', '8', '2021-05-27 20:37:45.000000', null, '2');
INSERT INTO `app01_car_manage` VALUES ('9', null, '9', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('10', '鄂B1U997', '10', '2021-05-27 20:37:34.000000', null, '2');
INSERT INTO `app01_car_manage` VALUES ('11', '鄂B38538', '11', '2021-05-11 21:21:39.000000', null, '2');
INSERT INTO `app01_car_manage` VALUES ('12', null, '12', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('13', null, '13', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('14', '鄂R86800', '14', '2021-04-28 13:35:22.000000', null, '2');
INSERT INTO `app01_car_manage` VALUES ('15', null, '15', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('16', null, '16', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('17', null, '17', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('18', null, '18', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('19', '鄂AH45H5', '19', '2021-05-03 21:35:52.000000', null, '2');
INSERT INTO `app01_car_manage` VALUES ('20', '鄂A90CC0', '20', '2021-05-25 20:10:58.000000', null, '2');
INSERT INTO `app01_car_manage` VALUES ('21', '鄂AKG067', '21', '2021-05-12 14:47:17.000000', null, '1');
INSERT INTO `app01_car_manage` VALUES ('22', '鄂E57V20', '22', '2021-05-07 13:21:44.000000', null, '2');
INSERT INTO `app01_car_manage` VALUES ('23', '鄂A863Q8', '23', '2021-05-07 13:34:55.000000', null, '2');
INSERT INTO `app01_car_manage` VALUES ('24', '鄂A89WH5', '24', '2021-05-27 14:23:19.000000', null, '2');
INSERT INTO `app01_car_manage` VALUES ('25', '鄂B8PD18', '25', '2021-05-11 21:21:51.000000', null, '2');
INSERT INTO `app01_car_manage` VALUES ('26', null, '26', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('27', null, '27', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('28', '鄂FKT085', '28', '2021-05-08 18:14:27.000000', null, '2');
INSERT INTO `app01_car_manage` VALUES ('29', null, '29', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('30', null, '30', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('31', '鄂A35231', '31', '2021-04-22 15:42:39.000000', null, '2');
INSERT INTO `app01_car_manage` VALUES ('32', null, '32', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('33', null, '33', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('34', '鄂ADP245', '34', '2021-05-08 11:03:23.000000', null, '2');
INSERT INTO `app01_car_manage` VALUES ('35', null, '35', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('36', '鄂B5BM11', '36', '2021-05-07 13:35:12.000000', null, '2');
INSERT INTO `app01_car_manage` VALUES ('37', null, '37', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('38', null, '38', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('39', null, '39', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('40', null, '40', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('41', '鄂AF05V6', '41', '2021-05-03 21:32:29.000000', null, '2');
INSERT INTO `app01_car_manage` VALUES ('42', null, '42', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('43', null, '43', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('44', '鄂A94AN8', '44', '2021-05-07 14:50:55.000000', null, '2');
INSERT INTO `app01_car_manage` VALUES ('45', null, '45', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('46', null, '46', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('47', null, '47', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('48', null, '48', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('49', '鄂AC9795', '49', '2021-05-27 20:36:48.000000', null, '2');
INSERT INTO `app01_car_manage` VALUES ('50', null, '50', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('51', null, '51', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('52', null, '52', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('53', null, '53', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('54', null, '54', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('55', '鄂A999B9', '55', '2021-04-29 13:04:02.000000', null, '1');
INSERT INTO `app01_car_manage` VALUES ('56', '鄂D3B331', '56', '2021-05-07 13:36:28.000000', null, '2');
INSERT INTO `app01_car_manage` VALUES ('57', '鄂S789A0', '57', '2021-05-07 14:53:26.000000', null, '2');
INSERT INTO `app01_car_manage` VALUES ('58', '鄂AC5U33', '58', '2021-05-03 21:29:23.000000', null, '2');
INSERT INTO `app01_car_manage` VALUES ('59', null, '59', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('60', null, '60', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('61', null, '61', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('62', null, '62', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('63', '鄂A99L3G', '63', '2021-05-26 20:06:26.000000', null, '2');
INSERT INTO `app01_car_manage` VALUES ('64', null, '64', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('65', null, '65', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('66', null, '66', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('67', null, '67', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('68', '鄂SKH232', '68', '2021-05-27 14:23:05.000000', null, '2');
INSERT INTO `app01_car_manage` VALUES ('69', null, '69', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('70', null, '70', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('71', '鄂A07012', '71', '2021-05-07 14:53:14.000000', null, '2');
INSERT INTO `app01_car_manage` VALUES ('72', null, '72', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('73', '鄂B8B529', '73', '2021-05-08 18:13:59.000000', null, '2');
INSERT INTO `app01_car_manage` VALUES ('74', '鄂SC3D39', '74', '2021-05-27 14:15:50.000000', null, '2');
INSERT INTO `app01_car_manage` VALUES ('75', null, '75', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('76', null, '76', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('77', null, '77', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('78', '鄂F8C520', '78', '2021-05-07 22:50:13.000000', null, '2');
INSERT INTO `app01_car_manage` VALUES ('79', null, '79', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('80', null, '80', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('81', null, '81', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('82', null, '82', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('83', null, '83', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('84', null, '84', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('85', '鄂D3Z652', '85', '2021-05-03 21:13:42.000000', null, '2');
INSERT INTO `app01_car_manage` VALUES ('86', '鄂AY5M47', '86', '2021-05-13 00:08:10.000000', null, '2');
INSERT INTO `app01_car_manage` VALUES ('87', '鄂B09234', '87', '2021-04-29 13:14:33.000000', null, '2');
INSERT INTO `app01_car_manage` VALUES ('88', '鄂A83P99', '88', '2021-05-07 13:22:24.000000', null, '2');
INSERT INTO `app01_car_manage` VALUES ('89', null, '89', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('90', null, '90', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('91', null, '91', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('92', null, '92', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('93', null, '93', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('94', null, '94', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('95', null, '95', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('96', '鄂L0Y136', '96', '2021-05-08 13:52:10.000000', null, '2');
INSERT INTO `app01_car_manage` VALUES ('97', '鄂N6HF65', '97', '2021-05-07 13:34:37.000000', null, '2');
INSERT INTO `app01_car_manage` VALUES ('98', null, '98', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('99', null, '99', null, null, null);
INSERT INTO `app01_car_manage` VALUES ('100', null, '100', null, null, null);

-- ----------------------------
-- Table structure for app01_car_out_record
-- ----------------------------
DROP TABLE IF EXISTS `app01_car_out_record`;
CREATE TABLE `app01_car_out_record` (
  `id` int NOT NULL AUTO_INCREMENT,
  `carnum` varchar(32) NOT NULL,
  `endtime` datetime(6) NOT NULL,
  `carport` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app01_car_out_record
-- ----------------------------
INSERT INTO `app01_car_out_record` VALUES ('1', '川AFQ263', '2021-05-07 13:33:32.000000', '78');
INSERT INTO `app01_car_out_record` VALUES ('2', '鄂BCE663', '2021-05-07 13:33:41.000000', '54');
INSERT INTO `app01_car_out_record` VALUES ('3', '鄂A20304', '2021-05-07 14:52:40.000000', '35');
INSERT INTO `app01_car_out_record` VALUES ('4', '鄂A118L4', '2021-05-08 13:53:41.000000', '82');
INSERT INTO `app01_car_out_record` VALUES ('5', '鄂A645K2', '2021-05-08 18:13:26.000000', '29');
INSERT INTO `app01_car_out_record` VALUES ('6', '鄂L1L079', '2021-05-08 21:42:37.000000', '21');
INSERT INTO `app01_car_out_record` VALUES ('7', '鄂B6X708', '2021-05-11 21:22:15.000000', '68');
INSERT INTO `app01_car_out_record` VALUES ('8', '鄂A92FP2', '2021-05-12 13:11:29.000000', '80');
INSERT INTO `app01_car_out_record` VALUES ('9', '鄂SK5X82', '2021-05-13 10:44:31.000000', '42');
INSERT INTO `app01_car_out_record` VALUES ('10', '鄂L3C020', '2021-05-27 14:19:35.000000', '63');
INSERT INTO `app01_car_out_record` VALUES ('11', '鄂A645K2', '2021-05-27 20:27:33.000000', '43');
INSERT INTO `app01_car_out_record` VALUES ('12', '鄂SK5X82', '2021-05-27 20:29:11.000000', '69');
INSERT INTO `app01_car_out_record` VALUES ('13', '鄂E12P89', '2021-05-27 20:29:33.000000', '38');
INSERT INTO `app01_car_out_record` VALUES ('14', '鄂AJ54P5', '2021-05-27 20:38:01.000000', '81');

-- ----------------------------
-- Table structure for app01_car_record
-- ----------------------------
DROP TABLE IF EXISTS `app01_car_record`;
CREATE TABLE `app01_car_record` (
  `id` int NOT NULL AUTO_INCREMENT,
  `carnum` varchar(32) NOT NULL,
  `begintime` datetime(6) NOT NULL,
  `endtime` datetime(6) NOT NULL,
  `genre` int NOT NULL,
  `money` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app01_car_record
-- ----------------------------
INSERT INTO `app01_car_record` VALUES ('1', '鄂AC5A38', '2021-04-25 14:18:12.000000', '2021-04-27 14:14:11.000000', '2', '36');
INSERT INTO `app01_car_record` VALUES ('2', '鄂FKT085', '2021-04-25 21:08:31.000000', '2021-04-27 15:12:53.000000', '2', '36');
INSERT INTO `app01_car_record` VALUES ('5', '鄂AL8T81', '2021-04-29 12:59:43.000000', '2021-04-29 13:17:53.000000', '2', '0');
INSERT INTO `app01_car_record` VALUES ('6', '鄂A97PQ2', '2021-04-28 16:43:04.000000', '2021-04-29 13:18:38.000000', '2', '18');
INSERT INTO `app01_car_record` VALUES ('7', '川AFQ263', '2021-05-03 21:35:27.000000', '2021-05-07 13:33:32.000000', '2', '72');
INSERT INTO `app01_car_record` VALUES ('8', '鄂BCE663', '2021-04-25 15:52:07.000000', '2021-05-07 13:33:41.000000', '2', '216');
INSERT INTO `app01_car_record` VALUES ('9', '鄂A20304', '2021-04-19 10:19:44.000000', '2021-05-07 14:52:40.000000', '1', '0');
INSERT INTO `app01_car_record` VALUES ('10', '鄂A118L4', '2021-04-21 16:09:43.000000', '2021-05-08 13:53:41.000000', '2', '306');
INSERT INTO `app01_car_record` VALUES ('11', '鄂A645K2', '2021-05-08 18:00:31.000000', '2021-05-08 18:13:26.000000', '2', '0');
INSERT INTO `app01_car_record` VALUES ('12', '鄂L1L079', '2021-04-25 15:51:51.000000', '2021-05-08 21:42:37.000000', '2', '234');
INSERT INTO `app01_car_record` VALUES ('13', '鄂B6X708', '2021-05-07 13:37:02.000000', '2021-05-11 21:22:15.000000', '2', '72');
INSERT INTO `app01_car_record` VALUES ('14', '鄂A92FP2', '2021-05-08 18:14:11.000000', '2021-05-12 13:11:29.000000', '2', '72');
INSERT INTO `app01_car_record` VALUES ('15', '鄂SK5X82', '2021-05-12 10:31:52.000000', '2021-05-13 10:44:31.000000', '1', '0');
INSERT INTO `app01_car_record` VALUES ('16', '鄂L3C020', '2021-05-07 22:50:26.000000', '2021-05-27 14:19:35.000000', '2', '360');
INSERT INTO `app01_car_record` VALUES ('17', '鄂A645K2', '2021-05-24 20:25:55.000000', '2021-05-24 20:27:33.000000', '2', '57');
INSERT INTO `app01_car_record` VALUES ('18', '鄂SK5X82', '2021-05-13 10:44:48.000000', '2021-05-27 20:29:11.000000', '1', '0');
INSERT INTO `app01_car_record` VALUES ('19', '鄂E12P89', '2021-05-13 01:06:48.000000', '2021-05-27 20:29:33.000000', '2', '270');
INSERT INTO `app01_car_record` VALUES ('20', '鄂AJ54P5', '2021-05-07 13:36:42.000000', '2021-05-27 20:38:01.000000', '2', '378');

-- ----------------------------
-- Table structure for app01_charge
-- ----------------------------
DROP TABLE IF EXISTS `app01_charge`;
CREATE TABLE `app01_charge` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pay_time` datetime(6) DEFAULT NULL,
  `money` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app01_charge
-- ----------------------------
INSERT INTO `app01_charge` VALUES ('1', '2021-04-27 15:08:22.193517', '810');
INSERT INTO `app01_charge` VALUES ('2', '2021-04-27 15:12:53.697129', '36');
INSERT INTO `app01_charge` VALUES ('3', '2021-04-27 16:35:58.605472', '162');
INSERT INTO `app01_charge` VALUES ('4', '2021-04-29 13:00:30.912372', '108');
INSERT INTO `app01_charge` VALUES ('5', '2021-04-29 13:17:53.107592', '0');
INSERT INTO `app01_charge` VALUES ('6', '2021-04-29 13:18:38.736710', '18');
INSERT INTO `app01_charge` VALUES ('7', '2021-05-07 13:33:32.953741', '72');
INSERT INTO `app01_charge` VALUES ('8', '2021-05-07 13:33:41.980449', '216');
INSERT INTO `app01_charge` VALUES ('9', '2021-05-07 14:52:40.242407', '0');
INSERT INTO `app01_charge` VALUES ('10', '2021-05-07 16:33:03.135379', '150');
INSERT INTO `app01_charge` VALUES ('11', '2021-05-07 16:39:08.559917', '150');
INSERT INTO `app01_charge` VALUES ('12', '2021-05-08 13:53:41.520139', '306');
INSERT INTO `app01_charge` VALUES ('13', '2021-05-08 18:13:26.343020', '0');
INSERT INTO `app01_charge` VALUES ('14', '2021-05-08 21:42:37.244256', '234');
INSERT INTO `app01_charge` VALUES ('15', '2021-05-11 21:22:15.528684', '72');
INSERT INTO `app01_charge` VALUES ('16', '2021-05-11 22:47:37.123532', '425');
INSERT INTO `app01_charge` VALUES ('17', '2021-05-12 13:11:29.471717', '72');
INSERT INTO `app01_charge` VALUES ('18', '2021-05-12 14:46:59.251112', '150');
INSERT INTO `app01_charge` VALUES ('19', '2021-05-12 22:47:11.149523', '150');
INSERT INTO `app01_charge` VALUES ('20', '2021-05-13 00:07:54.464891', '150');
INSERT INTO `app01_charge` VALUES ('21', '2021-05-13 01:09:21.022407', '150');
INSERT INTO `app01_charge` VALUES ('22', '2021-05-13 10:44:31.461629', '0');
INSERT INTO `app01_charge` VALUES ('23', '2021-05-27 14:19:35.141815', '360');
INSERT INTO `app01_charge` VALUES ('24', '2021-05-24 20:27:33.060000', '0');
INSERT INTO `app01_charge` VALUES ('25', '2021-05-27 20:29:11.875223', '0');
INSERT INTO `app01_charge` VALUES ('26', '2021-05-27 20:29:33.870322', '270');
INSERT INTO `app01_charge` VALUES ('27', '2021-05-27 20:38:01.610432', '378');

-- ----------------------------
-- Table structure for app01_extra_charge
-- ----------------------------
DROP TABLE IF EXISTS `app01_extra_charge`;
CREATE TABLE `app01_extra_charge` (
  `id` int NOT NULL AUTO_INCREMENT,
  `carnum` varchar(32) NOT NULL,
  `vip_begintime` datetime(6) DEFAULT NULL,
  `vip_deadline` datetime(6) DEFAULT NULL,
  `money` int NOT NULL,
  `is_valid` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app01_extra_charge
-- ----------------------------
INSERT INTO `app01_extra_charge` VALUES ('2', '鄂E57V20', '2021-05-12 06:00:00.000000', null, '0', '1');
INSERT INTO `app01_extra_charge` VALUES ('3', '鄂AY5M47', '2021-05-12 12:00:00.000000', null, '0', '1');

-- ----------------------------
-- Table structure for app01_license_plate
-- ----------------------------
DROP TABLE IF EXISTS `app01_license_plate`;
CREATE TABLE `app01_license_plate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `car_img` varchar(100) DEFAULT NULL,
  `is_inside` tinyint(1) NOT NULL,
  `car_num` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_license_plate_car_img_bf83957e_uniq` (`car_img`),
  UNIQUE KEY `car_num` (`car_num`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app01_license_plate
-- ----------------------------
INSERT INTO `app01_license_plate` VALUES ('1', 'car_imgs/eA1RU29.jpg', '0', '鄂A1RU29');
INSERT INTO `app01_license_plate` VALUES ('2', 'car_imgs/eA97PQ2.jpg', '0', '鄂A97PQ2');
INSERT INTO `app01_license_plate` VALUES ('3', 'car_imgs/eAC9795.jpg', '1', '鄂AC9795');
INSERT INTO `app01_license_plate` VALUES ('13', 'car_imgs/eA70HB0.jpg', '0', '鄂A70HB0');
INSERT INTO `app01_license_plate` VALUES ('14', 'car_imgs/eA20304.jpg', '0', '鄂A20304');
INSERT INTO `app01_license_plate` VALUES ('15', 'car_imgs/eA118L4.jpg', '0', '鄂A118L4');
INSERT INTO `app01_license_plate` VALUES ('16', 'car_imgs/eA35231.jpg', '1', '鄂A35231');
INSERT INTO `app01_license_plate` VALUES ('17', 'car_imgs/eA999B9.jpg', '1', '鄂A999B9');
INSERT INTO `app01_license_plate` VALUES ('18', 'car_imgs/eAC5A38.jpg', '0', '鄂AC5A38');
INSERT INTO `app01_license_plate` VALUES ('19', 'car_imgs/eL1L079.jpg', '0', '鄂L1L079');
INSERT INTO `app01_license_plate` VALUES ('20', 'car_imgs/eBCE663.jpg', '0', '鄂BCE663');
INSERT INTO `app01_license_plate` VALUES ('21', 'car_imgs/eFKT085.jpg', '1', '鄂FKT085');
INSERT INTO `app01_license_plate` VALUES ('22', 'car_imgs/eFPQ007.jpg', '1', '鄂FPQ007');
INSERT INTO `app01_license_plate` VALUES ('23', 'car_imgs/eR86803.jpg', '1', '鄂R86803');
INSERT INTO `app01_license_plate` VALUES ('24', 'car_imgs/eAF05V6.jpg', '1', '鄂AF05V6');
INSERT INTO `app01_license_plate` VALUES ('25', 'car_imgs/eA41840.jpg', '0', null);
INSERT INTO `app01_license_plate` VALUES ('26', 'car_imgs/eABY458.jpg', '0', null);
INSERT INTO `app01_license_plate` VALUES ('27', 'car_imgs/cAFQ263.jpg', '0', '川AFQ263');
INSERT INTO `app01_license_plate` VALUES ('28', 'car_imgs/eAL8T81.jpg', '0', '鄂AL8T81');
INSERT INTO `app01_license_plate` VALUES ('29', 'car_imgs/eB09234.jpg', '1', '鄂B09234');
INSERT INTO `app01_license_plate` VALUES ('31', 'car_imgs/eD3Z652.jpg', '1', '鄂D3Z652');
INSERT INTO `app01_license_plate` VALUES ('32', 'car_imgs/eAC5U37.jpg', '1', '鄂AC5U33');
INSERT INTO `app01_license_plate` VALUES ('34', 'car_imgs/eA68Y8P.jpg', '0', null);
INSERT INTO `app01_license_plate` VALUES ('35', 'car_imgs/eAH45H5.jpg', '1', '鄂AH45H5');
INSERT INTO `app01_license_plate` VALUES ('36', 'car_imgs/eE57V20.jpg', '1', '鄂E57V20');
INSERT INTO `app01_license_plate` VALUES ('37', 'car_imgs/eA931R3.jpg', '0', null);
INSERT INTO `app01_license_plate` VALUES ('38', 'car_imgs/eA83P99.jpg', '1', '鄂A83P99');
INSERT INTO `app01_license_plate` VALUES ('39', 'car_imgs/eN6HF65.jpg', '1', '鄂N6HF65');
INSERT INTO `app01_license_plate` VALUES ('40', 'car_imgs/eA863Q8.jpg', '1', '鄂A863Q8');
INSERT INTO `app01_license_plate` VALUES ('41', 'car_imgs/eB5BM11.jpg', '1', '鄂B5BM11');
INSERT INTO `app01_license_plate` VALUES ('42', 'car_imgs/eD3B331.jpg', '1', '鄂D3B331');
INSERT INTO `app01_license_plate` VALUES ('43', 'car_imgs/eAJ54P5.jpg', '0', '鄂AJ54P5');
INSERT INTO `app01_license_plate` VALUES ('44', 'car_imgs/eB6X708.jpg', '0', '鄂B6X708');
INSERT INTO `app01_license_plate` VALUES ('45', 'car_imgs/eA94AN8.jpg', '1', '鄂A94AN8');
INSERT INTO `app01_license_plate` VALUES ('46', 'car_imgs/eA07012.jpg', '1', '鄂A07012');
INSERT INTO `app01_license_plate` VALUES ('47', 'car_imgs/eS789A0.jpg', '1', '鄂S789A0');
INSERT INTO `app01_license_plate` VALUES ('48', 'car_imgs/eF8C520.jpg', '1', '鄂F8C520');
INSERT INTO `app01_license_plate` VALUES ('49', 'car_imgs/eL3C020.jpg', '0', '鄂L3C020');
INSERT INTO `app01_license_plate` VALUES ('50', 'car_imgs/eADP245.jpg', '1', '鄂ADP245');
INSERT INTO `app01_license_plate` VALUES ('51', 'car_imgs/eEZ075N.jpg', '0', null);
INSERT INTO `app01_license_plate` VALUES ('52', 'car_imgs/eSKL773.jpg', '0', null);
INSERT INTO `app01_license_plate` VALUES ('53', 'car_imgs/eL0Y136.jpg', '1', '鄂L0Y136');
INSERT INTO `app01_license_plate` VALUES ('54', 'car_imgs/eA645K2.jpg', '0', '鄂A645K2');
INSERT INTO `app01_license_plate` VALUES ('55', 'car_imgs/eB8B529.jpg', '1', '鄂B8B529');
INSERT INTO `app01_license_plate` VALUES ('56', 'car_imgs/eA92FP2.jpg', '0', '鄂A92FP2');
INSERT INTO `app01_license_plate` VALUES ('58', 'car_imgs/cAG338B.jpg', '0', null);
INSERT INTO `app01_license_plate` VALUES ('60', 'car_imgs/eA90CC0.jpg', '1', '鄂A90CC0');
INSERT INTO `app01_license_plate` VALUES ('61', 'car_imgs/eB38538.jpg', '1', '鄂B38538');
INSERT INTO `app01_license_plate` VALUES ('62', 'car_imgs/eB8PD18.jpg', '1', '鄂B8PD18');
INSERT INTO `app01_license_plate` VALUES ('63', 'car_imgs/eSK5X82.jpg', '0', '鄂SK5X82');
INSERT INTO `app01_license_plate` VALUES ('67', 'car_imgs/eAKG067.jpg', '1', '鄂AKG067');
INSERT INTO `app01_license_plate` VALUES ('68', 'car_imgs/eA89AS0.jpg', '0', null);
INSERT INTO `app01_license_plate` VALUES ('69', 'car_imgs/eA43392.jpg', '0', null);
INSERT INTO `app01_license_plate` VALUES ('70', 'car_imgs/eAY5M47.jpg', '1', '鄂AY5M47');
INSERT INTO `app01_license_plate` VALUES ('71', 'car_imgs/eFKA160.jpg', '0', null);
INSERT INTO `app01_license_plate` VALUES ('72', 'car_imgs/eE12P89.jpg', '0', '鄂E12P89');
INSERT INTO `app01_license_plate` VALUES ('73', 'car_imgs/eSC3D39.jpg', '1', '鄂SC3D39');
INSERT INTO `app01_license_plate` VALUES ('74', 'car_imgs/eSKH232.jpg', '1', '鄂SKH232');
INSERT INTO `app01_license_plate` VALUES ('75', 'car_imgs/eA89WH5.jpg', '1', '鄂A89WH5');
INSERT INTO `app01_license_plate` VALUES ('76', 'car_imgs/eB6CZ89.jpg', '1', '鄂B6CZ89');
INSERT INTO `app01_license_plate` VALUES ('77', 'car_imgs/eA99L3G.jpg', '1', '鄂A99L3G');
INSERT INTO `app01_license_plate` VALUES ('78', 'car_imgs/eB1U997.jpg', '1', '鄂B1U997');
INSERT INTO `app01_license_plate` VALUES ('79', 'car_imgs/eA22F68.jpg', '1', '鄂A22F68');

-- ----------------------------
-- Table structure for app01_user
-- ----------------------------
DROP TABLE IF EXISTS `app01_user`;
CREATE TABLE `app01_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `carnum` varchar(32) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `level` int NOT NULL,
  `begintime` datetime(6) NOT NULL,
  `endtime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `carnum` (`carnum`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app01_user
-- ----------------------------
INSERT INTO `app01_user` VALUES ('4', '陈曦', '鄂AKG067', '15827150811', '1', '2021-05-12 14:46:59.000000', '2021-06-10 22:37:00.000000');
INSERT INTO `app01_user` VALUES ('5', '王勉', '鄂AC28M8', '15827456811', '2', '2021-04-09 22:37:00.000000', '2021-07-11 22:37:00.000000');
INSERT INTO `app01_user` VALUES ('12', '程铭威', '鄂AC28M2', '15827150833', '4', '2021-04-10 20:23:17.000000', '2022-04-10 20:23:17.000000');
INSERT INTO `app01_user` VALUES ('13', '李浩', '鄂AF28M5', '15972009966', '2', '2021-04-10 20:23:37.000000', '2021-07-12 20:23:37.000000');
INSERT INTO `app01_user` VALUES ('19', '陈逸飞', '鄂AC99M2', '15825650811', '3', '2021-04-11 14:20:28.000000', '2021-10-14 14:20:28.000000');
INSERT INTO `app01_user` VALUES ('30', '陈诗琪', '鄂AC01M3', '15824650811', '0', '2021-04-12 13:57:05.000000', '2021-05-13 13:57:05.000000');
INSERT INTO `app01_user` VALUES ('32', '小明', '鄂A1RU29', '15827150816', '2', '2021-04-19 10:53:02.000000', '2021-07-21 10:53:02.000000');
INSERT INTO `app01_user` VALUES ('33', '小王', '鄂A20304', '15827150895', '2', '2021-04-22 15:39:22.000000', '2021-07-24 15:39:22.000000');
INSERT INTO `app01_user` VALUES ('34', '老王', '鄂A999B9', '15827150946', '1', '2021-05-07 16:39:08.000000', '2021-11-30 15:08:22.000000');
INSERT INTO `app01_user` VALUES ('35', '迪迦', '鄂E57V20', '15827198633', '0', '2021-04-12 06:00:00.000000', '2021-05-12 06:00:00.000000');
INSERT INTO `app01_user` VALUES ('38', '陈测', '鄂AY5M47', '18971466873', '0', '2021-04-12 12:00:00.000000', '2021-05-12 12:00:00.000000');
INSERT INTO `app01_user` VALUES ('39', '陈飞', '鄂SK5X82', '18971466855', '1', '2021-05-12 12:00:00.000000', '2021-06-12 12:00:00.000000');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('14', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('16', 'Can view user', '4', 'view_user');
INSERT INTO `auth_permission` VALUES ('17', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('18', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('20', 'Can view content type', '5', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('21', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('22', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('24', 'Can view session', '6', 'view_session');
INSERT INTO `auth_permission` VALUES ('25', 'Can add administrator', '7', 'add_administrator');
INSERT INTO `auth_permission` VALUES ('26', 'Can change administrator', '7', 'change_administrator');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete administrator', '7', 'delete_administrator');
INSERT INTO `auth_permission` VALUES ('28', 'Can view administrator', '7', 'view_administrator');
INSERT INTO `auth_permission` VALUES ('29', 'Can add user', '8', 'add_user');
INSERT INTO `auth_permission` VALUES ('30', 'Can change user', '8', 'change_user');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete user', '8', 'delete_user');
INSERT INTO `auth_permission` VALUES ('32', 'Can view user', '8', 'view_user');
INSERT INTO `auth_permission` VALUES ('33', 'Can add car_manage', '9', 'add_car_manage');
INSERT INTO `auth_permission` VALUES ('34', 'Can change car_manage', '9', 'change_car_manage');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete car_manage', '9', 'delete_car_manage');
INSERT INTO `auth_permission` VALUES ('36', 'Can view car_manage', '9', 'view_car_manage');
INSERT INTO `auth_permission` VALUES ('37', 'Can add car_record', '10', 'add_car_record');
INSERT INTO `auth_permission` VALUES ('38', 'Can change car_record', '10', 'change_car_record');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete car_record', '10', 'delete_car_record');
INSERT INTO `auth_permission` VALUES ('40', 'Can view car_record', '10', 'view_car_record');
INSERT INTO `auth_permission` VALUES ('41', 'Can add license_plate', '11', 'add_license_plate');
INSERT INTO `auth_permission` VALUES ('42', 'Can change license_plate', '11', 'change_license_plate');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete license_plate', '11', 'delete_license_plate');
INSERT INTO `auth_permission` VALUES ('44', 'Can view license_plate', '11', 'view_license_plate');
INSERT INTO `auth_permission` VALUES ('45', 'Can add charge', '12', 'add_charge');
INSERT INTO `auth_permission` VALUES ('46', 'Can change charge', '12', 'change_charge');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete charge', '12', 'delete_charge');
INSERT INTO `auth_permission` VALUES ('48', 'Can view charge', '12', 'view_charge');
INSERT INTO `auth_permission` VALUES ('49', 'Can add car_in_record', '13', 'add_car_in_record');
INSERT INTO `auth_permission` VALUES ('50', 'Can change car_in_record', '13', 'change_car_in_record');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete car_in_record', '13', 'delete_car_in_record');
INSERT INTO `auth_permission` VALUES ('52', 'Can view car_in_record', '13', 'view_car_in_record');
INSERT INTO `auth_permission` VALUES ('53', 'Can add car_out_record', '14', 'add_car_out_record');
INSERT INTO `auth_permission` VALUES ('54', 'Can change car_out_record', '14', 'change_car_out_record');
INSERT INTO `auth_permission` VALUES ('55', 'Can delete car_out_record', '14', 'delete_car_out_record');
INSERT INTO `auth_permission` VALUES ('56', 'Can view car_out_record', '14', 'view_car_out_record');
INSERT INTO `auth_permission` VALUES ('57', 'Can add extra_charge', '15', 'add_extra_charge');
INSERT INTO `auth_permission` VALUES ('58', 'Can change extra_charge', '15', 'change_extra_charge');
INSERT INTO `auth_permission` VALUES ('59', 'Can delete extra_charge', '15', 'delete_extra_charge');
INSERT INTO `auth_permission` VALUES ('60', 'Can view extra_charge', '15', 'view_extra_charge');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$150000$4FLfiJfC5hir$6CHJUEiQ7sIHw3xvNdKIHKIFPEQk1pw/I8rCVcqUSdg=', '2021-04-17 20:37:16.299202', '1', 'cx', '', '', '1312046617@qq.com', '1', '1', '2021-04-17 15:47:45.011880');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2021-04-17 15:54:39.741988', '1', 'License_plate object (1)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2021-04-17 15:54:52.042242', '2', 'License_plate object (2)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2021-04-17 15:54:57.000373', '3', 'License_plate object (3)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2021-04-17 15:55:01.381331', '4', 'License_plate object (4)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2021-04-17 15:55:06.038878', '5', 'License_plate object (5)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2021-04-17 15:55:11.888037', '6', 'License_plate object (6)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2021-04-17 15:55:16.027381', '7', 'License_plate object (7)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2021-04-17 15:55:20.901536', '8', 'License_plate object (8)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2021-04-17 15:55:24.974968', '9', 'License_plate object (9)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2021-04-17 15:55:29.975807', '10', 'License_plate object (10)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('11', '2021-04-17 15:55:34.877343', '11', 'License_plate object (11)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('12', '2021-04-17 15:57:31.318178', '12', 'License_plate object (12)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('13', '2021-04-17 15:57:44.761367', '13', 'License_plate object (13)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('14', '2021-04-17 15:57:49.886241', '14', 'License_plate object (14)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('15', '2021-04-17 15:57:54.750642', '15', 'License_plate object (15)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('16', '2021-04-17 15:58:10.259004', '16', 'License_plate object (16)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('17', '2021-04-17 15:58:17.933921', '17', 'License_plate object (17)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('18', '2021-04-17 15:58:23.964805', '18', 'License_plate object (18)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('19', '2021-04-17 15:58:35.754858', '19', 'License_plate object (19)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('20', '2021-04-17 15:58:41.813116', '20', 'License_plate object (20)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('21', '2021-04-17 15:59:03.718497', '21', 'License_plate object (21)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('22', '2021-04-17 15:59:10.834067', '22', 'License_plate object (22)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('23', '2021-04-17 15:59:15.895199', '23', 'License_plate object (23)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('24', '2021-04-17 15:59:33.104639', '24', 'License_plate object (24)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('25', '2021-04-17 16:00:07.058463', '25', 'License_plate object (25)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('26', '2021-04-17 16:00:13.891231', '26', 'License_plate object (26)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('27', '2021-04-17 16:00:20.893056', '27', 'License_plate object (27)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('28', '2021-04-17 16:00:26.497034', '28', 'License_plate object (28)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('29', '2021-04-17 16:00:31.706323', '29', 'License_plate object (29)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('30', '2021-04-17 16:00:36.560312', '30', 'License_plate object (30)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('31', '2021-04-17 16:00:42.105666', '31', 'License_plate object (31)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('32', '2021-04-17 16:00:49.182688', '32', 'License_plate object (32)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('33', '2021-04-17 16:00:56.734974', '33', 'License_plate object (33)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('34', '2021-04-17 16:01:03.592108', '34', 'License_plate object (34)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('35', '2021-04-17 16:01:40.450443', '35', 'License_plate object (35)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('36', '2021-04-17 16:01:48.358965', '36', 'License_plate object (36)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('37', '2021-04-17 16:02:05.345972', '37', 'License_plate object (37)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('38', '2021-04-17 16:02:12.234847', '38', 'License_plate object (38)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('39', '2021-04-17 16:02:17.342436', '39', 'License_plate object (39)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('40', '2021-04-17 16:02:22.070206', '40', 'License_plate object (40)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('41', '2021-04-17 16:02:30.084109', '41', 'License_plate object (41)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('42', '2021-04-17 16:02:36.059090', '42', 'License_plate object (42)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('43', '2021-04-17 16:02:42.911125', '43', 'License_plate object (43)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('44', '2021-04-17 16:02:49.272062', '44', 'License_plate object (44)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('45', '2021-04-17 16:02:54.687918', '45', 'License_plate object (45)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('46', '2021-04-17 16:03:00.646613', '46', 'License_plate object (46)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('47', '2021-04-17 16:03:05.258665', '47', 'License_plate object (47)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('48', '2021-04-17 16:03:09.883466', '48', 'License_plate object (48)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('49', '2021-04-17 16:03:13.636852', '49', 'License_plate object (49)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('50', '2021-04-17 16:03:17.626518', '50', 'License_plate object (50)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('51', '2021-04-17 16:04:17.844403', '51', 'License_plate object (51)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('52', '2021-04-17 16:04:22.337785', '52', 'License_plate object (52)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('53', '2021-04-17 16:04:26.554462', '53', 'License_plate object (53)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('54', '2021-04-17 16:04:31.257873', '54', 'License_plate object (54)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('55', '2021-04-17 16:04:36.574012', '55', 'License_plate object (55)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('56', '2021-04-17 16:04:41.320932', '56', 'License_plate object (56)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('57', '2021-04-17 16:04:46.833559', '57', 'License_plate object (57)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('58', '2021-04-17 16:04:51.067394', '58', 'License_plate object (58)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('59', '2021-04-17 16:04:55.434048', '59', 'License_plate object (59)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('60', '2021-04-17 16:04:59.134275', '60', 'License_plate object (60)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('61', '2021-04-17 16:05:03.456654', '61', 'License_plate object (61)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('62', '2021-04-17 16:05:07.804176', '62', 'License_plate object (62)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('63', '2021-04-17 16:05:12.687060', '63', 'License_plate object (63)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('64', '2021-04-17 16:05:17.651331', '64', 'License_plate object (64)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('65', '2021-04-17 16:05:23.765545', '65', 'License_plate object (65)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('66', '2021-04-17 16:05:28.228640', '66', 'License_plate object (66)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('67', '2021-04-17 16:05:33.402601', '67', 'License_plate object (67)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('68', '2021-04-17 16:05:37.983371', '68', 'License_plate object (68)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('69', '2021-04-17 16:05:43.018914', '69', 'License_plate object (69)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('70', '2021-04-17 16:05:46.826148', '70', 'License_plate object (70)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('71', '2021-04-17 16:05:51.375734', '71', 'License_plate object (71)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('72', '2021-04-17 16:05:55.823987', '72', 'License_plate object (72)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('73', '2021-04-17 16:06:00.493509', '73', 'License_plate object (73)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('74', '2021-04-17 16:06:07.095369', '74', 'License_plate object (74)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('75', '2021-04-17 16:06:12.407845', '75', 'License_plate object (75)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('76', '2021-04-17 16:06:17.875266', '76', 'License_plate object (76)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('77', '2021-04-17 16:06:24.401778', '77', 'License_plate object (77)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('78', '2021-04-17 16:06:29.286135', '78', 'License_plate object (78)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('79', '2021-04-17 16:06:34.551582', '79', 'License_plate object (79)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('80', '2021-04-17 16:06:38.316514', '80', 'License_plate object (80)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('81', '2021-04-17 16:06:42.586511', '81', 'License_plate object (81)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('82', '2021-04-17 16:06:46.508786', '82', 'License_plate object (82)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('83', '2021-04-17 16:06:50.001806', '83', 'License_plate object (83)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('84', '2021-04-17 16:06:53.817165', '84', 'License_plate object (84)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('85', '2021-04-17 16:07:03.213038', '85', 'License_plate object (85)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('86', '2021-04-17 16:07:07.377199', '86', 'License_plate object (86)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('87', '2021-04-17 16:07:11.373168', '87', 'License_plate object (87)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('88', '2021-04-17 16:07:15.569013', '88', 'License_plate object (88)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('89', '2021-04-17 16:07:18.988963', '89', 'License_plate object (89)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('90', '2021-04-17 16:07:22.947359', '90', 'License_plate object (90)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('91', '2021-04-17 16:07:26.628871', '91', 'License_plate object (91)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('92', '2021-04-17 16:07:30.586087', '92', 'License_plate object (92)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('93', '2021-04-17 16:07:34.206409', '93', 'License_plate object (93)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('94', '2021-04-17 16:07:38.945905', '94', 'License_plate object (94)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('95', '2021-04-17 16:07:42.797606', '95', 'License_plate object (95)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('96', '2021-04-17 16:07:47.130527', '96', 'License_plate object (96)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('97', '2021-04-17 16:07:50.996374', '97', 'License_plate object (97)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('98', '2021-04-17 16:07:54.766910', '98', 'License_plate object (98)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('99', '2021-04-17 16:07:57.919195', '99', 'License_plate object (99)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('100', '2021-04-17 16:08:02.256595', '100', 'License_plate object (100)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('101', '2021-04-17 16:08:03.903193', '101', 'License_plate object (101)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('102', '2021-04-17 16:08:27.646825', '101', 'License_plate object (101)', '3', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('103', '2021-04-17 20:37:54.378248', '102', 'License_plate object (102)', '1', '[{\"added\": {}}]', '11', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('7', 'app01', 'administrator');
INSERT INTO `django_content_type` VALUES ('13', 'app01', 'car_in_record');
INSERT INTO `django_content_type` VALUES ('9', 'app01', 'car_manage');
INSERT INTO `django_content_type` VALUES ('14', 'app01', 'car_out_record');
INSERT INTO `django_content_type` VALUES ('10', 'app01', 'car_record');
INSERT INTO `django_content_type` VALUES ('12', 'app01', 'charge');
INSERT INTO `django_content_type` VALUES ('15', 'app01', 'extra_charge');
INSERT INTO `django_content_type` VALUES ('11', 'app01', 'license_plate');
INSERT INTO `django_content_type` VALUES ('8', 'app01', 'user');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2021-04-08 03:03:45.020707');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2021-04-08 03:03:45.249001');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2021-04-08 03:03:45.834070');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2021-04-08 03:03:45.976744');
INSERT INTO `django_migrations` VALUES ('5', 'admin', '0003_logentry_add_action_flag_choices', '2021-04-08 03:03:45.992667');
INSERT INTO `django_migrations` VALUES ('7', 'contenttypes', '0002_remove_content_type_name', '2021-04-08 03:03:46.239893');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0002_alter_permission_name_max_length', '2021-04-08 03:03:46.303949');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0003_alter_user_email_max_length', '2021-04-08 03:03:46.388197');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0004_alter_user_username_opts', '2021-04-08 03:03:46.399054');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0005_alter_user_last_login_null', '2021-04-08 03:03:46.461356');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0006_require_contenttypes_0002', '2021-04-08 03:03:46.467222');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0007_alter_validators_add_error_messages', '2021-04-08 03:03:46.480189');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0008_alter_user_username_max_length', '2021-04-08 03:03:46.555088');
INSERT INTO `django_migrations` VALUES ('15', 'auth', '0009_alter_user_last_name_max_length', '2021-04-08 03:03:46.665056');
INSERT INTO `django_migrations` VALUES ('16', 'auth', '0010_alter_group_name_max_length', '2021-04-08 03:03:46.728807');
INSERT INTO `django_migrations` VALUES ('17', 'auth', '0011_update_proxy_permissions', '2021-04-08 03:03:46.739778');
INSERT INTO `django_migrations` VALUES ('18', 'sessions', '0001_initial', '2021-04-08 03:03:46.783804');
INSERT INTO `django_migrations` VALUES ('19', 'app01', '0001_initial', '2021-04-08 03:29:56.991728');
INSERT INTO `django_migrations` VALUES ('20', 'app01', '0002_user', '2021-04-09 06:56:52.013048');
INSERT INTO `django_migrations` VALUES ('26', 'app01', '0003_car_manage_car_record_license_plate', '2021-04-18 17:54:41.510089');
INSERT INTO `django_migrations` VALUES ('27', 'app01', '0004_auto_20210418_1813', '2021-04-18 18:13:44.634746');
INSERT INTO `django_migrations` VALUES ('28', 'app01', '0005_license_plate_car_num', '2021-04-21 15:55:11.458423');
INSERT INTO `django_migrations` VALUES ('29', 'app01', '0006_charge', '2021-04-27 14:19:42.090615');
INSERT INTO `django_migrations` VALUES ('30', 'app01', '0007_car_in_record_car_out_record', '2021-04-29 13:57:44.408583');
INSERT INTO `django_migrations` VALUES ('31', 'app01', '0008_extra_charge', '2021-05-07 15:54:32.936986');
INSERT INTO `django_migrations` VALUES ('32', 'app01', '0009_remove_extra_charge_is_valid', '2021-05-07 22:36:52.708121');
INSERT INTO `django_migrations` VALUES ('33', 'app01', '0010_extra_charge_is_valid', '2021-05-07 22:44:56.145215');
INSERT INTO `django_migrations` VALUES ('34', 'app01', '0011_auto_20210513_1057', '2021-05-13 10:57:25.922977');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
