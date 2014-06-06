/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2014-06-06 18:13:50
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

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
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`Id`),
  KEY `createBy` (`createBy`),
  KEY `modifyBy` (`modifyBy`),
  KEY `tId` (`tId`),
  CONSTRAINT `e_res_mould_ibfk_2` FOREIGN KEY (`createBy`) REFERENCES `e_manager` (`Id`),
  CONSTRAINT `e_res_mould_ibfk_3` FOREIGN KEY (`modifyBy`) REFERENCES `e_manager` (`Id`),
  CONSTRAINT `e_res_mould_ibfk_4` FOREIGN KEY (`tId`) REFERENCES `e_trade` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=373 DEFAULT CHARSET=utf8 COMMENT='资源模型表（确定全部的资源的属性和维度的组合关系）';

-- ----------------------------
-- Records of e_res_mould
-- ----------------------------
INSERT INTO `e_res_mould` VALUES ('1', '2', '餐厅包房1', 'RM#EateryRoom1', '1399176264084', '1', '1399176264084', '1', '餐馆的包厢');
INSERT INTO `e_res_mould` VALUES ('2', '2', '餐厅包房2', 'RM#EateryRoom2', '1399176264084', '1', '1399176264084', '1', '餐馆的包厢');
INSERT INTO `e_res_mould` VALUES ('3', '2', '餐厅包房3', 'RM#EateryRoom3', '1399176264084', '1', '1399176264084', '1', '餐馆的包厢');
INSERT INTO `e_res_mould` VALUES ('4', '2', '餐厅包房4', 'RM#EateryRoom4', '1399176264084', '1', '1399176264084', '1', '餐馆的包厢');
INSERT INTO `e_res_mould` VALUES ('13', '1', '特殊服务', 'SV#service1', '1401784352247', '1', '1401784352247', '1', '特殊服务哦！');
INSERT INTO `e_res_mould` VALUES ('14', '1', '123', '123', '1401784431325', '1', '1401784431325', '1', '1231');
INSERT INTO `e_res_mould` VALUES ('15', '1', '特殊想法的', '213123', '1401784513935', '1', '1401784513935', '1', 'fsdfsdf');
INSERT INTO `e_res_mould` VALUES ('16', '1', 'asdasd', 'asdasda', '1401784563606', '1', '1401784563606', '1', 'sdasdsa');
INSERT INTO `e_res_mould` VALUES ('17', '1', 'aweqwe', 'qweqwe', '1401784599060', '1', '1401784599060', '1', 'qweqweqwe');
INSERT INTO `e_res_mould` VALUES ('18', '1', 'sdf', 'sd', '1401784662075', '1', '1401784662075', '1', 'fsdf');
INSERT INTO `e_res_mould` VALUES ('19', '1', '2312', '3', '1401784726606', '1', '1401784726606', '1', '12321');
INSERT INTO `e_res_mould` VALUES ('20', '1', 'cdsfsd', 'dfsf', '1401785049310', '1', '1401785049310', '1', 'dfsfsdf');
INSERT INTO `e_res_mould` VALUES ('21', '1', '12312', '321', '1401786807075', '1', '1401786807075', '1', '123213');
INSERT INTO `e_res_mould` VALUES ('22', '1', '测试模型', 'moxingkey', '1401787150356', '1', '1401787150356', '1', '测试模型测试模型测试模型测试模型测试模型测试模型测试模型');
INSERT INTO `e_res_mould` VALUES ('23', '1', '测试模型', 'ceshimoxin', '1401787228341', '1', '1401787228341', '1', '测试模型测试模型测试模型测试模型测试模型');
INSERT INTO `e_res_mould` VALUES ('24', '1', '水电费水电费', 'sdfsdf', '1401787238403', '1', '1401787238403', '1', 'sdfsdfds');
INSERT INTO `e_res_mould` VALUES ('25', '1', 'dfsfsdf', 'dfdsfsdfsd', '1401787274653', '1', '1401787274653', '1', 'fsdfsd');
INSERT INTO `e_res_mould` VALUES ('26', '1', '时代发生的', 'sfsd', '1401787329060', '1', '1401787329060', '1', 'sdfsdf发生地方');
INSERT INTO `e_res_mould` VALUES ('27', '1', '123', '12', '1401787577669', '1', '1401787577669', '1', '312');
INSERT INTO `e_res_mould` VALUES ('28', '1', '123', '123', '1401787617356', '1', '1401787617356', '1', '1231');
INSERT INTO `e_res_mould` VALUES ('30', '1', 'sdfsd', 'fds', '1401787681231', '1', '1401787681231', '1', 'fadsfa');
INSERT INTO `e_res_mould` VALUES ('38', '1', 'dsgfadf', 'sdgfsdf', '1401788157935', '1', '1401788157935', '1', 'sdfasdfs');
INSERT INTO `e_res_mould` VALUES ('41', '1', '测试模板', 'ceshi', '1401845166531', '1', '1401845166531', '1', '测试描述测试摸吧测试描述测试摸吧测试描述测试摸吧测试描述测试摸吧测试描述测试摸吧测试描述测试摸吧');
INSERT INTO `e_res_mould` VALUES ('42', '1', '水电费水电费', '3123', '1401845206515', '1', '1401845206515', '1', '1231231');
INSERT INTO `e_res_mould` VALUES ('52', '1', '方的身份的事', '是对方的手', '1401847338125', '1', '1401847338125', '1', '佛挡杀佛');
INSERT INTO `e_res_mould` VALUES ('54', '1', '收复失地', '水电费', '1401847579468', '1', '1401847579468', '1', '水电费');
INSERT INTO `e_res_mould` VALUES ('55', '1', '就是需要', 'kejjj', '1401847733687', '1', '1401847733687', '1', '彻底解决哦额色');
INSERT INTO `e_res_mould` VALUES ('57', '1', '发生大幅度', '是对方的手', '1401848119234', '1', '1401848119234', '1', '水电费');
INSERT INTO `e_res_mould` VALUES ('58', '1', '发生地方', '水电费', '1401848257875', '1', '1401848257875', '1', '水电费');
INSERT INTO `e_res_mould` VALUES ('60', '1', '发生地方', '地方的', '1401848687390', '1', '1401848687390', '1', '发的');
INSERT INTO `e_res_mould` VALUES ('61', '1', '似懂非懂', '水电费', '1401848714125', '1', '1401848714125', '1', '第三方');
INSERT INTO `e_res_mould` VALUES ('66', '1', 'sdfd ', 'dsf ', '1401848932609', '1', '1401848932609', '1', 'dsf ');
INSERT INTO `e_res_mould` VALUES ('67', '1', '12321', '321', '1401848994125', '1', '1401848994125', '1', '3213');
INSERT INTO `e_res_mould` VALUES ('68', '1', '斯蒂芬森', '水电费', '1401849275796', '1', '1401849275796', '1', '水电费');
INSERT INTO `e_res_mould` VALUES ('69', '1', '是对方的手', '水电费师德师风', '1401849437359', '1', '1401849437359', '1', '第三方');
INSERT INTO `e_res_mould` VALUES ('70', '1', '撒旦法', '水电费', '1401849552203', '1', '1401849552203', '1', '水电费');
INSERT INTO `e_res_mould` VALUES ('71', '1', '水电费', '水电费', '1401849980921', '1', '1401849980921', '1', '水电费');
INSERT INTO `e_res_mould` VALUES ('72', '1', '似懂非懂', '水电费', '1401850119218', '1', '1401850119218', '1', '水电费');
INSERT INTO `e_res_mould` VALUES ('73', '1', '水电费', '第三方', '1401850205578', '1', '1401850205578', '1', '带饭');
INSERT INTO `e_res_mould` VALUES ('74', '1', '第三方', '带饭', '1401850674890', '1', '1401850674890', '1', '带饭');
INSERT INTO `e_res_mould` VALUES ('76', '1', '似懂非懂', '双方的身份', '1401852376000', '1', '1401852376000', '1', '水电费水电费');
INSERT INTO `e_res_mould` VALUES ('78', '1', '撒旦法', '是非颠倒', '1401852461375', '1', '1401852461375', '1', '读书');
INSERT INTO `e_res_mould` VALUES ('79', '1', '2312', '3123', '1401852956296', '1', '1401852956296', '1', '123123');
INSERT INTO `e_res_mould` VALUES ('80', '1', '1231', '23', '1401852974171', '1', '1401852974171', '1', '1231');
INSERT INTO `e_res_mould` VALUES ('84', '1', '水电费', '第三方', '1401853063046', '1', '1401853063046', '1', '第三方');
INSERT INTO `e_res_mould` VALUES ('85', '1', '2321', '312', '1401853480812', '1', '1401853480812', '1', '321');
INSERT INTO `e_res_mould` VALUES ('87', '1', '是对方的手', '水电费', '1401853544671', '1', '1401853544671', '1', '水电费');
INSERT INTO `e_res_mould` VALUES ('88', '2', '水电费', '水电费', '1401854160953', '1', '1401854160953', '1', '水电费水电费');
INSERT INTO `e_res_mould` VALUES ('89', '1', '的说法都是', '是对方的手', '1401860794234', '1', '1401860794234', '1', '是对方的手');
INSERT INTO `e_res_mould` VALUES ('90', '2', '是对方的手', '第三方', '1401860833328', '1', '1401860833328', '1', '水电费');
INSERT INTO `e_res_mould` VALUES ('91', '2', '水电费', '水电费', '1401860854906', '1', '1401860854906', '1', '第三方');
INSERT INTO `e_res_mould` VALUES ('92', '1', '是对方的手', '发生地方', '1401861035937', '1', '1401861035937', '1', '第三方');
INSERT INTO `e_res_mould` VALUES ('93', '1', '发', '水电费', '1401861195734', '1', '1401861195734', '1', '第三方');
INSERT INTO `e_res_mould` VALUES ('94', '3', '斯蒂芬森', '带饭', '1401862138187', '1', '1401862138187', '1', '第三方');
INSERT INTO `e_res_mould` VALUES ('95', '2', '法规辅导过', '梵蒂冈', '1401862462015', '1', '1401862462015', '1', '梵蒂冈');
INSERT INTO `e_res_mould` VALUES ('96', '2', '水电费', '东方时代', '1401862702359', '1', '1401862702359', '1', '是对方的手');
INSERT INTO `e_res_mould` VALUES ('97', '2', '水电费', '水电费', '1401863146031', '1', '1401863146031', '1', '水电费');
INSERT INTO `e_res_mould` VALUES ('98', '2', '带饭', '水电费', '1401863194625', '1', '1401863194625', '1', '水电费');
INSERT INTO `e_res_mould` VALUES ('99', '2', '范德萨', '水电费', '1401863207203', '1', '1401863207203', '1', '水电费');
INSERT INTO `e_res_mould` VALUES ('100', '1', '水电费', '水电费', '1401863321375', '1', '1401863321375', '1', '第三方');
INSERT INTO `e_res_mould` VALUES ('101', '2', '水电费', '水电费', '1401863464390', '1', '1401863464390', '1', '水电费');
INSERT INTO `e_res_mould` VALUES ('102', '2', '发读书', '水电费', '1401863596937', '1', '1401863596937', '1', '水电费');
INSERT INTO `e_res_mould` VALUES ('103', '2', '水电费', '水电费', '1401863642109', '1', '1401863642109', '1', '水电费');
INSERT INTO `e_res_mould` VALUES ('104', '1', '水电费', '收到', '1401863698312', '1', '1401863698312', '1', '水电费');
INSERT INTO `e_res_mould` VALUES ('105', '1', '发生的', '收到', '1401863763312', '1', '1401863763312', '1', '收到');
INSERT INTO `e_res_mould` VALUES ('106', '2', ' 是的', '水电费', '1401863785875', '1', '1401863785875', '1', '第三方');
INSERT INTO `e_res_mould` VALUES ('107', '2', '水电费', '水电费', '1401863849078', '1', '1401863849078', '1', '水电费');
INSERT INTO `e_res_mould` VALUES ('108', '2', '水电费', '水电费', '1401863869656', '1', '1401863869656', '1', '水电费');
INSERT INTO `e_res_mould` VALUES ('109', '3', '范德萨', '第三方', '1401863942734', '1', '1401863942734', '1', '水电费');
INSERT INTO `e_res_mould` VALUES ('110', '2', '水电费', '第三方', '1401863978734', '1', '1401863978734', '1', '第三方');
INSERT INTO `e_res_mould` VALUES ('111', '2', '水电费', '水电费', '1401864020109', '1', '1401864020109', '1', '第三方');
INSERT INTO `e_res_mould` VALUES ('112', '2', '水电费', '水电费', '1401864091265', '1', '1401864091265', '1', '水电费');
INSERT INTO `e_res_mould` VALUES ('113', '3', '水电费', '水电费', '1401864305109', '1', '1401864305109', '1', '水电费');
INSERT INTO `e_res_mould` VALUES ('114', '2', '水电费', '水电费', '1401864631515', '1', '1401864631515', '1', '水电费是');
INSERT INTO `e_res_mould` VALUES ('115', '2', '测试模型', 'ceshi', '1401864922484', '1', '1401864922484', '1', '测试模型啊 ');
INSERT INTO `e_res_mould` VALUES ('116', '2', 'sdfsd', 'fsdf', '1401865048140', '1', '1401865048140', '1', 'sdfsdf');
INSERT INTO `e_res_mould` VALUES ('117', '2', 'sdaf', 'asdf', '1401865351359', '1', '1401865351359', '1', 'dsafads');
INSERT INTO `e_res_mould` VALUES ('118', '3', '当时发生大', '时代发生的', '1401866200875', '1', '1401866200875', '1', '是对方的手');
INSERT INTO `e_res_mould` VALUES ('119', '1', '法的规定发给', '的风格', '1401867532625', '1', '1401867532625', '1', '的风格');
INSERT INTO `e_res_mould` VALUES ('120', '2', '打算', ' 按时大是', '1401867726046', '1', '1401867726046', '1', '打上的按时');
INSERT INTO `e_res_mould` VALUES ('121', '1', '第三方', '水电费', '1401867835453', '1', '1401867835453', '1', '水电费');
INSERT INTO `e_res_mould` VALUES ('122', '2', '时代发生的 ', '撒旦法', '1401867897875', '1', '1401867897875', '1', '士大夫');
INSERT INTO `e_res_mould` VALUES ('123', '2', '按时东方大厦', '撒放大点', '1401867918734', '1', '1401867918734', '1', '啊都发顺丰');
INSERT INTO `e_res_mould` VALUES ('124', '1', '水电费水电费', '水电费', '1401869070953', '1', '1401869070953', '1', '水电费谁说的');
INSERT INTO `e_res_mould` VALUES ('125', '2', '水电费水电费', '水电费', '1401870158468', '1', '1401870158468', '1', '水电费');
INSERT INTO `e_res_mould` VALUES ('126', '2', 'adsfda', 'dfasdf', '1401870911578', '1', '1401870911578', '1', 'dfasdf');
INSERT INTO `e_res_mould` VALUES ('127', '2', '12312', '312', '1401870946265', '1', '1401870946265', '1', '312321');
INSERT INTO `e_res_mould` VALUES ('128', '2', '12312', '3123', '1401871089609', '1', '1401871089609', '1', '12312');
INSERT INTO `e_res_mould` VALUES ('129', '2', '13123', 'eawfr', '1401872338312', '1', '1401872338312', '1', 'wefewfe');
INSERT INTO `e_res_mould` VALUES ('130', '1', '阿桑地方撒旦', '水电费', '1401873173453', '1', '1401873173453', '1', '士大夫');
INSERT INTO `e_res_mould` VALUES ('131', '2', '12312', '312', '1401873296093', '1', '1401873296093', '1', '321312');
INSERT INTO `e_res_mould` VALUES ('132', '2', '士大夫', '撒旦法', '1401873339968', '1', '1401873339968', '1', '撒旦法');
INSERT INTO `e_res_mould` VALUES ('133', '2', '时代发生的', '水电费', '1401873436656', '1', '1401873436656', '1', '水电费');
INSERT INTO `e_res_mould` VALUES ('134', '1', 'sdafd ', 'sdf ', '1401873494312', '1', '1401873494312', '1', 'asdf ');
INSERT INTO `e_res_mould` VALUES ('135', '1', 'fdsf', 'sdf', '1401873633921', '1', '1401873633921', '1', 'sdfsd');
INSERT INTO `e_res_mould` VALUES ('136', '1', 'sdfs', 'fsdf', '1401873694812', '1', '1401873694812', '1', 'sdf');
INSERT INTO `e_res_mould` VALUES ('137', '1', 'sdfds', 'fsd', '1401874137765', '1', '1401874137765', '1', 'fdsf');
INSERT INTO `e_res_mould` VALUES ('138', '2', 'fsf', 'sdf', '1401874153562', '1', '1401874153562', '1', 'sdfsd');
INSERT INTO `e_res_mould` VALUES ('139', '1', 'sdfsd', 'fsd', '1401874322093', '1', '1401874322093', '1', 'fsdf');
INSERT INTO `e_res_mould` VALUES ('140', '1', 'dfads', 'fsd', '1401874389265', '1', '1401874389265', '1', 'fsdfds');
INSERT INTO `e_res_mould` VALUES ('141', '1', 'sd', 'fasdf', '1401874406312', '1', '1401874406312', '1', 'dsaf');
INSERT INTO `e_res_mould` VALUES ('142', '1', 'sdfs', 'dfs', '1401874478593', '1', '1401874478593', '1', 'dfsd');
INSERT INTO `e_res_mould` VALUES ('143', '2', 'sfa', 'dfdas', '1401874500546', '1', '1401874500546', '1', 'fasdf');
INSERT INTO `e_res_mould` VALUES ('144', '2', 'sdf', 'sdf', '1401874639937', '1', '1401874639937', '1', 'sdfsd');
INSERT INTO `e_res_mould` VALUES ('145', '1', 'sdf', 'sdf', '1401874652265', '1', '1401874652265', '1', 'sdf');
INSERT INTO `e_res_mould` VALUES ('146', '1', '123', '123', '1401874895421', '1', '1401874895421', '1', '1231');
INSERT INTO `e_res_mould` VALUES ('147', '2', 'fdsf', 'sdf', '1401874922468', '1', '1401874922468', '1', 'sdfsd');
INSERT INTO `e_res_mould` VALUES ('148', '1', 'sdf', 'sdfsd', '1401874946125', '1', '1401874946125', '1', 'sdfds');
INSERT INTO `e_res_mould` VALUES ('149', '1', 'sdf', 'sdf', '1401875022656', '1', '1401875022656', '1', 'sdfs');
INSERT INTO `e_res_mould` VALUES ('150', '2', 'sf', 'sdf', '1401875581281', '1', '1401875581281', '1', 'sdfsd');
INSERT INTO `e_res_mould` VALUES ('151', '1', 'sdf', 'sdf', '1401875735390', '1', '1401875735390', '1', 'sdfsd');
INSERT INTO `e_res_mould` VALUES ('152', '1', 'dsaf', 'dsaf', '1401875750343', '1', '1401875750343', '1', 'sdaf');
INSERT INTO `e_res_mould` VALUES ('153', '1', 'sdfa', 'sdfsadf', '1401875783156', '1', '1401875783156', '1', 'sadfdsa');
INSERT INTO `e_res_mould` VALUES ('154', '2', 'sdf', 'sdf', '1401875815984', '1', '1401875815984', '1', 'sdfsd');
INSERT INTO `e_res_mould` VALUES ('155', '1', '123', '123', '1401875996437', '1', '1401875996437', '1', '12312');
INSERT INTO `e_res_mould` VALUES ('156', '1', '123', '123', '1401876073093', '1', '1401876073093', '1', '12312');
INSERT INTO `e_res_mould` VALUES ('157', '1', '123', '123', '1401876124125', '1', '1401876124125', '1', '1231');
INSERT INTO `e_res_mould` VALUES ('158', '1', 'sdf', 'asdf', '1401876145515', '1', '1401876145515', '1', 'asdfasd');
INSERT INTO `e_res_mould` VALUES ('159', '1', 'asdf', 'adsfdas', '1401876162250', '1', '1401876162250', '1', 'fsda');
INSERT INTO `e_res_mould` VALUES ('160', '2', 'sdf', 'sdf', '1401876509468', '1', '1401876509468', '1', 'sdfs');
INSERT INTO `e_res_mould` VALUES ('161', '1', 'dsf', 'sd', '1401876553671', '1', '1401876553671', '1', 'sdf');
INSERT INTO `e_res_mould` VALUES ('162', '1', '斯蒂芬森', '水电费', '1401876651000', '1', '1401876651000', '1', '水电费');
INSERT INTO `e_res_mould` VALUES ('163', '1', '时代发生的', '水电费', '1401876736984', '1', '1401876736984', '1', '水电费');
INSERT INTO `e_res_mould` VALUES ('164', '1', 'sdf', 'sdf', '1401930801906', '1', '1401930801906', '1', 'sdfsd');
INSERT INTO `e_res_mould` VALUES ('165', '1', 'sdf', 'sdfs', '1401931045515', '1', '1401931045515', '1', 'dfsd');
INSERT INTO `e_res_mould` VALUES ('166', '2', '2312', '3123', '1401931210781', '1', '1401931210781', '1', '12312');
INSERT INTO `e_res_mould` VALUES ('167', '1', 'sdf', 'sdf', '1401931316515', '1', '1401931316515', '1', 'sdfsd');
INSERT INTO `e_res_mould` VALUES ('168', '2', 'sdf', 'sdf', '1401931392109', '1', '1401931392109', '1', 'sdfsd');
INSERT INTO `e_res_mould` VALUES ('169', '2', 'sdf', 'sdf', '1401931438859', '1', '1401931438859', '1', 'sdfsd');
INSERT INTO `e_res_mould` VALUES ('170', '1', 'SDF', 'SDF', '1401931606218', '1', '1401931606218', '1', 'SDF');
INSERT INTO `e_res_mould` VALUES ('171', '2', 'SDF', 'SDF', '1401931666296', '1', '1401931666296', '1', 'SDFSD');
INSERT INTO `e_res_mould` VALUES ('172', '2', 'SDF', 'SD', '1401931784875', '1', '1401931784875', '1', 'FSDF');
INSERT INTO `e_res_mould` VALUES ('173', '1', 'sdf', 'sdf', '1401931885812', '1', '1401931885812', '1', 'sdfsd');
INSERT INTO `e_res_mould` VALUES ('174', '2', 'sdf', 'sd', '1401932139109', '1', '1401932139109', '1', 'fsd');
INSERT INTO `e_res_mould` VALUES ('175', '1', 'sd', 'fsd', '1401932334703', '1', '1401932334703', '1', 'fsd');
INSERT INTO `e_res_mould` VALUES ('176', '1', '321', '321', '1401932452453', '1', '1401932452453', '1', '312');
INSERT INTO `e_res_mould` VALUES ('177', '1', 'df', 'sd', '1401932472234', '1', '1401932472234', '1', 'fsd');
INSERT INTO `e_res_mould` VALUES ('178', '2', 'dsf', 'sdf', '1401932508390', '1', '1401932508390', '1', 'sdfsd');
INSERT INTO `e_res_mould` VALUES ('179', '2', 'sdf', 'fsd', '1401932539468', '1', '1401932539468', '1', 'sd');
INSERT INTO `e_res_mould` VALUES ('180', '2', 'xdfc', 'sdf', '1401932554312', '1', '1401932554312', '1', 'sdfs');
INSERT INTO `e_res_mould` VALUES ('181', '1', 'df', 'sdf', '1401932612796', '1', '1401932612796', '1', 'sd');
INSERT INTO `e_res_mould` VALUES ('182', '1', 'sdf', '', '1401932772265', '1', '1401932772265', '1', '');
INSERT INTO `e_res_mould` VALUES ('183', '1', 'ds', 'f', '1401932856625', '1', '1401932856625', '1', 'sdsd');
INSERT INTO `e_res_mould` VALUES ('184', '1', '水电费水电费', '水电费', '1401932889156', '1', '1401932889156', '1', '第三方');
INSERT INTO `e_res_mould` VALUES ('185', '1', '时代发生的', '水电费', '1401932925718', '1', '1401932925718', '1', '收到');
INSERT INTO `e_res_mould` VALUES ('186', '3', '水电费', '第三方', '1401932953406', '1', '1401932953406', '1', '收到');
INSERT INTO `e_res_mould` VALUES ('187', '1', '时代发生的', '第三方', '1401933004812', '1', '1401933004812', '1', '第三方');
INSERT INTO `e_res_mould` VALUES ('188', '1', '的方式', '带饭', '1401933065203', '1', '1401933065203', '1', '第三方');
INSERT INTO `e_res_mould` VALUES ('189', '1', '反对', '带饭', '1401933134671', '1', '1401933134671', '1', '读书');
INSERT INTO `e_res_mould` VALUES ('190', '1', '佛挡杀佛', '第三方', '1401933398531', '1', '1401933398531', '1', '水电费');
INSERT INTO `e_res_mould` VALUES ('191', '1', '似懂非懂', '水电费', '1401933453937', '1', '1401933453937', '1', '带饭');
INSERT INTO `e_res_mould` VALUES ('192', '1', 'fsd', ' dfsdfsd', '1401933716718', '1', '1401933716718', '1', 'fsd');
INSERT INTO `e_res_mould` VALUES ('193', '2', 'sdf', 'dsf', '1401934683296', '1', '1401934683296', '1', 'sdfsd');
INSERT INTO `e_res_mould` VALUES ('194', '1', 'dsf', 'sdf', '1401934726031', '1', '1401934726031', '1', 'sdfds');
INSERT INTO `e_res_mould` VALUES ('195', '1', 'sdf', 'sdf', '1401935695906', '1', '1401935695906', '1', 'sdfsd');
INSERT INTO `e_res_mould` VALUES ('196', '1', 'sdf', 'sdf', '1401935795593', '1', '1401935795593', '1', 'sdfs');
INSERT INTO `e_res_mould` VALUES ('197', '2', 'sdf', 'sdf', '1401935913828', '1', '1401935913828', '1', 'sdfds');
INSERT INTO `e_res_mould` VALUES ('198', '1', 'sdf', 'sdf', '1401935955421', '1', '1401935955421', '1', 'sd');
INSERT INTO `e_res_mould` VALUES ('199', '2', '当时发生大', '第三方', '1401936079593', '1', '1401936079593', '1', '水电费');
INSERT INTO `e_res_mould` VALUES ('200', '1', '放到沙发上的', '第三方', '1401936141890', '1', '1401936141890', '1', '水电费');
INSERT INTO `e_res_mould` VALUES ('201', '2', 'sdf', 'sdf', '1401937278765', '1', '1401937278765', '1', 'sdf');
INSERT INTO `e_res_mould` VALUES ('202', '1', '2312', '312', '1401937330187', '1', '1401937330187', '1', '31231');
INSERT INTO `e_res_mould` VALUES ('203', '1', 'gdf', 'df', '1401943858500', '1', '1401943858500', '1', 'ggdfgfd');
INSERT INTO `e_res_mould` VALUES ('204', '1', 'sdf', 'sdf', '1401946947250', '1', '1401946947250', '1', 'dsfsd');
INSERT INTO `e_res_mould` VALUES ('205', '2', 'sd', 'fsd', '1401947101609', '1', '1401947101609', '1', 'fds');
INSERT INTO `e_res_mould` VALUES ('206', '2', 'sdf', 'sdf', '1401947233187', '1', '1401947233187', '1', 'sdfsd');
INSERT INTO `e_res_mould` VALUES ('207', '2', '12', '123', '1401947421390', '1', '1401947421390', '1', '13');
INSERT INTO `e_res_mould` VALUES ('208', '1', 'dsf', 'sdf', '1401947459453', '1', '1401947459453', '1', 'sdfsd');
INSERT INTO `e_res_mould` VALUES ('209', '1', 'sdf', 'sdf', '1401949633734', '1', '1401949633734', '1', 'sdf');
INSERT INTO `e_res_mould` VALUES ('210', '2', 'sdf', 'sdf', '1401949727843', '1', '1401949727843', '1', 'sdfs');
INSERT INTO `e_res_mould` VALUES ('211', '2', 'sdfds', 'f', '1401949772531', '1', '1401949772531', '1', 'sdfsdf');
INSERT INTO `e_res_mould` VALUES ('212', '1', 'df', 'sdf', '1401949800343', '1', '1401949800343', '1', 'sdf');
INSERT INTO `e_res_mould` VALUES ('213', '2', 'sadf', 'sad', '1401949849812', '1', '1401949849812', '1', 'fsdaf');
INSERT INTO `e_res_mould` VALUES ('214', '1', 'dsaf', 'fadsf', '1401950010046', '1', '1401950010046', '1', 'sdafsadf');
INSERT INTO `e_res_mould` VALUES ('215', '1', 'fsadsa', 'f', '1401950036078', '1', '1401950036078', '1', 'sadfdas');
INSERT INTO `e_res_mould` VALUES ('216', '2', 'asdf', 'sadf', '1401950059265', '1', '1401950059265', '1', 'sadfd');
INSERT INTO `e_res_mould` VALUES ('217', '2', 'asdf', 'sad', '1401950094812', '1', '1401950094812', '1', 'fsad');
INSERT INTO `e_res_mould` VALUES ('218', '2', 'sdf', 'asdf', '1401950299312', '1', '1401950299312', '1', 'sdafdsa');
INSERT INTO `e_res_mould` VALUES ('219', '2', 'sdf', 'sa', '1401950377015', '1', '1401950377015', '1', 'dfasdf');
INSERT INTO `e_res_mould` VALUES ('220', '3', 'sdf', 'sdf', '1401950451859', '1', '1401950451859', '1', 'sdfsd');
INSERT INTO `e_res_mould` VALUES ('221', '2', 'sdf', 'df', '1401950572781', '1', '1401950572781', '1', 'sdfds');
INSERT INTO `e_res_mould` VALUES ('222', '3', 'sdf', 'sdf', '1401950628953', '1', '1401950628953', '1', 'sdf');
INSERT INTO `e_res_mould` VALUES ('223', '1', '123', '123', '1401950688515', '1', '1401950688515', '1', '123');
INSERT INTO `e_res_mould` VALUES ('224', '1', '123', '12', '1401950808234', '1', '1401950808234', '1', '321');
INSERT INTO `e_res_mould` VALUES ('225', '1', 'sdf', 'sdf', '1401950927656', '1', '1401950927656', '1', 'sdfs');
INSERT INTO `e_res_mould` VALUES ('226', '3', '123', '123', '1401950968359', '1', '1401950968359', '1', '123');
INSERT INTO `e_res_mould` VALUES ('227', '1', '3123', '12312', '1401951173875', '1', '1401951173875', '1', '312');
INSERT INTO `e_res_mould` VALUES ('228', '2', 'fsd', 'fsd', '1401951301687', '1', '1401951301687', '1', 'sdf');
INSERT INTO `e_res_mould` VALUES ('229', '1', 'df', 'sdf', '1401951389078', '1', '1401951389078', '1', '');
INSERT INTO `e_res_mould` VALUES ('230', '1', 'sdf', 'sdf', '1401951448625', '1', '1401951448625', '1', 'sdf');
INSERT INTO `e_res_mould` VALUES ('231', '1', '', '', '1401951509609', '1', '1401951509609', '1', '');
INSERT INTO `e_res_mould` VALUES ('232', '1', 'dsf', 'sdf', '1401951572500', '1', '1401951572500', '1', 'sdf');
INSERT INTO `e_res_mould` VALUES ('233', '1', 'sdf', 'sd', '1401951613562', '1', '1401951613562', '1', 'fsdf');
INSERT INTO `e_res_mould` VALUES ('234', '1', 'sdf', 'sdf', '1401951698812', '1', '1401951698812', '1', '');
INSERT INTO `e_res_mould` VALUES ('235', '1', 'sdf', 'sdf', '1401952260687', '1', '1401952260687', '1', 'sdf');
INSERT INTO `e_res_mould` VALUES ('236', '2', '123', '12', '1401952307968', '1', '1401952307968', '1', '3123');
INSERT INTO `e_res_mould` VALUES ('237', '1', 'sdf', 'sdf', '1401952419531', '1', '1401952419531', '1', 'dsf');
INSERT INTO `e_res_mould` VALUES ('238', '2', 'sdf', 'sd', '1401952477390', '1', '1401952477390', '1', 'fsdf');
INSERT INTO `e_res_mould` VALUES ('239', '1', 'sdf', 'sd', '1401952605281', '1', '1401952605281', '1', 'fdsf');
INSERT INTO `e_res_mould` VALUES ('240', '1', '123', '123', '1401952674281', '1', '1401952674281', '1', '123');
INSERT INTO `e_res_mould` VALUES ('241', '1', 'sdf', 'sdf', '1401952766687', '1', '1401952766687', '1', 'sdfds');
INSERT INTO `e_res_mould` VALUES ('242', '2', 'sdf', 'sdf', '1401952816406', '1', '1401952816406', '1', 'sdf');
INSERT INTO `e_res_mould` VALUES ('243', '1', 'sdf', 'sdf', '1401952881015', '1', '1401952881015', '1', 'dsf');
INSERT INTO `e_res_mould` VALUES ('244', '1', 'asd', 'das', '1401953016250', '1', '1401953016250', '1', 'dsa');
INSERT INTO `e_res_mould` VALUES ('245', '1', 'sdf', 'sdf', '1401953085421', '1', '1401953085421', '1', 'sdfs');
INSERT INTO `e_res_mould` VALUES ('246', '3', 'fsdf', 'sd', '1401953187187', '1', '1401953187187', '1', 'sdfsd');
INSERT INTO `e_res_mould` VALUES ('247', '1', 'sdf', 'sdf', '1401953269421', '1', '1401953269421', '1', 'sdf');
INSERT INTO `e_res_mould` VALUES ('248', '1', 'fds', 'fsd', '1401953340015', '1', '1401953340015', '1', 'fds');
INSERT INTO `e_res_mould` VALUES ('249', '1', 'sdf', 'sdf', '1401953379296', '1', '1401953379296', '1', 'sdfs');
INSERT INTO `e_res_mould` VALUES ('250', '1', 'sdf', 'sdf', '1401953532812', '1', '1401953532812', '1', 'sdf');
INSERT INTO `e_res_mould` VALUES ('251', '1', 'dsf', 'sdf', '1401953682734', '1', '1401953682734', '1', 'sdfsd');
INSERT INTO `e_res_mould` VALUES ('252', '1', '123', '12', '1401954010375', '1', '1401954010375', '1', '3123');
INSERT INTO `e_res_mould` VALUES ('253', '1', 'sdf', 'sdf', '1401954057593', '1', '1401954057593', '1', 'sdfs');
INSERT INTO `e_res_mould` VALUES ('254', '1', '时代发生的', '第三方', '1401954420625', '1', '1401954420625', '1', '水电费');
INSERT INTO `e_res_mould` VALUES ('255', '1', '时代发生的', '水电费', '1401954633296', '1', '1401954633296', '1', '水电费');
INSERT INTO `e_res_mould` VALUES ('256', '1', '12', '12', '1401954683203', '1', '1401954683203', '1', '');
INSERT INTO `e_res_mould` VALUES ('257', '1', '123', '1', '1401954783578', '1', '1401954783578', '1', '1');
INSERT INTO `e_res_mould` VALUES ('258', '1', '放到沙发上的', '水电费', '1401955240531', '1', '1401955240531', '1', '第三方');
INSERT INTO `e_res_mould` VALUES ('259', '1', '123', '1', '1401955295468', '1', '1401955295468', '1', '');
INSERT INTO `e_res_mould` VALUES ('260', '1', '撒', '撒', '1401955370906', '1', '1401955370906', '1', '按时');
INSERT INTO `e_res_mould` VALUES ('261', '1', 'sd', 'fsdf', '1401955557515', '1', '1401955557515', '1', 'sdf');
INSERT INTO `e_res_mould` VALUES ('262', '1', 'sd', 'sd', '1401955750156', '1', '1401955750156', '1', '');
INSERT INTO `e_res_mould` VALUES ('263', '1', 'sd', 'sd', '1401955815593', '1', '1401955815593', '1', 'sd');
INSERT INTO `e_res_mould` VALUES ('264', '2', 'fsd', 'sdf', '1401956098781', '1', '1401956098781', '1', 'sdfsd');
INSERT INTO `e_res_mould` VALUES ('265', '2', 'dfsd', 'f', '1401956213578', '1', '1401956213578', '1', 'sdfs');
INSERT INTO `e_res_mould` VALUES ('266', '1', '12', '12', '1401956317203', '1', '1401956317203', '1', '');
INSERT INTO `e_res_mould` VALUES ('267', '1', '12', '1', '1401956377453', '1', '1401956377453', '1', '');
INSERT INTO `e_res_mould` VALUES ('268', '1', '1', '1', '1401956459453', '1', '1401956459453', '1', '');
INSERT INTO `e_res_mould` VALUES ('269', '2', '1', '1', '1401956496406', '1', '1401956496406', '1', '');
INSERT INTO `e_res_mould` VALUES ('270', '2', '1', '1', '1401956569328', '1', '1401956569328', '1', '');
INSERT INTO `e_res_mould` VALUES ('271', '1', 'sd', 'sd', '1401956676890', '1', '1401956676890', '1', 'sd');
INSERT INTO `e_res_mould` VALUES ('272', '2', '2', '3', '1401956758250', '1', '1401956758250', '1', '3');
INSERT INTO `e_res_mould` VALUES ('273', '1', '12', '12', '1401956802812', '1', '1401956802812', '1', '');
INSERT INTO `e_res_mould` VALUES ('274', '1', '12', '1', '1401956829468', '1', '1401956829468', '1', '');
INSERT INTO `e_res_mould` VALUES ('275', '1', '1', '1', '1401956847375', '1', '1401956847375', '1', '1');
INSERT INTO `e_res_mould` VALUES ('276', '1', 'sd', 'sd', '1401956869296', '1', '1401956869296', '1', 'sd');
INSERT INTO `e_res_mould` VALUES ('277', '1', 'fd', 'df', '1401957203125', '1', '1401957203125', '1', '');
INSERT INTO `e_res_mould` VALUES ('278', '1', 'sds', 'sds', '1401961173312', '1', '1401961173312', '1', '');
INSERT INTO `e_res_mould` VALUES ('279', '1', 'sad', 'asd', '1401961541031', '1', '1401961541031', '1', 'asda');
INSERT INTO `e_res_mould` VALUES ('280', '1', '12', '12', '1401961595390', '1', '1401961595390', '1', '');
INSERT INTO `e_res_mould` VALUES ('281', '1', 'sdf', 'sdf', '1401961776109', '1', '1401961776109', '1', 'sdf');
INSERT INTO `e_res_mould` VALUES ('282', '1', 'sd', 'sd', '1401961907218', '1', '1401961907218', '1', 'sd');
INSERT INTO `e_res_mould` VALUES ('283', '1', 'asd', 'asd', '1401961995671', '1', '1401961995671', '1', '');
INSERT INTO `e_res_mould` VALUES ('284', '1', 'xzc', 'zxc', '1401962091453', '1', '1401962091453', '1', '');
INSERT INTO `e_res_mould` VALUES ('285', '1', 'gfh', 'fgh', '1401962150515', '1', '1401962150515', '1', 'fg');
INSERT INTO `e_res_mould` VALUES ('286', '1', '是对方的手', '水电费', '1402017022218', '1', '1402017022218', '1', '水电费');
INSERT INTO `e_res_mould` VALUES ('287', '1', '123', '123', '1402017107250', '1', '1402017107250', '1', '123');
INSERT INTO `e_res_mould` VALUES ('288', '1', '123', '123', '1402017294875', '1', '1402017294875', '1', '12312');
INSERT INTO `e_res_mould` VALUES ('289', '1', '123', '123', '1402017437875', '1', '1402017437875', '1', '123');
INSERT INTO `e_res_mould` VALUES ('290', '1', 'df', 'sdfsd', '1402017932515', '1', '1402017932515', '1', '');
INSERT INTO `e_res_mould` VALUES ('291', '2', 'fsd', 'fsd', '1402018154296', '1', '1402018154296', '1', '');
INSERT INTO `e_res_mould` VALUES ('292', '2', '123', '12', '1402018201296', '1', '1402018201296', '1', '3123');
INSERT INTO `e_res_mould` VALUES ('293', '3', '123', '123', '1402018332031', '1', '1402018332031', '1', '123');
INSERT INTO `e_res_mould` VALUES ('294', '1', '123', '123', '1402018369000', '1', '1402018369000', '1', '123');
INSERT INTO `e_res_mould` VALUES ('295', '2', 'sdf', 'sdf', '1402018546953', '1', '1402018546953', '1', 'sd');
INSERT INTO `e_res_mould` VALUES ('296', '1', '123', '123', '1402018815437', '1', '1402018815437', '1', '123');
INSERT INTO `e_res_mould` VALUES ('297', '1', 'fg', 'dfg', '1402018959390', '1', '1402018959390', '1', 'dfg');
INSERT INTO `e_res_mould` VALUES ('298', '2', '123', '123', '1402019139640', '1', '1402019139640', '1', '');
INSERT INTO `e_res_mould` VALUES ('299', '1', '123', '123', '1402019191828', '1', '1402019191828', '1', '');
INSERT INTO `e_res_mould` VALUES ('300', '1', '123', '123', '1402019252171', '1', '1402019252171', '1', '');
INSERT INTO `e_res_mould` VALUES ('301', '1', '12', '12', '1402019531500', '1', '1402019531500', '1', '');
INSERT INTO `e_res_mould` VALUES ('302', '1', '12', '12', '1402019620046', '1', '1402019620046', '1', '');
INSERT INTO `e_res_mould` VALUES ('303', '1', 'sdf', 'sdf', '1402019687250', '1', '1402019687250', '1', '');
INSERT INTO `e_res_mould` VALUES ('304', '1', '12', '12', '1402019754765', '1', '1402019754765', '1', '');
INSERT INTO `e_res_mould` VALUES ('305', '1', '12', '12', '1402019877781', '1', '1402019877781', '1', '');
INSERT INTO `e_res_mould` VALUES ('306', '1', '12', '12', '1402019957125', '1', '1402019957125', '1', '');
INSERT INTO `e_res_mould` VALUES ('307', '1', '12', '12', '1402019997531', '1', '1402019997531', '1', '');
INSERT INTO `e_res_mould` VALUES ('308', '1', '1231', '123', '1402021480734', '1', '1402021480734', '1', '');
INSERT INTO `e_res_mould` VALUES ('309', '2', '的萨芬大事', '师德师风', '1402021600234', '1', '1402021600234', '1', '水电费');
INSERT INTO `e_res_mould` VALUES ('310', '2', '斯蒂芬森', '水电费s', '1402021679281', '1', '1402021679281', '1', '水电费');
INSERT INTO `e_res_mould` VALUES ('311', '2', '东方时代', '水电费', '1402021791656', '1', '1402021791656', '1', 's');
INSERT INTO `e_res_mould` VALUES ('312', '1', '123', '123', '1402021919031', '1', '1402021919031', '1', '123');
INSERT INTO `e_res_mould` VALUES ('313', '1', '12', '123', '1402022081671', '1', '1402022081671', '1', '');
INSERT INTO `e_res_mould` VALUES ('314', '1', '123', '123', '1402022314453', '1', '1402022314453', '1', '');
INSERT INTO `e_res_mould` VALUES ('315', '2', '123', '123', '1402023464671', '1', '1402023464671', '1', '123');
INSERT INTO `e_res_mould` VALUES ('316', '1', 'saf', 'as', '1402023530359', '1', '1402023530359', '1', '');
INSERT INTO `e_res_mould` VALUES ('317', '2', '123', '123', '1402023983703', '1', '1402023983703', '1', '123');
INSERT INTO `e_res_mould` VALUES ('318', '2', 'sdf', 'sdf', '1402024241750', '1', '1402024241750', '1', 'sdf');
INSERT INTO `e_res_mould` VALUES ('319', '1', '123', '123', '1402025100671', '1', '1402025100671', '1', '');
INSERT INTO `e_res_mould` VALUES ('320', '1', 'dsf', 'fsd', '1402025300687', '1', '1402025300687', '1', 'fsdf');
INSERT INTO `e_res_mould` VALUES ('321', '1', 'asd', 'asd', '1402025324500', '1', '1402025324500', '1', 'asd');
INSERT INTO `e_res_mould` VALUES ('322', '1', 'asd', 'as', '1402025342390', '1', '1402025342390', '1', 'd');
INSERT INTO `e_res_mould` VALUES ('323', '1', '12', '123', '1402025482984', '1', '1402025482984', '1', '');
INSERT INTO `e_res_mould` VALUES ('324', '1', 'sdaf', 'sdf', '1402025535015', '1', '1402025535015', '1', 'sdf');
INSERT INTO `e_res_mould` VALUES ('325', '1', '123', '123', '1402025590312', '1', '1402025590312', '1', '');
INSERT INTO `e_res_mould` VALUES ('326', '1', '123', '123', '1402025606359', '1', '1402025606359', '1', '');
INSERT INTO `e_res_mould` VALUES ('327', '1', 'sdf', 'sdf', '1402025765062', '1', '1402025765062', '1', '');
INSERT INTO `e_res_mould` VALUES ('328', '1', 'df', 'sdf', '1402025894437', '1', '1402025894437', '1', '');
INSERT INTO `e_res_mould` VALUES ('329', '1', 'sdf', 'sdf', '1402025920218', '1', '1402025920218', '1', '');
INSERT INTO `e_res_mould` VALUES ('330', '1', 'sdf', 'sdf', '1402026173468', '1', '1402026173468', '1', '');
INSERT INTO `e_res_mould` VALUES ('331', '1', 'sdf', 'sdf', '1402026254312', '1', '1402026254312', '1', '');
INSERT INTO `e_res_mould` VALUES ('332', '1', '123', '123', '1402033493203', '1', '1402033493203', '1', '');
INSERT INTO `e_res_mould` VALUES ('333', '3', '水电费', '水电费', '1402033566531', '1', '1402033566531', '1', '');
INSERT INTO `e_res_mould` VALUES ('334', '1', '水电费', '水电费', '1402033589000', '1', '1402033589000', '1', '');
INSERT INTO `e_res_mould` VALUES ('335', '1', '当时发生大', '水电费', '1402033983953', '1', '1402033983953', '1', '');
INSERT INTO `e_res_mould` VALUES ('336', '2', '12', '12', '1402034420515', '1', '1402034420515', '1', '');
INSERT INTO `e_res_mould` VALUES ('337', '1', '123', '123', '1402035175031', '1', '1402035175031', '1', '');
INSERT INTO `e_res_mould` VALUES ('338', '1', '水电费', '第三方', '1402035284734', '1', '1402035284734', '1', '');
INSERT INTO `e_res_mould` VALUES ('339', '1', '123', '123', '1402035408359', '1', '1402035408359', '1', '');
INSERT INTO `e_res_mould` VALUES ('340', '1', '水电费', '水电费', '1402035438812', '1', '1402035438812', '1', '');
INSERT INTO `e_res_mould` VALUES ('341', '2', '水电费', '水电费', '1402035485828', '1', '1402035485828', '1', '');
INSERT INTO `e_res_mould` VALUES ('342', '1', '水电费', '水电费', '1402035564531', '1', '1402035564531', '1', '');
INSERT INTO `e_res_mould` VALUES ('343', '1', '水电费', '水电费', '1402035632312', '1', '1402035632312', '1', '');
INSERT INTO `e_res_mould` VALUES ('344', '1', '是对方的手', 'df', '1402035676890', '1', '1402035676890', '1', '');
INSERT INTO `e_res_mould` VALUES ('345', '1', 'sdf', 'sdf', '1402035712343', '1', '1402035712343', '1', 'sdf');
INSERT INTO `e_res_mould` VALUES ('346', '1', 'sds', 'sdfsd', '1402035755562', '1', '1402035755562', '1', '');
INSERT INTO `e_res_mould` VALUES ('347', '1', 'sdf', 'sdf', '1402035806312', '1', '1402035806312', '1', '');
INSERT INTO `e_res_mould` VALUES ('348', '1', 'as', 'as', '1402035906468', '1', '1402035906468', '1', '');
INSERT INTO `e_res_mould` VALUES ('349', '1', '当时发生大', '水电费', '1402036619234', '1', '1402036619234', '1', '');
INSERT INTO `e_res_mould` VALUES ('350', '1', 'sd', 'sd', '1402036716750', '1', '1402036716750', '1', '');
INSERT INTO `e_res_mould` VALUES ('351', '1', 'sd', 'sd', '1402036797593', '1', '1402036797593', '1', '');
INSERT INTO `e_res_mould` VALUES ('352', '1', '12', '12', '1402036914609', '1', '1402036914609', '1', '');
INSERT INTO `e_res_mould` VALUES ('353', '1', '123', '123', '1402038493765', '1', '1402038493765', '1', '123');
INSERT INTO `e_res_mould` VALUES ('354', '1', 'sdf', 'sdf', '1402038717015', '1', '1402038717015', '1', 'sdfs');
INSERT INTO `e_res_mould` VALUES ('355', '1', 'sdf', 'sdfsd', '1402038771437', '1', '1402038771437', '1', '');
INSERT INTO `e_res_mould` VALUES ('356', '2', '12', '12', '1402038927750', '1', '1402038927750', '1', '');
INSERT INTO `e_res_mould` VALUES ('357', '1', '123', '123', '1402039972546', '1', '1402039972546', '1', '');
INSERT INTO `e_res_mould` VALUES ('358', '1', '123', '123', '1402040057609', '1', '1402040057609', '1', '');
INSERT INTO `e_res_mould` VALUES ('359', '1', '12', '12', '1402040167843', '1', '1402040167843', '1', '');
INSERT INTO `e_res_mould` VALUES ('360', '2', '12', '123', '1402040208015', '1', '1402040208015', '1', '');
INSERT INTO `e_res_mould` VALUES ('361', '1', '12', '12', '1402040918015', '1', '1402040918015', '1', '');
INSERT INTO `e_res_mould` VALUES ('362', '1', '12', '12', '1402040967234', '1', '1402040967234', '1', '');
INSERT INTO `e_res_mould` VALUES ('363', '1', 'sdfg', 'sdfs', '1402041824656', '1', '1402041824656', '1', '');
INSERT INTO `e_res_mould` VALUES ('364', '1', '12', '12', '1402044573562', '1', '1402044573562', '1', '');
INSERT INTO `e_res_mould` VALUES ('365', '1', '12', '12', '1402044707375', '1', '1402044707375', '1', '');
INSERT INTO `e_res_mould` VALUES ('366', '1', '水电费', '水电费', '1402044774171', '1', '1402044774171', '1', '');
INSERT INTO `e_res_mould` VALUES ('367', '1', '斯蒂芬森', '水电费', '1402044805125', '1', '1402044805125', '1', '');
INSERT INTO `e_res_mould` VALUES ('368', '2', '123', '123', '1402044883890', '1', '1402044883890', '1', '');
INSERT INTO `e_res_mould` VALUES ('369', '1', '水电费', '第三方', '1402046514265', '1', '1402046514265', '1', '');
INSERT INTO `e_res_mould` VALUES ('370', '1', '123', '123', '1402046574921', '1', '1402046574921', '1', '');
INSERT INTO `e_res_mould` VALUES ('371', '1', '12', '12', '1402046627093', '1', '1402046627093', '1', '');
INSERT INTO `e_res_mould` VALUES ('372', '1', '吊死扶伤', '第三方', '1402046658359', '1', '1402046658359', '1', '');

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
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`Id`),
  KEY `dtId` (`dtId`),
  KEY `rmId` (`rmId`),
  CONSTRAINT `e_res_mould_data_unit_ibfk_1` FOREIGN KEY (`dtId`) REFERENCES `e_data_type` (`Id`),
  CONSTRAINT `e_res_mould_data_unit_ibfk_2` FOREIGN KEY (`rmId`) REFERENCES `e_res_mould` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='资源模型数据单元（数据单元用来给管理界面或操作界面设定范围值）';

