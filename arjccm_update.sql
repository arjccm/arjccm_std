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
 
 
-- 移动设备管理表 by maoxb 2020-02-13
 alter table ccm_mobile_device add use_type varchar(255)  COMMENT 'app应用类型';
 alter table ccm_mobile_device add people_id varchar(255)  COMMENT '关联人员';
 alter table ccm_mobile_device add elecfence_id varchar(255)  COMMENT '电子围栏id';

-- 通知通告 by maoxb 2020-02-13
 alter table oa_notify add task_url varchar(255)  COMMENT '任务链接';
 alter table oa_notify add relief_id varchar(255)  COMMENT '备勤任务id';
 alter table oa_notify add relief_type varchar(255)  COMMENT '备勤任务通知类型';
 alter table oa_notify add relief_status varchar(255)  COMMENT '备勤任务执行状态';
 
 -- 防疫人员表 by yiqingxuan 2020-02-14
DROP TABLE IF EXISTS `ccm_people_antiepidemic`;
CREATE TABLE `ccm_people_antiepidemic`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `telephone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `tel_posion` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '基站位置',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `age` int(3) NULL DEFAULT NULL COMMENT '年龄',
  `id_number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `domicile` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '户籍地',
  `habitation` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '在琼居住地',
  `leave_hubei_date` datetime(0) NULL DEFAULT NULL COMMENT '离鄂时间',
  `come_hainan_date` datetime(0) NULL DEFAULT NULL COMMENT '入琼时间',
  `transportation` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交通工具',
  `is_in_14days` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否14天以内',
  `cohabitant` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '同居住人员',
  `is_left_hainan` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否离岛',
  `left_date` datetime(0) NULL DEFAULT NULL COMMENT '离岛时间',
  `health` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身体状况',
  `does_take_steps` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有无采取措施',
  `take_steps` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采取何种措施',
  `address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '住院或集中观察地址',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开展网格化服务管理情况',
  `autoupdatetime` datetime(0) NULL DEFAULT NULL COMMENT '自动更新时间',
  `is_transfer_HC` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否移交卫健委',
  `telephone_home` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机归属地',
  `distribute_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下发所属市县',
  `distribute_no` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下发数据批次',
  `check_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核查人',
  `check_tel` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核查人联系方式',
  `check_date` datetime(0) NULL DEFAULT NULL COMMENT '核查时间',
  `report_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上报人',
  `report_department` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上报人所属单位',
  `report_date` datetime(0) NOT NULL COMMENT '上报时间',
  `report_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上报状态',
  `belong_bureau` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属市局',
  `belong_sub_bureau` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属分局',
  `belong_police_station` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属派出所',
  `data_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据类型',
  `data_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据状态',
  `area_grid_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网格id',
  `area_point` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '坐标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT ' 创建者 ',
  `create_date` datetime(0) NOT NULL COMMENT ' 创建时间 ',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT ' 更新者 ',
  `update_date` datetime(0) NOT NULL COMMENT ' 更新时间 ',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT ' 备注信息 ',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT ' 删除标记 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '人员疫情表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
-- 修改防疫人员表上报时间 可以为空
ALTER TABLE `arjccm_std`.`ccm_people_antiepidemic` MODIFY COLUMN `report_date` datetime(0) NULL COMMENT '上报时间' AFTER `report_department`;

INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('ab598b21da684e35abc56fe9047934e7', '147dfc2b7fef4d009fb540de4c531df9', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,130200,147dfc2b7fef4d009fb540de4c531df9,', '编辑', 60, '', '', '', '0', 'pop:ccmPeopleAntiepidemic:edit', '1', '2020-02-14 11:03:30', '1', '2020-02-14 11:03:30', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('0845bf0e086d4727a5c21b96d2e8292a', '147dfc2b7fef4d009fb540de4c531df9', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,130200,147dfc2b7fef4d009fb540de4c531df9,', '显示', 30, '', '', '', '0', 'pop:ccmPeopleAntiepidemic:view', '1', '2020-02-14 11:02:54', '1', '2020-02-14 11:02:54', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('147dfc2b7fef4d009fb540de4c531df9', '130200', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,130200,', '疫情人口管理', 320, '/pop/ccmPeopleAntiepidemic/', '', '', '1', '', '1', '2020-02-14 10:57:46', '1', '2020-02-14 10:57:46', '/pop/ccmPeopleAntiepidemic/', '0');

INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('332b2069a0fa4fdda369090e75b55f50', '5', '无', 'sys_ccm_people_takeSteps', '采取何种措施', 50, '0', '1', '2020-02-14 13:54:27', '1', '2020-02-14 13:54:27', '', '0');
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('1a4aa290087e495887979e6c4fbad052', '4', '医院隔离', 'sys_ccm_people_takeSteps', '采取何种措施', 40, '0', '1', '2020-02-14 13:53:37', '1', '2020-02-14 13:53:54', '', '0');
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('2f6a85b3f13a4973b8eb5a6bce4acbbe', '3', '确诊住院', 'sys_ccm_people_takeSteps', '采取何种措施', 30, '0', '1', '2020-02-14 13:53:15', '1', '2020-02-14 13:53:15', '', '0');
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('84c4ecea474b43fc81b523c52c7eb5e1', '2', '留观点隔离', 'sys_ccm_people_takeSteps', '采取何种措施', 20, '0', '1', '2020-02-14 13:52:51', '1', '2020-02-14 13:52:51', '', '0');
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('f04ee3eb4ef749d89cdba67c014562bf', '1', '居家隔离', 'sys_ccm_people_takeSteps', '采取何种措施', 10, '0', '1', '2020-02-14 13:52:20', '1', '2020-02-14 13:52:20', '', '0');
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('31285b387f1a4218a2641745dc354f6b', '2', '非正常', 'sys_ccm_people_health', '身体状况', 20, '0', '1', '2020-02-14 13:48:39', '1', '2020-02-14 13:50:14', '', '0');
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('ddb09d555a0e442bbd1f15ad8016ad9e', '1', '正常', 'sys_ccm_people_health', '身体状况', 10, '0', '1', '2020-02-14 13:48:23', '1', '2020-02-14 13:50:07', '', '0');

-- 宗教活动表  by lgh 2020-2-15
DROP TABLE IF EXISTS `ccm_religion_activity`;
CREATE TABLE `ccm_religion_activity`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 唯一主键ID，设备编号（自增） ',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 创建者 ',
  `create_date` datetime(0) NOT NULL COMMENT ' 发生时间 ',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 更新者 ',
  `update_date` datetime(0) NOT NULL COMMENT ' 更新时间 ',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 描述信息 ',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 删除标记 ',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 活动名称',
  `begin_date` datetime(0) NOT NULL COMMENT ' 开始日期',
  `host` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 活动主办方',
  `address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 活动地点',
  `head` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 活动负责人',
  `head_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 负责人身份证号码',
  `head_phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 负责人联系方式',
  `number` int(5) NULL DEFAULT NULL COMMENT ' 活动参加人数',
  `scale` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 活动规模',
  `type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 活动类型',
  `end_date` datetime(0) NULL DEFAULT NULL COMMENT ' 结束日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '宗教活动表' ROW_FORMAT = Dynamic;

-- 宗教活动菜单添加
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('37646ca5abb04f10996bb5496d5aca89', '70a1747ee8334e439b2b24ebe947ecdd', '0,1,70a1747ee8334e439b2b24ebe947ecdd,', '宗教管理', 170, '', '', 'changsuoguanli', '1', '', '1', '2020-01-09 17:33:25', '1', '2020-02-11 15:51:56', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('0bcfc59423be498f841988d3784a5122', 'ae07897b04e64a51aba817372fa7f60d', '0,1,70a1747ee8334e439b2b24ebe947ecdd,37646ca5abb04f10996bb5496d5aca89,ae07897b04e64a51aba817372fa7f60d,', '查看', 30, '', '', '', '0', 'religion:ccmReligionActivity:view', '1', '2020-02-11 14:22:16', '1', '2020-02-11 14:22:16', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('285941b93e174dc2bcd43bb4e4e71ae9', 'ac1835c14d60461893787620ca94560d', '0,1,70a1747ee8334e439b2b24ebe947ecdd,37646ca5abb04f10996bb5496d5aca89,ac1835c14d60461893787620ca94560d,', '编辑', 60, '', '', '', '1', 'religion:ccmPlaceReligion:edit', '1', '2020-02-11 15:54:20', '1', '2020-02-11 15:54:20', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('63626f0f77de452baf600bac846835f6', 'ae07897b04e64a51aba817372fa7f60d', '0,1,70a1747ee8334e439b2b24ebe947ecdd,37646ca5abb04f10996bb5496d5aca89,ae07897b04e64a51aba817372fa7f60d,', '编辑', 60, '', '', '', '0', 'religion:ccmReligionActivity:edit', '1', '2020-02-11 14:22:53', '1', '2020-02-11 14:22:53', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('ac1835c14d60461893787620ca94560d', '37646ca5abb04f10996bb5496d5aca89', '0,1,70a1747ee8334e439b2b24ebe947ecdd,37646ca5abb04f10996bb5496d5aca89,', '场所管理', 30, '/religion/ccmPlaceReligion/list1', '', '', '1', '', '1', '2020-02-11 15:50:05', '1', '2020-02-11 15:54:58', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('ae07897b04e64a51aba817372fa7f60d', '37646ca5abb04f10996bb5496d5aca89', '0,1,70a1747ee8334e439b2b24ebe947ecdd,37646ca5abb04f10996bb5496d5aca89,', '活动管理', 60, '/religion/ccmReligionActivity', '', '', '1', '', '1', '2020-02-11 14:20:02', '1', '2020-02-11 15:47:54', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('e62501f884c9421b9da25812306bcd23', 'ac1835c14d60461893787620ca94560d', '0,1,70a1747ee8334e439b2b24ebe947ecdd,37646ca5abb04f10996bb5496d5aca89,ac1835c14d60461893787620ca94560d,', '查看', 30, '', '', '', '0', 'religion:ccmPlaceReligion:view', '1', '2020-02-11 15:53:46', '1', '2020-02-11 15:53:46', '', '0');

-- 宗教活动相关字典添加
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('3ba87bc99b5d4e7b88873f052f4c0bdc', '05', '斋戒', 'ccm_activity_type', '宗教活动类别', 50, '0', '1', '2020-02-11 11:46:16', '1', '2020-02-11 11:46:16', '', '0');
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('539256fcf3684500b00ac341dab26c6f', '06', '放生', 'ccm_activity_type', '宗教活动类别', 60, '0', '1', '2020-02-11 11:46:35', '1', '2020-02-11 11:46:35', '', '0');
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('5540c1fc36b344f2bbc1850092cd7902', '04', '忏悔', 'ccm_activity_type', '宗教活动类别', 40, '0', '1', '2020-02-11 11:45:21', '1', '2020-02-11 11:45:21', '', '0');
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('5b25315a99564f0aa42699aff08b510c', '01', '祈祷', 'ccm_activity_type', '宗教活动类别', 10, '0', '1', '2020-02-11 11:43:57', '1', '2020-02-11 11:43:57', '', '0');
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('a693f62b4ef94970919cb000eec6f959', '03', '祭祀', 'ccm_activity_type', '宗教活动类别', 30, '0', '1', '2020-02-11 11:45:03', '1', '2020-02-11 11:45:03', '', '0');
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('ec833e8808db4e58862e6ac085efbecd', '02', '讲经', 'ccm_activity_type', '宗教活动类别', 20, '0', '1', '2020-02-11 11:44:28', '1', '2020-02-11 11:45:03', '', '0');
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('2bf14129804c4654a39e1e5b32072502', '01', '小型活动', 'ccm_activity_scale', '宗教活动规模', 10, '0', '1', '2020-02-11 11:40:30', '1', '2020-02-11 11:40:30', '', '0');
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('3c48b5e11380495d9ea5af05054835c4', '03', '大型活动', 'ccm_activity_scale', '宗教活动规模', 30, '0', '1', '2020-02-11 11:41:57', '1', '2020-02-11 11:41:57', '', '0');
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('da78908ad40b4c05a5b7c4ce14dc1449', '02', '中型活动', 'ccm_activity_scale', '宗教活动规模', 20, '0', '1', '2020-02-11 11:41:27', '1', '2020-02-11 11:41:27', '', '0');
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('ece82fc7fe7d41339ad7766453272893', '04', '特大型活动', 'ccm_activity_scale', '宗教活动规模', 40, '0', '1', '2020-02-11 11:42:29', '1', '2020-02-11 11:42:29', '', '0');

-- 防疫人员年龄段数据字典
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('77d72024587e4fcd9051c8ca5142b932', '4', '60以上老年', 'sys_ccm_peopleantiepidemic_age', '防疫人员年龄段', 40, '0', '1', '2020-02-15 16:36:32', '1', '2020-02-15 16:36:32', '', '0');
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('88eaf32ca3f74be1bc81fb75e95d714b', '3', '30-60中青年', 'sys_ccm_peopleantiepidemic_age', '防疫人员年龄段', 30, '0', '1', '2020-02-15 16:35:47', '1', '2020-02-15 16:35:47', '', '0');
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('3870d830366748cda49cccb6a9670bcc', '2', '18-30岁青年', 'sys_ccm_peopleantiepidemic_age', '防疫人员年龄段', 20, '0', '1', '2020-02-15 16:34:47', '1', '2020-02-15 16:34:47', '', '0');
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('cb6097a1aca64237a9a09c93d1129398', '1', '18岁以下少年儿童', 'sys_ccm_peopleantiepidemic_age', '防疫人员年龄段', 10, '0', '1', '2020-02-15 16:33:17', '1', '2020-02-15 16:33:17', '', '0');

-- 防疫人员上报状态数据字典
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('77d22024584e4fcd7051c8c7143b922', '3', '核销上报', 'sys_ccm_peopleantiepidemic_upload', '防疫人员上报状态', 3, '0', '1', '2020-02-15 16:36:32', '1', '2020-02-15 16:36:32', '', '0');
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('88rcf3ca3f74be1b81fb75e95r6171', '2', '已上报', 'sys_ccm_peopleantiepidemic_upload', '防疫人员上报状态', 2, '0', '1', '2020-02-15 16:37:47', '1', '2020-02-15 16:35:47', '', '0');
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('3878d73035674tcxa4iccct6a96r0bic', '1', '待上报', 'sys_ccm_peopleantiepidemic_upload', '防疫人员上报状态', 1, '0', '1', '2020-02-15 16:24:47', '1', '2020-02-15 16:34:47', '', '0');










-- 三亚新型冠状病毒肺炎疫情管控平台
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('e2cfcfc331e547e79f7f78b4171e4adf', '1', '0,1,', '三亚新型冠状病毒肺炎疫情管控平台', 330, '/sys/map/antiepidemicCool', '', 'adjust', '1', '', '1', '2020-02-16 22:20:17', '1', '2020-02-16 22:34:43', '', '0');

-- 娱乐场所菜单
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('08c03e218688482aaf78a767f984a278', '9f4cf25881d94483b18b0d61568c6da5', '0,1,70a1747ee8334e439b2b24ebe947ecdd,65c0dc1f31654a32b4a4e5213d3fe865,9f4cf25881d94483b18b0d61568c6da5,', '剧院', 270, '/casino/ccmPlaceCasino/05', '', '', '1', '', '1', '2019-12-02 11:13:08', '1', '2019-12-03 10:56:02', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('273c45a14dcf491482a7c814a462e8af', '9f4cf25881d94483b18b0d61568c6da5', '0,1,70a1747ee8334e439b2b24ebe947ecdd,65c0dc1f31654a32b4a4e5213d3fe865,9f4cf25881d94483b18b0d61568c6da5,', '网吧', 120, '/casino/ccmPlaceCasino/02', '', 'desktop', '1', '', '1', '2019-11-22 17:52:55', '1', '2019-11-22 17:52:55', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('2d1b781a0a3b4d1c931a12d77b7689ae', '9f4cf25881d94483b18b0d61568c6da5', '0,1,70a1747ee8334e439b2b24ebe947ecdd,65c0dc1f31654a32b4a4e5213d3fe865,9f4cf25881d94483b18b0d61568c6da5,', '桑拿', 330, '/casino/ccmPlaceCasino/07', '', '', '1', '', '1', '2019-12-02 20:47:24', '1', '2019-12-03 10:56:33', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('55f2cff40c1a4d2c826fad338f2c9199', '9f4cf25881d94483b18b0d61568c6da5', '0,1,70a1747ee8334e439b2b24ebe947ecdd,65c0dc1f31654a32b4a4e5213d3fe865,9f4cf25881d94483b18b0d61568c6da5,', '歌舞厅', 150, '/casino/ccmPlaceCasino/03', '', '', '1', '', '1', '2019-12-02 10:54:04', '1', '2019-12-03 10:55:21', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('7f8878b85fda47b6a42c1d5cf9e79c64', '9f4cf25881d94483b18b0d61568c6da5', '0,1,70a1747ee8334e439b2b24ebe947ecdd,65c0dc1f31654a32b4a4e5213d3fe865,9f4cf25881d94483b18b0d61568c6da5,', '显示', 90, '', '', '', '0', 'casino:ccmPlaceCasino:view', '1', '2019-04-25 16:25:38', '1', '2019-04-25 16:25:38', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('8d899083de3841aba803c2ae625147ee', '9f4cf25881d94483b18b0d61568c6da5', '0,1,70a1747ee8334e439b2b24ebe947ecdd,65c0dc1f31654a32b4a4e5213d3fe865,9f4cf25881d94483b18b0d61568c6da5,', '编辑', 60, '', '', '', '0', 'casino:ccmPlaceCasino:edit', '1', '2019-04-25 16:24:49', '1', '2019-04-25 16:24:49', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('d95b646a01a9490586497fbde411ba70', '9f4cf25881d94483b18b0d61568c6da5', '0,1,70a1747ee8334e439b2b24ebe947ecdd,65c0dc1f31654a32b4a4e5213d3fe865,9f4cf25881d94483b18b0d61568c6da5,', '礼堂', 300, '/casino/ccmPlaceCasino/06', '', '', '1', '', '1', '2019-12-02 11:49:03', '1', '2019-12-03 10:56:18', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('e207e41412704f11bafbe6c4593d85e2', '9f4cf25881d94483b18b0d61568c6da5', '0,1,70a1747ee8334e439b2b24ebe947ecdd,65c0dc1f31654a32b4a4e5213d3fe865,9f4cf25881d94483b18b0d61568c6da5,', '电影院', 180, '/casino/ccmPlaceCasino/04', '', '', '1', '', '1', '2019-12-02 10:54:50', '1', '2019-12-03 10:55:35', '', '0');
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('e94863e4ba584100a6e2815142ab0571', '9f4cf25881d94483b18b0d61568c6da5', '0,1,70a1747ee8334e439b2b24ebe947ecdd,65c0dc1f31654a32b4a4e5213d3fe865,9f4cf25881d94483b18b0d61568c6da5,', '沐足', 360, '/casino/ccmPlaceCasino/08', '', '', '1', '', '1', '2019-12-02 20:47:57', '1', '2019-12-03 10:56:51', '', '0');



-- 从业人员场所 企业中间表 by yiqignxuan 2020-03-01
DROP TABLE IF EXISTS `ccm_place_org_people`;
CREATE TABLE `ccm_place_org_people`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `place_org_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '场所或企业id',
  `people_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人员id',
  `type` bigint(2) NULL DEFAULT NULL COMMENT '1，场所2，企业',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 创建者 ',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT ' 创建时间 ',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 更新者 ',
  `update_date` datetime(0) NOT NULL COMMENT ' 更新时间 ',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 备注信息 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;



--菜单表新增图标名
UPDATE sys_menu SET icon = "dashujuzhanshi" WHERE id="1c67672c043e428db50f772af0eb01c5"

--字典名称修改
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('39102', 'ccm_house_release', '安置帮教人员', 'ccm_log_tail_table', '跟踪信息关联表', 2, '0', '1', '2018-01-23 15:36:51', '1', '2018-01-24 10:09:36', '', '0');


--修改COUNT_RECORD_amount_init统计存储过程
BEGIN
    DECLARE DT_DATE DATETIME;
		DECLARE AREA_ID VARCHAR(64);
		DECLARE AREA_TYPE VARCHAR(1);
		DECLARE DONE INT DEFAULT FALSE;
		DECLARE COUNT INT;

		DECLARE CUR CURSOR FOR SELECT id,type from sys_area WHERE del_flag = 0 AND (type = '5' OR type = '6' OR type = '7');

		DECLARE CONTINUE HANDLER FOR NOT FOUND SET DONE = TRUE;

		SET DT_DATE = last_day(curdate());

		OPEN CUR;
		SELECT COUNT(*) INTO COUNT FROM ccm_people_amount RS WHERE RS.amount_date = DT_DATE AND del_flag = '0';

		READ_LOOP:LOOP
			FETCH CUR INTO AREA_ID, AREA_TYPE;
			IF DONE THEN
				LEAVE READ_LOOP;
			END IF;
			IF COUNT = 0 THEN
				IF AREA_TYPE = '7' THEN
					INSERT INTO ccm_people_amount(id, area_id, amount_date,system_level, create_by, create_date, update_by, update_date, del_flag) VALUES (UUID(), AREA_ID, DT_DATE,0,'1', NOW(), '1', NOW(), '0');
				ELSEIF AREA_TYPE = '6' THEN
					INSERT INTO ccm_people_amount(id, area_id, amount_date,system_level, create_by, create_date, update_by, update_date, del_flag) VALUES (UUID(), AREA_ID, DT_DATE,1,'1', NOW(), '1', NOW(), '0');
				ELSE
					INSERT INTO ccm_people_amount(id, area_id, amount_date,system_level, create_by, create_date, update_by, update_date, del_flag) VALUES (UUID(), AREA_ID, DT_DATE,2,'1', NOW(), '1', NOW(), '0');
				END IF;
			ELSE
				UPDATE ccm_people_amount SET update_date = NOW() WHERE area_id = AREA_ID AND del_flag = '0';
			END IF;
		END LOOP;
		CLOSE CUR;

		commit;
		SET DONE = FALSE;

END

--修改COUNT_RECORD_peopleAmount统计存储过程
BEGIN

-- 人口类型：户籍
		UPDATE ccm_people_amount a
		INNER JOIN (
			SELECT
				area_grid_id,
				count(id) AS I_STAT_COUNT_1
			FROM
				ccm_people
			WHERE
				del_flag = 0
				AND type = '10'
			GROUP BY
				area_grid_id
		) AS b ON b.area_grid_id = a.area_id
		SET a.person_amount = b.I_STAT_COUNT_1
		WHERE a.area_id = b.area_grid_id AND a.amount_date = last_day(curdate()) AND a.del_flag = '0';

		commit;

-- 人口类型：流动
		UPDATE ccm_people_amount a
		INNER JOIN (
			SELECT
				area_grid_id,
				count(id) AS I_STAT_COUNT_1
			FROM
				ccm_people
			WHERE
				del_flag = 0
				AND type = '20'
			GROUP BY
				area_grid_id
		) AS b ON b.area_grid_id = a.area_id
		SET a.float_amount = b.I_STAT_COUNT_1
		WHERE a.area_id = b.area_grid_id AND a.amount_date = last_day(curdate()) AND a.del_flag = '0';

		commit;

-- 人口类型：外籍
		UPDATE ccm_people_amount a
		INNER JOIN (
			SELECT
				area_grid_id,
				count(id) AS I_STAT_COUNT_1
			FROM
				ccm_people
			WHERE
				del_flag = 0
				AND type = '30'
			GROUP BY
				area_grid_id
		) AS b ON b.area_grid_id = a.area_id
		SET a.oversea_amount = b.I_STAT_COUNT_1
		WHERE a.area_id = b.area_grid_id AND a.amount_date = last_day(curdate()) AND a.del_flag = '0';

		commit;

-- 人口类型：未落户
		UPDATE ccm_people_amount a
		INNER JOIN (
			SELECT
				area_grid_id,
				count(id) AS I_STAT_COUNT_1
			FROM
				ccm_people
			WHERE
				del_flag = 0
				AND type = '40'
			GROUP BY
				area_grid_id
		) AS b ON b.area_grid_id = a.area_id
		SET a.unsettle_amount = b.I_STAT_COUNT_1
		WHERE a.area_id = b.area_grid_id AND a.amount_date = last_day(curdate()) AND a.del_flag = '0';

		commit;


-- 特殊人群
    UPDATE ccm_people_amount a
		INNER JOIN (
			SELECT
				area_grid_id,
				sum(is_behind) AS I_STAT_COUNT_1,
				sum(is_release) AS I_STAT_COUNT_2,
				sum(is_rectification) AS I_STAT_COUNT_3,
				sum(is_aids) AS I_STAT_COUNT_4,
				sum(is_psychogeny) AS I_STAT_COUNT_5,
				sum(is_kym) AS I_STAT_COUNT_6,
				sum(is_drugs) AS I_STAT_COUNT_7,
				sum(is_visit) AS I_STAT_COUNT_8,
				sum(is_dangerous) AS I_STAT_COUNT_9,
				sum(is_heresy) AS I_STAT_COUNT_10,
				count(special_care_type) AS I_STAT_COUNT_11
			FROM
				ccm_people
			WHERE
				del_flag = 0
			GROUP BY
				area_grid_id
		) AS b ON b.area_grid_id = a.area_id
		SET a.behind_amount = b.I_STAT_COUNT_1,
		 a.release_amount = b.I_STAT_COUNT_2,
		 a.rectification_amount = b.I_STAT_COUNT_3,
		 a.aids_amount = b.I_STAT_COUNT_4,
		 a.psychogeny_amount = b.I_STAT_COUNT_5,
		 a.kym_amount = b.I_STAT_COUNT_6,
		 a.drugs_amount = b.I_STAT_COUNT_7,
		 a.visit_amount = b.I_STAT_COUNT_8,
		 a.dangerous_amount = b.I_STAT_COUNT_9,
		 a.heresy_amount = b.I_STAT_COUNT_10,
		 a.care_amount = b.I_STAT_COUNT_11
		WHERE a.area_id = b.area_grid_id AND a.amount_date = last_day(curdate()) AND a.del_flag = '0';

		commit;


-- 党员
		UPDATE ccm_people_amount a
		INNER JOIN (
			SELECT
				area_grid_id,
				count(id) AS I_STAT_COUNT_1
			FROM
				ccm_people
			WHERE
				del_flag = 0
				AND politics = '01'
			GROUP BY
				area_grid_id
		) AS b ON b.area_grid_id = a.area_id
		SET a.communist_amount = b.I_STAT_COUNT_1
		WHERE a.area_id = b.area_grid_id AND a.amount_date = last_day(curdate()) AND a.del_flag = '0';

		commit;

-- 男性
		UPDATE ccm_people_amount a
		INNER JOIN (
			SELECT
				area_grid_id,
				count(id) AS I_STAT_COUNT_1
			FROM
				ccm_people
			WHERE
				del_flag = 0
				AND sex = '0'
			GROUP BY
				area_grid_id
		) AS b ON b.area_grid_id = a.area_id
		SET a.sex_male = b.I_STAT_COUNT_1
		WHERE a.area_id = b.area_grid_id AND a.amount_date = last_day(curdate()) AND a.del_flag = '0';

		commit;

-- 女性
		UPDATE ccm_people_amount a
		INNER JOIN (
			SELECT
				area_grid_id,
				count(id) AS I_STAT_COUNT_1
			FROM
				ccm_people
			WHERE
				del_flag = 0
				AND sex = '1'
			GROUP BY
				area_grid_id
		) AS b ON b.area_grid_id = a.area_id
		SET a.sex_female = b.I_STAT_COUNT_1
		WHERE a.area_id = b.area_grid_id AND a.amount_date = last_day(curdate()) AND a.del_flag = '0';

		commit;

-- 未说明性别
		UPDATE ccm_people_amount a
		INNER JOIN (
			SELECT
				area_grid_id,
				count(id) AS I_STAT_COUNT_1
			FROM
				ccm_people
			WHERE
				del_flag = 0
				AND (sex = '9' or sex = NULL)
			GROUP BY
				area_grid_id
		) AS b ON b.area_grid_id = a.area_id
		SET a.sex_unknow = b.I_STAT_COUNT_1
		WHERE a.area_id = b.area_grid_id AND a.amount_date = last_day(curdate()) AND a.del_flag = '0';

		commit;

-- 未婚男性
		UPDATE ccm_people_amount a
		INNER JOIN (
			SELECT
				area_grid_id,
				count(id) AS I_STAT_COUNT_1
			FROM
				ccm_people
			WHERE
				del_flag = 0
				AND sex = '0'
				AND marriage = '10'
			GROUP BY
				area_grid_id
		) AS b ON b.area_grid_id = a.area_id
		SET a.sex_male_single = b.I_STAT_COUNT_1
		WHERE a.area_id = b.area_grid_id AND a.amount_date = last_day(curdate()) AND a.del_flag = '0';

		commit;

-- 未婚女性
		UPDATE ccm_people_amount a
		INNER JOIN (
			SELECT
				area_grid_id,
				count(id) AS I_STAT_COUNT_1
			FROM
				ccm_people
			WHERE
				del_flag = 0
				AND sex = '1'
				AND marriage = '10'
			GROUP BY
				area_grid_id
		) AS b ON b.area_grid_id = a.area_id
		SET a.sex_female_single = b.I_STAT_COUNT_1
		WHERE a.area_id = b.area_grid_id AND a.amount_date = last_day(curdate()) AND a.del_flag = '0';

		commit;

-- 教育程度：博士
		UPDATE ccm_people_amount a
		INNER JOIN (
			SELECT
				area_grid_id,
				count(id) AS I_STAT_COUNT_1
			FROM
				ccm_people
			WHERE
				del_flag = 0
				AND education in ('11', '12', '13')
			GROUP BY
				area_grid_id
		) AS b ON b.area_grid_id = a.area_id
		SET a.edu_doctor = b.I_STAT_COUNT_1
		WHERE a.area_id = b.area_grid_id AND a.amount_date = last_day(curdate()) AND a.del_flag = '0';

		commit;

-- 教育程度：研究生
		UPDATE ccm_people_amount a
		INNER JOIN (
			SELECT
				area_grid_id,
				count(id) AS I_STAT_COUNT_1
			FROM
				ccm_people
			WHERE
				del_flag = 0
				AND education in ('14', '15', '16', '17', '18', '19')
			GROUP BY
				area_grid_id
		) AS b ON b.area_grid_id = a.area_id
		SET a.edu_master = b.I_STAT_COUNT_1
		WHERE a.area_id = b.area_grid_id AND a.amount_date = last_day(curdate()) AND a.del_flag = '0';

		commit;

-- 教育程度：大学
		UPDATE ccm_people_amount a
		INNER JOIN (
			SELECT
				area_grid_id,
				count(id) AS I_STAT_COUNT_1
			FROM
				ccm_people
			WHERE
				del_flag = 0
				AND education in ('20', '21', '22', '23', '30', '31', '32', '33')
			GROUP BY
				area_grid_id
		) AS b ON b.area_grid_id = a.area_id
		SET a.edu_college = b.I_STAT_COUNT_1
		WHERE a.area_id = b.area_grid_id AND a.amount_date = last_day(curdate()) AND a.del_flag = '0';

		commit;

-- 教育程度：高中
		UPDATE ccm_people_amount a
		INNER JOIN (
			SELECT
				area_grid_id,
				count(id) AS I_STAT_COUNT_1
			FROM
				ccm_people
			WHERE
				del_flag = 0
				AND education in ('40','91','92','93','41','42','43','44','45','46','47','48','49','60','61','62','63')
			GROUP BY
				area_grid_id
		) AS b ON b.area_grid_id = a.area_id
		SET a.edu_senior = b.I_STAT_COUNT_1
		WHERE a.area_id = b.area_grid_id AND a.amount_date = last_day(curdate()) AND a.del_flag = '0';

		commit;

-- 教育程度：初中及以下
		UPDATE ccm_people_amount a
		INNER JOIN (
			SELECT
				area_grid_id,
				count(id) AS I_STAT_COUNT_1
			FROM
				ccm_people
			WHERE
				del_flag = 0
				AND education = '50'
			GROUP BY
				area_grid_id
		) AS b ON b.area_grid_id = a.area_id
		SET a.edu_junior = b.I_STAT_COUNT_1
		WHERE a.area_id = b.area_grid_id AND a.amount_date = last_day(curdate()) AND a.del_flag = '0';

		commit;


-- 年龄结构：0-15年龄段
		UPDATE ccm_people_amount a
		INNER JOIN (
			SELECT
				area_grid_id,
				count(id) AS I_STAT_COUNT_1
			FROM
				ccm_people
			WHERE
				del_flag = 0
				AND birthday >= date_format( DATE_SUB(curdate(), INTERVAL 15 Year), '%Y-%m' )
			GROUP BY
				area_grid_id
		) AS b ON b.area_grid_id = a.area_id
		SET a.age_child = b.I_STAT_COUNT_1
		WHERE a.area_id = b.area_grid_id AND a.amount_date = last_day(curdate()) AND a.del_flag = '0';

		commit;

-- 年龄结构：16-40年龄段
		UPDATE ccm_people_amount a
		INNER JOIN (
			SELECT
				area_grid_id,
				count(id) AS I_STAT_COUNT_1
			FROM
				ccm_people
			WHERE
				del_flag = 0
				AND birthday >= date_format( DATE_SUB(curdate(), INTERVAL 40 Year), '%Y-%m' )
				AND birthday <= date_format( DATE_SUB(curdate(), INTERVAL 16 Year), '%Y-%m' )
			GROUP BY
				area_grid_id
		) AS b ON b.area_grid_id = a.area_id
		SET a.age_adult = b.I_STAT_COUNT_1
		WHERE a.area_id = b.area_grid_id AND a.amount_date = last_day(curdate()) AND a.del_flag = '0';

		commit;

-- 年龄结构：41-64年龄段
		UPDATE ccm_people_amount a
		INNER JOIN (
			SELECT
				area_grid_id,
				count(id) AS I_STAT_COUNT_1
			FROM
				ccm_people
			WHERE
				del_flag = 0
				AND birthday >= date_format( DATE_SUB(curdate(), INTERVAL 64 Year), '%Y-%m' )
				AND birthday <= date_format( DATE_SUB(curdate(), INTERVAL 41 Year), '%Y-%m' )
			GROUP BY
				area_grid_id
		) AS b ON b.area_grid_id = a.area_id
		SET a.age_middle = b.I_STAT_COUNT_1
		WHERE a.area_id = b.area_grid_id AND a.amount_date = last_day(curdate()) AND a.del_flag = '0';

		commit;

-- 年龄结构：65及以上年龄段
		UPDATE ccm_people_amount a
		INNER JOIN (
			SELECT
				area_grid_id,
				count(id) AS I_STAT_COUNT_1
			FROM
				ccm_people
			WHERE
				del_flag = 0
				AND birthday <= date_format( DATE_SUB(curdate(), INTERVAL 65 Year), '%Y-%m' )
			GROUP BY
				area_grid_id
		) AS b ON b.area_grid_id = a.area_id
		SET a.age_old = b.I_STAT_COUNT_1
		WHERE a.area_id = b.area_grid_id AND a.amount_date = last_day(curdate()) AND a.del_flag = '0';

		commit;

		UPDATE ccm_people_amount a SET a.older_amount = a.age_old WHERE a.amount_date = last_day(curdate()) AND a.del_flag = '0';

		commit;

-- 年龄结构：新生儿（1岁以内）
		UPDATE ccm_people_amount a
		INNER JOIN (
			SELECT
				area_grid_id,
				count(id) AS I_STAT_COUNT_1
			FROM
				ccm_people
			WHERE
				del_flag = 0
				AND birthday >= date_format( DATE_SUB(curdate(), INTERVAL 1 Year), '%Y-%m' )
			GROUP BY
				area_grid_id
		) AS b ON b.area_grid_id = a.area_id
		SET a.age_newborn = b.I_STAT_COUNT_1
		WHERE a.area_id = b.area_grid_id AND a.amount_date = last_day(curdate()) AND a.del_flag = '0';

		commit;

-- 关注程度：高
	  CALL COUNT_RECORD_peopleAttentType_high('01', '');
		commit;
-- 关注程度：中
	  CALL COUNT_RECORD_peopleAttentType_middle('02', '');
		commit;
-- 关注程度：低
	  CALL COUNT_RECORD_peopleAttentType_low('03', '');
		commit;

-- 人口类型：常住
		UPDATE ccm_people_amount a
		INNER JOIN (
			SELECT
				area_grid_id,
				count(id) AS I_STAT_COUNT_1
			FROM
				ccm_people
			WHERE
				del_flag = 0
				AND is_permanent = 1
			GROUP BY
				area_grid_id
		) AS b ON b.area_grid_id = a.area_id
		SET a.permanent_amount = b.I_STAT_COUNT_1
		WHERE a.area_id = b.area_grid_id AND a.amount_date = last_day(curdate()) AND a.del_flag = '0';

		commit;


-- 按街道汇总数据表本身的数据，网格 -> 社区
				UPDATE ccm_people_amount a
		INNER JOIN (
			SELECT
				sysArea.parent_id AS 'area_id',
				sum(p.person_amount) AS 'person_amount',
				sum(p.oversea_amount) AS 'oversea_amount',
				sum(p.float_amount) AS 'float_amount',
				sum(p.unsettle_amount) AS 'unsettle_amount',
				sum(p.aids_amount) AS 'aids_amount',
				sum(p.psychogeny_amount) AS 'psychogeny_amount',
				sum(p.rectification_amount) AS 'rectification_amount',
				sum(p.release_amount) AS 'release_amount',
				sum(p.drugs_amount) AS 'drugs_amount',
				sum(p.behind_amount) AS 'behind_amount',
				sum(p.kym_amount) AS 'kym_amount',
				sum(p.visit_amount) AS 'visit_amount',
				sum(p.heresy_amount) AS 'heresy_amount',
				sum(p.dangerous_amount) AS 'dangerous_amount',
				sum(p.care_amount) AS 'care_amount',
				sum(p.older_amount) AS 'older_amount',
				sum(p.communist_amount) AS 'communist_amount',
				sum(p.more1) AS 'more1',
				sum(p.more2) AS 'more2',
				sum(p.more3) AS 'more3',
				sum(p.age_child) AS 'age_child',
				sum(p.age_adult) AS 'age_adult',
				sum(p.age_middle) AS 'age_middle',
				sum(p.age_old) AS 'age_old',
				sum(p.age_newborn) AS 'age_newborn',
				sum(p.sex_male) AS 'sex_male',
				sum(p.sex_female) AS 'sex_female',
				sum(p.sex_unknow) AS 'sex_unknow',
				sum(p.sex_male_single) AS 'sex_male_single',
				sum(p.sex_female_single) AS 'sex_female_single',
				sum(p.edu_doctor) AS 'edu_doctor',
				sum(p.edu_master) AS 'edu_master',
				sum(p.edu_college) AS 'edu_college',
				sum(p.edu_senior) AS 'edu_senior',
				sum(p.edu_junior) AS 'edu_junior',
				sum(p.atte_high) AS 'atte_high',
				sum(p.atte_middle) AS 'atte_middle',
				sum(p.atte_low) AS 'atte_low'
			FROM
				ccm_people_amount p,
				sys_area sysArea
			WHERE
				p.area_id = sysArea.id
			AND p.system_level = '0'
			AND p.amount_date = last_day(curdate())
			AND p.del_flag = '0'
			GROUP BY
				sysArea.parent_id
		) AS b ON b.area_id = a.area_id
		SET
			a.person_amount = b.person_amount,
			a.oversea_amount = b.oversea_amount,
			a.float_amount = b.float_amount,
			a.unsettle_amount = b.unsettle_amount,
			a.aids_amount = b.aids_amount,
			a.psychogeny_amount = b.psychogeny_amount,
			a.rectification_amount = b.rectification_amount,
			a.release_amount = b.release_amount,
			a.drugs_amount = b.drugs_amount,
			a.behind_amount = b.behind_amount,
			a.kym_amount = b.kym_amount,
			a.visit_amount = b.visit_amount,
			a.heresy_amount = b.heresy_amount,
			a.dangerous_amount = b.dangerous_amount,
			a.care_amount = b.care_amount,
			a.older_amount = b.older_amount,
			a.communist_amount = b.communist_amount,
			a.more1 = b.more1,
			a.more2 = b.more2,
			a.more3 = b.more3,
			a.age_child = b.age_child,
			a.age_adult = b.age_adult,
			a.age_middle = b.age_middle,
			a.age_old = b.age_old,
			a.age_newborn = b.age_newborn,
			a.sex_male = b.sex_male,
			a.sex_female = b.sex_female,
			a.sex_unknow = b.sex_unknow,
			a.sex_male_single = b.sex_male_single,
			a.sex_female_single = b.sex_female_single,
			a.edu_doctor = b.edu_doctor,
			a.edu_master = b.edu_master,
			a.edu_college = b.edu_college,
			a.edu_senior = b.edu_senior,
			a.edu_junior = b.edu_junior,
			a.atte_high = b.atte_high,
			a.atte_middle = b.atte_middle,
			a.atte_low = b.atte_low
		WHERE a.area_id = b.area_id AND a.amount_date = last_day(curdate()) AND a.del_flag = '0';

		commit;



-- 按街道汇总数据表本身的数据，社区 -> 街道
				UPDATE ccm_people_amount a
		INNER JOIN (
			SELECT
				sysArea.parent_id AS 'area_id',
				sum(p.person_amount) AS 'person_amount',
				sum(p.oversea_amount) AS 'oversea_amount',
				sum(p.float_amount) AS 'float_amount',
				sum(p.unsettle_amount) AS 'unsettle_amount',
				sum(p.aids_amount) AS 'aids_amount',
				sum(p.psychogeny_amount) AS 'psychogeny_amount',
				sum(p.rectification_amount) AS 'rectification_amount',
				sum(p.release_amount) AS 'release_amount',
				sum(p.drugs_amount) AS 'drugs_amount',
				sum(p.behind_amount) AS 'behind_amount',
				sum(p.kym_amount) AS 'kym_amount',
				sum(p.visit_amount) AS 'visit_amount',
				sum(p.heresy_amount) AS 'heresy_amount',
				sum(p.dangerous_amount) AS 'dangerous_amount',
				sum(p.care_amount) AS 'care_amount',
				sum(p.older_amount) AS 'older_amount',
				sum(p.communist_amount) AS 'communist_amount',
				sum(p.more1) AS 'more1',
				sum(p.more2) AS 'more2',
				sum(p.more3) AS 'more3',
				sum(p.age_child) AS 'age_child',
				sum(p.age_adult) AS 'age_adult',
				sum(p.age_middle) AS 'age_middle',
				sum(p.age_old) AS 'age_old',
				sum(p.age_newborn) AS 'age_newborn',
				sum(p.sex_male) AS 'sex_male',
				sum(p.sex_female) AS 'sex_female',
				sum(p.sex_unknow) AS 'sex_unknow',
				sum(p.sex_male_single) AS 'sex_male_single',
				sum(p.sex_female_single) AS 'sex_female_single',
				sum(p.edu_doctor) AS 'edu_doctor',
				sum(p.edu_master) AS 'edu_master',
				sum(p.edu_college) AS 'edu_college',
				sum(p.edu_senior) AS 'edu_senior',
				sum(p.edu_junior) AS 'edu_junior',
				sum(p.atte_high) AS 'atte_high',
				sum(p.atte_middle) AS 'atte_middle',
				sum(p.atte_low) AS 'atte_low'
			FROM
				ccm_people_amount p,
				sys_area sysArea
			WHERE
				p.area_id = sysArea.id
			AND p.system_level = '1'
			AND p.amount_date = last_day(curdate())
			AND p.del_flag = '0'
			GROUP BY
				sysArea.parent_id
		) AS b ON b.area_id = a.area_id
		SET
			a.person_amount = b.person_amount,
			a.oversea_amount = b.oversea_amount,
			a.float_amount = b.float_amount,
			a.unsettle_amount = b.unsettle_amount,
			a.aids_amount = b.aids_amount,
			a.psychogeny_amount = b.psychogeny_amount,
			a.rectification_amount = b.rectification_amount,
			a.release_amount = b.release_amount,
			a.drugs_amount = b.drugs_amount,
			a.behind_amount = b.behind_amount,
			a.kym_amount = b.kym_amount,
			a.visit_amount = b.visit_amount,
			a.heresy_amount = b.heresy_amount,
			a.dangerous_amount = b.dangerous_amount,
			a.care_amount = b.care_amount,
			a.older_amount = b.older_amount,
			a.communist_amount = b.communist_amount,
			a.more1 = b.more1,
			a.more2 = b.more2,
			a.more3 = b.more3,
			a.age_child = b.age_child,
			a.age_adult = b.age_adult,
			a.age_middle = b.age_middle,
			a.age_old = b.age_old,
			a.age_newborn = b.age_newborn,
			a.sex_male = b.sex_male,
			a.sex_female = b.sex_female,
			a.sex_unknow = b.sex_unknow,
			a.sex_male_single = b.sex_male_single,
			a.sex_female_single = b.sex_female_single,
			a.edu_doctor = b.edu_doctor,
			a.edu_master = b.edu_master,
			a.edu_college = b.edu_college,
			a.edu_senior = b.edu_senior,
			a.edu_junior = b.edu_junior,
			a.atte_high = b.atte_high,
			a.atte_middle = b.atte_middle,
			a.atte_low = b.atte_low
		WHERE a.area_id = b.area_id AND a.amount_date = last_day(curdate()) AND a.del_flag = '0';

		commit;

END

--修改COUNT_RECORD_stat_init统计存储过程
BEGIN
    DECLARE DT_DATE DATETIME;
		DECLARE AREA_ID VARCHAR(64);
		DECLARE AREA_TYPE VARCHAR(1);
		DECLARE DONE INT DEFAULT FALSE;
		DECLARE COUNT INT;

		DECLARE CUR CURSOR FOR SELECT id,type from sys_area WHERE del_flag = 0 AND (type = '5' OR type = '6' OR type = '7');

		DECLARE CONTINUE HANDLER FOR NOT FOUND SET DONE = TRUE;

		SET DT_DATE = last_day(curdate());

		OPEN CUR;
		SELECT COUNT(*) INTO COUNT FROM ccm_people_stat RS WHERE RS.stat_date = DT_DATE AND del_flag = '0';

		READ_LOOP:LOOP
			FETCH CUR INTO AREA_ID, AREA_TYPE;
			IF DONE THEN
				LEAVE READ_LOOP;
			END IF;
			IF COUNT = 0 THEN
				IF AREA_TYPE = '7' THEN
					INSERT INTO ccm_people_stat(id, area_id, stat_date,system_level, create_by, create_date, update_by, update_date, del_flag) VALUES (UUID(), AREA_ID, DT_DATE,0, '1', NOW(), '1', NOW(), '0');
				ELSEIF AREA_TYPE = '6' THEN
					INSERT INTO ccm_people_stat(id, area_id, stat_date,system_level, create_by, create_date, update_by, update_date, del_flag) VALUES (UUID(), AREA_ID, DT_DATE,1, '1', NOW(), '1', NOW(), '0');
				ELSE
					INSERT INTO ccm_people_stat(id, area_id, stat_date,system_level, create_by, create_date, update_by, update_date, del_flag) VALUES (UUID(), AREA_ID, DT_DATE,2, '1', NOW(), '1', NOW(), '0');
				END IF;
			ELSE
				UPDATE ccm_people_stat SET update_date = NOW() WHERE area_id = AREA_ID AND del_flag = '0';
			END IF;
		END LOOP;
		CLOSE CUR;

		commit;
		SET DONE = FALSE;

END

--修改COUNT_RECORD_peopleStat_month统计存储过程
BEGIN
-- 本月新增数统计
-- 人口类型：户籍新增-迁入
		UPDATE ccm_people_stat a
		INNER JOIN (
			SELECT
				area_grid_id,
				count(id) AS I_STAT_COUNT_1
			FROM
				ccm_people
			WHERE
				del_flag = 0
				AND type = '10'
				AND create_date >= DATE_ADD(curdate(), INTERVAL - day(CURDATE()) + 1 day)
				AND person_type = '01'
			GROUP BY
				area_grid_id
		) AS b ON b.area_grid_id = a.area_id
		SET a.person_new = b.I_STAT_COUNT_1
		WHERE a.area_id = b.area_grid_id AND a.stat_date = last_day(curdate()) AND a.del_flag = '0';

		commit;
-- 人口类型：户籍-迁出
		UPDATE ccm_people_stat a
		INNER JOIN (
			SELECT
				area_grid_id,
				count(id) AS I_STAT_COUNT_1
			FROM
				ccm_people
			WHERE
				del_flag = 0
				AND type = '10'
				AND person_time >= DATE_ADD(curdate(), INTERVAL - day(CURDATE()) + 1 day)
				AND person_type = '02'
			GROUP BY
				area_grid_id
		) AS b ON b.area_grid_id = a.area_id
		SET a.person_out = b.I_STAT_COUNT_1
		WHERE a.area_id = b.area_grid_id AND a.stat_date = last_day(curdate()) AND a.del_flag = '0';

		commit;


-- 人口类型：流动-流入
		UPDATE ccm_people_stat a
		INNER JOIN (
			SELECT
				area_grid_id,
				count(id) AS I_STAT_COUNT_1
			FROM
				ccm_people
			WHERE
				del_flag = 0
				AND type = '20'
				AND create_date >= DATE_ADD(curdate(), INTERVAL - day(CURDATE()) + 1 day)
			GROUP BY
				area_grid_id
		) AS b ON b.area_grid_id = a.area_id
		SET a.float_new = b.I_STAT_COUNT_1
		WHERE a.area_id = b.area_grid_id AND a.stat_date = last_day(curdate()) AND a.del_flag = '0';

		commit;

-- 人口类型：流动-流出
		UPDATE ccm_people_stat a
		INNER JOIN (
			SELECT
				area_grid_id,
				count(id) AS I_STAT_COUNT_1
			FROM
				ccm_people
			WHERE
				del_flag = 0
				AND time >= DATE_ADD(curdate(), INTERVAL - day(CURDATE()) + 1 day)
			GROUP BY
				area_grid_id
		) AS b ON b.area_grid_id = a.area_id
		SET a.float_out_new = b.I_STAT_COUNT_1
		WHERE a.area_id = b.area_grid_id AND a.stat_date = last_day(curdate()) AND a.del_flag = '0';

		commit;

-- 人口类型：外籍
		UPDATE ccm_people_stat a
		INNER JOIN (
			SELECT
				area_grid_id,
				count(id) AS I_STAT_COUNT_1
			FROM
				ccm_people
			WHERE
				del_flag = 0
				AND type = '30'
				AND create_date >= DATE_ADD(curdate(), INTERVAL - day(CURDATE()) + 1 day)
			GROUP BY
				area_grid_id
		) AS b ON b.area_grid_id = a.area_id
		SET a.oversea_new = b.I_STAT_COUNT_1
		WHERE a.area_id = b.area_grid_id AND a.stat_date = last_day(curdate()) AND a.del_flag = '0';

		commit;

-- 人口类型：未落户
		UPDATE ccm_people_stat a
		INNER JOIN (
			SELECT
				area_grid_id,
				count(id) AS I_STAT_COUNT_1
			FROM
				ccm_people
			WHERE
				del_flag = 0
				AND type = '40'
				AND create_date >= DATE_ADD(curdate(), INTERVAL - day(CURDATE()) + 1 day)
			GROUP BY
				area_grid_id
		) AS b ON b.area_grid_id = a.area_id
		SET a.unsettle_new = b.I_STAT_COUNT_1
		WHERE a.area_id = b.area_grid_id AND a.stat_date = last_day(curdate()) AND a.del_flag = '0';

		commit;


-- 特殊人群
    UPDATE ccm_people_stat a
		INNER JOIN (
			SELECT
				area_grid_id,
				sum(is_behind) AS I_STAT_COUNT_1,
				sum(is_release) AS I_STAT_COUNT_2,
				sum(is_rectification) AS I_STAT_COUNT_3,
				sum(is_aids) AS I_STAT_COUNT_4,
				sum(is_psychogeny) AS I_STAT_COUNT_5,
				sum(is_kym) AS I_STAT_COUNT_6,
				sum(is_drugs) AS I_STAT_COUNT_7,
				sum(is_visit) AS I_STAT_COUNT_8,
				sum(is_dangerous) AS I_STAT_COUNT_9,
				sum(is_heresy) AS I_STAT_COUNT_10,
				count(special_care_type) AS I_STAT_COUNT_11,
				sum(is_dispute) AS I_STAT_COUNT_12,
				sum(is_escape) AS I_STAT_COUNT_13,
				sum(is_harm_national) AS I_STAT_COUNT_14,
				sum(is_deliberately_illegal) AS I_STAT_COUNT_15,
				sum(is_criminal_offense) AS I_STAT_COUNT_16
			FROM
				ccm_people
			WHERE
				del_flag = 0
				AND create_date >= DATE_ADD(curdate(), INTERVAL - day(CURDATE()) + 1 day)
			GROUP BY
				area_grid_id
		) AS b ON b.area_grid_id = a.area_id
		SET a.behind_new = b.I_STAT_COUNT_1,
		 a.release_new = b.I_STAT_COUNT_2,
		 a.rectification_new = b.I_STAT_COUNT_3,
		 a.aids_new = b.I_STAT_COUNT_4,
		 a.psychogeny_new = b.I_STAT_COUNT_5,
		 a.kym_new = b.I_STAT_COUNT_6,
		 a.drugs_new = b.I_STAT_COUNT_7,
		 a.visit_new = b.I_STAT_COUNT_8,
		 a.dangerous_new = b.I_STAT_COUNT_9,
		 a.heresy_new = b.I_STAT_COUNT_10,
		 a.care_new = b.I_STAT_COUNT_11,
		 a.dispute_new = b.I_STAT_COUNT_12,
		 a.escape_new = b.I_STAT_COUNT_13,
		 a.harmNational_new = b.I_STAT_COUNT_14,
		 a.deliberatelyIllegal_new = b.I_STAT_COUNT_15,
		 a.seriousCriminalOffense_new = b.I_STAT_COUNT_16
		WHERE a.area_id = b.area_grid_id AND a.stat_date = last_day(curdate()) AND a.del_flag = '0';

		commit;


-- 党员
		UPDATE ccm_people_stat a
		INNER JOIN (
			SELECT
				area_grid_id,
				count(id) AS I_STAT_COUNT_1
			FROM
				ccm_people
			WHERE
				del_flag = 0
				AND politics = '01'
				AND create_date >= DATE_ADD(curdate(), INTERVAL - day(CURDATE()) + 1 day)
			GROUP BY
				area_grid_id
		) AS b ON b.area_grid_id = a.area_id
		SET a.communist_new = b.I_STAT_COUNT_1
		WHERE a.area_id = b.area_grid_id AND a.stat_date = last_day(curdate()) AND a.del_flag = '0';

		commit;

-- 年龄结构：65及以上年龄段
		UPDATE ccm_people_stat a
		INNER JOIN (
			SELECT
				area_grid_id,
				count(id) AS I_STAT_COUNT_1
			FROM
				ccm_people
			WHERE
				del_flag = 0
				AND birthday <= date_format( DATE_SUB(curdate(), INTERVAL 65 Year), '%Y-%m' )
				AND create_date >= DATE_ADD(curdate(), INTERVAL - day(CURDATE()) + 1 day)
			GROUP BY
				area_grid_id
		) AS b ON b.area_grid_id = a.area_id
		SET a.older_new = b.I_STAT_COUNT_1
		WHERE a.area_id = b.area_grid_id AND a.stat_date = last_day(curdate()) AND a.del_flag = '0';

		commit;

-- 按街道汇总数据表本身的数据，网格 -> 社区
		UPDATE ccm_people_stat a
		INNER JOIN (
			SELECT
				sysArea.parent_id AS 'area_id',
				sum(p.person_new) AS 'person_new',
				sum(p.person_out) AS 'person_out',
				sum(p.oversea_new) AS 'oversea_new',
				sum(p.float_new) AS 'float_new',
				sum(p.float_out_new) AS 'float_out_new',
				sum(p.unsettle_new) AS 'unsettle_new',
				sum(p.aids_new) AS 'aids_new',
				sum(p.psychogeny_new) AS 'psychogeny_new',
				sum(p.rectification_new) AS 'rectification_new',
				sum(p.release_new) AS 'release_new',
				sum(p.drugs_new) AS 'drugs_new',
				sum(p.behind_new) AS 'behind_new',
				sum(p.kym_new) AS 'kym_new',
				sum(p.visit_new) AS 'visit_new',
				sum(p.heresy_new) AS 'heresy_new',
				sum(p.dangerous_new) AS 'dangerous_new',
				sum(p.care_new) AS 'care_new',
				sum(p.older_new) AS 'older_new',
				sum(p.communist_new) AS 'communist_new',
				sum(p.permanent_new) AS 'permanent_new',
				sum(p.more1) AS 'more1',
				sum(p.more2) AS 'more2',
				sum(p.more3) AS 'more3'
			FROM
				ccm_people_stat p,
				sys_area sysArea
			WHERE
				p.area_id = sysArea.id
			AND p.system_level = '0'
			AND p.stat_date = last_day(curdate())
			AND p.del_flag = '0'
			GROUP BY
				sysArea.parent_id
		) AS b ON b.area_id = a.area_id
		SET
			a.person_new = b.person_new,
			a.person_out = b.person_out,
			a.oversea_new = b.oversea_new,
			a.float_new = b.float_new,
			a.float_out_new = b.float_out_new,
			a.unsettle_new = b.unsettle_new,
			a.aids_new = b.aids_new,
			a.psychogeny_new = b.psychogeny_new,
			a.rectification_new = b.rectification_new,
			a.release_new = b.release_new,
			a.drugs_new = b.drugs_new,
			a.behind_new = b.behind_new,
			a.kym_new = b.kym_new,
			a.visit_new = b.visit_new,
			a.heresy_new = b.heresy_new,
			a.dangerous_new = b.dangerous_new,
			a.care_new = b.care_new,
			a.older_new = b.older_new,
			a.communist_new = b.communist_new,
			a.permanent_new = b.permanent_new,
			a.more1 = b.more1,
			a.more2 = b.more2,
			a.more3 = b.more3
		WHERE a.area_id = b.area_id AND a.stat_date = last_day(curdate()) AND a.del_flag = '0';
		commit;

-- 按街道汇总数据表本身的数据，社区 -> 街道
		UPDATE ccm_people_stat a
		INNER JOIN (
			SELECT
				sysArea.parent_id AS 'area_id',
				sum(p.person_new) AS 'person_new',
				sum(p.person_out) AS 'person_out',
				sum(p.oversea_new) AS 'oversea_new',
				sum(p.float_new) AS 'float_new',
				sum(p.float_out_new) AS 'float_out_new',
				sum(p.unsettle_new) AS 'unsettle_new',
				sum(p.aids_new) AS 'aids_new',
				sum(p.psychogeny_new) AS 'psychogeny_new',
				sum(p.rectification_new) AS 'rectification_new',
				sum(p.release_new) AS 'release_new',
				sum(p.drugs_new) AS 'drugs_new',
				sum(p.behind_new) AS 'behind_new',
				sum(p.kym_new) AS 'kym_new',
				sum(p.visit_new) AS 'visit_new',
				sum(p.heresy_new) AS 'heresy_new',
				sum(p.dangerous_new) AS 'dangerous_new',
				sum(p.care_new) AS 'care_new',
				sum(p.older_new) AS 'older_new',
				sum(p.communist_new) AS 'communist_new',
				sum(p.permanent_new) AS 'permanent_new',
				sum(p.more1) AS 'more1',
				sum(p.more2) AS 'more2',
				sum(p.more3) AS 'more3'
			FROM
				ccm_people_stat p,
				sys_area sysArea
			WHERE
				p.area_id = sysArea.id
			AND p.system_level = '1'
			AND p.stat_date = last_day(curdate())
			AND p.del_flag = '0'
			GROUP BY
				sysArea.parent_id
		) AS b ON b.area_id = a.area_id
		SET
			a.person_new = b.person_new,
			a.person_out = b.person_out,
			a.oversea_new = b.oversea_new,
			a.float_new = b.float_new,
			a.float_out_new = b.float_out_new,
			a.unsettle_new = b.unsettle_new,
			a.aids_new = b.aids_new,
			a.psychogeny_new = b.psychogeny_new,
			a.rectification_new = b.rectification_new,
			a.release_new = b.release_new,
			a.drugs_new = b.drugs_new,
			a.behind_new = b.behind_new,
			a.kym_new = b.kym_new,
			a.visit_new = b.visit_new,
			a.heresy_new = b.heresy_new,
			a.dangerous_new = b.dangerous_new,
			a.care_new = b.care_new,
			a.older_new = b.older_new,
			a.communist_new = b.communist_new,
			a.permanent_new = b.permanent_new,
			a.more1 = b.more1,
			a.more2 = b.more2,
			a.more3 = b.more3
		WHERE a.area_id = b.area_id AND a.stat_date = last_day(curdate()) AND a.del_flag = '0';
		commit;


-- 人口类型：常住
		UPDATE ccm_people_stat a
		INNER JOIN (
			SELECT
				area_grid_id,
				count(id) AS I_STAT_COUNT_1
			FROM
				ccm_people
			WHERE
				del_flag = 0
				AND is_permanent = 1
				AND create_date >= DATE_ADD(curdate(), INTERVAL - day(CURDATE()) + 1 day)
			GROUP BY
				area_grid_id
		) AS b ON b.area_grid_id = a.area_id
		SET a.permanent_new = b.I_STAT_COUNT_1
		WHERE a.area_id = b.area_grid_id AND a.stat_date = last_day(curdate()) AND a.del_flag = '0';

		commit;

END


-- 宗教场所字段信新增
alter table ccm_place_religion add is_monitor varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子围栏id';
alter table ccm_place_religion add is_pass varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子围栏id';
alter table ccm_place_religion add is_annihilator varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子围栏id';
alter table ccm_place_religion add is_sign varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子围栏id';
alter table ccm_place_religion add is_lighting varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子围栏id';


-- 出库类别新增字典
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('2b16c4aa1d3c494bbc11e423eba1d7e2','12','调拨','plm_out_type','出库类别','11','0','1','2020-03-25 13:44:27','1','2020-03-25 13:44:27','','0');
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('a1dabe7a5bfe48b3a368f34ed38bfa7f','13','自用','plm_out_type','出库类别','12','0','1','2020-03-25 13:44:50','1','2020-03-25 13:44:50','','0');
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('473943ee6da04a89b7ef31cf4e354b22','14','其他','plm_out_type','出库类别','13','0','1','2020-03-25 13:45:07','1','2020-03-25 13:45:07','','0');



-- 增加绩效考核季度字段
ALTER TABLE `kpi_goal_years`
ADD COLUMN `quarter` varchar(32) NULL COMMENT '季度' AFTER `years`;

-- 增加季度数据字典
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('2531722e8b064681b0775a66f56a34a8', '4', '四季度', 'quarter', '四季度', 40, '0', '1', '2020-03-25 17:58:46', '1', '2020-03-25 17:58:46', '', '0');
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('7016c5c4ffca4fafbd9840bd0a8eba4f', '3', '三季度', 'quarter', '三季度', 30, '0', '1', '2020-03-25 17:58:24', '1', '2020-03-25 17:58:24', '', '0');
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('266d47e561834389861e87ac4587171e', '2', '二季度', 'quarter', '二季度', 20, '0', '1', '2020-03-25 17:57:58', '1', '2020-03-25 17:57:58', '', '0');
INSERT INTO `sys_dict`(`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('d9152f8848bc4a98ac6dd5fcc1f2b9b0', '1', '一季度', 'quarter', '一季度', 10, '0', '1', '2020-03-25 17:57:31', '1', '2020-03-25 17:57:31', '', '0');


-- 绩效目标管理菜单修改
UPDATE sys_menu SET parent_id = '50e6dcfe48414f87a68fda5a771fcff5', parent_ids = '0,1,6611617ad88549aabd105dc438b21f14,50e6dcfe48414f87a68fda5a771fcff5,', name = '部门绩效目标管理', href = '/scheme/kpiGoalYears', target = '', icon = '', sort = 30, is_show = '1', permission = '', update_by = '1', update_date = '2020-03-26 09:08:42.459', remarks = ''
 WHERE id = '293b99b15c83421696d93d48fa5f474a';

UPDATE sys_menu SET parent_id = '293b99b15c83421696d93d48fa5f474a', parent_ids = '0,1,6611617ad88549aabd105dc438b21f14,50e6dcfe48414f87a68fda5a771fcff5,293b99b15c83421696d93d48fa5f474a,'
 WHERE id = 'dc3173db6b344e9cb536724729acd471';

--  6  2020-03-26 09:08:42,522 DEBUG [modules.sys.dao.MenuDao.updateParentIds] - ==>
UPDATE sys_menu SET parent_id = '293b99b15c83421696d93d48fa5f474a', parent_ids = '0,1,6611617ad88549aabd105dc438b21f14,50e6dcfe48414f87a68fda5a771fcff5,293b99b15c83421696d93d48fa5f474a,'
 WHERE id = 'c58749fbcccf479f98625bf07b8a6a82';

-- 字典表数据修改
update sys_dict set label = '完成出库' where id = '50def344c97848fbbe43da829437b6c7';

update sys_dict set label = '季度排名' where id = '287f6ce3858a416d88e8948a58192094';
update sys_dict set label = '月度排名' where id = 'e54b3cdf0fb04025b3b307fbdda27c29';
update sys_dict set label = '年度排名' where id = 'fbcf969b2c58405da96304fd2000818d';

-- 新增重点人员同步到事件或消息配置修改
UPDATE `sys_config` SET `param_str` = NULL, `param_int` = 2, `param_date` = NULL, `table_name` = NULL, `obj_id` = NULL, `create_by` = '1', `create_date` = '2019-09-11 09:43:30', `update_by` = '1', `update_date` = '2019-09-11 09:43:30', `remarks` = '特殊人员添加触发事件和消息0关闭，1事件，2消息', `del_flag` = '0' WHERE `id` = 'special_personnel_event';

-- 修改实有人口菜单点击显示页面为统计页面
UPDATE `sys_menu` SET `parent_id` = '130200', `parent_ids` = '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,130200,', `name` = '实有人口管理', `sort` = 100, `href` = '/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatPerson', `target` = '', `icon` = '', `is_show` = '1', `permission` = '', `create_by` = '1', `create_date` = '2018-01-03 10:30:26', `update_by` = '1', `update_date` = '2020-03-27 14:17:07', `remarks` = '/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatPerson', `del_flag` = '0' WHERE `id` = Cast('e85d153e171e4dea97915a23bdb2dab7' AS Binary(32));
UPDATE `sys_menu` SET `parent_id` = 'b3b0c87bb91345bd93903fb7fa267b9d', `parent_ids` = '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,', `name` = '特殊关怀人员管理', `sort` = 520, `href` = '/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatCare', `target` = '', `icon` = 'shopping-cart', `is_show` = '1', `permission` = '', `create_by` = '1', `create_date` = '2018-03-05 13:42:36', `update_by` = '1', `update_date` = '2020-03-28 14:36:05', `remarks` = '/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatCare', `del_flag` = '0' WHERE `id` = Cast('7549b37b7c454434aadc05340cf041e4' AS Binary(32));
UPDATE `sys_menu` SET `parent_id` = 'b3b0c87bb91345bd93903fb7fa267b9d', `parent_ids` = '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,', `name` = '老年人管理', `sort` = 510, `href` = '/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatOlder', `target` = '', `icon` = 'shopping-cart', `is_show` = '1', `permission` = '', `create_by` = '1', `create_date` = '2018-03-05 13:43:08', `update_by` = '1', `update_date` = '2020-03-28 14:35:30', `remarks` = '/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatOlder', `del_flag` = '0' WHERE `id` = Cast('81349c6f45614556a51ad2626ea4e594' AS Binary(32));
UPDATE `sys_menu` SET `parent_id` = 'b3b0c87bb91345bd93903fb7fa267b9d', `parent_ids` = '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,', `name` = '留守人员管理', `sort` = 500, `href` = '/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatBehind', `target` = '', `icon` = 'shopping-cart', `is_show` = '1', `permission` = '', `create_by` = '1', `create_date` = '2018-01-06 10:36:11', `update_by` = '1', `update_date` = '2020-03-28 14:34:56', `remarks` = '/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatBehind', `del_flag` = '0' WHERE `id` = Cast('7cc0fb0c1187437aa3f4bad132c67ce1' AS Binary(32));
UPDATE `sys_menu` SET `parent_id` = 'b3b0c87bb91345bd93903fb7fa267b9d', `parent_ids` = '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,', `name` = '故意违法刑释不足5年', `sort` = 430, `href` = '/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatDeliberatelyIllegal', `target` = '', `icon` = 'warning-sign', `is_show` = '1', `permission` = '', `create_by` = '1', `create_date` = '2018-09-27 09:24:19', `update_by` = '1', `update_date` = '2020-03-28 14:33:50', `remarks` = '/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatDeliberatelyIllegal', `del_flag` = '0' WHERE `id` = Cast('37eaaa6f331b412b96a598b07431e3f6' AS Binary(32));
UPDATE `sys_menu` SET `parent_id` = 'b3b0c87bb91345bd93903fb7fa267b9d', `parent_ids` = '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,', `name` = '闹事行凶报复嫌疑', `sort` = 420, `href` = '/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatDispute', `target` = '', `icon` = 'warning-sign', `is_show` = '1', `permission` = '', `create_by` = '1', `create_date` = '2018-09-27 15:29:38', `update_by` = '1', `update_date` = '2020-03-28 14:32:46', `remarks` = '/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatDispute', `del_flag` = '0' WHERE `id` = Cast('0a5043def4f64ebe8227585015bb532c' AS Binary(32));
UPDATE `sys_menu` SET `parent_id` = 'b3b0c87bb91345bd93903fb7fa267b9d', `parent_ids` = '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,', `name` = '严重刑事犯罪活动嫌疑', `sort` = 410, `href` = '/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatSeriousCriminalOffense', `target` = '', `icon` = 'warning-sign', `is_show` = '1', `permission` = '', `create_by` = '1', `create_date` = '2018-09-12 10:11:32', `update_by` = '1', `update_date` = '2020-03-28 14:32:04', `remarks` = '/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatSeriousCriminalOffense', `del_flag` = '0' WHERE `id` = Cast('5698daba505f4dbaa6c84fa7f3812b28' AS Binary(32));
UPDATE `sys_menu` SET `parent_id` = 'b3b0c87bb91345bd93903fb7fa267b9d', `parent_ids` = '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,', `name` = '危害国家安全活动嫌疑', `sort` = 400, `href` = '/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatHarmNational', `target` = '', `icon` = 'warning-sign', `is_show` = '1', `permission` = '', `create_by` = '1', `create_date` = '2018-09-26 16:16:50', `update_by` = '1', `update_date` = '2020-03-28 14:31:19', `remarks` = '/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatHarmNational', `del_flag` = '0' WHERE `id` = Cast('b0c901671d894530b31e4f031763446d' AS Binary(32));
UPDATE `sys_menu` SET `parent_id` = 'b3b0c87bb91345bd93903fb7fa267b9d', `parent_ids` = '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,', `name` = '危险品从业人员管理', `sort` = 370, `href` = '/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatDangerous', `target` = '', `icon` = 'bell', `is_show` = '1', `permission` = '', `create_by` = '1', `create_date` = '2018-03-05 13:37:07', `update_by` = '1', `update_date` = '2020-03-28 14:30:27', `remarks` = '/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatDangerous', `del_flag` = '0' WHERE `id` = Cast('b0bceb9eabc744ee83bd75c7fb63f828' AS Binary(32));
UPDATE `sys_menu` SET `parent_id` = 'b3b0c87bb91345bd93903fb7fa267b9d', `parent_ids` = '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,', `name` = '涉教人员管理', `sort` = 360, `href` = '/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatHeresy', `target` = '', `icon` = 'bell', `is_show` = '1', `permission` = '', `create_by` = '1', `create_date` = '2018-03-05 13:35:53', `update_by` = '1', `update_date` = '2020-03-28 14:29:24', `remarks` = '/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatHeresy', `del_flag` = '0' WHERE `id` = Cast('c4d4f530c1a14671a89df623ed93adef' AS Binary(32));
UPDATE `sys_menu` SET `parent_id` = 'b3b0c87bb91345bd93903fb7fa267b9d', `parent_ids` = '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,', `name` = '重点上访人员管理', `sort` = 350, `href` = '/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatVisit', `target` = '', `icon` = 'bell', `is_show` = '1', `permission` = '', `create_by` = '1', `create_date` = '2018-03-05 13:34:27', `update_by` = '1', `update_date` = '2020-03-28 14:28:43', `remarks` = '/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatVisit', `del_flag` = '0' WHERE `id` = Cast('f15dc5be11f14cf8976090c38f27aaa3' AS Binary(32));
UPDATE `sys_menu` SET `parent_id` = 'b3b0c87bb91345bd93903fb7fa267b9d', `parent_ids` = '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,', `name` = '艾滋病危险人员管理', `sort` = 340, `href` = '/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatAids', `target` = '', `icon` = 'bell', `is_show` = '1', `permission` = '', `create_by` = '1', `create_date` = '2013-05-27 08:00:00', `update_by` = '1', `update_date` = '2020-03-28 14:27:31', `remarks` = '/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatAids', `del_flag` = '0' WHERE `id` = Cast('130305' AS Binary(6));
UPDATE `sys_menu` SET `parent_id` = 'b3b0c87bb91345bd93903fb7fa267b9d', `parent_ids` = '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,', `name` = '吸毒人员管理', `sort` = 330, `href` = '/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatDrugs', `target` = '', `icon` = 'bell', `is_show` = '1', `permission` = '', `create_by` = '1', `create_date` = '2013-05-27 08:00:00', `update_by` = '1', `update_date` = '2020-03-28 14:27:05', `remarks` = '/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatDrugs', `del_flag` = '0' WHERE `id` = Cast('130304' AS Binary(6));
UPDATE `sys_menu` SET `parent_id` = 'b3b0c87bb91345bd93903fb7fa267b9d', `parent_ids` = '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,', `name` = '肇事肇祸等严重精神障碍患者管理', `sort` = 320, `href` = '/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatPsychogeny', `target` = '', `icon` = 'bell', `is_show` = '1', `permission` = '', `create_by` = '1', `create_date` = '2013-05-27 08:00:00', `update_by` = '1', `update_date` = '2020-03-28 14:26:38', `remarks` = '/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatPsychogeny', `del_flag` = '0' WHERE `id` = Cast('130303' AS Binary(6));
UPDATE `sys_menu` SET `parent_id` = 'b3b0c87bb91345bd93903fb7fa267b9d', `parent_ids` = '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,', `name` = '安置帮教人员管理', `sort` = 310, `href` = '/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatRelease', `target` = '', `icon` = 'bell', `is_show` = '1', `permission` = '', `create_by` = '1', `create_date` = '2013-05-27 08:00:00', `update_by` = '1', `update_date` = '2020-03-28 14:25:39', `remarks` = '/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatRelease', `del_flag` = '0' WHERE `id` = Cast('130301' AS Binary(6));
UPDATE `sys_menu` SET `parent_id` = 'b3b0c87bb91345bd93903fb7fa267b9d', `parent_ids` = '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,', `name` = '社区矫正人员管理', `sort` = 300, `href` = '/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatRectification', `target` = '', `icon` = 'bell', `is_show` = '1', `permission` = '', `create_by` = '1', `create_date` = '2013-05-27 08:00:00', `update_by` = '1', `update_date` = '2020-03-28 14:25:03', `remarks` = '/report/ccmPeopleStat/statisticsPage?title=ccmPeopleStatRectification', `del_flag` = '0' WHERE `id` = Cast('130302' AS Binary(6));

-- 添加人口管理中 特殊信息 闹事行凶报复嫌疑统计页菜单 权限标识
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '0e578db78d19484a8a6a66326c102842', '0a5043def4f64ebe8227585015bb532c', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,0a5043def4f64ebe8227585015bb532c,', '统计页显示', '', '', '', 30, '0', 'report:ccmPeopleStat:view', '1', '2020-03-30 14:11:37.374', '1', '2020-03-30 14:11:37.374', '', '0' );
UPDATE sys_menu SET parent_id = '0a5043def4f64ebe8227585015bb532c', parent_ids = '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,0a5043def4f64ebe8227585015bb532c,', name = '显示', href = '', target = '', icon = '', sort = 60, is_show = '0', permission = 'house:ccmHouseDispute:view', update_by = '1', update_date = '2020-03-30 14:14:24.506', remarks = ''
 WHERE id = '43ab509768d84476ba4fe4ef222ef48e';
UPDATE sys_menu SET parent_id = '0a5043def4f64ebe8227585015bb532c', parent_ids = '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,0a5043def4f64ebe8227585015bb532c,', name = '编辑', href = '', target = '', icon = '', sort = 90, is_show = '0', permission = 'house:ccmHouseDispute:edit', update_by = '1', update_date = '2020-03-30 14:14:57.91', remarks = ''
 WHERE id = '9567132244a84e7195228431d1c1765e';


-- 添加老年人管理模块的权限标识
UPDATE sys_menu SET parent_id = '81349c6f45614556a51ad2626ea4e594', parent_ids = '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,81349c6f45614556a51ad2626ea4e594,', name = '显示', href = '', target = '', icon = '', sort = 30, is_show = '0', permission = 'pop:ccmOlder:view', update_by = '1', update_date = '2020-03-30 14:27:43.723', remarks = ''
 WHERE id = '7fc1bed486b34304ae689207563e02bd';
UPDATE sys_menu SET parent_id = '81349c6f45614556a51ad2626ea4e594', parent_ids = '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,81349c6f45614556a51ad2626ea4e594,', name = '编辑', href = '', target = '', icon = '', sort = 60, is_show = '0', permission = 'pop:ccmOlder:edit', update_by = '1', update_date = '2020-03-30 14:29:19.059', remarks = ''
 WHERE id = 'fa598015d3d748aab0879c8f3b477b18';

-- 添加特殊人关怀模块的权限标识
UPDATE sys_menu SET parent_id = '7549b37b7c454434aadc05340cf041e4', parent_ids = '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,7549b37b7c454434aadc05340cf041e4,', name = '显示', href = '', target = '', icon = '', sort = 30, is_show = '0', permission = 'pop:ccmCare:view', update_by = '1', update_date = '2020-03-30 15:10:12.836', remarks = ''
 WHERE id = '30a65ab541d3489d949b91181c6f7fff';
UPDATE sys_menu SET parent_id = '7549b37b7c454434aadc05340cf041e4', parent_ids = '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,7549b37b7c454434aadc05340cf041e4,', name = '编辑', href = '', target = '', icon = '', sort = 60, is_show = '0', permission = 'pop:ccmCare:edit', update_by = '1', update_date = '2020-03-30 15:11:07.492', remarks = ''
 WHERE id = '03892dbfb3a3413f9f584cdcb56498c5';

-- 添加建筑物统计页权限标识
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'f52c84194db3499bb0464fae835047a2', '1301012', '0,1,70a1747ee8334e439b2b24ebe947ecdd,c7a14a5931c245928691e00e634400b9,1301012,', '统计页显示', '', '', '', 90, '0', 'report:ccmHouseBuildStat:view', '1', '2020-03-30 16:30:03.044', '1', '2020-03-30 16:30:03.044', '', '0' );

-- 添加矛盾纠纷统计权限标识
UPDATE sys_menu SET parent_id = '672dd8c9900b4b309a78155a935195c5', parent_ids = '0,1,70a1747ee8334e439b2b24ebe947ecdd,b839bd8d81a44e23b2605bb820d4fc2f,672dd8c9900b4b309a78155a935195c5,', name = '统计页显示', href = '', target = '', icon = '', sort = 90, is_show = '0', permission = 'report:ccmEventAmbi:view', update_by = '1', update_date = '2020-03-30 17:34:09.299', remarks = ''
 WHERE id = '02017349f345405ba2ed4e797cd49d09';

-- 添加指挥调度视频监控权限标识
UPDATE sys_menu SET parent_id = '5ec397ba19a14a8cba3b9c4270159854', parent_ids = '0,1,ef61dbc7960f4272b360de7ad7d59a07,5ec397ba19a14a8cba3b9c4270159854,', name = '监控视频', href = '/ccmsys/ccmLiveVideo/index', target = '', icon = 'eye-open', sort = 330, is_show = '1', permission = 'ccmsys:ccmLiveVideo:view', update_by = '1', update_date = '2020-03-31 18:07:45.489', remarks = ''
 WHERE id = '3f02b4a20ad84dca837c8dd363397e13';

-- 添加网格员考勤统计权限标识
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'f441f4056660464e8998095d684c4b54', '6533dbc83144476291dd1c85fa08ec45', '0,1,3b3a641046be4558b92178d07f93b280,30d0d8e0446b4c7982a93352b5eae35b,01f29a340a9c49ce9d287a14c2ea9a45,6533dbc83144476291dd1c85fa08ec45,', '显示', '', '', '', 30, '0', 'attendance:ccmWorkerAttendanceCount:view', '1', '2020-03-31 18:16:54.905', '1', '2020-03-31 18:16:54.905', '', '0' );
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'd6d9270e2b844feb86cf5ae8db846fcb', '6533dbc83144476291dd1c85fa08ec45', '0,1,3b3a641046be4558b92178d07f93b280,30d0d8e0446b4c7982a93352b5eae35b,01f29a340a9c49ce9d287a14c2ea9a45,6533dbc83144476291dd1c85fa08ec45,', '编辑', '', '', '', 60, '0', 'attendance:ccmWorkerAttendanceCount:edit', '1', '2020-03-31 18:18:43.166', '1', '2020-03-31 18:18:43.166', '', '0' );

-- 开启事件
set global event_scheduler = (1/ON)

--修改大联动业务协同平台首页权限标识
UPDATE sys_menu SET parent_id = '4d834769daac4011ac0fad2c41e74722', parent_ids = '0,1,4d834769daac4011ac0fad2c41e74722,', name = '首页', href = '/report/ccmIncidentBegin/police', target = '', icon = 'ai-home', sort = 30, is_show = '1', permission = 'report:ccmIncidentBegin:view', update_by = '1', update_date = '2020-04-01 15:15:45.571', remarks = ''
 WHERE id = '976650ee9ff849efa5e01983c1694426';

--删除大联动业务协同平台事件管理下多余显示
UPDATE sys_menu SET del_flag = '1'
 WHERE id = 'b495ad8186894783bf0b9d0a1aa5029b' OR parent_ids LIKE CONCAT('%,', 'b495ad8186894783bf0b9d0a1aa5029b', ',%');


--添加首页门户字典配置权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '5a02ffe710284c3aac3c856c4b45f64e', '765b89564cc8475a9f6afb77642e289a', '0,1,2,3,19f750085a2642879c38548913ae7782,765b89564cc8475a9f6afb77642e289a,', '编辑', '', '', '', 10, '0', 'home:plmPortalDict:edit', '1', '2020-04-01 13:53:18.953', '1', '2020-04-01 13:53:18.953', '', '0' );
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'e80e87b045c64ca3b03080bc5ec34004', '765b89564cc8475a9f6afb77642e289a', '0,1,2,3,19f750085a2642879c38548913ae7782,765b89564cc8475a9f6afb77642e289a,', '显示', '', '', '', 40, '0', 'home:plmPortalDict:view', '1', '2020-04-01 13:56:04.588', '1', '2020-04-01 13:56:04.588', '', '0' );
--添加app版本管理权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '1e9dfc7229ae401b8356bdf57f7bd588', '8bff6204e023489b9f475283fd04a02e', '0,1,2,8bff6204e023489b9f475283fd04a02e,', '编辑', '', '', '', 60, '1', 'appupload:sysAppUpload:edit', '1', '2020-04-01 11:32:43.103', '1', '2020-04-01 11:32:43.103', '', '0' );

--流程审批 信息查阅
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '260432f87fbd481fa73422bbf3cc9122', 'c271f7b943a4432e8370198f8c7faa93', '0,1,3b3a641046be4558b92178d07f93b280,6e4f90e142be4c4babbd9e708f437d8a,c271f7b943a4432e8370198f8c7faa93,', '显示', '', '', '', 30, '0', 'flow:jump:index:view', '1', '2020-04-03 09:40:32.683', '1', '2020-04-03 09:40:32.683', '', '0' );
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'a940b7a5923342249b87e32f386fb0bd', 'c271f7b943a4432e8370198f8c7faa93', '0,1,3b3a641046be4558b92178d07f93b280,6e4f90e142be4c4babbd9e708f437d8a,c271f7b943a4432e8370198f8c7faa93,', '编辑', '', '', '', 60, '0', 'flow:jump:index:edit', '1', '2020-04-03 09:48:08.967', '1', '2020-04-03 09:48:08.967', '', '0' );
--
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'e61135a69f074bb3a598379908acb671', 'cee99b69711b453cb1c012b592936264', '0,1,ef61dbc7960f4272b360de7ad7d59a07,e1ea142288174ff9be2ae602d07af1f9,cee99b69711b453cb1c012b592936264,', '显示', '', '', '', 30, '0', 'alarm:bphAlarmInfo:index:view', '1', '2020-04-02 10:22:14.368', '1', '2020-04-02 10:22:14.368', '', '0' );
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '3143715e332f4fb1963a4d9f06fbae4b', 'cee99b69711b453cb1c012b592936264', '0,1,ef61dbc7960f4272b360de7ad7d59a07,e1ea142288174ff9be2ae602d07af1f9,cee99b69711b453cb1c012b592936264,', '编辑', '', '', '', 60, '0', 'alarm:bphAlarmInfo:index:edit', '1', '2020-04-02 10:28:06.513', '1', '2020-04-02 10:28:06.513', '', '0' );
-- 添加流程管理操作权限
UPDATE sys_menu SET parent_id = '69', parent_ids = '0,1,2,62,69,', name = '流程管理', href = '/act/process', target = '', icon = 'road', sort = 50, is_show = '1', permission = '', update_by = '1', update_date = '2020-04-01 14:41:37.043', remarks = ''
 WHERE id = '70';
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'f082d335c9334e7fa3b2a33e6c0bf912', '70', '0,1,2,62,69,70,', '显示', '', '', '', 30, '0', 'act:process:view', '1', '2020-04-01 14:44:28.053', '1', '2020-04-01 14:44:28.053', '', '0' );
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '10651f472cb548098e116f75c04abb2f', '70', '0,1,2,62,69,70,', '编辑', '', '', '', 60, '0', 'act:process:edit', '1', '2020-04-01 14:47:29.714', '1', '2020-04-01 14:47:29.714', '', '0' );

INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '42f9737aa5fc44af81e8b4cd46bf2db4', '72', '0,1,2,62,69,72,', '显示', '', '', '', 30, '0', 'act:model:view', '1', '2020-04-01 10:52:05.827', '1', '2020-04-01 10:52:05.827', '', '0' );
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'aaabc47a26504804bd590bde409c25a3', '72', '0,1,2,62,69,72,', '编辑', '', '', '', 60, '0', 'act:model:edit', '1', '2020-04-01 10:53:59.639', '1', '2020-04-01 10:53:59.639', '', '0' );
UPDATE sys_menu SET parent_id = '69', parent_ids = '0,1,2,62,69,', name = '模型管理', href = '/act/model', target = '', icon = 'road', sort = 100, is_show = '1', permission = '', update_by = '1', update_date = '2020-04-01 10:52:51.847', remarks = ''
 WHERE id = '72';


-- 添加职业树结构数据
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('10000', '0', '0,', '10000', '党的机关、国家机关、群众团体和社会组织、企事业单位负责人', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('10100', '10000', '0,10000,', '10100', '中国共产党机关负责人', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('10200', '10000', '0,10000,', '10200', '国家机关负责人', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('10201', '10200', '0,10000,10200,', '10201', '国家权力机关负责人', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('10202', '10200', '0,10000,10200,', '10202', '国家行政机关负责人', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('10203', '10200', '0,10000,10200,', '10203', '人民政协机关负责人', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('10204', '10200', '0,10000,10200,', '10204', '人民法院和人民检察院负责人', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('10300', '10000', '0,10000,', '10300', '民主党派和工商联负责人', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('10400', '10000', '0,10000,', '10400', '人民团体和群众团体、社会组织及其他成员组织负责人', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('10401', '10400', '0,10000,10400,', '10401', '人民团体和群众团体负责人', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('10402', '10400', '0,10000,10400,', '10402', '社会团体负责人', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('10403', '10400', '0,10000,10400,', '10403', '民办非企业单位负责人', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('10404', '10400', '0,10000,10400,', '10404', '社会中介组织负责人', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('10405', '10400', '0,10000,10400,', '10405', '人基金会负责人', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('10406', '10400', '0,10000,10400,', '10406', '宗教组织负责人', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('10500', '10000', '0,10000,', '10500', '基层群众自治组织负责人', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('10600', '10000', '0,10000,', '10600', '企事业单位负责人', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('10601', '10600', '0,10000,10600,', '10601', '企业负责人', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('10602', '10600', '0,10000,10600,', '10602', '事业单位负责人', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20000', '0', '0,', '20000', '专业技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20100', '20000', '0,20000,', '20100', '科学研究人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20101', '20100', '0,20000,20100,', '20101', '哲学研究人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20102', '20100', '0,20000,20100,', '20102', '经济学研究人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20103', '20100', '0,20000,20100,', '20103', '法学研究人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20104', '20100', '0,20000,20100,', '20104', '教育学研究人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20105', '20100', '0,20000,20100,', '20105', '历史学研究人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20107', '20100', '0,20000,20100,', '20107', '农学研究人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20108', '20100', '0,20000,20100,', '20108', '医学研究人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20109', '20100', '0,20000,20100,', '20109', '管理学研究人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20111', '20100', '0,20000,20100,', '20111', '军事学研究人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20112', '20100', '0,20000,20100,', '20112', '文学研究人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20113', '20100', '0,20000,20100,', '20113', '理学研究人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20114', '20100', '0,20000,20100,', '20114', '工学研究人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20115', '20100', '0,20000,20100,', '20115', '艺术学科研究人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20199', '20100', '0,20000,20100,', '20199', '其他科学研究人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20200', '20000', '0,20000,', '20200', '工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20201', '20200', '0,20000,20200,', '20201', '地质勘探工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20202', '20200', '0,20000,20200,', '20202', '测绘和地理信息工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20203', '20200', '0,20000,20200,', '20203', '矿山工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20204', '20200', '0,20000,20200,', '20204', '石油天然气工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20205', '20200', '0,20000,20200,', '20205', '冶金工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20206', '20200', '0,20000,20200,', '20206', '化工工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20207', '20200', '0,20000,20200,', '20207', '机械工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20208', '20200', '0,20000,20200,', '20208', '航空工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20209', '20200', '0,20000,20200,', '20209', '电子工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20210', '20200', '0,20000,20200,', '20210', '信息和通信工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20211', '20200', '0,20000,20200,', '20211', '电气工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20212', '20200', '0,20000,20200,', '20212', '电力工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20213', '20200', '0,20000,20200,', '20213', '邮政和快递工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20214', '20200', '0,20000,20200,', '20214', '广播电影电视及演艺设备工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20215', '20200', '0,20000,20200,', '20215', '交通和水上运输工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20216', '20200', '0,20000,20200,', '20216', '民用航空工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20217', '20200', '0,20000,20200,', '20217', '铁道工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20218', '20200', '0,20000,20200,', '20218', '建筑工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20219', '20200', '0,20000,20200,', '20219', '建材工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20220', '20200', '0,20000,20200,', '20220', '林业工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20221', '20200', '0,20000,20200,', '20221', '水利工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20222', '20200', '0,20000,20200,', '20222', '海洋工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20223', '20200', '0,20000,20200,', '20223', '纺织服装工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20224', '20200', '0,20000,20200,', '20224', '食品工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20225', '20200', '0,20000,20200,', '20225', '气象工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20226', '20200', '0,20000,20200,', '20226', '地震工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20227', '20200', '0,20000,20200,', '20227', '环境保护工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20228', '20200', '0,20000,20200,', '20228', '安全工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20229', '20200', '0,20000,20200,', '20229', '标准化、计量、质量和认证认可工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20230', '20200', '0,20000,20200,', '20230', '管理（工业）工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20231', '20200', '0,20000,20200,', '20231', '其他工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20232', '20200', '0,20000,20200,', '20232', '制药工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20233', '20200', '0,20000,20200,', '20233', '印刷复制工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20234', '20200', '0,20000,20200,', '20234', '工业（产品）设计工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20235', '20200', '0,20000,20200,', '20235', '康复辅具工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20236', '20200', '0,20000,20200,', '20236', '轻工工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20237', '20200', '0,20000,20200,', '20237', '土地整治工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20290', '20200', '0,20000,20200,', '20290', '兵器工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20291', '20200', '0,20000,20200,', '20291', '航天工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20299', '20200', '0,20000,20200,', '20299', '其他工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20300', '20000', '0,20000,', '20300', '农业技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20301', '20300', '0,20000,20300,', '20301', '土壤肥料技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20302', '20300', '0,20000,20300,', '20302', '农业技术指导人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20303', '20300', '0,20000,20300,', '20303', '植物保护技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20304', '20300', '0,20000,20300,', '20304', '园艺技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20305', '20300', '0,20000,20300,', '20305', '作物遗传育种栽培技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20306', '20300', '0,20000,20300,', '20306', '兽医兽药技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20307', '20300', '0,20000,20300,', '20307', '畜牧和草业技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20308', '20300', '0,20000,20300,', '20308', '水产技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20309', '20300', '0,20000,20300,', '20309', '农业工程技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20399', '20300', '0,20000,20300,', '20399', '其他农业技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20400', '20000', '0,20000,', '20400', '飞机和船舶技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20401', '20400', '0,20000,20400,', '20400', '飞行人员和领航人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20402', '20400', '0,20000,20400,', '20400', '船舶指挥和引航人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20499', '20400', '0,20000,20400,', '20400', '其他飞机和船舶技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20500', '20000', '0,20000,', '20500', '卫生专业技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20501', '20500', '0,20000,20500,', '20501', '西医医师', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20502', '20500', '0,20000,20500,', '20502', '中医医师', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20503', '20500', '0,20000,20500,', '20503', '中西医结合医师', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20504', '20500', '0,20000,20500,', '20504', '民族医医师', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20505', '20500', '0,20000,20500,', '20505', '公共卫生与健康医师', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20506', '20500', '0,20000,20500,', '20506', '药学技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20507', '20500', '0,20000,20500,', '20507', '医疗卫生技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20508', '20500', '0,20000,20500,', '20508', '护理人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20509', '20500', '0,20000,20500,', '20509', '乡村医生', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20599', '20500', '0,20000,20500,', '20599', '其他卫生专业技术人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20600', '20000', '0,20000,', '20600', '经济和金融专业人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20601', '20600', '0,20000,20600,', '20601', '经济专业人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20602', '20600', '0,20000,20600,', '20602', '统计专业人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20603', '20600', '0,20000,20600,', '20603', '会计专业人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20604', '20600', '0,20000,20600,', '20604', '审计专业人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20605', '20600', '0,20000,20600,', '20605', '税务专业人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20606', '20600', '0,20000,20600,', '20606', '评估专业人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20607', '20600', '0,20000,20600,', '20607', '商务专业人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20608', '20600', '0,20000,20600,', '20608', '人力资源专业人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20609', '20600', '0,20000,20600,', '20609', '银行专业人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20610', '20600', '0,20000,20600,', '20610', '保险专业人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20611', '20600', '0,20000,20600,', '20611', '证券专业人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20612', '20600', '0,20000,20600,', '20612', '知识产权专业人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20699', '20600', '0,20000,20600,', '20699', '其他经济和金融专业人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20700', '20000', '0,20000,', '20700', '法律、社会和宗教专业人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20701', '20700', '0,20000,20700,', '20701', '法官', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20702', '20700', '0,20000,20700,', '20702', '检察官', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20703', '20700', '0,20000,20700,', '20703', '律师', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20704', '20700', '0,20000,20700,', '20704', '公证员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20705', '20700', '0,20000,20700,', '20705', '司法鉴定人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20706', '20700', '0,20000,20700,', '20706', '审判辅助人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20707', '20700', '0,20000,20700,', '20707', '法律顾问', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20708', '20700', '0,20000,20700,', '20708', '宗教教职人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20709', '20700', '0,20000,20700,', '20709', '社会工作专业人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20799', '20700', '0,20000,20700,', '20799', '其他法律、社会和宗教专业人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20800', '20000', '0,20000,', '20800', '教学人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20801', '20800', '0,20000,20800,', '20801', '高等教育教师', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20802', '20800', '0,20000,20800,', '20802', '中等职业教育教师', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20803', '20800', '0,20000,20800,', '20803', '中小学教育教师', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20804', '20800', '0,20000,20800,', '20804', '幼儿教师', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20805', '20800', '0,20000,20800,', '20805', '特殊教育教师', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20899', '20800', '0,20000,20800,', '20899', '其他教学人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20900', '20000', '0,20000,', '20900', '文学艺术、体育专业人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20901', '20900', '0,20000,20900,', '20901', '文艺创作与编导人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20902', '20900', '0,20000,20900,', '20902', '音乐指挥与演员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20903', '20900', '0,20000,20900,', '20903', '电影电视制作专业人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20904', '20900', '0,20000,20900,', '20904', '舞台专业人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20905', '20900', '0,20000,20900,', '20905', '美术专业人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20906', '20900', '0,20000,20900,', '20906', '工艺美术与创意设计专业人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20907', '20900', '0,20000,20900,', '20907', '体育专业人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20999', '20900', '0,20000,20900,', '20999', '其他文学艺术、体育专业人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('21000', '20000', '0,20000,', '21000', '新闻出版、文化专业人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('21001', '21000', '0,20000,21000,', '21001', '记者', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('21002', '21000', '0,20000,21000,', '21002', '编辑', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('21003', '21000', '0,20000,21000,', '21003', '校对员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('21004', '21000', '0,20000,21000,', '21004', '播音员及节目主持人', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('21005', '21000', '0,20000,21000,', '21005', '翻译人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('21006', '21000', '0,20000,21000,', '21006', '图书资料与微缩摄影专业人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('21007', '21000', '0,20000,21000,', '21007', '档案专业人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('21008', '21000', '0,20000,21000,', '21008', '考古及文物保护专业人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('21099', '21000', '0,20000,21000,', '21099', '其他新闻出版式、文化工作人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('30000', '0', '0,', '30000', '党的机关、国办事人员和有关人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('30100', '30000', '0,30000,', '30100', '办事人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('30101', '30100', '0,30000,30100,', '30101', '行政业务办理人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('30102', '30100', '0,30000,30100,', '30102', '行政事务处理人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('30103', '30100', '0,30000,30100,', '30103', '行政执法和仲裁人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('30199', '30100', '0,30000,30100,', '30199', '其他办事人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('30200', '30000', '0,30000,', '30200', '安全和消防人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('30201', '30200', '0,30000,30200,', '30201', '人民警察', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('30202', '30200', '0,30000,30200,', '30202', '保卫人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('30203', '30200', '0,30000,30200,', '30203', '消防和应急救援人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('30299', '30200', '0,30000,30200,', '30299', '其他安全和消防人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('39900', '30000', '0,30000,', '39900', '其他办事人员和有关人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40000', '0', '0,', '40000', '社会生产服务和生活服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40100', '40000', '0,40000,', '40100', '批发与零售服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40101', '40100', '0,40000,40100,', '40101', '采购人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40102', '40100', '0,40000,40100,', '40102', '销售人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40103', '40100', '0,40000,40100,', '40103', '贸易经济代理人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40104', '40100', '0,40000,40100,', '40104', '再生物资回收人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40105', '40100', '0,40000,40100,', '40105', '特殊商品购销人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40199', '40100', '0,40000,40100,', '40199', '其他批发与零售服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40200', '40000', '0,40000,', '40200', '交通运输、仓储和邮政业服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40201', '40200', '0,40000,40200,', '40201', '轨道交通运输服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40202', '40200', '0,40000,40200,', '40202', '道路运输服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40203', '40200', '0,40000,40200,', '40203', '水上运输服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40204', '40200', '0,40000,40200,', '40204', '航空运输服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40205', '40200', '0,40000,40200,', '40205', '装卸搬运和运输代理服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40206', '40200', '0,40000,40200,', '40206', '仓储人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40207', '40200', '0,40000,40200,', '40207', '邮政和快递服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40299', '40200', '0,40000,40200,', '40299', '其他交通运输、仓储和邮政业服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40300', '40000', '0,40000,', '40300', '住宿和餐饮服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40301', '40300', '0,40000,40300', '40301', '住宿服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40302', '40300', '0,40000,40300', '40302', '餐饮服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40399', '40300', '0,40000,40300', '40399', '其他住宿和餐饮服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40400', '40000', '0,40000,', '40400', '信息运输、软件和信息技术服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40401', '40400', '0,40000,40400,', '40401', '信息通信业务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40402', '40400', '0,40000,40400,', '40402', '信息通信网络维护人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40403', '40400', '0,40000,40400,', '40403', '广播电视传输服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40404', '40400', '0,40000,40400,', '40404', '信息通信网络运行管理人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40405', '40400', '0,40000,40400,', '40405', '软件和信息技术服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40499', '40400', '0,40000,40400,', '40499', '其他信息运输、软件和信息技术服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40500', '40000', '0,40000,', '40500', '金融服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40501', '40500', '0,40000,40500,', '40501', '银行服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40502', '40500', '0,40000,40500,', '40502', '证券服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40503', '40500', '0,40000,40500,', '40503', '期货服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40504', '40500', '0,40000,40500,', '40504', '保险服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40505', '40500', '0,40000,40500,', '40505', '典当服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40506', '40500', '0,40000,40500,', '40506', '信托服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40599', '40500', '0,40000,40500,', '40599', '其他金融服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40600', '40000', '0,40000,', '40600', '房地产服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40601', '40600', '0,40000,40600,', '40601', '物业管理服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40602', '40600', '0,40000,40600,', '40602', '房地产中介服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40699', '40600', '0,40000,40600,', '40699', '其他房地产服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40700', '40000', '0,40000,', '40700', '租赁和商务服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40701', '40700', '0,40000,40700,', '40701', '租赁业务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40702', '40700', '0,40000,40700,', '40702', '商务资讯服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40703', '40700', '0,40000,40700,', '40703', '人力资源服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40704', '40700', '0,40000,40700,', '40704', '旅游及公共游览场所服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40705', '40700', '0,40000,40700,', '40705', '安全保护服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40706', '40700', '0,40000,40700,', '40706', '市场管理服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40707', '40700', '0,40000,40700,', '40707', '会议及展览服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40799', '40700', '0,40000,40700,', '40799', '其他租赁和商务服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40800', '40000', '0,40000,', '40800', '技术辅助服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40801', '40800', '0,40000,40800,', '40801', '气象服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40802', '40800', '0,40000,40800,', '40802', '海洋服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40803', '40800', '0,40000,40800,', '40803', '测绘服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40804', '40800', '0,40000,40800,', '40804', '地理信息服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40805', '40800', '0,40000,40800,', '40805', '检验，检测和计量服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40806', '40800', '0,40000,40800,', '40806', '环境检测服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40807', '40800', '0,40000,40800,', '40807', '地质勘查人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40808', '40800', '0,40000,40800,', '40808', '专业化设计服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40809', '40800', '0,40000,40800,', '40809', '摄影扩印服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40899', '40800', '0,40000,40800,', '40899', '其他技术辅助服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40900', '40000', '0,40000,', '40900', '水利、环境和公共设施管理服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40901', '40900', '0,40000,40900,', '40901', '水利设施管养人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40902', '40900', '0,40000,40900,', '40902', '水文服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40903', '40900', '0,40000,40900,', '40903', '水土保持人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40904', '40900', '0,40000,40900,', '40904', '农田灌排人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40905', '40900', '0,40000,40900,', '40905', '自然保护区和草地监护人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40906', '40900', '0,40000,40900,', '40906', '野生动植物保护人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40907', '40900', '0,40000,40900,', '40907', '环境治理服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40908', '40900', '0,40000,40900,', '40908', '环境卫生服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40909', '40900', '0,40000,40900,', '40909', '有害生物防制人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40910', '40900', '0,40000,40900,', '40910', '绿化与园艺服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40999', '40900', '0,40000,40900,', '40999', '其他水利、环境和公共设施管理服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41000', '40000', '0,40000,', '41000', '居民服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41001', '41000', '0,40000,41000,', '41001', '生活照料服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41002', '41000', '0,40000,41000,', '41002', '服装裁剪和洗染织补人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41003', '41000', '0,40000,41000,', '41003', '美容美发和浴池服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41004', '41000', '0,40000,41000,', '41004', '保健服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41005', '41000', '0,40000,41000,', '41005', '婚姻服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41006', '41000', '0,40000,41000,', '41006', '殡葬服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41007', '41000', '0,40000,41000,', '41007', '宠物服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41099', '41000', '0,40000,41000,', '41099', '其他居民服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41100', '40000', '0,40000,', '41100', '电力、燃气及水供应服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41101', '41100', '0,40000,41100,', '41101', '电力供应服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41102', '41100', '0,40000,41100,', '41102', '燃气供应服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41103', '41100', '0,40000,41100,', '41103', '水供应服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41199', '41100', '0,40000,41100,', '41199', '其他电力、燃气及水供应服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41200', '40000', '0,40000,', '41200', '修理及制作服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41201', '41200', '0,40000,41200,', '41201', '汽车摩托车修理技术服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41202', '41200', '0,40000,41200,', '41202', '计算机和办公设备维修人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41203', '41200', '0,40000,41200,', '41203', '家用电子电器产品维修人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41204', '41200', '0,40000,41200,', '41204', '日用产品修理服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41205', '41200', '0,40000,41200,', '41205', '乐器维修人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41206', '41200', '0,40000,41200,', '41206', '印章制作人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41299', '41200', '0,40000,41200,', '41299', '其他修理及制作服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41300', '40000', '0,40000,', '41300', '文化、体育及娱乐服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41301', '41300', '0,40000,41300,', '41301', '群众文化活动服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41302', '41300', '0,40000,41300,', '41302', '广播、电视、电影和影视录音制作人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41303', '41300', '0,40000,41300,', '41303', '文物保护作业人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41304', '41300', '0,40000,41300,', '41304', '健身和娱乐场所服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41305', '41300', '0,40000,41300,', '41305', '文化、娱乐、体育经纪代理人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41399', '41300', '0,40000,41300,', '41399', '其他文化、体育及娱乐服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41400', '40000', '0,40000,', '41400', '健康服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41401', '41400', '0,40000,41400,', '41400', '医疗辅助服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41402', '41400', '0,40000,41400,', '41400', '健康资讯服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41403', '41400', '0,40000,41400,', '41400', '康复矫正服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41404', '41400', '0,40000,41400,', '41400', '公共卫生辅助服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41499', '41400', '0,40000,41400,', '41400', '其他健康服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('49900', '40000', '0,40000,', '49900', '其他社会生产和生活服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('50000', '0', '0,', '50000', '农、林、牧、渔业生产及辅助人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('50100', '50000', '0,50000', '50100', '农业生产人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('50101', '50100', '0,50000,50100,', '50101', '作物种子（苗）繁育生产人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('50102', '50100', '0,50000,50100,', '50102', '农作物生产人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('50199', '50100', '0,50000,50100,', '50199', '其他农业生产人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('50200', '50000', '0,50000,', '50200', '林业生产人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('50201', '50200', '0,50000,50200,', '50201', '林木种苗繁育人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('50202', '50200', '0,50000,50200,', '50202', '营造林人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('50203', '50200', '0,50000,50200,', '50203', '森林经营和管护人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('50204', '50200', '0,50000,50200,', '50204', '木材采运人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('50299', '50200', '0,50000,50200,', '50299', '其他林业生产人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('50300', '50000', '0,50000,', '50300', '畜牧业生产人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('50301', '50300', '0,50000,50300,', '50301', '畜禽种苗繁育人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('50302', '50300', '0,50000,50300,', '50302', '畜禽饲养人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('50303', '50300', '0,50000,50300,', '50303', '特种经济动物饲养人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('50399', '50300', '0,50000,50300,', '50399', '其他畜牧业生产人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('50400', '50000', '0,50000,', '50400', '渔业生产人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('50401', '50400', '0,50000,50400,', '50401', '水产苗种繁育人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('50402', '50400', '0,50000,50400,', '50402', '水产养殖人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('50403', '50400', '0,50000,50400,', '50403', '水产捕捞及有关人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('50499', '50400', '0,50000,50400,', '50499', '其他渔业生产人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('50500', '50000', '0,50000,', '50500', '农林牧渔生产辅助人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('50501', '50500', '0,50000,50500,', '50501', '农业生产服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('50502', '50500', '0,50000,50500,', '50502', '动植物疫病防治人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('50503', '50500', '0,50000,50500,', '50503', '农村能源利用人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('50504', '50500', '0,50000,50500,', '50504', '农村环境保护人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('50505', '50500', '0,50000,50500,', '50505', '农机化服务人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('50506', '50500', '0,50000,50500,', '50506', '农副林特产品初加工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('50599', '50500', '0,50000,50500,', '50599', '其他农林牧渔生产辅助人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('59900', '50000', '0,50000,', '59900', '其他农、林、牧、渔、水利业生产人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60000', '0', '0,', '60000', '生产制造及有关人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60100', '60000', '0,60000,', '60100', '农副产品加工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60101', '60100', '0,60000,60100,', '60101', '粮油加工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60102', '60100', '0,60000,60100,', '60102', '饲料加工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60103', '60100', '0,60000,60100,', '60103', '制糖人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60104', '60100', '0,60000,60100,', '60104', '畜禽制品加工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60105', '60100', '0,60000,60100,', '60105', '水产品加工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60106', '60100', '0,60000,60100,', '60106', '果蔬和坚果加工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60107', '60100', '0,60000,60100,', '60107', '淀粉和豆制品加工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60199', '60100', '0,60000,60100,', '60199', '其他农副产品加工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60200', '60000', '0,60000,', '60200', '食品、饮料生产加工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60201', '60200', '0,60000,60200,', '60201', '焙烤食品制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60202', '60200', '0,60000,60200,', '60202', '糖制品加工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60203', '60200', '0,60000,60200,', '60203', '方便食品和罐头食品加工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60204', '60200', '0,60000,60200,', '60204', '乳制品加工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60205', '60200', '0,60000,60200,', '60205', '调味品及食品添加剂制作人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60206', '60200', '0,60000,60200,', '60206', '酒、饮料及精制茶制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60299', '60200', '0,60000,60200,', '60299', '其他食品、饮料生产加工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60300', '60000', '0,60000,', '60300', '烟草及其制品加工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60301', '60300', '0,60000,60300,', '60301', '烟叶初加工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60302', '60300', '0,60000,60300,', '60302', '烟用材料生产人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60303', '60300', '0,60000,60300,', '60303', '烟草制品生产人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60399', '60300', '0,60000,60300,', '60399', '其他烟草及其制品加工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60400', '60000', '0,60000,', '60400', '纺织、针织、印染人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60401', '60400', '0,60000,60400,', '60401', '纤维预处理人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60402', '60400', '0,60000,60400,', '60402', '纺纱人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60403', '60400', '0,60000,60400,', '60403', '织造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60404', '60400', '0,60000,60400,', '60404', '针织人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60405', '60400', '0,60000,60400,', '60405', '非织造布制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60406', '60400', '0,60000,60400,', '60406', '印染人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60499', '60400', '0,60000,60400,', '60499', '其他纺织、针织、印染人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60500', '60000', '0,60000,', '60500', '纺织品、服装和皮革、毛皮制品加工制作人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60501', '60500', '0,60000,60500,', '60501', '纺织品和服装剪裁缝纫人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60502', '60500', '0,60000,60500,', '60502', '皮革、毛皮及其制作加工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60503', '60500', '0,60000,60500,', '60503', '羽绒羽毛加工及制品制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60504', '60500', '0,60000,60500,', '60504', '鞋帽制作人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60599', '60500', '0,60000,60500,', '60599', '其他纺织品、服装和皮革、毛皮制品加工制作人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60600', '60000', '0,60000,', '60600', '木材加工、家具与木制品制作人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60601', '60600', '0,60000,60600,', '60601', '木材加工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60602', '60600', '0,60000,60600,', '60602', '人造板制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60603', '60600', '0,60000,60600,', '60603', '木制品制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60604', '60600', '0,60000,60600,', '60604', '家具制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60699', '60600', '0,60000,60600,', '60699', '其他木材加工、家具与木制品制作人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60700', '60000', '0,60000,', '60700', '纸及纸制品生产加工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60701', '60700', '0,60000,60700,', '60701', '制浆造纸人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60702', '60700', '0,60000,60700,', '60702', '纸制品制作人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60799', '60700', '0,60000,60700,', '60799', '其他纸及纸制品生产加工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60800', '60000', '0,60000,', '60800', '印刷和记录媒介复制人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60801', '60800', '0,60000,60800,', '60801', '印刷人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60802', '60800', '0,60000,60800,', '60802', '记录媒介复制人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60899', '60800', '0,60000,60800,', '60899', '其他印刷和记录媒介复制人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60900', '60000', '0,60000,', '60900', '文教、工美、体育和娱乐用品制作人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60901', '60900', '0,60000,60900,', '60901', '文教用品制作人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60902', '60900', '0,60000,60900,', '60902', '乐器制作人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60903', '60900', '0,60000,60900,', '60903', '工艺美术品制作人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60904', '60900', '0,60000,60900,', '60904', '体育用品制作人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60905', '60900', '0,60000,60900,', '60905', '玩具制作人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('60999', '60900', '0,60000,60900,', '60999', '其他文教、工美、体育和娱乐用品制作人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61000', '60000', '0,60000,', '61000', '石油加工和炼焦、煤化工制作人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61001', '61000', '0,60000,61000,', '61001', '石油炼制生产人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61002', '61000', '0,60000,61000,', '61002', '炼焦人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61003', '61000', '0,60000,61000,', '61003', '煤化工生产人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61099', '61000', '0,60000,61000,', '61099', '其他石油加工和炼焦、煤化工制作人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61100', '60000', '0,60000,', '61100', '化学原料和化学制品制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61101', '61100', '0,60000,61100,', '61101', '化工产品生产通用工艺人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61102', '61100', '0,60000,61100,', '61102', '基础化学原料制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61103', '61100', '0,60000,61100,', '61103', '化学肥料生产人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61104', '61100', '0,60000,61100,', '61104', '农药生产人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61105', '61100', '0,60000,61100,', '61105', '涂料、油墨、颜料及类似产品制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61106', '61100', '0,60000,61100,', '61106', '合成树脂生产人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61107', '61100', '0,60000,61100,', '61107', '合成橡胶生产人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61108', '61100', '0,60000,61100,', '61108', '专用化学产品生产人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61109', '61100', '0,60000,61100,', '61109', '火工品制造、保管、爆破及焰火产品制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61110', '61100', '0,60000,61100,', '61110', '日用化学品生产人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61199', '61100', '0,60000,61100,', '61199', '其他化学原料和化学制品制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61200', '60000', '0,60000,', '61200', '医药制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61201', '61200', '0,60000,61200,', '61201', '化学药品原料药制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61202', '61200', '0,60000,61200,', '61202', '中药饮片加工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61203', '61200', '0,60000,61200,', '61203', '药物制剂人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61204', '61200', '0,60000,61200,', '61204', '兽用药制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61205', '61200', '0,60000,61200,', '61205', '生物药品制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61299', '61200', '0,60000,61200,', '61299', '其他医药制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61300', '60000', '0,60000,', '61300', '化学纤维制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61301', '61300', '0,60000,61300,', '61301', '化学纤维原料制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61302', '61300', '0,60000,61300,', '61302', '化学纤维纺丝及后处理人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61399', '61300', '0,60000,61300,', '61399', '其他化学纤维制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61400', '60000', '0,60000,', '61400', '橡胶和塑料制品制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61401', '61400', '0,60000,61400,', '61401', '橡胶制品生产人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61402', '61400', '0,60000,61400,', '61402', '塑料制品加工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61499', '61400', '0,60000,61400,', '61499', '其他橡胶和塑料制品制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61500', '60000', '0,60000,', '61500', '非金属矿物制品制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61501', '61500', '0,60000,61500,', '61501', '水泥、石灰、石膏及其制品制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61502', '61500', '0,60000,61500,', '61502', '砖瓦石材等建筑材料制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61503', '61500', '0,60000,61500,', '61503', '玻璃及玻璃制品生产加工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61504', '61500', '0,60000,61500,', '61504', '玻璃纤维及玻璃纤维增强塑料制品制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61505', '61500', '0,60000,61500,', '61505', '陶瓷制品制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61506', '61500', '0,60000,61500,', '61506', '耐火材料制品生产人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61507', '61500', '0,60000,61500,', '61507', '石墨及炭素制品生产人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61508', '61500', '0,60000,61500,', '61508', '高岭土、珍珠岩等非金属矿物加工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61599', '61500', '0,60000,61500,', '61599', '其他非金属矿物制品制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61600', '60000', '0,60000,', '61600', '采矿人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61601', '61600', '0,60000,61600,', '61601', '矿物采选人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61602', '61600', '0,60000,61600,', '61602', '石油和天然气开采与储运人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61603', '61600', '0,60000,61600,', '61603', '采盐人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61699', '61600', '0,60000,61600,', '61699', '其他采矿人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61700', '60000', '0,60000,', '61700', '金属冶炼和压延加工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61701', '61700', '0,60000,61700,', '61701', '炼铁人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61702', '61700', '0,60000,61700,', '61702', '炼钢人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61703', '61700', '0,60000,61700,', '61703', '铸铁管人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61704', '61700', '0,60000,61700,', '61704', '铁合金冶炼人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61705', '61700', '0,60000,61700,', '61705', '重有色金属冶炼人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61706', '61700', '0,60000,61700,', '61706', '轻有色金属冶炼人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61707', '61700', '0,60000,61700,', '61707', '稀贵金属冶炼人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61708', '61700', '0,60000,61700,', '61708', '半导体材料制备人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61709', '61700', '0,60000,61700,', '61709', '金属轧制人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61710', '61700', '0,60000,61700,', '61710', '硬质合金生产人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61799', '61700', '0,60000,61700,', '61799', '其他金属冶炼和压延加工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61800', '60000', '0,60000,', '61800', '机械制造基础加工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61801', '61800', '0,60000,61800,', '61801', '机械冷加工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61802', '61800', '0,60000,61800,', '61802', '机械热加工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61803', '61800', '0,60000,61800,', '61803', '机械表面处理加工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61804', '61800', '0,60000,61800,', '61804', '工装工具制造加工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61899', '61800', '0,60000,61800,', '61899', '其他机械制造基础加工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61900', '60000', '0,60000,', '61900', '金属制品制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61901', '61900', '0,60000,61900,', '61901', '五金制品制作装配人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('61999', '61900', '0,60000,61900,', '61999', '其他金属制品制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62000', '60000', '0,60000,', '62000', '通用设备制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62001', '62000', '0,60000,62000,', '62001', '通用基础件装配制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62002', '62000', '0,60000,62000,', '62002', '锅炉及原动设备制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62003', '62000', '0,60000,62000,', '62003', '金属加工机械制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62004', '62000', '0,60000,62000,', '62004', '物料搬运设备制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62005', '62000', '0,60000,62000,', '62005', '泵、压缩机、阀门及类似机械制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62006', '62000', '0,60000,62000,', '62006', '烘炉、水处理、衡器等设备制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62007', '62000', '0,60000,62000,', '62007', '文化办公机械制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62099', '62000', '0,60000,62000,', '62099', '其他通用设备制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62100', '60000', '0,60000,', '62100', '专用设备制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62101', '62100', '0,60000,62100,', '62101', '采矿、建筑专用设备制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62102', '62100', '0,60000,62100,', '62102', '印刷生产专用设备制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62103', '62100', '0,60000,62100,', '62103', '纺织服装和皮革加工专用设备制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62104', '62100', '0,60000,62100,', '62104', '电子专用设备装配调试人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62105', '62100', '0,60000,62100,', '62105', '农业机械制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62106', '62100', '0,60000,62100,', '62106', '医疗器械制品和康复辅具生产人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62199', '62100', '0,60000,62100,', '62199', '其他专用设备制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62200', '60000', '0,60000,', '62200', '汽车制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62201', '62200', '0,60000,62200,', '62201', '汽车零部件、饰件生产加工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62202', '62200', '0,60000,62200,', '62202', '汽车整车制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62299', '62200', '0,60000,62200,', '62299', '其他汽车制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62300', '60000', '0,60000,', '62300', '铁路、船舶、航空设备制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62301', '62300', '0,60000,62300,', '62301', '轨道交通运输设备制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62302', '62300', '0,60000,62300,', '62302', '船舶制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62303', '62300', '0,60000,62300,', '62303', '航空产品装配、调试人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62304', '62300', '0,60000,62300,', '62304', '摩托车、自行车制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62399', '62300', '0,60000,62300,', '62399', '其他铁路、船舶、航空设备制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62400', '60000', '0,60000,', '62400', '电气机械和器材制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62401', '62400', '0,60000,62400,', '62401', '电机制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62402', '62400', '0,60000,62400,', '62402', '输配电及控制设备制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62403', '62400', '0,60000,62400,', '62403', '电线电缆、光纤光缆及电工器材制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62404', '62400', '0,60000,62400,', '62404', '电池制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62405', '62400', '0,60000,62400,', '62405', '家用电器器具制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62406', '62400', '0,60000,62400,', '62406', '非家用电器器具制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62407', '62400', '0,60000,62400,', '62407', '照明器具制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62408', '62400', '0,60000,62400,', '62408', '电气信号设备装置制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62499', '62400', '0,60000,62400,', '62499', '其他电气机械和器材制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62500', '60000', '0,60000,', '62500', '计算机、通信和其他电子设备制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62501', '62500', '0,60000,62500', '62501', '电子元件制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62502', '62500', '0,60000,62500', '62502', '电子器件制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62503', '62500', '0,60000,62500', '62503', '计算机制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62504', '62500', '0,60000,62500', '62504', '电子设备装配调试人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62599', '62500', '0,60000,62500', '62599', '其他计算机、通信和其他电子设备制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62600', '60000', '0,60000,', '62600', '仪器仪表制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62601', '62600', '0,60000,62600', '62601', '仪器仪表装配人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62699', '62600', '0,60000,62600', '62699', '其他仪器仪表制造人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62700', '60000', '0,60000,', '62700', '废弃资源综合利用人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62701', '62700', '0,60000,62700,', '62701', '废料和碎屑加工处理人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62799', '62700', '0,60000,62700,', '62799', '其他废弃资源综合利用人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62800', '60000', '0,60000,', '62800', '电力、热力、气体、水生产和输配人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62801', '62800', '0,60000,62800,', '62801', '电力、热力生产和供应人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62802', '62800', '0,60000,62800,', '62802', '气体生产、处理和输送人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62803', '62800', '0,60000,62800,', '62803', '水生产、输排和水处理人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62899', '62800', '0,60000,62800,', '62899', '其他电力、热力、气体、水生产和输配人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62900', '60000', '0,60000,', '62900', '建筑施工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62901', '62900', '0,60000,62900,', '62901', '房屋建筑施工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62902', '62900', '0,60000,62900,', '62902', '土木工程建筑施工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62903', '62900', '0,60000,62900,', '62903', '建筑安装施工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62904', '62900', '0,60000,62900,', '62904', '建筑装饰人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62905', '62900', '0,60000,62900,', '62905', '古建筑修建人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('62999', '62900', '0,60000,62900,', '62999', '其他建筑施工人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('63000', '60000', '0,60000,', '63000', '运输设备和通用工程机械操作人员及有关人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('63001', '63000', '0,60000,63000,', '63001', '专用车辆操作人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('63002', '63000', '0,60000,63000,', '63002', '轨道交通运输机械设备操作人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('63003', '63000', '0,60000,63000,', '63003', '民用航空设备操作及有关人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('63004', '63000', '0,60000,63000,', '63004', '水上运输设备操作及有关人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('63005', '63000', '0,60000,63000,', '63005', '通用工程机械操作人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('63099', '63000', '0,60000,63000,', '63099', '其他运输设备和通用工程机械操作人员及有关人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('63100', '60000', '0,60000,', '63100', '生产辅助人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('63101', '63100', '0,60000,63100,', '63101', '机械设备修理人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('63102', '63100', '0,60000,63100,', '63102', '船舶、民用航空器修理人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('63103', '63100', '0,60000,63100,', '63103', '检验试验人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('63104', '63100', '0,60000,63100,', '63104', '称重计量人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('63105', '63100', '0,60000,63100,', '63105', '包装人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('63106', '63100', '0,60000,63100,', '63106', '安全生产管理人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('63199', '63100', '0,60000,63100,', '63199', '其他生产辅助人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('69900', '60000', '0,60000,', '69900', '其他生产制造及有关人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('70000', '0', '0,', '70000', '军人', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');
INSERT INTO `sys_dicts` (`id`, `parent_id`, `parent_ids`, `value`, `label`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('80000', '0', '0,', '80000', '不便分类的其他从业人员', 'ccm_occupation', '职业', '1', '1', '2020-03-31 15:07:53', '1', '2020-03-31 15:08:10', NULL, '0');


--添加信息采集社会治安 嫌疑人显示权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'a42670932dad468989033c1455681abd', 'bda5b1b6bb5649a7a0b5f53ab91554b9', '0,1,70a1747ee8334e439b2b24ebe947ecdd,72907f43bb8d43ac8973b253ef575f85,bda5b1b6bb5649a7a0b5f53ab91554b9,', '显示', '', '', '', 30, '0', 'event:ccmEventStakeholder:view', '1', '2020-04-02 16:21:03.545', '1', '2020-04-02 16:21:03.545', '', '0' );

--添加实有人口导入权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '4635febdab404892b034525ce36e0584', 'e85d153e171e4dea97915a23bdb2dab7', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,130200,e85d153e171e4dea97915a23bdb2dab7,', '导入', '', '', '', 150, '1', 'pop:ccmPeople:import', '1', '2020-04-03 15:12:19.693', '1', '2020-04-03 15:12:19.693', '', '0' );

--实有人口导入权限  隐藏
UPDATE sys_menu SET parent_id = 'e85d153e171e4dea97915a23bdb2dab7', parent_ids = '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,130200,e85d153e171e4dea97915a23bdb2dab7,', name = '导入', href = '', target = '', icon = '', sort = 150, is_show = '0', permission = 'pop:ccmPeople:import', update_by = '1', update_date = '2020-04-03 15:22:25.88', remarks = ''
 WHERE id = '4635febdab404892b034525ce36e0584';

--添加实有人口导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '68c12f584cd04ab795f0357df1a63339', 'e85d153e171e4dea97915a23bdb2dab7', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,130200,e85d153e171e4dea97915a23bdb2dab7,', '导出', '', '', '', 180, '1', 'pop:ccmPeople:export', '1', '2020-04-03 15:15:46.848', '1', '2020-04-03 15:15:46.848', '', '0' );
--实有人口导出权限  隐藏
UPDATE sys_menu SET parent_id = 'e85d153e171e4dea97915a23bdb2dab7', parent_ids = '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,130200,e85d153e171e4dea97915a23bdb2dab7,', name = '导出', href = '', target = '', icon = '', sort = 180, is_show = '0', permission = 'pop:ccmPeople:export', update_by = '1', update_date = '2020-04-03 15:23:40.256', remarks = ''
 WHERE id = '68c12f584cd04ab795f0357df1a63339';

--添加常住人口导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'b2d3455635d74f1986901dcf26c23056', 'b8046a5eb8284c65be0e5574791e08f0', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,130200,b8046a5eb8284c65be0e5574791e08f0,', '导出', '', '', '', 90, '0', 'pop:ccmPermanent:export', '1', '2020-04-03 15:36:24.533', '1', '2020-04-03 15:36:24.533', '', '0' );

--添加社区矫正人员导入权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '100cd149568f492784609456fee3c5d1', '130302', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,130302,', '导入', '', '', '', 120, '0', 'house:ccmHouseRectification:import', '1', '2020-04-03 15:41:47.114', '1', '2020-04-03 15:41:47.114', '', '0' );

--添加社区矫正人员导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '9f88ee1f686f4bb0a524babb37850354', '130302', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,130302,', '导出', '', '', '', 150, '0', 'house:ccmHouseRectification:export', '1', '2020-04-03 15:59:37.705', '1', '2020-04-03 15:59:37.705', '', '0' );

--添加安置帮教人员导入权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'bd45a2d9355e4e239b1cc00cbef4e70e', '130301', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,130301,', '导入', '', '', '', 120, '1', 'house:ccmHouseRelease:import', '1', '2020-04-03 16:10:09.325', '1', '2020-04-03 16:10:09.325', '', '0' );

--添加安置帮教人员导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'ecff203356e34e4c96d12cd7df04b14a', '130301', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,130301,', '导出', '', '', '', 150, '0', 'house:ccmHouseRelease:export', '1', '2020-04-03 16:14:10.422', '1', '2020-04-03 16:14:10.422', '', '0' );

--添加肇事肇祸等严重精神障碍患者导入权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'd84841539ede4ca49c1fd7da400811a1', '130303', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,130303,', '导入', '', '', '', 120, '0', 'house:ccmHousePsychogeny:import', '1', '2020-04-03 16:21:48.03', '1', '2020-04-03 16:21:48.03', '', '0' );

--添加肇事肇祸等严重精神障碍患者导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '4633f183e7b64507ac298e190d63a9f5', '130303', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,130303,', '导出', '', '', '', 150, '0', 'house:ccmHousePsychogeny:export', '1', '2020-04-03 16:23:18.36', '1', '2020-04-03 16:23:18.36', '', '0' );

--添加吸毒人员导入权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '67060aad0e044f6f8a215098ba516ded', '130304', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,130304,', '导入', '', '', '', 120, '0', 'house:ccmHouseDrugs:import', '1', '2020-04-03 16:27:52.583', '1', '2020-04-03 16:27:52.583', '', '0' );

--添加吸毒人员导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '19a5302fc30e44688a4574cd1f9e1ecf', '130304', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,130304,', '导出', '', '', '', 150, '0', 'house:ccmHouseDrugs:export', '1', '2020-04-03 16:28:47.104', '1', '2020-04-03 16:28:47.104', '', '0' );

--添加艾滋病危险人员导入权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '3cec5c88f4954c7cabe38754cfd80943', '130305', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,130305,', '导入', '', '', '', 120, '0', 'house:ccmHouseAids:import', '1', '2020-04-03 16:32:13.706', '1', '2020-04-03 16:32:13.706', '', '0' );

--添加艾滋病危险人员导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '15b14491d61d469ebe5fd80c390d592c', '130305', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,130305,', '导出', '', '', '', 150, '0', 'house:ccmHouseAids:export', '1', '2020-04-03 16:33:02.5', '1', '2020-04-03 16:33:02.5', '', '0' );

--添加重点上访人员导入权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'e6b8d85f62634e379fc2880b66ab3c0a', 'f15dc5be11f14cf8976090c38f27aaa3', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,f15dc5be11f14cf8976090c38f27aaa3,', '导入', '', '', '', 120, '0', 'house:ccmHousePetition:import', '1', '2020-04-03 16:35:43.783', '1', '2020-04-03 16:35:43.783', '', '0' );

--添加重点上访人员导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '6672e3aa39a141668e118a3c700126e1', 'f15dc5be11f14cf8976090c38f27aaa3', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,f15dc5be11f14cf8976090c38f27aaa3,', '导出', '', '', '', 150, '0', 'house:ccmHousePetition:export', '1', '2020-04-03 16:36:33.171', '1', '2020-04-03 16:36:33.171', '', '0' );

--添加涉教人员导入权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '780e1f174d0647d48fc974bbed5ccbe5', 'c4d4f530c1a14671a89df623ed93adef', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,c4d4f530c1a14671a89df623ed93adef,', '导入', '', '', '', 120, '0', 'house:ccmHouseHeresy:import', '1', '2020-04-03 16:39:03.093', '1', '2020-04-03 16:39:03.093', '', '0' );

--添加涉教人员导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '7b356496296049488668c28343cf0280', 'c4d4f530c1a14671a89df623ed93adef', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,c4d4f530c1a14671a89df623ed93adef,', '导出', '', '', '', 150, '0', 'house:ccmHouseHeresy:export', '1', '2020-04-03 16:40:37.936', '1', '2020-04-03 16:40:37.936', '', '0' );

--添加危险品从业人员导入权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '2bd658aa091a41be91e9e1e0b9e1f3ab', 'b0bceb9eabc744ee83bd75c7fb63f828', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,b0bceb9eabc744ee83bd75c7fb63f828,', '导入', '', '', '', 120, '0', 'house:ccmHouseDangerous:import', '1', '2020-04-03 16:45:25.774', '1', '2020-04-03 16:45:25.774', '', '0' );

--添加危险品从业人员导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '71218e325cfe4a4f80d526c42a7ad691', 'b0bceb9eabc744ee83bd75c7fb63f828', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,b0bceb9eabc744ee83bd75c7fb63f828,', '导出', '', '', '', 150, '0', 'house:ccmHouseDangerous:export', '1', '2020-04-03 16:46:43.281', '1', '2020-04-03 16:46:43.281', '', '0' );

--添加危害国家安全活动嫌疑人员导入权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'bde14cf5e6a54b10a46635265adbb92b', 'b0c901671d894530b31e4f031763446d', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,b0c901671d894530b31e4f031763446d,', '导入', '', '', '', 120, '0', 'house:ccmHarmNationalSecurity:import', '1', '2020-04-03 16:59:14.844', '1', '2020-04-03 16:59:14.844', '', '0' );

--添加危害国家安全活动嫌疑人员导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'ba4591a9179541928a8caf7674e25f9f', 'b0c901671d894530b31e4f031763446d', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,b0c901671d894530b31e4f031763446d,', '导出', '', '', '', 150, '0', 'house:ccmHarmNationalSecurity:export', '1', '2020-04-03 17:00:56.236', '1', '2020-04-03 17:00:56.236', '', '0' );

--添加严重刑事犯罪活动嫌疑人员导入权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'db54c8517f0d402a8ea8315f3a458ce2', '5698daba505f4dbaa6c84fa7f3812b28', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,5698daba505f4dbaa6c84fa7f3812b28,', '导入', '', '', '', 120, '0', 'house:ccmSeriousCriminalOffense:import', '1', '2020-04-03 17:05:15.316', '1', '2020-04-03 17:05:15.316', '', '0' );

--添加严重刑事犯罪活动嫌疑人员导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'a5bc956f20f141a39608a2ead47acb10', '5698daba505f4dbaa6c84fa7f3812b28', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,5698daba505f4dbaa6c84fa7f3812b28,', '导出', '', '', '', 150, '0', 'house:ccmSeriousCriminalOffense:export', '1', '2020-04-03 17:06:06.047', '1', '2020-04-03 17:06:06.047', '', '0' );

--添加闹事行凶报复嫌疑人员导入权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'd18f09eebdce4d6a9dd9f812f94d96fb', '0a5043def4f64ebe8227585015bb532c', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,0a5043def4f64ebe8227585015bb532c,', '导入', '', '', '', 120, '0', 'house:ccmHouseDispute:import', '1', '2020-04-03 17:08:26.496', '1', '2020-04-03 17:08:26.496', '', '0' );

--添加闹事行凶报复嫌疑人员导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'b246bbcb50c34ee8877744a8750ceb8b', '0a5043def4f64ebe8227585015bb532c', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,0a5043def4f64ebe8227585015bb532c,', '导出', '', '', '', 150, '0', 'house:ccmHouseDispute:export', '1', '2020-04-03 17:09:12.497', '1', '2020-04-03 17:09:12.497', '', '0' );

--添加故意违法刑释不足5年人员导入权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '09ac65c1facf4c1db909b57ff83920cf', '37eaaa6f331b412b96a598b07431e3f6', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,37eaaa6f331b412b96a598b07431e3f6,', '导入', '', '', '', 90, '0', 'house:ccmHouseDeliberatelyIllegal:import', '1', '2020-04-03 17:14:35.865', '1', '2020-04-03 17:14:35.865', '', '0' );

--添加故意违法刑释不足5年人员导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'cb4b7e87a8f84d8fb637bb79f55313cb', '37eaaa6f331b412b96a598b07431e3f6', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,37eaaa6f331b412b96a598b07431e3f6,', '导出', '', '', '', 120, '0', 'house:ccmHouseDeliberatelyIllegal:export', '1', '2020-04-03 17:15:34.581', '1', '2020-04-03 17:15:34.581', '', '0' );

--添加留守人员导入权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '5d76dab775be406d9baa7c243dddb2ea', '7cc0fb0c1187437aa3f4bad132c67ce1', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,7cc0fb0c1187437aa3f4bad132c67ce1,', '导入', '', '', '', 120, '0', 'pop:ccmPopBehind:import', '1', '2020-04-03 17:18:32.312', '1', '2020-04-03 17:18:32.312', '', '0' );

--添加留守人员导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '3918a9fb44b04283b43cff496b9933c5', '7cc0fb0c1187437aa3f4bad132c67ce1', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,7cc0fb0c1187437aa3f4bad132c67ce1,', '导出', '', '', '', 150, '0', 'pop:ccmPopBehind:export', '1', '2020-04-03 17:19:30.008', '1', '2020-04-03 17:19:30.008', '', '0' );

--添加老年人人员导入权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '340a7d1ae28f4a439896c7bfbc3dfb2b', '81349c6f45614556a51ad2626ea4e594', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,81349c6f45614556a51ad2626ea4e594,', '导入', '', '', '', 120, '0', 'pop:ccmOlder:import', '1', '2020-04-03 17:21:55.217', '1', '2020-04-03 17:21:55.217', '', '0' );

--添加老年人人员导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '1225226011024f099833b081bfebecc0', '81349c6f45614556a51ad2626ea4e594', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,81349c6f45614556a51ad2626ea4e594,', '导出', '', '', '', 150, '0', 'pop:ccmOlder:export', '1', '2020-04-03 17:23:17.675', '1', '2020-04-03 17:23:17.675', '', '0' );

--删除老年人导入权限
UPDATE sys_menu SET del_flag = '1'
 WHERE id = '340a7d1ae28f4a439896c7bfbc3dfb2b' OR parent_ids LIKE CONCAT('%,', '340a7d1ae28f4a439896c7bfbc3dfb2b', ',%');

--添加特殊关怀人员导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '672ef7248f3d497099e33357abcfb30a', '7549b37b7c454434aadc05340cf041e4', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,b3b0c87bb91345bd93903fb7fa267b9d,7549b37b7c454434aadc05340cf041e4,', '导出', '', '', '', 120, '0', 'pop:ccmCare:export', '1', '2020-04-03 17:28:15.013', '1', '2020-04-03 17:28:15.013', '', '0' );

--添加户籍人口导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'b1e82f09fe194b43953ce3d9f6791c4b', 'e7ce98ca319c456389c27267390f6dc1', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,128262e395f24b22b2371f932100bc8b,e7ce98ca319c456389c27267390f6dc1,', '导出', '', '', '', 30, '0', 'pop:ccmWork:export', '1', '2020-04-03 17:32:09.017', '1', '2020-04-03 17:32:09.017', '', '0' );

--添加流动人口导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '189c6057b8be46e69d9b54d0aa52f908', 'b4bdb963bc8a4261b6ebd7738023b328', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,128262e395f24b22b2371f932100bc8b,b4bdb963bc8a4261b6ebd7738023b328,', '导出', '', '', '', 30, '0', 'pop:ccmWork:export', '1', '2020-04-03 17:39:13.556', '1', '2020-04-03 17:39:13.556', '', '0' );

--添加境外人口导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '7a11e0b8d8ff489283b9a25d5eaf8268', 'ea7b426e97794021b55bbc04cea71527', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,128262e395f24b22b2371f932100bc8b,ea7b426e97794021b55bbc04cea71527,', '导出', '', '', '', 30, '0', 'pop:ccmWork:export', '1', '2020-04-03 17:41:56.124', '1', '2020-04-03 17:41:56.124', '', '0' );

--添加未落户人口权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'bee1e10e042e40b2bce1dbd878244683', 'fbf53f7db220468eabe48c910a187081', '0,1,70a1747ee8334e439b2b24ebe947ecdd,03b4e19ae79643398608d7820c29e05d,128262e395f24b22b2371f932100bc8b,fbf53f7db220468eabe48c910a187081,', '导出', '', '', '', 30, '0', 'pop:ccmWork:export', '1', '2020-04-03 17:43:43.249', '1', '2020-04-03 17:43:43.249', '', '0' );

--添加房屋导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '63ee2b0aff3142689acf4da1dc7dc5f2', '130102', '0,1,70a1747ee8334e439b2b24ebe947ecdd,8a4e93364951448d89195964e7fadb58,130102,', '导出', '', '', '', 90, '0', 'pop:ccmPopTenant:export', '1', '2020-04-03 17:46:30.298', '1', '2020-04-03 17:46:30.298', '', '0' );

--添加出租房导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '96a2093f12c94e0d96ecdbe5c94c75a2', '4ae31e51c8be4c34a757aebd99be3e14', '0,1,70a1747ee8334e439b2b24ebe947ecdd,8a4e93364951448d89195964e7fadb58,4ae31e51c8be4c34a757aebd99be3e14,', '导出', '', '', '', 90, '0', 'tenant:ccmTenantRecord:export', '1', '2020-04-03 17:48:55.312', '1', '2020-04-03 17:48:55.312', '', '0' );

--添加建筑物导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '6685a8c3e3fb440fad336f5edb0905b6', '1301012', '0,1,70a1747ee8334e439b2b24ebe947ecdd,c7a14a5931c245928691e00e634400b9,1301012,', '导出', '', '', '', 120, '0', 'house:ccmHouseBuildmanage:export', '1', '2020-04-03 18:03:28.377', '1', '2020-04-03 18:03:28.377', '', '0' );

--添加重点青少年导入权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'b26d266337634bc4b3f25fc87b625732', '82cdfca6d890445ab10dff9afc462256', '0,1,70a1747ee8334e439b2b24ebe947ecdd,f79f4645d621412dafb1e616454e080a,82cdfca6d890445ab10dff9afc462256,', '导入', '', '', '', 120, '0', 'house:ccmHouseKym:import', '1', '2020-04-03 18:07:05.199', '1', '2020-04-03 18:07:05.199', '', '0' );

--添加重点青少年导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '77adf3b999bf40e490861d4d46cb2168', '82cdfca6d890445ab10dff9afc462256', '0,1,70a1747ee8334e439b2b24ebe947ecdd,f79f4645d621412dafb1e616454e080a,82cdfca6d890445ab10dff9afc462256,', '导出', '', '', '', 150, '0', 'house:ccmHouseKym:export', '1', '2020-04-03 18:07:48.821', '1', '2020-04-03 18:07:48.821', '', '0' );

--添加社会组织机构导入权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'eb757e4c12d74427bba39ce50dbe4ded', '759b972450344b35973539f1f593fb68', '0,1,70a1747ee8334e439b2b24ebe947ecdd,72907f43bb8d43ac8973b253ef575f85,130700,759b972450344b35973539f1f593fb68,', '导入', '', '', '', 90, '0', 'org:ccmOrgSocialorg:import', '1', '2020-04-03 18:10:44.516', '1', '2020-04-03 18:10:44.516', '', '0' );

--添加社会组织机构导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '1c481997009648c4bd4c26f956ae1cb3', '759b972450344b35973539f1f593fb68', '0,1,70a1747ee8334e439b2b24ebe947ecdd,72907f43bb8d43ac8973b253ef575f85,130700,759b972450344b35973539f1f593fb68,', '导出', '', '', '', 120, '0', 'org:ccmOrgSocialorg:export', '1', '2020-04-03 18:11:28.775', '1', '2020-04-03 18:11:28.775', '', '0' );

--添加综治队伍导入权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'f81249bbc9354dd883cb8be2959d033b', '3362cdb2b3c447fbbd89697c43b80928', '0,1,70a1747ee8334e439b2b24ebe947ecdd,120100,3362cdb2b3c447fbbd89697c43b80928,', '导入', '', '', '', 150, '0', 'view:vCcmTeam:import', '1', '2020-04-03 18:14:58.013', '1', '2020-04-03 18:14:58.013', '', '0' );

--添加综治队伍导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'ad2b317be75649468de4e59c91960851', '3362cdb2b3c447fbbd89697c43b80928', '0,1,70a1747ee8334e439b2b24ebe947ecdd,120100,3362cdb2b3c447fbbd89697c43b80928,', '导出', '', '', '', 180, '0', 'view:vCcmTeam:export', '1', '2020-04-03 18:16:17.18', '1', '2020-04-03 18:16:17.18', '', '0' );

--添加经济运行数据导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'd6bdf21398324e66b8ef2bbd71c7b433', 'bc87b5f6d88b4d73b9d9207e499ddab3', '0,1,70a1747ee8334e439b2b24ebe947ecdd,c3291baa80784d5c864966e42b3006d1,130600,bc87b5f6d88b4d73b9d9207e499ddab3,', '导出', '', '', '', 90, '0', 'org:ccmOrgNpseEconomic:export', '1', '2020-04-06 09:45:17.872', '1', '2020-04-06 09:45:17.872', '', '0' );

--添加日常工作导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '610abc24d5f94dae9ad9558a43dc5f4b', '06de0147592f4662823997e71df3e4c6', '0,1,3b3a641046be4558b92178d07f93b280,49e5e6530328478aa0a8182d98e93bae,26f4f530319642f6a983b2e0590d47e9,06de0147592f4662823997e71df3e4c6,', '导出', '', '', '', 30, '0', 'sys:ccmWorkReportJob:export', '1', '2020-04-06 09:57:17.069', '1', '2020-04-06 09:57:17.069', '', '0' );

--添加日常走访导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'fef8c1c57be148c58fcfeb94cc33c479', '1a186aa86f054ca8804e0d096e8e8752', '0,1,3b3a641046be4558b92178d07f93b280,49e5e6530328478aa0a8182d98e93bae,26f4f530319642f6a983b2e0590d47e9,1a186aa86f054ca8804e0d096e8e8752,', '导出', '', '', '', 30, '0', 'sys:ccmWorkReportVisit:export', '1', '2020-04-06 10:00:51.308', '1', '2020-04-06 10:00:51.308', '', '0' );

--添加事件处理导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'e61a67de3e0e4374ac84bc028e73ced0', 'c47ae082d2a043bbb24823cdca68569e', '0,1,3b3a641046be4558b92178d07f93b280,49e5e6530328478aa0a8182d98e93bae,26f4f530319642f6a983b2e0590d47e9,c47ae082d2a043bbb24823cdca68569e,', '导出', '', '', '', 30, '0', 'sys:ccmEventProcess:export', '1', '2020-04-06 10:04:49.768', '1', '2020-04-06 10:04:49.768', '', '0' );

--添加日志统计导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '41afb894212c4eb5adf2497754a32c87', 'c1b860986a624230943185d8c5517428', '0,1,3b3a641046be4558b92178d07f93b280,49e5e6530328478aa0a8182d98e93bae,26f4f530319642f6a983b2e0590d47e9,c1b860986a624230943185d8c5517428,', '导出', '', '', '', 30, '0', 'sys:ccmWorkReportCount:export', '1', '2020-04-06 10:07:42.731', '1', '2020-04-06 10:07:42.731', '', '0' );

--添加我的工作日志导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '742866993ea34f2ca9bf98161966c36c', '5d05d974899044b39c26145ace18aa34', '0,1,3b3a641046be4558b92178d07f93b280,49e5e6530328478aa0a8182d98e93bae,26f4f530319642f6a983b2e0590d47e9,5d05d974899044b39c26145ace18aa34,', '导出', '', '', '', 90, '0', 'sys:ccmMyWorkReport:export', '1', '2020-04-06 10:11:05.089', '1', '2020-04-06 10:11:05.089', '', '0' );

--添加日志收件箱导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '91e293d4081942dabe71df7653a61754', '3003201be694484fb1ddb256487fef6d', '0,1,3b3a641046be4558b92178d07f93b280,49e5e6530328478aa0a8182d98e93bae,26f4f530319642f6a983b2e0590d47e9,3003201be694484fb1ddb256487fef6d,', '导出', '', '', '', 30, '0', 'sys:ccmWorkReportSelf:export', '1', '2020-04-06 10:14:12.962', '1', '2020-04-06 10:14:12.962', '', '0' );

--添加值班日志导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'ecf04f456c0143e984ddb4d7b70d5d81', 'c2adb9a570c1497fbfe47fd64f448ff9', '0,1,3b3a641046be4558b92178d07f93b280,91c0273bb9a444f7ace12d6f75c36141,c2adb9a570c1497fbfe47fd64f448ff9,', '导出', '', '', '', 90, '0', 'work:ccmWorkBeondutylog:export', '1', '2020-04-06 10:31:56.346', '1', '2020-04-06 10:31:56.346', '', '0' );

--添加网格员信息导入权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '667e30a155f5423d9077f732b70e0781', '17816839121849519359a32d44ba7327', '0,1,3b3a641046be4558b92178d07f93b280,30d0d8e0446b4c7982a93352b5eae35b,3db3d5d00207461e85e7a07f8d97d9fa,17816839121849519359a32d44ba7327,', '导入', '', '', '', 150, '0', 'org:vCcmTeam:import', '1', '2020-04-06 10:37:06.193', '1', '2020-04-06 10:37:06.193', '', '0' );
--修改网格员信息导入权限
UPDATE sys_menu SET parent_id = '17816839121849519359a32d44ba7327', parent_ids = '0,1,3b3a641046be4558b92178d07f93b280,30d0d8e0446b4c7982a93352b5eae35b,3db3d5d00207461e85e7a07f8d97d9fa,17816839121849519359a32d44ba7327,', name = '导入', href = '', target = '', icon = '', sort = 150, is_show = '0', permission = 'view:vCcmTeam:import', update_by = '1', update_date = '2020-04-06 10:45:51.484', remarks = ''
 WHERE id = '667e30a155f5423d9077f732b70e0781';
--添加网格员信息导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'a75e66f9af1841dd9c5e98bd4051e176', '17816839121849519359a32d44ba7327', '0,1,3b3a641046be4558b92178d07f93b280,30d0d8e0446b4c7982a93352b5eae35b,3db3d5d00207461e85e7a07f8d97d9fa,17816839121849519359a32d44ba7327,', '导出', '', '', '', 180, '0', 'org:vCcmTeam:export', '1', '2020-04-06 10:44:05.3', '1', '2020-04-06 10:44:05.3', '', '0' );
--修改网格员信息导出权限
UPDATE sys_menu SET parent_id = '17816839121849519359a32d44ba7327', parent_ids = '0,1,3b3a641046be4558b92178d07f93b280,30d0d8e0446b4c7982a93352b5eae35b,3db3d5d00207461e85e7a07f8d97d9fa,17816839121849519359a32d44ba7327,', name = '导出', href = '', target = '', icon = '', sort = 180, is_show = '0', permission = 'view:vCcmTeam:export', update_by = '1', update_date = '2020-04-06 10:47:15.148', remarks = ''
 WHERE id = 'a75e66f9af1841dd9c5e98bd4051e176';

--添加考勤统计导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '5e0900634fbe45b38933cc4c0c23398c', '6533dbc83144476291dd1c85fa08ec45', '0,1,3b3a641046be4558b92178d07f93b280,30d0d8e0446b4c7982a93352b5eae35b,01f29a340a9c49ce9d287a14c2ea9a45,6533dbc83144476291dd1c85fa08ec45,', '导出', '', '', '', 90, '0', 'attendance:ccmWorkerAttendanceCount:export', '1', '2020-04-06 10:50:08.303', '1', '2020-04-06 10:50:08.303', '', '0' );

--添加绩效成绩汇总导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'a65683b51a1f4e47bd80c6c8b94c22db', 'b56e4b74b67a48f2842155a6fd962545', '0,1,6611617ad88549aabd105dc438b21f14,dee2aaeca9ed4e60a9cbffdc5d4d6229,b56e4b74b67a48f2842155a6fd962545,', '导出', '', '', '', 60, '0', 'score:kpiFinalScore:export', '1', '2020-04-06 11:11:54.333', '1', '2020-04-06 11:11:54.333', '', '0' );

--添加用户管理导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'cf587f9b65424c8ba1587e79d7c7fb2c', '20', '0,1,2,13,20,', '导出', '', '', '', 70, '0', 'sys:user:export', '1', '2020-04-06 11:17:29.995', '1', '2020-04-06 11:17:29.995', '', '0' );

--添加监控设备管理导入权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'ec47af39ae7b47e19bc705b3261a80c4', '8ea81c6ebb3a4e3a8074e51da0a4486a', '0,1,2,ba41342f6add4b8ab7684d07749229d5,8ea81c6ebb3a4e3a8074e51da0a4486a,', '导入', '', '', '', 90, '0', 'ccmsys:ccmDevice:import', '1', '2020-04-06 11:26:27.006', '1', '2020-04-06 11:26:27.006', '', '0' );

--添加监控设备管理导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( '5c550ee92869423d860b4c00a6407d40', '8ea81c6ebb3a4e3a8074e51da0a4486a', '0,1,2,ba41342f6add4b8ab7684d07749229d5,8ea81c6ebb3a4e3a8074e51da0a4486a,', '导出', '', '', '', 120, '0', 'ccmsys:ccmDevice:export', '1', '2020-04-06 11:28:33.029', '1', '2020-04-06 11:28:33.029', '', '0' );

--添加日志查询导出权限
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'afc73949265342529af0019b1acecae6', '68', '0,1,2,67,68,', '导出', '', '', '', 30, '0', 'sys:log:export', '1', '2020-04-06 11:31:39.05', '1', '2020-04-06 11:31:39.05', '', '0' );




-- 添加字段 ccm_event_casedeal
ALTER TABLE `ccm_event_casedeal`
ADD COLUMN `manage_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办理状态' AFTER `del_flag`,
ADD COLUMN `file` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件' AFTER `manage_type`,
ADD COLUMN `grade_num` int(1) NULL DEFAULT 0 COMMENT '等级评估' AFTER `file`,
ADD COLUMN `effect_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '效果评估' AFTER `grade_num`;



DROP TABLE IF EXISTS `bph_user_extend`;
CREATE TABLE `bph_user_extend`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `police_phone_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '警务通',
  `action_recorder_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执法记录仪',
  `interphone_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对讲机',
  `defualt_device` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认使用  0:警务通 1:执法记录仪 2:对讲机',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `update_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除  0 否 1 是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;



ALTER TABLE `ccm_mobile_device`
ADD COLUMN `param` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备参数信息' AFTER `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子围栏id' AFTER `people_id`;


ALTER TABLE `ccm_org_area`
ADD COLUMN `key_personnel_num` int(10) NULL DEFAULT NULL COMMENT '重点人员' AFTER `mannum`,
ADD COLUMN `party_members_num` int(10) UNSIGNED ZEROFILL NULL DEFAULT 0000000000 COMMENT '党员人数' AFTER `del_flag`,
ADD COLUMN `director_poverty_alleviation` int(11) UNSIGNED ZEROFILL NULL DEFAULT 00000000000 COMMENT '扶贫主任' AFTER `party_members_num`,
ADD COLUMN `first_secretary` int(11) UNSIGNED ZEROFILL NULL DEFAULT 00000000000 COMMENT '扶贫第一书记' AFTER `director_poverty_alleviation`,
ADD COLUMN `police_assistant` int(11) UNSIGNED ZEROFILL NULL DEFAULT 00000000000 COMMENT '警务助理' AFTER `first_secretary`,
ADD COLUMN `political_legal_deployment` int(11) UNSIGNED ZEROFILL NULL DEFAULT 00000000000 COMMENT '政法派驻员' AFTER `police_assistant`,
ADD COLUMN `people_livelihood_supervisor` int(11) UNSIGNED ZEROFILL NULL DEFAULT 00000000000 COMMENT '民生监督员' AFTER `political_legal_deployment`;
ADD COLUMN `area_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域颜色rgb' AFTER `more3`;

-- 楼栋增加已采集人数字段
ALTER TABLE `ccm_house_buildmanage`
ADD COLUMN `gather_num` int(6) NULL COMMENT '楼栋已采集人数' AFTER `build_peo`;

-- ccm_people表 插入时触发器
add_gather	AFTER	-1	0	0	UPDATE ccm_house_buildmanage SET gather_num=ifnull(gather_num,0)+1 WHERE id=new.build_id
-- ccm_people表 更新时触发器
update_gather	AFTER	0	-1	0	BEGIN
if new.build_id != old.build_id then
UPDATE ccm_house_buildmanage SET gather_num=ifnull(gather_num,0)-1 WHERE id=old.build_id;
UPDATE ccm_house_buildmanage SET gather_num=ifnull(gather_num,0)+1 WHERE id=new.build_id;
end if;
END
-- ccm_people表 删除时触发器
delete_gather	AFTER	0	0	-1	UPDATE ccm_house_buildmanage SET gather_num=ifnull(gather_num,0)-1 WHERE id=old.build_id

-- 添加函数：根据ccm_people中人员关联的build_id向ccm_house_buildmanage字段gather_num（已采集人数）赋值
CREATE DEFINER=`root`@`localhost` PROCEDURE `COUNT_BUILD_GATHER`()
BEGIN
UPDATE ccm_house_buildmanage b
INNER JOIN (
SELECT
 build_id AS "build_id",
 count( * ) AS "num"
FROM
 ccm_house_buildmanage build
 LEFT JOIN ccm_people people ON build.id = people.build_id
WHERE
 people.del_flag = 0
GROUP BY
 build.id
 ) p ON p.build_id = b.id
 SET b.gather_num = p.num
WHERE
 b.id = p.build_id;
END


UPDATE `sys_menu` SET `parent_id` = '170000', `parent_ids` = '0,1,170000,', `name` = '治安乱点整治报表', `sort` = 700, `href` = '', `target` = '', `icon` = 'zhian', `is_show` = '0', `permission` = '', `create_by` = '1', `create_date` = '2018-03-23 14:19:41', `update_by` = '1', `update_date` = '2020-04-07 11:21:47', `remarks` = '', `del_flag` = '0' WHERE `id` = Cast('c9cc1fd43d834da692c3fbab6cffd8c5' AS Binary(32));
UPDATE `sys_menu` SET `parent_id` = '170300', `parent_ids` = '0,1,170000,170300,', `name` = '矛盾纠纷排查统计', `sort` = 330, `href` = '/event/ccmEventAmbi/map', `target` = '', `icon` = 'unlock', `is_show` = '0', `permission` = '', `create_by` = '1', `create_date` = '2018-03-23 14:17:59', `update_by` = '1', `update_date` = '2020-04-07 11:21:02', `remarks` = '', `del_flag` = '0' WHERE `id` = Cast('cb5733ff670b4c7f809b6b6dbf07a521' AS Binary(32));
UPDATE `sys_menu` SET `parent_id` = 'b5b8c33b437b417b852703a58ec22a04', `parent_ids` = '0,1,170000,b5b8c33b437b417b852703a58ec22a04,', `name` = '楼栋房屋数据分析', `sort` = 30, `href` = '/report/ccmReportOthers/houseAndBuild', `target` = '', `icon` = 'cloud-download', `is_show` = '0', `permission` = '', `create_by` = '1', `create_date` = '2018-03-27 11:12:02', `update_by` = '1', `update_date` = '2020-04-07 11:20:19', `remarks` = '', `del_flag` = '0' WHERE `id` = Cast('19fbbdff39a94ce7bd716d00beafbe4a' AS Binary(32));
UPDATE `sys_menu` SET `parent_id` = 'b5b8c33b437b417b852703a58ec22a04', `parent_ids` = '0,1,170000,b5b8c33b437b417b852703a58ec22a04,', `name` = '非公有制经济组织分析', `sort` = 60, `href` = '/report/ccmReportOthers/organization', `target` = '', `icon` = 'filter', `is_show` = '0', `permission` = '', `create_by` = '1', `create_date` = '2018-03-27 11:12:43', `update_by` = '1', `update_date` = '2020-04-07 11:19:53', `remarks` = '', `del_flag` = '0' WHERE `id` = Cast('3b87dfc20fe745bebccd1c2445530a19' AS Binary(32));


alter table ccm_people_amount add sex_unknow int(12) NULL DEFAULT NULL COMMENT '未说明性别总数';

-- 添加菜单：网格员管理->网格员登记->添加外出申请审核
INSERT INTO sys_menu( id, parent_id, parent_ids, name, href, target, icon, sort, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag ) VALUES ( 'ce6f21045a794293bebe9c663e5ae095', '01f29a340a9c49ce9d287a14c2ea9a45', '0,1,3b3a641046be4558b92178d07f93b280,30d0d8e0446b4c7982a93352b5eae35b,01f29a340a9c49ce9d287a14c2ea9a45,', '外出申请审核', '/attendanceapply/ccmWorkerAttendanceApply?type=1', '', '', 160, '1', '', '1', '2020-04-13 11:41:10.661', '1', '2020-04-13 11:41:10.661', '', '0' );
