-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2017-04-01 06:12:10
-- 服务器版本： 5.7.14
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xihaxueche`
--

-- --------------------------------------------------------

--
-- 表的结构 `cs_menu`
--

CREATE TABLE `cs_menu` (
  `moduleid` int(11) UNSIGNED NOT NULL,
  `m_applicationid` int(11) NOT NULL COMMENT '应用ID可以实现不同管理系统公用一个菜单表',
  `m_parentid` int(11) NOT NULL COMMENT '菜单父级ID-对于的值未菜单ID 如果是一级菜单设置为0',
  `m_pagecode` varchar(6) NOT NULL COMMENT '菜单排序字段',
  `m_controller` varchar(50) DEFAULT NULL COMMENT '控制器url',
  `m_type` int(11) NOT NULL COMMENT '菜单类型（1：模块 2：操作{增删改查等}）',
  `m_cname` varchar(50) NOT NULL COMMENT '菜单中文名',
  `m_directory` varchar(255) NOT NULL COMMENT '菜单对于的url',
  `m_imageurl` varchar(255) NOT NULL COMMENT '菜单栏显示的图片路径',
  `i_order` int(10) UNSIGNED NOT NULL DEFAULT '100' COMMENT '排序数字',
  `m_close` int(4) NOT NULL COMMENT '是否开放（1：开放 2：不开放）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cs_menu`
--

