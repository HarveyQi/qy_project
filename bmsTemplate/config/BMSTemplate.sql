/*
MySQL - 5.7.30
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

/*CREATE DATABASE /*!32312 IF NOT EXISTS*/`bms_template`*/ 

/*!40100 DEFAULT CHARACTER SET utf8 */;

/*USE `bms_template`;*/

/*Table structure for table `organization` */

DROP TABLE IF EXISTS `organization` ;
CREATE TABLE `organization` (
  `organizationId` varchar(32) NOT NULL COMMENT '组织id',
  `organizationName` varchar(50) NOT NULL COMMENT '组织名称',
  `organizationDesc` varchar(255) DEFAULT NULL COMMENT '组织描述',
  `parentId` varchar(32) DEFAULT NULL COMMENT '父组织id',
  `createTime` date DEFAULT NULL COMMENT '成立时间',
  `insertTime` datetime DEFAULT NULL COMMENT '录入时间',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  `ext1` int(11) DEFAULT NULL,
  `ext2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`organizationId`),
  KEY `parentId_from_orgId` (`parentId`),
  CONSTRAINT `parentId_from_orgId` FOREIGN KEY (`parentId`) REFERENCES `organization` (`organizationId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `organization` */

insert  into `organization`(`organizationId`,`organizationName`,`organizationDesc`,`parentId`,`createTime`,`insertTime`,`updateTime`,`ext1`,`ext2`) values ('28f3ecd6dedf4334832806ad01c2bd35','XXX总公司','总公司',NULL,NULL,'2020-09-11 17:29:57',NULL,NULL,NULL);

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission` ;
CREATE TABLE `permission` (
  `permissionId` varchar(32) NOT NULL COMMENT '权限id',
  `permissionName` varchar(100) NOT NULL COMMENT '权限名称',
  `permissionDesc` varchar(255) DEFAULT NULL COMMENT '权限描述',
  `url` varchar(255) DEFAULT NULL COMMENT '权限访问路径',
  `parentId` varchar(32) DEFAULT NULL COMMENT '父级权限id',
  `type` int(1) DEFAULT NULL COMMENT '类型：0：菜单目录 1：菜单 2：按钮',
  `orderNum` int(3) DEFAULT '1' COMMENT '排序',
  `status` int(1) DEFAULT '1' COMMENT '状态：1有效；2禁用',
  `ext1` int(11) DEFAULT NULL COMMENT '扩展字段',
  `ext2` varchar(255) DEFAULT NULL COMMENT '扩展字段',
  PRIMARY KEY (`permissionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `permission` */

insert  into `permission`(`permissionId`,`permissionName`,`permissionDesc`,`url`,`parentId`,`type`,`orderNum`,`status`,`ext1`,`ext2`) values ('menu001','用户管理','查看所有用户','/user/getAll','root001',1,1,1,NULL,NULL);
insert  into `permission`(`permissionId`,`permissionName`,`permissionDesc`,`url`,`parentId`,`type`,`orderNum`,`status`,`ext1`,`ext2`) values ('menu002','角色管理','查看所有角色','/role/getAll','root001',1,2,1,NULL,NULL);
insert  into `permission`(`permissionId`,`permissionName`,`permissionDesc`,`url`,`parentId`,`type`,`orderNum`,`status`,`ext1`,`ext2`) values ('menu003','组织管理','查看所有组织','/org/getAll','root001',1,3,1,NULL,NULL);
insert  into `permission`(`permissionId`,`permissionName`,`permissionDesc`,`url`,`parentId`,`type`,`orderNum`,`status`,`ext1`,`ext2`) values ('menu004','个人中心','查看个人信息','/user/getMe','root001',1,4,1,NULL,NULL);
insert  into `permission`(`permissionId`,`permissionName`,`permissionDesc`,`url`,`parentId`,`type`,`orderNum`,`status`,`ext1`,`ext2`) values ('menu005','修改密码','修改密码',NULL,'root001',1,5,1,NULL,NULL);
insert  into `permission`(`permissionId`,`permissionName`,`permissionDesc`,`url`,`parentId`,`type`,`orderNum`,`status`,`ext1`,`ext2`) values ('org001','创建组织','创建组织','/org/addOrg','menu003',2,1,1,NULL,NULL);
insert  into `permission`(`permissionId`,`permissionName`,`permissionDesc`,`url`,`parentId`,`type`,`orderNum`,`status`,`ext1`,`ext2`) values ('org002','更新组织','更新组织信息','/org/updateOrg','menu003',2,2,1,NULL,NULL);
insert  into `permission`(`permissionId`,`permissionName`,`permissionDesc`,`url`,`parentId`,`type`,`orderNum`,`status`,`ext1`,`ext2`) values ('org003','删除组织','删除组织','/org/deleteOrg','menu003',2,3,1,NULL,NULL);
insert  into `permission`(`permissionId`,`permissionName`,`permissionDesc`,`url`,`parentId`,`type`,`orderNum`,`status`,`ext1`,`ext2`) values ('role001','创建角色','创建角色并分配权限','/role/addRole','menu002',2,1,1,NULL,NULL);
insert  into `permission`(`permissionId`,`permissionName`,`permissionDesc`,`url`,`parentId`,`type`,`orderNum`,`status`,`ext1`,`ext2`) values ('role002','编辑角色','编辑角色信息','/role/getOne','menu002',2,2,1,NULL,NULL);
insert  into `permission`(`permissionId`,`permissionName`,`permissionDesc`,`url`,`parentId`,`type`,`orderNum`,`status`,`ext1`,`ext2`) values ('role003','删除角色','删除角色','/role/deleteRole','menu002',2,3,1,NULL,NULL);
insert  into `permission`(`permissionId`,`permissionName`,`permissionDesc`,`url`,`parentId`,`type`,`orderNum`,`status`,`ext1`,`ext2`) values ('role004','更新角色','更新角色信息','/role/updateRole','role002',2,1,1,NULL,NULL);
insert  into `permission`(`permissionId`,`permissionName`,`permissionDesc`,`url`,`parentId`,`type`,`orderNum`,`status`,`ext1`,`ext2`) values ('root001','账号管理','账号管理',NULL,NULL,0,1,1,NULL,NULL);
insert  into `permission`(`permissionId`,`permissionName`,`permissionDesc`,`url`,`parentId`,`type`,`orderNum`,`status`,`ext1`,`ext2`) values ('user001','修改密码','修改密码','/user/updatePw','menu005',2,1,1,NULL,NULL);
insert  into `permission`(`permissionId`,`permissionName`,`permissionDesc`,`url`,`parentId`,`type`,`orderNum`,`status`,`ext1`,`ext2`) values ('user002','创建用户','创建用户并分配角色','/user/addUser','menu001',2,1,1,NULL,NULL);
insert  into `permission`(`permissionId`,`permissionName`,`permissionDesc`,`url`,`parentId`,`type`,`orderNum`,`status`,`ext1`,`ext2`) values ('user003','编辑用户','编辑用户信息','/user/getOne','menu001',2,2,1,NULL,NULL);
insert  into `permission`(`permissionId`,`permissionName`,`permissionDesc`,`url`,`parentId`,`type`,`orderNum`,`status`,`ext1`,`ext2`) values ('user004','删除用户','删除用户','/user/deleteUser','menu001',2,3,1,NULL,NULL);
insert  into `permission`(`permissionId`,`permissionName`,`permissionDesc`,`url`,`parentId`,`type`,`orderNum`,`status`,`ext1`,`ext2`) values ('user005','重置密码','重置密码','/user/resetPw','menu001',2,4,1,NULL,NULL);
insert  into `permission`(`permissionId`,`permissionName`,`permissionDesc`,`url`,`parentId`,`type`,`orderNum`,`status`,`ext1`,`ext2`) values ('user006','更新用户','更新用户信息','/user/updateUser','user003',2,1,1,NULL,NULL);
insert  into `permission`(`permissionId`,`permissionName`,`permissionDesc`,`url`,`parentId`,`type`,`orderNum`,`status`,`ext1`,`ext2`) values ('user007','更新个人信息','更新个人信息','/user/updateMe','menu004',2,1,1,NULL,NULL);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role` ;
CREATE TABLE `role` (
  `roleId` varchar(32) NOT NULL COMMENT '角色id',
  `roleName` varchar(50) NOT NULL COMMENT '角色名称',
  `roleDesc` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `status` int(1) DEFAULT '1' COMMENT '状态：1有效；2禁用',
  `organizationId` varchar(32) DEFAULT NULL COMMENT '所属组织',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  `ext1` int(11) DEFAULT NULL COMMENT '扩展字段',
  `ext2` varchar(255) DEFAULT NULL COMMENT '扩展字段',
  PRIMARY KEY (`roleId`),
  KEY `role_from_org` (`organizationId`),
  CONSTRAINT `role_from_org` FOREIGN KEY (`organizationId`) REFERENCES `organization` (`organizationId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`roleId`,`roleName`,`roleDesc`,`status`,`organizationId`,`createTime`,`updateTime`,`ext1`,`ext2`) values ('20200901','超级管理员','拥有所有权限',1,'28f3ecd6dedf4334832806ad01c2bd35','2020-09-01 00:00:00',NULL,NULL,NULL);

