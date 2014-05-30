/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2014-05-30 17:52:47
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
  UNIQUE KEY `username_UNIQUE` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '123456', '\0', '461504978@qq.com');
INSERT INTO `admin` VALUES ('8', 'sfddssdfsdfsd', 'fdsfsdf', '', 'fdsf');
INSERT INTO `admin` VALUES ('17', '213', '12312', '', '312');
INSERT INTO `admin` VALUES ('18', 'sdfdsfewf', 'fsdfewf', '', 'ffewfwe');
INSERT INTO `admin` VALUES ('25', '123123', '3123123', '', '123123');
INSERT INTO `admin` VALUES ('26', 'fsdfsd32', 'fsd', '', 'fds');

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
-- Table structure for e_data_type
-- ----------------------------
DROP TABLE IF EXISTS `e_data_type`;
CREATE TABLE `e_data_type` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `dtName` varchar(64) DEFAULT NULL COMMENT '数据类型名称',
  `createTime` bigint(20) DEFAULT NULL COMMENT '创建时间(mysql不能精确到毫秒，日期由应用层处理，存储整形20位 不支持long 用bigint)',
  `createBy` int(11) DEFAULT NULL COMMENT '创建者ID FK e_manager',
  `modifyTime` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `modifyBy` int(11) DEFAULT NULL COMMENT '修改者ID FK e_manager',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='引擎数据类型';

-- ----------------------------
-- Records of e_data_type
-- ----------------------------
INSERT INTO `e_data_type` VALUES ('1', '整形', '1399176264084', '1', '1399176264084', '1', '整形值');
INSERT INTO `e_data_type` VALUES ('2', '字符串', '1399176264084', '1', '1399176264084', '1', '字符串类型');
INSERT INTO `e_data_type` VALUES ('3', '枚举', '1399176264084', '1', '1399176264084', '1', '枚举类型');
INSERT INTO `e_data_type` VALUES ('4', '多选枚举', '1399176264084', '1', '1399176264084', '1', '多选枚举类型');
INSERT INTO `e_data_type` VALUES ('5', '序列', '1399176264084', '1', '1399176264084', '1', '序列类型（顺序）');
INSERT INTO `e_data_type` VALUES ('6', '时间', '1399176264084', '1', '1399176264084', '1', '时间类型');

-- ----------------------------
-- Table structure for e_dim_algorithm
-- ----------------------------
DROP TABLE IF EXISTS `e_dim_algorithm`;
CREATE TABLE `e_dim_algorithm` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `daName` varchar(64) NOT NULL DEFAULT '' COMMENT '维度算法名称',
  `daKey` varchar(255) NOT NULL DEFAULT '' COMMENT '维度算法Key (D#NumberScope)',
  `daClass` varchar(255) DEFAULT '' COMMENT '维度算法类路径',
  `createTime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createBy` int(11) DEFAULT NULL COMMENT '创建者ID FK e_manager',
  `modifyTime` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `modifyBy` int(11) DEFAULT NULL COMMENT '修改者ID FK e_manager',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='维度算法表';

-- ----------------------------
-- Records of e_dim_algorithm
-- ----------------------------
INSERT INTO `e_dim_algorithm` VALUES ('1', '数值范围值维度算法', 'D#NumberScope', 'com.lb.dim.NumberScope', '1399177695711', '1', '1399177695711', '1', '计算判断一个数值是否在一个范围值内部的维度算法');
INSERT INTO `e_dim_algorithm` VALUES ('2', '简单数字连续区间维度算法', 'D#SimpleConsecutive', 'com.lb.dim.SimpleConsecutive', '1399177695711', '1', '1399177695711', '1', '计算判断一个连续区间范围是否在一个范围值内部的维度算法');
INSERT INTO `e_dim_algorithm` VALUES ('3', '简单时间连续区间维度算法', 'D#SimpleTime', 'com.lb.dim.SimpleTime', '1399177695711', '1', '1399177695711', '1', '计算判断一个连续时间区间范围是否在一个范围值内部的维度算法');
INSERT INTO `e_dim_algorithm` VALUES ('4', '简单判断数值是否在枚举内c', 'D#SimpleFindMate', 'com.lb.dim.SimpleFindMate', '1399177695711', '1', '1399177695711', '1', '计算判断一个数值是否在枚举中存在');

-- ----------------------------
-- Table structure for e_dim_property_apply
-- ----------------------------
DROP TABLE IF EXISTS `e_dim_property_apply`;
CREATE TABLE `e_dim_property_apply` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `daId` int(11) DEFAULT NULL COMMENT '维度算法ID FK e_dimalgorithm',
  `dtId` int(11) DEFAULT NULL COMMENT '数据类型 FK e_data_type',
  `dapaName` varchar(64) DEFAULT NULL COMMENT '维度算法 申请类型属性（申请者请求的）',
  `dapaKey` varchar(255) NOT NULL DEFAULT '' COMMENT '维度算法 申请类属性的KEY 本维度唯一',
  `dapaFullKey` varchar(255) DEFAULT NULL COMMENT '维度算法 申请类属性的完整KEY 全局唯一 维度算法KEY + PA# + 属性KEY （D#NumberScope_PA#applyNumber)',
  `createTime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createBy` int(11) DEFAULT NULL COMMENT '创建者ID FK e_manager',
  `modifyTime` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `modifyBy` int(11) DEFAULT NULL COMMENT '修改者ID FK e_manager',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`Id`),
  KEY `daId` (`daId`),
  KEY `dtId` (`dtId`),
  CONSTRAINT `e_dim_property_apply_ibfk_1` FOREIGN KEY (`daId`) REFERENCES `e_dim_algorithm` (`Id`),
  CONSTRAINT `e_dim_property_apply_ibfk_2` FOREIGN KEY (`dtId`) REFERENCES `e_data_type` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='维度算法申请类属性表';

-- ----------------------------
-- Records of e_dim_property_apply
-- ----------------------------
INSERT INTO `e_dim_property_apply` VALUES ('1', '1', '1', '请求数量', 'applyNumber', 'D#NumberScope_PA#applyNumber', null, null, null, null, null);
INSERT INTO `e_dim_property_apply` VALUES ('2', '2', '1', '请求开始值', 'beginNumber', 'D#SimpleConsecutive_PA#beginNumber', null, null, null, null, null);
INSERT INTO `e_dim_property_apply` VALUES ('3', '2', '1', '请求结束值', 'endNumber', 'D#SimpleConsecutive_PA#endNumber', null, null, null, null, null);
INSERT INTO `e_dim_property_apply` VALUES ('4', '3', '6', '请求开始时间', 'beginTime', 'D#SimpleTime_PA#beginTime', null, null, null, null, null);
INSERT INTO `e_dim_property_apply` VALUES ('5', '3', '6', '请求结束时间', 'endTime', 'D#SimpleTime_PA#endTime', null, null, null, null, null);
INSERT INTO `e_dim_property_apply` VALUES ('6', '4', '1', '请求值', 'applyValue', 'D#SimpleFindMate_PA#applyValue', null, null, null, null, null);

-- ----------------------------
-- Table structure for e_dim_property_provide
-- ----------------------------
DROP TABLE IF EXISTS `e_dim_property_provide`;
CREATE TABLE `e_dim_property_provide` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `daId` int(11) DEFAULT NULL COMMENT '维度算法ID FK e_dim_algorithm',
  `dtId` int(11) DEFAULT NULL COMMENT '数据类型 FK e_data_type',
  `dappName` varchar(64) DEFAULT NULL COMMENT '维度算法 供给类型属性（提供者设定的）',
  `dappKey` varchar(255) NOT NULL DEFAULT '' COMMENT '维度算法 供给类属性的KEY 本维度唯一',
  `dappFullKey` varchar(255) DEFAULT NULL COMMENT '维度算法 供给类属性的完整KEY 全局唯一 维度算法KEY + PP + 属性KEY （D#NumberScope_PP#MaxNumber)',
  `createTime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createBy` int(11) DEFAULT NULL COMMENT '创建者ID FK e_manager',
  `modifyTime` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `modifyBy` int(11) DEFAULT NULL COMMENT '修改者ID FK e_manager',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`Id`),
  KEY `daId` (`daId`),
  KEY `dtId` (`dtId`),
  CONSTRAINT `e_dim_property_provide_ibfk_1` FOREIGN KEY (`daId`) REFERENCES `e_dim_algorithm` (`Id`),
  CONSTRAINT `e_dim_property_provide_ibfk_2` FOREIGN KEY (`dtId`) REFERENCES `e_data_type` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='维度算法供给类属性表';

-- ----------------------------
-- Records of e_dim_property_provide
-- ----------------------------
INSERT INTO `e_dim_property_provide` VALUES ('1', '1', '1', '数值上限', 'MaxNumber', 'D#NumberScope_PP#MaxNumber', '1399177695711', '1', '1399177695711', '1', '数值上限 资源供应者在创建资源单元的时候，需要设定的资源单元的维度的属性');
INSERT INTO `e_dim_property_provide` VALUES ('2', '1', '1', '数值下限', 'MinNumber', 'D#NumberScope_PP#MinNumber', '1399177695711', '1', '1399177695711', '1', '数值下限  资源供应者在创建资源单元的时候，需要设定的资源单元的维度的属性');
INSERT INTO `e_dim_property_provide` VALUES ('3', '2', '1', '数值上限', 'MaxNumber', 'D#SimpleConsecutive_PP#MaxNumber', '1399177695711', '1', '1399177695711', '1', null);
INSERT INTO `e_dim_property_provide` VALUES ('4', '2', '1', '数值下限', 'MinNumber', 'D#SimpleConsecutive_PP#MinNumber', '1399177695711', '1', '1399177695711', '1', null);
INSERT INTO `e_dim_property_provide` VALUES ('5', '3', '6', '时间上限', 'MaxTime', 'D#SimpleTime_PP#MaxTime', '1399177695711', '1', '1399177695711', '1', null);
INSERT INTO `e_dim_property_provide` VALUES ('6', '3', '6', '时间下限', 'MinTime', 'D#SimpleTime_PP#MinTime', '1399177695711', '1', '1399177695711', '1', null);
INSERT INTO `e_dim_property_provide` VALUES ('7', '4', '3', '范围枚举', 'ScopeEnum', 'D#SimpleFindMate_PP#ScopeEnum', '1399177695711', '1', '1399177695711', '1', '判断是否在枚举内出现的全部枚举值');