INSERT INTO `cs_menu` (`moduleid`, `m_applicationid`, `m_parentid`, `m_pagecode`, `m_controller`, `m_type`, `m_cname`, `m_directory`, `m_imageurl`, `i_order`, `m_close`) VALUES
(21, 1, 0, '592975', 'School/index', 1, '驾校管理', '合作驾校管理', '', 1, 1),
(22, 1, 21, '593223', 'School/index', 1, '驾校列表', '展示驾校列表', '', 100, 1),
(23, 1, 21, '593295', 'School/siteAdmin', 1, '场地管理', '驾校场地管理', '', 100, 1),
(24, 1, 22, '593469', 'School/addSchool', 2, '新增', '新增驾校', '', 1001, 1),
(25, 1, 23, '593702', 'School/addSchoolSite', 2, '新增', '新增场地', '', 1001, 1),
(26, 1, 0, '594054', 'Cars/index', 1, '车辆管理', '驾校车辆管理', '', 2, 1),
(27, 1, 26, '594081', 'Cars/carsCategory', 1, '车型管理', '驾校车型管理', '', 100, 1),
(28, 1, 27, '594152', 'Cars/addCarsCategory', 2, '新增', '新增车型', '', 1001, 1),
(29, 1, 27, '594208', 'Cars/editCarsCategory', 2, '编辑', '编辑车型', '', 1003, 1),
(30, 1, 0, '666708', 'Manager/index', 1, '权限管理', '系统权限管理', '', 9, 1),
(31, 1, 30, '666863', 'Manager/index', 1, '管理员列表', '展示管理员列表', '', 103, 1),
(32, 1, 30, '666947', 'Manager/roleList', 1, '角色列表', '展示角色列表', '', 102, 1),
(33, 1, 30, '667021', 'Manager/menuList', 1, '菜单列表', '展示菜单列表', '', 101, 1),
(34, 1, 31, '667080', 'Manager/index', 2, '查看', '查看管理员', '', 1002, 1),
(35, 1, 32, '667118', 'Manager/roleList', 2, '查看', '查看角色', '', 1002, 1),
(36, 1, 33, '667154', 'Manager/menuList', 2, '查看', '查看菜单', '', 1002, 1),
(37, 1, 27, '672665', 'Cars/carsCategory', 2, '查看', '查看车型', '', 1002, 1),
(38, 1, 27, '672727', 'Cars/delCarsCategory', 2, '删除', '删除车型', '', 1004, 1),
(39, 1, 33, '834662', 'Manager/editMenu', 2, '编辑', '编辑菜单', '', 1003, 1),
(40, 1, 33, '834733', 'Manager/addMenu', 2, '新增', '新增菜单', '', 1001, 1),
(41, 1, 33, '834890', 'Manager/delMenu', 2, '删除', '删除菜单', '', 1004, 1),
(42, 1, 23, '835214', 'School/siteAdmin', 2, '查看', '查看场地', '', 1002, 1),
(43, 1, 32, '843505', 'Manager/addRoles', 2, '新增', '新增角色', '', 1001, 1),
(44, 1, 32, '160951', 'Manager/editRoles', 2, '编辑', '编辑角色', '', 1003, 1),
(45, 1, 32, '161058', 'Manager/delRoles', 2, '删除', '删除角色', '', 1004, 1),
(46, 1, 31, '165817', 'Manager/addManager', 2, '新增', '新增管理员', '', 1001, 1),
(47, 1, 31, '166366', 'Manager/editManager', 2, '编辑', '编辑管理员', '', 1003, 1),
(48, 1, 31, '166703', 'Manager/delManager', 2, '删除', '删除管理员', '', 1004, 1),
(49, 1, 22, '167841', 'Agentschool/index', 2, '查看', '查看驾校', '', 1002, 1),
(50, 1, 22, '167994', 'Agentschool/editSchool', 2, '编辑', '编辑驾校', '', 1003, 1),
(51, 1, 22, '168034', 'Agentschool/delSchool', 2, '删除', '删除驾校', '', 1004, 1),
(52, 1, 23, '168545', 'School/editSchoolSite', 2, '编辑', '编辑场地', '', 1003, 1),
(53, 1, 23, '168596', 'School/delSchoolSite', 2, '删除', '删除场地', '', 1004, 1),
(54, 1, 0, '186641', 'App/index', 1, 'App管理', 'App管理', '', 7, 1),
(55, 1, 54, '186700', 'App/index', 1, 'App列表', '展示App列表', '', 100, 1),
(56, 1, 55, '186781', 'App/addApp', 2, '新增', '新增App版本', '', 1001, 1),
(57, 1, 55, '186880', 'App/editApp', 2, '编辑', '编辑App', '', 1003, 1),
(58, 1, 55, '186907', 'App/delApp', 2, '删除', '删除App', '', 1004, 1),
(59, 1, 55, '186930', 'App/index', 2, '查看', '查看App', '', 1002, 1),
(60, 1, 0, '187184', 'Order/index', 1, '订单管理', '订单管理', '', 5, 1),
(61, 1, 60, '187267', 'Order/index', 1, '报名驾校订单', '展示报名驾校订单列表', '', 100, 1),
(62, 1, 60, '187373', 'Order/appointLearner', 1, '预约学车订单', '展示预约学车订单', '', 100, 1),
(63, 1, 61, '187417', 'Order/index', 2, '查看', '查看报名驾校订单', '', 1002, 1),
(64, 1, 61, '187495', 'Order/addSchoolOrder', 2, '新增', '新增报名驾校订单', '', 1001, 1),
(65, 1, 61, '187561', 'Order/editSchoolOrder', 2, '编辑', '编辑报名驾校订单', '', 1003, 1),
(66, 1, 61, '187599', 'Order/delSchoolOrder', 2, '删除', '删除报名驾校订单', '', 1004, 1),
(67, 1, 62, '187696', 'Order/appointLearner', 2, '查看', '查看预约学车订单', '', 1002, 1),
(68, 1, 62, '187866', 'Order/appointLearner', 2, '编辑', '编辑预约学车订单', '', 1003, 1),
(69, 1, 62, '188144', 'Order/appointLearner', 2, '新增', '新增预约学车订单', '', 1001, 1),
(70, 1, 62, '188317', 'Order/delAppointLearner', 2, '删除', '删除预约学车订单', '', 1004, 1),
(71, 1, 26, '188903', 'Cars/index', 1, '教练车管理', '教练车管理', '', 100, 1),
(72, 1, 71, '189279', 'Cars/addCar', 2, '新增', '新增教练车', '', 1001, 1),
(73, 1, 71, '189313', 'Cars/index', 2, '查看', '查看教练车', '', 1002, 1),
(74, 1, 71, '189355', 'Cars/editCar', 2, '编辑', '编辑教练车', '', 1003, 1),
(75, 1, 71, '189387', 'delCars', 2, '删除', '删除教练车', '', 1004, 1),
(76, 1, 21, '189604', 'School/schoolShiftsAdmin', 1, '班制管理', '驾校班制管理', '', 100, 1),
(77, 1, 76, '189638', 'School/schoolShiftsAdmin', 2, '查看', '查看班制', '', 1002, 1),
(78, 1, 21, '190457', 'School/trainLocationAdmin', 1, '报名点管理', '驾校报名点管理', '', 100, 1),
(79, 1, 78, '190507', 'School/addTrainLocation', 2, '新增', '新增报名点', '', 1001, 1),
(80, 1, 21, '190585', 'School/bannerAdmin', 1, '轮播图管理', '驾校轮播图管理', '', 100, 1),
(81, 1, 80, '190613', 'School/addBanner', 2, '新增', '新增轮播图', '', 100, 1),
(82, 1, 0, '191120', 'Student/index', 1, '学员管理', '学员管理', '', 4, 1),
(83, 1, 82, '191160', 'Student/index', 1, '学员列表', '展示学员列表', '', 100, 1),
(84, 1, 83, '191196', 'Student/addStudent', 2, '新增', '新增学员', '', 1001, 1),
(85, 1, 0, '191298', 'Comment/index', 1, '评价管理', '评价管理', '', 6, 1),
(86, 1, 85, '191365', 'Comment/studentCommentSchool', 1, '学员评价驾校', '学员评价驾校', '', 100, 1),
(87, 1, 85, '191426', 'Comment/index', 1, '学员评价教练', '学员评价教练', '', 100, 1),
(88, 1, 85, '191505', 'Comment/coachCommentStudent', 1, '教练评价学员', '教练评价学员', '', 100, 1),
(89, 1, 87, '191589', 'Comment/index', 2, '查看', '查看学员评价教练', '', 1001, 1),
(90, 1, 86, '191615', 'Comment/studentCommentSchool', 2, '查看', '查看学员评价驾校', '', 1001, 1),
(91, 1, 88, '191637', 'Comment/coachCommentStudent', 2, '查看', '查看教练评价学员', '', 1001, 1),
(92, 1, 0, '191852', 'Coach/index', 1, '教练管理', '教练管理', '', 3, 1),
(93, 1, 92, '191875', 'Coach/index', 1, '教练列表', '展示教练列表', '', 101, 1),
(94, 1, 93, '191902', 'Coach/index', 2, '查看', '查看教练', '', 1002, 1),
(95, 1, 82, '597811', 'Student/examRecords', 1, '在线模拟', '在线模拟', '', 100, 1),
(96, 1, 95, '597911', 'Student/examRecords', 2, '查看', '查看在线模拟成绩', '', 1001, 1),
(97, 1, 83, '246010', 'Student/delStudent', 2, '删除', '删除学员', '', 1004, 1),
(98, 1, 83, '984308', 'Student/index', 2, '查看', '查看学员', '', 1002, 1),
(99, 1, 0, '108285', 'System/index', 1, '系统管理', '系统管理', '', 8, 1),
(100, 1, 99, '108321', 'System/index', 1, '系统日志', '系统日志', '', 100, 1),
(101, 1, 100, '108350', 'System/index', 2, '查看', '查看操作日志', '', 1001, 1),
(102, 1, 76, '547510', 'School/addSchoolShifts', 2, '新增', '添加班制', '', 1001, 1),
(103, 1, 76, '548169', 'School/editSchoolShifts', 2, '编辑', '编辑班制', '', 1003, 1),
(104, 1, 76, '548190', 'School/delSchoolShifts', 2, '删除', '删除班制', '', 1004, 1),
(105, 1, 78, '548551', 'School/trainLocationAdmin', 2, '查看', '查看报名点', '', 1002, 1),
(106, 1, 78, '548579', 'School/delTrainLocation', 2, '删除', '删除报名点', '', 1004, 1),
(107, 1, 78, '548608', 'School/editTrainLocation', 2, '编辑', '编辑报名点', '', 1003, 1),
(108, 1, 80, '548829', 'School/bannerAdmin', 2, '查看', '查看banner', '', 100, 1),
(109, 1, 80, '548919', 'School/delBanner', 2, '删除', '删除Banner', '', 100, 1),
(110, 1, 93, '549082', 'Coach/addCoach', 2, '新增', '录入教练员', '', 1001, 1),
(111, 1, 93, '549113', 'Coach/delCoach', 2, '删除', '删除教练员', '', 1004, 1),
(112, 1, 93, '549152', 'Coach/editCoach', 2, '编辑', '编辑教练员', '', 1003, 1),
(113, 1, 100, '557388', 'System/delActionLog', 2, '删除', '删除日志', '', 1002, 1),
(114, 1, 83, '660260', 'Student/editStudent', 2, '编辑', '修改学员资料', '', 1003, 1),
(115, 1, 0, '695633', 'Coupon/index', 1, '优惠券管理', '管理优惠券', '', 10, 1),
(116, 1, 115, '695840', 'Coupon/index', 1, '优惠券列表', '展示优惠券的信息', '', 101, 1),
(118, 1, 116, '696139', 'Coupon/index', 2, '查看', '查看优惠券', '', 1001, 1),
(119, 1, 116, '696202', 'Coupon/addCoupon', 2, '新增', '新增优惠券', '', 1003, 1),
(120, 1, 116, '696288', 'Coupon/editCoupon', 2, '编辑', '编辑优惠券', '', 1004, 1),
(121, 1, 116, '696336', 'Coupon/delCoupon', 2, '删除', '删除优惠券', '', 1005, 1),
(122, 1, 115, '696943', 'Coupon/couponCategory', 1, '券的种类列表', '券种类的展示', '', 102, 1),
(124, 1, 122, '697106', 'Coupon/addCouponCategory', 2, '新增', '新增优惠券的种类', '', 1003, 1),
(125, 1, 122, '697164', 'Coupon/editCouponCategory', 2, '编辑', '编辑优惠券的种类', '', 1004, 1),
(126, 1, 122, '697220', 'Coupon/couponCategory', 2, '查看', '查看优惠券的种类', '', 1001, 1),
(127, 1, 122, '697300', 'Coupon/delCouponCategory', 2, '删除', '删除优惠券种类', '', 1005, 1),
(128, 1, 115, '697420', 'Coupon/userCoupon', 1, '学车领取券列表', '学车领取券的列表展示', '', 103, 1),
(129, 1, 128, '697488', 'Coupon/userCoupon', 2, '查看', '查看学车领取券信息', '', 1001, 1),
(130, 1, 128, '697540', 'Coupon/searchUserCoupon', 2, '搜索', '搜索学车领取券信息', '', 1002, 1),
(131, 1, 128, '697605', 'Coupon/delUserCoupon', 2, '删除', '删除学车领取券信息', '', 1003, 1),
(132, 1, 26, '665631', 'Cars/learnVideo', 1, '学车视频管理', '学车视频管理列表展示', '', 100, 1),
(133, 1, 132, '665857', 'Cars/learnVideo', 2, '查看', '查看学车视频列表', '', 1001, 1),
(134, 1, 132, '665954', 'Cars/addLearnVideo', 2, '新增', '新增学车视频', '', 1002, 1),
(135, 1, 132, '666065', 'Cars/editLearnVideo', 2, '编辑', '编辑学车视频', '', 1003, 1),
(136, 1, 132, '666122', 'Cars/delLearnVideo', 2, '删除', '删除学车视频', '', 1004, 1),
(138, 1, 92, '667468', 'Coach/coachShiftsAdmin', 1, '教练班制列表', '教练班制列表', '', 102, 1),
(139, 1, 138, '667735', 'Coach/coachShiftsAdmin', 2, '查看', '查看教练班制列表', '', 1001, 1),
(140, 1, 138, '667796', 'Coach/addCoachShifts', 2, '新增', '新增教练班制', '', 1002, 1),
(141, 1, 138, '667879', 'Coach/editCoachShifts', 2, '编辑', '编辑教练班制信息', '', 1003, 1),
(142, 1, 138, '667956', 'Coach/delCoachShits', 2, '删除', '删除教练班制', '', 1004, 1),
(143, 1, 92, '668450', 'Coach/coachTempRelation', 1, '模板关联列表', '教练模板关联列表', '', 103, 1),
(144, 1, 143, '668579', 'Coach/coachTempRelation', 2, '查看', '查看教练模板关联列表', '', 100, 1),
(145, 1, 143, '668627', 'Coach/addCoachTempRelation', 2, '新增', '新增教练模板关联列表', '', 100, 1),
(146, 1, 143, '668669', 'Coach/editCoachTempRelation', 2, '编辑', '编辑教练模板关联列表的信息', '', 100, 1),
(147, 1, 143, '668714', 'Coach/delCoachTempRelation', 2, '删除', '删除教练模板关联列表', '', 100, 1),
(148, 1, 92, '669083', 'Coach/timeConfTemp', 1, '时间模板列表', '时间模板列表', '', 103, 1),
(149, 1, 148, '669135', 'Coach/timeConfTemp', 2, '查看', '查看时间模板列表', '', 1001, 1),
(150, 1, 148, '669176', 'Coach/addTimeConfTemp', 2, '新增', '新增时间模版列表', '', 1002, 1),
(151, 1, 148, '669224', 'Coach/editTimeConfTemp', 2, '编辑', '编辑时间模板列表信息', '', 1003, 1),
(152, 1, 148, '669267', 'Coach/delTimeConfTemp', 2, '删除', '删除时间模板列表中的信息', '', 1004, 1),
(153, 1, 60, '669568', 'Order/transRecords', 1, '交易记录列表', '交易记录列表', '', 100, 1),
(154, 1, 153, '669697', 'Coach/transRecords', 2, '查看', '查看交易记录列表中的信息', '', 1001, 1),
(155, 1, 153, '669760', 'Order/delTransRecords', 2, '删除', '删除交易记录列表中的信息', '', 1002, 1),
(156, 1, 54, '669982', 'App/appFeedBack', 1, 'App反馈列表', 'App反馈列表', '', 100, 1),
(157, 1, 156, '670049', 'App/appFeedBack', 2, '查看', '查看App反馈列表中的信息', '', 1001, 1),
(158, 1, 99, '670716', 'System/payAccountAdmin', 1, '账户配置管理', '账户配置管理', '', 100, 1),
(159, 1, 158, '670795', 'System/payAccountAdmin', 2, '查看', '查看账户配置管理中的信息', '', 1001, 1),
(160, 1, 158, '670849', 'System/addPayAccount', 2, '新增', '新增用户账户配置管理', '', 1002, 1),
(161, 1, 158, '670894', 'System/editPayAccount', 2, '编辑', '编辑用户账户配置管理中的信息', '', 1003, 1),
(162, 1, 158, '670935', 'System/delPayAccount', 2, '删除', '删除用户账户管理中的信息', '', 1004, 1),
(163, 1, 99, '671092', 'System/tagConfigAdmin', 1, '系统标签', '系统标签管理', '', 100, 1),
(164, 1, 163, '671145', 'System/tagConfigAdmin', 2, '查看', '查看系统标签中的信息', '', 1001, 1),
(165, 1, 163, '671201', 'System/addTagConfig', 2, '新增', '新增系统标签', '', 1002, 1),
(166, 1, 163, '671264', 'System/editTagConfig', 2, '编辑', '编辑系统标签', '', 1003, 1),
(167, 1, 163, '671307', 'System/delTagConfig', 2, '删除', '删除系统标签', '', 1004, 1),
(168, 1, 99, '671404', 'System/userTagAdmin', 1, '自定义标签', '自定义标签列表', '', 100, 1),
(169, 1, 168, '671456', 'System/userTagAdmin', 2, '查看', '查看用户自定义标签', '', 1001, 1),
(170, 1, 0, '735259', 'Ads/adsManage', 1, '广告管理', '广告管理', '', 11, 1),
(174, 1, 170, '736498', 'Ads/adsManage', 1, '广告管理', '广告管理', '', 100, 1),
(175, 1, 174, '736764', 'Ads/adsManage', 2, '查看', '查看广告管理中的信息', '', 1001, 1),
(176, 1, 174, '736840', 'Ads/addAdsManage', 2, '新增', '新增广告', '', 1002, 1),
(177, 1, 174, '737187', 'Ads/editAdsManage', 2, '编辑', '编辑广告管理', '', 1003, 1),
(178, 1, 174, '737228', 'Ads/delAdsManage', 2, '删除', '删除广告', '', 1004, 1),
(179, 1, 170, '737416', 'Ads/adsPosition', 1, '广告位管理', '广告位管理', '', 100, 1),
(180, 1, 179, '737451', 'Ads/adsPosition', 2, '查看', '查看广告位管理', '', 1001, 1),
(181, 1, 179, '737511', 'Ads/addAdsPosition', 2, '新增', '新增广告位管理', '', 1002, 1),
(182, 1, 179, '737637', 'Ads/editAdsPosition', 2, '编辑', '编辑广告位管理', '', 1003, 1),
(183, 1, 179, '737734', 'Ads/delAdsPosition', 2, '删除', '删除广告位管理', '', 1004, 1),
(184, 1, 170, '737893', 'Ads/adsLevel', 1, '广告等级管理', '广告等级管理', '', 100, 1),
(185, 1, 184, '737932', 'Ads/adsLevel', 2, '查看', '查看广告等级', '', 1001, 1),
(186, 1, 184, '737977', 'Ads/addAdsLevel', 2, '新增', '新增广告等级', '', 1002, 1),
(187, 1, 184, '738026', 'Ads/editAdsLevel', 2, '编辑', '编辑广告等级管理', '', 1003, 1),
(188, 1, 184, '738066', 'Ads/delAdsLevel', 2, '删除', '删除广告等级管理', '', 1004, 1),
(189, 1, 170, '738161', 'Ads/adsOrders', 1, '广告订单管理', '广告订单管理', '', 100, 1),
(190, 1, 189, '738223', 'Ads/addAdsOrders', 2, '查看', '查看广告订单的信息', '', 1001, 1),
(191, 1, 189, '739200', 'Ads/addAdsOrders', 2, '新增', '新增广告订单', '', 1002, 1),
(192, 1, 189, '739279', 'Ads/editAdsOrders', 2, '编辑', '编辑广告订单中的信息', '', 1003, 1),
(193, 1, 189, '739328', 'Ads/delAdsOrders', 2, '删除', '删除广告订单管理中的对应信息', '', 1004, 1),
(194, 1, 0, '740535', 'Coin/index', 1, '金币商城管理', '金币商城管理', '', 12, 1),
(195, 1, 194, '740643', 'Coin/index', 1, '商品管理', '商品管理', '', 100, 1),
(196, 1, 195, '740781', 'Coin/index', 2, '查看', '查看商品管理', '', 1001, 1),
(197, 1, 195, '740882', 'Coin/addCoinGoods', 2, '新增', '新增商品', '', 1002, 1),
(198, 1, 195, '740923', 'Coin/editCoinGoods', 2, '编辑', '编辑商品中的信息', '', 1003, 1),
(199, 1, 195, '740972', 'Coin/delCoinGoods', 2, '删除', '删除商品及其对应的信息', '', 1004, 1),
(200, 1, 194, '741180', 'Coin/goodsBannerAdmin', 1, '商品轮播图管理', '商品轮播图管理', '', 101, 1),
(201, 1, 200, '741231', 'Coin/goodsBannerAdmin', 2, '查看', '查看商品轮播图', '', 1001, 1),
(202, 1, 200, '741347', 'Coin/addBanner', 2, '新增', '新增商品轮播图', '', 1002, 1),
(203, 1, 200, '741397', 'Coin/delBanner', 2, '删除', '删除商品轮播图及其信息', '', 1003, 1),
(204, 1, 194, '741480', 'Coin/coinRule', 1, '金币规则管理', '金币规则管理', '', 103, 1),
(205, 1, 204, '741528', 'Coin/coinRule', 2, '查看', '查看金币规则管理中的信息', '', 1001, 1),
(206, 1, 204, '741613', 'Coin/addCoinRule', 2, '新增', '新增金币规则', '', 1002, 1),
(207, 1, 204, '741664', 'Coin/editCoinRule', 2, '编辑', '编辑金币规则管理', '', 1003, 1),
(208, 1, 204, '741787', 'Coin/delCoinRule', 2, '删除', '删除金币规则管理', '', 1004, 1),
(209, 1, 194, '741859', 'Coin/goodsCategory', 1, '商品分类管理', '商品分类管理', '', 102, 1),
(210, 1, 209, '741905', 'Coin/goodsCategory', 2, '查看', '查看商品分类管理', '', 1001, 1),
(211, 1, 209, '741987', 'Coin/addGoodsCategory', 2, '新增', '新增商品分类管理', '', 1002, 1),
(212, 1, 209, '742038', 'Coin/editGoodsCategory', 2, '编辑', '编辑商品分类管理', '', 1003, 1),
(213, 1, 209, '742098', 'Coin/delGoodsCategory', 2, '删除', '删除商品分类及其相关信息', '', 1004, 1),
(214, 1, 194, '742298', 'Coin/exchangeOrders', 1, '金币兑记录管理', '金币兑记录管理', '', 104, 1),
(215, 1, 204, '742336', 'Coin/exchangeOrders', 2, '查看', '查看金币兑换记录', '', 100, 1),
(216, 1, 214, '742447', 'Coin/delExchangeOrders', 2, '删除', '删除金币兑换记录及对应的相关信息', '', 1002, 1),
(217, 1, 214, '742537', 'Coin/exchangeOrders', 2, '查看', '查看商品兑换记录管理中的相关信息', '', 1001, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cs_menu`
--
ALTER TABLE `cs_menu`
  ADD PRIMARY KEY (`moduleid`),
  ADD UNIQUE KEY `cs_menu` (`m_applicationid`,`m_pagecode`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `cs_menu`
--
ALTER TABLE `cs_menu`
  MODIFY `moduleid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