/*Table structure for table `role_permission` */

DROP TABLE IF EXISTS `role_permission` ;
CREATE TABLE `role_permission` (
  `roleId` varchar(32) NOT NULL COMMENT '角色id',
  `permissionId` varchar(32) NOT NULL COMMENT '权限id',
  PRIMARY KEY (`roleId`,`permissionId`),
  KEY `rp_from_permission` (`permissionId`),
  CONSTRAINT `rp_from_permission` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`permissionId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rp_from_role` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role_permission` */

insert  into `role_permission`(`roleId`,`permissionId`) values ('20200901','menu001');
insert  into `role_permission`(`roleId`,`permissionId`) values ('20200901','menu002');
insert  into `role_permission`(`roleId`,`permissionId`) values ('20200901','menu003');
insert  into `role_permission`(`roleId`,`permissionId`) values ('20200901','menu004');
insert  into `role_permission`(`roleId`,`permissionId`) values ('20200901','menu005');
insert  into `role_permission`(`roleId`,`permissionId`) values ('20200901','org001');
insert  into `role_permission`(`roleId`,`permissionId`) values ('20200901','org002');
insert  into `role_permission`(`roleId`,`permissionId`) values ('20200901','org003');
insert  into `role_permission`(`roleId`,`permissionId`) values ('20200901','role001');
insert  into `role_permission`(`roleId`,`permissionId`) values ('20200901','role002');
insert  into `role_permission`(`roleId`,`permissionId`) values ('20200901','role003');
insert  into `role_permission`(`roleId`,`permissionId`) values ('20200901','role004');
insert  into `role_permission`(`roleId`,`permissionId`) values ('20200901','root001');
insert  into `role_permission`(`roleId`,`permissionId`) values ('20200901','user001');
insert  into `role_permission`(`roleId`,`permissionId`) values ('20200901','user002');
insert  into `role_permission`(`roleId`,`permissionId`) values ('20200901','user003');
insert  into `role_permission`(`roleId`,`permissionId`) values ('20200901','user004');
insert  into `role_permission`(`roleId`,`permissionId`) values ('20200901','user005');
insert  into `role_permission`(`roleId`,`permissionId`) values ('20200901','user006');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user` ;
CREATE TABLE `user` (
  `userId` varchar(32) NOT NULL COMMENT '用户id',
  `userName` varchar(50) NOT NULL COMMENT '用户名',
  `userDesc` varchar(255) DEFAULT NULL COMMENT '备注',
  `password` varchar(128) NOT NULL,
  `phoneNumber` varchar(20) DEFAULT NULL COMMENT '联系方式',
  `sex` int(1) DEFAULT NULL COMMENT '用户性别：1女; 2男',
  `salt` varchar(128) DEFAULT NULL COMMENT '加密盐值',
  `status` int(1) DEFAULT '1' COMMENT '用户状态：1有效; 2禁用',
  `organizationId` varchar(32) DEFAULT NULL COMMENT '所属组织id',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  `lastLoginTime` datetime DEFAULT NULL COMMENT '最后登录时间',
  `ext1` int(11) DEFAULT NULL COMMENT '扩展字段',
  `ext2` varchar(255) DEFAULT NULL COMMENT '扩展字段',
  PRIMARY KEY (`userId`),
  KEY `user_from_organiztion` (`organizationId`),
  CONSTRAINT `user_from_organiztion` FOREIGN KEY (`organizationId`) REFERENCES `organization` (`organizationId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`userId`,`userName`,`userDesc`,`password`,`phoneNumber`,`sex`,`salt`,`status`,`organizationId`,`createTime`,`updateTime`,`lastLoginTime`,`ext1`,`ext2`) values ('20200901','admin','系统管理员','f01faee45c6cc281d29fe8f019bed3a4d04313c953656aa4c5444d671497db14','18260097620',1,'7tZ-L39sf_6vG6ZJehiP9qNG4p-Q4R20',1,'28f3ecd6dedf4334832806ad01c2bd35','2020-09-08 10:08:33','2020-09-11 17:55:56','2020-09-17 11:39:23',NULL,NULL);

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role` ;
CREATE TABLE `user_role` (
  `userId` varchar(32) NOT NULL COMMENT '用户id',
  `roleId` varchar(32) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`userId`,`roleId`),
  KEY `ur_from_role` (`roleId`),
  CONSTRAINT `ur_from_role` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ur_from_user` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_role` */

insert  into `user_role`(`userId`,`roleId`) values ('20200901','20200901');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
