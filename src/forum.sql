/*
Navicat MySQL Data Transfer

Source Server         : x3408
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : forum

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-03-29 15:07:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) DEFAULT NULL,
  `headPortrait` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `uid_name` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `comment_content` varchar(255) DEFAULT NULL,
  `comment_Topic_id` int(11) DEFAULT NULL,
  `comment_User_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKo1yta49ugmv3ahmb4nyan0ps9` (`comment_Topic_id`),
  KEY `FKa5c1pyl3ilmwjhyr71uicrmsw` (`comment_User_id`),
  CONSTRAINT `FKa5c1pyl3ilmwjhyr71uicrmsw` FOREIGN KEY (`comment_User_id`) REFERENCES `user` (`uid`),
  CONSTRAINT `FKo1yta49ugmv3ahmb4nyan0ps9` FOREIGN KEY (`comment_Topic_id`) REFERENCES `topic` (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for `recommend`
-- ----------------------------
DROP TABLE IF EXISTS `recommend`;
CREATE TABLE `recommend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recommend_image` varchar(255) DEFAULT NULL,
  `recommend_topic` varchar(255) DEFAULT NULL,
  `recommend_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recommend
-- ----------------------------

-- ----------------------------
-- Table structure for `relation`
-- ----------------------------
DROP TABLE IF EXISTS `relation`;
CREATE TABLE `relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) DEFAULT NULL,
  `follow_uid` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of relation
-- ----------------------------
INSERT INTO `relation` VALUES ('1', '52addfd6626fc1b701626fd323480000', '52addfd6626fc1b701626fd6110e0001', '1');
INSERT INTO `relation` VALUES ('2', '52addfd6626fc1b701626fd6110e0001', '52addfd6626fc1b701626fd323480000', '2');
INSERT INTO `relation` VALUES ('3', '52addfd6626fc1b701626fd323480000', '52addfd6626fc1b701626febaed90002', '1');
INSERT INTO `relation` VALUES ('4', '52addfd6626fc1b701626febaed90002', '52addfd6626fc1b701626fd323480000', '2');
INSERT INTO `relation` VALUES ('5', '52addfd6626fa9d201626fabce720000', '52addfd6626fc1b701626fd323480000', '1');
INSERT INTO `relation` VALUES ('6', '52addfd6626fc1b701626fd323480000', '52addfd6626fa9d201626fabce720000', '2');

-- ----------------------------
-- Table structure for `topic`
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `descriptive` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `viewCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('3', 'diary', '52addfd6626fa9d201626fabce720000', '健身日记 20161228 训练方法变换', '补充前天硬拉重量上升至 60g，肌肉感觉良好。  ', '/TopicContent/20180329/null20180329111029.html', '2018-03-29 11:10:30', '1');
INSERT INTO `topic` VALUES ('4', 'diary', '52addfd6626fa9d201626fabce720000', '健身 | 如何挑选瑜伽垫？选个小垫子也有大学问。', '', '/TopicContent/20180329/null20180329113038.html', '2018-03-29 11:30:38', '4');
INSERT INTO `topic` VALUES ('5', 'diary', '52addfd6626fc1b701626fd323480000', '健身', '', '/TopicContent/20180329/null20180329113601.html', '2018-03-29 11:36:01', '2');
INSERT INTO `topic` VALUES ('7', 'diary', '52addfd6626fc1b701626fd6110e0001', '个人健身日志', '', '/TopicContent/20180329/null20180329113903.html', '2018-03-29 11:39:03', '3');
INSERT INTO `topic` VALUES ('9', 'diary', '52addfd6626fc1b701626febaed90002', '猫奴の健身日常 | 如何用家中的 喵星人 健身 ？', '作为一名为四只喵星人服务的 专业铲屎官 可谓是为我的喵主子们 “尽心尽力”！    以上 4只 便是', '/TopicContent/20180329/null20180329122019.html', '2018-03-29 12:20:19', '3');
INSERT INTO `topic` VALUES ('11', 'action', '52addfd6626fc1b701626febaed90002', '【健身知识科普】学习健身的14个基本要领', '', '/TopicContent/20180329/null20180329122250.html', '2018-03-29 12:22:50', '2');
INSERT INTO `topic` VALUES ('12', 'action', '52addfd6626fc1b701626febaed90002', '跑步健身方法与要领', '  跑步的作用：跑步可以保护心脏，心脏是人体易衰老的重要***，心脏的功能正常对其它内脏***功能有', '/TopicContent/20180329/null20180329122434.html', '2018-03-29 12:24:35', '1');
INSERT INTO `topic` VALUES ('13', 'action', '52addfd6626fc1b701626fd323480000', '【关于动作那些事儿】动作基本要领', '动作基本要领：   随着音乐，腿向前跨步或退步，弯曲膝盖，将胯顶向一侧，注意手的动作配合拧胯动作，以', '/TopicContent/20180329/null20180329122846.html', '2018-03-29 12:28:47', '2');
INSERT INTO `topic` VALUES ('15', 'result_show', '52addfd6626fc1b701626fd323480000', '椭圆机品鉴 详解美国爱康两款经典椭圆机', '在全民健身的时代，健身不再是高端阶层的专利。比如，随处可见的健身房是年轻人的天堂，动感十足的广场舞丰', '/TopicContent/20180329/null20180329123310.html', '2018-03-29 12:33:10', '0');
INSERT INTO `topic` VALUES ('16', 'result_show', '52addfd6626fc1b701626fd323480000', '用TRX来练习引体向上（从易到难）', '使用 TRX 来练习引体向上（从易到难）   关于“引体向上”怎么练的问题，或是如何完成一下标准的引', '/TopicContent/20180329/null20180329123515.html', '2018-03-29 12:35:15', '1');
INSERT INTO `topic` VALUES ('17', 'result_show', '52addfd6626fc1b701626fd6110e0001', '锻炼一般买多重的哑铃合适，哑铃锻炼的常识', '哑铃选择   锻炼一般要怎么买哑铃，我们建议买可调节时哑铃，重量：男士2kg-20kg；女士1kg-', '/TopicContent/20180329/null20180329123719.html', '2018-03-29 12:37:20', '1');
INSERT INTO `topic` VALUES ('18', 'result_show', '52addfd6626fc1b701626febaed90002', '健身器材使用方法 ', '健身器材，可以说是健身人士的最爱了，没有了它们的帮助，身材不会如此快的呈现出效果来。不过，对于健身新', '/TopicContent/20180329/null20180329124321.html', '2018-03-29 12:43:22', '1');
INSERT INTO `topic` VALUES ('19', 'result_show', '52addfd6626fc1b701626fd323480000', '健身记录（14）每个动作都耳鸣的中级训练', '人体还是太奇妙了，如果一个动作你做的不对，看起来就很难具有美感，是松懈的，无精打采的。一旦做对了，旁', '/TopicContent/20180329/null20180329124506.html', '2018-03-29 12:45:07', '2');
INSERT INTO `topic` VALUES ('20', 'result_show', '52addfd6626fc1b701626fd323480000', '减肥餐设计与健身|公众微信fitness_d', '', '/TopicContent/20180329/null20180329124803.html', '2018-03-29 12:48:04', '3');
INSERT INTO `topic` VALUES ('21', 'result_show', '52addfd6626fa9d201626fabce720000', '健身日记 20161228 训练方法变换', '补充前天硬拉重量上升至 60g，肌肉感觉良好。 ', '/TopicContent/20180329/null20180329111029.html', '2018-03-29 11:10:30', '1');
INSERT INTO `topic` VALUES ('22', 'result_show', '52addfd6626fc1b701626febaed90002', '健身 | 如何挑选瑜伽垫？选个小垫子也有大学问。', null, '/TopicContent/20180329/null20180329113038.html', '2018-03-29 11:30:38', '4');
INSERT INTO `topic` VALUES ('23', 'result_show', '52addfd6626fc1b701626febaed90002', '猫奴の健身日常 | 如何用家中的 喵星人 健身 ？', '  以上 4只 便是', '/TopicContent/20180329/null20180329122019.html', '2018-03-29 12:20:19', '12');
INSERT INTO `topic` VALUES ('24', 'result_show', '52addfd6626fc1b701626fd323480000', '【关于动作那些事儿】动作基本要领', '在全民健身的时代，健身不再是高端阶层的专利。比如，随处可见的健身房是年轻人的天堂，动感十足的广场舞丰', '/TopicContent/20180329/null20180329123310.html', '2018-03-29 12:33:10', '0');
INSERT INTO `topic` VALUES ('25', 'result_show', '52addfd6626fc1b701626fd323480000', '健身', null, '/TopicContent/20180329/null20180329113601.html', '2018-03-29 11:36:01', '2');
INSERT INTO `topic` VALUES ('26', 'result_show', '52addfd6626fc1b701626fd6110e0001', '健身 务实话 不拐弯抹角', '', '/TopicContent/20180329/null20180329125711.html', '2018-03-29 12:57:12', '1');
INSERT INTO `topic` VALUES ('27', 'result_show', '52addfd6626fc1b701626febaed90002', '【健身知识科普】学习健身的14个基本要领', null, '/TopicContent/20180329/null20180329122250.html', '2018-03-29 12:22:50', '2');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `headPortrait` varchar(255) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('52addfd6626fa9d201626fabce720000', '老许', null, '123', null, 'default.ico', null);
INSERT INTO `user` VALUES ('52addfd6626fc1b701626fd323480000', 'x3408', null, '123', '', '20180329125342_809.e49c7971-7cba-46fe-86ea-c4af9da79846.jpg', '懒。。。');
INSERT INTO `user` VALUES ('52addfd6626fc1b701626fd6110e0001', '单身汪', null, '123', '女', '20180329114102_223.308cf6d5-4795-418b-90d8-99638cfd324b.jpg', '高贵的单身汪');
INSERT INTO `user` VALUES ('52addfd6626fc1b701626febaed90002', 'xhh', null, 'xhh', 'nv', 'default.ico', 'dbaskjdbkjas');
