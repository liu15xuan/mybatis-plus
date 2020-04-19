-- MySQL dump 10.13  Distrib 5.7.23, for macos10.13 (x86_64)
--
-- Host: 127.0.0.1    Database: carsys
-- ------------------------------------------------------
-- Server version	5.7.23

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
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(128) DEFAULT '' COMMENT '轮播图',
  `small` varchar(32) DEFAULT '' COMMENT '小标题',
  `big` varchar(32) DEFAULT '' COMMENT '大标题',
  `pro_id` int(11) DEFAULT NULL COMMENT '服务项目',
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='轮播图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner`
--

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT INTO `banner` VALUES (2,'/static/upload/54911f96f1b34251ad53d221914df740.jpg','汽车救援','送油，搭电，换胎',5,'2019-12-28 19:47:15'),(3,'/static/upload/27e87b9b6b564e6c9f76534a6fc09a06.jpg','贴膜改色','喷涂、打磨中途底漆。',7,'2019-12-28 19:49:06');
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) DEFAULT NULL COMMENT '用户',
  `orders_id` int(11) DEFAULT NULL COMMENT '订单',
  `pro_id` int(11) DEFAULT NULL COMMENT '项目',
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `content` varchar(1024) DEFAULT '' COMMENT '评语',
  `is_show` int(11) DEFAULT '0' COMMENT '推荐显示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='评论';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (5,134,114,7,'2019-12-28 20:05:29','  专业,沟通融洽,电话响应及时,价格满意。师傅非常好，有经验，方向盘助力坏了，晚上没备件，说开回家没问题！谢谢师傅的指点！                                                                                     ',1),(6,134,113,6,'2019-12-28 20:06:54','服务流程规范,售后服务好,准时,收费有依据。车电瓶没电了，给救援打电话，10分钟左右就到了，天下着雨修车小哥冒雨给换了电瓶，工作认真负责，因我心切没顾上给修车小哥拍照。在此感谢小师傅                             ',1);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) DEFAULT NULL COMMENT '用户id',
  `pro_id` int(11) DEFAULT NULL COMMENT '项目',
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` smallint(6) DEFAULT '0' COMMENT '状态',
  `mark` text COMMENT '进度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8 COMMENT='订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (112,134,5,'2019-12-28 19:39:20',1,'<p></p><br><p><ul><li>9点维护车队到达现场</li></ul><ul><li>10点完成汽车救援，通过拖车讲维修车辆运回汽车修理厂</li></ul><ul><li>12点完成修理轮胎</li></ul></p><br><p></p>'),(113,134,6,'2019-12-28 19:45:15',3,'<p></p><ol><li>汽车检测问题</li><li>修理变速箱</li><li>检测汽车尾气</li><li>路面测试</li><li>测试结果-汽车运行正常</li><li>修理完成</li><li>已交付</li></ol><p></p>'),(114,134,7,'2019-12-28 19:45:27',3,'<p><ol><li><b>选取贴纸和颜色</b></li><li><b>喷漆</b></li><li><b>烤漆</b></li><li><b>测试</b></li><li><b>无任何问题</b></li><li><b>交付</b></li></ol></p>'),(116,134,8,'2019-12-28 20:15:04',0,NULL),(117,134,5,'2019-12-28 20:15:21',0,NULL),(118,134,7,'2019-12-28 20:20:24',0,NULL),(121,130,6,'2019-12-28 22:52:44',0,NULL),(122,130,5,'2019-12-28 22:53:08',0,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pics`
--

