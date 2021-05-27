/*
 Navicat Premium Data Transfer

 Source Server         : 阿里云
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : 47.106.249.202:3306
 Source Schema         : pcm

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 27/05/2021 12:27:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for PC_CHECK_INFO
-- ----------------------------
DROP TABLE IF EXISTS `PC_CHECK_INFO`;
CREATE TABLE `PC_CHECK_INFO` (
  `C_ID` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `C_NAME` varchar(255) NOT NULL COMMENT '检查名称',
  `C_YEAR` varchar(4) DEFAULT NULL COMMENT '年度',
  `C_MOUTH` varchar(2) DEFAULT NULL COMMENT '月份',
  `C_START_DATE` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '开始时间',
  `C_END_DATE` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '结束时间',
  `C_DEPT` varchar(64) DEFAULT NULL COMMENT '发起部门',
  `C_CHECK_BOJ` varchar(255) DEFAULT NULL COMMENT '检查对象',
  `C_CHECK_CONTENT` varchar(1000) DEFAULT NULL COMMENT '检查内容',
  `C_USER_ID` int NOT NULL COMMENT '创建人',
  `C_CREATE_DATE` datetime(6) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='项目检查记录表';

-- ----------------------------
-- Table structure for PC_FILE_INFO
-- ----------------------------
DROP TABLE IF EXISTS `PC_FILE_INFO`;
CREATE TABLE `PC_FILE_INFO` (
  `C_ID` int NOT NULL COMMENT '主键ID',
  `FILE_CODE` varchar(255) DEFAULT NULL COMMENT '文件编码',
  `FILE_DATA` blob COMMENT '文件数据',
  `FILE_NAME` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `FILE_PATH` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `FILE_SIZE` double(19,0) DEFAULT NULL COMMENT '文件大小',
  `FILE_TYPE` varchar(255) DEFAULT NULL COMMENT '文件类型',
  `M_CODE` varchar(255) DEFAULT NULL COMMENT '编码',
  `REMARK` varchar(255) DEFAULT NULL COMMENT '备注',
  `STATUS` varchar(255) DEFAULT NULL COMMENT '状态',
  `UP_LOAD_DATE` datetime(6) DEFAULT NULL COMMENT '上传时间',
  `URL` varchar(255) DEFAULT NULL COMMENT '访问URL',
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文件表';

-- ----------------------------
-- Table structure for PC_MODULE
-- ----------------------------
DROP TABLE IF EXISTS `PC_MODULE`;
CREATE TABLE `PC_MODULE` (
  `C_ID` int NOT NULL COMMENT '主键ID',
  `C_DTYPE` varchar(255) DEFAULT NULL COMMENT '类型',
  `C_ISCHECK` varchar(255) DEFAULT NULL COMMENT '是否选择',
  `C_MAINENTRY` varchar(255) DEFAULT NULL COMMENT '菜单入口',
  `C_MODULECODE` varchar(255) DEFAULT NULL COMMENT '菜单编码',
  `C_MODULDESC` varchar(255) DEFAULT NULL COMMENT '菜单描述',
  `C_MODULNAME` varchar(255) DEFAULT NULL COMMENT '菜单类型',
  `PARAM1` varchar(255) DEFAULT NULL COMMENT '参数1',
  `PARAM2` varchar(255) DEFAULT NULL COMMENT '参数2',
  `PARAM3` varchar(255) DEFAULT NULL COMMENT '参数3',
  `C_SORTNO` int DEFAULT NULL COMMENT '排序号',
  `C_STAUS` varchar(255) DEFAULT NULL COMMENT '状态',
  `C_PARENTID` int DEFAULT NULL COMMENT '上级菜单ID',
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单表';

-- ----------------------------
-- Table structure for PC_ORG_INFO
-- ----------------------------
DROP TABLE IF EXISTS `PC_ORG_INFO`;
CREATE TABLE `PC_ORG_INFO` (
  `C_ID` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `C_FROM_SYSTEM` varchar(32) DEFAULT NULL COMMENT '来源系统',
  `C_LEVEL` varchar(12) DEFAULT NULL COMMENT '级别',
  `C_ORG_CODE` varchar(32) DEFAULT NULL COMMENT '说明',
  `C_ORG_FULL_NAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '机构全称',
  `C_ORG_SHROT_NAME` varchar(32) DEFAULT NULL COMMENT '机构简称',
  `C_ORG_TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '机构类型',
  `C_REMARK` varchar(128) DEFAULT NULL COMMENT '备注',
  `C_PARENT_ID` int DEFAULT NULL COMMENT '上级机构',
  `C_ORG_STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '机构状态',
  `C_PARENT_NAME` varchar(128) DEFAULT NULL COMMENT '父机构名',
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='组织结构表';

-- ----------------------------
-- Table structure for PC_ROLE
-- ----------------------------
DROP TABLE IF EXISTS `PC_ROLE`;
CREATE TABLE `PC_ROLE` (
  `C_ID` int NOT NULL COMMENT '主键',
  `CREATE_DATE` datetime NOT NULL COMMENT '创建时间',
  `CREATER` varchar(255) DEFAULT NULL COMMENT '创建人',
  `REMARK` varchar(255) DEFAULT NULL COMMENT '备注',
  `ROLE_CODE` varchar(255) DEFAULT NULL COMMENT '角色编码',
  `ROLE_DESC` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `ROLE_NAME` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `ROLE_TYPE` varchar(255) DEFAULT NULL COMMENT '角色类型',
  `C_ORGID` int DEFAULT NULL COMMENT '机构ID',
  `C_CREATER` varchar(255) DEFAULT NULL COMMENT '创建人',
  `C_REAMRK` varchar(255) DEFAULT NULL COMMENT '备注',
  `C_ROLE_CODE` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `C_ROLE_DESC` varchar(255) DEFAULT NULL COMMENT '角色名',
  `C_ROLE_NAME` varchar(255) DEFAULT NULL COMMENT '角色类型',
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色表 ';

-- ----------------------------
-- Table structure for PC_ROLE_MODULE
-- ----------------------------
DROP TABLE IF EXISTS `PC_ROLE_MODULE`;
CREATE TABLE `PC_ROLE_MODULE` (
  `C_ID` int NOT NULL COMMENT '主键ID',
  `REMARK` varchar(255) DEFAULT NULL COMMENT '备注',
  `RW_FLAG` varchar(255) DEFAULT NULL COMMENT '标记',
  `C_MODULE_ID` int DEFAULT NULL COMMENT '菜单ID',
  `C_ROLE_ID` int DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色菜单表';

-- ----------------------------
-- Table structure for PC_ROLE_USER
-- ----------------------------
DROP TABLE IF EXISTS `PC_ROLE_USER`;
CREATE TABLE `PC_ROLE_USER` (
  `C_ID` int NOT NULL COMMENT '主键ID',
  `C_ROLE_ID` int DEFAULT NULL COMMENT '角色ID',
  `C_ACCOUNT_ID` int DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for PC_USER
-- ----------------------------
DROP TABLE IF EXISTS `PC_USER`;
CREATE TABLE `PC_USER` (
  `C_ID` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `C_EMAIL` varchar(24) DEFAULT NULL COMMENT '邮箱',
  `C_LAST_DATE` datetime(6) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '最后登陆时间',
  `C_LOGIN_COUNT` int DEFAULT NULL COMMENT '登陆次数',
  `C_LOGIN_SECURITYCODE` varchar(255) DEFAULT NULL COMMENT '安全码',
  `C_NAME` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '姓名',
  `C_PASSWORD` varchar(64) DEFAULT NULL COMMENT '密码',
  `C_PHONE` varchar(11) DEFAULT NULL COMMENT '电话',
  `C_STATUS` varchar(3) DEFAULT NULL COMMENT '状态',
  `C_USER_NAME` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '登陆名',
  `C_CREATE_DATE` datetime(6) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `C_ORG_ID` int DEFAULT NULL COMMENT '机构ID',
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';

SET FOREIGN_KEY_CHECKS = 1;
