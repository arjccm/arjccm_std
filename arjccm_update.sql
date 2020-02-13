/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : arjccm_wc20190806

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 09/02/2020 05:59:44
*/

-- 新增表   by maoxb  2020-02-09  start-----------------------------------------------------------------------------------------------------------------------

-- ----------------------------
-- Table structure for ccm_relief_notify
-- ----------------------------
DROP TABLE IF EXISTS `ccm_relief_notify`;
CREATE TABLE `ccm_relief_notify`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键id',
  `task_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '任务ID',
  `receive_user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '接收备勤任务人员',
  `type` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '通知类型',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '任务状态',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '备勤任务通知表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ccm_relief_task
-- ----------------------------
DROP TABLE IF EXISTS `ccm_relief_task`;
CREATE TABLE `ccm_relief_task`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 唯一主键ID ',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 创建者 ',
  `create_date` datetime(0) NOT NULL COMMENT ' 创建时间 ',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 更新者 ',
  `update_date` datetime(0) NOT NULL COMMENT ' 更新时间 ',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 备注信息 ',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 删除标记 ',
  `task_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `relief_level` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备勤等级',
  `relief_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备勤类别',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '集结时间',
  `mass_address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '集结地点',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '备勤时间',
  `relief_dept` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备勤参与部门',
  `relief_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '每个单位人数',
  `review_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核状态',
  `road_line` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备勤路线',
  `area_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备勤辖区',
  `relief_dept_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备勤参与部门名称',
  `auditing_status` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '审核状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '备勤任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ccm_relief_unit
-- ----------------------------
DROP TABLE IF EXISTS `ccm_relief_unit`;
CREATE TABLE `ccm_relief_unit`  (
  `id` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT ' 唯一主键ID（自增） ',
  `user_id` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 备勤人员 ',
  `missions_id` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '备勤任务',
  `patrol_vehicles` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备勤车辆',
  `more1` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 冗余字段1 ',
  `more2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 冗余字段2 ',
  `departure_time` datetime(0) NULL DEFAULT NULL COMMENT ' 接受时间 ',
  `status` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务状态 ',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 创建者 ',
  `create_date` datetime(0) NOT NULL COMMENT ' 发生时间 ',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 更新者 ',
  `update_date` datetime(0) NOT NULL COMMENT ' 更新时间 ',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 描述信息 ',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 删除标记 ',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ccm_alarm_log_update_date`(`update_date`) USING BTREE,
  INDEX `ccm_alarm_log_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '备勤单位 ' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- Table structure for ccm_patrol_missions
