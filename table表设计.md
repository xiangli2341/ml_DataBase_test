DROP TABLE IF EXISTS `ml_user`;

# InnoDB存储引擎既支持行级锁（ row-level locking），也支持表级锁，但默认情况下是采用行级锁,适用于并发环境下,要求较高的系统

CREATE TABLE `ml_user` (
  `id` INT(10) NOT NULL AUTO_INCREMENT COMMENT '用户id,自增（非空）',

  `username` VARCHAR(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名(手机号)（非空）',

  `password` VARCHAR(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '密码（非空）',

  `phone_type` INT(2) NOT NULL COMMENT '手机型号(枚举)（非空）',

  `status` INT(2) NOT NULL DEFAULT '1' COMMENT '是否可用：1可,0不可（非空）',

  `reg_time` INT(11) NOT NULL  COMMENT '注册时间(时间戳形式)（非空）',

  `remark` VARCHAR(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '说明',

  PRIMARY KEY (`id`)	#主键id
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


# MyISAM和MEMORY 表级锁用于少量更新的应用,发生锁冲突的概率最高,并发度最低

DROP TABLE IF EXISTS `ml_user_security`;

CREATE TABLE `ml_user_security` (

  `id` INT(10) NOT NULL AUTO_INCREMENT COMMENT 'id,自增（非空）',

  `user_id` INT(10) NOT NULL  COMMENT '用户id,对应user表外键',

  `imei` VARCHAR(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '手机唯一串码标识（非空）',

  `fingerprint` VARCHAR(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '手机唯一指纹码（非空）',

  `faceid` VARCHAR(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '人脸识别码',

  `lockscreen` VARCHAR(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '锁屏轨迹码',

  PRIMARY KEY (`id`)	#主键id

) ENGINE=MYISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;







#外键 ALTER TABLE ml_user_security ADD FOREIGN KEY(user_id) REFERENCES ml_user(id);


SELECT * FROM ml_user_security

DELETE FROM ml_user_security WHERE user_id=1LATE=utf8_unicode_ci;