-- ----------------------------
-- Table structure for e_manager
-- ----------------------------
DROP TABLE IF EXISTS `e_manager`;
CREATE TABLE `e_manager` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `mgrName` varchar(255) DEFAULT NULL COMMENT '管理员名称',
  `account` varchar(255) DEFAULT NULL COMMENT '登陆账号',
  `pwd` varchar(255) DEFAULT NULL COMMENT '登陆密码',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of e_manager
-- ----------------------------
INSERT INTO `e_manager` VALUES ('1', '梁波', 'liangbo', '123456');

-- ----------------------------
-- Table structure for e_res_mould
-- ----------------------------
DROP TABLE IF EXISTS `e_res_mould`;
CREATE TABLE `e_res_mould` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `tId` int(11) NOT NULL DEFAULT '0' COMMENT '资源行业ID FK e_res_trade',
  `rmName` varchar(64) NOT NULL DEFAULT '' COMMENT '模型名称',
  `rmKey` varchar(64) DEFAULT NULL COMMENT '模型的Key 全局唯一 例如（RM#EateryRoom)',
  `createTime` bigint(20) DEFAULT NULL COMMENT '创建时间(mysql不能精确到毫秒，日期由应用层处理，存储整形20位 不支持long 用bigint)',
  `createBy` int(11) DEFAULT NULL COMMENT '创建者ID FK e_manager',
  `modifyTime` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `modifyBy` int(11) DEFAULT NULL COMMENT '修改者ID FK e_manager',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`Id`),
  KEY `createBy` (`createBy`),
  KEY `modifyBy` (`modifyBy`),
  KEY `tId` (`tId`),
  CONSTRAINT `e_res_mould_ibfk_2` FOREIGN KEY (`createBy`) REFERENCES `e_manager` (`Id`),
  CONSTRAINT `e_res_mould_ibfk_3` FOREIGN KEY (`modifyBy`) REFERENCES `e_manager` (`Id`),
  CONSTRAINT `e_res_mould_ibfk_4` FOREIGN KEY (`tId`) REFERENCES `e_trade` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='资源模型表（确定全部的资源的属性和维度的组合关系）';

-- ----------------------------
-- Records of e_res_mould
-- ----------------------------
INSERT INTO `e_res_mould` VALUES ('1', '2', '餐厅包房1', 'RM#EateryRoom1', '1399176264084', '1', '1399176264084', '1', '餐馆的包厢');
INSERT INTO `e_res_mould` VALUES ('2', '2', '餐厅包房2', 'RM#EateryRoom2', '1399176264084', '1', '1399176264084', '1', '餐馆的包厢');
INSERT INTO `e_res_mould` VALUES ('3', '2', '餐厅包房3', 'RM#EateryRoom3', '1399176264084', '1', '1399176264084', '1', '餐馆的包厢');
INSERT INTO `e_res_mould` VALUES ('4', '2', '餐厅包房4', 'RM#EateryRoom4', '1399176264084', '1', '1399176264084', '1', '餐馆的包厢');
INSERT INTO `e_res_mould` VALUES ('5', '2', '餐厅包房5', 'RM#EateryRoom5', '1399176264084', '1', '1399176264084', '1', '餐馆的包厢');
INSERT INTO `e_res_mould` VALUES ('6', '2', '餐厅包房6', 'RM#EateryRoom6', '1399176264084', '1', '1399176264084', '1', '餐馆的包厢');
INSERT INTO `e_res_mould` VALUES ('7', '2', '餐厅包房7', 'RM#EateryRoom7', '1399176264084', '1', '1399176264084', '1', '餐馆的包厢');
INSERT INTO `e_res_mould` VALUES ('8', '2', '餐厅包房8', 'RM#EateryRoom8', '1399176264084', '1', '1399176264084', '1', '餐馆的包厢');
INSERT INTO `e_res_mould` VALUES ('9', '2', '餐厅包房9', 'RM#EateryRoom9', '1399176264084', '1', '1399176264084', '1', '餐馆的包厢');
INSERT INTO `e_res_mould` VALUES ('10', '2', '餐厅包房10', 'RM#EateryRoom10', '1399176264084', '1', '1399176264084', '1', '餐馆的包厢');

-- ----------------------------
-- Table structure for e_res_mould_data_unit
-- ----------------------------
DROP TABLE IF EXISTS `e_res_mould_data_unit`;
CREATE TABLE `e_res_mould_data_unit` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `dtId` int(11) NOT NULL DEFAULT '0' COMMENT '数据类型ID FK e_data_type',
  `rmId` int(11) NOT NULL DEFAULT '0' COMMENT '资源模型的ID',
  `rmduName` varchar(255) DEFAULT NULL COMMENT '模型的数据单元名称',
  `useType` int(11) NOT NULL DEFAULT '1' COMMENT '用途 1 属性 2 维度属性',
  `maxValue` varchar(255) DEFAULT NULL COMMENT '最大值',
  `minValue` varchar(64) DEFAULT NULL COMMENT '最小值',
  `stepValue` varchar(64) DEFAULT NULL COMMENT '步进值',
  `defaultValue1` varchar(255) DEFAULT NULL COMMENT '默认值1',
  `defaultValue2` varchar(255) DEFAULT NULL COMMENT '默认值2',
  `defaultValue3` varchar(255) DEFAULT NULL COMMENT '默认值3',
  `createTime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createBy` int(11) DEFAULT NULL COMMENT '创建者ID FK e_manager',
  `modifyTime` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `modifyBy` int(11) DEFAULT NULL COMMENT '修改者ID FK e_manager',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`Id`),
  KEY `dtId` (`dtId`),
  KEY `rmId` (`rmId`),
  CONSTRAINT `e_res_mould_data_unit_ibfk_1` FOREIGN KEY (`dtId`) REFERENCES `e_data_type` (`Id`),
  CONSTRAINT `e_res_mould_data_unit_ibfk_2` FOREIGN KEY (`rmId`) REFERENCES `e_res_mould` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='资源模型数据单元（数据单元用来给管理界面或操作界面设定范围值）';

-- ----------------------------
-- Records of e_res_mould_data_unit
-- ----------------------------
INSERT INTO `e_res_mould_data_unit` VALUES ('1', '2', '1', '包房名称数据单元(属性)', '1', null, null, null, '包房', null, null, '1399177695711', '1', '1399177695711', '1', '餐饮行业模型_包房的属性_包房名称的数据单元');
INSERT INTO `e_res_mould_data_unit` VALUES ('2', '3', '1', '包房允许抽烟数据单元(属性)', '1', null, null, null, '1', null, null, '1399177695711', '1', '1399177695711', '1', '餐饮行业模型_包房的属性_包房允许吸烟的数据单元');
INSERT INTO `e_res_mould_data_unit` VALUES ('3', '1', '1', '包房面积(属性)', '1', '20000', '1', null, null, null, null, '1399177695711', '1', '1399177695711', '1', '餐饮行业模型_包房的属性_包房面积的数据单元');
INSERT INTO `e_res_mould_data_unit` VALUES ('4', '1', '1', '包房最大人数数据单元（维度）', '2', '1000', '1', null, '8', null, null, null, null, null, null, null);
INSERT INTO `e_res_mould_data_unit` VALUES ('5', '1', '1', '包房最小人数数据单元（维度）', '2', '1000', '1', null, '2', null, null, null, null, null, null, null);
INSERT INTO `e_res_mould_data_unit` VALUES ('6', '1', '1', '包房预定开始时间每天绝对时间（维度）', '2', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `e_res_mould_data_unit` VALUES ('7', '1', '1', '包房预定结束时间每天绝对时间（维度）', '2', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `e_res_mould_data_unit` VALUES ('8', '3', '1', '包房装修风格（属性）', '1', null, null, null, '1', null, null, null, null, null, null, '包房的几种装修风格 可以选择');
INSERT INTO `e_res_mould_data_unit` VALUES ('9', '3', '1', '包房最低消费枚举（维度）', '2', null, null, null, null, null, null, null, null, null, null, '包房支持的最低消费');

-- ----------------------------
-- Table structure for e_res_mould_data_unit_constant
-- ----------------------------
DROP TABLE IF EXISTS `e_res_mould_data_unit_constant`;
CREATE TABLE `e_res_mould_data_unit_constant` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `rmduId` int(11) NOT NULL DEFAULT '0' COMMENT '资源模型数据单元ID FK e_res_mould_unit',
  `rmducName` varchar(255) DEFAULT NULL COMMENT '常量名称',
  `rmducValue` varchar(255) DEFAULT NULL COMMENT '常量值',
  `createTime` bigint(20) DEFAULT NULL COMMENT '创建时间(mysql不能精确到毫秒，日期由应用层处理，存储整形20位 不支持long 用bigint)',
  `createBy` int(11) DEFAULT NULL COMMENT '创建者ID FK e_manager',
  `modifyTime` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `modifyBy` int(11) DEFAULT NULL COMMENT '修改者ID FK e_manager',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`Id`),
  KEY `rmduId` (`rmduId`),
  CONSTRAINT `e_res_mould_data_unit_constant_ibfk_1` FOREIGN KEY (`rmduId`) REFERENCES `e_res_mould_data_unit` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='资源模型数据单元的常量表（枚举或序列使用）';

-- ----------------------------
-- Records of e_res_mould_data_unit_constant
-- ----------------------------
INSERT INTO `e_res_mould_data_unit_constant` VALUES ('1', '2', '不允许', '1', '1399177695711', '1', '1399177695711', '1', '不允许吸烟');
INSERT INTO `e_res_mould_data_unit_constant` VALUES ('2', '2', '允许', '2', '1399177695711', '1', '1399177695711', '1', '允许吸烟');
INSERT INTO `e_res_mould_data_unit_constant` VALUES ('3', '8', '现代', '1', '1399177695711', '1', '1399177695711', '1', null);
INSERT INTO `e_res_mould_data_unit_constant` VALUES ('4', '8', '古典', '2', '1399177695711', '1', '1399177695711', '1', null);
INSERT INTO `e_res_mould_data_unit_constant` VALUES ('5', '8', '中式', '3', '1399177695711', '1', '1399177695711', '1', null);
INSERT INTO `e_res_mould_data_unit_constant` VALUES ('6', '8', '欧式', '4', '1399177695711', '1', '1399177695711', '1', null);
INSERT INTO `e_res_mould_data_unit_constant` VALUES ('7', '9', '无最低消费', '1', '1399177695711', '1', '1399177695711', '1', null);
INSERT INTO `e_res_mould_data_unit_constant` VALUES ('8', '9', '100元', '2', '1399177695711', '1', '1399177695711', '1', null);
INSERT INTO `e_res_mould_data_unit_constant` VALUES ('9', '9', '500元', '3', '1399177695711', '1', '1399177695711', '1', null);

-- ----------------------------
-- Table structure for e_res_mould_dim
-- ----------------------------
DROP TABLE IF EXISTS `e_res_mould_dim`;
CREATE TABLE `e_res_mould_dim` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `rmId` int(11) NOT NULL DEFAULT '0' COMMENT '资源模型ID FK e_res_mould',
  `daId` int(11) NOT NULL DEFAULT '0' COMMENT '维度算法ID FK e_dim_aglorithm',
  `rmdName` varchar(255) NOT NULL DEFAULT '' COMMENT '资源模型维度名称',
  `rmdFullKey` varchar(255) DEFAULT NULL COMMENT '资源模型维度完整KEY 资源模型KEY + 维度KEY(RM#EateryRoom_D#NumberScope)',
  `createTime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createBy` int(11) DEFAULT NULL COMMENT '创建者ID FK e_manager',
  `modifyTime` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `modifyBy` int(11) DEFAULT NULL COMMENT '修改者ID FK e_manager',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`Id`),
  KEY `rmId` (`rmId`),
  KEY `daId` (`daId`),
  CONSTRAINT `e_res_mould_dim_ibfk_1` FOREIGN KEY (`rmId`) REFERENCES `e_res_mould` (`Id`),
  CONSTRAINT `e_res_mould_dim_ibfk_2` FOREIGN KEY (`daId`) REFERENCES `e_dim_algorithm` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='资源模型维度表';