-- ----------------------------
-- Records of e_res_mould_data_unit
-- ----------------------------
INSERT INTO `e_res_mould_data_unit` VALUES ('1', '2', '116', '包房名称数据单元(属性)', '1', null, null, null, '包房', null, null, '1399177695711', '1', '1399177695711', '1', '餐饮行业模型_包房的属性_包房名称的数据单元');
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
INSERT INTO `e_res_mould_data_unit_constant` VALUES ('3', '7', '现代', '1', '1399177695711', '1', '1399177695711', '1', null);
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
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`Id`),
  KEY `rmId` (`rmId`),
  KEY `daId` (`daId`),
  CONSTRAINT `e_res_mould_dim_ibfk_1` FOREIGN KEY (`rmId`) REFERENCES `e_res_mould` (`Id`),
  CONSTRAINT `e_res_mould_dim_ibfk_2` FOREIGN KEY (`daId`) REFERENCES `e_dim_algorithm` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COMMENT='资源模型维度表';

-- ----------------------------
-- Records of e_res_mould_dim
-- ----------------------------
INSERT INTO `e_res_mould_dim` VALUES ('1', '1', '1', '包房人数', 'RM#EateryRoom_D#NumberScope', '1399177695711', '1', '1399177695711', '1', '包房支持人数的维度');
INSERT INTO `e_res_mould_dim` VALUES ('2', '1', '3', '包房预定时间段', 'RM#EateryRoom_D#SimpleTime', '1399177695711', '1', '1399177695711', '1', '包房预定支持的时间段维度');
INSERT INTO `e_res_mould_dim` VALUES ('3', '1', '4', '包房最低消费', 'RM#EateryRoom_D#SimpleFindMate', '1399177695711', '1', '1399177695711', '1', '包房支持最低消费的维度');
INSERT INTO `e_res_mould_dim` VALUES ('5', '202', '2', 'sdfsd', 'fsdfsd', '1401937364546', '1', '1401937364546', '1', 'sdfsdfs');
INSERT INTO `e_res_mould_dim` VALUES ('6', '202', '1', 'sdfs', 'df', '1401937370140', '1', '1401937370140', '1', 'sdfsdf');
INSERT INTO `e_res_mould_dim` VALUES ('7', '202', '3', 'sfdas', 'fsdfds', '1401937386531', '1', '1401937386531', '1', 'sdfsdf');
INSERT INTO `e_res_mould_dim` VALUES ('8', '202', '2', 'sdf', 'sdfsd', '1401937440515', '1', '1401937440515', '1', 'sdfsd');
INSERT INTO `e_res_mould_dim` VALUES ('9', '203', '2', 'fdg', 'dfgdf', '1401943875062', '1', '1401943875062', '1', 'dfgfd');
INSERT INTO `e_res_mould_dim` VALUES ('10', '203', '1', 'dfg', 'dfgfd', '1401943880812', '1', '1401943880812', '1', 'dfgdfg');
INSERT INTO `e_res_mould_dim` VALUES ('11', '203', '1', 'fgfd', 'gdfg', '1401943889843', '1', '1401943889843', '1', 'dfgdf');
INSERT INTO `e_res_mould_dim` VALUES ('12', '204', '2', 'sdfs', 'fsd', '1401946957859', '1', '1401946957859', '1', 'fsdds');
INSERT INTO `e_res_mould_dim` VALUES ('13', '204', '3', 'sdf', 'sdfds', '1401946961671', '1', '1401946961671', '1', 'sdfsdf');
INSERT INTO `e_res_mould_dim` VALUES ('14', '204', '4', 'sdf', 'sdfds', '1401946965359', '1', '1401946965359', '1', 'sdfsdf');
INSERT INTO `e_res_mould_dim` VALUES ('15', '204', '2', 'sdf', 'sdfds', '1401946968718', '1', '1401946968718', '1', 'sdfsdf');
INSERT INTO `e_res_mould_dim` VALUES ('16', '204', '1', 'sdf', 'sdfds', '1401946972359', '1', '1401946972359', '1', 'sdfsdf');
INSERT INTO `e_res_mould_dim` VALUES ('17', '205', '3', 'sdf', 'sdf', '1401947110265', '1', '1401947110265', '1', 'sdfds');
INSERT INTO `e_res_mould_dim` VALUES ('18', '205', '2', 'sdf', 'sdf', '1401947113921', '1', '1401947113921', '1', 'dfsdf');
INSERT INTO `e_res_mould_dim` VALUES ('19', '205', '1', 'sdf', 'sdfsd', '1401947117203', '1', '1401947117203', '1', 'dfds');
INSERT INTO `e_res_mould_dim` VALUES ('20', '205', '4', 'fsdf', 'sdfsd', '1401947121562', '1', '1401947121562', '1', 'sdfdsf');
INSERT INTO `e_res_mould_dim` VALUES ('21', '205', '2', 'sdf', 'dsfsd', '1401947126078', '1', '1401947126078', '1', 'dfsdf');
INSERT INTO `e_res_mould_dim` VALUES ('22', '206', '2', 'sdf', 'sdfds', '1401947242593', '1', '1401947242593', '1', 'sdfsdf');
INSERT INTO `e_res_mould_dim` VALUES ('23', '206', '3', 'sdf', 'fsdf', '1401947247281', '1', '1401947247281', '1', 'sdfsdf');
INSERT INTO `e_res_mould_dim` VALUES ('24', '206', '1', 'sdf', 'sdfds', '1401947251171', '1', '1401947251171', '1', 'sdfdsf');
INSERT INTO `e_res_mould_dim` VALUES ('25', '206', '2', 'fdsa', 'fsdf', '1401947360046', '1', '1401947360046', '1', 'sdfsdf');
INSERT INTO `e_res_mould_dim` VALUES ('26', '208', '1', 'fds', 'fsdf', '1401947474875', '1', '1401947474875', '1', '');
INSERT INTO `e_res_mould_dim` VALUES ('27', '209', '1', 'sdf', 'sdfsd', '1401949641265', '1', '1401949641265', '1', 'sdfds');
INSERT INTO `e_res_mould_dim` VALUES ('28', '209', '3', 'sdf', 'sdfds', '1401949646640', '1', '1401949646640', '1', 'sdfsdf');
INSERT INTO `e_res_mould_dim` VALUES ('29', '209', '1', 'dsf', 'sdfds', '1401949710234', '1', '1401949710234', '1', 'sdfds');
INSERT INTO `e_res_mould_dim` VALUES ('30', '210', '2', 'sdf', 'sdf', '1401949734156', '1', '1401949734156', '1', 'sdfsd');
INSERT INTO `e_res_mould_dim` VALUES ('31', '211', '3', 'sdfad', 'fsafasd', '1401949778328', '1', '1401949778328', '1', 'sdfasdfa');
INSERT INTO `e_res_mould_dim` VALUES ('32', '212', '1', 'sdaf', 'asdf', '1401949805703', '1', '1401949805703', '1', 'asdf');
INSERT INTO `e_res_mould_dim` VALUES ('33', '213', '2', 'asdf', 'sadfas', '1401949856093', '1', '1401949856093', '1', 'asdfsd');
INSERT INTO `e_res_mould_dim` VALUES ('34', '214', '2', 'asdf', 'asdf', '1401950016484', '1', '1401950016484', '1', 'adsfasd');
INSERT INTO `e_res_mould_dim` VALUES ('35', '215', '2', 'asdf', 'fasdf', '1401950042703', '1', '1401950042703', '1', 'asdfsad');
INSERT INTO `e_res_mould_dim` VALUES ('36', '216', '3', 'fasd', 'fasdfasd', '1401950066359', '1', '1401950066359', '1', 'asdfsad');
INSERT INTO `e_res_mould_dim` VALUES ('37', '217', '2', 'asdf', 'sadfsa', '1401950100906', '1', '1401950100906', '1', 'asdfas');
INSERT INTO `e_res_mould_dim` VALUES ('38', '218', '3', 'asdf', 'asdf', '1401950306359', '1', '1401950306359', '1', 'adfasdf');
INSERT INTO `e_res_mould_dim` VALUES ('39', '219', '1', '123', '12312', '1401950384187', '1', '1401950384187', '1', '123123');
INSERT INTO `e_res_mould_dim` VALUES ('40', '220', '2', 'sdafs', 'afsd', '1401950458718', '1', '1401950458718', '1', 'asdfdsaf');
INSERT INTO `e_res_mould_dim` VALUES ('41', '221', '3', 'sdfsdf', 'sdfsd', '1401950580203', '1', '1401950580203', '1', 'sdfsd');
INSERT INTO `e_res_mould_dim` VALUES ('42', '222', '2', 'sdfa', 'sdfsd', '1401950635156', '1', '1401950635156', '1', 'sdfds');
INSERT INTO `e_res_mould_dim` VALUES ('43', '223', '2', '123', '123', '1401950695171', '1', '1401950695171', '1', '23123');
INSERT INTO `e_res_mould_dim` VALUES ('44', '224', '1', '123', '123', '1401950814015', '1', '1401950814015', '1', '123123');
INSERT INTO `e_res_mould_dim` VALUES ('45', '225', '3', 'sdf', 'sdfs', '1401950932828', '1', '1401950932828', '1', 'sdfds');
INSERT INTO `e_res_mould_dim` VALUES ('46', '226', '3', '123', '312', '1401950976218', '1', '1401950976218', '1', '23123');
INSERT INTO `e_res_mould_dim` VALUES ('47', '227', '2', '123', '123', '1401951180031', '1', '1401951180031', '1', '123123');
INSERT INTO `e_res_mould_dim` VALUES ('48', '228', '2', 'sdf', 'sdf', '1401951307859', '1', '1401951307859', '1', 'df');
INSERT INTO `e_res_mould_dim` VALUES ('49', '229', '2', 'sdf', 'sdf', '1401951393390', '1', '1401951393390', '1', 'sdf');
INSERT INTO `e_res_mould_dim` VALUES ('50', '230', '2', 'sdf', 'sdf', '1401951453859', '1', '1401951453859', '1', 'sdfs');
INSERT INTO `e_res_mould_dim` VALUES ('51', '231', '2', 'sdf', 'sdf', '1401951517671', '1', '1401951517671', '1', 'sdf');
INSERT INTO `e_res_mould_dim` VALUES ('52', '232', '2', 'sd', 'fsdf', '1401951580140', '1', '1401951580140', '1', 'sdfa');
INSERT INTO `e_res_mould_dim` VALUES ('53', '233', '2', 'sdf', 'sdf', '1401951618609', '1', '1401951618609', '1', 'sdf');
INSERT INTO `e_res_mould_dim` VALUES ('54', '234', '2', 'sdf', 'sdf', '1401951705859', '1', '1401951705859', '1', 'sdfsd');
INSERT INTO `e_res_mould_dim` VALUES ('55', '235', '3', 'sd', 'fsdf', '1401952268859', '1', '1401952268859', '1', 'sdf');
INSERT INTO `e_res_mould_dim` VALUES ('56', '236', '1', '12', '3123', '1401952313906', '1', '1401952313906', '1', '123');
INSERT INTO `e_res_mould_dim` VALUES ('57', '237', '2', 'sd', 'fsdf', '1401952425406', '1', '1401952425406', '1', 'sdfds');
INSERT INTO `e_res_mould_dim` VALUES ('58', '238', '2', 'sd', 'fsdf', '1401952483046', '1', '1401952483046', '1', 'sdfsd');
INSERT INTO `e_res_mould_dim` VALUES ('59', '239', '2', 'sd', 'fsd', '1401952612421', '1', '1401952612421', '1', 'sdfds');
INSERT INTO `e_res_mould_dim` VALUES ('60', '240', '2', '123', '123', '1401952680234', '1', '1401952680234', '1', '12312');
INSERT INTO `e_res_mould_dim` VALUES ('61', '241', '1', 'sdf', 'sdf', '1401952772734', '1', '1401952772734', '1', 'sdfds');
INSERT INTO `e_res_mould_dim` VALUES ('62', '242', '1', 'sdf', 'sdf', '1401952821953', '1', '1401952821953', '1', 'sdf');
INSERT INTO `e_res_mould_dim` VALUES ('63', '243', '2', 'sdf', 'sdf', '1401952886203', '1', '1401952886203', '1', 'sdfds');
INSERT INTO `e_res_mould_dim` VALUES ('65', '244', '2', 'asd', 'asd', '1401953027031', '1', '1401953027031', '1', 'asdasd');
INSERT INTO `e_res_mould_dim` VALUES ('66', '245', '2', 'sdf', 'sdf', '1401953091671', '1', '1401953091671', '1', 'sdfsd');
INSERT INTO `e_res_mould_dim` VALUES ('67', '246', '2', 'sdf', 'sdfsd', '1401953192812', '1', '1401953192812', '1', 'sdfd');
INSERT INTO `e_res_mould_dim` VALUES ('68', '247', '2', 'sdf', 'sdf', '1401953274046', '1', '1401953274046', '1', 'sdfs');
INSERT INTO `e_res_mould_dim` VALUES ('69', '248', '1', 'sdf', 'sdf', '1401953346390', '1', '1401953346390', '1', 'sdfsd');
INSERT INTO `e_res_mould_dim` VALUES ('70', '249', '2', 'sdf', 'sdf', '1401953383765', '1', '1401953383765', '1', 'sdfsd');
INSERT INTO `e_res_mould_dim` VALUES ('71', '250', '2', 'sdf', 'sdf', '1401953539656', '1', '1401953539656', '1', 'sdfsd');
INSERT INTO `e_res_mould_dim` VALUES ('72', '251', '2', 'sdf', 'sdf', '1401953688468', '1', '1401953688468', '1', 'sdf');
INSERT INTO `e_res_mould_dim` VALUES ('73', '252', '2', '12', '12312', '1401954017500', '1', '1401954017500', '1', '12312');
INSERT INTO `e_res_mould_dim` VALUES ('74', '253', '2', 'sdf', 'sdfds', '1401954064718', '1', '1401954064718', '1', 'sdfds');
INSERT INTO `e_res_mould_dim` VALUES ('75', '254', '1', '水电费', '水电费', '1401954427265', '1', '1401954427265', '1', '水电费');
INSERT INTO `e_res_mould_dim` VALUES ('76', '255', '2', '水电费', '水电费', '1401954641343', '1', '1401954641343', '1', '水电费');
INSERT INTO `e_res_mould_dim` VALUES ('77', '256', '2', '12', '12', '1401954689718', '1', '1401954689718', '1', '12');
INSERT INTO `e_res_mould_dim` VALUES ('78', '257', '1', '1', '1', '1401954790234', '1', '1401954790234', '1', '');
INSERT INTO `e_res_mould_dim` VALUES ('79', '258', '2', '123', '123', '1401955247390', '1', '1401955247390', '1', '123');
INSERT INTO `e_res_mould_dim` VALUES ('80', '259', '2', '12', '1', '1401955300984', '1', '1401955300984', '1', '1');
INSERT INTO `e_res_mould_dim` VALUES ('81', '260', '2', '是', '1', '1401955376890', '1', '1401955376890', '1', '1');
INSERT INTO `e_res_mould_dim` VALUES ('82', '261', '1', 'df', 'sdf', '1401955564156', '1', '1401955564156', '1', 'sdf');
INSERT INTO `e_res_mould_dim` VALUES ('83', '262', '2', 'sd', 'sd', '1401955756421', '1', '1401955756421', '1', 'sd');
INSERT INTO `e_res_mould_dim` VALUES ('84', '263', '2', 'sd', 'sd', '1401955820890', '1', '1401955820890', '1', 'sd');
INSERT INTO `e_res_mould_dim` VALUES ('85', '264', '1', 'asd', 'asd', '1401956104171', '1', '1401956104171', '1', 'asd');
INSERT INTO `e_res_mould_dim` VALUES ('86', '265', '2', 'sd', 'd', '1401956219265', '1', '1401956219265', '1', 'sd');
INSERT INTO `e_res_mould_dim` VALUES ('87', '266', '2', '12', '12', '1401956323312', '1', '1401956323312', '1', '12');
INSERT INTO `e_res_mould_dim` VALUES ('88', '267', '1', '1', '1', '1401956381734', '1', '1401956381734', '1', '1');
INSERT INTO `e_res_mould_dim` VALUES ('89', '268', '2', '1', '1', '1401956464796', '1', '1401956464796', '1', '1');
INSERT INTO `e_res_mould_dim` VALUES ('90', '269', '2', '1', '1', '1401956504140', '1', '1401956504140', '1', '1');
INSERT INTO `e_res_mould_dim` VALUES ('91', '270', '2', '1', '1', '1401956574156', '1', '1401956574156', '1', '1');
INSERT INTO `e_res_mould_dim` VALUES ('92', '271', '2', '1', '1', '1401956681953', '1', '1401956681953', '1', '1');
INSERT INTO `e_res_mould_dim` VALUES ('93', '272', '1', '3', '3', '1401956763906', '1', '1401956763906', '1', '3');
INSERT INTO `e_res_mould_dim` VALUES ('94', '273', '2', '1', '1', '1401956810218', '1', '1401956810218', '1', '11');
INSERT INTO `e_res_mould_dim` VALUES ('95', '274', '1', '1', '1', '1401956834078', '1', '1401956834078', '1', '1');
INSERT INTO `e_res_mould_dim` VALUES ('96', '275', '2', '1', '1', '1401956853859', '1', '1401956853859', '1', '1');
INSERT INTO `e_res_mould_dim` VALUES ('97', '276', '2', 'sd', 'sd', '1401956875406', '1', '1401956875406', '1', 'sd');
INSERT INTO `e_res_mould_dim` VALUES ('98', '278', '1', 'sdfs', 'dfsdf', '1401961189468', '1', '1401961189468', '1', 'sdf');
INSERT INTO `e_res_mould_dim` VALUES ('99', '279', '2', 'sad', 'asda', '1401961547437', '1', '1401961555187', '1', 'asd');
INSERT INTO `e_res_mould_dim` VALUES ('100', '280', '2', '1', '1', '1401961600218', '1', '1401961606921', '1', '1');
INSERT INTO `e_res_mould_dim` VALUES ('101', '281', '2', 'asd', 'asd', '1401961781640', '1', '1401961789781', '1', 'asd');
INSERT INTO `e_res_mould_dim` VALUES ('102', '283', '2', 'asd', 'asd', '1401962001968', '1', '1401962008078', '1', 'asd');
INSERT INTO `e_res_mould_dim` VALUES ('103', '284', '2', 'xc', 'zxcz', '1401962098734', '1', '1401962105921', '1', 'zxcz');
INSERT INTO `e_res_mould_dim` VALUES ('104', '285', '4', 'fgh', 'fghfg', '1401962160093', '1', '1401962175609', '1', 'fgh');
INSERT INTO `e_res_mould_dim` VALUES ('105', '286', '3', '水电费123', '第三方123', '1402017029015', '1', '1402017039625', '1', '水电费123');
INSERT INTO `e_res_mould_dim` VALUES ('106', '287', '1', '123', '123123', '1402017113593', '1', '1402017124921', '1', '123123');
INSERT INTO `e_res_mould_dim` VALUES ('107', '288', '3', '1231', '2312', '1402017301046', '1', '1402017314453', '1', '12312');
INSERT INTO `e_res_mould_dim` VALUES ('108', '289', '2', '123', '123', '1402017442625', '1', '1402017451375', '1', '123');
INSERT INTO `e_res_mould_dim` VALUES ('109', '290', '2', 'asda123', 'sdas123', '1402017937796', '1', '1402017946765', '1', 'asdas123');
INSERT INTO `e_res_mould_dim` VALUES ('110', '291', '1', 'sdf', 'sdf', '1402018159484', '1', '1402018165250', '1', 'sdf');
INSERT INTO `e_res_mould_dim` VALUES ('111', '292', '3', '123', '123', '1402018207515', '1', '1402018219078', '1', '3123');
INSERT INTO `e_res_mould_dim` VALUES ('112', '294', '2', '123', '12312', '1402018374593', '1', '1402018387656', '1', '12312123');
INSERT INTO `e_res_mould_dim` VALUES ('113', '295', '2', 'sdf', 'sdfds', '1402018554515', '1', '1402018563359', '1', 'sdf');
INSERT INTO `e_res_mould_dim` VALUES ('114', '296', '2', '1212', '3123', '1402018820093', '1', '1402018916671', '1', '123');
INSERT INTO `e_res_mould_dim` VALUES ('115', '297', '2', 'dfg234', 'dfg234', '1402018964546', '1', '1402018970328', '1', 'dfgdf');
INSERT INTO `e_res_mould_dim` VALUES ('116', '298', '1', '123', '123', '1402019144921', '1', '1402019149906', '1', '123');
INSERT INTO `e_res_mould_dim` VALUES ('117', '299', '2', '123', '12', '1402019196109', '1', '1402019201656', '1', '');
INSERT INTO `e_res_mould_dim` VALUES ('118', '300', '2', '213', '123', '1402019257234', '1', '1402019265453', '1', '123');
INSERT INTO `e_res_mould_dim` VALUES ('119', '301', '2', '12', '12', '1402019535890', '1', '1402019541031', '1', '12');
INSERT INTO `e_res_mould_dim` VALUES ('120', '302', '1', '12', '12', '1402019624578', '1', '1402019629531', '1', '');
INSERT INTO `e_res_mould_dim` VALUES ('121', '303', '2', 'sdf', 'sdf', '1402019693359', '1', '1402019698859', '1', 'sdf');
INSERT INTO `e_res_mould_dim` VALUES ('122', '304', '1', '1212', '1212', '1402019759546', '1', '1402019767453', '1', '1212');
INSERT INTO `e_res_mould_dim` VALUES ('123', '305', '2', '12', '12', '1402019883656', '1', '1402019890515', '1', '12');
INSERT INTO `e_res_mould_dim` VALUES ('124', '306', '2', '1212', '1212', '1402019962843', '1', '1402019968765', '1', '12');
INSERT INTO `e_res_mould_dim` VALUES ('125', '307', '4', '12', '12', '1402020005500', '1', '1402020011734', '1', '12');
INSERT INTO `e_res_mould_dim` VALUES ('126', '308', '2', '12', '3123', '1402021485562', '1', '1402021490984', '1', '123');
INSERT INTO `e_res_mould_dim` VALUES ('127', '309', '2', '阿桑地方', '暗示法', '1402021607343', '1', '1402021613281', '1', '第三方');
INSERT INTO `e_res_mould_dim` VALUES ('128', '310', '2', '水电费', '水电费', '1402021685703', '1', '1402021690671', '1', '水电费');
INSERT INTO `e_res_mould_dim` VALUES ('129', '311', '2', '第三方123', '第三方123', '1402021796484', '1', '1402021803296', '1', '第三方');
INSERT INTO `e_res_mould_dim` VALUES ('130', '312', '1', '123', '123', '1402021924453', '1', '1402021929890', '1', '13');
INSERT INTO `e_res_mould_dim` VALUES ('131', '313', '2', '123', '123', '1402022088187', '1', '1402022096078', '1', '123');
INSERT INTO `e_res_mould_dim` VALUES ('132', '314', '1', '123', '123', '1402022319640', '1', '1402022541015', '1', '123');
INSERT INTO `e_res_mould_dim` VALUES ('133', '315', '2', '123', '12312', '1402023474140', '1', '1402023480437', '1', '12321');
INSERT INTO `e_res_mould_dim` VALUES ('134', '316', '1', 'asd', 'asd', '1402023537609', '1', '1402023543718', '1', 'asd');
INSERT INTO `e_res_mould_dim` VALUES ('135', '317', '1', '123', '123', '1402023994015', '1', '1402023999453', '1', '123');
INSERT INTO `e_res_mould_dim` VALUES ('136', '318', '1', 'sdfsdf', 'sdfsdf', '1402024247875', '1', '1402024254687', '1', 'sdfsdf');
INSERT INTO `e_res_mould_dim` VALUES ('137', '319', '1', '123', '123', '1402025108171', '1', '1402025113968', '1', '123');
INSERT INTO `e_res_mould_dim` VALUES ('138', '322', '1', 'asd', 'asd', '1402025347453', '1', '1402025352593', '1', '');
INSERT INTO `e_res_mould_dim` VALUES ('139', '323', '2', '123', '123', '1402025488140', '1', '1402025493031', '1', '');
INSERT INTO `e_res_mould_dim` VALUES ('140', '324', '1', 'asf', 'asd', '1402025540468', '1', '1402025545828', '1', 'as');
INSERT INTO `e_res_mould_dim` VALUES ('141', '326', '1', '123', '123', '1402025611593', '1', '1402025617125', '1', '');
INSERT INTO `e_res_mould_dim` VALUES ('142', '327', '1', 'sdf', 'sdf', '1402025770500', '1', '1402025776375', '1', 'sdf');
INSERT INTO `e_res_mould_dim` VALUES ('143', '328', '1', 'dsa', 'fsdf', '1402025899140', '1', '1402025899140', '1', 'dsf');
INSERT INTO `e_res_mould_dim` VALUES ('144', '329', '1', 'sd', 'fsdf', '1402025925734', '1', '1402025930671', '1', '');
INSERT INTO `e_res_mould_dim` VALUES ('145', '330', '1', 'sdf', 'sdf', '1402026181359', '1', '1402026191203', '1', 'sdf');
INSERT INTO `e_res_mould_dim` VALUES ('146', '331', '1', 'sdf', 'sdf', '1402026261593', '1', '1402033477515', '1', '');
INSERT INTO `e_res_mould_dim` VALUES ('147', '332', '1', '123', '123', '1402033501390', '1', '1402033508656', '1', '');
INSERT INTO `e_res_mould_dim` VALUES ('148', '334', '1', '水电费', '水电费', '1402033597343', '1', '1402033643921', '1', '');
INSERT INTO `e_res_mould_dim` VALUES ('149', '335', '1', '水电费', '水电费', '1402033992046', '1', '1402034033625', '1', '');
INSERT INTO `e_res_mould_dim` VALUES ('150', '336', '2', '12', '12', '1402034427031', '1', '1402034427031', '1', '');
INSERT INTO `e_res_mould_dim` VALUES ('151', '337', '1', '123', '123', '1402035186437', '1', '1402035186437', '1', '');
INSERT INTO `e_res_mould_dim` VALUES ('152', '338', '1', '水电费', '水电费', '1402035291078', '1', '1402035291078', '1', '');
INSERT INTO `e_res_mould_dim` VALUES ('153', '339', '1', '12', '3', '1402035413562', '1', '1402035413562', '1', '');
INSERT INTO `e_res_mould_dim` VALUES ('154', '340', '1', '水电费', '第三方', '1402035445203', '1', '1402035445203', '1', '');
INSERT INTO `e_res_mould_dim` VALUES ('155', '341', '1', '水电费', '水电费', '1402035490937', '1', '1402035490937', '1', '');
INSERT INTO `e_res_mould_dim` VALUES ('156', '342', '2', '水电费', '水电费', '1402035570687', '1', '1402035570687', '1', '');
INSERT INTO `e_res_mould_dim` VALUES ('157', '343', '2', '水电费', '水电费', '1402035637296', '1', '1402035637296', '1', '');
INSERT INTO `e_res_mould_dim` VALUES ('158', '344', '1', 'sdf', 'sdf', '1402035682640', '1', '1402035682640', '1', '');
INSERT INTO `e_res_mould_dim` VALUES ('159', '345', '2', 'sdf', 'sdf', '1402035719671', '1', '1402035719671', '1', 'sdfds');
INSERT INTO `e_res_mould_dim` VALUES ('160', '346', '1', 'sdf', 'sdfs', '1402035761046', '1', '1402035778187', '1', 'dsfsd');
INSERT INTO `e_res_mould_dim` VALUES ('161', '351', '1', 'dsfs12', 'dfsd12', '1402036823656', '1', '1402036872406', '1', 'dsfsd');
INSERT INTO `e_res_mould_dim` VALUES ('162', '351', '1', 'sdfsd', 'fsdfs', '1402036850046', '1', '1402036850046', '1', 'sdfsdf');
INSERT INTO `e_res_mould_dim` VALUES ('163', '351', '1', 'sdfs', 'dfsdf', '1402036863093', '1', '1402036863093', '1', '');

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
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`Id`),
  KEY `rmId` (`rmId`),
  KEY `rmduId` (`rmduId`),
  CONSTRAINT `e_res_mould_property_ibfk_1` FOREIGN KEY (`rmId`) REFERENCES `e_res_mould` (`Id`),
  CONSTRAINT `e_res_mould_property_ibfk_2` FOREIGN KEY (`rmduId`) REFERENCES `e_res_mould_data_unit` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8 COMMENT='资源模型属性表';

