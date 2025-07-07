-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_tourism
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sys_attraction_order`
--
create database if not exists db_tourism;
use db_tourism;

DROP TABLE IF EXISTS `sys_attraction_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_attraction_order` (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `attractions_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '景点id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `introduce` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '简介',
  `images` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '图片',
  `num` int DEFAULT NULL COMMENT '人数',
  `time` datetime DEFAULT NULL COMMENT '预约时间',
  `people` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '信息',
  `state` int DEFAULT '0' COMMENT '状态',
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户id',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='景点预约';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_attraction_order`
--

LOCK TABLES `sys_attraction_order` WRITE;
/*!40000 ALTER TABLE `sys_attraction_order` DISABLE KEYS */;
INSERT INTO `sys_attraction_order` VALUES ('1939709252473950210','10','紫柏山国家森林公园','岭南独秀，秦岭明珠','https://picsum.photos/seed/hanzhong10/400/300',1,'2025-06-30 08:00:00','[{\"name\":\"11\",\"tel\":\"1\",\"idCard\":\"11\"}]',0,'1697436716646531073','超级管理员','2025-06-30 23:34:59','超级管理员','2025-06-30 23:34:59'),('1941018970272464897','16','定军山','定军山，位于陕西省汉中市勉县城南约五千米处，坐落在汉江谷地南苑，位于汉水之南，呈东西走向，是相连的9个小山头的总称，系大巴山脉北麓的一串小山头的总称。主峰海拔883米。 [1]定军山上有十二座秀峰称为“十二连珠山”。 [2]\n定军山汉江谷地因为长江最大的支流长江自西向东冲击而成。定军山山脉的延伸方向受走向近东西向的一组大断层控制，由于构造运动的差异性，使定军山北侧地层下沉，因而在山前形成一片开阔的平地。十二连珠山的形成，与走向北偏东的一组高度角的断层有关；北偏东的一组断层将本来连续的震旦纪地层割成数段，再经过长期风化剥蚀，逐渐形成了缓矮的十二个像连珠一样的山了。 [1]属亚热带季风性湿润气候，地处中国南北分界线、江河分水岭，四季分明、气候温润、冬无严寒、夏无酷暑，雨量充沛。 [1]地形为马鞍形， 地貌为丘陵地貌。 [1]\n定军山因1700多年前的三国时期诸葛亮统兵而得名。 [1]定军山以三国文化和武侯文化格为核心。诸葛亮由于其在历史上的重要地位，加上《三国演义》历史传奇，将诸葛亮一生传奇演绎刻画得淋漓尽致，因此在民间广为流传。诸葛亮成为人们心目中集智慧、忠诚、爱国于一体的中国传统的英雄形象。','http://localhost:8080/img/1751297066628定军山.jpg',1,'2025-07-15 08:00:00','[{\"name\":\"王磊\",\"tel\":\"13345233550\",\"idCard\":\"612527200304233014\"}]',1,'c222bd3be6c799269eba124c8e78dd5a','搁浅','2025-07-04 14:19:20','超级管理员','2025-07-04 14:19:26'),('1941019168793067522','14','骆家坝古镇','骆家坝镇，隶属于陕西省汉中市西乡县。地处西乡县米仓山北麓、牧马河源头，东邻峡口镇，南连大河镇，西接城固县二里镇，北靠私渡镇 [1]。总面积188.84平方千米。 [2]\n截至2020年6月，骆家坝镇下辖1个社区、7个行政村 [3]。截至2018年末，骆家坝镇户籍人口9788人 [2]。2011年，骆家坝镇农业总产值达到8383万元，工业总产值1720万元，社会商品销售总额达0.28亿元。','https://picsum.photos/seed/hanzhong14/400/300',1,'2025-07-14 08:00:00','[{\"name\":\"彭于晏\",\"tel\":\"13345233550\",\"idCard\":\"\"}]',1,'e0cfe29a2822b2fe7f87ae43c0987fbe','test','2025-07-04 14:20:07','超级管理员','2025-07-04 14:20:15');
/*!40000 ALTER TABLE `sys_attraction_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_attractions`
--

DROP TABLE IF EXISTS `sys_attractions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_attractions` (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `price` float(10,2) DEFAULT NULL COMMENT '价格',
  `introduce` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '简介',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '介绍',
  `num` int DEFAULT NULL COMMENT '库存',
  `real_name` int DEFAULT '0' COMMENT '实名',
  `images` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '图片',
  `open` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '预约须知',
  `time` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '入园时间',
  `state` int DEFAULT '0' COMMENT '状态',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='景点';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_attractions`
--

LOCK TABLES `sys_attractions` WRITE;
/*!40000 ALTER TABLE `sys_attractions` DISABLE KEYS */;
INSERT INTO `sys_attractions` VALUES ('1','古汉台',30.00,'刘邦驻汉中宫廷遗址','古汉台位于汉中市中心，是刘邦在汉中当汉王时的王府。现为汉中博物馆，馆内珍藏有各种文物，被誉为“汉中天汉地”。',1000,1,'http://localhost:8080/img/1751296839629古汉台.jpeg','需提前1天预约，凭身份证入园','08:00-18:00',1,'admin','2023-01-01 09:00:00','超级管理员','2025-06-30 23:20:41'),('10','紫柏山国家森林公园',55.00,'紫柏山国家森林公园是国家AAAA级旅游景区，位于陕西省汉中市留坝县留侯镇，原名西城山，又名龙如山，距留坝县城16公里，316国道穿境而过。 [4]\n紫柏山特有的天坑及山顶上的草坦，被誉为亚洲第一天坦群落，素有“黄山归来不看山、九寨归来不看水、紫柏归来不看草”之称。紫柏山也因为汉代留侯张良归隐于此而声名远扬。\n1997年，紫柏山国家森林公园成为省级森林公园，2009年2月晋升为国家森林公园。','紫柏山国家森林公园位于汉中市留坝县境内，因山上古树多紫柏而得名。景区集峰、崖、峡、洞、溪、泉、瀑等自然景观于一体，有“九十二峰、八十二坦、七十二洞”之美誉，是休闲度假、登山探险的好去处。',999,1,'https://picsum.photos/seed/hanzhong10/400/300','可提前2天预约，节假日需尽早','08:00-18:00',1,'admin','2023-01-10 11:00:00','超级管理员','2025-07-04 14:10:56'),('11','汉中天台国家森林公园',30.00,'汉中天台国家森林公园，位于陕西省汉中汉台区武乡镇，北依巍峨秦岭，南俯汉中盆地，是全国距离中心城区最近的国家森林公园。国家AAA级旅游景区，也是省级风景名胜区。 [2]\n汉中天台国家森林公园面积3674公顷，海拔640—2038米，辖天台山、哑姑山、太白、石堰四大景区共112处景点，其中天台山和哑姑山分别为陕南著名的道教和佛教圣地。','汉中天台国家森林公园位于汉中市汉台区武乡镇，距市区18公里，有“陕南第一名山”之美誉。公园内森林覆盖率高，自然风光秀丽，人文景观丰富，有天台十八景之说，是避暑、休闲、观光的理想之地。',1200,1,'http://localhost:8080/img/1751297168495汉中天台国家森林公园.jpeg','支持线上线下预约，团队优先','07:30-18:30',1,'admin','2023-01-11 13:15:00','超级管理员','2025-07-04 14:10:44'),('12','五龙洞国家森林公园',50.00,'陕西五龙洞国家森林公园位于陕、甘、川三省交界的陕西省汉中市略阳县城北部48千米处，地处秦岭南麓，总面积5849公顷。地理坐标：东经33°59′，北纬106°29′。2001年11月，陕西五龙洞国家森林公园经国家林业局批准为国家森林公园。 [1]\n陕西五龙洞国家森林公园由五龙谷、青龙沟、白龙沟、三佛寺、氐羌民俗村5大景区组成，其中有木城瀑布、茶马古道、五龙洞、呼龙台等100余处景点。景区内动植物资源丰富、种类繁多。曾是氐羌人重要聚居区和陕甘古商道。','五龙洞国家森林公园位于汉中市略阳县境内，地处秦岭南麓，公园内森林茂密，植被丰富，有“天然氧吧”之称。主要景点有五龙洞、青龙洞、白龙洞等溶洞景观，以及奇山异石、流泉飞瀑等自然景观。',900,1,'http://localhost:8080/img/1751297495067五龙洞国家森林公园.jpeg','需提前1天预约，需穿防滑鞋','08:00-17:30',1,'admin','2023-01-12 14:45:00','超级管理员','2025-07-04 14:10:25'),('13','午子山风景名胜区',40.00,'午子山景区，又称“午子山风景名胜区”，简称“午子山”，亦名“武子山”或“母子山”，是国家AAAA级旅游景区，位于陕西省汉中市西乡县堰口镇堰口社区，总面积约27平方千米，始建于西汉。 [1] [4-5] [14-15] [33]\n午子山景区是集自然山水风光、珍稀植物、茶园、果园、田园风光、堰上古镇、宗教文化活动等于一体的旅游风景名胜区，为道教活动圣地和陕南道教活动中心，素有“汉南胜景区、陕南小华山、陕南小武当”之美称，是观光旅游、宗教朝拜的圣地。','午子山风景名胜区位于汉中市西乡县堰口镇，距县城12公里，素有“陕南小华山”之称。午子山山势险峻，壑幽林密，二水环流，奇峰独秀。山上有明代建成的午子观，殿宇楼阁，鳞次栉比，古建筑群保存完好。',1100,1,'https://picsum.photos/seed/hanzhong13/400/300','可现场预约，登山需注意安全','08:00-18:00',1,'admin','2023-01-13 16:00:00','超级管理员','2025-07-04 14:09:58'),('14','骆家坝古镇',0.00,'骆家坝镇，隶属于陕西省汉中市西乡县。地处西乡县米仓山北麓、牧马河源头，东邻峡口镇，南连大河镇，西接城固县二里镇，北靠私渡镇 [1]。总面积188.84平方千米。 [2]\n截至2020年6月，骆家坝镇下辖1个社区、7个行政村 [3]。截至2018年末，骆家坝镇户籍人口9788人 [2]。2011年，骆家坝镇农业总产值达到8383万元，工业总产值1720万元，社会商品销售总额达0.28亿元。','骆家坝古镇位于汉中市西乡县西南部，是一个具有明清风格的古镇，也是红色革命老区。古镇依山傍水，始建于明末清初，现存古街道、古民居、古庙等历史遗迹，被誉为“汉江第一古镇”。',1999,0,'https://picsum.photos/seed/hanzhong14/400/300','无需预约，游客中心提供导览服务','全天开放',1,'admin','2023-01-14 17:30:00','test','2025-07-04 14:20:07'),('15','兴元湖公园',0.00,'兴元湖公园面积42万平方米，水面面积22万平方米，湖内有各种游船，有以“帆影”为象征的水上码头及“望湖台”等现代建筑 [3]。公园沿湖而建，林木丰茂，景点众多，珍惜名木随处可见，嘉木异卉层出不穷，园内有各种人工栽培的花卉树木46科126个品种，有四时不断之花，阴晴各擅之景。','兴元湖公园位于汉中市城区北郊，是汉中市最大的城市公园。公园以湖泊为主体，辅以亭台楼阁、曲径回廊、草坪花园等景观，是市民休闲、娱乐、健身的好去处。',5000,0,'http://localhost:8080/img/1751297095738兴元湖公园.jpeg','无需预约，园内禁止游泳','06:00-22:00',1,'admin','2023-01-15 18:45:00','超级管理员','2025-07-04 14:09:11'),('16','定军山',45.00,'定军山，位于陕西省汉中市勉县城南约五千米处，坐落在汉江谷地南苑，位于汉水之南，呈东西走向，是相连的9个小山头的总称，系大巴山脉北麓的一串小山头的总称。主峰海拔883米。 [1]定军山上有十二座秀峰称为“十二连珠山”。 [2]\n定军山汉江谷地因为长江最大的支流长江自西向东冲击而成。定军山山脉的延伸方向受走向近东西向的一组大断层控制，由于构造运动的差异性，使定军山北侧地层下沉，因而在山前形成一片开阔的平地。十二连珠山的形成，与走向北偏东的一组高度角的断层有关；北偏东的一组断层将本来连续的震旦纪地层割成数段，再经过长期风化剥蚀，逐渐形成了缓矮的十二个像连珠一样的山了。 [1]属亚热带季风性湿润气候，地处中国南北分界线、江河分水岭，四季分明、气候温润、冬无严寒、夏无酷暑，雨量充沛。 [1]地形为马鞍形， 地貌为丘陵地貌。 [1]\n定军山因1700多年前的三国时期诸葛亮统兵而得名。 [1]定军山以三国文化和武侯文化格为核心。诸葛亮由于其在历史上的重要地位，加上《三国演义》历史传奇，将诸葛亮一生传奇演绎刻画得淋漓尽致，因此在民间广为流传。诸葛亮成为人们心目中集智慧、忠诚、爱国于一体的中国传统的英雄形象。','定军山位于汉中市勉县城南5公里处，是三国时期的古战场，有“得定军山则得汉中，得汉中则定天下”之美誉。山上有武侯坪、斩将桥、八角琉璃井等历史遗迹，是三国文化爱好者的必游之地。',999,1,'http://localhost:8080/img/1751297066628定军山.jpg','需提前1天预约，团队需提前3天','08:00-18:00',1,'admin','2023-01-16 19:30:00','搁浅','2025-07-04 14:19:20'),('2','石门栈道',80.00,'中国栈道之乡','石门栈道是汉中著名风景区，为国家4A级旅游景区，位于汉中市汉台区、勉县、留坝三县（区）交界的褒谷口。这里拥有世界上最早的人工交通隧道——石门隧道。',800,1,'http://localhost:8080/img/1751296799622石门栈道.jpeg','可提前3天预约，节假日需尽早','08:30-17:30',1,'admin','2023-01-02 10:30:00','超级管理员','2025-06-30 23:20:00'),('3','武侯祠',60.00,'天下第一武侯祠','武侯祠位于勉县县城108国道边，是陕西省重点文物保护单位，国家3A级旅游景区。武侯祠始建于蜀汉景耀六年（公元263年），是全国最早，也是唯一由皇帝下诏修建的武侯祠，故有“天下第一武侯祠”之称。',1200,1,'http://localhost:8080/img/1751296774207武侯祠.jpeg','可现场预约，团队需提前2天','08:00-18:00',1,'admin','2023-01-03 11:15:00','超级管理员','2025-06-30 23:19:35'),('4','张良庙',45.00,'汉张留侯祠','张良庙为道教主流全真派圣地，坐落于秦岭南麓的紫柏山中，距汉中留坝县城17公里处的庙台子街上。川陕公路横越门首，交通较为方便。2006年05月25日，张良庙作为明至清古建筑，被国务院批准列入第六批中国重点文物保护单位名单。',900,1,'http://localhost:8080/img/1751296748900张良庙.jpeg','支持线上线下预约','08:00-18:00',1,'admin','2023-01-04 14:20:00','超级管理员','2025-06-30 23:19:10'),('5','青木川古镇',60.00,'一脚踏三省','青木川古镇位于陕西省汉中市宁强县西北角，地处陕、甘、川交界处，西连四川省青川县，北邻甘肃省武都县、康县，素有“一脚踏三省”之誉，是陕西最西的镇，距县城136公里，距汉中市197公里。古镇自然条件优越，生态植被良好，历史人文资源丰厚，传统老街区、古老民风、民俗、民情以及传统的生活、生产用具，都具有独特的风情画意。',1500,1,'http://localhost:8080/img/1751296718460青木川古镇.jpg','需提前1天预约','全天开放',1,'admin','2023-01-05 15:45:00','超级管理员','2025-06-30 23:18:40'),('6','黎坪国家森林公园',95.00,'陕西黎坪国家森林公园位于陕西省汉中市南郑区黎坪镇，大巴山西段米仓山腹地，被誉为\"巴山深处的绿色明珠\" [13]。2002年12月，陕西黎坪国家森林公园经国家林业局批准为国家森林公园。 [2]\n陕西黎坪国家森林公园东西长18千米，南北宽13千米，公园范围西达南郑区界，与宁强县相邻，东至黄杨河东沟，北起白杨坪，南至冷坝南部脊梁。该公园距南郑区60千米，汉中市65千米，西安市298千米，总面积9400公顷。 [1]\n陕西黎坪国家森林公园属扬子准地台北部边缘，地势南高北低，呈阶梯分布海拔1400—2312米，平均海拔1500米。龙门—大巴山隆起褶断带地貌，地质基岩多为灰岩、页岩和板岩，岩溶地貌发育，属典型的喀斯特地貌。','黎坪国家森林公园位于陕西省汉中市南郑区黎坪镇，大巴山西段米仓山北麓，东西长18公里，南北宽13公里，公园范围西达南郑区界，与宁强县相邻，东至黄杨河东沟，北起白杨坪，南至冷坝南部脊梁。',1200,1,'http://localhost:8080/img/1751296689852黎坪国家森林公园.jpg','可提前2天预约，节假日限流','08:00-18:00',1,'admin','2023-01-06 16:30:00','超级管理员','2025-07-04 14:11:54'),('7','华阳古镇',100.00,'华阳古镇是位于陕西省汉中市洋县华阳镇的国家AAAA级旅游景区，始于秦晋，是历史上有名的古道驿站（傥骆古道），古军事要冲，古经济政治重镇。古镇内明清建筑保存较为完好，古华阳县县城墙残垣轮廓尚在。 [2]\n宋元时期的华阳镇古塔和古戏楼风格独特，文武官员衙门，客栈，当铺，酒楼，茶楼等铺板门一条街600多米300余间为主体的明清建筑群保存完好。是深山中罕见的明清时期古镇风貌。','华阳古镇是位于陕西省汉中市洋县华阳镇的一个古镇，始于秦晋，是历史上有名的古道驿站（傥骆古道），古军事要冲，古经济政治重镇。古镇内明清建筑保存较为完好，古华阳县县城墙残垣轮廓尚在。',1000,1,'http://localhost:8080/img/1751296663449华阳古镇.jpeg','需提前1天预约，团队优先','08:30-17:30',1,'admin','2023-01-07 17:15:00','超级管理员','2025-07-04 14:11:37'),('8','朱鹮梨园',50.00,'朱鹮梨园，位于陕西省汉中市洋县县城以北牛头山山麓，由朱鹮梨园、朱鹮生态园和现代农业观光园三个园区组成，占地387公顷，是融自然生态、人文景观、康体健身、农业观光、国宝观赏为一体的综合性旅游景区，也是“中国美丽田园”、国家AAAA级旅游景区。','陕西朱鹮梨园景区是汉中市重点旅游景区“四园”之一，始建于2008年，景区紧依洋县县城，毗邻京昆高速和108国道，西成高铁从景区前方横空而过，地理位置十分优越。',1500,1,'http://localhost:8080/img/1751296639337朱鹮梨园.jpeg','可现场预约，需出示健康码','08:00-18:00',1,'admin','2023-01-08 18:45:00','超级管理员','2025-07-04 14:11:26'),('9','佛坪熊猫谷',60.00,'熊猫谷，国家AAAA级旅游景区，位于陕西省汉中市佛坪县城北20公里处、108国道旁，集秦岭山水之幽、静、秀、奇和珍稀动植物于一体，素有“秦岭之窗、熊猫家园”之美誉。 [2-3]\n熊猫谷，景区内峰岭叠嶂，溪水清澈，奇石灵异，林木葱郁，山花堆聚，时而碧潭映石，时而飞瀑跌雪，时而峭壁陡立，时而曲径通幽。触耳溪鸣鸟叫，使人心旷神怡。三叠泉、二龙戏珠、女儿滩、双心池等景点浑然天成，三圣峰、母女峰、栖云峰等天趣神功。秦岭大熊猫野化基地中，熊猫憨态可掬；金丝猴大峡谷里，金丝猴群在树枝灵俏飞跃；红腹锦鸡园内红腹锦鸡等雉鸡美丽惊艳。','佛坪熊猫谷景区位于秦岭南麓腹地，地处国家级自然保护区，景区内峰岭叠嶂，溪水清澈，大熊猫、金丝猴、羚牛等珍稀野生动物在此栖息。游客可体验熊猫科考、野生动植物观赏等特色项目。',800,1,'http://localhost:8080/img/1751297192108佛坪熊猫谷.jpeg','需提前1天预约，每日限流500人','08:30-17:00',1,'admin','2023-01-09 09:30:00','超级管理员','2025-07-04 14:11:13');
/*!40000 ALTER TABLE `sys_attractions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_comments`
--

DROP TABLE IF EXISTS `sys_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_comments` (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '内容',
  `attractions_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '景点id',
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户id',
  `avatar` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '头像',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `score` int DEFAULT '0' COMMENT '评分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='景点评论';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_comments`
--

LOCK TABLES `sys_comments` WRITE;
/*!40000 ALTER TABLE `sys_comments` DISABLE KEYS */;
INSERT INTO `sys_comments` VALUES ('1822463226352353281','好地方','1777682811382247420','0de96461b6ef0328cef416dea9366c9c','/img/1723297404622.jpg','杭州水果捞','2024-08-11 10:41:08','杭州水果捞','2024-08-11 10:41:08',2),('1822463262167515138','大家可以去玩玩','1777682811382247421','0de96461b6ef0328cef416dea9366c9c','/img/1723297404622.jpg','杭州水果捞','2024-08-11 10:41:16','杭州水果捞','2024-08-11 10:41:16',2),('1822463304639037441','很好','1777682811382247427','0de96461b6ef0328cef416dea9366c9c','/img/1723297404622.jpg','杭州水果捞','2024-08-11 10:41:26','杭州水果捞','2024-08-11 10:41:26',0),('1822463374205763585','可以的','1777682811382247420','d97f5bcc9b06e080d743554ef38b2b2d','/img/1697436716646531073.jpeg','user2','2024-08-11 10:41:43','user2','2024-08-11 10:41:43',2),('1822463413225373698','不错','1777682811382247424','d97f5bcc9b06e080d743554ef38b2b2d','/img/1697436716646531073.jpeg','user2','2024-08-11 10:41:52','user2','2024-08-11 10:41:52',0),('1822463442761662466','很好','1777682811382247429','d97f5bcc9b06e080d743554ef38b2b2d','/img/1697436716646531073.jpeg','user2','2024-08-11 10:41:59','user2','2024-08-11 10:41:59',2),('1919952232888750082','非常好看','1777682811382247421','0de96461b6ef0328cef416dea9366c9c','/img/1723297404622.jpg','杭州水果捞','2025-05-07 11:07:38','杭州水果捞','2025-05-07 11:07:38',0),('1920327252555190274','挺好','11111113','20e8806904b180be651d439609d16070','/img/1746588687199.webp','杨羊','2025-05-08 11:57:50','杨羊','2025-05-08 11:57:50',4),('1939626524542861314','1',NULL,NULL,'/img/1746588687199.webp','杨羊','2025-06-30 18:06:15','杨羊','2025-06-30 18:06:15',0);
/*!40000 ALTER TABLE `sys_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_contact`
--

DROP TABLE IF EXISTS `sys_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_contact` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键ID',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '联系内容',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '电子邮箱',
  `address` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '地址',
  `work_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '工作时间',
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '图片',
  `sort_order` int DEFAULT '0' COMMENT '排序（数字越小越靠前）',
  `state` int DEFAULT '1' COMMENT '状态 0-禁用 1-启用',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='联系我们表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_contact`
--

LOCK TABLES `sys_contact` WRITE;
/*!40000 ALTER TABLE `sys_contact` DISABLE KEYS */;
INSERT INTO `sys_contact` VALUES ('1','客服热线','如有任何问题，请随时联系我们的客服热线','400-888-8888','service@tourism.com','西安大厦','09:00-18:00',NULL,1,1,NULL,'2025-06-30 16:58:04',NULL,'2025-06-30 23:03:52'),('2','投诉建议','我们重视您的意见和建议','023-12345678','complaint@tourism.com','陕西渝中区人民路123号','09:00-17:30',NULL,2,1,NULL,'2025-06-30 16:58:04',NULL,'2025-06-30 23:03:52');
/*!40000 ALTER TABLE `sys_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_culture`
--

DROP TABLE IF EXISTS `sys_culture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_culture` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动名称',
  `price` decimal(10,2) DEFAULT NULL COMMENT '活动费用',
  `introduce` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '简介',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '详细介绍',
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '图片',
  `culture_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '活动类型（传统节日、民俗表演、文化展览等）',
  `location` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '活动地点',
  `activity_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '活动时间',
  `max_participants` int DEFAULT NULL COMMENT '参与人数限制',
  `contact_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '联系电话',
  `state` int DEFAULT '1' COMMENT '状态 0-下架 1-上架',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='汉文化活动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_culture`
--

LOCK TABLES `sys_culture` WRITE;
/*!40000 ALTER TABLE `sys_culture` DISABLE KEYS */;
INSERT INTO `sys_culture` VALUES ('1','汉服体验活动',68.00,'体验传统汉服文化            ','汉服体验活动让您深度体验中华传统服饰文化，包含汉服试穿、传统礼仪学习、古典舞蹈体验等项目。','/img/1751295142658汉服体验活动.jpg','文化体验','文化体验馆','每周六日 9:00-17:00',20,'17820020101',1,NULL,'2025-06-30 16:58:04','超级管理员','2025-06-30 22:52:41'),('10','诗词鉴赏沙龙',48.00,'品味经典诗词之美     ','诗词鉴赏沙龙由文学专家主持，赏析唐诗宋词经典作品，讲解诗词格律与创作技巧，参与者可分享自己的诗词心得。','/img/1751295321468诗词鉴赏沙龙.jpg','文化交流','雅韵书斋','每周日 15:00-17:30',20,'19898980000',1,NULL,'2025-06-30 22:54:42','超级管理员','2025-06-30 22:55:34'),('11',' 汉中傩艺文化展演 ',158.00,' 探秘古老傩艺文化 ',' 傩艺文化展演将呈现汉中地区独具特色的傩戏、傩舞表演，现场还有傩面具制作体验环节，深入了解这一国家级非遗文化的魅力。','/img/1751295713995 汉中傩艺文化展演 .jpeg',' 文化演出 ',' 汉中非遗中心 ',' 每月 15 日 19:00-21:30',80,'13809167890',1,NULL,'2025-06-30 23:00:44','超级管理员','2025-06-30 23:01:55'),('12',' 汉水文化研学之旅 ',268.00,' 探寻汉水文明脉络 ',' 研学之旅将带领参与者走访汉中古栈道、石门栈道遗址、古汉台等地，由专家随行讲解汉水流域的历史文化，体验考古发掘、文物修复等趣味项目。','/img/1751295739765 汉水文化研学之旅 .jpeg',' 文化研学 ',' 汉中博物馆集合 ',' 每月最后一个周末 8:30-17:00',50,'15991654321',1,NULL,'2025-06-30 23:00:44','超级管理员','2025-06-30 23:02:21'),('2','书法体验课',38.00,'学习传统书法艺术             ','书法体验课程由专业老师指导，学习毛笔字的基本笔画和字体结构，感受传统文化的魅力。','/img/1751295201630书法体验课.jpeg','文化学习','书法教室','每周三、五 14:00-16:00',15,'17878781111',1,NULL,'2025-06-30 16:58:04','超级管理员','2025-06-30 22:53:35'),('3','茶艺品鉴会',98.00,'感受传统茶艺魅力        ','茶艺品鉴会由资深茶艺师主持，讲解中国茶文化历史，演示泡茶技巧，参与者可品尝多种名茶，学习茶道礼仪。','/img/1751295363360茶艺品鉴会.jpeg','文化体验','古雅茶社','每周日 10:00-15:00',12,'15110101010',1,NULL,'2025-06-30 22:54:42','超级管理员','2025-06-30 22:56:15'),('4','传统剪纸艺术',48.00,'学习非遗剪纸技艺   ','剪纸艺术课由非遗传承人授课，教授传统剪纸技法，参与者可亲手制作生肖、花卉等主题剪纸作品，体验非遗魅力。','/img/1751295410505传统剪纸艺术.jpeg','文化学习','非遗工作室','每周二、四 15:00-17:00',18,'17010101010',1,NULL,'2025-06-30 22:54:42','超级管理员','2025-06-30 22:57:03'),('5','古琴演奏会',128.00,'聆听千年古乐之声   ','古琴演奏会邀请国家级演奏家现场演绎经典曲目，讲解古琴历史与文化背景，感受传统音乐的深邃意境。','/img/1751295447099古琴演奏会.jpeg','文化演出','音乐厅','每月第一周周六 19:30-21:00',50,'19020202020',1,NULL,'2025-06-30 22:54:42','超级管理员','2025-06-30 22:57:37'),('6','国画创作体验',88.00,'挥毫泼墨绘山河    ','国画体验课由专业画家指导，学习水墨画基本技法，尝试绘制花鸟、山水等传统题材，体验国画的笔墨情趣。','/img/1751295546701国画创作体验.jpg','文化学习','丹青画室','每周六 14:00-17:00',10,'15115151511',1,NULL,'2025-06-30 22:54:42','超级管理员','2025-06-30 22:59:18'),('9','木版年画制作',68.00,'非遗木版年画印制    ','木版年画制作体验课由传承人指导，了解木版年画历史，亲手操作雕版印刷流程，制作传统年画作品。','/img/1751295487577木版年画制作.jpeg','文化体验','年画作坊','每周六 10:00-16:00',16,'16161616161',1,NULL,'2025-06-30 22:54:42','超级管理员','2025-06-30 22:58:15');
/*!40000 ALTER TABLE `sys_culture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_favor`
--

DROP TABLE IF EXISTS `sys_favor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_favor` (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `line_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '路线id',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `introduce` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '介绍',
  `images` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '图片',
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='收藏';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_favor`
--

LOCK TABLES `sys_favor` WRITE;
/*!40000 ALTER TABLE `sys_favor` DISABLE KEYS */;
INSERT INTO `sys_favor` VALUES ('1941018564171563010','1939707994761564162','汉中公布6条精品线路 畅游国庆假期','陕西网讯（记者  曹彦强）秋高气爽、微风不燥，为让各地来汉游客更好的畅游汉中，国庆假期前夕，汉中公布6条旅游精品线路。','http://localhost:8080/img/1751297396615111.jpeg','c222bd3be6c799269eba124c8e78dd5a'),('1941018619376992258','1939706258906910721','汉中发布9条旅游精品线路 向游客发出春节假期“体育邀约”','不错','http://localhost:8080/img/1751296983363好.webp','c222bd3be6c799269eba124c8e78dd5a'),('1941019401576939521','1939706258906910721','汉中发布9条旅游精品线路 向游客发出春节假期“体育邀约”','不错','http://localhost:8080/img/1751296983363好.webp','e0cfe29a2822b2fe7f87ae43c0987fbe');
/*!40000 ALTER TABLE `sys_favor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_food`
--

DROP TABLE IF EXISTS `sys_food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_food` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '美食名称',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `introduce` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '简介',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '详细介绍',
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '图片',
  `recommend_level` int DEFAULT '5' COMMENT '推荐指数（1-5星）',
  `food_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '美食类型（川菜、湘菜、粤菜等）',
  `restaurant` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '推荐餐厅',
  `business_hours` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '营业时间',
  `state` int DEFAULT '1' COMMENT '状态 0-下架 1-上架',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='美食推荐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_food`
--

LOCK TABLES `sys_food` WRITE;
/*!40000 ALTER TABLE `sys_food` DISABLE KEYS */;
INSERT INTO `sys_food` VALUES ('1','汉中热面皮',8.00,'软糯香辣，陕南一绝口感软糯香辣','汉中热面皮以本地优质大米为原料，经浸泡、磨浆、蒸制而成。搭配秘制辣椒油、豆芽、青菜，口感软糯香辣，是陕南地区最具代表性的美食之一。','/img/1751294794877汉中热面皮.jpeg',5,'陕南小吃','王家面皮','07:00-20:00',1,NULL,'2025-06-30 22:39:42','超级管理员','2025-06-30 22:46:36'),('10','腊肉拼盘',128.00,'陕南腊味盛宴，口感丰富','精选镇巴腊肉、腊肠、腊排骨等，配以青椒、红椒、蒜苗等炒制而成。腊味浓郁，口感丰富，是陕南地区年夜饭必备菜品。','/img/1751294490076腊肉拼盘.jpg',5,'陕南菜肴','秦巴味道','11:00-22:00',1,NULL,'2025-06-30 22:40:27','超级管理员','2025-06-30 22:41:32'),('11','略阳乌鸡煲',168.00,'营养滋补，汤鲜肉美，味道一绝。','以略阳乌鸡为原料，配以枸杞、红枣、党参等中药材慢火熬制而成。汤鲜肉美，营养滋补，是陕南地区著名的养生美食。','/img/1751294517055略阳乌鸡煲.jpeg',5,'陕南菜肴','乌鸡养生坊','10:30-21:30',1,NULL,'2025-06-30 22:40:27','超级管理员','2025-06-30 22:42:11'),('12','上元观红豆腐',28.00,'色泽红润，味道醇厚。味道一绝。\n','上元观红豆腐是城固县上元观镇特产，用优质黄豆制成豆腐，再配以红曲、花椒等调料腌制而成。色泽红润，味道醇厚，是陕南地区著名的风味小吃。','/img/1751294553399上元观红豆腐.jpg',5,'陕南小吃','上元观红豆腐店','09:00-19:00',1,NULL,'2025-06-30 22:40:27','超级管理员','2025-06-30 22:42:47'),('13','城固蜜桔',15.00,'果实扁圆，皮薄肉厚，香甜多汁','城固蜜桔是汉中城固县特产，果实扁圆，皮薄肉厚，香甜多汁，富含维生素C，是陕南地区著名的水果之一。','/img/1751294603314城固蜜桔.jpeg',5,'陕南特产','城固蜜桔直销店','09:00-20:00',1,NULL,'2025-06-30 22:40:27','超级管理员','2025-06-30 22:43:43'),('14','西乡樱桃',38.00,'色泽鲜艳，酸甜可口，富含多种维生素和矿物质','西乡樱桃是汉中市西乡县特产，果实色泽鲜艳，酸甜可口，富含多种维生素和矿物质，是陕南地区著名的时令水果。','/img/1751294645852西乡樱桃.jpeg',5,'陕南特产','樱桃沟农家乐','04:30-18:00',1,NULL,'2025-06-30 22:40:27','超级管理员','2025-06-30 22:44:16'),('15','洋县黑米糕',6.00,'口感软糯香甜，营养丰富','洋县黑米糕以洋县特产黑米为原料，经发酵、蒸制而成。口感软糯香甜，营养丰富，是陕南地区著名的传统小吃。','/img/1751294676264洋县黑米糕.jpeg',5,'陕南小吃','洋县黑米糕店','07:00-19:00',1,NULL,'2025-06-30 22:40:27','超级管理员','2025-06-30 22:44:47'),('16','留坝土蜂蜜',98.00,'汉中留坝县特产，天然纯净，营养丰富','留坝土蜂蜜是汉中留坝县特产，采用传统养殖方式，由中华蜜蜂采集百花酿成。天然纯净，营养丰富，是陕南地区著名的养生佳品。','/img/1751294715790留坝土蜂蜜.jpg',5,'陕南特产','留坝蜂蜜专卖店','08:30-18:30',1,NULL,'2025-06-30 22:40:27','超级管理员','2025-06-30 22:45:26'),('2','菜豆腐',10.00,'配以时令蔬菜，清香爽口，营养丰富','汉中菜豆腐以黄豆为原料，采用传统工艺制作，配以时令蔬菜，清香爽口，营养丰富，是汉中地区传统的早餐佳品。','/img/1751294828909菜豆腐.jpeg',5,'陕南小吃','李家菜豆腐','07:30-14:00',1,NULL,'2025-06-30 22:39:42','超级管理员','2025-06-30 22:47:10'),('3','浆水面',12.00,'酸爽开胃，消暑佳品，口感酸香爽口','浆水面是汉中地区夏季特色美食，以发酵的酸菜水为汤底，配以手工面条、韭菜、辣椒等，口感酸香爽口，消暑开胃。','/img/1751294852151浆水面.jpeg',5,'陕南面食','张记面馆','10:00-22:00',1,NULL,'2025-06-30 22:39:42','超级管理员','2025-06-30 22:47:46'),('4','核桃馍',15.00,'酥脆香甜，回味无穷   ','宁强核桃馍是汉中宁强县特色小吃，以面粉、核桃为主要原料，经烘烤而成。外皮酥脆，内馅柔软，带有浓郁的核桃香味，是汉中地区著名的风味小吃。','/img/1751294890771核桃馍.jpeg',5,'陕南小吃','宁强核桃馍店','09:00-19:00',1,NULL,'2025-06-30 22:39:42','超级管理员','2025-06-30 22:48:19'),('5','梆梆面',10.00,'细如发丝，口感筋道   ','梆梆面因过去卖面人沿街敲梆招揽顾客而得名。面条细如发丝，口感筋道，配以鸡汤、红油、葱花等调料，味道十分鲜美。','/img/1751294926257梆梆面.jpeg',5,'陕南面食','老城梆梆面馆','07:30-20:30',1,NULL,'2025-06-30 22:39:42','超级管理员','2025-06-30 22:48:49'),('6','西乡牛肉干',88.00,'色泽红亮，嚼劲十足   \n','西乡牛肉干是汉中市西乡县著名特产，选用优质牛肉为原料，配以多种香料腌制、烘烤而成。肉质紧实，味道鲜美，是佐酒下饭的佳品。','/img/1751294950422西乡牛肉干.jpg',5,'陕南特产','西乡牛肉干专卖店','08:30-18:30',1,NULL,'2025-06-30 22:39:42','超级管理员','2025-06-30 22:49:15'),('7','宁强麻辣鸡',68.00,'麻辣鲜香，回味无穷   \n','宁强麻辣鸡是汉中宁强县传统名菜，以本地土鸡为原料，配以花椒、辣椒、生姜等多种调料烹制而成。口感麻辣鲜香，是汉中地区宴请宾客的必备佳肴。','/img/1751294995127宁强麻辣鸡.jpeg',5,'陕南菜肴','宁强麻辣鸡老店','10:00-21:30',1,NULL,'2025-06-30 22:39:42','超级管理员','2025-06-30 22:50:00'),('8','镇巴腊肉',98.00,'风味独特，口感醇厚  ','镇巴腊肉是汉中镇巴县特色美食，选用本地土猪肉为原料，经腌制、烟熏等工序制成。肉质紧实，香气浓郁，是汉中地区冬季的传统美食。','/img/1751295023827镇巴腊肉.jpeg',5,'陕南特产','镇巴腊肉店','09:00-19:30',1,NULL,'2025-06-30 22:39:42','超级管理员','2025-06-30 22:50:27'),('9','罐罐茶',15.00,'陕南特色饮品，暖胃养生','罐罐茶是陕南地区传统饮品，用小陶罐熬煮茶叶，加入核桃仁、芝麻、花生等配料，再佐以油馍、麻花等小吃，暖胃养生，风味独特。','/img/1751294749275罐罐茶.jpg',5,'陕南饮品','南山茶舍','08:00-18:00',1,NULL,'2025-06-30 22:40:27','超级管理员','2025-06-30 22:45:52');
/*!40000 ALTER TABLE `sys_food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_forum`
--

DROP TABLE IF EXISTS `sys_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_forum` (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '内容',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='资讯';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_forum`
--

LOCK TABLES `sys_forum` WRITE;
/*!40000 ALTER TABLE `sys_forum` DISABLE KEYS */;
INSERT INTO `sys_forum` VALUES ('1801138479702032385','五一出行数据 悠家民宿告诉你旅游现在有多火','<p>五一假期已然过去</p><p>文化和旅游部6日发布的数据显示</p><p>全国国内旅游出游人次达到惊人的2.95亿</p><p>较去年同期增长7.6%，</p><p>与2019年同期相比，更是增长了28.2%!</p><p>国内游客出游总花费高达1668.9亿元，</p><p>同比增长12.7%，较2019年同期增长13.5%</p><p>文旅活动丰富多彩，满足游客多元需求</p><p>这个五一，从城市到乡村，从传统文化到现代艺术，各级文化和旅游部门精心策划了各类特色旅游产品和文化活动。</p><p>全国各级公共图书馆、文化馆(站)免费开放，为公众提供了丰富的公共文化产品。</p><p>村晚、广场舞、群众歌咏等群众文化活动，让游客在旅途中也能感受到浓厚的文化氛围。</p><p>文旅消费持续升温，惠民措施频出</p>','超级管理员','2024-06-13 14:24:12','超级管理员','2024-06-13 14:24:12'),('1939692783522516993','西安最新最实用的旅游攻略','<p class=\"ql-align-justify\"><strong>西安旅游必去景点：</strong></p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\"><strong>陕西历史博物馆、华清宫、骊山、秦始皇兵马俑、大唐不夜城、华山、古城墙、大雁塔、钟鼓楼</strong></p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\"><img src=\"http://dj-ypyun.cdn.bcebos.com/uploads/images/202401/20240117/2876c49b4c3875be66c567cef96a16ed.jpg\"></p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\"><strong>游玩小建议：</strong></p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">1.西安旅游想省钱的话，一定要找个本地人接待，绝对不要在出发地找当地旅行社，可以省掉很多中间费用，这个也就是为什么我4天下来费用人均才800多的原因之一。</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">2.西安热门景区的门票需要实名制提前预定，没有预定好相关门票请千万不要贸然前往；找本地人帮忙代买门票可以节省不少钱，因为景区给本地人买票有很大折扣。</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\"><img src=\"http://dj-ypyun.cdn.bcebos.com/uploads/images/202410/20241029/bf7d309acba1056f81e181b08be48f99.jpg\"></p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">关于当地导游：</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">这次去西安，我去过西安旅游的朋友给我介绍了一个西安当地做散客自由行接待的导游小乔，她帮我们免费规划了整个行程，并带我们游玩。</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">小乔，人真的很好，她的<span style=\"color: rgb(255, 0, 0);\">电话（微信）</span></p><p class=\"ql-align-justify\"><span style=\"color: rgb(255, 0, 0);\">15291484732</span><img src=\"http://dj-ypyun.cdn.bcebos.com/static/fixedtool/common_07/images/lookqr.png\">，很热情，如果你想自驾游，小包团，结伴自由行，或者了解酒店，美食，门票价格，出行交通规划，旅游最新情况，注意事项，都可以找小乔咨询的，她咨询不收费的，放心吧，哈哈，满意的话，也可以找她做导游。</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">更值得推荐的是，她们家不管你一行是多少人都能接待，不像我前面联系的其他几家公司，一听我们人少就不愿意接待，就连别人家不能接待的大唐芙蓉园、长恨歌，永兴坊、法门寺，黄帝陵的自由行景点，小乔都能帮忙安排，这点对散客朋友太重要了&nbsp;。</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\"><strong>关于就餐：</strong></p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">千万不要以为只是简单的便饭，小乔有特地为我们安排了【西安歌舞餐】【陕西特色美食街】，让我们享受西安地道特色美食宴。</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\"><img src=\"http://dj-ypyun.cdn.bcebos.com/uploads/images/202312/20231212/5b7998a6cd0dba49ecd85fd404201735.jpeg\"></p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\"><strong>关于住宿：</strong></p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">小乔家经常做活动，给客人升级为五星住宿，有时还有其他福利。</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\"><img src=\"http://dj-ypyun.cdn.bcebos.com/uploads/images/202410/20241029/19dc51ee7227553269224b1fe8b250d8.jpg\"></p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\"><strong>我们这次游玩的行程分享（超级推荐，西安好玩的景点，都去到了）：</strong></p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">D1：小乔接我们，到酒店稍作休息后，前往陕西历史博物馆-陕西特色美食街</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\"><img src=\"http://dj-ypyun.cdn.bcebos.com/uploads/images/202410/20241029/d5a927c23cc07d077e169c9717a11e36.jpg\"></p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">D2：华清宫+骊山景区+秦始皇兵马俑+大唐不夜城夜景</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\"><img src=\"http://dj-ypyun.cdn.bcebos.com/uploads/images/202410/20241029/8bd63aad36cd690edc9e96cc32fe7988.jpg\"></p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">D3：西安-游天下第一险山-华山</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\"><img src=\"http://dj-ypyun.cdn.bcebos.com/uploads/images/202410/20241029/a42f3704475942d58a52f133b3fcba88.jpg\"></p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">D4：西安城墙+大雁塔广场+钟鼓楼广场，根据我们的返程时间送我们</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\"><img src=\"http://dj-ypyun.cdn.bcebos.com/uploads/images/202410/20241029/2bbd7079a3e8e13206b9cda1609906f8.jpg\"></p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">温馨小提示：</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">1、西安景点太分散，建议到西安当地后不要自驾游和自己玩，自己玩不光浪费时间，而且旺季的时候停车位比用的油费都要贵&nbsp;；</p><p class=\"ql-align-justify\">2、景区早晚温差大，衣物要提前备好，穿运动鞋最好；</p><p class=\"ql-align-justify\">3、在启程之前要做好大致的行程安排、&nbsp;因为好订酒店&nbsp;，不然你都搞不清楚要住哪里，尤其旺季临时订肯定没房，人超级多哦；</p><p class=\"ql-align-justify\">4、不要轻信在街上“跑路单”的出租车和顺风车司机的鬼话，说50元载你目的地，很近呀，其实他们就是把你们卖了赚钱，一定要牢记天下没有免费的午餐，不然你至少要多花3000以上的费用。</p><p class=\"ql-align-justify\">5、防晒用品：西安日照强烈，墨镜、阳伞、遮阳帽、防晒霜（指数要高）、&nbsp;润唇膏等可以有效的防止紫外线，如果不采取任何防晒措施的话，皮肤很容易被晒黑或晒伤。</p><p class=\"ql-align-justify\">6、药物：根据自己的健康状况，&nbsp;还要带上所需要的常备药品如消炎、止痛、晕车、清热解毒的药品，风油精，万金油等。</p><p><br></p>','超级管理员','2025-06-30 22:29:32','超级管理员','2025-06-30 22:29:32'),('1939693633615663105','汉中一日攻略：历史与美食交织，承包你的诗与远方','<h3>出发前准备</h3><p><br></p><p>在开启汉中市区一日游之前，有些准备工作可不能忽视。如果选择乘坐公共交通出行，汉中市区的公交线路覆盖较广，在微信公众号搜索 “汉中公交”，或者使用高德、百度地图等 APP，提前查询好要去的景点的公交线路和首末班时间，能避免耽误行程。若是同行人数较多或者想更自由地安排行程，打车也是个不错的选择，汉中打车起步价不算高，能带你轻松抵达各个景点。</p><p>出发前一定要关注汉中的天气情况，提前查看天气预报，晴天时带上防晒用品，如防晒霜、太阳镜和遮阳帽，防止晒伤；若是阴雨天气，记得携带雨具。</p><p>穿着方面，建议穿上舒适的鞋子，毕竟这一天要走不少路，一双好鞋能让你的旅途轻松许多。随身背个轻便的背包，装上饮用水，随时补充水分，还可以带一些小零食，比如巧克力、饼干等，在游玩间隙补充能量。如果有摄影需求，别忘了给相机或手机充满电，带上充电宝，以免错过那些美好的瞬间。</p><h3>上午：历史古韵探寻</h3><p><strong>古汉台（汉中市博物馆）</strong></p><p>早上抵达汉中市区后，第一站强烈推荐前往古汉台，这里曾是刘邦在汉中当汉王时的王府行宫遗址，楚汉相争的风云岁月仿佛仍在这里回荡，承载着厚重的历史文化底蕴，如今是汉中博物馆的所在地。</p><p>踏入博物馆，首先映入眼帘的便是那座人工夯土建成的古汉台，典型的秦汉宫廷模式，虽历经岁月，仍能让人感受到昔日的威严与庄重。沿着台阶拾级而上，仿佛穿越时空，回到了那个英雄辈出的时代。登上古汉台的最高处 —— 望江楼，这座具有清末民初建筑风格的三层高楼，曾经是汉中的最高建筑，站在楼上，极目远眺，汉中市区的景色尽收眼底，让人不禁心生豪迈之情。尽管如今城市规模不断拓展，已无法像过去一样一眼望见汉江，但在这里感受历史的韵味，依旧是一种独特的体验。</p><p>古汉台内的石门十三品陈列室绝对不容错过，这里收藏着被誉为 “国之瑰宝” 的汉魏 “石门十三品” 摩崖石刻 ，这些石刻是从褒斜道石门栈道两壁上凿迁而来，是研究我国古代交通、水利、书法等方面的珍贵实物资料。其中，《石门颂》《石门铭》等作品，以其精湛的书法艺术和丰富的历史内涵，吸引着无数书法爱好者和历史研究者前来观摩学习。每一块石刻都像是一位沉默的历史讲述者，静静诉说着往昔的故事，让人在欣赏书法之美的同时，也能深入了解古代的社会风貌和人们的生活。</p><p><strong>拜将坛</strong></p><h3>从古汉台出来后，可打车前往拜将坛，车程约 10 分钟，这里距离古汉台不远，却又是另一番历史的天地。拜将坛是 “西汉三遗址” 之一，是汉高祖刘邦拜韩信为大将时所筑的古坛场遗址，也是汉中市重要的历史文化遗迹和国家 AAA 级旅游景区。</h3><h3>中午：舌尖上的汉中</h3><p>逛了一上午，想必肚子早已咕咕叫了，是时候开启一场舌尖上的汉中之旅，品尝当地的特色美食了。汉中美食独具特色，融合了南北风味，既有着北方的豪爽大气，又有着南方的细腻婉约，每一口都能让你感受到这座城市的独特魅力。</p><p>首当其冲的便是汉中面皮，作为汉中美食的名片，它可是汉中人餐桌上的常客，深受当地人喜爱。汉中面皮相传始于秦汉时期，制作工艺独特，先将大米浸泡后磨成米浆，上笼蒸成薄皮儿，趁热抹上菜籽油，切成条状 ，再依个人口味调入油辣子、味精、精盐、醋、酱油、蒜泥水等佐料，拌匀即可食用。刚入口时，你能感受到面皮的软糯顺滑，仿佛在舌尖上舞动，紧接着，油辣子的香辣瞬间在口中绽放，那独特的香味刺激着味蕾，让人欲罢不能。汉中面皮的配菜也十分讲究，常见的有黄豆芽、胡萝卜丝、芹菜、菠菜等，爽脆的配菜与软糯的面皮相互搭配，口感层次丰富，一口下去，满满的幸福感。在汉中，大街小巷随处可见面皮店，每一家都有着自己独特的风味，其中东大街古汉台对面的张明富面皮店名气颇高，经常是爆满状态，门外都坐满了人。这里的面皮种类丰富，有热米皮、凉米皮、红薯粉皮等，价格实惠，米皮、粉皮 6 - 11 块钱不等，你可以根据自己的喜好选择，再配上一碗花生稀饭或菜豆腐，那滋味，简直绝了！</p>','超级管理员','2025-06-30 22:32:55','超级管理员','2025-06-30 22:33:50');
/*!40000 ALTER TABLE `sys_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_hotel`
--

DROP TABLE IF EXISTS `sys_hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_hotel` (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `attractions_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '景区id',
  `attractions` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '景区',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地址',
  `introduce` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '介绍',
  `images` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '图片',
  `state` int DEFAULT '0' COMMENT '状态',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='酒店';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_hotel`
--

LOCK TABLES `sys_hotel` WRITE;
/*!40000 ALTER TABLE `sys_hotel` DISABLE KEYS */;
INSERT INTO `sys_hotel` VALUES ('1939708837783113730','1','古汉台','古汉台名宿','位于古汉台5km内','房间舒适','http://localhost:8080/img/1751297598694洋县黑米糕.jpeg',1,'超级管理员','2025-06-30 23:33:20','超级管理员','2025-07-04 14:14:17'),('1941017587498516481','2','石门栈道','陕西理工大学南校区','陕西理工大学南校区','陕西理工大学南校区','http://localhost:8080/img/1751609628886restaurant2.jpg',1,'超级管理员','2025-07-04 14:13:50','超级管理员','2025-07-04 14:14:15');
/*!40000 ALTER TABLE `sys_hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_hotel_item`
--

DROP TABLE IF EXISTS `sys_hotel_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_hotel_item` (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hotel_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '酒店id',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `price` float(10,2) DEFAULT NULL COMMENT '价格',
  `num` int DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='房型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_hotel_item`
--

LOCK TABLES `sys_hotel_item` WRITE;
/*!40000 ALTER TABLE `sys_hotel_item` DISABLE KEYS */;
INSERT INTO `sys_hotel_item` VALUES ('1939709563313819649','1939708837783113730','大床房',178.00,10),('1939709601674924034','1939708837783113730','双人房',200.00,8),('1941017673217507329','1941017587498516481','叙利亚战损8人间',999.00,7);
/*!40000 ALTER TABLE `sys_hotel_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_hotel_order`
--

DROP TABLE IF EXISTS `sys_hotel_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_hotel_order` (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hotel_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '酒店id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `introduce` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '简介',
  `images` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '图片',
  `num` int DEFAULT NULL COMMENT '人数',
  `time` datetime DEFAULT NULL COMMENT '预约时间',
  `people` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '信息',
  `state` int DEFAULT '0' COMMENT '状态',
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户id',
  `item_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '房型id',
  `item_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '房型',
  `price` float(10,2) DEFAULT NULL COMMENT '价格',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='酒店预约';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_hotel_order`
--

LOCK TABLES `sys_hotel_order` WRITE;
/*!40000 ALTER TABLE `sys_hotel_order` DISABLE KEYS */;
INSERT INTO `sys_hotel_order` VALUES ('1939709735112511489','1939708837783113730','古汉台名宿','房间舒适','http://localhost:8080/img/1751297598694洋县黑米糕.jpeg',1,'2025-06-19 08:00:00','{\"name\":\"11\",\"tel\":\"11\",\"idCard\":\"11\"}',0,'1697436716646531073','1939709601674924034','双人房',200.00,'超级管理员','2025-06-30 23:36:54','超级管理员','2025-06-30 23:36:54'),('1941018742437871618','1941017587498516481','陕西理工大学南校区','陕西理工大学南校区','http://localhost:8080/img/1751609628886restaurant2.jpg',1,'2025-07-17 08:00:00','{\"name\":\"王磊\",\"tel\":\"13348789556\",\"idCard\":\"612527200304233018\"}',1,'c222bd3be6c799269eba124c8e78dd5a','1941017673217507329','叙利亚战损8人间',999.00,'搁浅','2025-07-04 14:18:25','超级管理员','2025-07-04 14:18:36'),('1941019312028549122','1939708837783113730','古汉台名宿','房间舒适','http://localhost:8080/img/1751297598694洋县黑米糕.jpeg',1,'2025-07-17 08:00:00','{\"name\":\"彭于晏\",\"tel\":\"13345233550\",\"idCard\":\"612527200504233014\"}',1,'e0cfe29a2822b2fe7f87ae43c0987fbe','1939709601674924034','双人房',200.00,'test','2025-07-04 14:20:41','超级管理员','2025-07-04 14:20:51');
/*!40000 ALTER TABLE `sys_hotel_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_line`
--

DROP TABLE IF EXISTS `sys_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_line` (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `temperature` int DEFAULT NULL COMMENT '温度',
  `geography` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地理情况',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '内容',
  `introduce` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '介绍',
  `images` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '图片',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='旅游线路';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_line`
--

LOCK TABLES `sys_line` WRITE;
/*!40000 ALTER TABLE `sys_line` DISABLE KEYS */;
INSERT INTO `sys_line` VALUES ('1939706258906910721',30,'好','汉中发布9条旅游精品线路 向游客发出春节假期“体育邀约”','<p>1月12日，陕西省大众冰雪季暨第十一届滑雪大会汉中分会场(南郑龙头山滑雪场)陕西省高山滑雪积分赛(汉中站)暨汉中首届冬季两项公开赛2025“跟着赛事游汉中”消费体验季主题发布活动在龙头山景区举行。活动现场发布了汉中市2025年春节期间体育旅游精品线路。</p><p><br></p><p>据悉，线路涵盖冰雪运动、户外运动以及传统体育运动三大类共9条，充分融合了汉中的自然风光、历史文化与体育运动元素，一系列多彩有趣的体育旅游项目“串珠成链”，向市民游客发出春节假期的“体育邀约”。</p><p><br></p><p>“速度激情冰雪运动线路”涵盖南郑、宁强、留坝3个县区，市民游客可以在滑雪场体验滑雪、雪地足球、雪地摩托等多种雪地运动，同时还能游览南郑大佛洞溶洞群、宁强汉江源景区等自然景观。</p><p><br></p><p>“赏雪戏雪户外运动线路”则涉及西乡、略阳、佛坪3个县区，游客可以自驾或徒步亲近大自然，欣赏银装素裹的美景，并在西乡樱桃沟、略阳汉析里田园温泉度假区等地休闲度假。</p><p>“休闲传统体育运动线路”主要在汉台、城固、勉县3个县区展开，游客可以参与投壶、射箭、舞龙舞狮等传统体育项目，感受浓浓的年味，还可以寻访汉中市博物馆、张骞纪念馆、武侯墓等两汉三国遗迹，深入了解汉中丰富的历史文化底蕴。</p><p><br></p><p>这些线路的推出，将进一步推动汉中体旅融合发展，释放体育旅游消费潜力，游客可在休闲运动中饱览自然秀丽风光，感受千年汉风古韵，深入领略汉中的独特魅力。</p>','不错','http://localhost:8080/img/1751296983363好.webp','超级管理员','2025-06-30 23:23:05','超级管理员','2025-06-30 23:23:05'),('1939707994761564162',26,'山地','汉中公布6条精品线路 畅游国庆假期','<p class=\"ql-align-justify\">	<strong>线路一、穿着汉服游汉中</strong></p><p class=\"ql-align-justify\">	天汉文化公园——天汉楼广场——天汉长街——市博物馆——石门栈道——兴汉胜境——龙头山——诸葛古镇——诸葛街——汉江源景区——张骞纪念馆——蔡伦墓——华阳景区——午子山——西乡廊桥水城</p><p class=\"ql-align-justify\">	<strong>线路二、赶着赛事游汉中</strong></p><p class=\"ql-align-justify\">	天汉文化公园——天汉楼——吾悦广场——白渡片区——诸葛古镇——诸葛街——汉江源——青木川古镇——镇巴县城</p><p class=\"ql-align-justify\">	<strong>线路三、跟着音乐游汉中</strong></p><p class=\"ql-align-justify\">	天汉文化公园——吾悦广场——一江两岸音乐喷泉——汉中市文化馆演出报告厅——红星剧院——华阳景区——佛坪县城——镇巴民歌广场——班城记忆老街</p><p class=\"ql-align-justify\">	<strong>线路四、寻根老家游汉中</strong></p><p class=\"ql-align-justify\">	汉中市博物馆——天汉文化公园——鼎鼎百货—一江两岸音乐喷泉——石门栈道风景区——兴汉胜境——天汉楼广场——天台国家森林公园——花果山——褒国古镇——武侯祠——马超墓——武侯墓——九昱温泉——张骞纪念馆——蔡伦墓祠——朱鹮生态园——华阳景区——骆家坝古镇——午子山景区——七星湖景区</p><p class=\"ql-align-justify\">	<strong>线路五、乐享丰收游汉中</strong></p><p class=\"ql-align-justify\">	天汉文化公园——天台国家森林公园——武乡镇——大汉山——南湖——红寺湖——张骞纪念馆——桔园——留坝火烧店——紫柏山森林公园——朱鹮生态园——蔡伦墓（蔡伦造纸博物馆）——佛坪老街——熊猫谷——秦岭人与自然博物馆——携程度假山庄</p><p class=\"ql-align-justify\">	<strong>线路六、寻味美食游汉中</strong></p><p class=\"ql-align-justify\">	天汉长街——南郑民乐园——青树古镇——藤编产业园——黄官黄酒酒厂——汉中市区前进路夜市——丁字街——龙头山景区——小南海大佛洞——尤曼吉游乐世界——聚源春鱼庄——一江两岸音乐喷泉——张骞纪念馆——城固桔园——上元观古镇</p><p><br></p>','陕西网讯（记者  曹彦强）秋高气爽、微风不燥，为让各地来汉游客更好的畅游汉中，国庆假期前夕，汉中公布6条旅游精品线路。','http://localhost:8080/img/1751297396615111.jpeg','超级管理员','2025-06-30 23:29:59','超级管理员','2025-06-30 23:29:59');
/*!40000 ALTER TABLE `sys_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_message`
--

DROP TABLE IF EXISTS `sys_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_message` (
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '留言人姓名',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系电话',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '电子邮箱',
  `subject` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '留言主题',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '留言内容',
  `status` int DEFAULT '0' COMMENT '处理状态（0-未处理，1-已处理）',
  `reply` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '管理员回复',
  `handler` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '处理人',
  `handle_time` datetime DEFAULT NULL COMMENT '处理时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户留言表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_message`
--

LOCK TABLES `sys_message` WRITE;
/*!40000 ALTER TABLE `sys_message` DISABLE KEYS */;
INSERT INTO `sys_message` VALUES ('1939632679306481666','1','15115151511','11111@163.com','1','11111111111111',1,'1','admin','2025-06-30 18:30:56','2025-06-30 18:30:42','杨羊','2025-06-30 18:30:56','超级管理员'),('1941019589452398593','王磊','13345233550','2933909350@qq.com','没钱了','111111111111',1,'6','admin','2025-07-04 14:21:55','2025-07-04 14:21:47','test','2025-07-04 14:21:55','超级管理员');
/*!40000 ALTER TABLE `sys_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rotations`
--

DROP TABLE IF EXISTS `sys_rotations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_rotations` (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='轮播图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rotations`
--

LOCK TABLES `sys_rotations` WRITE;
/*!40000 ALTER TABLE `sys_rotations` DISABLE KEYS */;
INSERT INTO `sys_rotations` VALUES ('1941018095416147969','/img/1751609749914slide2.jpg'),('1941018124616892418','/img/1751609757144slide1.jpg'),('1941018347615453185','/img/1751609810209shimen-zhandao.jpg'),('1941018431262457857','/img/1751609830353zhuyu-liyuan.jpg');
/*!40000 ALTER TABLE `sys_rotations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `login_account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '登陆账号',
  `user_type` int DEFAULT NULL COMMENT '用户类型（0：系统 1：用户 2：律师）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户邮箱',
  `tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号码',
  `sex` int DEFAULT '0' COMMENT '性别（0：男 1：女）',
  `avatar` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '头像',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `salt` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '盐值',
  `status` int DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('0de96461b6ef0328cef416dea9366c9c','武松','user',1,'123@qq.com','18677777777',0,'/img/1723297404622.jpg','776998b8c72d46458f1a2b3f7e37f83b','a90fcb42324744318c6822abd2b1801c',0,NULL,'2024-04-09 21:34:26',NULL,'2025-04-09 21:34:26','超级管理员','2025-05-08 10:57:40',NULL),('1697436716646531073','超级管理员','admin',0,'1234@qq.com','18677777778',0,'/img/1751298407861.webp','da62f5c8b8f341fea4bdb777b6af63ce','e67b3f5f178f15cc76a5dc1867a16653',0,'2024-03-26 15:17:29','2024-08-11 09:26:43','超级管理员','2025-03-26 15:17:34','超级管理员','2025-06-30 23:46:50',NULL),('20e8806904b180be651d439609d16070','杨羊','ys888',1,'11111@qq.com','15116232323',0,'/img/1746588687199.webp','a38f6f55f3e84be7b28653bb58e08cfb','7fe9786cc7df56ff550dafae87e0bf5b',0,NULL,'2025-05-07 11:27:39',NULL,'2025-05-07 11:27:39','超级管理员','2025-05-08 10:58:06',NULL),('6344ce4e28cac0ede1306b86bac59c85','我是889','ys889',1,'1522818281@163.com','1522818281',0,'/img/1746675991581.webp','e6c6a942047a4a759f6f9b7b48a1e89e','682ed1f00dbf2f2720ba1c0d393a062e',0,NULL,'2025-05-08 10:59:06',NULL,'2025-05-08 10:59:06',NULL,'2025-05-08 11:46:32',NULL),('c222bd3be6c799269eba124c8e78dd5a','搁浅','geqian',1,'2933909350@qq.com','13345233550',0,'/img/1751609722454.jpg','71625fc934534df8b51d87e3a64a3841','de5a82c12ce15c7cb9b5305f7e39cfeb',0,NULL,'2025-07-04 14:15:00',NULL,'2025-07-04 14:15:00',NULL,'2025-07-04 14:15:22',NULL),('d97f5bcc9b06e080d743554ef38b2b2d','张用户','user2',1,'1@qq.com','123455678',0,'/img/1697436716646531073.jpeg','4c90a82143c545ad976a87d5b27078ad','2202ed25c79d5c982ac9f263a9a5c22a',0,NULL,'2024-08-11 10:32:04',NULL,'2025-08-11 10:32:04','超级管理员','2025-05-08 10:58:19',NULL),('e0cfe29a2822b2fe7f87ae43c0987fbe','test','test001',1,'test@163.com','17117171717',0,'/img/1751609667320.jpg','76dffb4e0ad240fcb4dac2bc2f373050','7cbaef878df2ffcaaeca1fdfc9527ffd',0,NULL,'2025-06-30 23:42:30',NULL,'2025-06-30 23:42:31','test','2025-07-04 14:14:27',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-04 14:26:47