-- ----------------------------
DROP TABLE IF EXISTS `ccm_patrol_missions`;
CREATE TABLE `ccm_patrol_missions`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 唯一主键ID（自增） ',
  `patrol_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 巡逻任务 ',
  `patrol_time` datetime(0) NULL DEFAULT NULL COMMENT ' 巡逻时间 ',
  `office_id` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 参与单位 ',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '任务结束时间',
  `number` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 每个单位人数 ',
  `patrol_routes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 巡逻路线 ',
  `area_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 巡逻辖区 ',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 状态 ',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 创建者 ',
  `create_date` datetime(0) NOT NULL COMMENT ' 发生时间 ',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 更新者 ',
  `update_date` datetime(0) NOT NULL COMMENT ' 更新时间 ',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 描述信息 ',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 删除标记 ',
  `auditing_status` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '审核状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ccm_alarm_log_update_date`(`update_date`) USING BTREE,
  INDEX `ccm_alarm_log_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '巡逻任务 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ccm_patrol_security
-- ----------------------------
DROP TABLE IF EXISTS `ccm_patrol_security`;
CREATE TABLE `ccm_patrol_security`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 唯一主键ID（自增） ',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 巡逻民警 ',
  `security_time` datetime(0) NULL DEFAULT NULL COMMENT ' 警卫时间 ',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `office_id` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 参与单位 ',
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务标题',
  `number_units` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 单位人数 ',
  `guard_line` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 警卫线路 ',
  `collection_time` datetime(0) NULL DEFAULT NULL COMMENT ' 集合时间 ',
  `collection_place` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 集合地点 ',
  `status` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 状态 ',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 创建者 ',
  `create_date` datetime(0) NOT NULL COMMENT ' 发生时间 ',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 更新者 ',
  `update_date` datetime(0) NOT NULL COMMENT ' 更新时间 ',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 描述信息 ',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 删除标记 ',
  `auditing_status` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ccm_alarm_log_update_date`(`update_date`) USING BTREE,
  INDEX `ccm_alarm_log_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '警卫管理 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ccm_patrol_unit
-- ----------------------------
DROP TABLE IF EXISTS `ccm_patrol_unit`;
CREATE TABLE `ccm_patrol_unit`  (
  `id` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT ' 唯一主键ID（自增） ',
  `user_id` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 巡逻民警 ',
  `missions_id` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '巡逻任务',
  `patrol_vehicles` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '巡逻车辆',
  `vehicle_equipment` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 车载设备 ',
  `individual_equipment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 单兵装备 ',
  `departure_time` datetime(0) NULL DEFAULT NULL COMMENT ' 时间 ',
  `status` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 状态 ',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 创建者 ',
  `create_date` datetime(0) NOT NULL COMMENT ' 发生时间 ',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 更新者 ',
  `update_date` datetime(0) NOT NULL COMMENT ' 更新时间 ',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 描述信息 ',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 删除标记 ',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ccm_alarm_log_update_date`(`update_date`) USING BTREE,
  INDEX `ccm_alarm_log_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '巡逻单位 ' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;


-- ----------------------------
-- Table structure for ccm_guard_unit
-- ----------------------------
DROP TABLE IF EXISTS `ccm_guard_unit`;
CREATE TABLE `ccm_guard_unit`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 唯一主键ID（自增） ',
  `security_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '警卫任务id',
  `user_id` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 警卫 ',
  `patrol_vehicles` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 车辆 ',
  `vehicle_equipment` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 车载设备 ',
  `individual_equipment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 单兵装备 ',
  `departure_time` datetime(0) NULL DEFAULT NULL COMMENT ' 时间 ',
  `status` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 状态 ',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 创建者 ',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT ' 发生时间 ',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 更新者 ',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT ' 更新时间 ',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 描述信息 ',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 删除标记 ',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ccm_alarm_log_update_date`(`update_date`) USING BTREE,
  INDEX `ccm_alarm_log_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '警卫单位 ' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;


-- ----------------------------
-- Table structure for ccm_elecfence_alarm
-- ----------------------------
DROP TABLE IF EXISTS `ccm_elecfence_alarm`;
CREATE TABLE `ccm_elecfence_alarm`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 备注信息 ',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标志',
  `alarm_type` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报警类型：进围栏、出围栏、进出围栏',
  `people_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人口id',
  `device_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备唯一标识号',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id-平台',
  `is_check` int(1) NULL DEFAULT NULL COMMENT '是否核实：1核实0未核实',
  `people_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人口姓名',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名-平台',
  `x` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经度',
  `y` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纬度',
  `alarm_time` datetime(0) NULL DEFAULT NULL COMMENT '报警时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;


-- ----------------------------
-- Table structure for ccm_kpi_count
-- ----------------------------
DROP TABLE IF EXISTS `ccm_kpi_count`;
CREATE TABLE `ccm_kpi_count`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 唯一主键ID ',
  `create_date` datetime(0) NOT NULL COMMENT ' 创建时间 ',
  `update_date` datetime(0) NOT NULL COMMENT ' 更新时间 ',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 备注信息 ',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 删除标记 ',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `tail_times` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '重点人员帮教次数',
  `people_number` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新增重点人员数量',
  `tenant_number` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新增的房东和租住人数量',
  `org_number` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新增重点机构数量',
  `components_number` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新增消防设施数量',
  `reports_times` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作日志次数',
  `relief_times` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备勤次数',
  `relief_time` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备勤时长',
  `patrol_times` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '巡逻次数',
  `patrol_time` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '巡逻时长',
  `police_task_times` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '警卫任务次数'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '绩效统计表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