-- ----------------------------
-- Records of e_res_mould_dim
-- ----------------------------
INSERT INTO `e_res_mould_dim` VALUES ('1', '1', '1', '包房人数', 'RM#EateryRoom_D#NumberScope', '1399177695711', '1', '1399177695711', '1', '包房支持人数的维度');
INSERT INTO `e_res_mould_dim` VALUES ('2', '1', '3', '包房预定时间段', 'RM#EateryRoom_D#SimpleTime', '1399177695711', '1', '1399177695711', '1', '包房预定支持的时间段维度');
INSERT INTO `e_res_mould_dim` VALUES ('3', '1', '4', '包房最低消费', 'RM#EateryRoom_D#SimpleFindMate', '1399177695711', '1', '1399177695711', '1', '包房支持最低消费的维度');

-- ----------------------------
-- Table structure for e_res_mould_dim_property
-- ----------------------------
DROP TABLE IF EXISTS `e_res_mould_dim_property`;
CREATE TABLE `e_res_mould_dim_property` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `rmdId` int(11) NOT NULL DEFAULT '0' COMMENT '资源模型维度ID',
  `dppId` int(11) NOT NULL DEFAULT '0' COMMENT '维度算法供应方属性Id',
  `rmduId` int(11) DEFAULT '0' COMMENT '资源模型数据单元ID FK  e_res_mould_data_unit',
  `rmdpName` varchar(64) DEFAULT NULL COMMENT '资源模型维度算法属性名称',
  `rmdpFullKey` varchar(255) DEFAULT NULL COMMENT '资源模型维度属性KEY完整路径 资源模型KEY+维度属性KEY(RM#EateryRoom_D#NumberScope_PP#MaxNumber)',
  `horizontalTableColumnName` varchar(255) NOT NULL DEFAULT '' COMMENT '存资源单元维度属性值得横表的对应的列名称',
  `createTime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createBy` int(11) DEFAULT NULL COMMENT '创建者ID FK e_manager',
  `modifyTime` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `modifyBy` int(11) DEFAULT NULL COMMENT '修改者ID FK e_manager',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`Id`),
  KEY `rmdId` (`rmdId`),
  KEY `dppId` (`dppId`),
  KEY `rmduId` (`rmduId`),
  CONSTRAINT `e_res_mould_dim_property_ibfk_1` FOREIGN KEY (`rmdId`) REFERENCES `e_res_mould_dim` (`Id`),
  CONSTRAINT `e_res_mould_dim_property_ibfk_2` FOREIGN KEY (`dppId`) REFERENCES `e_dim_property_provide` (`Id`),
  CONSTRAINT `e_res_mould_dim_property_ibfk_3` FOREIGN KEY (`rmduId`) REFERENCES `e_res_mould_data_unit` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='资源模型的维度属性表（根据选择的维度 从维度供应属性表复制过来）';

-- ----------------------------
-- Records of e_res_mould_dim_property
-- ----------------------------
INSERT INTO `e_res_mould_dim_property` VALUES ('4', '1', '1', '4', '包房最大人数', 'RM#EateryRoom_D#NumberScope_PP#MaxNumber', 'iValue1', '1399177695711', '1', '1399177695711', '1', '餐饮类包房的资源模板的维度属性人数维度 的最大值维度属性');
INSERT INTO `e_res_mould_dim_property` VALUES ('5', '1', '2', '5', '包房最小人数', 'RM#EateryRoom_D#NumberScope_PP#MinNumber', 'iValue2', '1399177695711', '1', '1399177695711', '1', '餐饮类包房的资源模板的维度属性人数维度 的最小值维度属性');
INSERT INTO `e_res_mould_dim_property` VALUES ('6', '2', '5', '4', '包房预定开始时间', 'RM#EateryRoom_D#SimpleTime_PP#MaxTime', 'sValue1', '1399177695711', '1', '1399177695711', '1', '餐饮类包房的资源模板的维度属性时间维度 的最大值维度属性');
INSERT INTO `e_res_mould_dim_property` VALUES ('7', '2', '6', '7', '包房预定结束时间', 'RM#EateryRoom_D#SimpleTime_PP#MinTime', 'sValue2', '1399177695711', '1', '1399177695711', '1', '餐饮类包房的资源模板的维度属性时间维度 的最大值维度属性');
INSERT INTO `e_res_mould_dim_property` VALUES ('9', '3', '7', '9', '包房最低消费', 'RM#EateryRoom_D#SimpleFindMate_PP#ScopeEnum', 'iValue3', '1399177695711', '1', '1399177695711', '1', null);

-- ----------------------------
-- Table structure for e_res_mould_property
-- ----------------------------
DROP TABLE IF EXISTS `e_res_mould_property`;
CREATE TABLE `e_res_mould_property` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `rmId` int(11) NOT NULL DEFAULT '0' COMMENT '资源模型ID FK e_res_mould',
  `rmduId` int(11) NOT NULL DEFAULT '0' COMMENT '资源模型数据单元ID FK  e_res_mould_data_unit',
  `rmpName` varchar(255) DEFAULT NULL COMMENT '模型属性名称',
  `rmpKey` varchar(255) DEFAULT NULL COMMENT '模型属性Key 本模型唯一',
  `rmpFullKey` varchar(255) DEFAULT NULL COMMENT '模型属性完整Key 全局唯一 （模型Key+ P 关键字+ 属性key）例如 (RM#EateryRoom_P#Area)',
  `createTime` bigint(20) DEFAULT NULL COMMENT '创建时间(mysql不能精确到毫秒，日期由应用层处理，存储整形20位 不支持long 用bigint)',
  `createBy` int(11) DEFAULT NULL COMMENT '创建者ID FK e_manager',
  `modifyTime` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `modifyBy` int(11) DEFAULT NULL COMMENT '修改者ID FK e_manager',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`Id`),
  KEY `rmId` (`rmId`),
  KEY `rmduId` (`rmduId`),
  CONSTRAINT `e_res_mould_property_ibfk_1` FOREIGN KEY (`rmId`) REFERENCES `e_res_mould` (`Id`),
  CONSTRAINT `e_res_mould_property_ibfk_2` FOREIGN KEY (`rmduId`) REFERENCES `e_res_mould_data_unit` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='资源模型属性表';

-- ----------------------------
-- Records of e_res_mould_property
-- ----------------------------
INSERT INTO `e_res_mould_property` VALUES ('1', '1', '1', '包房名称', 'Name', 'RM#EateryRoom_P#Name', '1399177695711', '1', '1399177695711', '1', '餐饮行业 餐厅包房模型资源模型属性 包房名称');
INSERT INTO `e_res_mould_property` VALUES ('2', '1', '2', '是否允许吸烟', 'IsSmoke', 'RM#EateryRoom_P#IsSmoke', '1399177695711', '1', '1399177695711', '1', '餐饮行业 餐厅包房模型资源模型属性 包房是否允许吸烟');
INSERT INTO `e_res_mould_property` VALUES ('4', '1', '3', '包房面积', 'Area', 'RM#EateryRoom_P#Area', '1399177695711', '1', '1399177695711', '1', '餐饮行业 餐厅包房模型资源模型属性 包房面积');
INSERT INTO `e_res_mould_property` VALUES ('6', '1', '8', '包房风格', 'Style', 'RM#EateryRoom_P#Style', '1399177695711', '1', '1399177695711', '1', '风格');

-- ----------------------------
-- Table structure for e_res_supplier
-- ----------------------------
DROP TABLE IF EXISTS `e_res_supplier`;
CREATE TABLE `e_res_supplier` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `rsName` varchar(64) DEFAULT NULL COMMENT '资源供应商名称',
  `createTime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createBy` int(11) DEFAULT NULL COMMENT '创建者ID FK e_manager',
  `modifyTime` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `modifyBy` int(11) DEFAULT NULL COMMENT '修改者ID FK e_manager',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='资源供应商表';

-- ----------------------------
-- Records of e_res_supplier
-- ----------------------------
INSERT INTO `e_res_supplier` VALUES ('1', '快乐园', '1399177695711', '1', '1399177695711', '1', '测试的快乐园');