-- ----------------------------
-- Records of e_res_mould_property
-- ----------------------------
INSERT INTO `e_res_mould_property` VALUES ('1', '1', '1', '包房名称', 'Name', 'RM#EateryRoom_P#Name', '1399177695711', '1', '1399177695711', '1', '餐饮行业 餐厅包房模型资源模型属性 包房名称');
INSERT INTO `e_res_mould_property` VALUES ('2', '1', '2', '是否允许吸烟', 'IsSmoke', 'RM#EateryRoom_P#IsSmoke', '1399177695711', '1', '1399177695711', '1', '餐饮行业 餐厅包房模型资源模型属性 包房是否允许吸烟');
INSERT INTO `e_res_mould_property` VALUES ('4', '1', '3', '包房面积', 'Area', 'RM#EateryRoom_P#Area', '1399177695711', '1', '1399177695711', '1', '餐饮行业 餐厅包房模型资源模型属性 包房面积');
INSERT INTO `e_res_mould_property` VALUES ('6', '1', '8', '包房风格', 'Style', 'RM#EateryRoom_P#Style', '1399177695711', '1', '1399177695711', '1', '风格');
INSERT INTO `e_res_mould_property` VALUES ('8', '113', '1', '面积', 'area', 'FULLAREA', '1401862860437', '1', '1401862860437', '1', 'DFSD');
INSERT INTO `e_res_mould_property` VALUES ('9', '101', '1', '第三方', '水电费', '水电费', '1401863474546', '1', '1401863474546', '1', '第三方');
INSERT INTO `e_res_mould_property` VALUES ('10', '114', '1', 'hello', 'dsfsad', 'dsfsdfs', '1401864647062', '1', '1401864647062', '1', 'dsfsdf');
INSERT INTO `e_res_mould_property` VALUES ('11', '114', '1', 'sdfsdd', 'fadsf', 'sadfasd', '1401864739671', '1', '1401864739671', '1', '');
INSERT INTO `e_res_mould_property` VALUES ('12', '114', '1', 'sdfdsafda', 'fsdfads', 'fadfa', '1401864754453', '1', '1401864754453', '1', 'fsdf ');
INSERT INTO `e_res_mould_property` VALUES ('13', '115', '1', '属性1', 'shuxing1', 'fullshuxing2', '1401864946453', '1', '1401864946453', '1', 'dsfdsfsdfsf');
INSERT INTO `e_res_mould_property` VALUES ('14', '115', '1', '属性2', 'shuxing2', 'fullshuxing2', '1401864964859', '1', '1401864964859', '1', '');
INSERT INTO `e_res_mould_property` VALUES ('15', '116', '1', 'fsdfad', 'fadf', 'adsfsa', '1401865059140', '1', '1401865059140', '1', 'sdfsadfadf');
INSERT INTO `e_res_mould_property` VALUES ('16', '116', '1', 'fsdaf', 'dfa', 'dfad', '1401865066453', '1', '1401865066453', '1', 'dfdasf');
INSERT INTO `e_res_mould_property` VALUES ('17', '116', '1', 'sdfada', 'fads', 'fasdf', '1401865074687', '1', '1401865074687', '1', 'sadfasfa');
INSERT INTO `e_res_mould_property` VALUES ('18', '116', '1', 'sdfa', 'dfa', 'sdfas', '1401865078531', '1', '1401865078531', '1', 'fasdfad');
INSERT INTO `e_res_mould_property` VALUES ('19', '116', '1', 'adsfas', 'fas', 'fasdf', '1401865084890', '1', '1401865084890', '1', 'dasfasdf');
INSERT INTO `e_res_mould_property` VALUES ('20', '116', '1', 'sadfds', 'fas', 'dfasd', '1401865088515', '1', '1401865088515', '1', 'asdfas');
INSERT INTO `e_res_mould_property` VALUES ('21', '116', '1', 'sdfasd', 'fasd', 'fasdfa', '1401865091609', '1', '1401865091609', '1', 'sdfasf');
INSERT INTO `e_res_mould_property` VALUES ('22', '116', '1', 'fdasfasd', 'fasd', 'fasdfasd', '1401865095453', '1', '1401865095453', '1', 'fasdf');
INSERT INTO `e_res_mould_property` VALUES ('23', '116', '1', 'sdfasd', 'fasdf', 'asdf', '1401865098968', '1', '1401865098968', '1', 'afdasf');
INSERT INTO `e_res_mould_property` VALUES ('24', '116', '1', 'fasdfads', 'fasd', 'fasdfa', '1401865102265', '1', '1401865102265', '1', 'sfdasf');
INSERT INTO `e_res_mould_property` VALUES ('25', '116', '1', 'afsdfas', 'df', 'sadfas', '1401865105140', '1', '1401865105140', '1', 'dfasdf');
INSERT INTO `e_res_mould_property` VALUES ('26', '116', '1', 'fasdfasd', 'ffadsf', 'sadfsad', '1401865109609', '1', '1401865109609', '1', 'asdfasdf');
INSERT INTO `e_res_mould_property` VALUES ('27', '116', '1', 'fasdfas', 'dfsadf', 'adfsdaf', '1401865113234', '1', '1401865113234', '1', 'asdfsaf');
INSERT INTO `e_res_mould_property` VALUES ('28', '116', '1', 'sadfasdfsad', 'fsdaf', 'dasfsa', '1401865117125', '1', '1401865117125', '1', 'dfsadfs');
INSERT INTO `e_res_mould_property` VALUES ('29', '116', '1', 'fsdaf', 'asdfas', 'dfsadfasd', '1401865120546', '1', '1401865120546', '1', 'fasdfsad');
INSERT INTO `e_res_mould_property` VALUES ('30', '116', '1', 'fsadfdsf', 'fasdfs', 'dafdsafsd', '1401865125187', '1', '1401865125187', '1', 'fdsafsd');
INSERT INTO `e_res_mould_property` VALUES ('31', '116', '1', 'fasdfsa', 'fsdafas', 'fsadfsa', '1401865129500', '1', '1401865129500', '1', 'fadsfas');
INSERT INTO `e_res_mould_property` VALUES ('32', '116', '1', 'fsadfasd', 'fsdafasd', 'fsdafsad', '1401865134015', '1', '1401865134015', '1', 'fsdafsdaf');
INSERT INTO `e_res_mould_property` VALUES ('33', '116', '1', 'fdsf', 'sadf', 'sdfasdf', '1401865143828', '1', '1401865143828', '1', 'sdafasd');
INSERT INTO `e_res_mould_property` VALUES ('34', '116', '1', 'sdfa', 'sdf', 'asdf', '1401865165078', '1', '1401865165078', '1', 'dsafas');
INSERT INTO `e_res_mould_property` VALUES ('35', '116', '1', 'fadsf', 'asd', 'fsdaf', '1401865208546', '1', '1401865208546', '1', 'fasdfsa');
INSERT INTO `e_res_mould_property` VALUES ('36', '117', '1', 'fsdaf', 'sadf', 'asdfd', '1401865359468', '1', '1401865359468', '1', 'aafd');
INSERT INTO `e_res_mould_property` VALUES ('37', '117', '1', 'fasd', 'sad', 'fdsaf', '1401865362140', '1', '1401865362140', '1', 'adsfas');
INSERT INTO `e_res_mould_property` VALUES ('38', '117', '1', 'asdf', 'safd', 'asdf', '1401865365218', '1', '1401865365218', '1', 'fads');
INSERT INTO `e_res_mould_property` VALUES ('39', '117', '1', 'asdf', 'asdf', 'asdf', '1401865367828', '1', '1401865367828', '1', 'fasd');
INSERT INTO `e_res_mould_property` VALUES ('40', '117', '1', 'sadfasd', 'fsd', 'fdsaf', '1401865370875', '1', '1401865370875', '1', 'fasd');
INSERT INTO `e_res_mould_property` VALUES ('41', '117', '1', 'sadf', 'dasf', 'asdf', '1401865373750', '1', '1401865373750', '1', 'asdf');
INSERT INTO `e_res_mould_property` VALUES ('42', '117', '1', 'sadfasd', 'fdsa', 'fsaf', '1401865377390', '1', '1401865377390', '1', 'fasd');
INSERT INTO `e_res_mould_property` VALUES ('43', '117', '1', 'asdfsadf', 'fasdf', 'dsaf', '1401865381140', '1', '1401865381140', '1', 'sdafsaf');
INSERT INTO `e_res_mould_property` VALUES ('44', '117', '1', 'fassdf', 'sf', 'asdf', '1401865384125', '1', '1401865384125', '1', 'sdfa');
INSERT INTO `e_res_mould_property` VALUES ('45', '117', '1', 'asdfasd', 'fsad', 'fsda', '1401865386890', '1', '1401865386890', '1', 'fsdaf');
INSERT INTO `e_res_mould_property` VALUES ('46', '117', '1', 'sadfasd', 'fs', 'dafsda', '1401865389625', '1', '1401865389625', '1', 'fsdaf');
INSERT INTO `e_res_mould_property` VALUES ('47', '117', '1', 'dsafsadf', 'sdf', 'adsfas', '1401865392609', '1', '1401865392609', '1', 'dfsadf');
INSERT INTO `e_res_mould_property` VALUES ('48', '117', '1', 'sadfasd', 'fsda', 'fsdaf', '1401865396000', '1', '1401865396000', '1', 'sdafads');
INSERT INTO `e_res_mould_property` VALUES ('49', '117', '1', 'sadfdsa', 'fsa', 'dfsdaf', '1401865400562', '1', '1401865400562', '1', 'sadfsadf');
INSERT INTO `e_res_mould_property` VALUES ('50', '117', '1', 'sdfadsf', 'dsaf', 'dsafdsafsa', '1401865741421', '1', '1401865741421', '1', '');
INSERT INTO `e_res_mould_property` VALUES ('51', '117', '1', 'sdf', 'sadf', 'sadf', '1401865747609', '1', '1401865747609', '1', 'sdafsd');
INSERT INTO `e_res_mould_property` VALUES ('66', '118', '1', '啊地方撒的', '水电费', '水电费', '1401866217828', '1', '1401866217828', '1', '撒旦法多少');
INSERT INTO `e_res_mould_property` VALUES ('67', '118', '1', '啊地方撒的', '水电费', '水电费', '1401866218000', '1', '1401866218000', '1', '撒旦法多少');
INSERT INTO `e_res_mould_property` VALUES ('68', '118', '1', '啊地方撒的', '水电费', '水电费', '1401866218281', '1', '1401866218281', '1', '撒旦法多少');
INSERT INTO `e_res_mould_property` VALUES ('77', '119', '1', '发生地方', '的发送端', '发送端 ', '1401867540625', '1', '1401867540625', '1', '带饭是');
INSERT INTO `e_res_mould_property` VALUES ('78', '119', '1', '发生地方', '的发送端', '发送端 ', '1401867541359', '1', '1401867541359', '1', '带饭是');
INSERT INTO `e_res_mould_property` VALUES ('79', '119', '1', '发生地方', '的发送端', '发送端 ', '1401867541546', '1', '1401867541546', '1', '带饭是');
INSERT INTO `e_res_mould_property` VALUES ('80', '119', '1', '发生地方', '的发送端', '发送端 ', '1401867541671', '1', '1401867541671', '1', '带饭是');
INSERT INTO `e_res_mould_property` VALUES ('81', '119', '1', '发生地方', '的发送端', '发送端 ', '1401867541843', '1', '1401867541843', '1', '带饭是');
INSERT INTO `e_res_mould_property` VALUES ('82', '119', '1', '发生地方', '的发送端', '发送端 ', '1401867542078', '1', '1401867542078', '1', '带饭是');
INSERT INTO `e_res_mould_property` VALUES ('83', '119', '1', '发生地方', '的发送端', '发送端 ', '1401867542250', '1', '1401867542250', '1', '带饭是');
INSERT INTO `e_res_mould_property` VALUES ('84', '119', '1', '发生地方', '的发送端', '发送端 ', '1401867542515', '1', '1401867542515', '1', '带饭是');
INSERT INTO `e_res_mould_property` VALUES ('85', '119', '1', '发生地方', '的发送端', '发送端 ', '1401867542562', '1', '1401867542562', '1', '带饭是');
INSERT INTO `e_res_mould_property` VALUES ('86', '119', '1', '发生地方', '的发送端', '发送端 ', '1401867542750', '1', '1401867542750', '1', '带饭是');
INSERT INTO `e_res_mould_property` VALUES ('87', '119', '1', '发生地方', '的发送端', '发送端 ', '1401867542890', '1', '1401867542890', '1', '带饭是');
INSERT INTO `e_res_mould_property` VALUES ('88', '119', '1', '发生地方', '的发送端', '发送端 ', '1401867543062', '1', '1401867543062', '1', '带饭是');
INSERT INTO `e_res_mould_property` VALUES ('89', '119', '1', '发生地方', '的发送端', '发送端 ', '1401867543234', '1', '1401867543234', '1', '带饭是');
INSERT INTO `e_res_mould_property` VALUES ('90', '119', '1', '发生地方', '的发送端', '发送端 ', '1401867543343', '1', '1401867543343', '1', '带饭是');
INSERT INTO `e_res_mould_property` VALUES ('91', '119', '1', '发生地方', '的发送端', '发送端 ', '1401867543500', '1', '1401867543500', '1', '带饭是');
INSERT INTO `e_res_mould_property` VALUES ('92', '119', '1', '发生地方', '的发送端', '发送端 ', '1401867543671', '1', '1401867543671', '1', '带饭是');
INSERT INTO `e_res_mould_property` VALUES ('93', '119', '1', '发生地方', '的发送端', '发送端 ', '1401867543812', '1', '1401867543812', '1', '带饭是');
INSERT INTO `e_res_mould_property` VALUES ('94', '119', '1', '发生地方', '的发送端', '发送端 ', '1401867544093', '1', '1401867544093', '1', '带饭是');
INSERT INTO `e_res_mould_property` VALUES ('95', '119', '1', '发生地方', '的发送端', '发送端 ', '1401867544234', '1', '1401867544234', '1', '带饭是');
INSERT INTO `e_res_mould_property` VALUES ('96', '119', '1', '发生地方', '的发送端', '发送端 ', '1401867544390', '1', '1401867544390', '1', '带饭是');
INSERT INTO `e_res_mould_property` VALUES ('97', '119', '1', '发生地方', '的发送端', '发送端 ', '1401867544562', '1', '1401867544562', '1', '带饭是');
INSERT INTO `e_res_mould_property` VALUES ('98', '119', '1', '发生地方', '的发送端', '发送端 ', '1401867544718', '1', '1401867544718', '1', '带饭是');
INSERT INTO `e_res_mould_property` VALUES ('99', '119', '1', '发生地方', '的发送端', '发送端 ', '1401867545031', '1', '1401867545031', '1', '带饭是');
INSERT INTO `e_res_mould_property` VALUES ('100', '119', '1', '发生地方', '的发送端', '发送端 ', '1401867545640', '1', '1401867545640', '1', '带饭是');
INSERT INTO `e_res_mould_property` VALUES ('101', '119', '1', '发是对方的手', '谁的', '水电费', '1401867607187', '1', '1401867607187', '1', '带饭收到');
INSERT INTO `e_res_mould_property` VALUES ('102', '120', '1', '打算', ' 按时', '的按时', '1401867733250', '1', '1401867733250', '1', '按时的啊');
INSERT INTO `e_res_mould_property` VALUES ('103', '120', '1', '打算', ' 按时', '的按时', '1401867733515', '1', '1401867733515', '1', '按时的啊');
INSERT INTO `e_res_mould_property` VALUES ('104', '120', '1', '打算', ' 按时', '的按时', '1401867733578', '1', '1401867733578', '1', '按时的啊');
INSERT INTO `e_res_mould_property` VALUES ('105', '120', '1', '打算', ' 按时', '的按时', '1401867733875', '1', '1401867733875', '1', '按时的啊');
INSERT INTO `e_res_mould_property` VALUES ('106', '120', '1', '打算', ' 按时', '的按时', '1401867734046', '1', '1401867734046', '1', '按时的啊');
INSERT INTO `e_res_mould_property` VALUES ('107', '120', '1', '打算', ' 按时', '的按时', '1401867734203', '1', '1401867734203', '1', '按时的啊');
INSERT INTO `e_res_mould_property` VALUES ('108', '120', '1', '打算', ' 按时', '的按时', '1401867734343', '1', '1401867734343', '1', '按时的啊');
INSERT INTO `e_res_mould_property` VALUES ('109', '120', '1', '打算', ' 按时', '的按时', '1401867734468', '1', '1401867734468', '1', '按时的啊');
INSERT INTO `e_res_mould_property` VALUES ('110', '120', '1', '打算', ' 按时', '的按时', '1401867734625', '1', '1401867734625', '1', '按时的啊');
INSERT INTO `e_res_mould_property` VALUES ('111', '120', '1', '打算', ' 按时', '的按时', '1401867734968', '1', '1401867734968', '1', '按时的啊');
INSERT INTO `e_res_mould_property` VALUES ('112', '120', '1', '打算', ' 按时', '的按时', '1401867735125', '1', '1401867735125', '1', '按时的啊');
INSERT INTO `e_res_mould_property` VALUES ('113', '120', '1', '打算', ' 按时', '的按时', '1401867735406', '1', '1401867735406', '1', '按时的啊');
INSERT INTO `e_res_mould_property` VALUES ('114', '120', '1', '打算', ' 按时', '的按时', '1401867735968', '1', '1401867735968', '1', '按时的啊');
INSERT INTO `e_res_mould_property` VALUES ('115', '120', '1', '打算', ' 按时', '的按时', '1401867736109', '1', '1401867736109', '1', '按时的啊');
INSERT INTO `e_res_mould_property` VALUES ('116', '120', '1', '打算', ' 按时', '的按时', '1401867736250', '1', '1401867736250', '1', '按时的啊');
INSERT INTO `e_res_mould_property` VALUES ('117', '120', '1', '打算', ' 按时', '的按时', '1401867736406', '1', '1401867736406', '1', '按时的啊');
INSERT INTO `e_res_mould_property` VALUES ('118', '120', '1', '打算', ' 按时', '的按时', '1401867736562', '1', '1401867736562', '1', '按时的啊');
INSERT INTO `e_res_mould_property` VALUES ('119', '120', '1', '打算', ' 按时', '的按时', '1401867736703', '1', '1401867736703', '1', '按时的啊');
INSERT INTO `e_res_mould_property` VALUES ('120', '120', '1', '打算', ' 按时', '的按时', '1401867736875', '1', '1401867736875', '1', '按时的啊');
INSERT INTO `e_res_mould_property` VALUES ('121', '120', '1', '打算', ' 按时', '的按时', '1401867737000', '1', '1401867737000', '1', '按时的啊');
INSERT INTO `e_res_mould_property` VALUES ('122', '120', '1', '打算', ' 按时', '的按时', '1401867737218', '1', '1401867737218', '1', '按时的啊');
INSERT INTO `e_res_mould_property` VALUES ('123', '120', '1', '打算', ' 按时', '的按时', '1401867737406', '1', '1401867737406', '1', '按时的啊');
INSERT INTO `e_res_mould_property` VALUES ('124', '120', '1', '打算', ' 按时', '的按时', '1401867737562', '1', '1401867737562', '1', '按时的啊');
INSERT INTO `e_res_mould_property` VALUES ('125', '120', '1', '打算', ' 按时', '的按时', '1401867738218', '1', '1401867738218', '1', '按时的啊');
INSERT INTO `e_res_mould_property` VALUES ('126', '120', '1', '打算', '发生的发生的', '的按时', '1401867752390', '1', '1401867752390', '1', '按时的啊');
INSERT INTO `e_res_mould_property` VALUES ('127', '120', '1', '打算时代发生的发', 'sdfsdf', '水电费是是', '1401867768812', '1', '1401867768812', '1', '按时的啊sdfd');
INSERT INTO `e_res_mould_property` VALUES ('128', '121', '1', '水电费第三方', '水电费', '收到', '1401867844656', '1', '1401867844656', '1', '水电费水电费');
INSERT INTO `e_res_mould_property` VALUES ('129', '121', '1', '水电费第三方', '水电费', '收到', '1401867844937', '1', '1401867844937', '1', '水电费水电费');
INSERT INTO `e_res_mould_property` VALUES ('130', '121', '1', '水电费第三方', '水电费', '收到', '1401867844968', '1', '1401867844968', '1', '水电费水电费');
INSERT INTO `e_res_mould_property` VALUES ('131', '121', '1', '水电费第三方', '水电费', '收到', '1401867845140', '1', '1401867845140', '1', '水电费水电费');
INSERT INTO `e_res_mould_property` VALUES ('132', '121', '1', '水电费第三方', '水电费', '收到', '1401867845328', '1', '1401867845328', '1', '水电费水电费');
INSERT INTO `e_res_mould_property` VALUES ('133', '121', '1', '水电费第三方', '水电费', '收到', '1401867845531', '1', '1401867845531', '1', '水电费水电费');
INSERT INTO `e_res_mould_property` VALUES ('134', '121', '1', '水电费第三方', '水电费', '收到', '1401867845734', '1', '1401867845734', '1', '水电费水电费');
INSERT INTO `e_res_mould_property` VALUES ('135', '121', '1', '水电费第三方', '水电费', '收到', '1401867845968', '1', '1401867845968', '1', '水电费水电费');
INSERT INTO `e_res_mould_property` VALUES ('136', '121', '1', '水电费第三方', '水电费', '收到', '1401867846187', '1', '1401867846187', '1', '水电费水电费');
INSERT INTO `e_res_mould_property` VALUES ('137', '121', '1', '水电费第三方', '水电费', '收到', '1401867846390', '1', '1401867846390', '1', '水电费水电费');
INSERT INTO `e_res_mould_property` VALUES ('138', '121', '1', '水电费第三方', '水电费', '收到', '1401867846453', '1', '1401867846453', '1', '水电费水电费');
INSERT INTO `e_res_mould_property` VALUES ('139', '121', '1', '水电费第三方', '水电费', '收到', '1401867846625', '1', '1401867846625', '1', '水电费水电费');
INSERT INTO `e_res_mould_property` VALUES ('140', '121', '1', '水电费第三方', '水电费', '收到', '1401867846859', '1', '1401867846859', '1', '水电费水电费');
INSERT INTO `e_res_mould_property` VALUES ('141', '121', '1', '水电费第三方', '水电费', '收到', '1401867847031', '1', '1401867847031', '1', '水电费水电费');
INSERT INTO `e_res_mould_property` VALUES ('142', '121', '1', '水电费第三方', '水电费', '收到', '1401867847343', '1', '1401867847343', '1', '水电费水电费');
INSERT INTO `e_res_mould_property` VALUES ('143', '121', '1', '水电费第三方', '水电费', '收到', '1401867847484', '1', '1401867847484', '1', '水电费水电费');
INSERT INTO `e_res_mould_property` VALUES ('144', '121', '1', '水电费第三方', '水电费', '收到', '1401867847656', '1', '1401867847656', '1', '水电费水电费');
INSERT INTO `e_res_mould_property` VALUES ('145', '121', '1', '水电费第三方', '水电费', '收到', '1401867847953', '1', '1401867847953', '1', '水电费水电费');
INSERT INTO `e_res_mould_property` VALUES ('146', '121', '1', '水电费第三方', '水电费', '收到', '1401867848109', '1', '1401867848109', '1', '水电费水电费');
INSERT INTO `e_res_mould_property` VALUES ('147', '121', '1', '水电费第三方', '水电费', '收到', '1401867848281', '1', '1401867848281', '1', '水电费水电费');
INSERT INTO `e_res_mould_property` VALUES ('148', '121', '1', '水电费第三方', '水电费', '收到', '1401867848953', '1', '1401867848953', '1', '水电费水电费');
INSERT INTO `e_res_mould_property` VALUES ('149', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867930453', '1', '1401867930453', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('150', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867930718', '1', '1401867930718', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('151', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867930765', '1', '1401867930765', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('152', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867930953', '1', '1401867930953', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('153', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867931093', '1', '1401867931093', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('154', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867931312', '1', '1401867931312', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('155', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867931453', '1', '1401867931453', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('156', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867931578', '1', '1401867931578', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('157', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867931734', '1', '1401867931734', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('158', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867931968', '1', '1401867931968', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('159', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867932031', '1', '1401867932031', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('160', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867932156', '1', '1401867932156', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('161', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867932375', '1', '1401867932375', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('162', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867932515', '1', '1401867932515', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('163', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867932640', '1', '1401867932640', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('164', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867932812', '1', '1401867932812', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('165', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867932953', '1', '1401867932953', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('166', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867933093', '1', '1401867933093', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('167', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867933390', '1', '1401867933390', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('168', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867933562', '1', '1401867933562', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('169', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867933718', '1', '1401867933718', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('170', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867933906', '1', '1401867933906', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('171', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867934078', '1', '1401867934078', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('172', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867934328', '1', '1401867934328', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('173', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867934453', '1', '1401867934453', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('174', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867934609', '1', '1401867934609', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('175', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867935687', '1', '1401867935687', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('176', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867935890', '1', '1401867935890', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('177', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867936062', '1', '1401867936062', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('178', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867936250', '1', '1401867936250', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('179', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867936515', '1', '1401867936515', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('180', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867936781', '1', '1401867936781', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('181', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867936953', '1', '1401867936953', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('182', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867937093', '1', '1401867937093', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('183', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867937296', '1', '1401867937296', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('184', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867937484', '1', '1401867937484', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('185', '123', '1', '撒旦法啊', '阿桑地方', '阿桑地方按时', '1401867939531', '1', '1401867939531', '1', '撒旦法');
INSERT INTO `e_res_mould_property` VALUES ('186', '124', '1', '是对方的手', '水电费', '东方时代', '1401869080781', '1', '1401869080781', '1', '水电费收到');
INSERT INTO `e_res_mould_property` VALUES ('187', '124', '1', '是对方的手', '水电费', '东方时代', '1401869081796', '1', '1401869081796', '1', '水电费收到');
INSERT INTO `e_res_mould_property` VALUES ('188', '124', '1', '是对方的手', '水电费', '东方时代', '1401869082000', '1', '1401869082000', '1', '水电费收到');
INSERT INTO `e_res_mould_property` VALUES ('189', '124', '1', '是对方的手', '水电费', '东方时代', '1401869082093', '1', '1401869082093', '1', '水电费收到');
INSERT INTO `e_res_mould_property` VALUES ('190', '124', '1', '是对方的手', '水电费', '东方时代', '1401869082234', '1', '1401869082234', '1', '水电费收到');
INSERT INTO `e_res_mould_property` VALUES ('191', '124', '1', '是对方的手', '水电费', '东方时代', '1401869082687', '1', '1401869082687', '1', '水电费收到');
INSERT INTO `e_res_mould_property` VALUES ('192', '124', '1', '是对方的手', '水电费', '东方时代', '1401869082875', '1', '1401869082875', '1', '水电费收到');
INSERT INTO `e_res_mould_property` VALUES ('193', '124', '1', '是对方的手', '水电费', '东方时代', '1401869083062', '1', '1401869083062', '1', '水电费收到');
INSERT INTO `e_res_mould_property` VALUES ('194', '124', '1', '是对方的手', '水电费', '东方时代', '1401869083187', '1', '1401869083187', '1', '水电费收到');
INSERT INTO `e_res_mould_property` VALUES ('195', '124', '1', '是对方的手', '水电费', '东方时代', '1401869083390', '1', '1401869083390', '1', '水电费收到');
INSERT INTO `e_res_mould_property` VALUES ('196', '124', '1', '是对方的手', '水电费', '东方时代', '1401869240125', '1', '1401869240125', '1', '水电费收到');
INSERT INTO `e_res_mould_property` VALUES ('197', '124', '1', '是对方的手', '水电费', '东方时代', '1401869240437', '1', '1401869240437', '1', '水电费收到');
INSERT INTO `e_res_mould_property` VALUES ('198', '124', '1', '是对方的手', '水电费', '东方时代', '1401869240781', '1', '1401869240781', '1', '水电费收到');
INSERT INTO `e_res_mould_property` VALUES ('199', '124', '1', '是对方的手', '水电费', '东方时代', '1401869240937', '1', '1401869240937', '1', '水电费收到');
INSERT INTO `e_res_mould_property` VALUES ('200', '124', '1', '是对方的手', '水电费', '东方时代', '1401869242687', '1', '1401869242687', '1', '水电费收到');
INSERT INTO `e_res_mould_property` VALUES ('201', '124', '1', '是对方的手', '水电费', '水电费', '1401869395234', '1', '1401869395234', '1', '水电费');
INSERT INTO `e_res_mould_property` VALUES ('202', '124', '1', '斯蒂芬森', '水电费', '水电费', '1401869491343', '1', '1401869491343', '1', '');
INSERT INTO `e_res_mould_property` VALUES ('203', '125', '1', '水电费456sdfsd', '水电费456sdfds', '水电费456sdfsd', '1401870165390', '1', '1401870588453', '1', 'sdfdsf水电费456s');
INSERT INTO `e_res_mould_property` VALUES ('229', '128', '1', '12312', '3', '12321', '1401871094703', '1', '1401871094703', '1', '312321');
INSERT INTO `e_res_mould_property` VALUES ('230', '128', '1', '', '', '', '1401871095140', '1', '1401871095140', '1', '');
INSERT INTO `e_res_mould_property` VALUES ('231', '128', '1', '', '', '', '1401871095328', '1', '1401871095328', '1', '');
INSERT INTO `e_res_mould_property` VALUES ('232', '128', '1', '', '', '', '1401871095500', '1', '1401871095500', '1', '');
INSERT INTO `e_res_mould_property` VALUES ('233', '128', '1', '', '', '', '1401871095859', '1', '1401871095859', '1', '');
INSERT INTO `e_res_mould_property` VALUES ('234', '128', '1', '123', '123', '123', '1401871098703', '1', '1401871098703', '1', '12321');
INSERT INTO `e_res_mould_property` VALUES ('235', '128', '1', '123', '123', '123', '1401871101437', '1', '1401871101437', '1', '213');
INSERT INTO `e_res_mould_property` VALUES ('236', '128', '1', '123', '123', '213', '1401871103718', '1', '1401871103718', '1', '213');
INSERT INTO `e_res_mould_property` VALUES ('237', '128', '1', '123', '123', '12', '1401871107015', '1', '1401871107015', '1', '3213');
INSERT INTO `e_res_mould_property` VALUES ('238', '129', '1', 'dsafsd', 'fsd', 'fsdfsd', '1401872346234', '1', '1401872346234', '1', 'fdsfdsfsd');
INSERT INTO `e_res_mould_property` VALUES ('239', '129', '1', '', '', '', '1401872347125', '1', '1401872347125', '1', '');
INSERT INTO `e_res_mould_property` VALUES ('240', '129', '1', 'sdfsd', 'f', 'df', '1401872349984', '1', '1401872349984', '1', 'dfsd');
INSERT INTO `e_res_mould_property` VALUES ('241', '129', '1', 'sdf', 'sdf', 'sdf', '1401872353843', '1', '1401872353843', '1', 'sdfsdf');
INSERT INTO `e_res_mould_property` VALUES ('242', '129', '1', 'fsdf', 'sf', 'dsf', '1401872357031', '1', '1401872357031', '1', 'sdfds');
INSERT INTO `e_res_mould_property` VALUES ('243', '129', '1', '时代发生的', '发', '水电费', '1401873138000', '1', '1401873138000', '1', '水电费');
INSERT INTO `e_res_mould_property` VALUES ('244', '150', '1', 'sdfs123', 'df123', 'sdfs123', '1401875607609', '1', '1401875627000', '1', ' dfsd123');
INSERT INTO `e_res_mould_property` VALUES ('245', '150', '1', 'sdf', 'sd', 'fds', '1401875614156', '1', '1401875614156', '1', 'sdfsd');
INSERT INTO `e_res_mould_property` VALUES ('246', '164', '1', 'fsd123', 'af123', 'dsafdsa123', '1401930807078', '1', '1401930823265', '1', ' fsadf123');
INSERT INTO `e_res_mould_property` VALUES ('247', '164', '1', 'fsd', 'af', 'dsafdsa', '1401930809437', '1', '1401930809437', '1', 'fsadf');
INSERT INTO `e_res_mould_property` VALUES ('248', '164', '1', 'fsd', 'af', 'dsafdsa', '1401930810046', '1', '1401930810046', '1', 'fsadf');
INSERT INTO `e_res_mould_property` VALUES ('249', '164', '1', 'fsd', 'af', 'dsafdsa', '1401930810359', '1', '1401930810359', '1', 'fsadf');
INSERT INTO `e_res_mould_property` VALUES ('250', '164', '1', 'fsd', 'af', 'dsafdsa', '1401930810750', '1', '1401930810750', '1', 'fsadf');
INSERT INTO `e_res_mould_property` VALUES ('251', '164', '1', 'fsd', 'af', 'dsafdsa', '1401930810906', '1', '1401930810906', '1', 'fsadf');
INSERT INTO `e_res_mould_property` VALUES ('252', '164', '1', 'fsd', 'af', 'dsafdsa', '1401930811078', '1', '1401930811078', '1', 'fsadf');
INSERT INTO `e_res_mould_property` VALUES ('253', '164', '1', 'fsd', 'af', 'dsafdsa', '1401930811437', '1', '1401930811437', '1', 'fsadf');
INSERT INTO `e_res_mould_property` VALUES ('254', '164', '1', 'fsd', 'af', 'dsafdsa', '1401930811593', '1', '1401930811593', '1', 'fsadf');
INSERT INTO `e_res_mould_property` VALUES ('255', '164', '1', 'fsd', 'af', 'dsafdsa', '1401930811765', '1', '1401930811765', '1', 'fsadf');
INSERT INTO `e_res_mould_property` VALUES ('256', '164', '1', 'fsd', 'af', 'dsafdsa', '1401930811937', '1', '1401930811937', '1', 'fsadf');
INSERT INTO `e_res_mould_property` VALUES ('257', '164', '1', 'fsd', 'af', 'dsafdsa', '1401930812093', '1', '1401930812093', '1', 'fsadf');
INSERT INTO `e_res_mould_property` VALUES ('258', '164', '1', 'fsd', 'af', 'dsafdsa', '1401930812265', '1', '1401930812265', '1', 'fsadf');
INSERT INTO `e_res_mould_property` VALUES ('259', '164', '1', 'fsd', 'af', 'dsafdsa', '1401930812421', '1', '1401930812421', '1', 'fsadf');
INSERT INTO `e_res_mould_property` VALUES ('260', '164', '1', 'fsd', 'af', 'dsafdsa', '1401930813000', '1', '1401930813000', '1', 'fsadf');
INSERT INTO `e_res_mould_property` VALUES ('261', '348', '1', 'as12', 'as12', 'as12', '1402035918328', '1', '1402035925343', '1', ' asas12');
INSERT INTO `e_res_mould_property` VALUES ('262', '352', '1', '12', '12', '12', '1402036922187', '1', '1402036922187', '1', '12');

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
