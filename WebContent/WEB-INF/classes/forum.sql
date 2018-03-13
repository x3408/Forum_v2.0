/*
Navicat MySQL Data Transfer

Source Server         : x3408
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : forum

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-03-11 13:52:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `relation`
-- ----------------------------
DROP TABLE IF EXISTS `relation`;
CREATE TABLE `relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) DEFAULT NULL,
  `follow_uid` varchar(255) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of relation
-- ----------------------------
INSERT INTO `relation` VALUES ('3', '1', '2', '1');
INSERT INTO `relation` VALUES ('4', '2', '1', '2');

-- ----------------------------
-- Table structure for `reverts`
-- ----------------------------
DROP TABLE IF EXISTS `reverts`;
CREATE TABLE `reverts` (
  `rid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `agree` int(11) DEFAULT NULL,
  PRIMARY KEY (`rid`),
  KEY `FKmjlqpxj1mn61iynoy7lj0r82x` (`tid`),
  CONSTRAINT `FKmjlqpxj1mn61iynoy7lj0r82x` FOREIGN KEY (`tid`) REFERENCES `topic` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reverts
-- ----------------------------
INSERT INTO `reverts` VALUES ('1', '1', '2', '精彩', '2018-03-01 00:00:00', '0');

-- ----------------------------
-- Table structure for `topic`
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `tid` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  `uid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `descriptive` varchar(255) DEFAULT NULL,
  `content` blob NOT NULL,
  `time` datetime NOT NULL,
  `viewCount` int(20) DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('1', '1', '1', 'hello', 'hello', 0x636F6E74656E74, '2016-10-16 00:00:00', '0');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `accountName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'xc', 'xc', '123', null);
INSERT INTO `user` VALUES ('2', 'qwe', 'qwe', '123', null);