-- ----------------------------
-- Table structure for e_res_supplier_dim_templet
-- ----------------------------
DROP TABLE IF EXISTS `e_res_supplier_dim_templet`;
CREATE TABLE `e_res_supplier_dim_templet` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `rmdId` int(11) DEFAULT NULL COMMENT '资源模型维度Id',
  `rsID` int(11) NOT NULL DEFAULT '0' COMMENT '资源供应商ID',
  `rsdtName` varchar(255) DEFAULT NULL COMMENT '资源维度模板名称',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`Id`),
  KEY `rmdId` (`rmdId`),
  KEY `rsID` (`rsID`),
  CONSTRAINT `e_res_supplier_dim_templet_ibfk_1` FOREIGN KEY (`rmdId`) REFERENCES `e_res_mould_dim` (`Id`),
  CONSTRAINT `e_res_supplier_dim_templet_ibfk_2` FOREIGN KEY (`rsID`) REFERENCES `e_res_supplier` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='资源提供者的资源的维度模板';

-- ----------------------------
-- Records of e_res_supplier_dim_templet
-- ----------------------------
INSERT INTO `e_res_supplier_dim_templet` VALUES ('1', '1', '1', '大包房人数维度模板', '大包房人数维度模板');
INSERT INTO `e_res_supplier_dim_templet` VALUES ('2', '2', '1', '早市', '包房预定时间段模板早市');
INSERT INTO `e_res_supplier_dim_templet` VALUES ('3', '2', '1', '午市', '包房预定时间段模板午市');
INSERT INTO `e_res_supplier_dim_templet` VALUES ('4', '3', '1', '最低消费', '包房预定最低消费维度模板');

-- ----------------------------
-- Table structure for e_res_supplier_dim_templet_data_unit
-- ----------------------------
DROP TABLE IF EXISTS `e_res_supplier_dim_templet_data_unit`;
CREATE TABLE `e_res_supplier_dim_templet_data_unit` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `dtId` int(11) NOT NULL DEFAULT '0' COMMENT '数据类型ID FK e_data_type',
  `rsdtId` int(11) NOT NULL DEFAULT '0' COMMENT '资源发布者资源维度模板的ID',
  `rsdtduName` varchar(255) DEFAULT NULL COMMENT '资源维度模板的数据单元名称',
  `useType` int(11) NOT NULL DEFAULT '1' COMMENT '用途 1 属性 2 维度属性',
  `maxValue` varchar(255) DEFAULT NULL COMMENT '最大值',
  `minValue` varchar(64) DEFAULT NULL COMMENT '最小值',
  `stepValue` varchar(64) DEFAULT NULL COMMENT '步进值',
  `defaultValue1` varchar(255) DEFAULT NULL COMMENT '默认值1',
  `defaultValue2` varchar(255) DEFAULT NULL COMMENT '默认值2',
  `defaultValue3` varchar(255) DEFAULT NULL COMMENT '默认值3',
  `createTime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createBy` int(11) DEFAULT NULL COMMENT '创建者ID FK e_manager',
  `modifyTime` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `modifyBy` int(11) DEFAULT NULL COMMENT '修改者ID FK e_manager',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`Id`),
  KEY `dtId` (`dtId`),
  KEY `rsdtId` (`rsdtId`),
  CONSTRAINT `e_res_supplier_dim_templet_data_unit_ibfk_1` FOREIGN KEY (`dtId`) REFERENCES `e_data_type` (`Id`),
  CONSTRAINT `e_res_supplier_dim_templet_data_unit_ibfk_2` FOREIGN KEY (`rsdtId`) REFERENCES `e_res_supplier_dim_templet` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='资源提供者的资源维度模板使用的数据单元';

-- ----------------------------
-- Records of e_res_supplier_dim_templet_data_unit
-- ----------------------------
INSERT INTO `e_res_supplier_dim_templet_data_unit` VALUES ('1', '1', '1', '大包房人数最大值', '1', '15', '12', null, null, null, null, null, null, null, null, null);
INSERT INTO `e_res_supplier_dim_templet_data_unit` VALUES ('6', '3', '4', '包房最低消费', '1', '', null, null, '1', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for e_res_supplier_dim_templet_data_unit_constant
-- ----------------------------
DROP TABLE IF EXISTS `e_res_supplier_dim_templet_data_unit_constant`;
CREATE TABLE `e_res_supplier_dim_templet_data_unit_constant` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `rsdtduId` int(11) NOT NULL DEFAULT '0' COMMENT '资源维度模板数据单元ID FK e_res_mould_unit',
  `rsdtducName` varchar(255) DEFAULT NULL COMMENT '常量名称',
  `rmducValue` varchar(255) DEFAULT NULL COMMENT '常量值',
  `createTime` bigint(20) DEFAULT NULL COMMENT '创建时间(mysql不能精确到毫秒，日期由应用层处理，存储整形20位 不支持long 用bigint)',
  `createBy` int(11) DEFAULT NULL COMMENT '创建者ID FK e_manager',
  `modifyTime` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `modifyBy` int(11) DEFAULT NULL COMMENT '修改者ID FK e_manager',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`Id`),
  KEY `rsdtduId` (`rsdtduId`),
  CONSTRAINT `e_res_supplier_dim_templet_data_unit_constant_ibfk_1` FOREIGN KEY (`rsdtduId`) REFERENCES `e_res_supplier_dim_templet_data_unit` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='资源提供者的资源维度模板使用的数据单元常量';

-- ----------------------------
-- Records of e_res_supplier_dim_templet_data_unit_constant
-- ----------------------------
INSERT INTO `e_res_supplier_dim_templet_data_unit_constant` VALUES ('2', '6', '无最低消费', '1', null, null, null, null, null);
INSERT INTO `e_res_supplier_dim_templet_data_unit_constant` VALUES ('3', '6', '100元', '2', null, null, null, null, null);
INSERT INTO `e_res_supplier_dim_templet_data_unit_constant` VALUES ('4', '6', '200元', '3', null, null, null, null, null);
INSERT INTO `e_res_supplier_dim_templet_data_unit_constant` VALUES ('5', '6', '500元', '4', null, null, null, null, null);
INSERT INTO `e_res_supplier_dim_templet_data_unit_constant` VALUES ('6', '6', '1000元', '5', null, null, null, null, null);

-- ----------------------------
-- Table structure for e_res_supplier_dim_templet_property_value
-- ----------------------------
DROP TABLE IF EXISTS `e_res_supplier_dim_templet_property_value`;
CREATE TABLE `e_res_supplier_dim_templet_property_value` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `rsdtId` int(11) NOT NULL DEFAULT '0' COMMENT '资源提供者资源维度模板ID',
  `rmdpId` int(11) DEFAULT NULL COMMENT '资源模型维度属性Id',
  `templetValue1` varchar(255) DEFAULT NULL COMMENT '模板值1',
  `templetValue2` varchar(255) DEFAULT NULL COMMENT '模板值2',
  `isTempletConfig` int(11) NOT NULL DEFAULT '1' COMMENT '0 否  1是 本参数是否是模板配置的，如果模板配置的 则建立具体资源单元就不需要再手工配置了，否则建立资源单元还是要用户手工输入',
  `isSelfDataUnit` int(11) NOT NULL DEFAULT '0' COMMENT '0 否 1是  是否使用自己定义的数据单元  不是 则使用模型定义的数据单元',
  `selfDataUnitId` int(11) DEFAULT NULL COMMENT '不使用模型属性定义的数据单元，使用自己定义的数据单元的id  注意 自己定义的数据单元必须和模型定义的数据单元 数据类型一致',
  `createValueType` int(11) NOT NULL DEFAULT '0' COMMENT '利用此资源模板建立资源单元时候的值得复制方式 1 完整复制 2 自动添加编号在后部 3 自动添加编号在前部 4 自动添加编号在文字中的替换关键字 例如 $v1$ 5 自动增加一天',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`Id`),
  KEY `e_res_supplier_dim_templet_property_value_ibfk_1` (`rsdtId`),
  KEY `rmdpId` (`rmdpId`),
  KEY `selfDataUnitId` (`selfDataUnitId`),
  CONSTRAINT `e_res_supplier_dim_templet_property_value_ibfk_1` FOREIGN KEY (`rsdtId`) REFERENCES `e_res_supplier_dim_templet` (`Id`),
  CONSTRAINT `e_res_supplier_dim_templet_property_value_ibfk_2` FOREIGN KEY (`rmdpId`) REFERENCES `e_res_mould_dim_property` (`Id`),
  CONSTRAINT `e_res_supplier_dim_templet_property_value_ibfk_3` FOREIGN KEY (`selfDataUnitId`) REFERENCES `e_res_supplier_dim_templet_data_unit` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='资源提供者的资源维度模板属性值表';

-- ----------------------------
-- Records of e_res_supplier_dim_templet_property_value
-- ----------------------------
INSERT INTO `e_res_supplier_dim_templet_property_value` VALUES ('21', '1', '4', '12', null, '1', '1', '1', '1', '大包房人数维度属性 最大人数');
INSERT INTO `e_res_supplier_dim_templet_property_value` VALUES ('22', '1', '5', '1', null, '1', '0', null, '1', '大包房人数维度属性 最小人数');
INSERT INTO `e_res_supplier_dim_templet_property_value` VALUES ('23', '2', '6', '06:30:00', null, '1', '0', null, '5', '早市维度 每天开始时间');
INSERT INTO `e_res_supplier_dim_templet_property_value` VALUES ('24', '2', '7', '09:00:00', null, '1', '0', null, '5', '早市维度 每天结束时间');
INSERT INTO `e_res_supplier_dim_templet_property_value` VALUES ('25', '3', '6', '11:00:00', null, '1', '0', null, '5', '午市维度 每天开始时间');
INSERT INTO `e_res_supplier_dim_templet_property_value` VALUES ('26', '3', '6', '13:00:00', null, '1', '0', null, '5', '午市维度 每天结束时间');
INSERT INTO `e_res_supplier_dim_templet_property_value` VALUES ('28', '4', '9', '1', null, '1', '1', '6', '1', '包房最低消费');