DROP TABLE IF EXISTS `pics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pics` (
  `image` varchar(256) DEFAULT '' COMMENT '图片',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT '' COMMENT '标题',
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='展示图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pics`
--

LOCK TABLES `pics` WRITE;
/*!40000 ALTER TABLE `pics` DISABLE KEYS */;
INSERT INTO `pics` VALUES ('/static/upload/99c6cd5e9bcc4284af3907f5a098e6cc.jpg',2,'展示图1','2019-12-23 14:25:40'),('/static/upload/5559a18c70ea49b38013acaa7a3b3a01.jpg',3,'展示图2','2019-12-23 14:26:02'),('/static/upload/f0330b8384264cd3a3eb0718bc5e59c5.jpg',4,'展示图3','2019-12-23 14:26:23'),('/static/upload/e34505c4cb494f3591ab9c341c686740.jpg',5,'展示图4','2019-12-23 14:26:43'),('/static/upload/bd06001a5f384a47a2179d8e3e831c46.jpg',6,'展示图5','2019-12-23 14:27:18'),('/static/upload/a62c0ad5db4f4d388a3ea5e3b53c78b1.jpg',7,'展示图6','2019-12-23 14:27:32'),('/static/upload/e3a12c5631454941a469fab7dea2fb46.jpg',8,'展示图7','2019-12-28 18:48:36');
/*!40000 ALTER TABLE `pics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro`
--

DROP TABLE IF EXISTS `pro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT '' COMMENT '标题',
  `image` varchar(128) DEFAULT '' COMMENT '图片',
  `price` varchar(63) DEFAULT '' COMMENT '价格',
  `content` text COMMENT '详情',
  `comments_read_count` int(11) DEFAULT '0' COMMENT '评论数',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `orders_count` int(11) DEFAULT '0' COMMENT '订单数',
  `is_orders_exist` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='服务';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro`
--

LOCK TABLES `pro` WRITE;
/*!40000 ALTER TABLE `pro` DISABLE KEYS */;
INSERT INTO `pro` VALUES (5,'汽车救援，送油，搭电，换胎','/static/upload/4cd6d4c37efd4163a509726901dbeb22.jpg','100-1000元','<p>汽车救援24小时为你提供高效快速优质服务：补胎换胎，拖车搭电，换电瓶、轮胎，送机油，送油，送水，开锁配钥匙，故障检测，快速维修，防盗解码，拖车清障车，保险理赔。我们将根据实际情况及救援的难易程度，与客户协商收取救援费用。我们郑重承诺全天候24小时保证客户随叫随到，拖车等服务，让车主们，觉得实惠，同时又快捷热情周到道服务；二、应急服务：1、应急修理：车辆因机械或电气故障无法启动或正常行驶时，提供现场紧急修理服务。2、电瓶搭电：车辆因电瓶缺电时，提供搭电服务。（各种型号电瓶，进行交流、直流充电）3、换胎补胎：车辆因轮胎爆胎或损坏而无法正常行驶时，提供补胎更换备胎服务。4、应急加油：车辆无燃料而无法启动或无法正常行驶时，提供送油服务。5、应急加水：发动机水因温过高或缺水情况无法正常行驶时，提供加水、冷却等服务。6、拖车服务：车辆因故障无法正常行驶且现场无法修理时，提供拖车服务。车辆拖至车主指定修理厂或4S店。7、车辆困境特种救援：机动车在运行过程中，若出现非正常行使状态，或陷于困境，包括：陷入路井、路沟；落入河流、水沟；侧翻、倒翻等其它不可预见的特殊情况。8、电路方面：马达，发电机，防盗车解锁，各种汽车品牌电瓶,各种汽车配套电瓶可上门更换。9、油路方面：油路，供油支架，油管堵塞等等。三、服务宗旨：价格透明、服务快捷，道路救援比的是快捷和专业，这里我们更优秀，欢迎您的来电。<br></p>',0,'2019-12-26 17:24:24',3,0),(6,'汽车维修保养变速箱维修尾气检测电瓶轮胎','/static/upload/54afd77f461842f980916d928e3296c1.jpg','10-10000元','<p>汽车专业维修中心，奔驰宝马奥迪大众专修:汽车维修，检测，深度保养，可视清洗，自动变速箱，疑难排故，尾气检测。纯正配件，先进设备，优质服务，欢迎新来客户光临！<br></p>',0,'2019-12-24 23:28:47',2,0),(7,'贴膜改色','/static/upload/0e98ef61974b423c966559e2fb920a51.jpg','100-1000元','<p><p>钣金修复就是把将汽车金属外壳变形部分进行修复，比如车体外壳被撞了个坑，就可以通过钣金使之恢复原样，然后再通过喷涂专用油漆，使变形的汽车金属表面恢复到与其他完好的地方一样，光亮如初。</p><p>一般需要一下几个步骤：</p><p>1.钣金校正</p><p>2.刮灰〈塑型〉</p><p>3.汽车钣金喷漆：</p><p>a,还氧底漆，防止铁皮生锈。</p><p>b,刮涂、打磨原子灰。平整车体表面。</p><p>c,喷涂、打磨中途底漆。增加色漆附着力。</p><p>d,喷涂色漆。还原车漆表面颜色。</p><p>e，喷涂清漆。保护色漆，增加车漆表面硬度、亮度。</p><p>4.钣金喷漆漆面**</p><br></p>',0,'2019-12-27 07:30:28',2,0),(8,'汽车玻璃修复 裂纹修复','/static/upload/8ea5659a343d4d12b5e5e9cc9f61223c.png','100-800左右','<p><h1>经营 汽车玻璃 福耀玻璃 信义玻璃 玻璃修复 玻璃贴膜<br></h1></p>',0,'2019-12-26 17:34:44',1,0),(9,'汽车前挡风玻璃修复，汽车玻璃更换','/static/upload/bbbb07c660474664b7b8e850748a880f.jpg','600左右','<p><p>各种 品牌汽车 ‍‍‍‍‍ 玻璃&nbsp;</p><p>&nbsp; 汽车玻璃  修复</p><p>经常开车，特别是跑长途的车主朋友们都知道，车辆在日常行驶时难免遭遇石子或者其它硬物地撞击，特别是撞击在汽车前挡风玻璃上，不同的外力破坏，会在玻璃上留下不同的的伤痕，根据形状基本分为四大类：1、星型裂痕；2、牛眼型裂痕；3、牛眼与星型综合型裂痕；4、裂缝。 <br><br>汽车玻璃破了，一般会采取换玻璃或者修复，否则，会产生安全隐患。 <br>它的修复原理：先对汽车前挡风玻璃破损处进行抽真空，然后注入与汽车前挡风玻璃折射率及透光率相近的uv高分子聚合物，较后将其固化以达到与原玻璃的完美融合。 <br>该修复工具可修复汽车前挡风玻璃（夹胶玻璃）表面：裂缝，牛眼，星形，月牙和综合型裂痕等，其复原率及硬度能达到原玻璃的96%以上。 <br>，费用低，耗时少，效果好，既保持原装玻璃的强度、高气密性，又不失美观</p><br></p>',0,'2019-12-28 11:36:17',0,0),(10,'凹陷修复凹坑修复凹凸修复','/static/upload/f5c6f46b284f410e8ed411cc491cf554.jpg','100-900','<p></p><p>汽车凹陷修复:不钣金，不喷漆，不变色，保护原车漆，爱车不折价。十分钟见效，修复时间短，取车速度快，节约您的宝贵时间。服务全城，可预约上门服务。</p><p>车工匠期待您咨询,</p><p>车工匠汽车凹陷修复，以工匠之心，复车本之美。</p><br><p></p>',0,'2019-12-28 11:37:26',0,0);
/*!40000 ALTER TABLE `pro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tel` varchar(128) DEFAULT '' COMMENT '电话',
  `email` varchar(32) DEFAULT '' COMMENT '邮箱',
  `num` int(11) DEFAULT '0' COMMENT '车库数量',
  `image` varchar(128) DEFAULT '' COMMENT '图片',
  `content` text COMMENT '介绍',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (5,'18888888888','686868686@qq.com',1000,'/static/upload/96953d2bd51c42608f7efd71ee2a131a.png','<p><b></b>&nbsp; &nbsp; &nbsp; &nbsp;汽车维修管理系统是一款专业的汽车维修管理软件，其中包含汽车配件管理系统、业务管理系统，维修管理系统，配件业务库存管理系统，统计报表系统等子模块，是专门为汽车维修行业定制的配件进销存管理系统。软件界面设计简洁，美观，人性化的软件流程，使普通用户不需培训也 能很快掌握软件操作使用方法。此汽车维修管理软件广泛适用于汽车维修企业，配件业务企业， 汽车4S店等场合，是您企业进行信息化管理的强大工具.<b></b><br></p>');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `image` varchar(256) DEFAULT '' COMMENT '头像',
  `username` varchar(64) DEFAULT '' COMMENT '账号',
  `nickname` varchar(64) DEFAULT '' COMMENT '姓名',
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `role` int(11) DEFAULT '0' COMMENT '角色',
  `password` varchar(64) DEFAULT '' COMMENT '密码',
  `email` varchar(128) DEFAULT '' COMMENT '邮箱',
  `phone` varchar(32) DEFAULT '' COMMENT '手机号',
  `address` varchar(128) DEFAULT '' COMMENT '地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8 COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (130,'/static/upload/2e87eb45fba6474296b729a0867e6b87.jpg','admin','admin','2019-12-25 10:49:03',1,'21232f297a57a5a743894a0e4a801fc3','','',''),(134,'/static/upload/951fb23ef4114064ad8da2deee04be63.jpg','a','戴维1','2019-12-28 18:49:30',0,'0cc175b9c0f1b6a831c399e269772661','12312312@qq.com','11111111111',''),(135,'/static/upload/2e87eb45fba6474296b729a0867e6b87.jpg','c','c','2019-12-28 23:00:50',0,'4a8a08f09d37b73795649038408b5f33','a@qq.com','11111111111','');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-29 12:33:45
