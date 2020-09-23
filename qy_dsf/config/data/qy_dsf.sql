/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.30 : Database - qy_dsf
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`qy_dsf` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `qy_dsf`;

/*Table structure for table `menu` */

CREATE TABLE `menu` (
  `id` varchar(32) NOT NULL COMMENT 'menuId',
  `name` varchar(50) NOT NULL COMMENT 'menuName',
  `type` int(1) NOT NULL COMMENT '类型：1菜单 2按钮',
  `parentId` varchar(32) DEFAULT NULL COMMENT '父级menuId',
  `status` int(1) DEFAULT '1' COMMENT '状态：1正常 2禁止',
  `orderNum` int(11) DEFAULT '1' COMMENT '序号',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `ext1` int(11) DEFAULT NULL COMMENT '拓展字段',
  `ext2` varchar(50) DEFAULT NULL COMMENT '拓展字段',
  PRIMARY KEY (`id`),
  KEY `m_parentId_from_menu` (`parentId`),
  CONSTRAINT `m_parentId_from_menu` FOREIGN KEY (`parentId`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `menu` */

insert  into `menu`(`id`,`name`,`type`,`parentId`,`status`,`orderNum`,`desc`,`ext1`,`ext2`) values ('menu001','系统管理',1,NULL,1,1,NULL,NULL,NULL);
insert  into `menu`(`id`,`name`,`type`,`parentId`,`status`,`orderNum`,`desc`,`ext1`,`ext2`) values ('menu001-001','账号管理',1,'menu001',1,1,NULL,NULL,NULL);
insert  into `menu`(`id`,`name`,`type`,`parentId`,`status`,`orderNum`,`desc`,`ext1`,`ext2`) values ('menu001-001-btn001','添加用户',2,'menu001-001',1,1,NULL,NULL,NULL);
insert  into `menu`(`id`,`name`,`type`,`parentId`,`status`,`orderNum`,`desc`,`ext1`,`ext2`) values ('menu001-001-btn002','修改用户',2,'menu001-001',1,2,NULL,NULL,NULL);
insert  into `menu`(`id`,`name`,`type`,`parentId`,`status`,`orderNum`,`desc`,`ext1`,`ext2`) values ('menu001-001-btn003','删除用户',2,'menu001-001',1,3,NULL,NULL,NULL);
insert  into `menu`(`id`,`name`,`type`,`parentId`,`status`,`orderNum`,`desc`,`ext1`,`ext2`) values ('menu001-001-btn004','重置密码',2,'menu001-001',1,4,NULL,NULL,NULL);
insert  into `menu`(`id`,`name`,`type`,`parentId`,`status`,`orderNum`,`desc`,`ext1`,`ext2`) values ('menu001-002','角色管理',1,'menu001',1,2,NULL,NULL,NULL);
insert  into `menu`(`id`,`name`,`type`,`parentId`,`status`,`orderNum`,`desc`,`ext1`,`ext2`) values ('menu001-002-btn001','添加角色',2,'menu001-002',1,1,NULL,NULL,NULL);
insert  into `menu`(`id`,`name`,`type`,`parentId`,`status`,`orderNum`,`desc`,`ext1`,`ext2`) values ('menu001-002-btn002','修改角色',2,'menu001-002',1,2,NULL,NULL,NULL);
insert  into `menu`(`id`,`name`,`type`,`parentId`,`status`,`orderNum`,`desc`,`ext1`,`ext2`) values ('menu001-002-btn003','删除角色',2,'menu001-002',1,3,NULL,NULL,NULL);
insert  into `menu`(`id`,`name`,`type`,`parentId`,`status`,`orderNum`,`desc`,`ext1`,`ext2`) values ('menu001-003','组织管理',1,'menu001',1,3,NULL,NULL,NULL);
insert  into `menu`(`id`,`name`,`type`,`parentId`,`status`,`orderNum`,`desc`,`ext1`,`ext2`) values ('menu001-003-btn001','添加组织',2,'menu001-003',1,1,NULL,NULL,NULL);
insert  into `menu`(`id`,`name`,`type`,`parentId`,`status`,`orderNum`,`desc`,`ext1`,`ext2`) values ('menu001-003-btn002','修改组织',2,'menu001-003',1,2,NULL,NULL,NULL);
insert  into `menu`(`id`,`name`,`type`,`parentId`,`status`,`orderNum`,`desc`,`ext1`,`ext2`) values ('menu001-003-btn003','删除组织',2,'menu001-003',1,3,NULL,NULL,NULL);
insert  into `menu`(`id`,`name`,`type`,`parentId`,`status`,`orderNum`,`desc`,`ext1`,`ext2`) values ('menu002','个人中心',1,NULL,1,2,NULL,NULL,NULL);
insert  into `menu`(`id`,`name`,`type`,`parentId`,`status`,`orderNum`,`desc`,`ext1`,`ext2`) values ('menu002-btn001','修改个人信息',2,'menu002',1,1,NULL,NULL,NULL);
insert  into `menu`(`id`,`name`,`type`,`parentId`,`status`,`orderNum`,`desc`,`ext1`,`ext2`) values ('menu002-btn002','修改密码',2,'menu002',1,2,NULL,NULL,NULL);

/*Table structure for table `menu_permission` */

CREATE TABLE `menu_permission` (
  `menuId` varchar(32) NOT NULL,
  `permissionId` int(11) NOT NULL,
  PRIMARY KEY (`menuId`,`permissionId`),
  KEY `mp_permissionId_from_permission` (`permissionId`),
  CONSTRAINT `mp_menuId_from_menu` FOREIGN KEY (`menuId`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mp_permissionId_from_permission` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `menu_permission` */

insert  into `menu_permission`(`menuId`,`permissionId`) values ('menu001-001-btn001',1);
insert  into `menu_permission`(`menuId`,`permissionId`) values ('menu001-001-btn003',2);
insert  into `menu_permission`(`menuId`,`permissionId`) values ('menu001-001-btn002',3);
insert  into `menu_permission`(`menuId`,`permissionId`) values ('menu002-btn001',4);
insert  into `menu_permission`(`menuId`,`permissionId`) values ('menu002-btn002',5);
insert  into `menu_permission`(`menuId`,`permissionId`) values ('menu001-001-btn004',6);
insert  into `menu_permission`(`menuId`,`permissionId`) values ('menu001-001',7);
insert  into `menu_permission`(`menuId`,`permissionId`) values ('menu001-001',8);
insert  into `menu_permission`(`menuId`,`permissionId`) values ('menu002',9);
insert  into `menu_permission`(`menuId`,`permissionId`) values ('menu001-002-btn001',10);
insert  into `menu_permission`(`menuId`,`permissionId`) values ('menu001-002-btn003',11);
insert  into `menu_permission`(`menuId`,`permissionId`) values ('menu001-002-btn002',12);
insert  into `menu_permission`(`menuId`,`permissionId`) values ('menu001-003-btn002',12);
insert  into `menu_permission`(`menuId`,`permissionId`) values ('menu001-001-btn001',13);
insert  into `menu_permission`(`menuId`,`permissionId`) values ('menu001-001-btn002',13);
insert  into `menu_permission`(`menuId`,`permissionId`) values ('menu001-002',13);
insert  into `menu_permission`(`menuId`,`permissionId`) values ('menu001-002',14);
insert  into `menu_permission`(`menuId`,`permissionId`) values ('menu001-002-btn001',15);
insert  into `menu_permission`(`menuId`,`permissionId`) values ('menu001-002-btn002',15);
insert  into `menu_permission`(`menuId`,`permissionId`) values ('menu001-003-btn001',16);
insert  into `menu_permission`(`menuId`,`permissionId`) values ('menu001-003-btn003',17);
insert  into `menu_permission`(`menuId`,`permissionId`) values ('menu001-003-btn002',18);
insert  into `menu_permission`(`menuId`,`permissionId`) values ('menu001-001-btn001',19);
insert  into `menu_permission`(`menuId`,`permissionId`) values ('menu001-001-btn002',19);
insert  into `menu_permission`(`menuId`,`permissionId`) values ('menu001-003',19);

/*Table structure for table `organization` */

CREATE TABLE `organization` (
  `id` varchar(32) NOT NULL COMMENT 'orgId',
  `name` varchar(50) NOT NULL COMMENT 'orgName',
  `type` int(1) NOT NULL COMMENT '类型：1本公司、子公司或其部门 2加盟商',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `parentId` varchar(32) DEFAULT NULL COMMENT '父级orgId',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `ext1` int(11) DEFAULT NULL COMMENT '拓展字段',
  `ext2` varchar(50) DEFAULT NULL COMMENT '拓展字段',
  PRIMARY KEY (`id`),
  KEY `org_parentId_from_org` (`parentId`),
  CONSTRAINT `org_parentId_from_org` FOREIGN KEY (`parentId`) REFERENCES `organization` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `organization` */

insert  into `organization`(`id`,`name`,`type`,`desc`,`parentId`,`createTime`,`ext1`,`ext2`) values ('org001','aaa有限公司',1,'总公司',NULL,'2020-09-01 00:00:00',NULL,NULL);
insert  into `organization`(`id`,`name`,`type`,`desc`,`parentId`,`createTime`,`ext1`,`ext2`) values ('org002','人事部',1,'总公司人事部','org001','2020-09-01 00:00:00',NULL,NULL);
insert  into `organization`(`id`,`name`,`type`,`desc`,`parentId`,`createTime`,`ext1`,`ext2`) values ('org003','bbb有限公司',1,'总公司的子公司','org001','2020-09-01 00:00:00',NULL,NULL);
insert  into `organization`(`id`,`name`,`type`,`desc`,`parentId`,`createTime`,`ext1`,`ext2`) values ('org004','ccc有限公司',2,'加盟商',NULL,'2020-09-01 00:00:00',NULL,NULL);

/*Table structure for table `permission` */

CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'permissionId',
  `url` varchar(255) NOT NULL COMMENT 'actionKey',
  `status` int(1) DEFAULT '1' COMMENT '状态：1正常 2禁止',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `permission` */

insert  into `permission`(`id`,`url`,`status`) values (1,'/user/addUser',1);
insert  into `permission`(`id`,`url`,`status`) values (2,'/user/deleteUser',1);
insert  into `permission`(`id`,`url`,`status`) values (3,'/user/updateUser',1);
insert  into `permission`(`id`,`url`,`status`) values (4,'/user/updateMe',1);
insert  into `permission`(`id`,`url`,`status`) values (5,'/user/updatePw',1);
insert  into `permission`(`id`,`url`,`status`) values (6,'/user/resetPw',1);
insert  into `permission`(`id`,`url`,`status`) values (7,'/user/getAll',1);
insert  into `permission`(`id`,`url`,`status`) values (8,'/user/getOne',1);
insert  into `permission`(`id`,`url`,`status`) values (9,'/user/getMe',1);
insert  into `permission`(`id`,`url`,`status`) values (10,'/role/addRole',1);
insert  into `permission`(`id`,`url`,`status`) values (11,'/role/deleteRole',1);
insert  into `permission`(`id`,`url`,`status`) values (12,'/role/updateRole',1);
insert  into `permission`(`id`,`url`,`status`) values (13,'/role/getAll',1);
insert  into `permission`(`id`,`url`,`status`) values (14,'/role/getOne',1);
insert  into `permission`(`id`,`url`,`status`) values (15,'/pm',1);
insert  into `permission`(`id`,`url`,`status`) values (16,'/org/addOrg',1);
insert  into `permission`(`id`,`url`,`status`) values (17,'/org/deleteOrg',1);
insert  into `permission`(`id`,`url`,`status`) values (18,'/org/updateOrg',1);
insert  into `permission`(`id`,`url`,`status`) values (19,'/org/getAll',1);

/*Table structure for table `role` */

CREATE TABLE `role` (
  `id` varchar(32) NOT NULL COMMENT 'roleId',
  `name` varchar(50) NOT NULL COMMENT 'roleName',
  `status` int(1) DEFAULT '1' COMMENT '角色状态：1正常 2禁止',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  `ext1` int(11) DEFAULT NULL COMMENT '拓展字段',
  `ext2` varchar(50) DEFAULT NULL COMMENT '拓展字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`id`,`name`,`status`,`desc`,`createTime`,`updateTime`,`ext1`,`ext2`) values ('role001','系统管理员',1,'拥有所有权限','2020-09-01 00:00:00',NULL,NULL,NULL);
insert  into `role`(`id`,`name`,`status`,`desc`,`createTime`,`updateTime`,`ext1`,`ext2`) values ('role002','加盟商',1,'加盟商角色','2020-09-01 00:00:00',NULL,NULL,NULL);

/*Table structure for table `role_menu` */

CREATE TABLE `role_menu` (
  `roleId` varchar(32) NOT NULL,
  `menuId` varchar(32) NOT NULL,
  PRIMARY KEY (`roleId`,`menuId`),
  KEY `rm_menuId_from_menu` (`menuId`),
  CONSTRAINT `rm_menuId_from_menu` FOREIGN KEY (`menuId`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rm_roleId_from_role` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role_menu` */

insert  into `role_menu`(`roleId`,`menuId`) values ('role001','menu001');
insert  into `role_menu`(`roleId`,`menuId`) values ('role001','menu001-001');
insert  into `role_menu`(`roleId`,`menuId`) values ('role001','menu001-001-btn001');
insert  into `role_menu`(`roleId`,`menuId`) values ('role001','menu001-001-btn002');
insert  into `role_menu`(`roleId`,`menuId`) values ('role001','menu001-001-btn003');
insert  into `role_menu`(`roleId`,`menuId`) values ('role001','menu001-001-btn004');
insert  into `role_menu`(`roleId`,`menuId`) values ('role001','menu001-002');
insert  into `role_menu`(`roleId`,`menuId`) values ('role001','menu001-002-btn001');
insert  into `role_menu`(`roleId`,`menuId`) values ('role001','menu001-002-btn002');
insert  into `role_menu`(`roleId`,`menuId`) values ('role001','menu001-002-btn003');
insert  into `role_menu`(`roleId`,`menuId`) values ('role001','menu001-003');
insert  into `role_menu`(`roleId`,`menuId`) values ('role001','menu001-003-btn001');
insert  into `role_menu`(`roleId`,`menuId`) values ('role001','menu001-003-btn002');
insert  into `role_menu`(`roleId`,`menuId`) values ('role001','menu001-003-btn003');
insert  into `role_menu`(`roleId`,`menuId`) values ('role001','menu002');
insert  into `role_menu`(`roleId`,`menuId`) values ('role002','menu002');
insert  into `role_menu`(`roleId`,`menuId`) values ('role001','menu002-btn001');
insert  into `role_menu`(`roleId`,`menuId`) values ('role002','menu002-btn001');
insert  into `role_menu`(`roleId`,`menuId`) values ('role001','menu002-btn002');
insert  into `role_menu`(`roleId`,`menuId`) values ('role002','menu002-btn002');

/*Table structure for table `user` */

CREATE TABLE `user` (
  `id` varchar(32) NOT NULL COMMENT 'userId',
  `userName` varchar(50) NOT NULL COMMENT 'loginName',
  `password` varchar(255) NOT NULL COMMENT '加密密码',
  `name` varchar(50) NOT NULL COMMENT 'userName',
  `salt` varchar(50) NOT NULL COMMENT '加密盐',
  `status` int(1) DEFAULT '1' COMMENT '用户状态：1正常 2禁止',
  `orgId` varchar(32) DEFAULT NULL COMMENT '所属组织id',
  `lastLoginTime` datetime DEFAULT NULL COMMENT '最后登录时间',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `sex` int(1) DEFAULT NULL COMMENT '性别：1男 2女',
  `phoneNumber` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `ext1` int(11) DEFAULT NULL COMMENT '拓展字段',
  `ext2` varchar(50) DEFAULT NULL COMMENT '拓展字段',
  PRIMARY KEY (`id`),
  KEY `u_orgId_from_org` (`orgId`),
  CONSTRAINT `u_orgId_from_org` FOREIGN KEY (`orgId`) REFERENCES `organization` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`userName`,`password`,`name`,`salt`,`status`,`orgId`,`lastLoginTime`,`createTime`,`updateTime`,`desc`,`sex`,`phoneNumber`,`ext1`,`ext2`) values ('user001','admin','d4e23e0357abae135b313ca270f07d7fa0fbb1c392db35a0e225ce95140121f5','HarveyQi','5SoRMAIdoYsAz3iS-EIknuEtPHYS8Ozg',1,'org001','2020-09-23 15:51:41','2020-09-01 00:00:00','2020-09-23 15:51:45','系统管理员',1,'13123456789',NULL,NULL);
insert  into `user`(`id`,`userName`,`password`,`name`,`salt`,`status`,`orgId`,`lastLoginTime`,`createTime`,`updateTime`,`desc`,`sex`,`phoneNumber`,`ext1`,`ext2`) values ('user002','mrzhang','f01faee45c6cc281d29fe8f019bed3a4d04313c953656aa4c5444d671497db14','张先生','7tZ-L39sf_6vG6ZJehiP9qNG4p-Q4R20',1,'org004',NULL,'2020-09-01 00:00:00',NULL,'加盟商ccc公司账号',1,'13789456123',NULL,NULL);

/*Table structure for table `user_role` */

CREATE TABLE `user_role` (
  `userId` varchar(32) NOT NULL,
  `roleId` varchar(32) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`),
  KEY `ur_roleId_from_role` (`roleId`),
  CONSTRAINT `ur_roleId_from_role` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ur_userId_from_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_role` */

insert  into `user_role`(`userId`,`roleId`) values ('user001','role001');
insert  into `user_role`(`userId`,`roleId`) values ('user001','role002');
insert  into `user_role`(`userId`,`roleId`) values ('user002','role002');

/*Table structure for table `v_user` */

DROP TABLE IF EXISTS `v_user`;

/*!50001 CREATE TABLE  `v_user`(
 `id` varchar(32) ,
 `userName` varchar(50) ,
 `password` varchar(255) ,
 `name` varchar(50) ,
 `salt` varchar(50) ,
 `status` int(1) ,
 `orgId` varchar(32) ,
 `lastLoginTime` datetime ,
 `createTime` datetime ,
 `updateTime` datetime ,
 `desc` varchar(255) ,
 `sex` int(1) ,
 `phoneNumber` varchar(20) ,
 `role` text ,
 `orgName` varchar(50) 
)*/;

/*Table structure for table `v_user_url` */

DROP TABLE IF EXISTS `v_user_url`;

/*!50001 CREATE TABLE  `v_user_url`(
 `userId` varchar(32) ,
 `url` varchar(255) 
)*/;

/*View structure for view v_user */

/*!50001 DROP TABLE IF EXISTS `v_user` */;
/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`skip-grants user`@`skip-grants host` SQL SECURITY DEFINER VIEW `v_user` AS (select `uurr`.`id` AS `id`,`uurr`.`userName` AS `userName`,`uurr`.`password` AS `password`,`uurr`.`name` AS `name`,`uurr`.`salt` AS `salt`,`uurr`.`status` AS `status`,`uurr`.`orgId` AS `orgId`,`uurr`.`lastLoginTime` AS `lastLoginTime`,`uurr`.`createTime` AS `createTime`,`uurr`.`updateTime` AS `updateTime`,`uurr`.`desc` AS `desc`,`uurr`.`sex` AS `sex`,`uurr`.`phoneNumber` AS `phoneNumber`,`uurr`.`role` AS `role`,`o`.`name` AS `orgName` from (((select `u`.`id` AS `id`,`u`.`userName` AS `userName`,`u`.`password` AS `password`,`u`.`name` AS `name`,`u`.`salt` AS `salt`,`u`.`status` AS `status`,`u`.`orgId` AS `orgId`,`u`.`lastLoginTime` AS `lastLoginTime`,`u`.`createTime` AS `createTime`,`u`.`updateTime` AS `updateTime`,`u`.`desc` AS `desc`,`u`.`sex` AS `sex`,`u`.`phoneNumber` AS `phoneNumber`,group_concat(`r`.`id`,',',`r`.`name` separator ';') AS `role` from (`qy_dsf`.`user` `u` left join (`qy_dsf`.`user_role` `ur` join `qy_dsf`.`role` `r` on((`ur`.`roleId` = `r`.`id`))) on((`ur`.`userId` = `u`.`id`))) group by `u`.`id`)) `uurr` left join `qy_dsf`.`organization` `o` on((`o`.`id` = `uurr`.`orgId`)))) */;

/*View structure for view v_user_url */

/*!50001 DROP TABLE IF EXISTS `v_user_url` */;
/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`skip-grants user`@`skip-grants host` SQL SECURITY DEFINER VIEW `v_user_url` AS (select distinct `a`.`userId` AS `userId`,`p`.`url` AS `url` from ((((select distinct `ur`.`userId` AS `userId`,`mp`.`permissionId` AS `permissionId` from (((`qy_dsf`.`role_menu` `rm` join `qy_dsf`.`user_role` `ur` on((`rm`.`roleId` = `ur`.`roleId`))) join `qy_dsf`.`menu_permission` `mp` on((`rm`.`menuId` = `mp`.`menuId`))) join `qy_dsf`.`role` `r` on((`r`.`id` = `rm`.`roleId`))) where (`r`.`status` = 1))) `a` join `qy_dsf`.`permission` `p` on((`p`.`id` = `a`.`permissionId`))) join `qy_dsf`.`user` `u` on((`a`.`userId` = `u`.`id`))) where ((`p`.`status` = 1) and (`u`.`status` = 1))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