-- ----------------------------
-- Table structure for e_res_supplier_rela_trade
-- ----------------------------
DROP TABLE IF EXISTS `e_res_supplier_rela_trade`;
CREATE TABLE `e_res_supplier_rela_trade` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `rsId` int(11) DEFAULT NULL,
  `rtId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `rsId` (`rsId`),
  KEY `rtId` (`rtId`),
  CONSTRAINT `e_res_supplier_rela_trade_ibfk_1` FOREIGN KEY (`rsId`) REFERENCES `e_res_supplier` (`Id`),
  CONSTRAINT `e_res_supplier_rela_trade_ibfk_2` FOREIGN KEY (`rtId`) REFERENCES `e_trade` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源供应商和资源行业关系表';

-- ----------------------------
-- Records of e_res_supplier_rela_trade
-- ----------------------------

-- ----------------------------
-- Table structure for e_res_supplier_res
-- ----------------------------
DROP TABLE IF EXISTS `e_res_supplier_res`;
CREATE TABLE `e_res_supplier_res` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `rmId` int(11) NOT NULL DEFAULT '0' COMMENT '资源模型ID',
  `rsID` int(11) NOT NULL DEFAULT '0' COMMENT '资源供应商ID',
  `rsrName` varchar(255) DEFAULT NULL COMMENT '具体资源名称',
  `createFrom` int(11) DEFAULT NULL COMMENT '创建资源的来源方式  1 从资源模型直接创建  2 从资源模板创建',
  `rstId` int(11) DEFAULT NULL COMMENT '资源模板ID',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`Id`),
  KEY `rmId` (`rmId`),
  KEY `rsID` (`rsID`),
  KEY `rstId` (`rstId`),
  CONSTRAINT `e_res_supplier_res_ibfk_1` FOREIGN KEY (`rmId`) REFERENCES `e_res_mould` (`Id`),
  CONSTRAINT `e_res_supplier_res_ibfk_2` FOREIGN KEY (`rsID`) REFERENCES `e_res_supplier` (`Id`),
  CONSTRAINT `e_res_supplier_res_ibfk_3` FOREIGN KEY (`rstId`) REFERENCES `e_res_supplier_templet` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='具体资源提供者的资源表';

-- ----------------------------
-- Records of e_res_supplier_res
-- ----------------------------
INSERT INTO `e_res_supplier_res` VALUES ('1', '1', '1', '包房1 直接模型配置', '1', null, '包房1包房1包房1 直接模型配置');
INSERT INTO `e_res_supplier_res` VALUES ('3', '1', '1', '包房2 利用模板配置', '2', null, '包房2 利用模板配置');

-- ----------------------------
-- Table structure for e_res_supplier_res_property_value
-- ----------------------------
DROP TABLE IF EXISTS `e_res_supplier_res_property_value`;
CREATE TABLE `e_res_supplier_res_property_value` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `rsrId` int(11) NOT NULL DEFAULT '0' COMMENT '具体资源Id',
  `rmpId` int(11) NOT NULL DEFAULT '0' COMMENT '资源模型属性ID',
  `value1` varchar(255) DEFAULT NULL COMMENT '值1',
  `value2` varchar(255) DEFAULT NULL COMMENT '值2',
  `isTempletDataUnit` int(11) NOT NULL DEFAULT '0' COMMENT '0 否 1是 是否使用资源模板定义的数据单元 不是 则使用模型定义的数据单元',
  `templetDataUnitId` int(11) DEFAULT NULL COMMENT '不使用模型属性定义的数据单元，使用自己定义的数据单元的id  注意 自己定义的数据单元必须和模型定义的数据单元 数据类型一致',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`Id`),
  KEY `rsrId` (`rsrId`),
  KEY `rmpId` (`rmpId`),
  KEY `templetDataUnitId` (`templetDataUnitId`),
  CONSTRAINT `e_res_supplier_res_property_value_ibfk_1` FOREIGN KEY (`rsrId`) REFERENCES `e_res_supplier_res` (`Id`),
  CONSTRAINT `e_res_supplier_res_property_value_ibfk_2` FOREIGN KEY (`rmpId`) REFERENCES `e_res_mould_property` (`Id`),
  CONSTRAINT `e_res_supplier_res_property_value_ibfk_3` FOREIGN KEY (`templetDataUnitId`) REFERENCES `e_res_supplier_templet_data_unit` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='资源提供者的具体资源单元的维度值表（纵表 每行代表一个维度值）';

-- ----------------------------
-- Records of e_res_supplier_res_property_value
-- ----------------------------
INSERT INTO `e_res_supplier_res_property_value` VALUES ('1', '1', '1', '大包房1', null, '0', null, null);
INSERT INTO `e_res_supplier_res_property_value` VALUES ('3', '1', '2', '1', null, '0', null, null);
INSERT INTO `e_res_supplier_res_property_value` VALUES ('4', '1', '4', '15', null, '0', null, null);
INSERT INTO `e_res_supplier_res_property_value` VALUES ('5', '1', '6', '1', null, '0', null, null);
INSERT INTO `e_res_supplier_res_property_value` VALUES ('7', '3', '1', '大包房2FromTemp', null, '0', null, null);
INSERT INTO `e_res_supplier_res_property_value` VALUES ('8', '3', '2', '0', null, '0', null, null);
INSERT INTO `e_res_supplier_res_property_value` VALUES ('9', '3', '4', '18', null, '0', null, null);
INSERT INTO `e_res_supplier_res_property_value` VALUES ('10', '3', '6', '1', null, '1', '1', null);

-- ----------------------------
-- Table structure for e_res_supplier_res_unit
-- ----------------------------
DROP TABLE IF EXISTS `e_res_supplier_res_unit`;
CREATE TABLE `e_res_supplier_res_unit` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `rsrId` int(11) NOT NULL DEFAULT '0' COMMENT '具体资源ID',
  `rsruName` varchar(255) DEFAULT NULL COMMENT '具体资源单元名称',
  `createFrom` int(11) DEFAULT NULL COMMENT '创建资源的来源方式 1 从资源模型直接创建 2 从资源单元模板创建',
  `rsutId` int(11) DEFAULT NULL COMMENT '资源单元模板ID',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`Id`),
  KEY `rsrId` (`rsrId`),
  KEY `rsutId` (`rsutId`),
  CONSTRAINT `e_res_supplier_res_unit_ibfk_1` FOREIGN KEY (`rsrId`) REFERENCES `e_res_supplier_res` (`Id`),
  CONSTRAINT `e_res_supplier_res_unit_ibfk_2` FOREIGN KEY (`rsutId`) REFERENCES `e_res_supplier_unit_templet` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='具体的资源单元';

-- ----------------------------
-- Records of e_res_supplier_res_unit
-- ----------------------------
INSERT INTO `e_res_supplier_res_unit` VALUES ('1', '1', '大包房1的5月5日早市资源单元 直接从模型配置', '1', null, '包房1的早市资源5月5日单元 直接从模型配置');
INSERT INTO `e_res_supplier_res_unit` VALUES ('2', '1', '大包房1的5月6日早市资源单元 从资源单元模板配置', '2', '1', '大包房1的5月6日早市资源单元 从资源单元模板配置');

-- ----------------------------
-- Table structure for e_res_supplier_res_unit_dim_value
-- ----------------------------
DROP TABLE IF EXISTS `e_res_supplier_res_unit_dim_value`;
CREATE TABLE `e_res_supplier_res_unit_dim_value` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `rsruId` int(11) NOT NULL DEFAULT '0' COMMENT '具体资源单元ID',
  `rmdId` int(11) NOT NULL DEFAULT '0' COMMENT '具体资源单元的使用的资源模型的维度ID',
  `rmdpId` int(11) NOT NULL DEFAULT '0' COMMENT '具体资源单元使用的资源模型的维度属性ID',
  `value1` varchar(255) DEFAULT NULL COMMENT '值1',
  `value2` varchar(255) DEFAULT NULL COMMENT '值2',
  `istempletDataUnit` int(11) NOT NULL DEFAULT '0' COMMENT '0 否 1是 是否使用维度模板定义的数据单元 不是 则使用模型定义的数据单元',
  `templetDataUnitId` int(11) DEFAULT NULL COMMENT '不使用模型属性定义的数据单元，使用自己定义的数据单元的id  注意 自己定义的数据单元必须和模型定义的数据单元 数据类型一致',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`Id`),
  KEY `rsruId` (`rsruId`),
  KEY `rmdId` (`rmdId`),
  KEY `rmdpId` (`rmdpId`),
  KEY `templetDataUnitId` (`templetDataUnitId`),
  CONSTRAINT `e_res_supplier_res_unit_dim_value_ibfk_1` FOREIGN KEY (`rsruId`) REFERENCES `e_res_supplier_res_unit` (`Id`),
  CONSTRAINT `e_res_supplier_res_unit_dim_value_ibfk_2` FOREIGN KEY (`rmdId`) REFERENCES `e_res_mould_dim` (`Id`),
  CONSTRAINT `e_res_supplier_res_unit_dim_value_ibfk_3` FOREIGN KEY (`rmdpId`) REFERENCES `e_res_mould_dim_property` (`Id`),
  CONSTRAINT `e_res_supplier_res_unit_dim_value_ibfk_4` FOREIGN KEY (`templetDataUnitId`) REFERENCES `e_res_supplier_dim_templet_data_unit` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='具体资源单元的维度值';

-- ----------------------------
-- Records of e_res_supplier_res_unit_dim_value
-- ----------------------------
INSERT INTO `e_res_supplier_res_unit_dim_value` VALUES ('1', '1', '1', '4', '8', null, '0', null, null);
INSERT INTO `e_res_supplier_res_unit_dim_value` VALUES ('2', '1', '1', '5', '1', null, '0', null, null);
INSERT INTO `e_res_supplier_res_unit_dim_value` VALUES ('3', '1', '2', '6', '2014-05-05 05:20:00', null, '0', null, null);
INSERT INTO `e_res_supplier_res_unit_dim_value` VALUES ('4', '1', '2', '7', '2014-05-05 09:20:00', null, '0', null, null);
INSERT INTO `e_res_supplier_res_unit_dim_value` VALUES ('5', '1', '3', '9', '1', null, '0', null, null);
INSERT INTO `e_res_supplier_res_unit_dim_value` VALUES ('7', '2', '1', '4', '12', null, '1', '1', null);
INSERT INTO `e_res_supplier_res_unit_dim_value` VALUES ('8', '2', '1', '5', '1', null, '0', null, null);
INSERT INTO `e_res_supplier_res_unit_dim_value` VALUES ('9', '2', '2', '6', '2014-05-06 11:00:00', null, '0', null, null);
INSERT INTO `e_res_supplier_res_unit_dim_value` VALUES ('10', '2', '2', '7', '2014-05-06 13:00:00', null, '0', null, null);
INSERT INTO `e_res_supplier_res_unit_dim_value` VALUES ('11', '2', '3', '9', '1', null, '1', '6', null);

-- ----------------------------
-- Table structure for e_res_supplier_res_unit_dim_value_horizontal
-- ----------------------------
DROP TABLE IF EXISTS `e_res_supplier_res_unit_dim_value_horizontal`;
CREATE TABLE `e_res_supplier_res_unit_dim_value_horizontal` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `rsruId` int(11) NOT NULL DEFAULT '0' COMMENT '具体资源单元ID',
  `iValue1` int(11) DEFAULT NULL COMMENT '数值1',
  `iValue2` int(11) DEFAULT NULL COMMENT '数值2',
  `iValue3` int(11) DEFAULT NULL COMMENT '数值3',
  `iValue4` int(11) DEFAULT NULL COMMENT '数值4',
  `iValue5` int(11) DEFAULT NULL COMMENT '数值5',
  `iValue6` int(11) DEFAULT NULL COMMENT '数值6',
  `dValue1` double DEFAULT NULL COMMENT '浮动数值1',
  `dValue2` double DEFAULT NULL COMMENT '浮点数值2',
  `dValue3` double DEFAULT NULL COMMENT '浮点数值3',
  `dValue4` double DEFAULT NULL COMMENT '浮点数值4',
  `dValue5` double DEFAULT NULL COMMENT '浮点数值5',
  `dValue6` double DEFAULT NULL COMMENT '浮点数值6',
  `sValue1` varchar(255) DEFAULT NULL COMMENT '字符值1',
  `sValue2` varchar(255) DEFAULT NULL COMMENT '字符值2',
  `sValue3` varchar(255) DEFAULT NULL COMMENT '字符值3',
  `sValue4` varchar(255) DEFAULT NULL COMMENT '字符值4',
  `sValue5` varchar(255) DEFAULT NULL COMMENT '字符值5',
  `sValue6` varchar(255) DEFAULT NULL COMMENT '字符值6',
  `sValue7` varchar(255) DEFAULT NULL COMMENT '字符值7',
  `sValue8` varchar(255) DEFAULT NULL COMMENT '字符值8',
  PRIMARY KEY (`Id`),
  KEY `rsruId` (`rsruId`),
  CONSTRAINT `e_res_supplier_res_unit_dim_value_horizontal_ibfk_1` FOREIGN KEY (`rsruId`) REFERENCES `e_res_supplier_res_unit` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='资源单元维度值横向表（所有维度值都放在一行中 方便数据库sql查询）因为只给运算用管理界面不用所以不需要数据单元';

-- ----------------------------
-- Records of e_res_supplier_res_unit_dim_value_horizontal
-- ----------------------------
INSERT INTO `e_res_supplier_res_unit_dim_value_horizontal` VALUES ('1', '1', '8', '1', '1', null, null, null, null, null, null, null, null, null, '2014-05-05 05:20:00', '2014-05-05 09:20:00', null, null, null, null, null, null);
INSERT INTO `e_res_supplier_res_unit_dim_value_horizontal` VALUES ('2', '2', '12', '1', '1', null, null, null, null, null, null, null, null, null, '2014-05-06 11:00:00', '2014-05-06 13:00:00', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for e_res_supplier_res_unit_order
-- ----------------------------
DROP TABLE IF EXISTS `e_res_supplier_res_unit_order`;
CREATE TABLE `e_res_supplier_res_unit_order` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `rsruId` int(11) DEFAULT NULL COMMENT '资源单元ID',
  `rssoId` int(11) DEFAULT NULL COMMENT '资源服务订单ID',
  `state` int(11) DEFAULT NULL COMMENT '订单状态',
  PRIMARY KEY (`Id`),
  KEY `rsruId` (`rsruId`),
  KEY `rssoId` (`rssoId`),
  CONSTRAINT `e_res_supplier_res_unit_order_ibfk_1` FOREIGN KEY (`rsruId`) REFERENCES `e_res_supplier_res_unit` (`Id`),
  CONSTRAINT `e_res_supplier_res_unit_order_ibfk_2` FOREIGN KEY (`rssoId`) REFERENCES `e_res_supplier_service_order` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源提供者提供的具体资源单元的订单';

-- ----------------------------
-- Records of e_res_supplier_res_unit_order
-- ----------------------------

-- ----------------------------
-- Table structure for e_res_supplier_res_unit_order_dim_value
-- ----------------------------
DROP TABLE IF EXISTS `e_res_supplier_res_unit_order_dim_value`;
CREATE TABLE `e_res_supplier_res_unit_order_dim_value` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `rsruoId` int(11) DEFAULT NULL COMMENT '资源单元订单Id',
  `rmdId` int(11) NOT NULL DEFAULT '0' COMMENT '资源模型维度Id',
  `dpaId` int(11) DEFAULT NULL COMMENT '维度算法请求参数Id',
  `value1` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `rsruoId` (`rsruoId`),
  KEY `rmdId` (`rmdId`),
  KEY `dpaId` (`dpaId`),
  CONSTRAINT `e_res_supplier_res_unit_order_dim_value_ibfk_1` FOREIGN KEY (`rsruoId`) REFERENCES `e_res_supplier_res_unit_order` (`Id`),
  CONSTRAINT `e_res_supplier_res_unit_order_dim_value_ibfk_2` FOREIGN KEY (`rmdId`) REFERENCES `e_res_mould_dim` (`Id`),
  CONSTRAINT `e_res_supplier_res_unit_order_dim_value_ibfk_3` FOREIGN KEY (`dpaId`) REFERENCES `e_dim_property_apply` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源单元订单的资源维度值（维度请求参数值）';

-- ----------------------------
-- Records of e_res_supplier_res_unit_order_dim_value
-- ----------------------------

-- ----------------------------
-- Table structure for e_res_supplier_service
-- ----------------------------
DROP TABLE IF EXISTS `e_res_supplier_service`;
CREATE TABLE `e_res_supplier_service` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `rsId` int(11) NOT NULL DEFAULT '0' COMMENT '资源提供者ID',
  `tsId` int(11) DEFAULT NULL COMMENT '行业服务类型，自己的服务都必须归属到行业的一种服务中',
  `rscName` varchar(255) DEFAULT NULL COMMENT '自己提供服务的命名（如果没有 则就延续父行业的服务名称）',
  `isMain` int(11) NOT NULL DEFAULT '0' COMMENT '是不是主服务 主服务可以单独预定 不是主服务不能单独定 需要和其他服务合并（自己用 不对外）',
  `isAutoConfirm` int(11) NOT NULL DEFAULT '0' COMMENT '是否自动确认 如果自动的 则一旦发现资源维度被许可 我放的资源订单就确认',
  `showType` int(11) DEFAULT NULL COMMENT '展示方式  用户订购时候  1 允许展示选择资源单元列表 让用户选  2 允许展示资源列表让用户选 3 用户直接填维度参数选',
  PRIMARY KEY (`Id`),
  KEY `rsId` (`rsId`),
  KEY `tsId` (`tsId`),
  CONSTRAINT `e_res_supplier_service_ibfk_1` FOREIGN KEY (`rsId`) REFERENCES `e_res_supplier` (`Id`),
  CONSTRAINT `e_res_supplier_service_ibfk_2` FOREIGN KEY (`tsId`) REFERENCES `e_trade_service` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='资源提供者自己定义自己提供的服务';

-- ----------------------------
-- Records of e_res_supplier_service
-- ----------------------------
INSERT INTO `e_res_supplier_service` VALUES ('1', '1', '1', '快乐园的预定服务', '1', '0', null);

-- ----------------------------
-- Table structure for e_res_supplier_service_order
-- ----------------------------
DROP TABLE IF EXISTS `e_res_supplier_service_order`;
CREATE TABLE `e_res_supplier_service_order` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `rssId` int(11) DEFAULT NULL COMMENT '资源提供者的服务Id',
  `userId` int(11) DEFAULT NULL COMMENT '服务资源申请者的Id',
  `isSubsidiary` int(11) DEFAULT NULL COMMENT '是不是附加在别人订单中的附加订单',
  `paterOrderId` int(11) DEFAULT NULL COMMENT '父亲订单的ID（主订单ID）',
  `state` int(11) DEFAULT NULL COMMENT '订单状态',
  PRIMARY KEY (`Id`),
  KEY `rssId` (`rssId`),
  KEY `userId` (`userId`),
  CONSTRAINT `e_res_supplier_service_order_ibfk_1` FOREIGN KEY (`rssId`) REFERENCES `e_res_supplier_service` (`Id`),
  CONSTRAINT `e_res_supplier_service_order_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `e_user` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源提供者提供的服务的订单';

