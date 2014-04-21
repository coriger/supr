/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : suprblog

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2014-04-21 09:08:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `isEnabled` bit(1) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '123456', '\0', '461504978@qq.com');
INSERT INTO `admin` VALUES ('2', 'admin2', '123456', '\0', '461504978@qq.com');
INSERT INTO `admin` VALUES ('3', 'ssdsd', '12312', '\0', 'dfsdsf');
INSERT INTO `admin` VALUES ('5', 'ssdsdsdfsdf', '12312', '\0', 'dfsdsf');
INSERT INTO `admin` VALUES ('6', 'sdaf', 'sdf', '\0', 'asdaf');
INSERT INTO `admin` VALUES ('7', 'asdf23e432', 'sdaf', '\0', 'sadf');

-- ----------------------------
-- Table structure for album
-- ----------------------------
DROP TABLE IF EXISTS `album`;
CREATE TABLE `album` (
  `albumId` int(11) NOT NULL AUTO_INCREMENT,
  `albumName` varchar(45) NOT NULL,
  `albumUrl` varchar(45) DEFAULT NULL,
  `albumInfo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`albumId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of album
-- ----------------------------
INSERT INTO `album` VALUES ('1', '南山', null, '南山一游，好累');
INSERT INTO `album` VALUES ('2', '武汉一游', null, '无聊的很');
INSERT INTO `album` VALUES ('3', '南昌办事处', null, '再也不会去哪儿了');

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `blogId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `publishTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  `userId` int(11) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `tagIds` varchar(145) DEFAULT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  `commentSum` int(11) NOT NULL DEFAULT '0',
  `postFix` int(11) NOT NULL,
  PRIMARY KEY (`blogId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('1', '第一篇文章', '2014-04-18 22:15:06', '2014-04-18 22:15:09', '1', '习主席关于中国梦强军梦重要论述，作为当代中国发展进步的精神旗帜，彰显了强大的凝聚力、感召力和推动力，是引领官兵精神生长的思想行动指南和动力源泉。\r\n\r\n　　我党我军的政治优势，始终落实到广大党员和官兵的精神生长上，这是战斗力的根本所在。当前，我们正在进行具有许多新的历史特点的伟大斗争，胜利与否的关键在人的精神。青年官兵正处在世界观人生观形成重要时期，精神生长极为紧要。中国梦强军梦展示了坚定的政治信仰，寄托着几代中国人的夙愿和理想，为官兵精神生长提供了信念之基和目标追求，汇聚起了强军兴军的强大正能量。\r\n\r\n　　用中国梦强军梦引领官兵精神生长，首要的是加强理论武装。要解决精神支柱问题，突出学习党的理论创新成果，学习我党我军优良传统，用党中央和中央军委的要求教育官兵，打牢永远听党话跟党走的思想根基。解决精神土壤问题，培养良好的思想道德和行为风尚。领导者的行动，就是理想信念最好的教育内容。各级领导应带头落实“三严三实”，引领官兵人人从修身做起，提高觉悟境界。解决精神营养问题，学以养心，心灵强大，人才有重量，才有立场。\r\n\r\n　　用中国梦强军梦引领官兵精神生长，帮带是基本途径。如何使人人有梦想、知奋斗，既要有内动力，又要有外推力，把每个人都帮起来、带起来。这是因为，官兵个体精神存有差异，必须因人而异做工作，搞帮带。再者从人的成长成才看，无论是手艺人学技能，还是科学家研究重大尖端课题，师傅带徒弟，都是最管用的办法。实践证明，开展帮带活动不仅是一个方法问题，更是把中国梦、强军梦、我的梦对接的重要抓手，是强化基层组织功能、纠正各种错误思想的关键环节，是促进军事训练和密切官兵关系的好形式。\r\n\r\n　　用中国梦强军梦引领官兵精神生长，是政治工作的根本任务。必须培育军人职业精神，磨炼培养官兵认真、吃苦、忧患等品行。必须增强官兵的荣誉感，制定荣誉准则，拓展教育资源，激发官兵崇尚荣誉。必须搞好战略性的军事文化发展规划，加强军地文化机构合作，有效控制军人形象的公众呈现。必须加强网络舆论引导，打好主动仗，及时发声传递正能量。必须改进工作指导，把基层官兵冷暖疾苦放在心上，千方百计帮他们排忧解难。', '1,2,3', '0', '0', '1');
INSERT INTO `blog` VALUES ('2', '第二篇文章', '2014-04-18 22:21:14', '2014-04-18 22:21:16', '1', '流程：\r\n①：类型转换：首先调用PropertyEditor的setAsText（String），内部根据需要调用setValue(Object)方法进行设置转换后的值；\r\n②：数据验证：需要显示调用Spring的Validator接口实现进行数据验证；\r\n③：格式化显示：需要调用PropertyEditor的getText进行格式化显示。\r\n \r\n使用如上架构的缺点是：\r\n（1、PropertyEditor被设计为只能String<——>Object之间转换，不能任意对象类型<——>任意类型，如我们常见的Long时间戳到Date类型的转换是办不到的；\r\n（2、PropertyEditor是线程不安全的，也就是有状态的，因此每次使用时都需要创建一个，不可重用；\r\n（3、PropertyEditor不是强类型的，setValue（Object）可以接受任意类型，因此需要我们自己判断类型是否兼容；\r\n（4、需要自己编程实现验证，Spring3支持更棒的注解验证支持；\r\n（5、在使用SpEL表达式语言或DataBinder时，只能进行String<--->Object之间的类型转换；\r\n（6、不支持细粒度的类型转换/格式化，如UserModel的registerDate需要转换/格式化类似“2012-05-01”的数据，而OrderModel的orderDate需要转换/格式化类似“2012-05-01\r\n15：11：13”的数据，因为大家都为java.util.Date类型，因此不太容易进行细粒度转换/格式化', '3,4', '0', '0', '2');

-- ----------------------------
-- Table structure for siteinfo
-- ----------------------------
DROP TABLE IF EXISTS `siteinfo`;
CREATE TABLE `siteinfo` (
  `hitCount` bigint(20) NOT NULL DEFAULT '0',
  `liveCount` int(11) NOT NULL DEFAULT '0',
  `timeCount` bigint(20) NOT NULL DEFAULT '0',
  `blogCount` int(11) NOT NULL DEFAULT '0',
  `photoCount` int(11) NOT NULL DEFAULT '0',
  `commentCount` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of siteinfo
-- ----------------------------
INSERT INTO `siteinfo` VALUES ('12444', '8878', '767777', '3', '667', '0');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `tagId` int(11) NOT NULL AUTO_INCREMENT,
  `tagName` varchar(45) NOT NULL,
  PRIMARY KEY (`tagId`),
  UNIQUE KEY `tagName_UNIQUE` (`tagName`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('22', '1231');
INSERT INTO `tag` VALUES ('13', '123123');
INSERT INTO `tag` VALUES ('29', 'fda');
INSERT INTO `tag` VALUES ('24', 'fdas');
INSERT INTO `tag` VALUES ('25', 'fdsa');
INSERT INTO `tag` VALUES ('26', 'fdsaf');
INSERT INTO `tag` VALUES ('21', 'fsdfds');
INSERT INTO `tag` VALUES ('3', 'hibernate');
INSERT INTO `tag` VALUES ('1', 'java');
INSERT INTO `tag` VALUES ('5', 'nio');
INSERT INTO `tag` VALUES ('4', 'spring');
INSERT INTO `tag` VALUES ('2', 'struts2');
INSERT INTO `tag` VALUES ('28', 'vad');
INSERT INTO `tag` VALUES ('31', '中文');
INSERT INTO `tag` VALUES ('40', '中文你好');
INSERT INTO `tag` VALUES ('35', '你好');
INSERT INTO `tag` VALUES ('33', '你说一个故事');
INSERT INTO `tag` VALUES ('34', '你说呢');
INSERT INTO `tag` VALUES ('36', '新增一个分类');
INSERT INTO `tag` VALUES ('30', '设计模式');
INSERT INTO `tag` VALUES ('32', '逝去的旋律');
