/*
SQLyog v10.2 
MySQL - 5.5.53 : Database - shop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shop` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `shop`;

/*Table structure for table `shop_address` */

DROP TABLE IF EXISTS `shop_address`;

CREATE TABLE `shop_address` (
  `addressid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `province` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`addressid`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `shop_address` */

insert  into `shop_address`(`addressid`,`pid`,`province`) values (1,0,'河北省'),(2,0,'山东省'),(3,0,'辽宁省'),(4,0,'吉林省'),(5,0,'黑龙江省'),(6,0,'上海市'),(7,1,'石家庄市'),(8,1,'唐山市'),(9,1,'秦皇岛市'),(10,1,'邯郸市'),(11,1,'承德市'),(12,5,'哈尔滨市'),(13,5,'鸡西市'),(14,5,'大庆市'),(15,2,'济南市'),(16,2,'青岛市'),(17,2,'枣庄市'),(18,3,'西宁市'),(19,3,'酒泉市'),(20,4,'兰州市'),(21,4,'白银市'),(22,6,'黄浦区'),(23,6,'长宁区');

/*Table structure for table `shop_ads` */

DROP TABLE IF EXISTS `shop_ads`;

CREATE TABLE `shop_ads` (
  `adid` int(11) NOT NULL AUTO_INCREMENT,
  `adPositionid` int(11) DEFAULT '0' COMMENT '广告位置id',
  `adFile` varchar(255) DEFAULT NULL,
  `adname` varchar(100) DEFAULT NULL COMMENT '广告名字',
  `adUrl` varchar(150) DEFAULT NULL COMMENT '广告网址',
  `adStartDate` date DEFAULT NULL COMMENT '开始日期',
  `adEndDate` date DEFAULT NULL COMMENT '结束日期',
  `adSort` int(11) DEFAULT '0' COMMENT '排序号',
  `adClickNum` int(11) DEFAULT '0' COMMENT '广告点击数',
  `positionType` tinyint(4) DEFAULT '0' COMMENT '广告类型',
  `dataFlag` tinyint(4) DEFAULT '1' COMMENT '删除标志',
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`adid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `shop_ads` */

/*Table structure for table `shop_areas` */

DROP TABLE IF EXISTS `shop_areas`;

CREATE TABLE `shop_areas` (
  `areaid` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) DEFAULT NULL,
  `areaname` varchar(100) DEFAULT NULL COMMENT '地区名称',
  `isShow` tinyint(4) DEFAULT '1' COMMENT '0:是 1：否',
  `areaSort` int(11) DEFAULT '0' COMMENT '排序号',
  `areaType` tinyint(4) DEFAULT '1' COMMENT '1：省 2：市区 3：县区',
  `dataFlag` tinyint(4) DEFAULT '1' COMMENT '删除标志 -1：删除 1：有效',
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`areaid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `shop_areas` */

/*Table structure for table `shop_cats` */

DROP TABLE IF EXISTS `shop_cats`;

CREATE TABLE `shop_cats` (
  `catid` int(11) NOT NULL AUTO_INCREMENT,
  `igoodsid` int(11) DEFAULT NULL,
  `isShow` tinyint(4) DEFAULT '1' COMMENT '是否显示 0：隐藏 1：显示',
  `catname` varchar(100) DEFAULT NULL COMMENT '分类名称',
  `catSort` int(11) DEFAULT '0' COMMENT '排序号',
  `dataFlag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '有效 ：1     删除：-1',
  `cratetime` datetime DEFAULT NULL,
  `cuids` int(11) DEFAULT NULL,
  `numbers` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`catid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `shop_cats` */

insert  into `shop_cats`(`catid`,`igoodsid`,`isShow`,`catname`,`catSort`,`dataFlag`,`cratetime`,`cuids`,`numbers`) values (1,12,1,NULL,0,1,NULL,1,'3'),(4,14,1,NULL,0,1,NULL,1,'2'),(5,11,1,NULL,0,1,NULL,1,'1'),(6,23,1,NULL,0,1,NULL,1,'3');

/*Table structure for table `shop_favorites` */

DROP TABLE IF EXISTS `shop_favorites`;

CREATE TABLE `shop_favorites` (
  `favoriteid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `favoriteType` tinyint(4) DEFAULT '0' COMMENT '0：商品 1：店铺',
  `targetid` int(111) DEFAULT NULL COMMENT '对象Id',
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`favoriteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `shop_favorites` */

/*Table structure for table `shop_friendlinks` */

DROP TABLE IF EXISTS `shop_friendlinks`;

CREATE TABLE `shop_friendlinks` (
  `friendlinkid` int(11) NOT NULL AUTO_INCREMENT,
  `friendlinkico` varchar(150) DEFAULT NULL COMMENT '图标',
  `friendlinkname` varchar(50) DEFAULT NULL COMMENT '名称',
  `friendlinkUrl` varchar(255) DEFAULT NULL COMMENT '网址',
  `friendlinkSort` int(11) DEFAULT '0' COMMENT '排序号',
  `dataFlag` tinyint(4) DEFAULT '1' COMMENT '1:有效 -1：删除',
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`friendlinkid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `shop_friendlinks` */

/*Table structure for table `shop_goods` */

DROP TABLE IF EXISTS `shop_goods`;

CREATE TABLE `shop_goods` (
  `goodsid` int(11) NOT NULL AUTO_INCREMENT,
  `goodsSn` varchar(20) DEFAULT NULL COMMENT '商品编号',
  `productNo` varchar(20) DEFAULT NULL COMMENT '商品货号',
  `goodsname` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `goodsimage` varchar(150) DEFAULT NULL,
  `shopId` int(11) DEFAULT NULL COMMENT '门店Id',
  `shopPrice` decimal(10,0) DEFAULT '0' COMMENT '门店价',
  `marketPrice` decimal(10,0) DEFAULT '0' COMMENT '市场价',
  `warnStock` int(11) DEFAULT '0' COMMENT '预警库存',
  `goodsStock` int(11) DEFAULT '0' COMMENT '商品总库存',
  `goodsUnit` char(10) DEFAULT NULL COMMENT '制造单位',
  `goodsTips` text COMMENT '促销信息',
  `isSale` tinyint(4) DEFAULT '1' COMMENT '是否上架 1：上架 0：不上架',
  `isBest` tinyint(4) DEFAULT NULL COMMENT '是否特价 0：否 1：是',
  `isHost` int(11) DEFAULT '0' COMMENT '是否热销产品 0:否 1:是',
  `isNew` tinyint(4) DEFAULT '0' COMMENT '是否新品 0:否 1:是',
  `isRecom` tinyint(4) DEFAULT '0' COMMENT '是否包邮 0:否 1:是',
  `goodsCatIdPath` varchar(255) DEFAULT NULL COMMENT '商品分类路径',
  `goodsCatId` int(11) DEFAULT NULL COMMENT '最后一级商品分类ID',
  `shopCatid1` int(11) DEFAULT NULL COMMENT '门店商品分类第一级ID',
  `shopCatid2` int(11) DEFAULT NULL COMMENT '门店商品第二级分类ID',
  `brandId` int(11) DEFAULT '0' COMMENT '品牌Id',
  `goodsDesc` text COMMENT '商品描述',
  `goodsStatus` tinyint(4) DEFAULT '0' COMMENT '商品状态 -1:违规 0:未审核 1:已审核',
  `saleNum` int(11) DEFAULT '0' COMMENT '总销售量',
  `saleTime` datetime DEFAULT NULL COMMENT '上架时间',
  `visitNum` int(11) DEFAULT '0' COMMENT '访问数',
  `appraiseNum` int(11) DEFAULT '0' COMMENT '评价数',
  `isSpec` tinyint(4) DEFAULT '0' COMMENT '是否有规格 0:没有 1:有',
  `gallery` text COMMENT '商品相册',
  `illegalRemarks` varchar(255) DEFAULT NULL COMMENT '状态说明 	一般用于说明拒绝原因',
  `dataFlag` tinyint(4) DEFAULT '1' COMMENT '删除标志 -1:删除 1:有效',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `goodsphone` int(11) DEFAULT NULL COMMENT '电话',
  `shopids` int(11) DEFAULT NULL,
  PRIMARY KEY (`goodsid`)
) ENGINE=MyISAM AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;

/*Data for the table `shop_goods` */

insert  into `shop_goods`(`goodsid`,`goodsSn`,`productNo`,`goodsname`,`goodsimage`,`shopId`,`shopPrice`,`marketPrice`,`warnStock`,`goodsStock`,`goodsUnit`,`goodsTips`,`isSale`,`isBest`,`isHost`,`isNew`,`isRecom`,`goodsCatIdPath`,`goodsCatId`,`shopCatid1`,`shopCatid2`,`brandId`,`goodsDesc`,`goodsStatus`,`saleNum`,`saleTime`,`visitNum`,`appraiseNum`,`isSpec`,`gallery`,`illegalRemarks`,`dataFlag`,`createTime`,`goodsphone`,`shopids`) values (1,NULL,NULL,'新西兰进口蜂蜜','../static/images/DNA新西兰进口蜂蜜.jpg',NULL,'0','123',0,0,'百度',NULL,1,NULL,22,0,1,'湖南省长沙市岳麓区麓山南路932号',NULL,1,1,0,NULL,0,0,'2019-08-30 09:27:17',18,15,0,NULL,NULL,1,'2018-11-08 11:44:56',1231231,1),(2,NULL,NULL,'马爹利蓝带白酒','../static/images/马爹利蓝带干死白兰地.jpg',NULL,'0','32',0,0,'百度',NULL,1,NULL,0,0,0,'湖南省长沙市麓山南路605',NULL,1,7,0,NULL,0,0,'2019-08-30 09:27:12',12,0,0,NULL,NULL,1,'2018-11-08 16:16:27',4112231,1),(3,NULL,NULL,'特产中国陕西大枣','../static/images/特产中国陕西大枣.jpg',NULL,'0','22',0,0,'百度',NULL,1,NULL,222,0,1,'长沙市岳麓区潇湘中路',NULL,1,4,0,NULL,0,0,'2019-08-30 09:27:09',29,0,0,NULL,NULL,1,'2018-11-08 16:16:32',1421123,1),(4,NULL,NULL,'开心果','../static/images/开心果.jpg',NULL,'0','33',0,0,'京东',NULL,1,NULL,444,0,0,'湖南省长沙市麓山南路605',NULL,1,4,0,NULL,0,0,'2019-08-30 09:27:07',1,0,0,NULL,NULL,1,'2018-11-08 16:17:49',21313123,2),(5,NULL,NULL,'周黑鸭','../static/images/周黑鸭.jpg',NULL,'0','444',0,0,'百度',NULL,1,NULL,333,0,1,'湖南省长沙市岳麓区麓山南路932号',NULL,1,8,0,NULL,0,0,'2019-08-30 09:27:05',6,0,0,NULL,NULL,1,'2018-11-08 11:43:00',2123123,1),(6,NULL,NULL,'人头马XO','../static/images/人头马XO.jpg',NULL,'0','55',0,0,'淘宝',NULL,1,NULL,0,0,0,'湖南省长沙市麓山南路605',NULL,1,7,0,NULL,0,0,'2019-08-30 09:27:03',2,0,0,NULL,NULL,1,'2018-11-03 11:45:01',213123123,4),(7,'1111',NULL,'可口可乐樱桃味','../static/images/可口可乐樱桃味.jpg',NULL,'0','32',0,0,'百度',NULL,1,NULL,555,3,0,'长沙市岳麓区潇湘中路',NULL,1,3,0,NULL,0,0,'2019-08-30 09:26:59',126,0,0,NULL,NULL,1,'2018-11-08 11:37:47',131314,1),(8,NULL,NULL,'核桃','../static/images/核桃.jpg',NULL,'0','1',0,0,'京东',NULL,1,NULL,1,0,1,'湖南省长沙市岳麓区麓山南路932号',NULL,1,5,0,NULL,0,0,'2019-08-30 09:26:57',126,0,0,NULL,NULL,1,'2018-11-08 10:50:21',454665,2),(9,NULL,NULL,'榛子','../static/images/榛子.jpg',NULL,'0','1',0,0,'淘宝',NULL,1,NULL,0,2,0,'湖南省长沙市岳麓区银双路169',NULL,1,5,0,NULL,0,0,'2019-08-30 09:26:51',24,4,0,NULL,NULL,1,'2018-11-08 17:02:04',7576,4),(10,'1111',NULL,'矿泉水','../static/images/矿泉水.jpg',NULL,'0','2',0,0,'京东',NULL,1,NULL,34,0,1,'湖南省长沙市麓山南路605',NULL,1,3,0,NULL,0,1,'2019-08-30 09:26:47',0,0,0,NULL,NULL,1,'2018-11-06 20:42:59',2125141,2),(11,NULL,NULL,'啤酒','../static/images/啤酒.jpg',NULL,'0','2',0,0,'百度',NULL,1,NULL,0,0,0,'湖南省长沙市岳麓区麓山南路932号',NULL,1,3,0,NULL,0,0,'2019-08-30 09:26:45',3123,0,0,NULL,NULL,1,'2018-11-03 11:38:39',786786563,1),(12,NULL,NULL,'老白干','../static/images/老白干.jpg',NULL,'0','4',0,0,'淘宝',NULL,1,1,4,3,0,'长沙市岳麓区潇湘中路',NULL,1,3,0,NULL,0,0,'2019-08-30 09:26:43',1,0,0,NULL,NULL,1,'2018-11-07 22:36:39',543356,4),(13,NULL,NULL,'白酒','../static/images/白酒.jpg',NULL,'0','3',0,0,'京东',NULL,1,NULL,0,0,0,'湖南省长沙市麓山南路605',NULL,1,3,0,NULL,0,2,'2019-08-30 09:26:41',1,0,0,NULL,NULL,1,'2018-11-08 10:41:26',252527,2),(14,'1111',NULL,'冰糖雪梨','../static/images/冰糖雪梨.jpg',NULL,'0','3',0,0,'百度',NULL,1,NULL,5,0,1,'湖南省长沙市岳麓区麓山南路932号',NULL,1,3,0,NULL,0,0,'2019-08-30 09:26:37',124,0,0,NULL,NULL,1,'2018-11-07 22:36:45',62547242,1),(15,'1111',NULL,'哇哈哈','../static/images/哇哈哈.jpg',NULL,'0','3',0,0,'京东',NULL,1,NULL,1,0,0,'长沙市岳麓区潇湘中路',NULL,1,3,0,NULL,0,0,'2019-08-30 09:26:35',0,0,0,NULL,NULL,1,'2018-11-03 11:38:47',12373567,2),(16,NULL,NULL,'大豆油','../static/images/大豆油.jpg',NULL,'0','3',0,0,'京东',NULL,1,NULL,0,0,1,'湖南省长沙市麓山南路605',NULL,2,9,0,NULL,0,0,'2019-08-30 09:26:33',0,0,0,NULL,NULL,1,'2018-11-03 11:38:48',12364552,2),(17,NULL,NULL,'花生油','../static/images/花生油.jpg',NULL,'0','3',0,0,'百度',NULL,1,NULL,0,0,0,'湖南省长沙市岳麓区麓山南路932号',NULL,2,9,0,NULL,0,0,'2019-08-30 09:26:30',2,0,0,NULL,NULL,1,'2018-11-03 11:38:51',567722121,1),(18,NULL,NULL,'地沟油','../static/images/地沟油.jpg',NULL,'0','3',0,0,'淘宝',NULL,1,NULL,44,0,0,'湖南省长沙市岳麓区银双路169',NULL,2,9,0,NULL,0,0,'2019-08-30 09:26:28',221,2,0,NULL,NULL,1,'2018-11-03 11:44:49',3425723,4),(19,NULL,NULL,'荤油','../static/images/荤油.jpg',NULL,'0','3',0,0,'百度',NULL,1,NULL,0,4,1,'长沙市岳麓区潇湘中路',NULL,2,9,0,NULL,0,0,'2019-08-30 09:26:25',3,3,0,NULL,NULL,1,'2018-11-03 11:38:54',1211313,1),(20,NULL,NULL,'小火锅','../static/images/小火锅.jpg',NULL,'0','3',0,0,'谷歌',NULL,1,NULL,0,0,0,'湖南省长沙市岳麓区麓山南路932号',NULL,1,5,0,NULL,0,0,'2019-08-30 09:26:24',25,0,0,NULL,NULL,1,'2018-11-07 09:17:01',2112146548,5),(21,NULL,NULL,'大火锅','../static/images/大火锅.jpg',NULL,'0','2',0,0,'谷歌',NULL,1,NULL,0,0,1,'湖南省长沙市麓山南路605',NULL,1,5,0,NULL,0,3,'2019-08-30 09:26:22',2,2,0,NULL,NULL,1,'2018-11-06 20:43:01',21325432,5),(22,NULL,NULL,'海鲜火锅','../static/images/海鲜火锅.jpg',NULL,'0','2',0,0,'淘宝',NULL,1,NULL,33,0,0,'湖南省长沙市天心区韶山南路22号',NULL,1,5,0,NULL,0,0,'2019-08-30 09:26:17',21,0,0,NULL,NULL,1,'2018-11-03 11:44:43',12312453,4),(23,NULL,NULL,'三鲜火锅','../static/images/三鲜火锅.jpg',NULL,'0','2',0,0,'百度',NULL,1,NULL,1,0,1,'长沙市岳麓区潇湘中路',NULL,1,5,0,NULL,0,0,'2019-08-30 09:26:13',4,1,0,NULL,NULL,1,'2018-11-08 11:37:44',131242,1),(24,NULL,NULL,'麻辣香锅','../static/images/麻辣香锅.jpg',NULL,'0','2',0,0,'谷歌',NULL,1,NULL,0,5,0,'湖南省长沙市麓山南路605',NULL,1,5,0,NULL,0,0,'2019-08-30 09:26:15',0,0,0,NULL,NULL,1,'2018-11-03 11:44:42',1243131,5),(25,NULL,NULL,'麻婆豆腐','../static/images/麻婆豆腐.jpg',NULL,'0','2',0,0,'谷歌',NULL,1,NULL,0,0,0,'湖南省长沙市岳麓区银双路169',NULL,1,5,0,NULL,0,3,'2019-08-30 09:26:10',3217,0,0,NULL,NULL,1,'2018-11-07 09:17:12',123123,5),(26,NULL,NULL,'炖骨头','../static/images/炖骨头.jpg',NULL,'0','2',0,0,'百度',NULL,1,NULL,0,0,1,'湖南省长沙市岳麓区麓山南路932号',NULL,1,5,0,NULL,0,0,'2019-08-30 09:26:08',0,0,0,NULL,NULL,1,'2018-11-03 11:39:25',123,1),(27,NULL,NULL,'鱼香肉丝','../static/images/鱼香肉丝.jpg',NULL,'0','2',0,0,'淘宝',NULL,1,NULL,0,0,0,'湖南省长沙市天心区韶山南路22号',NULL,1,5,0,NULL,0,0,'2019-08-30 09:26:05',213,0,0,NULL,NULL,1,'2018-11-03 11:44:39',131,4),(28,NULL,NULL,'京酱肉丝','../static/images/京酱肉丝.jpg',NULL,'0','2',0,0,'谷歌',NULL,1,NULL,0,0,0,'长沙市岳麓区潇湘中路',NULL,1,5,0,NULL,0,0,'2019-08-30 09:26:02',0,0,0,NULL,NULL,1,'2018-11-03 11:44:38',2313131,5),(29,NULL,NULL,'枣栗子','../static/images/枣栗子.jpg',NULL,'0','2',0,0,'谷歌',NULL,1,NULL,0,0,1,'湖南省长沙市天心区韶山南路22号',NULL,1,5,0,NULL,0,4,'2019-08-30 09:26:00',1232,0,0,NULL,NULL,1,'2018-11-06 20:43:04',313,5),(30,NULL,NULL,'酸菜鱼','../static/images/酸菜鱼.jpg',NULL,'0','2',0,0,'百度',NULL,1,NULL,1,1,1,'湖南省长沙市麓山南路605',NULL,1,5,0,NULL,0,0,'2019-08-30 09:25:58',0,0,0,NULL,NULL,1,'2018-11-03 11:39:29',132131,1),(31,NULL,NULL,'蛋糕','../static/images/蛋糕.jpg',NULL,'0','1',0,0,'淘宝',NULL,1,NULL,0,0,0,'湖南省长沙市岳麓区麓山南路932号',NULL,1,5,0,NULL,0,0,'2019-08-30 09:25:54',0,31,0,NULL,NULL,1,'2018-11-03 11:44:34',31,4),(32,NULL,NULL,'枣糕','../static/images/枣糕.jpg',NULL,'0','1',0,0,'谷歌',NULL,1,NULL,0,3,0,'长沙市岳麓区潇湘中路',NULL,1,7,0,NULL,0,1,'2019-08-30 09:25:52',1,21,0,NULL,NULL,1,'2018-11-07 20:04:03',31,5),(33,NULL,NULL,'蛋挞','../static/images/蛋挞.jpg',NULL,'0','1',0,0,'百度',NULL,1,NULL,0,0,1,'湖南省长沙市天心区韶山南路22号',NULL,1,5,0,NULL,0,0,'2019-08-30 09:25:49',12,0,0,NULL,NULL,1,'2018-11-03 11:39:38',3,1),(34,NULL,NULL,'蛋卷','../static/images/蛋卷.jpg',NULL,'0','1',0,0,'谷歌',NULL,1,NULL,1,0,0,'湖南省长沙市岳麓区银双路169',NULL,1,5,0,NULL,0,0,'2019-08-30 09:25:47',0,2,0,NULL,NULL,1,'2018-11-03 11:44:29',NULL,5),(35,NULL,NULL,'咖啡','../static/images/咖啡.jpg',NULL,'0','1',0,0,'谷歌',NULL,1,NULL,0,0,1,'湖南省长沙市岳麓区麓山南路932号',NULL,1,5,0,NULL,0,2,'2019-08-30 09:25:44',0,0,0,NULL,NULL,1,'2018-11-06 20:43:06',31,5),(36,NULL,NULL,'三明治','../static/images/三明治.jpg',NULL,'0','1',0,0,'淘宝',NULL,1,NULL,0,4,0,'湖南省长沙市天心区韶山南路22号',NULL,1,5,0,NULL,0,0,'2019-08-30 09:25:42',0,5,0,NULL,NULL,1,'2018-11-03 11:44:26',31231,4),(37,NULL,NULL,'1个烧饼','../static/images/1个烧饼.jpg',NULL,'0','1',0,0,'谷歌',NULL,1,NULL,1,0,0,'湖南省长沙市岳麓区麓山南路932号',NULL,1,5,0,NULL,0,0,'2019-08-30 09:25:41',3,0,0,NULL,NULL,1,'2018-11-03 11:44:25',3123,5),(114,NULL,NULL,'台灯',NULL,NULL,'0','232',0,0,'百度',NULL,1,NULL,0,0,0,NULL,NULL,6,27,0,NULL,0,2,'2018-11-07 22:30:11',2,0,0,NULL,NULL,1,'2018-11-07 22:30:11',NULL,1),(115,NULL,NULL,'发电机',NULL,NULL,'0','12123',0,0,'淘宝',NULL,1,NULL,0,0,0,NULL,NULL,6,28,0,NULL,0,0,'2018-11-03 12:03:20',0,0,0,NULL,NULL,1,'2018-11-03 12:03:20',NULL,4),(112,NULL,NULL,'吹风机',NULL,NULL,'0','23231',0,0,'谷歌',NULL,1,NULL,0,0,0,NULL,NULL,6,26,0,NULL,0,0,'2018-11-03 12:03:21',0,0,0,NULL,NULL,1,'2018-11-03 12:03:21',NULL,5),(113,NULL,NULL,'电暖风',NULL,NULL,'0','123',0,0,'京东',NULL,1,NULL,0,0,0,NULL,NULL,6,26,0,NULL,0,2,'2018-11-06 20:43:08',2,0,0,NULL,NULL,1,'2018-11-06 20:43:08',NULL,2),(110,NULL,NULL,'手机',NULL,NULL,'0','234',0,0,'淘宝',NULL,1,NULL,0,0,0,NULL,NULL,5,25,0,NULL,0,123,'2018-11-06 20:44:30',1231,0,0,NULL,NULL,1,'2018-11-06 20:44:30',NULL,4),(111,NULL,NULL,'电脑',NULL,NULL,'0','45',0,0,'淘宝',NULL,1,NULL,0,0,0,NULL,NULL,5,25,0,NULL,0,0,'2018-11-03 12:03:24',0,0,0,NULL,NULL,1,'2018-11-03 12:03:24',NULL,4),(108,NULL,NULL,'榨汁机',NULL,NULL,'0','54',0,0,'百度',NULL,1,NULL,0,0,0,NULL,NULL,6,22,0,NULL,0,2,'2018-11-06 20:44:30',0,0,0,NULL,NULL,1,'2018-11-06 20:44:30',NULL,1),(109,NULL,NULL,'拐杖',NULL,NULL,'0','65',0,0,'谷歌',NULL,1,NULL,0,0,0,NULL,NULL,5,24,0,NULL,0,3,'2018-11-06 20:44:32',0,0,0,NULL,NULL,1,'2018-11-06 20:44:32',NULL,5),(106,NULL,NULL,'魔方',NULL,NULL,'0','67',0,0,'百度',NULL,1,NULL,0,0,0,NULL,NULL,5,21,0,NULL,0,0,'2018-11-03 12:03:27',0,0,0,NULL,NULL,1,'2018-11-03 12:03:27',NULL,1),(107,NULL,NULL,'油烟机',NULL,NULL,'0','34',0,0,'美团',NULL,1,NULL,0,0,0,NULL,NULL,6,22,0,NULL,0,0,'2018-11-03 12:03:28',3123,0,0,NULL,NULL,1,'2018-11-03 12:03:28',NULL,3),(104,NULL,NULL,'四驱车',NULL,NULL,'0','24',0,0,'谷歌',NULL,1,NULL,0,0,0,NULL,NULL,5,20,0,NULL,0,4,'2018-11-06 20:44:32',0,0,0,NULL,NULL,1,'2018-11-06 20:44:32',NULL,5),(105,NULL,NULL,'魔尺',NULL,NULL,'0','1',0,0,'百度',NULL,1,NULL,0,0,0,NULL,NULL,5,21,0,NULL,0,0,'2018-11-03 12:03:31',0,0,0,NULL,NULL,1,'2018-11-03 12:03:31',NULL,1),(102,NULL,NULL,'气球',NULL,NULL,'0','3',0,0,'美团',NULL,1,NULL,0,0,0,NULL,NULL,5,18,0,NULL,0,0,'2018-11-03 12:03:32',1312,0,0,NULL,NULL,1,'2018-11-03 12:03:32',NULL,3),(103,NULL,NULL,'玩具车',NULL,NULL,'0','34',0,0,'淘宝',NULL,1,NULL,0,0,0,NULL,NULL,5,20,0,NULL,0,123,'2018-11-06 20:44:33',2,0,0,NULL,NULL,1,'2018-11-06 20:44:33',NULL,4),(100,NULL,NULL,'粉底',NULL,NULL,'0','43',0,0,'百度',NULL,1,NULL,0,0,0,NULL,NULL,4,16,0,NULL,0,0,'2018-11-03 12:03:34',0,0,0,NULL,NULL,1,'2018-11-03 12:03:34',NULL,1),(101,NULL,NULL,'风铃',NULL,NULL,'0','53',0,0,'京东',NULL,1,NULL,0,0,0,NULL,NULL,5,18,0,NULL,0,0,'2018-11-03 12:03:35',0,0,0,NULL,NULL,1,'2018-11-03 12:03:35',NULL,2),(46,NULL,NULL,'男士挎包','../static/images/男士挎包.jpg',NULL,'0','2',0,0,'美团',NULL,1,NULL,0,0,1,'湖南省长沙市天心区韶山南路22号',NULL,4,17,0,NULL,0,31,'2019-08-30 09:25:39',12,0,0,NULL,NULL,1,'2018-11-06 20:44:33',13,3),(47,NULL,NULL,'女士挎包','../static/images/女士挎包.jpg',NULL,'0','2',0,0,'淘宝',NULL,1,NULL,1,0,0,'长沙市岳麓区潇湘中路',NULL,4,17,0,NULL,0,0,'2019-08-30 09:25:32',2,0,0,NULL,NULL,1,'2018-11-07 11:02:38',1232534,4),(48,NULL,NULL,'斜肩包','../static/images/斜肩包.jpg',NULL,'0','2',0,0,'百度',NULL,1,NULL,0,0,1,'湖南省长沙市麓山南路605',NULL,4,17,0,NULL,0,0,'2019-08-30 09:25:28',1,0,0,NULL,NULL,1,'2018-11-03 11:41:29',131231,1),(49,NULL,NULL,'登山包','../static/images/登山包.jpg',NULL,'0','2',0,0,'美团',NULL,1,NULL,1,0,0,'湖南省长沙市天心区韶山南路22号',NULL,4,17,0,NULL,0,13,'2019-08-30 09:25:26',1,0,0,NULL,NULL,1,'2018-11-07 20:59:14',121231,3),(50,NULL,NULL,'双肩包','../static/images/双肩包.jpg',NULL,'0','2',0,0,'美团',NULL,1,NULL,0,0,0,'湖南省长沙市岳麓区麓山南路932号',NULL,4,17,0,NULL,0,0,'2019-08-30 09:25:24',0,0,0,NULL,NULL,1,'2018-11-03 11:45:21',43453,3),(51,NULL,NULL,'雨伞','../static/images/雨伞.jpg',NULL,'0','2',0,0,'百度',NULL,1,NULL,0,0,1,'长沙市岳麓区潇湘中路',NULL,4,17,0,NULL,0,0,'2019-08-30 09:25:20',3,0,0,NULL,NULL,1,'2018-11-03 11:41:32',4223612,1),(52,NULL,NULL,'遮阳伞','../static/images/遮阳伞.jpg',NULL,'0','2',0,0,'淘宝',NULL,1,NULL,1,0,0,'湖南省长沙市麓山南路605',NULL,4,17,0,NULL,0,0,'2019-08-30 09:25:16',12,0,0,NULL,NULL,1,'2018-11-03 11:44:00',7874,4),(53,NULL,NULL,'学前读物','../static/images/学前读物.jpg',NULL,'0','2',0,0,'美团',NULL,1,NULL,0,0,0,'湖南省长沙市岳麓区银双路169',NULL,5,18,0,NULL,0,1,'2019-08-30 09:25:11',12,0,0,NULL,NULL,1,'2018-11-06 20:44:36',2331566,3),(54,NULL,NULL,'美式咖啡','../static/images/美式咖啡.jpg',NULL,'0','2',0,0,'美团',NULL,1,NULL,1,0,1,'湖南省长沙市天心区韶山南路22号',NULL,1,3,0,NULL,0,0,'2019-08-30 09:25:04',0,0,0,NULL,NULL,1,'2018-11-03 11:45:16',345342,3),(55,NULL,NULL,'巴西咖啡','../static/images/巴西咖啡.jpg',NULL,'0','2',0,0,'淘宝',NULL,1,NULL,1,0,1,'湖南省长沙市天心区韶山南路22号',NULL,1,3,0,NULL,0,0,'2019-08-30 09:25:02',213,0,0,NULL,NULL,1,'2018-11-03 11:43:56',7878974,4),(56,NULL,NULL,'非洲咖啡','../static/images/非洲咖啡.jpg',NULL,'0','2',0,0,'百度',NULL,1,NULL,0,0,0,'湖南省长沙市岳麓区麓山南路932号',NULL,1,3,0,NULL,0,0,'2019-08-30 09:24:55',0,0,0,NULL,NULL,1,'2018-11-03 11:41:35',131312343,1),(57,NULL,NULL,'日本咖啡','../static/images/日本咖啡.jpg',NULL,'0','2',0,0,'美团',NULL,1,NULL,0,0,0,'长沙市岳麓区潇湘中路',NULL,1,3,0,NULL,0,0,'2019-08-30 09:24:52',314,0,0,NULL,NULL,1,'2018-11-07 09:17:27',13131,3),(58,NULL,NULL,'变速车','../static/images/变速车.jpg',NULL,'0','1',0,0,'淘宝',NULL,1,NULL,1,0,0,'湖南省长沙市岳麓区银双路169',NULL,1,21,0,NULL,0,1,'2019-08-30 09:24:50',322,0,0,NULL,NULL,1,'2018-11-07 09:53:18',113211,4),(98,NULL,NULL,'炒勺',NULL,NULL,'0','5',0,0,'淘宝',NULL,1,NULL,0,0,0,NULL,NULL,3,14,0,NULL,0,13,'2018-11-06 20:44:36',0,0,0,NULL,NULL,1,'2018-11-06 20:44:36',NULL,4),(99,NULL,NULL,'洗面奶',NULL,NULL,'0','3',0,0,'谷歌',NULL,1,NULL,0,0,0,NULL,NULL,4,15,0,NULL,0,0,'2018-11-03 12:03:38',0,0,0,NULL,NULL,1,'2018-11-03 12:03:38',NULL,5),(96,NULL,NULL,'菜刀',NULL,NULL,'0','4',0,0,'淘宝',NULL,1,NULL,0,0,0,NULL,NULL,3,14,0,NULL,0,0,'2018-11-03 12:03:40',0,0,0,NULL,NULL,1,'2018-11-03 12:03:40',NULL,4),(97,NULL,NULL,'菜板',NULL,NULL,'0','56',0,0,'京东',NULL,1,NULL,0,0,0,NULL,NULL,3,14,0,NULL,0,0,'2018-11-06 22:20:48',12317,0,0,NULL,NULL,1,'2018-11-06 22:20:48',NULL,2),(94,NULL,NULL,'浴巾',NULL,NULL,'0','5',0,0,'美团',NULL,1,NULL,0,0,0,NULL,NULL,3,13,0,NULL,0,0,'2018-11-03 12:03:42',0,0,0,NULL,NULL,1,'2018-11-03 12:03:42',NULL,3),(95,NULL,NULL,'浴盐',NULL,NULL,'0','3',0,0,'百度',NULL,1,NULL,0,0,0,NULL,NULL,3,13,0,NULL,0,13123,'2018-11-07 20:59:03',1131313,0,0,NULL,NULL,1,'2018-11-07 20:59:03',NULL,1),(92,NULL,NULL,'卸妆水',NULL,NULL,'0','3',0,0,'淘宝',NULL,1,NULL,0,0,0,NULL,NULL,4,12,0,NULL,0,0,'2018-11-03 12:03:43',31,0,0,NULL,NULL,1,'2018-11-03 12:03:43',NULL,4),(93,NULL,NULL,'洗发水',NULL,NULL,'0','45',0,0,'京东',NULL,1,NULL,0,0,0,NULL,NULL,3,13,0,NULL,0,0,'2018-11-03 12:03:46',0,0,0,NULL,NULL,1,'2018-11-03 12:03:46',NULL,2),(90,NULL,NULL,'马桶刷',NULL,NULL,'0','54',0,0,'京东',NULL,1,NULL,0,0,0,NULL,NULL,3,11,0,NULL,0,0,'2018-11-03 12:03:45',23,0,0,NULL,NULL,1,'2018-11-03 12:03:45',NULL,2),(91,NULL,NULL,'马桶垫',NULL,NULL,'0','1',0,0,'百度',NULL,1,NULL,0,0,0,NULL,NULL,3,11,0,NULL,0,0,'2018-11-06 20:46:29',222341,0,0,NULL,NULL,1,'2018-11-06 20:46:29',NULL,1),(64,NULL,NULL,'手电筒','../static/images/手电筒.jpg',NULL,'0','1',0,0,'百度',NULL,1,NULL,0,0,0,'湖南省长沙市岳麓区麓山南路932号',NULL,6,27,0,NULL,0,0,'2019-08-30 09:24:45',0,0,0,NULL,NULL,1,'2018-11-03 11:41:39',3453453,1),(65,NULL,NULL,'魔巾','../static/images/魔巾.jpg',NULL,'0','1',0,0,'淘宝',NULL,1,NULL,1,0,0,'湖南省长沙市天心区韶山南路22号',NULL,5,18,0,NULL,0,0,'2019-08-30 09:24:37',0,0,0,NULL,NULL,1,'2018-11-03 11:43:27',45345332,4),(66,NULL,NULL,'后视镜','../static/images/后视镜.jpg',NULL,'0','1',0,0,'美团',NULL,1,NULL,1,0,1,'长沙市岳麓区潇湘中路',NULL,5,21,0,NULL,0,0,'2019-08-30 09:24:33',0,0,0,NULL,NULL,1,'2018-11-03 11:45:10',231656,3),(67,NULL,NULL,'护膝','../static/images/护膝.jpg',NULL,'0','1',0,0,'百度',NULL,1,NULL,0,0,1,'湖南省长沙市岳麓区银双路169',NULL,5,21,0,NULL,0,0,'2019-08-30 09:24:31',0,0,0,NULL,NULL,1,'2018-11-03 11:42:46',458362,1),(68,NULL,NULL,'电子表','../static/images/1233211.jpg',NULL,'0','1',0,0,'百度',NULL,1,NULL,0,0,0,'湖南省长沙市岳麓区麓山南路932号',NULL,5,21,0,NULL,0,0,'2019-08-30 09:24:28',0,0,0,NULL,NULL,1,'2018-11-03 11:42:49',56576,1),(69,NULL,NULL,'奔驰','../static/images/奔驰.jpg',NULL,'0','1',0,0,'美团',NULL,1,NULL,0,0,0,'长沙市岳麓区潇湘中路',NULL,6,24,0,NULL,0,0,'2019-08-30 09:24:26',1312,0,0,NULL,NULL,1,'2018-11-03 11:45:06',6786786,3),(70,NULL,NULL,'宝马','../static/images/宝马.jpg',NULL,'0','3',0,0,'淘宝',NULL,1,NULL,1,0,0,'湖南省长沙市岳麓区银双路169',NULL,5,24,0,NULL,0,0,'2019-08-30 09:24:24',125,0,0,NULL,NULL,1,'2018-11-07 09:44:40',645342,4),(71,NULL,NULL,'大众','../static/images/大众.jpg',NULL,'0','21',0,0,'美团',NULL,1,NULL,0,0,0,'湖南省长沙市岳麓区银双路169',NULL,5,24,0,NULL,0,0,'2019-08-30 09:24:22',0,0,0,NULL,NULL,1,'2018-11-03 11:45:04',32423,3),(89,NULL,NULL,'洁厕灵',NULL,NULL,'0','2',0,0,'谷歌',NULL,1,NULL,0,0,0,NULL,NULL,3,11,0,NULL,0,0,'2018-11-03 12:03:48',23,0,0,NULL,NULL,1,'2018-11-03 12:03:48',NULL,5),(116,NULL,NULL,NULL,NULL,NULL,'0','43',0,0,NULL,NULL,1,NULL,0,0,0,NULL,NULL,NULL,NULL,0,NULL,0,0,NULL,0,0,0,NULL,NULL,1,NULL,NULL,NULL);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`) values (1,'gbh','1234');

/* Trigger structure for table `shop_goods` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `shop_goods` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `shop_goods` BEFORE UPDATE ON `shop_goods` FOR EACH ROW SET NEW.`saleTime` = NOW() */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