-- ----------------------------
-- Records of e_res_supplier_service_order
-- ----------------------------

-- ----------------------------
-- Table structure for e_res_supplier_service_rela_otherservice
-- ----------------------------
DROP TABLE IF EXISTS `e_res_supplier_service_rela_otherservice`;
CREATE TABLE `e_res_supplier_service_rela_otherservice` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `rssId` int(11) NOT NULL DEFAULT '0' COMMENT '资源提供者的服务ID 主服务',
  `otherRssType` int(11) DEFAULT NULL COMMENT '其他附属服务的类型（1 服务  2 服务组）服务组的概念就是多个服务中只能选择一个',
  `otherRssId` int(11) NOT NULL DEFAULT '0' COMMENT '其他绑定的资源提供者的服务ID',
  `otherRssGroupId` int(11) NOT NULL DEFAULT '0' COMMENT '资源服务组（一组互斥的服务）的组合，让用户多选',
  `isMust` int(11) DEFAULT NULL COMMENT '是否是必须的（如果必须则必须把这个服务也地订购才能完成整个主服务的订购）',
  `orderFrom` int(11) DEFAULT NULL COMMENT '1 用户选择  2 商户选择 3 用户 商户都可以选择  附带服务的订单选择方式',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '其他服务在选择扩展服务时候的顺序',
  PRIMARY KEY (`Id`),
  KEY `rssId` (`rssId`),
  KEY `otherRssId` (`otherRssId`),
  KEY `otherRssGroupId` (`otherRssGroupId`),
  CONSTRAINT `e_res_supplier_service_rela_otherservice_ibfk_1` FOREIGN KEY (`rssId`) REFERENCES `e_res_supplier_service` (`Id`),
  CONSTRAINT `e_res_supplier_service_rela_otherservice_ibfk_2` FOREIGN KEY (`otherRssId`) REFERENCES `e_res_supplier_service` (`Id`),
  CONSTRAINT `e_res_supplier_service_rela_otherservice_ibfk_3` FOREIGN KEY (`otherRssGroupId`) REFERENCES `e_res_supplier_service_rela_otherservice_group` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源提供者提供的服务也可以绑定其他提供者提供的服务（只有主服务才可以绑其他服务 不限与自己的服务）';

