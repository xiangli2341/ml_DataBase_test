/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.15 : Database - test
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;


CREATE DATABASE /*!32312 IF NOT EXISTS*/`test` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `test`;



# 用户表
/*Table structure for table `ml_user` */

DROP TABLE IF EXISTS `ml_user`;

CREATE TABLE `ml_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户id,自增（非空）',
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名(手机号)（非空）',
  `password` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '密码（非空）',
  `phone_type` int(2) NOT NULL COMMENT '手机型号(枚举)（非空）',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '是否可用：1可,0不可（非空）',
  `reg_time` int(11) NOT NULL COMMENT '注册时间(时间戳形式)（非空）',
  `remark` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `ml_user` */



# 用户安全表（默认存储引擎设为MyISAM）
/*Table structure for table `ml_user_security` */

DROP TABLE IF EXISTS `ml_user_security`;

CREATE TABLE `ml_user_security` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id,自增（非空）',
  `user_id` int(10) NOT NULL COMMENT '用户id,对应user表外键',
  `imei` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '手机唯一串码标识（非空）',
  `fingerprint` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '手机唯一指纹码（非空）',
  `faceid` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '人脸识别码',
  `lockscreen` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '锁屏轨迹码',
  PRIMARY KEY (`id`),
  KEY `id_fk` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `ml_user_security` */



# 登录记录表
/*Table structure for table `ml_user_login` */

DROP TABLE IF EXISTS `ml_user_login`;

CREATE TABLE `ml_user_login` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增',
  `user_id` int(10) NOT NULL COMMENT '用户id,对应user表外键',
  `login_ip` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '登录ip',
  `login_time` date NOT NULL COMMENT '登录时间',
  `remark` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `ml_user_login` */



# 分润表
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


