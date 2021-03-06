-- MySQL dump 10.13  Distrib 5.7.16, for Linux (x86_64)
--
-- Host: localhost    Database: xihaxueche
-- ------------------------------------------------------
-- Server version	5.7.16-1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cs_menu`
--

DROP TABLE IF EXISTS `cs_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cs_menu` (
  `moduleid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `m_applicationid` int(11) NOT NULL COMMENT '应用ID可以实现不同管理系统公用一个菜单表',
  `m_parentid` int(11) NOT NULL COMMENT '菜单父级ID-对于的值未菜单ID 如果是一级菜单设置为0',
  `m_pagecode` varchar(6) NOT NULL COMMENT '菜单排序字段',
  `m_controller` varchar(50) DEFAULT NULL COMMENT '控制器url',
  `m_type` int(11) NOT NULL COMMENT '菜单类型（1：模块 2：操作{增删改查等}）',
  `m_cname` varchar(50) NOT NULL COMMENT '菜单中文名',
  `m_directory` varchar(255) NOT NULL COMMENT '菜单对于的url',
  `m_imageurl` varchar(255) NOT NULL COMMENT '菜单栏显示的图片路径',
  `i_order` int(10) unsigned NOT NULL DEFAULT '100' COMMENT '排序数字',
  `m_close` int(4) NOT NULL COMMENT '是否开放（1：开放 2：不开放）',
  PRIMARY KEY (`moduleid`),
  UNIQUE KEY `cs_menu` (`m_applicationid`,`m_pagecode`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cs_menu`
--

LOCK TABLES `cs_menu` WRITE;
/*!40000 ALTER TABLE `cs_menu` DISABLE KEYS */;
INSERT INTO `cs_menu` VALUES (21,1,0,'592975','Agentschool/index',1,'驾校管理','合作驾校管理','',1,1),(22,1,21,'593223','Agentschool/index',1,'驾校列表','展示驾校列表','',100,1),(23,1,21,'593295','School/siteAdmin',1,'场地管理','驾校场地管理','',100,1),(24,1,22,'593469','Agentschool/addSchool',2,'新增','新增驾校','',1001,1),(25,1,23,'593702','School/addSchoolSite',2,'新增','新增场地','',1001,1),(26,1,0,'594054','Cars/index',1,'车辆管理','驾校车辆管理','',2,1),(27,1,26,'594081','Cars/carsCategory',1,'车型管理','驾校车型管理','',100,1),(28,1,27,'594152','Cars/addCarsCategory',2,'新增','新增车型','',1001,1),(29,1,27,'594208','Cars/editCarsCategory',2,'编辑','编辑车型','',1003,1),(30,1,0,'666708','Manager/index',1,'权限管理','系统权限管理','',88,1),(31,1,30,'666863','Manager/index',1,'管理员列表','展示管理员列表','',103,1),(32,1,30,'666947','Manager/roleList',1,'角色列表','展示角色列表','',102,1),(33,1,30,'667021','Manager/menuList',1,'菜单列表','展示菜单列表','',101,1),(34,1,31,'667080','Manager/index',2,'查看','查看管理员','',1002,1),(35,1,32,'667118','Manager/roleList',2,'查看','查看角色','',1002,1),(36,1,33,'667154','Manager/menuList',2,'查看','查看菜单','',1002,1),(37,1,27,'672665','Cars/carsCategory',2,'查看','查看车型','',1002,1),(38,1,27,'672727','Cars/delCarsCategory',2,'删除','删除车型','',1004,1),(39,1,33,'834662','Manager/editMenu',2,'编辑','编辑菜单','',1003,1),(40,1,33,'834733','Manager/addMenu',2,'新增','新增菜单','',1001,1),(41,1,33,'834890','Manager/delMenu',2,'删除','删除菜单','',1004,1),(42,1,23,'835214','School/siteAdmin',2,'查看','查看场地','',1002,1),(43,1,32,'843505','Manager/addRoles',2,'新增','新增角色','',1001,1),(44,1,32,'160951','Manager/editRoles',2,'编辑','编辑角色','',1003,1),(45,1,32,'161058','Manager/delRoles',2,'删除','删除角色','',1004,1),(46,1,31,'165817','Manager/addManager',2,'新增','新增管理员','',1001,1),(47,1,31,'166366','Manager/editManager',2,'编辑','编辑管理员','',1003,1),(48,1,31,'166703','Manager/delManager',2,'删除','删除管理员','',1004,1),(49,1,22,'167841','Agentschool/index',2,'查看','查看驾校','',1002,1),(50,1,22,'167994','Agentschool/editSchool',2,'编辑','编辑驾校','',1003,1),(51,1,22,'168034','Agentschool/delSchool',2,'删除','删除驾校','',1004,1),(52,1,23,'168545','School/editSchoolSite',2,'编辑','编辑场地','',1003,1),(53,1,23,'168596','School/delSchoolSite',2,'删除','删除场地','',1004,1),(54,1,0,'186641','App/index',1,'App管理','App管理','',44,1),(55,1,54,'186700','App/index',1,'App列表','展示App列表','',101,1),(56,1,55,'186781','App/addApp',2,'新增','新增App版本','',1001,1),(57,1,55,'186880','App/editApp',2,'编辑','编辑App','',1003,1),(58,1,55,'186907','App/delApp',2,'删除','删除App','',1004,1),(59,1,55,'186930','App/index',2,'查看','查看App','',1002,1),(60,1,0,'187184','Order/index',1,'订单管理','订单管理','',5,1),(61,1,60,'187267','Order/index',1,'报名驾校订单','展示报名驾校订单列表','',101,1),(62,1,60,'187373','Order/appointLearner',1,'预约学车订单','展示预约学车订单','',102,1),(63,1,61,'187417','Order/index',2,'查看','查看报名驾校订单','',1002,1),(64,1,61,'187495','Order/addSchoolOrder',2,'新增','新增报名驾校订单','',1001,1),(65,1,61,'187561','Order/editSchoolOrder',2,'编辑','编辑报名驾校订单','',1003,1),(66,1,61,'187599','Order/delSchoolOrder',2,'删除','删除报名驾校订单','',1004,1),(67,1,62,'187696','Order/appointLearner',2,'查看','查看预约学车订单','',1002,1),(68,1,62,'187866','Order/appointLearner',2,'编辑','编辑预约学车订单','',1003,1),(69,1,62,'188144','Order/appointLearner',2,'新增','新增预约学车订单','',1001,1),(70,1,62,'188317','Order/delAppointLearner',2,'删除','删除预约学车订单','',1004,1),(71,1,26,'188903','Cars/index',1,'教练车管理','教练车管理','',100,1),(72,1,71,'189279','Cars/addCar',2,'新增','新增教练车','',1001,1),(73,1,71,'189313','Cars/index',2,'查看','查看教练车','',1002,1),(74,1,71,'189355','Cars/editCar',2,'编辑','编辑教练车','',1003,1),(75,1,71,'189387','delCars',2,'删除','删除教练车','',1004,1),(76,1,21,'189604','School/schoolShiftsAdmin',1,'班制管理','驾校班制管理','',100,1),(77,1,76,'189638','School/schoolShiftsAdmin',2,'查看','查看班制','',1002,1),(78,1,21,'190457','School/trainLocationAdmin',1,'报名点管理','驾校报名点管理','',100,1),(79,1,78,'190507','School/addTrainLocation',2,'新增','新增报名点','',1001,1),(80,1,21,'190585','School/bannerAdmin',1,'轮播图管理','驾校轮播图管理','',100,1),(81,1,80,'190613','School/addBanner',2,'新增','新增轮播图','',100,1),(82,1,0,'191120','Student/index',1,'学员管理','学员管理','',4,1),(83,1,82,'191160','Student/index',1,'学员列表','展示学员列表','',101,1),(84,1,83,'191196','Student/addStudent',2,'新增','新增学员','',1001,1),(85,1,0,'191298','Comment/index',1,'评价管理','评价管理','',6,1),(86,1,85,'191365','Comment/studentCommentSchool',1,'学员评价驾校','学员评价驾校','',102,1),(87,1,85,'191426','Comment/index',1,'学员评价教练','学员评价教练','',101,1),(88,1,85,'191505','Comment/coachCommentStudent',1,'教练评价学员','教练评价学员','',103,1),(89,1,87,'191589','Comment/index',2,'查看','查看学员评价教练','',100,1),(90,1,86,'191615','Comment/studentCommentSchool',2,'查看','查看学员评价驾校','',100,1),(91,1,88,'191637','Comment/coachCommentStudent',2,'查看','查看教练评价学员','',100,1),(92,1,0,'191852','Coach/index',1,'教练管理','教练管理','',3,1),(93,1,92,'191875','Coach/index',1,'教练列表','展示教练列表','',100,1),(94,1,93,'191902','Coach/index',2,'查看','查看教练','',1002,1),(95,1,82,'597811','Student/examRecords',1,'在线模拟','在线模拟','',102,1),(96,1,95,'597911','Student/examRecords',2,'查看','查看在线模拟成绩','',1001,1),(97,1,83,'246010','Student/delStudent',2,'删除','删除学员','',1004,1),(98,1,83,'984308','Student/index',2,'查看','查看学员','',1002,1),(99,1,0,'108285','System/index',1,'系统管理','系统管理','',77,1),(100,1,99,'108321','System/index',1,'系统日志','系统日志','',100,1),(101,1,100,'108350','System/index',2,'查看','查看操作日志','',100,1),(102,1,76,'547510','School/addSchoolShifts',2,'新增','添加班制','',1001,1),(103,1,76,'548169','School/editSchoolShifts',2,'编辑','编辑班制','',1003,1),(104,1,76,'548190','School/delSchoolShifts',2,'删除','删除班制','',1004,1),(105,1,78,'548551','School/trainLocationAdmin',2,'查看','查看报名点','',1002,1),(106,1,78,'548579','School/delTrainLocation',2,'删除','删除报名点','',1004,1),(107,1,78,'548608','School/editTrainLocation',2,'编辑','编辑报名点','',1003,1),(108,1,80,'548829','School/bannerAdmin',2,'查看','查看banner','',100,1),(109,1,80,'548919','School/delBanner',2,'删除','删除Banner','',100,1),(110,1,93,'549082','Coach/addCoach',2,'新增','录入教练员','',1001,1),(111,1,93,'549113','Coach/delCoach',2,'删除','删除教练员','',1004,1),(112,1,93,'549152','Coach/editCoach',2,'编辑','编辑教练员','',1003,1),(113,1,100,'557388','System/delActionLog',2,'删除','删除日志','',100,1),(114,1,83,'660260','Student/editStudent',2,'编辑','修改学员资料','',1003,1);
/*!40000 ALTER TABLE `cs_menu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-18 17:14:46
