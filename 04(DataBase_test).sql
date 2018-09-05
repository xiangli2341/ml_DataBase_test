/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.15 : Database - test
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `test`;

/* 分润表 */

/*Table structure for table `ml_phone_bonus` */

DROP TABLE IF EXISTS `ml_phone_bonus`;

CREATE TABLE `ml_phone_bonus` (
  `id` int(4) NOT NULL COMMENT '自增',
  `phone_type` int(2) NOT NULL COMMENT '手机型号',
  `bonus` decimal(4,2) NOT NULL COMMENT '分红比例',
  `bonus2` decimal(4,2) DEFAULT NULL COMMENT '备用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `ml_phone_bonus` */





/*Table structure for table `ml_user` */

DROP TABLE IF EXISTS `ml_user`;

/* 用户表 */
CREATE TABLE `ml_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户id,自增（非空）',
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名(手机号)（非空）',
  `password` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '密码（非空）',
  `phone_type` int(2) NOT NULL COMMENT '手机型号(枚举)（非空）',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '是否可用：1可,0不可（非空）',
  `reg_time` int(11) NOT NULL COMMENT '注册时间(时间戳形式)（非空）',
  `remark` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `ml_user` */

insert  into `ml_user`(`id`,`username`,`password`,`phone_type`,`status`,`reg_time`,`remark`) values (1,'18729830367','123456',1,1,1870038541,'test'),(2,'18729830368','123456',1,1,2147483647,'remark  testsda'),(3,'18729830369','123456',1,1,2147483647,'sad'),(4,'18729830370','123456',1,1,2147483647,'ad'),(5,'18729830371','123456',1,1,2147483647,'asdasfas'),(6,'18729830372','123456',1,1,2147483647,'sdf');




/* 用户登录记录表 */

/*Table structure for table `ml_user_login` */

DROP TABLE IF EXISTS `ml_user_login`;

CREATE TABLE `ml_user_login` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增',
  `user_id` int(10) NOT NULL COMMENT '用户id,对应user表外键',
  `login_ip` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '登录ip',
  `login_time` int(11) NOT NULL COMMENT '登录时间',
  `remark` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `ml_user_login` */





/* 用户安全表 */

/*Table structure for table `ml_user_security` */

DROP TABLE IF EXISTS `ml_user_security`;

/* 使用MyISAM数据库引擎 */
CREATE TABLE `ml_user_security` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id,自增（非空）',
  `user_id` int(10) NOT NULL COMMENT '用户id,对应user表外键',
  `imei` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '手机唯一串码标识（非空）',
  `fingerprint` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '手机唯一指纹码（非空）',
  `faceid` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '人脸识别码',
  `lockscreen` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '锁屏轨迹码',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `ml_user_security` */

insert  into `ml_user_security`(`id`,`user_id`,`imei`,`fingerprint`,`faceid`,`lockscreen`) values (1,1,'2sa1dasd2','test_sad122sd1ad3das','asd1as2das','lockss2ad1asdcreen'),(2,2,'saasdasd231315as','sa2d123as1d','asd1as2das','lockss2ad1asdcreen'),(3,3,'sdfdsafas','sa2d123as1d','asd1as2das','lockss2ad1asdcreen'),(4,4,'sdafc','sa2d123as1d','asd1as2das','lockss2ad1asdcreen'),(5,5,'zxczxv','sa2d123as1d','asd1as2das','lockss2ad1asdcreen'),(6,6,'xvfsfs','sa2d123as1d','asd1as2das','lockss2ad1asdcreen'),(7,7,'sadasd','sa2d123as1d','asd1as2das','lockss2ad1asdcreen'),(8,8,'asda','sa2d123as1d','asd1as2das','lockss2ad1asdcreen'),(9,9,'agfdsfg','sa2d123as1d','asd1as2das','lockss2ad1asdcreen');




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