-- ----------------------------
-- Records of e_res_supplier_service_rela_otherservice
-- ----------------------------

-- ----------------------------
-- Table structure for e_res_supplier_service_rela_otherservice_group
-- ----------------------------
DROP TABLE IF EXISTS `e_res_supplier_service_rela_otherservice_group`;
CREATE TABLE `e_res_supplier_service_rela_otherservice_group` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` int(11) DEFAULT NULL COMMENT '其他附属服务组的名称',
  `rsId` int(11) NOT NULL DEFAULT '0' COMMENT '资源提供者ID',
  PRIMARY KEY (`Id`),
  KEY `rsId` (`rsId`),
  CONSTRAINT `e_res_supplier_service_rela_otherservice_group_ibfk_1` FOREIGN KEY (`rsId`) REFERENCES `e_res_supplier` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='其他附属服务组表  用来标示同一个级别的附属服务（互斥的 只能选一个）';

-- ----------------------------
-- Records of e_res_supplier_service_rela_otherservice_group
-- ----------------------------

-- ----------------------------
-- Table structure for e_res_supplier_service_rela_otherservice_group_rela
-- ----------------------------
DROP TABLE IF EXISTS `e_res_supplier_service_rela_otherservice_group_rela`;
CREATE TABLE `e_res_supplier_service_rela_otherservice_group_rela` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `rssrogId` int(11) NOT NULL DEFAULT '0' COMMENT '服务组ID',
  `rssId` int(11) NOT NULL DEFAULT '0' COMMENT '资源提供者的服务ID 和同组的其他服务互斥',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '展示服务时候的顺序',
  PRIMARY KEY (`Id`),
  KEY `rssrogId` (`rssrogId`),
  KEY `rssId` (`rssId`),
  CONSTRAINT `e_res_supplier_service_rela_otherservice_group_rela_ibfk_1` FOREIGN KEY (`rssrogId`) REFERENCES `e_res_supplier_service_rela_otherservice_group` (`Id`),
  CONSTRAINT `e_res_supplier_service_rela_otherservice_group_rela_ibfk_2` FOREIGN KEY (`rssId`) REFERENCES `e_res_supplier_service` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务组明细（多个服务放在一起 让用户只能选择一个）';

-- ----------------------------
-- Records of e_res_supplier_service_rela_otherservice_group_rela
-- ----------------------------

-- ----------------------------
-- Table structure for e_res_supplier_service_rela_selfres
-- ----------------------------
DROP TABLE IF EXISTS `e_res_supplier_service_rela_selfres`;
CREATE TABLE `e_res_supplier_service_rela_selfres` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `rssId` int(11) NOT NULL DEFAULT '0' COMMENT '资源提供者的服务ID',
  `rsrId` int(11) DEFAULT NULL COMMENT '资源提供者的具体资源id（这些资源用来供应某种服务）',
  PRIMARY KEY (`Id`),
  KEY `rssId` (`rssId`),
  KEY `rsrId` (`rsrId`),
  CONSTRAINT `e_res_supplier_service_rela_selfres_ibfk_1` FOREIGN KEY (`rssId`) REFERENCES `e_res_supplier_service` (`Id`),
  CONSTRAINT `e_res_supplier_service_rela_selfres_ibfk_2` FOREIGN KEY (`rsrId`) REFERENCES `e_res_supplier_res` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='资源提供者自己提供的服务和自己的资源的关系';

-- ----------------------------
-- Records of e_res_supplier_service_rela_selfres
-- ----------------------------
INSERT INTO `e_res_supplier_service_rela_selfres` VALUES ('1', '1', '1');
INSERT INTO `e_res_supplier_service_rela_selfres` VALUES ('2', '1', '3');

-- ----------------------------
-- Table structure for e_res_supplier_templet
-- ----------------------------
DROP TABLE IF EXISTS `e_res_supplier_templet`;
CREATE TABLE `e_res_supplier_templet` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `rmId` int(11) NOT NULL DEFAULT '0' COMMENT '资源模型ID',
  `rsID` int(11) NOT NULL DEFAULT '0' COMMENT '资源供应商ID',
  `rstName` varchar(255) DEFAULT NULL COMMENT '资源模板名称',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`Id`),
  KEY `rmId` (`rmId`),
  KEY `rsID` (`rsID`),
  CONSTRAINT `e_res_supplier_templet_ibfk_1` FOREIGN KEY (`rmId`) REFERENCES `e_res_mould` (`Id`),
  CONSTRAINT `e_res_supplier_templet_ibfk_2` FOREIGN KEY (`rsID`) REFERENCES `e_res_supplier` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='资源提供者的资源模板表（确定资源提供者创建新资源的模板包含新资源的可复制的属性值 不需要每个资源单独再创建了）';

-- ----------------------------
-- Records of e_res_supplier_templet
-- ----------------------------
INSERT INTO `e_res_supplier_templet` VALUES ('1', '1', '1', '大包房', '快乐园的包房模型1 大包房');

-- ----------------------------
-- Table structure for e_res_supplier_templet_data_unit
-- ----------------------------
DROP TABLE IF EXISTS `e_res_supplier_templet_data_unit`;
CREATE TABLE `e_res_supplier_templet_data_unit` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `dtId` int(11) NOT NULL DEFAULT '0' COMMENT '数据类型ID FK e_data_type',
  `rstId` int(11) NOT NULL DEFAULT '0' COMMENT '资源发布者资源模板的ID',
  `rstduName` varchar(255) DEFAULT NULL COMMENT '资源模板的数据单元名称',
  `useType` int(11) NOT NULL DEFAULT '1' COMMENT '用途 1 属性 2 维度属性',
  `maxValue` varchar(255) DEFAULT NULL COMMENT '最大值',
  `minValue` varchar(64) DEFAULT NULL COMMENT '最小值',
  `stepValue` varchar(64) DEFAULT NULL COMMENT '步进值',
  `defaultValue1` varchar(255) DEFAULT NULL COMMENT '默认值1',
  `defaultValue2` varchar(255) DEFAULT NULL COMMENT '默认值2',
  `defaultValue3` varchar(255) DEFAULT NULL COMMENT '默认值3',
  `createTime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createBy` int(11) DEFAULT NULL COMMENT '创建者ID FK e_manager',
  `modifyTime` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `modifyBy` int(11) DEFAULT NULL COMMENT '修改者ID FK e_manager',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`Id`),
  KEY `dtId` (`dtId`),
  KEY `rstId` (`rstId`),
  CONSTRAINT `e_res_supplier_templet_data_unit_ibfk_1` FOREIGN KEY (`dtId`) REFERENCES `e_data_type` (`Id`),
  CONSTRAINT `e_res_supplier_templet_data_unit_ibfk_2` FOREIGN KEY (`rstId`) REFERENCES `e_res_supplier_templet` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='资源所有者资源模板的数据单元';

-- ----------------------------
-- Records of e_res_supplier_templet_data_unit
-- ----------------------------
INSERT INTO `e_res_supplier_templet_data_unit` VALUES ('1', '3', '1', '快乐园模板自定义房间风格', '1', null, null, null, '1', null, null, null, null, null, null, '快乐园模板自定义房间风格');

-- ----------------------------
-- Table structure for e_res_supplier_templet_data_unit_constant
-- ----------------------------
DROP TABLE IF EXISTS `e_res_supplier_templet_data_unit_constant`;
CREATE TABLE `e_res_supplier_templet_data_unit_constant` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `rstduId` int(11) NOT NULL DEFAULT '0' COMMENT '资源模型数据单元ID FK e_res_mould_unit',
  `rstducName` varchar(255) DEFAULT NULL COMMENT '常量名称',
  `rstducValue` varchar(255) DEFAULT NULL COMMENT '常量值',
  `createTime` bigint(20) DEFAULT NULL COMMENT '创建时间(mysql不能精确到毫秒，日期由应用层处理，存储整形20位 不支持long 用bigint)',
  `createBy` int(11) DEFAULT NULL COMMENT '创建者ID FK e_manager',
  `modifyTime` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `modifyBy` int(11) DEFAULT NULL COMMENT '修改者ID FK e_manager',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`Id`),
  KEY `rstduId` (`rstduId`),
  CONSTRAINT `e_res_supplier_templet_data_unit_constant_ibfk_1` FOREIGN KEY (`rstduId`) REFERENCES `e_res_supplier_templet_data_unit` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='资源所有者的资源模板的数据单元的常量表';

-- ----------------------------
-- Records of e_res_supplier_templet_data_unit_constant
-- ----------------------------
INSERT INTO `e_res_supplier_templet_data_unit_constant` VALUES ('1', '1', '山景厅', '1', null, null, null, null, null);
INSERT INTO `e_res_supplier_templet_data_unit_constant` VALUES ('3', '1', '海景厅', '2', null, null, null, null, null);
INSERT INTO `e_res_supplier_templet_data_unit_constant` VALUES ('4', '1', '云景厅', '3', null, null, null, null, null);
INSERT INTO `e_res_supplier_templet_data_unit_constant` VALUES ('5', '1', '街景厅', '4', null, null, null, null, null);

-- ----------------------------
-- Table structure for e_res_supplier_templet_property_value
-- ----------------------------
DROP TABLE IF EXISTS `e_res_supplier_templet_property_value`;
CREATE TABLE `e_res_supplier_templet_property_value` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `rstId` int(11) NOT NULL DEFAULT '0' COMMENT '资源模板ID',
  `rmpId` int(11) NOT NULL DEFAULT '0' COMMENT '资源模型属性ID',
  `templetValue1` varchar(255) DEFAULT NULL COMMENT '模板值1',
  `templetValue2` varchar(255) DEFAULT NULL COMMENT '模板值2',
  `isTempletConfig` int(11) NOT NULL DEFAULT '1' COMMENT '0 否  1是 本参数是否是模板配置的，如果模板配置的 则建立具体资源单元就不需要再手工配置了，否则建立资源单元还是要用户手工输入',
  `isSelfDataUnit` int(11) NOT NULL DEFAULT '0' COMMENT '0 否 1是  是否使用自己定义的数据单元  不是 则使用模型定义的数据单元',
  `selfDataUnitId` int(11) DEFAULT NULL COMMENT '不使用模型属性定义的数据单元，使用自己定义的数据单元的id  注意 自己定义的数据单元必须和模型定义的数据单元 数据类型一致',
  `createValueType` int(11) NOT NULL DEFAULT '0' COMMENT '利用此资源模板建立资源单元时候的值得复制方式 1 完整复制 2 自动添加编号在后部 3 自动添加编号在前部  4 自动添加编号在文字中的替换关键字  例如 $v1$',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`Id`),
  KEY `rstId` (`rstId`),
  KEY `rmpId` (`rmpId`),
  KEY `selfDataUnitId` (`selfDataUnitId`),
  CONSTRAINT `e_res_supplier_templet_property_value_ibfk_1` FOREIGN KEY (`rstId`) REFERENCES `e_res_supplier_templet` (`Id`),
  CONSTRAINT `e_res_supplier_templet_property_value_ibfk_2` FOREIGN KEY (`rmpId`) REFERENCES `e_res_mould_property` (`Id`),
  CONSTRAINT `e_res_supplier_templet_property_value_ibfk_3` FOREIGN KEY (`selfDataUnitId`) REFERENCES `e_res_supplier_templet_data_unit` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='资源提供者的资源模板属性值表';

-- ----------------------------
-- Records of e_res_supplier_templet_property_value
-- ----------------------------
INSERT INTO `e_res_supplier_templet_property_value` VALUES ('2', '1', '1', '大包房', null, '1', '0', null, '2', '包房名称 利用模板的值1 生成  但是需要在尾部自动添加编号');
INSERT INTO `e_res_supplier_templet_property_value` VALUES ('3', '1', '2', '0', null, '1', '0', null, '1', '包房是否允许吸烟  使用0 不允许吸烟');
INSERT INTO `e_res_supplier_templet_property_value` VALUES ('4', '1', '4', null, null, '0', '0', null, '0', '包房面积 不由模板生成 必须逐个添加资源的时候去一个个的设置');
INSERT INTO `e_res_supplier_templet_property_value` VALUES ('5', '1', '6', null, null, '1', '0', '1', '0', '包房风格');

-- ----------------------------
-- Table structure for e_res_supplier_unit_templet
-- ----------------------------
DROP TABLE IF EXISTS `e_res_supplier_unit_templet`;
CREATE TABLE `e_res_supplier_unit_templet` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `rmId` int(11) NOT NULL DEFAULT '0' COMMENT '资源模型ID',
  `rsID` int(11) NOT NULL DEFAULT '0' COMMENT '资源供应商ID',
  `rsutName` varchar(255) DEFAULT NULL COMMENT '资源单元模板名称',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`Id`),
  KEY `rmId` (`rmId`),
  KEY `rsID` (`rsID`),
  CONSTRAINT `e_res_supplier_unit_templet_ibfk_1` FOREIGN KEY (`rmId`) REFERENCES `e_res_mould` (`Id`),
  CONSTRAINT `e_res_supplier_unit_templet_ibfk_2` FOREIGN KEY (`rsID`) REFERENCES `e_res_supplier` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='资源提供者的资源单元模板表（需要由多个维度模板组装）';

-- ----------------------------
-- Records of e_res_supplier_unit_templet
-- ----------------------------
INSERT INTO `e_res_supplier_unit_templet` VALUES ('1', '1', '1', '早市', '早市的资源单元模板');
INSERT INTO `e_res_supplier_unit_templet` VALUES ('2', '1', '1', '午市', '午市的资源单元模板');

-- ----------------------------
-- Table structure for e_res_supplier_unit_templet_rela_dim_templet
-- ----------------------------
DROP TABLE IF EXISTS `e_res_supplier_unit_templet_rela_dim_templet`;
CREATE TABLE `e_res_supplier_unit_templet_rela_dim_templet` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `rsutId` int(11) DEFAULT NULL COMMENT '资源单元模板ID',
  `rsdtId` int(11) NOT NULL DEFAULT '0' COMMENT '资源维度模板ID',
  PRIMARY KEY (`Id`),
  KEY `rsutId` (`rsutId`),
  KEY `rsdtId` (`rsdtId`),
  CONSTRAINT `e_res_supplier_unit_templet_rela_dim_templet_ibfk_1` FOREIGN KEY (`rsutId`) REFERENCES `e_res_supplier_unit_templet` (`Id`),
  CONSTRAINT `e_res_supplier_unit_templet_rela_dim_templet_ibfk_2` FOREIGN KEY (`rsdtId`) REFERENCES `e_res_supplier_dim_templet` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='资源提供者资源单元模板和资源维度模板关系（注意 资源单元选择了资源模型后 这里必须配满全部的维度 利用维度模板）';

-- ----------------------------
-- Records of e_res_supplier_unit_templet_rela_dim_templet
-- ----------------------------
INSERT INTO `e_res_supplier_unit_templet_rela_dim_templet` VALUES ('1', '1', '1');
INSERT INTO `e_res_supplier_unit_templet_rela_dim_templet` VALUES ('2', '1', '2');
INSERT INTO `e_res_supplier_unit_templet_rela_dim_templet` VALUES ('3', '1', '4');

-- ----------------------------
-- Table structure for e_res_supplier_unit_templet_rela_res
-- ----------------------------
DROP TABLE IF EXISTS `e_res_supplier_unit_templet_rela_res`;
CREATE TABLE `e_res_supplier_unit_templet_rela_res` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `rsutId` int(11) NOT NULL DEFAULT '0' COMMENT '资源单元模板ID',
  `rsrId` int(11) NOT NULL DEFAULT '0' COMMENT '具体资源ID',
  PRIMARY KEY (`Id`),
  KEY `rsutId` (`rsutId`),
  KEY `rsrId` (`rsrId`),
  CONSTRAINT `e_res_supplier_unit_templet_rela_res_ibfk_1` FOREIGN KEY (`rsutId`) REFERENCES `e_res_supplier_unit_templet` (`Id`),
  CONSTRAINT `e_res_supplier_unit_templet_rela_res_ibfk_2` FOREIGN KEY (`rsrId`) REFERENCES `e_res_supplier_res` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='资源单元模板和具体资源的关系表（标示这个资源单元模板用来配置那些具体的资源 只能配置一个同一个资源模型下的具体资源模型）';

-- ----------------------------
-- Records of e_res_supplier_unit_templet_rela_res
-- ----------------------------
INSERT INTO `e_res_supplier_unit_templet_rela_res` VALUES ('1', '1', '1');
INSERT INTO `e_res_supplier_unit_templet_rela_res` VALUES ('2', '1', '3');

-- ----------------------------
-- Table structure for e_trade
-- ----------------------------
DROP TABLE IF EXISTS `e_trade`;
CREATE TABLE `e_trade` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `rtName` varchar(64) DEFAULT NULL COMMENT '行业名称',
  `parentId` int(11) NOT NULL DEFAULT '-1' COMMENT '父行业ID SK 如果根行业 -1',
  `createTime` bigint(20) DEFAULT NULL COMMENT '创建时间(mysql不能精确到毫秒，日期由应用层处理，存储整形20位 不支持long 用bigint)',
  `createBy` int(11) DEFAULT NULL COMMENT '创建者ID FK e_manager',
  `modifyTime` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `modifyBy` int(11) DEFAULT NULL COMMENT '修改者ID FK e_manager',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='资源行业表';

-- ----------------------------
-- Records of e_trade
-- ----------------------------
INSERT INTO `e_trade` VALUES ('1', '服务', '-1', '1399176264084', '1', '1399176264084', '1', '服务类行业');
INSERT INTO `e_trade` VALUES ('2', '餐饮', '1', '1399176264084', '1', '1399176264084', '1', '餐饮行业');
INSERT INTO `e_trade` VALUES ('3', '健身', '1', '1399176264084', '1', '1399176264084', '1', '健身行业');

-- ----------------------------
-- Table structure for e_trade_service
-- ----------------------------
DROP TABLE IF EXISTS `e_trade_service`;
CREATE TABLE `e_trade_service` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `rtId` int(11) NOT NULL DEFAULT '0' COMMENT '资源行业ID',
  `rtsName` varchar(255) NOT NULL DEFAULT '' COMMENT '行业服务的名称',
  `createTime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createBy` int(11) DEFAULT NULL COMMENT '创建者ID FK e_manager',
  `modifyTime` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `modifyBy` int(11) DEFAULT NULL COMMENT '修改者ID FK e_manager',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`Id`),
  KEY `rtId` (`rtId`),
  CONSTRAINT `e_trade_service_ibfk_1` FOREIGN KEY (`rtId`) REFERENCES `e_trade` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='行业提供的服务类型表（资源提供都是为了某种服务的）';

-- ----------------------------
-- Records of e_trade_service
-- ----------------------------
INSERT INTO `e_trade_service` VALUES ('1', '2', '预定', '1399177695711', '1', '1399177695711', '1', '餐饮预定');
INSERT INTO `e_trade_service` VALUES ('2', '2', '排队', '1399177695711', '1', '1399177695711', '1', '餐饮排队');

-- ----------------------------
-- Table structure for e_user
-- ----------------------------
DROP TABLE IF EXISTS `e_user`;
CREATE TABLE `e_user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源申请者 用户 订单发起人';

-- ----------------------------
-- Records of e_user
-- ----------------------------

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
  UNIQUE KEY `tagName_UNIQUE` (`tagName`) USING BTREE
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