-- 新增表   by maoxb  2020-02-09  end -----------------------------------------------------------------------------------------------------------------------

-- 新增菜单  by maoxb   2020-02-07 start -----------------------------------------------------------------------------------------------------------------------
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('bba5e49630e649fab9c7816db639092e', '06dff2cae7b540b3a5ecabeec950296f', '0,1,ef61dbc7960f4272b360de7ad7d59a07,aa8bc4b271cf4b0ea85406e8d654f909,06dff2cae7b540b3a5ecabeec950296f,', '编辑', 60, '', '', '', '0', 'unit:ccmReliefUnit:edit', '1', '2020-02-09 07:24:51', '1', '2020-02-09 07:24:51', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('a10ea2424f074637839e82366cee2b74', '06dff2cae7b540b3a5ecabeec950296f', '0,1,ef61dbc7960f4272b360de7ad7d59a07,aa8bc4b271cf4b0ea85406e8d654f909,06dff2cae7b540b3a5ecabeec950296f,', '显示', 30, '', '', '', '0', 'unit:ccmReliefUnit:view', '1', '2020-02-09 07:24:08', '1', '2020-02-09 07:24:08', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('87c6bcb15e4045809e8c1e152b38011a', '29ddedacbae94e89ab07e9ebe8e558c8', '0,1,ef61dbc7960f4272b360de7ad7d59a07,aa8bc4b271cf4b0ea85406e8d654f909,29ddedacbae94e89ab07e9ebe8e558c8,', '编辑', 60, '', '', '', '0', 'relief:ccmReliefTask:edit', '1', '2020-02-07 18:09:10', '1', '2020-02-07 18:09:10', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('1f81b090f6f142139933c09be2717cc3', '29ddedacbae94e89ab07e9ebe8e558c8', '0,1,ef61dbc7960f4272b360de7ad7d59a07,aa8bc4b271cf4b0ea85406e8d654f909,29ddedacbae94e89ab07e9ebe8e558c8,', '显示', 30, '', '', '', '0', 'relief:ccmReliefTask:view', '1', '2020-02-07 18:08:30', '1', '2020-02-07 18:08:30', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('770581b5892c4cb8b714bccd6cd14019', '5977b1806ddf41c3baea18e7482dd724', '0,1,ef61dbc7960f4272b360de7ad7d59a07,1cff269b7cb248659118a3bdded9c0fe,5977b1806ddf41c3baea18e7482dd724,', '编辑', 60, '', '', '', '0', 'guard:ccmGuardUnit:edit', '1', '2020-02-07 18:06:53', '1', '2020-02-07 18:06:53', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('bdb5897d7bb64dd598396a0b4e46be3a', '5977b1806ddf41c3baea18e7482dd724', '0,1,ef61dbc7960f4272b360de7ad7d59a07,1cff269b7cb248659118a3bdded9c0fe,5977b1806ddf41c3baea18e7482dd724,', '显示', 30, '', '', '', '0', 'guard:ccmGuardUnit:view', '1', '2020-02-07 18:06:04', '1', '2020-02-07 18:06:04', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('8babf69ea7ee4b00a9aa850ab3d1c740', '932fe8c88a0142a594216f522f08f43f', '0,1,ef61dbc7960f4272b360de7ad7d59a07,1cff269b7cb248659118a3bdded9c0fe,932fe8c88a0142a594216f522f08f43f,', '编辑', 60, '', '', '', '0', 'security:ccmPatrolSecurity:edit', '1', '2020-02-07 18:05:06', '1', '2020-02-07 18:05:06', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('4512bff0d0b3469f823e7770f55b4bae', '932fe8c88a0142a594216f522f08f43f', '0,1,ef61dbc7960f4272b360de7ad7d59a07,1cff269b7cb248659118a3bdded9c0fe,932fe8c88a0142a594216f522f08f43f,', '显示', 30, '', '', '', '0', 'security:ccmPatrolSecurity:view', '1', '2020-02-07 18:04:33', '1', '2020-02-07 18:04:33', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('e5b28b4f8e1045049728b43a61d3de57', 'f3616a64107e44849f650495c127c078', '0,1,ef61dbc7960f4272b360de7ad7d59a07,c4b65a69d07b4907b379fcda304d71b2,f3616a64107e44849f650495c127c078,', '编辑', 60, '', '', '', '0', 'patrol:ccmPatrolRespoint:edit', '1', '2020-02-07 18:00:10', '1', '2020-02-07 18:03:12', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('9f9afad15d774bedb731f56205cc8c36', 'f3616a64107e44849f650495c127c078', '0,1,ef61dbc7960f4272b360de7ad7d59a07,c4b65a69d07b4907b379fcda304d71b2,f3616a64107e44849f650495c127c078,', '显示', 30, '', '', '', '0', 'patrol:ccmPatrolRespoint:view', '1', '2020-02-07 17:59:41', '1', '2020-02-07 18:02:45', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60931632b5d3454a94f13677100db566', '61914bdbdef741b09f14bd206e8547d5', '0,1,ef61dbc7960f4272b360de7ad7d59a07,c4b65a69d07b4907b379fcda304d71b2,61914bdbdef741b09f14bd206e8547d5,', '编辑', 60, '', '', '', '0', 'patrol:ccmPatrolResult:edit', '1', '2020-02-07 17:59:10', '1', '2020-02-07 18:02:21', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62ac297ac0c74275a313515e95280ece', '61914bdbdef741b09f14bd206e8547d5', '0,1,ef61dbc7960f4272b360de7ad7d59a07,c4b65a69d07b4907b379fcda304d71b2,61914bdbdef741b09f14bd206e8547d5,', '显示', 30, '', '', '', '0', 'patrol:ccmPatrolResult:view', '1', '2020-02-07 17:58:38', '1', '2020-02-07 18:01:57', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('414eed95bbb642f4be899934db62b3f6', '27860563c33c416191fdee296e23e93a', '0,1,ef61dbc7960f4272b360de7ad7d59a07,c4b65a69d07b4907b379fcda304d71b2,27860563c33c416191fdee296e23e93a,', '编辑', 60, '', '', '', '0', 'patrol:ccmPatrolPlan:edit', '1', '2020-02-07 17:57:41', '1', '2020-02-07 18:01:27', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('38620a634ad04fd895401170c289d48e', '27860563c33c416191fdee296e23e93a', '0,1,ef61dbc7960f4272b360de7ad7d59a07,c4b65a69d07b4907b379fcda304d71b2,27860563c33c416191fdee296e23e93a,', '显示', 30, '', '', '', '0', 'patrol:ccmPatrolPlan:view', '1', '2020-02-07 17:57:07', '1', '2020-02-07 18:01:00', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('812aa017c27647bb951f43a20b70fdd4', 'ee0acbec561e434da8371831f719ded3', '0,1,ef61dbc7960f4272b360de7ad7d59a07,c4b65a69d07b4907b379fcda304d71b2,ee0acbec561e434da8371831f719ded3,', '编辑', 60, '', '', '', '0', 'patrol:ccmPatrolUnit:edit', '1', '2020-02-07 17:34:39', '1', '2020-02-07 17:34:39', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('9a5e53f6485d4433ac10d06fe9c94e93', 'ee0acbec561e434da8371831f719ded3', '0,1,ef61dbc7960f4272b360de7ad7d59a07,c4b65a69d07b4907b379fcda304d71b2,ee0acbec561e434da8371831f719ded3,', '显示', 30, '', '', '', '0', 'patrol:ccmPatrolUnit:view', '1', '2020-02-07 17:34:06', '1', '2020-02-07 17:34:06', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('ddddad553ca2413cbed43ecb9e58fcc6', 'ff2ca21b83174ff88d1d51459c5970bb', '0,1,ef61dbc7960f4272b360de7ad7d59a07,c4b65a69d07b4907b379fcda304d71b2,ff2ca21b83174ff88d1d51459c5970bb,', '编辑', 60, '', '', '', '0', 'patrol:ccmPatrolMissions:edit', '1', '2020-02-07 17:33:27', '1', '2020-02-07 17:33:27', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('95902cb5af434cd18c17c4cf0f72959e', 'ff2ca21b83174ff88d1d51459c5970bb', '0,1,ef61dbc7960f4272b360de7ad7d59a07,c4b65a69d07b4907b379fcda304d71b2,ff2ca21b83174ff88d1d51459c5970bb,', '显示', 30, '', '', '', '0', 'patrol:ccmPatrolMissions:view', '1', '2020-02-07 17:32:24', '1', '2020-02-07 17:32:24', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('06dff2cae7b540b3a5ecabeec950296f', 'aa8bc4b271cf4b0ea85406e8d654f909', '0,1,ef61dbc7960f4272b360de7ad7d59a07,aa8bc4b271cf4b0ea85406e8d654f909,', '备勤单位', 60, '/relief/ccmReliefTask/arrangement', '', '', '1', '', '1', '2020-02-07 17:28:09', '1', '2020-02-07 17:28:09', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('29ddedacbae94e89ab07e9ebe8e558c8', 'aa8bc4b271cf4b0ea85406e8d654f909', '0,1,ef61dbc7960f4272b360de7ad7d59a07,aa8bc4b271cf4b0ea85406e8d654f909,', '备勤任务', 30, '/relief/ccmReliefTask', '', '', '1', '', '1', '2020-02-07 17:26:42', '1', '2020-02-07 17:26:42', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('cee99b69711b453cb1c012b592936264', 'e1ea142288174ff9be2ae602d07af1f9', '0,1,ef61dbc7960f4272b360de7ad7d59a07,e1ea142288174ff9be2ae602d07af1f9,', '警情管理', 30, '/alarm/bphAlarmInfo/index', '', '', '1', '', '1', '2020-02-07 17:24:50', '1', '2020-02-07 17:24:50', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('5977b1806ddf41c3baea18e7482dd724', '1cff269b7cb248659118a3bdded9c0fe', '0,1,ef61dbc7960f4272b360de7ad7d59a07,1cff269b7cb248659118a3bdded9c0fe,', '警卫单位', 60, '/guard/ccmGuardUnit/securityList/', '', '', '1', '', '1', '2020-02-07 17:23:50', '1', '2020-02-07 17:23:50', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('932fe8c88a0142a594216f522f08f43f', '1cff269b7cb248659118a3bdded9c0fe', '0,1,ef61dbc7960f4272b360de7ad7d59a07,1cff269b7cb248659118a3bdded9c0fe,', '警卫管理', 30, '/security/ccmPatrolSecurity/', '', '', '1', '', '1', '2020-02-07 17:22:00', '1', '2020-02-07 17:22:00', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('f3616a64107e44849f650495c127c078', 'c4b65a69d07b4907b379fcda304d71b2', '0,1,ef61dbc7960f4272b360de7ad7d59a07,c4b65a69d07b4907b379fcda304d71b2,', '巡逻点位结果', 180, '/patrol/ccmPatrolRespoint', '', '', '0', '', '1', '2020-02-07 17:19:15', '1', '2020-02-07 17:19:15', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61914bdbdef741b09f14bd206e8547d5', 'c4b65a69d07b4907b379fcda304d71b2', '0,1,ef61dbc7960f4272b360de7ad7d59a07,c4b65a69d07b4907b379fcda304d71b2,', '巡逻结果', 150, '/patrol/ccmPatrolResult', '', '', '0', '', '1', '2020-02-07 17:18:32', '1', '2020-02-07 17:18:32', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('27860563c33c416191fdee296e23e93a', 'c4b65a69d07b4907b379fcda304d71b2', '0,1,ef61dbc7960f4272b360de7ad7d59a07,c4b65a69d07b4907b379fcda304d71b2,', '巡逻计划', 120, '/patrol/ccmPatrolPlan', '', '', '0', '', '1', '2020-02-07 17:17:52', '1', '2020-02-07 17:17:52', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('ee0acbec561e434da8371831f719ded3', 'c4b65a69d07b4907b379fcda304d71b2', '0,1,ef61dbc7960f4272b360de7ad7d59a07,c4b65a69d07b4907b379fcda304d71b2,', '巡逻单位', 90, '/patrol/ccmPatrolMissions/arrangement', '', '', '1', '', '1', '2020-02-07 17:16:56', '1', '2020-02-07 17:16:56', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('ff2ca21b83174ff88d1d51459c5970bb', 'c4b65a69d07b4907b379fcda304d71b2', '0,1,ef61dbc7960f4272b360de7ad7d59a07,c4b65a69d07b4907b379fcda304d71b2,', '巡逻任务', 60, '/patrol/ccmPatrolMissions/summaryGraph', '', '', '1', '', '1', '2020-02-07 17:15:08', '1', '2020-02-07 17:15:08', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('1478dbf040b84903b55e79de608cda3b', 'c4b65a69d07b4907b379fcda304d71b2', '0,1,ef61dbc7960f4272b360de7ad7d59a07,c4b65a69d07b4907b379fcda304d71b2,', '巡逻报告', 30, '/patrol/patrolReport/', '', '', '1', '', '1', '2020-02-07 17:12:46', '1', '2020-02-07 17:12:46', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('aa8bc4b271cf4b0ea85406e8d654f909', 'ef61dbc7960f4272b360de7ad7d59a07', '0,1,ef61dbc7960f4272b360de7ad7d59a07,', '备勤任务管理', 480, '', '', 'step-forward', '1', '', '1', '2020-02-07 17:09:53', '1', '2020-02-07 17:09:53', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('e1ea142288174ff9be2ae602d07af1f9', 'ef61dbc7960f4272b360de7ad7d59a07', '0,1,ef61dbc7960f4272b360de7ad7d59a07,', '警情信息查询', 450, '', '', 'camera', '1', '', '1', '2020-02-07 17:08:50', '1', '2020-02-07 17:08:50', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('1cff269b7cb248659118a3bdded9c0fe', 'ef61dbc7960f4272b360de7ad7d59a07', '0,1,ef61dbc7960f4272b360de7ad7d59a07,', '警卫任务管理', 420, '', '', 'forward', '1', '', '1', '2020-02-07 17:07:54', '1', '2020-02-07 17:07:54', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('c4b65a69d07b4907b379fcda304d71b2', 'ef61dbc7960f4272b360de7ad7d59a07', '0,1,ef61dbc7960f4272b360de7ad7d59a07,', '巡逻管理', 390, '', '', 'richanggongzuo1', '1', '', '1', '2020-02-07 17:06:12', '1', '2020-02-07 17:06:12', '', '0');


-- 新增菜单  by maoxb   2020-02-07 end -----------------------------------------------------------------------------------------------------------------------


INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('25787c7267444f4fa9f67d8c64dea76e', '1', '0,1,', '数据统计分析', 110, '', '', '721', '1', '', '1', '2019-07-09 14:44:36', '1', '2019-07-09 14:47:57', '', '0');


INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('55e024f4504343e9ae1416713de4013b', '25787c7267444f4fa9f67d8c64dea76e', '0,1,25787c7267444f4fa9f67d8c64dea76e,', '客户端情况统计', 120, '', '', 'backward', '1', '', '1', '2019-07-09 14:47:42', '1', '2019-07-25 13:48:30', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('a21a9d310cda487bb755e1c16fac46d5', '25787c7267444f4fa9f67d8c64dea76e', '0,1,25787c7267444f4fa9f67d8c64dea76e,', '单位警情统计', 90, '', '', 'fast-backward', '1', '', '1', '2019-07-09 14:47:20', '1', '2019-07-25 13:46:42', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('afd6433ee8a5415b8f79fd11590ff9c1', '25787c7267444f4fa9f67d8c64dea76e', '0,1,25787c7267444f4fa9f67d8c64dea76e,', '个人信息统计', 30, '', '', 'stop', '1', '', '1', '2019-07-09 14:46:49', '1', '2019-07-25 13:43:57', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('f203d9cf26b94070ae394212a8c07f31', '25787c7267444f4fa9f67d8c64dea76e', '0,1,25787c7267444f4fa9f67d8c64dea76e,', '单位信息统计', 60, '', '', 'step-backward', '1', '', '1', '2019-07-09 14:46:31', '1', '2019-07-25 13:45:01', '', '0');


INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60911fdba6ca4ba4a8099be4d6a68135', '55e024f4504343e9ae1416713de4013b', '0,1,25787c7267444f4fa9f67d8c64dea76e,55e024f4504343e9ae1416713de4013b,', '客户端登录查询统计', 30, '/deviceonline/ccmDeviceOnline', '', '', '1', '', '1', '2019-07-09 14:49:57', '1', '2019-07-13 16:29:28', '', '0');

INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('8c11afdb61794b23960b1d1b61b74a8f', 'a21a9d310cda487bb755e1c16fac46d5', '0,1,25787c7267444f4fa9f67d8c64dea76e,a21a9d310cda487bb755e1c16fac46d5,', '警情统计', 30, '/alarm/bphAlarmInfo/countDtae', '', '', '1', '', '1', '2019-07-09 14:49:12', '1', '2019-07-09 14:49:12', '', '0');

INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('b6f6fc920196439ba4e147bdb5b5f9b6', 'afd6433ee8a5415b8f79fd11590ff9c1', '0,1,25787c7267444f4fa9f67d8c64dea76e,afd6433ee8a5415b8f79fd11590ff9c1,', '个人信息统计', 30, '/analyst/personal', '', '', '1', '', '1', '2019-07-09 14:53:10', '1', '2019-07-11 14:17:09', '', '0');

INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('cf749158a4d4457a8bfc508cce29f0c5', 'f203d9cf26b94070ae394212a8c07f31', '0,1,25787c7267444f4fa9f67d8c64dea76e,f203d9cf26b94070ae394212a8c07f31,', '单位信息统计', 30, '/analyst/department', '', '', '1', '', '1', '2019-07-09 14:53:33', '1', '2019-07-15 20:46:28', '', '0');

INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('119a26f82374473db1d8f9baae7a173a', '60911fdba6ca4ba4a8099be4d6a68135', '0,1,25787c7267444f4fa9f67d8c64dea76e,55e024f4504343e9ae1416713de4013b,60911fdba6ca4ba4a8099be4d6a68135,', '显示', 30, '', '', '', '0', 'deviceonline:ccmDeviceOnline:view', '1', '2019-07-13 16:30:38', '1', '2019-07-13 16:30:38', '', '0');

INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('caaa666689224050a9772a72b8653d87', 'b6f6fc920196439ba4e147bdb5b5f9b6', '0,1,25787c7267444f4fa9f67d8c64dea76e,afd6433ee8a5415b8f79fd11590ff9c1,b6f6fc920196439ba4e147bdb5b5f9b6,', '显示', 30, '', '', '', '0', 'report:ccmPeopleStat:view', '1', '2019-07-09 15:13:18', '1', '2019-07-09 15:13:27', '', '0');


-- 绩效统计
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('d720d03afe2a44febaa4a274993f6383', '1', '0,1,', '绩效统计', 280, '', '', 'perfoemance-old', '1', '', '1', '2019-07-10 13:01:40', '1', '2019-07-25 09:14:30', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('64c8919348574730ae5ae51329f20c23', 'd720d03afe2a44febaa4a274993f6383', '0,1,d720d03afe2a44febaa4a274993f6383,', 'KPI排行榜', 90, '/kpi/count/toKpi', '', 'eject', '1', '', '1', '2019-07-25 09:13:53', '1', '2019-08-08 17:23:39', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('75bfaab4a48a4d538cce5bd1548c7d86', 'd720d03afe2a44febaa4a274993f6383', '0,1,d720d03afe2a44febaa4a274993f6383,', '数据统计', 30, '', '', '', '1', '', '1', '2019-07-10 13:14:48', '1', '2019-07-10 13:14:48', '', '1');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('99b82e4327f24f13a0040ffa907a5f84', 'd720d03afe2a44febaa4a274993f6383', '0,1,d720d03afe2a44febaa4a274993f6383,', '编辑', 60, '', '', '', '0', 'count:ccmKpiCount:edit', '1', '2019-07-17 20:34:18', '1', '2019-07-17 20:34:40', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('ad911e062aac466fa0f0cac5e6dc4968', 'd720d03afe2a44febaa4a274993f6383', '0,1,d720d03afe2a44febaa4a274993f6383,', '显示', 30, '', '', '', '0', 'count:ccmKpiCount:view', '1', '2019-07-17 20:33:55', '1', '2019-07-17 20:34:29', '', '0');



-- 移动设备管理-管控
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('530b24308ad2426c9ae6ff6cfd4b2e58', 'ba41342f6add4b8ab7684d07749229d5', '0,1,2,ba41342f6add4b8ab7684d07749229d5,', '移动设备管理-管控', 200, '/ccmsys/ccmMobileDevice/list2', '', '', '1', '', '1', '2019-08-09 17:52:51', '1', '2019-08-09 17:52:51', '', '0');
-- 围栏报警日志管理
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('836b2e026a0d492a922ee14ee37039e3', '67', '0,1,2,67,', '围栏报警日志管理', 100, '/fenceAlarm/ccmElecfenceAlarm', '', '', '1', 'fenceAlarm:ccmElecfenceAlarm:view', '1', '2019-08-02 14:16:25', '1', '2019-08-02 15:15:37', '', '0');

-- 新增菜单  by maoxb   2020-02-07 end -----------------------------------------------------------------------------------------------------------------------

-- 电子围栏修改
update sys_menu t set t.parent_id = '3' WHERE id = '8113cd3da9d448dba0c5681e7b59cff8';
update sys_menu t set t.parent_ids = '0,1,2,3,' WHERE id = '8113cd3da9d448dba0c5681e7b59cff8';

-- 巡更管理 字典新增  by maoxb 2020-02-11
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('24ce337c611f4a2abb6ac2f9871d7e5f', '1', '未审核', 'auditing_status', '审核状态', 10, '0', '1', '2019-07-30 10:39:39', '1', '2019-07-30 10:39:39', '巡逻模块新增', '0');
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('9b51e84d153f4657a8701c6c725fba5b', '2', '审核通过', 'auditing_status', '审核状态', 20, '0', '1', '2019-07-30 10:40:11', '1', '2019-07-30 10:40:11', '巡逻模块审核状态', '0');
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('1991284e0f314531b9677187b1f9b85d', '3', '已完成', 'ccm_patrol_missions_status', '巡逻任务状态', 30, '0', '1', '2019-07-05 19:33:35', '1', '2019-07-31 16:23:48', '', '0');
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62ca5a29456949b092a7ce65e9d908ec', '1', '新建', 'ccm_patrol_missions_status', '巡逻任务状态', 10, '0', '1', '2019-07-05 19:32:39', '1', '2019-07-31 16:23:32', '', '0');
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('9bff1f1295e848f8b65ff693ed853ce7', '2', '进行中', 'ccm_patrol_missions_status', '巡逻任务状态', 20, '0', '1', '2019-07-05 19:33:05', '1', '2019-07-31 16:23:40', '', '0');


-- 城市部件表 by maoxb 2020-02-13
 alter table ccm_city_components add components_num varchar(10) COMMENT '消防设施的数量';
 alter table ccm_city_components add is_danger varchar(2)  COMMENT '是否是危险品（是 1  否  0）';
 alter table ccm_city_components add collect_people varchar(255)  COMMENT '信息采集人员';  
 -- 房屋表 by maoxb 2020-02-13
 alter table ccm_pop_tenant add collect_people varchar(255)  COMMENT '信息采集人员';































