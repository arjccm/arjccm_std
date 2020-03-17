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

--更改跟踪人员信息字典表table
UPDATE sys_dict SET label = "涉教人员" WHERE id="39127"

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