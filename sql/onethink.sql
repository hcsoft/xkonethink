/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50527
Source Host           : 127.0.0.1:3306
Source Database       : onethink

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2014-12-30 22:14:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for xk_action
-- ----------------------------
DROP TABLE IF EXISTS `xk_action`;
CREATE TABLE `xk_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text COMMENT '行为规则',
  `log` text COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

-- ----------------------------
-- Records of xk_action
-- ----------------------------
INSERT INTO `xk_action` VALUES ('1', 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', '1', '1', '1387181220');
INSERT INTO `xk_action` VALUES ('2', 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', '2', '0', '1380173180');
INSERT INTO `xk_action` VALUES ('3', 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', '2', '1', '1383285646');
INSERT INTO `xk_action` VALUES ('4', 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', '2', '0', '1386139726');
INSERT INTO `xk_action` VALUES ('5', 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', '2', '0', '1383285551');
INSERT INTO `xk_action` VALUES ('6', 'update_config', '更新配置', '新增或修改或删除配置', '', '', '1', '1', '1383294988');
INSERT INTO `xk_action` VALUES ('7', 'update_model', '更新模型', '新增或修改模型', '', '', '1', '1', '1383295057');
INSERT INTO `xk_action` VALUES ('8', 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', '1', '1', '1383295963');
INSERT INTO `xk_action` VALUES ('9', 'update_channel', '更新导航', '新增或修改或删除导航', '', '', '1', '1', '1383296301');
INSERT INTO `xk_action` VALUES ('10', 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', '1', '1', '1383296392');
INSERT INTO `xk_action` VALUES ('11', 'update_category', '更新分类', '新增或修改或删除分类', '', '', '1', '1', '1383296765');

-- ----------------------------
-- Table structure for xk_action_log
-- ----------------------------
DROP TABLE IF EXISTS `xk_action_log`;
CREATE TABLE `xk_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=282 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- ----------------------------
-- Records of xk_action_log
-- ----------------------------
INSERT INTO `xk_action_log` VALUES ('1', '1', '1', '0', 'member', '1', 'admin在2014-12-16 10:28登录了后台', '1', '1418696939');
INSERT INTO `xk_action_log` VALUES ('2', '1', '1', '0', 'member', '1', 'admin在2014-12-16 10:29登录了后台', '1', '1418696968');
INSERT INTO `xk_action_log` VALUES ('3', '11', '1', '0', 'category', '39', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1418697134');
INSERT INTO `xk_action_log` VALUES ('4', '11', '1', '0', 'category', '39', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1418697335');
INSERT INTO `xk_action_log` VALUES ('5', '11', '1', '0', 'category', '40', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1418700406');
INSERT INTO `xk_action_log` VALUES ('6', '11', '1', '0', 'category', '41', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1418700441');
INSERT INTO `xk_action_log` VALUES ('7', '11', '1', '0', 'category', '42', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1418700557');
INSERT INTO `xk_action_log` VALUES ('8', '11', '1', '0', 'category', '43', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1418700583');
INSERT INTO `xk_action_log` VALUES ('9', '11', '1', '0', 'category', '44', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1418700595');
INSERT INTO `xk_action_log` VALUES ('10', '11', '1', '0', 'category', '45', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1418700611');
INSERT INTO `xk_action_log` VALUES ('11', '11', '1', '0', 'category', '46', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1418700623');
INSERT INTO `xk_action_log` VALUES ('12', '11', '1', '0', 'category', '47', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1418700633');
INSERT INTO `xk_action_log` VALUES ('13', '11', '1', '0', 'category', '48', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1418700649');
INSERT INTO `xk_action_log` VALUES ('14', '11', '1', '0', 'category', '49', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1418700658');
INSERT INTO `xk_action_log` VALUES ('15', '11', '1', '0', 'category', '50', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1418700676');
INSERT INTO `xk_action_log` VALUES ('16', '11', '1', '0', 'category', '51', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1418700685');
INSERT INTO `xk_action_log` VALUES ('17', '11', '1', '0', 'category', '52', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1418700698');
INSERT INTO `xk_action_log` VALUES ('18', '11', '1', '0', 'category', '53', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1418700710');
INSERT INTO `xk_action_log` VALUES ('19', '11', '1', '0', 'category', '1', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1418700731');
INSERT INTO `xk_action_log` VALUES ('20', '11', '1', '0', 'category', '2', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1418700741');
INSERT INTO `xk_action_log` VALUES ('21', '1', '2', '0', 'member', '2', '永昌在2014-12-16 11:37登录了后台', '1', '1418701020');
INSERT INTO `xk_action_log` VALUES ('22', '1', '1', '0', 'member', '1', 'admin在2014-12-16 11:37登录了后台', '1', '1418701035');
INSERT INTO `xk_action_log` VALUES ('23', '1', '2', '0', 'member', '2', '永昌在2014-12-16 11:37登录了后台', '1', '1418701071');
INSERT INTO `xk_action_log` VALUES ('24', '1', '1', '0', 'member', '1', 'admin在2014-12-16 11:38登录了后台', '1', '1418701089');
INSERT INTO `xk_action_log` VALUES ('25', '1', '2', '0', 'member', '2', '永昌在2014-12-16 11:39登录了后台', '1', '1418701149');
INSERT INTO `xk_action_log` VALUES ('26', '1', '1', '0', 'member', '1', 'admin在2014-12-16 11:39登录了后台', '1', '1418701158');
INSERT INTO `xk_action_log` VALUES ('27', '1', '2', '0', 'member', '2', '永昌在2014-12-16 11:40登录了后台', '1', '1418701257');
INSERT INTO `xk_action_log` VALUES ('28', '1', '1', '0', 'member', '1', 'admin在2014-12-16 11:41登录了后台', '1', '1418701281');
INSERT INTO `xk_action_log` VALUES ('29', '1', '2', '0', 'member', '2', '永昌在2014-12-16 11:41登录了后台', '1', '1418701313');
INSERT INTO `xk_action_log` VALUES ('30', '1', '1', '0', 'member', '1', 'admin在2014-12-16 11:42登录了后台', '1', '1418701338');
INSERT INTO `xk_action_log` VALUES ('31', '1', '2', '0', 'member', '2', '永昌在2014-12-16 11:43登录了后台', '1', '1418701401');
INSERT INTO `xk_action_log` VALUES ('32', '1', '1', '0', 'member', '1', 'admin在2014-12-16 11:43登录了后台', '1', '1418701415');
INSERT INTO `xk_action_log` VALUES ('33', '1', '2', '0', 'member', '2', '永昌在2014-12-16 11:44登录了后台', '1', '1418701448');
INSERT INTO `xk_action_log` VALUES ('34', '1', '1', '0', 'member', '1', 'admin在2014-12-16 11:44登录了后台', '1', '1418701461');
INSERT INTO `xk_action_log` VALUES ('35', '1', '2', '0', 'member', '2', '永昌在2014-12-16 11:44登录了后台', '1', '1418701493');
INSERT INTO `xk_action_log` VALUES ('36', '1', '1', '0', 'member', '1', 'admin在2014-12-16 11:45登录了后台', '1', '1418701529');
INSERT INTO `xk_action_log` VALUES ('37', '1', '2', '0', 'member', '2', '永昌在2014-12-16 11:47登录了后台', '1', '1418701676');
INSERT INTO `xk_action_log` VALUES ('38', '1', '1', '0', 'member', '1', 'admin在2014-12-16 11:48登录了后台', '1', '1418701691');
INSERT INTO `xk_action_log` VALUES ('39', '1', '2', '0', 'member', '2', '永昌在2014-12-16 11:48登录了后台', '1', '1418701723');
INSERT INTO `xk_action_log` VALUES ('40', '1', '1', '0', 'member', '1', 'admin在2014-12-16 11:48登录了后台', '1', '1418701737');
INSERT INTO `xk_action_log` VALUES ('41', '1', '2', '0', 'member', '2', '永昌在2014-12-16 11:49登录了后台', '1', '1418701770');
INSERT INTO `xk_action_log` VALUES ('42', '1', '1', '0', 'member', '1', 'admin在2014-12-16 11:50登录了后台', '1', '1418701823');
INSERT INTO `xk_action_log` VALUES ('43', '1', '2', '0', 'member', '2', '永昌在2014-12-16 12:07登录了后台', '1', '1418702838');
INSERT INTO `xk_action_log` VALUES ('44', '1', '1', '0', 'member', '1', 'admin在2014-12-16 12:08登录了后台', '1', '1418702891');
INSERT INTO `xk_action_log` VALUES ('45', '1', '2', '0', 'member', '2', '永昌在2014-12-16 12:08登录了后台', '1', '1418702919');
INSERT INTO `xk_action_log` VALUES ('46', '1', '1', '0', 'member', '1', 'admin在2014-12-16 12:31登录了后台', '1', '1418704263');
INSERT INTO `xk_action_log` VALUES ('47', '11', '1', '0', 'category', '41', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1418704290');
INSERT INTO `xk_action_log` VALUES ('48', '1', '2', '0', 'member', '2', '永昌在2014-12-16 12:31登录了后台', '1', '1418704300');
INSERT INTO `xk_action_log` VALUES ('49', '1', '1', '0', 'member', '1', 'admin在2014-12-16 15:55登录了后台', '1', '1418716505');
INSERT INTO `xk_action_log` VALUES ('50', '1', '2', '0', 'member', '2', '永昌在2014-12-16 15:55登录了后台', '1', '1418716537');
INSERT INTO `xk_action_log` VALUES ('51', '1', '1', '0', 'member', '1', 'admin在2014-12-16 15:56登录了后台', '1', '1418716600');
INSERT INTO `xk_action_log` VALUES ('52', '1', '2', '0', 'member', '2', '永昌在2014-12-16 15:57登录了后台', '1', '1418716630');
INSERT INTO `xk_action_log` VALUES ('53', '1', '1', '0', 'member', '1', 'admin在2014-12-16 16:20登录了后台', '1', '1418718042');
INSERT INTO `xk_action_log` VALUES ('54', '11', '1', '0', 'category', '54', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1418718088');
INSERT INTO `xk_action_log` VALUES ('55', '11', '1', '0', 'category', '55', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1418718107');
INSERT INTO `xk_action_log` VALUES ('56', '1', '1', '0', 'member', '1', 'admin在2014-12-16 16:22登录了后台', '1', '1418718123');
INSERT INTO `xk_action_log` VALUES ('57', '1', '2', '0', 'member', '2', '永昌在2014-12-16 16:22登录了后台', '1', '1418718159');
INSERT INTO `xk_action_log` VALUES ('58', '1', '1', '0', 'member', '1', 'admin在2014-12-16 16:27登录了后台', '1', '1418718447');
INSERT INTO `xk_action_log` VALUES ('59', '1', '2', '0', 'member', '2', '永昌在2014-12-16 17:12登录了后台', '1', '1418721129');
INSERT INTO `xk_action_log` VALUES ('60', '1', '1', '0', 'member', '1', 'admin在2014-12-16 17:16登录了后台', '1', '1418721380');
INSERT INTO `xk_action_log` VALUES ('61', '6', '1', '0', 'config', '38', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1418721554');
INSERT INTO `xk_action_log` VALUES ('62', '6', '1', '0', 'config', '38', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1418721598');
INSERT INTO `xk_action_log` VALUES ('63', '6', '1', '0', 'config', '38', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1418721645');
INSERT INTO `xk_action_log` VALUES ('64', '1', '1', '0', 'member', '1', 'admin在2014-12-17 10:30登录了后台', '1', '1418783450');
INSERT INTO `xk_action_log` VALUES ('65', '1', '1', '0', 'member', '1', 'admin在2014-12-17 16:38登录了后台', '1', '1418805513');
INSERT INTO `xk_action_log` VALUES ('66', '6', '1', '0', 'config', '39', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1418807755');
INSERT INTO `xk_action_log` VALUES ('67', '6', '1', '0', 'config', '40', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1418808224');
INSERT INTO `xk_action_log` VALUES ('68', '6', '1', '0', 'config', '39', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1418808248');
INSERT INTO `xk_action_log` VALUES ('69', '1', '1', '0', 'member', '1', 'admin在2014-12-23 09:49登录了后台', '1', '1419299375');
INSERT INTO `xk_action_log` VALUES ('70', '11', '1', '0', 'category', '56', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419304011');
INSERT INTO `xk_action_log` VALUES ('71', '11', '1', '0', 'category', '57', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419304025');
INSERT INTO `xk_action_log` VALUES ('72', '11', '1', '0', 'category', '58', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419304041');
INSERT INTO `xk_action_log` VALUES ('73', '11', '1', '0', 'category', '59', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419304056');
INSERT INTO `xk_action_log` VALUES ('74', '11', '1', '0', 'category', '60', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419304069');
INSERT INTO `xk_action_log` VALUES ('75', '11', '1', '0', 'category', '61', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419304093');
INSERT INTO `xk_action_log` VALUES ('76', '11', '1', '0', 'category', '62', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419304111');
INSERT INTO `xk_action_log` VALUES ('77', '11', '1', '0', 'category', '63', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419304126');
INSERT INTO `xk_action_log` VALUES ('78', '11', '1', '0', 'category', '64', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419304139');
INSERT INTO `xk_action_log` VALUES ('79', '11', '1', '0', 'category', '65', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419304159');
INSERT INTO `xk_action_log` VALUES ('80', '11', '1', '0', 'category', '66', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419304177');
INSERT INTO `xk_action_log` VALUES ('81', '11', '1', '0', 'category', '67', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419304203');
INSERT INTO `xk_action_log` VALUES ('82', '11', '1', '0', 'category', '68', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419304221');
INSERT INTO `xk_action_log` VALUES ('83', '11', '1', '0', 'category', '69', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419304272');
INSERT INTO `xk_action_log` VALUES ('84', '9', '1', '0', 'channel', '0', '操作url：/onethink/admin.php?s=/Channel/del/id/2.html', '1', '1419304464');
INSERT INTO `xk_action_log` VALUES ('85', '9', '1', '0', 'channel', '0', '操作url：/onethink/admin.php?s=/Channel/del/id/3.html', '1', '1419304468');
INSERT INTO `xk_action_log` VALUES ('86', '11', '1', '0', 'category', '56', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419304571');
INSERT INTO `xk_action_log` VALUES ('87', '9', '1', '0', 'channel', '4', '操作url：/onethink/admin.php?s=/Channel/edit.html', '1', '1419304636');
INSERT INTO `xk_action_log` VALUES ('88', '9', '1', '0', 'channel', '5', '操作url：/onethink/admin.php?s=/Channel/edit.html', '1', '1419304852');
INSERT INTO `xk_action_log` VALUES ('89', '9', '1', '0', 'channel', '5', '操作url：/onethink/admin.php?s=/Channel/edit.html', '1', '1419305001');
INSERT INTO `xk_action_log` VALUES ('90', '9', '1', '0', 'channel', '5', '操作url：/onethink/admin.php?s=/Channel/edit.html', '1', '1419305005');
INSERT INTO `xk_action_log` VALUES ('91', '9', '1', '0', 'channel', '12', '操作url：/onethink/admin.php?s=/Channel/edit.html', '1', '1419305025');
INSERT INTO `xk_action_log` VALUES ('92', '9', '1', '0', 'channel', '6', '操作url：/onethink/admin.php?s=/Channel/edit.html', '1', '1419305115');
INSERT INTO `xk_action_log` VALUES ('93', '9', '1', '0', 'channel', '7', '操作url：/onethink/admin.php?s=/Channel/edit.html', '1', '1419305120');
INSERT INTO `xk_action_log` VALUES ('94', '9', '1', '0', 'channel', '8', '操作url：/onethink/admin.php?s=/Channel/edit.html', '1', '1419305125');
INSERT INTO `xk_action_log` VALUES ('95', '9', '1', '0', 'channel', '9', '操作url：/onethink/admin.php?s=/Channel/edit.html', '1', '1419305130');
INSERT INTO `xk_action_log` VALUES ('96', '9', '1', '0', 'channel', '10', '操作url：/onethink/admin.php?s=/Channel/edit.html', '1', '1419305136');
INSERT INTO `xk_action_log` VALUES ('97', '9', '1', '0', 'channel', '12', '操作url：/onethink/admin.php?s=/Channel/edit.html', '1', '1419305144');
INSERT INTO `xk_action_log` VALUES ('98', '9', '1', '0', 'channel', '13', '操作url：/onethink/admin.php?s=/Channel/edit.html', '1', '1419305148');
INSERT INTO `xk_action_log` VALUES ('99', '9', '1', '0', 'channel', '14', '操作url：/onethink/admin.php?s=/Channel/edit.html', '1', '1419305153');
INSERT INTO `xk_action_log` VALUES ('100', '9', '1', '0', 'channel', '15', '操作url：/onethink/admin.php?s=/Channel/edit.html', '1', '1419305159');
INSERT INTO `xk_action_log` VALUES ('101', '9', '1', '0', 'channel', '16', '操作url：/onethink/admin.php?s=/Channel/edit.html', '1', '1419305164');
INSERT INTO `xk_action_log` VALUES ('102', '9', '1', '0', 'channel', '17', '操作url：/onethink/admin.php?s=/Channel/edit.html', '1', '1419305169');
INSERT INTO `xk_action_log` VALUES ('103', '9', '1', '0', 'channel', '0', '操作url：/onethink/admin.php?s=/Channel/del/id/1.html', '1', '1419305864');
INSERT INTO `xk_action_log` VALUES ('104', '9', '1', '0', 'channel', '13', '操作url：/onethink/admin.php?s=/Channel/edit.html', '1', '1419306056');
INSERT INTO `xk_action_log` VALUES ('105', '1', '1', '0', 'member', '1', 'admin在2014-12-23 20:42登录了后台', '1', '1419338543');
INSERT INTO `xk_action_log` VALUES ('106', '11', '1', '0', 'category', '1', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419338668');
INSERT INTO `xk_action_log` VALUES ('107', '11', '1', '0', 'category', '39', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419338692');
INSERT INTO `xk_action_log` VALUES ('108', '11', '1', '0', 'category', '70', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419338712');
INSERT INTO `xk_action_log` VALUES ('109', '11', '1', '0', 'category', '71', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419338739');
INSERT INTO `xk_action_log` VALUES ('110', '11', '1', '0', 'category', '72', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419338759');
INSERT INTO `xk_action_log` VALUES ('111', '11', '1', '0', 'category', '73', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419338799');
INSERT INTO `xk_action_log` VALUES ('112', '11', '1', '0', 'category', '61', '操作url：/onethink/admin.php?s=/Category/remove/id/61.html', '1', '1419338808');
INSERT INTO `xk_action_log` VALUES ('113', '11', '1', '0', 'category', '73', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419338818');
INSERT INTO `xk_action_log` VALUES ('114', '11', '1', '0', 'category', '74', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419338842');
INSERT INTO `xk_action_log` VALUES ('115', '11', '1', '0', 'category', '73', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419338855');
INSERT INTO `xk_action_log` VALUES ('116', '11', '1', '0', 'category', '75', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419338885');
INSERT INTO `xk_action_log` VALUES ('117', '11', '1', '0', 'category', '76', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419338907');
INSERT INTO `xk_action_log` VALUES ('118', '11', '1', '0', 'category', '77', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419338922');
INSERT INTO `xk_action_log` VALUES ('119', '11', '1', '0', 'category', '77', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419338934');
INSERT INTO `xk_action_log` VALUES ('120', '11', '1', '0', 'category', '62', '操作url：/onethink/admin.php?s=/Category/remove/id/62.html', '1', '1419338948');
INSERT INTO `xk_action_log` VALUES ('121', '11', '1', '0', 'category', '78', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419338963');
INSERT INTO `xk_action_log` VALUES ('122', '11', '1', '0', 'category', '79', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419338985');
INSERT INTO `xk_action_log` VALUES ('123', '11', '1', '0', 'category', '80', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419339015');
INSERT INTO `xk_action_log` VALUES ('124', '11', '1', '0', 'category', '80', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419339040');
INSERT INTO `xk_action_log` VALUES ('125', '11', '1', '0', 'category', '81', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419339056');
INSERT INTO `xk_action_log` VALUES ('126', '11', '1', '0', 'category', '82', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419339074');
INSERT INTO `xk_action_log` VALUES ('127', '11', '1', '0', 'category', '67', '操作url：/onethink/admin.php?s=/Category/remove/id/67.html', '1', '1419339121');
INSERT INTO `xk_action_log` VALUES ('128', '11', '1', '0', 'category', '83', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419339139');
INSERT INTO `xk_action_log` VALUES ('129', '11', '1', '0', 'category', '84', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419339168');
INSERT INTO `xk_action_log` VALUES ('130', '11', '1', '0', 'category', '85', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419339204');
INSERT INTO `xk_action_log` VALUES ('131', '11', '1', '0', 'category', '86', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419339232');
INSERT INTO `xk_action_log` VALUES ('132', '11', '1', '0', 'category', '87', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419339251');
INSERT INTO `xk_action_log` VALUES ('133', '11', '1', '0', 'category', '88', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419339276');
INSERT INTO `xk_action_log` VALUES ('134', '11', '1', '0', 'category', '89', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419339301');
INSERT INTO `xk_action_log` VALUES ('135', '11', '1', '0', 'category', '90', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419339324');
INSERT INTO `xk_action_log` VALUES ('136', '11', '1', '0', 'category', '91', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419339355');
INSERT INTO `xk_action_log` VALUES ('137', '11', '1', '0', 'category', '92', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419339374');
INSERT INTO `xk_action_log` VALUES ('138', '11', '1', '0', 'category', '93', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419339393');
INSERT INTO `xk_action_log` VALUES ('139', '11', '1', '0', 'category', '94', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419339409');
INSERT INTO `xk_action_log` VALUES ('140', '11', '1', '0', 'category', '95', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419339430');
INSERT INTO `xk_action_log` VALUES ('141', '11', '1', '0', 'category', '96', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419339448');
INSERT INTO `xk_action_log` VALUES ('142', '11', '1', '0', 'category', '97', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419339468');
INSERT INTO `xk_action_log` VALUES ('143', '11', '1', '0', 'category', '98', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419339487');
INSERT INTO `xk_action_log` VALUES ('144', '11', '1', '0', 'category', '99', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419339509');
INSERT INTO `xk_action_log` VALUES ('145', '11', '1', '0', 'category', '100', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419339527');
INSERT INTO `xk_action_log` VALUES ('146', '11', '1', '0', 'category', '101', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419339546');
INSERT INTO `xk_action_log` VALUES ('147', '11', '1', '0', 'category', '40', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419339554');
INSERT INTO `xk_action_log` VALUES ('148', '11', '1', '0', 'category', '77', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419339569');
INSERT INTO `xk_action_log` VALUES ('149', '11', '1', '0', 'category', '70', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419339570');
INSERT INTO `xk_action_log` VALUES ('150', '11', '1', '0', 'category', '93', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419339579');
INSERT INTO `xk_action_log` VALUES ('151', '11', '1', '0', 'category', '88', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419339581');
INSERT INTO `xk_action_log` VALUES ('152', '11', '1', '0', 'category', '39', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419339600');
INSERT INTO `xk_action_log` VALUES ('153', '11', '1', '0', 'category', '102', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419339628');
INSERT INTO `xk_action_log` VALUES ('154', '11', '1', '0', 'category', '103', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419339651');
INSERT INTO `xk_action_log` VALUES ('155', '11', '1', '0', 'category', '63', '操作url：/onethink/admin.php?s=/Category/remove/id/63.html', '1', '1419339659');
INSERT INTO `xk_action_log` VALUES ('156', '11', '1', '0', 'category', '103', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419339671');
INSERT INTO `xk_action_log` VALUES ('157', '11', '1', '0', 'category', '104', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419339689');
INSERT INTO `xk_action_log` VALUES ('158', '11', '1', '0', 'category', '65', '操作url：/onethink/admin.php?s=/Category/remove/id/65.html', '1', '1419339695');
INSERT INTO `xk_action_log` VALUES ('159', '11', '1', '0', 'category', '104', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419339705');
INSERT INTO `xk_action_log` VALUES ('160', '11', '1', '0', 'category', '105', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419339723');
INSERT INTO `xk_action_log` VALUES ('161', '11', '1', '0', 'category', '66', '操作url：/onethink/admin.php?s=/Category/remove/id/66.html', '1', '1419339732');
INSERT INTO `xk_action_log` VALUES ('162', '11', '1', '0', 'category', '106', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419339755');
INSERT INTO `xk_action_log` VALUES ('163', '11', '1', '0', 'category', '68', '操作url：/onethink/admin.php?s=/Category/remove/id/68.html', '1', '1419339767');
INSERT INTO `xk_action_log` VALUES ('164', '11', '1', '0', 'category', '107', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419339797');
INSERT INTO `xk_action_log` VALUES ('165', '11', '1', '0', 'category', '108', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419339815');
INSERT INTO `xk_action_log` VALUES ('166', '11', '1', '0', 'category', '109', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419339838');
INSERT INTO `xk_action_log` VALUES ('167', '11', '1', '0', 'category', '109', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419339865');
INSERT INTO `xk_action_log` VALUES ('168', '11', '1', '0', 'category', '110', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419339887');
INSERT INTO `xk_action_log` VALUES ('169', '11', '1', '0', 'category', '110', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419339901');
INSERT INTO `xk_action_log` VALUES ('170', '11', '1', '0', 'category', '111', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419339913');
INSERT INTO `xk_action_log` VALUES ('171', '11', '1', '0', 'category', '111', '操作url：/onethink/admin.php?s=/Category/remove/id/111.html', '1', '1419339935');
INSERT INTO `xk_action_log` VALUES ('172', '11', '1', '0', 'category', '112', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419340053');
INSERT INTO `xk_action_log` VALUES ('173', '6', '1', '0', 'config', '41', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1419340248');
INSERT INTO `xk_action_log` VALUES ('174', '11', '1', '0', 'category', '112', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344574');
INSERT INTO `xk_action_log` VALUES ('175', '11', '1', '0', 'category', '71', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344578');
INSERT INTO `xk_action_log` VALUES ('176', '11', '1', '0', 'category', '72', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344582');
INSERT INTO `xk_action_log` VALUES ('177', '11', '1', '0', 'category', '73', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344588');
INSERT INTO `xk_action_log` VALUES ('178', '11', '1', '0', 'category', '74', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344593');
INSERT INTO `xk_action_log` VALUES ('179', '11', '1', '0', 'category', '75', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344597');
INSERT INTO `xk_action_log` VALUES ('180', '11', '1', '0', 'category', '76', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344598');
INSERT INTO `xk_action_log` VALUES ('181', '11', '1', '0', 'category', '78', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344604');
INSERT INTO `xk_action_log` VALUES ('182', '11', '1', '0', 'category', '79', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344606');
INSERT INTO `xk_action_log` VALUES ('183', '11', '1', '0', 'category', '81', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344611');
INSERT INTO `xk_action_log` VALUES ('184', '11', '1', '0', 'category', '80', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344613');
INSERT INTO `xk_action_log` VALUES ('185', '11', '1', '0', 'category', '84', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344624');
INSERT INTO `xk_action_log` VALUES ('186', '11', '1', '0', 'category', '82', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344632');
INSERT INTO `xk_action_log` VALUES ('187', '11', '1', '0', 'category', '83', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344634');
INSERT INTO `xk_action_log` VALUES ('188', '11', '1', '0', 'category', '85', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344640');
INSERT INTO `xk_action_log` VALUES ('189', '11', '1', '0', 'category', '86', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344643');
INSERT INTO `xk_action_log` VALUES ('190', '11', '1', '0', 'category', '87', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344645');
INSERT INTO `xk_action_log` VALUES ('191', '11', '1', '0', 'category', '89', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344656');
INSERT INTO `xk_action_log` VALUES ('192', '11', '1', '0', 'category', '90', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344657');
INSERT INTO `xk_action_log` VALUES ('193', '11', '1', '0', 'category', '91', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344658');
INSERT INTO `xk_action_log` VALUES ('194', '11', '1', '0', 'category', '92', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344658');
INSERT INTO `xk_action_log` VALUES ('195', '11', '1', '0', 'category', '94', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344665');
INSERT INTO `xk_action_log` VALUES ('196', '11', '1', '0', 'category', '95', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344666');
INSERT INTO `xk_action_log` VALUES ('197', '11', '1', '0', 'category', '96', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344667');
INSERT INTO `xk_action_log` VALUES ('198', '11', '1', '0', 'category', '97', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344674');
INSERT INTO `xk_action_log` VALUES ('199', '11', '1', '0', 'category', '98', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344676');
INSERT INTO `xk_action_log` VALUES ('200', '11', '1', '0', 'category', '99', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344680');
INSERT INTO `xk_action_log` VALUES ('201', '11', '1', '0', 'category', '100', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344684');
INSERT INTO `xk_action_log` VALUES ('202', '11', '1', '0', 'category', '101', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344686');
INSERT INTO `xk_action_log` VALUES ('203', '11', '1', '0', 'category', '103', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344692');
INSERT INTO `xk_action_log` VALUES ('204', '11', '1', '0', 'category', '104', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344693');
INSERT INTO `xk_action_log` VALUES ('205', '11', '1', '0', 'category', '105', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344694');
INSERT INTO `xk_action_log` VALUES ('206', '11', '1', '0', 'category', '106', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344696');
INSERT INTO `xk_action_log` VALUES ('207', '11', '1', '0', 'category', '107', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344698');
INSERT INTO `xk_action_log` VALUES ('208', '11', '1', '0', 'category', '108', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419344699');
INSERT INTO `xk_action_log` VALUES ('209', '1', '1', '0', 'member', '1', 'admin在2014-12-24 23:40登录了后台', '1', '1419435651');
INSERT INTO `xk_action_log` VALUES ('210', '6', '1', '0', 'config', '39', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1419436525');
INSERT INTO `xk_action_log` VALUES ('211', '6', '1', '0', 'config', '39', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1419436533');
INSERT INTO `xk_action_log` VALUES ('212', '6', '1', '0', 'config', '38', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1419436544');
INSERT INTO `xk_action_log` VALUES ('213', '6', '1', '0', 'config', '40', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1419436558');
INSERT INTO `xk_action_log` VALUES ('214', '6', '1', '0', 'config', '41', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1419436568');
INSERT INTO `xk_action_log` VALUES ('215', '6', '1', '0', 'config', '42', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1419436578');
INSERT INTO `xk_action_log` VALUES ('216', '6', '1', '0', 'config', '43', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1419436939');
INSERT INTO `xk_action_log` VALUES ('217', '6', '1', '0', 'config', '44', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1419436974');
INSERT INTO `xk_action_log` VALUES ('218', '6', '1', '0', 'config', '45', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1419436992');
INSERT INTO `xk_action_log` VALUES ('219', '6', '1', '0', 'config', '46', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1419437000');
INSERT INTO `xk_action_log` VALUES ('220', '6', '1', '0', 'config', '10', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1419437049');
INSERT INTO `xk_action_log` VALUES ('221', '11', '1', '0', 'category', '2', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419437582');
INSERT INTO `xk_action_log` VALUES ('222', '11', '1', '0', 'category', '2', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419437686');
INSERT INTO `xk_action_log` VALUES ('223', '1', '1', '0', 'member', '1', 'admin在2014-12-29 00:21登录了后台', '1', '1419783714');
INSERT INTO `xk_action_log` VALUES ('224', '11', '1', '0', 'category', '113', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419801576');
INSERT INTO `xk_action_log` VALUES ('225', '11', '1', '0', 'category', '113', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419801589');
INSERT INTO `xk_action_log` VALUES ('226', '11', '1', '0', 'category', '114', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419801629');
INSERT INTO `xk_action_log` VALUES ('227', '11', '1', '0', 'category', '114', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419801652');
INSERT INTO `xk_action_log` VALUES ('228', '11', '1', '0', 'category', '115', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419801711');
INSERT INTO `xk_action_log` VALUES ('229', '11', '1', '0', 'category', '116', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419801770');
INSERT INTO `xk_action_log` VALUES ('230', '11', '1', '0', 'category', '116', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419801780');
INSERT INTO `xk_action_log` VALUES ('231', '11', '1', '0', 'category', '114', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419801780');
INSERT INTO `xk_action_log` VALUES ('232', '11', '1', '0', 'category', '115', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419801782');
INSERT INTO `xk_action_log` VALUES ('233', '11', '1', '0', 'category', '115', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419801784');
INSERT INTO `xk_action_log` VALUES ('234', '11', '1', '0', 'category', '114', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419801785');
INSERT INTO `xk_action_log` VALUES ('235', '11', '1', '0', 'category', '116', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419801797');
INSERT INTO `xk_action_log` VALUES ('236', '11', '1', '0', 'category', '69', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419809690');
INSERT INTO `xk_action_log` VALUES ('237', '11', '1', '0', 'category', '2', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419810602');
INSERT INTO `xk_action_log` VALUES ('238', '1', '1', '0', 'member', '1', 'admin在2014-12-29 21:51登录了后台', '1', '1419861117');
INSERT INTO `xk_action_log` VALUES ('239', '11', '1', '0', 'category', '117', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419861361');
INSERT INTO `xk_action_log` VALUES ('240', '11', '1', '0', 'category', '118', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419861600');
INSERT INTO `xk_action_log` VALUES ('241', '6', '1', '0', 'config', '51', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1419861720');
INSERT INTO `xk_action_log` VALUES ('242', '11', '1', '0', 'category', '119', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419861800');
INSERT INTO `xk_action_log` VALUES ('243', '11', '1', '0', 'category', '119', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419861813');
INSERT INTO `xk_action_log` VALUES ('244', '11', '1', '0', 'category', '120', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419861847');
INSERT INTO `xk_action_log` VALUES ('245', '11', '1', '0', 'category', '120', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419861856');
INSERT INTO `xk_action_log` VALUES ('246', '11', '1', '0', 'category', '121', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419861903');
INSERT INTO `xk_action_log` VALUES ('247', '6', '1', '0', 'config', '53', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1419861989');
INSERT INTO `xk_action_log` VALUES ('248', '6', '1', '0', 'config', '0', '操作url：/onethink/admin.php?s=/Config/del/id/54.html', '1', '1419862000');
INSERT INTO `xk_action_log` VALUES ('249', '6', '1', '0', 'config', '49', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1419862983');
INSERT INTO `xk_action_log` VALUES ('250', '6', '1', '0', 'config', '49', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1419863439');
INSERT INTO `xk_action_log` VALUES ('251', '6', '1', '0', 'config', '49', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1419863475');
INSERT INTO `xk_action_log` VALUES ('252', '6', '1', '0', 'config', '48', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1419863562');
INSERT INTO `xk_action_log` VALUES ('253', '6', '1', '0', 'config', '50', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1419864407');
INSERT INTO `xk_action_log` VALUES ('254', '6', '1', '0', 'config', '52', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1419864569');
INSERT INTO `xk_action_log` VALUES ('255', '6', '1', '0', 'config', '51', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1419864929');
INSERT INTO `xk_action_log` VALUES ('256', '6', '1', '0', 'config', '53', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1419864982');
INSERT INTO `xk_action_log` VALUES ('257', '11', '1', '0', 'category', '122', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419865302');
INSERT INTO `xk_action_log` VALUES ('258', '6', '1', '0', 'config', '56', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1419865323');
INSERT INTO `xk_action_log` VALUES ('259', '6', '1', '0', 'config', '57', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1419869206');
INSERT INTO `xk_action_log` VALUES ('260', '6', '1', '0', 'config', '57', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1419871076');
INSERT INTO `xk_action_log` VALUES ('261', '6', '1', '0', 'config', '57', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1419871127');
INSERT INTO `xk_action_log` VALUES ('262', '6', '1', '0', 'config', '39', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1419872586');
INSERT INTO `xk_action_log` VALUES ('263', '6', '1', '0', 'config', '40', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1419872594');
INSERT INTO `xk_action_log` VALUES ('264', '6', '1', '0', 'config', '43', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1419872602');
INSERT INTO `xk_action_log` VALUES ('265', '6', '1', '0', 'config', '44', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1419872610');
INSERT INTO `xk_action_log` VALUES ('266', '6', '1', '0', 'config', '45', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1419872617');
INSERT INTO `xk_action_log` VALUES ('267', '6', '1', '0', 'config', '46', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1419872624');
INSERT INTO `xk_action_log` VALUES ('268', '6', '1', '0', 'config', '47', '操作url：/onethink/admin.php?s=/Config/edit.html', '1', '1419872630');
INSERT INTO `xk_action_log` VALUES ('269', '11', '1', '0', 'category', '98', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419873882');
INSERT INTO `xk_action_log` VALUES ('270', '7', '1', '0', 'model', '4', '操作url：/onethink/admin.php?s=/Model/update.html', '1', '1419874214');
INSERT INTO `xk_action_log` VALUES ('271', '11', '1', '0', 'category', '98', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419874288');
INSERT INTO `xk_action_log` VALUES ('272', '7', '1', '0', 'model', '4', '操作url：/onethink/admin.php?s=/Model/update.html', '1', '1419874330');
INSERT INTO `xk_action_log` VALUES ('273', '7', '1', '0', 'model', '4', '操作url：/onethink/admin.php?s=/Model/update.html', '1', '1419874357');
INSERT INTO `xk_action_log` VALUES ('274', '7', '1', '0', 'model', '5', '操作url：/onethink/admin.php?s=/Model/update.html', '1', '1419874684');
INSERT INTO `xk_action_log` VALUES ('275', '8', '1', '0', 'attribute', '33', '操作url：/onethink/admin.php?s=/Attribute/update.html', '1', '1419874784');
INSERT INTO `xk_action_log` VALUES ('276', '8', '1', '0', 'attribute', '33', '操作url：/onethink/admin.php?s=/Attribute/remove/id/33.html', '1', '1419874832');
INSERT INTO `xk_action_log` VALUES ('277', '7', '1', '0', 'model', '5', '操作url：/onethink/admin.php?s=/Model/update.html', '1', '1419874943');
INSERT INTO `xk_action_log` VALUES ('278', '7', '1', '0', 'model', '5', '操作url：/onethink/admin.php?s=/Model/update.html', '1', '1419874973');
INSERT INTO `xk_action_log` VALUES ('279', '7', '1', '0', 'model', '5', '操作url：/onethink/admin.php?s=/Model/update.html', '1', '1419875057');
INSERT INTO `xk_action_log` VALUES ('280', '11', '1', '0', 'category', '98', '操作url：/onethink/admin.php?s=/Category/edit.html', '1', '1419875176');
INSERT INTO `xk_action_log` VALUES ('281', '11', '1', '0', 'category', '123', '操作url：/onethink/admin.php?s=/Category/add.html', '1', '1419876335');

-- ----------------------------
-- Table structure for xk_addons
-- ----------------------------
DROP TABLE IF EXISTS `xk_addons`;
CREATE TABLE `xk_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of xk_addons
-- ----------------------------
INSERT INTO `xk_addons` VALUES ('15', 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"500px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1383126253', '0');
INSERT INTO `xk_addons` VALUES ('2', 'SiteStat', '站点统计信息', '统计站点的基础信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"1\",\"display\":\"1\",\"status\":\"0\"}', 'thinkphp', '0.1', '1379512015', '0');
INSERT INTO `xk_addons` VALUES ('3', 'DevTeam', '开发团队信息', '开发团队成员信息', '1', '{\"title\":\"OneThink\\u5f00\\u53d1\\u56e2\\u961f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512022', '0');
INSERT INTO `xk_addons` VALUES ('4', 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512036', '0');
INSERT INTO `xk_addons` VALUES ('5', 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1379830910', '0');
INSERT INTO `xk_addons` VALUES ('6', 'Attachment', '附件', '用于文档模型上传附件', '1', 'null', 'thinkphp', '0.1', '1379842319', '1');
INSERT INTO `xk_addons` VALUES ('9', 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', '1', '{\"comment_type\":\"1\",\"comment_uid_youyan\":\"\",\"comment_short_name_duoshuo\":\"\",\"comment_data_list_duoshuo\":\"\"}', 'thinkphp', '0.1', '1380273962', '0');

-- ----------------------------
-- Table structure for xk_attachment
-- ----------------------------
DROP TABLE IF EXISTS `xk_attachment`;
CREATE TABLE `xk_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of xk_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for xk_attribute
-- ----------------------------
DROP TABLE IF EXISTS `xk_attribute`;
CREATE TABLE `xk_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL DEFAULT '',
  `validate_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `error_info` varchar(100) NOT NULL DEFAULT '',
  `validate_type` varchar(25) NOT NULL DEFAULT '',
  `auto_rule` varchar(100) NOT NULL DEFAULT '',
  `auto_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `auto_type` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='模型属性表';

-- ----------------------------
-- Records of xk_attribute
-- ----------------------------
INSERT INTO `xk_attribute` VALUES ('1', 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1384508362', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xk_attribute` VALUES ('2', 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', '1', '', '1', '0', '1', '1383894743', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xk_attribute` VALUES ('3', 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', '1', '', '1', '0', '1', '1383894778', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xk_attribute` VALUES ('4', 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', '0', '', '1', '0', '1', '1384508336', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xk_attribute` VALUES ('5', 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', '1', '', '1', '0', '1', '1383894927', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xk_attribute` VALUES ('6', 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', '0', '', '1', '0', '1', '1384508323', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xk_attribute` VALUES ('7', 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', '0', '', '1', '0', '1', '1384508543', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xk_attribute` VALUES ('8', 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', '0', '', '1', '0', '1', '1384508350', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xk_attribute` VALUES ('9', 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', '1', '1:目录\r\n2:主题\r\n3:段落', '1', '0', '1', '1384511157', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xk_attribute` VALUES ('10', 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', '1', '[DOCUMENT_POSITION]', '1', '0', '1', '1383895640', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xk_attribute` VALUES ('11', 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', '1', '', '1', '0', '1', '1383895757', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xk_attribute` VALUES ('12', 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', '1', '', '1', '0', '1', '1384147827', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xk_attribute` VALUES ('13', 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', '1', '0:不可见\r\n1:所有人可见', '1', '0', '1', '1386662271', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `xk_attribute` VALUES ('14', 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', '1', '', '1', '0', '1', '1387163248', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `xk_attribute` VALUES ('15', 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1387260355', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `xk_attribute` VALUES ('16', 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895835', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xk_attribute` VALUES ('17', 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895846', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xk_attribute` VALUES ('18', 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', '0', '', '1', '0', '1', '1384508264', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xk_attribute` VALUES ('19', 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', '1', '', '1', '0', '1', '1383895894', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xk_attribute` VALUES ('20', 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '1', '0', '1', '1383895903', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xk_attribute` VALUES ('21', 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '0', '', '1', '0', '1', '1384508277', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xk_attribute` VALUES ('22', 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', '0', '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', '1', '0', '1', '1384508496', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xk_attribute` VALUES ('23', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '2', '0', '1', '1384511049', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `xk_attribute` VALUES ('24', 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', '1', '', '2', '0', '1', '1383896225', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `xk_attribute` VALUES ('25', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', '1', '', '2', '0', '1', '1383896190', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `xk_attribute` VALUES ('26', 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '2', '0', '1', '1383896103', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `xk_attribute` VALUES ('27', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '3', '0', '1', '1387260461', '1383891252', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `xk_attribute` VALUES ('28', 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', '1', '', '3', '0', '1', '1383896438', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `xk_attribute` VALUES ('29', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', '1', '', '3', '0', '1', '1383896429', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `xk_attribute` VALUES ('30', 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', '1', '', '3', '0', '1', '1383896415', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `xk_attribute` VALUES ('31', 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '3', '0', '1', '1383896380', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `xk_attribute` VALUES ('32', 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', '1', '', '3', '0', '1', '1383896371', '1383891252', '', '0', '', '', '', '0', '');

-- ----------------------------
-- Table structure for xk_auth_extend
-- ----------------------------
DROP TABLE IF EXISTS `xk_auth_extend`;
CREATE TABLE `xk_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- ----------------------------
-- Records of xk_auth_extend
-- ----------------------------
INSERT INTO `xk_auth_extend` VALUES ('1', '1', '1');
INSERT INTO `xk_auth_extend` VALUES ('1', '1', '2');
INSERT INTO `xk_auth_extend` VALUES ('1', '2', '1');
INSERT INTO `xk_auth_extend` VALUES ('1', '2', '2');
INSERT INTO `xk_auth_extend` VALUES ('1', '3', '1');
INSERT INTO `xk_auth_extend` VALUES ('1', '3', '2');
INSERT INTO `xk_auth_extend` VALUES ('1', '4', '1');
INSERT INTO `xk_auth_extend` VALUES ('1', '37', '1');
INSERT INTO `xk_auth_extend` VALUES ('3', '40', '1');
INSERT INTO `xk_auth_extend` VALUES ('3', '54', '1');
INSERT INTO `xk_auth_extend` VALUES ('3', '55', '1');

-- ----------------------------
-- Table structure for xk_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `xk_auth_group`;
CREATE TABLE `xk_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xk_auth_group
-- ----------------------------
INSERT INTO `xk_auth_group` VALUES ('1', 'admin', '1', '默认用户组', '', '1', '1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106');
INSERT INTO `xk_auth_group` VALUES ('2', 'admin', '1', '测试用户', '测试用户', '1', '1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,96,97,100,102,103,195');
INSERT INTO `xk_auth_group` VALUES ('3', 'admin', '1', '永昌', '', '1', '1,2,7,8,9,10,11,12,13,14,15,16,17,18,79,211,217');

-- ----------------------------
-- Table structure for xk_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `xk_auth_group_access`;
CREATE TABLE `xk_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xk_auth_group_access
-- ----------------------------
INSERT INTO `xk_auth_group_access` VALUES ('2', '3');

-- ----------------------------
-- Table structure for xk_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `xk_auth_rule`;
CREATE TABLE `xk_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=219 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xk_auth_rule
-- ----------------------------
INSERT INTO `xk_auth_rule` VALUES ('1', 'admin', '2', 'Admin/Index/index', '首页', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('2', 'admin', '2', 'Admin/Article/index', '内容', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('3', 'admin', '2', 'Admin/User/index', '用户', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('4', 'admin', '2', 'Admin/Addons/index', '扩展', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('5', 'admin', '2', 'Admin/Config/group', '系统', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('7', 'admin', '1', 'Admin/article/add', '新增', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('8', 'admin', '1', 'Admin/article/edit', '编辑', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('9', 'admin', '1', 'Admin/article/setStatus', '改变状态', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('10', 'admin', '1', 'Admin/article/update', '保存', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('11', 'admin', '1', 'Admin/article/autoSave', '保存草稿', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('12', 'admin', '1', 'Admin/article/move', '移动', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('13', 'admin', '1', 'Admin/article/copy', '复制', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('14', 'admin', '1', 'Admin/article/paste', '粘贴', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('15', 'admin', '1', 'Admin/article/permit', '还原', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('16', 'admin', '1', 'Admin/article/clear', '清空', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('17', 'admin', '1', 'Admin/Article/examine', '审核列表', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('18', 'admin', '1', 'Admin/article/recycle', '回收站', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('19', 'admin', '1', 'Admin/User/addaction', '新增用户行为', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('20', 'admin', '1', 'Admin/User/editaction', '编辑用户行为', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('21', 'admin', '1', 'Admin/User/saveAction', '保存用户行为', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('22', 'admin', '1', 'Admin/User/setStatus', '变更行为状态', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('23', 'admin', '1', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('24', 'admin', '1', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('25', 'admin', '1', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('26', 'admin', '1', 'Admin/User/index', '用户信息', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('27', 'admin', '1', 'Admin/User/action', '用户行为', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('28', 'admin', '1', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('29', 'admin', '1', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('30', 'admin', '1', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('31', 'admin', '1', 'Admin/AuthManager/createGroup', '新增', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('32', 'admin', '1', 'Admin/AuthManager/editGroup', '编辑', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('33', 'admin', '1', 'Admin/AuthManager/writeGroup', '保存用户组', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('34', 'admin', '1', 'Admin/AuthManager/group', '授权', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('35', 'admin', '1', 'Admin/AuthManager/access', '访问授权', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('36', 'admin', '1', 'Admin/AuthManager/user', '成员授权', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('37', 'admin', '1', 'Admin/AuthManager/removeFromGroup', '解除授权', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('38', 'admin', '1', 'Admin/AuthManager/addToGroup', '保存成员授权', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('39', 'admin', '1', 'Admin/AuthManager/category', '分类授权', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('40', 'admin', '1', 'Admin/AuthManager/addToCategory', '保存分类授权', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('41', 'admin', '1', 'Admin/AuthManager/index', '权限管理', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('42', 'admin', '1', 'Admin/Addons/create', '创建', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('43', 'admin', '1', 'Admin/Addons/checkForm', '检测创建', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('44', 'admin', '1', 'Admin/Addons/preview', '预览', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('45', 'admin', '1', 'Admin/Addons/build', '快速生成插件', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('46', 'admin', '1', 'Admin/Addons/config', '设置', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('47', 'admin', '1', 'Admin/Addons/disable', '禁用', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('48', 'admin', '1', 'Admin/Addons/enable', '启用', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('49', 'admin', '1', 'Admin/Addons/install', '安装', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('50', 'admin', '1', 'Admin/Addons/uninstall', '卸载', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('51', 'admin', '1', 'Admin/Addons/saveconfig', '更新配置', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('52', 'admin', '1', 'Admin/Addons/adminList', '插件后台列表', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('53', 'admin', '1', 'Admin/Addons/execute', 'URL方式访问插件', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('54', 'admin', '1', 'Admin/Addons/index', '插件管理', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('55', 'admin', '1', 'Admin/Addons/hooks', '钩子管理', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('56', 'admin', '1', 'Admin/model/add', '新增', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('57', 'admin', '1', 'Admin/model/edit', '编辑', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('58', 'admin', '1', 'Admin/model/setStatus', '改变状态', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('59', 'admin', '1', 'Admin/model/update', '保存数据', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('60', 'admin', '1', 'Admin/Model/index', '模型管理', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('61', 'admin', '1', 'Admin/Config/edit', '编辑', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('62', 'admin', '1', 'Admin/Config/del', '删除', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('63', 'admin', '1', 'Admin/Config/add', '新增', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('64', 'admin', '1', 'Admin/Config/save', '保存', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('65', 'admin', '1', 'Admin/Config/group', '网站设置', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('66', 'admin', '1', 'Admin/Config/index', '配置管理', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('67', 'admin', '1', 'Admin/Channel/add', '新增', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('68', 'admin', '1', 'Admin/Channel/edit', '编辑', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('69', 'admin', '1', 'Admin/Channel/del', '删除', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('70', 'admin', '1', 'Admin/Channel/index', '导航管理', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('71', 'admin', '1', 'Admin/Category/edit', '编辑', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('72', 'admin', '1', 'Admin/Category/add', '新增', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('73', 'admin', '1', 'Admin/Category/remove', '删除', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('74', 'admin', '1', 'Admin/Category/index', '分类管理', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('75', 'admin', '1', 'Admin/file/upload', '上传控件', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('76', 'admin', '1', 'Admin/file/uploadPicture', '上传图片', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('77', 'admin', '1', 'Admin/file/download', '下载', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('94', 'admin', '1', 'Admin/AuthManager/modelauth', '模型授权', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('79', 'admin', '1', 'Admin/article/batchOperate', '导入', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('80', 'admin', '1', 'Admin/Database/index?type=export', '备份数据库', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('81', 'admin', '1', 'Admin/Database/index?type=import', '还原数据库', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('82', 'admin', '1', 'Admin/Database/export', '备份', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('83', 'admin', '1', 'Admin/Database/optimize', '优化表', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('84', 'admin', '1', 'Admin/Database/repair', '修复表', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('86', 'admin', '1', 'Admin/Database/import', '恢复', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('87', 'admin', '1', 'Admin/Database/del', '删除', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('88', 'admin', '1', 'Admin/User/add', '新增用户', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('89', 'admin', '1', 'Admin/Attribute/index', '属性管理', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('90', 'admin', '1', 'Admin/Attribute/add', '新增', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('91', 'admin', '1', 'Admin/Attribute/edit', '编辑', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('92', 'admin', '1', 'Admin/Attribute/setStatus', '改变状态', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('93', 'admin', '1', 'Admin/Attribute/update', '保存数据', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('95', 'admin', '1', 'Admin/AuthManager/addToModel', '保存模型授权', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('96', 'admin', '1', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('97', 'admin', '1', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('98', 'admin', '1', 'Admin/Config/menu', '后台菜单管理', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('99', 'admin', '1', 'Admin/Article/mydocument', '内容', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('100', 'admin', '1', 'Admin/Menu/index', '菜单管理', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('101', 'admin', '1', 'Admin/other', '其他', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('102', 'admin', '1', 'Admin/Menu/add', '新增', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('103', 'admin', '1', 'Admin/Menu/edit', '编辑', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('104', 'admin', '1', 'Admin/Think/lists?model=article', '文章管理', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('105', 'admin', '1', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('106', 'admin', '1', 'Admin/Think/lists?model=config', '配置管理', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('107', 'admin', '1', 'Admin/Action/actionlog', '行为日志', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('108', 'admin', '1', 'Admin/User/updatePassword', '修改密码', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('109', 'admin', '1', 'Admin/User/updateNickname', '修改昵称', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('110', 'admin', '1', 'Admin/action/edit', '查看行为日志', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('205', 'admin', '1', 'Admin/think/add', '新增数据', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('111', 'admin', '2', 'Admin/article/index', '文档列表', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('112', 'admin', '2', 'Admin/article/add', '新增', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('113', 'admin', '2', 'Admin/article/edit', '编辑', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('114', 'admin', '2', 'Admin/article/setStatus', '改变状态', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('115', 'admin', '2', 'Admin/article/update', '保存', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('116', 'admin', '2', 'Admin/article/autoSave', '保存草稿', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('117', 'admin', '2', 'Admin/article/move', '移动', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('118', 'admin', '2', 'Admin/article/copy', '复制', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('119', 'admin', '2', 'Admin/article/paste', '粘贴', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('120', 'admin', '2', 'Admin/article/batchOperate', '导入', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('121', 'admin', '2', 'Admin/article/recycle', '回收站', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('122', 'admin', '2', 'Admin/article/permit', '还原', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('123', 'admin', '2', 'Admin/article/clear', '清空', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('124', 'admin', '2', 'Admin/User/add', '新增用户', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('125', 'admin', '2', 'Admin/User/action', '用户行为', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('126', 'admin', '2', 'Admin/User/addAction', '新增用户行为', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('127', 'admin', '2', 'Admin/User/editAction', '编辑用户行为', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('128', 'admin', '2', 'Admin/User/saveAction', '保存用户行为', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('129', 'admin', '2', 'Admin/User/setStatus', '变更行为状态', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('130', 'admin', '2', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('131', 'admin', '2', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('132', 'admin', '2', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('133', 'admin', '2', 'Admin/AuthManager/index', '权限管理', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('134', 'admin', '2', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('135', 'admin', '2', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('136', 'admin', '2', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('137', 'admin', '2', 'Admin/AuthManager/createGroup', '新增', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('138', 'admin', '2', 'Admin/AuthManager/editGroup', '编辑', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('139', 'admin', '2', 'Admin/AuthManager/writeGroup', '保存用户组', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('140', 'admin', '2', 'Admin/AuthManager/group', '授权', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('141', 'admin', '2', 'Admin/AuthManager/access', '访问授权', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('142', 'admin', '2', 'Admin/AuthManager/user', '成员授权', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('143', 'admin', '2', 'Admin/AuthManager/removeFromGroup', '解除授权', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('144', 'admin', '2', 'Admin/AuthManager/addToGroup', '保存成员授权', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('145', 'admin', '2', 'Admin/AuthManager/category', '分类授权', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('146', 'admin', '2', 'Admin/AuthManager/addToCategory', '保存分类授权', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('147', 'admin', '2', 'Admin/AuthManager/modelauth', '模型授权', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('148', 'admin', '2', 'Admin/AuthManager/addToModel', '保存模型授权', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('149', 'admin', '2', 'Admin/Addons/create', '创建', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('150', 'admin', '2', 'Admin/Addons/checkForm', '检测创建', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('151', 'admin', '2', 'Admin/Addons/preview', '预览', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('152', 'admin', '2', 'Admin/Addons/build', '快速生成插件', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('153', 'admin', '2', 'Admin/Addons/config', '设置', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('154', 'admin', '2', 'Admin/Addons/disable', '禁用', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('155', 'admin', '2', 'Admin/Addons/enable', '启用', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('156', 'admin', '2', 'Admin/Addons/install', '安装', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('157', 'admin', '2', 'Admin/Addons/uninstall', '卸载', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('158', 'admin', '2', 'Admin/Addons/saveconfig', '更新配置', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('159', 'admin', '2', 'Admin/Addons/adminList', '插件后台列表', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('160', 'admin', '2', 'Admin/Addons/execute', 'URL方式访问插件', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('161', 'admin', '2', 'Admin/Addons/hooks', '钩子管理', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('162', 'admin', '2', 'Admin/Model/index', '模型管理', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('163', 'admin', '2', 'Admin/model/add', '新增', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('164', 'admin', '2', 'Admin/model/edit', '编辑', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('165', 'admin', '2', 'Admin/model/setStatus', '改变状态', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('166', 'admin', '2', 'Admin/model/update', '保存数据', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('167', 'admin', '2', 'Admin/Attribute/index', '属性管理', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('168', 'admin', '2', 'Admin/Attribute/add', '新增', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('169', 'admin', '2', 'Admin/Attribute/edit', '编辑', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('170', 'admin', '2', 'Admin/Attribute/setStatus', '改变状态', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('171', 'admin', '2', 'Admin/Attribute/update', '保存数据', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('172', 'admin', '2', 'Admin/Config/index', '配置管理', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('173', 'admin', '2', 'Admin/Config/edit', '编辑', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('174', 'admin', '2', 'Admin/Config/del', '删除', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('175', 'admin', '2', 'Admin/Config/add', '新增', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('176', 'admin', '2', 'Admin/Config/save', '保存', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('177', 'admin', '2', 'Admin/Menu/index', '菜单管理', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('178', 'admin', '2', 'Admin/Channel/index', '导航管理', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('179', 'admin', '2', 'Admin/Channel/add', '新增', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('180', 'admin', '2', 'Admin/Channel/edit', '编辑', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('181', 'admin', '2', 'Admin/Channel/del', '删除', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('182', 'admin', '2', 'Admin/Category/index', '分类管理', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('183', 'admin', '2', 'Admin/Category/edit', '编辑', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('184', 'admin', '2', 'Admin/Category/add', '新增', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('185', 'admin', '2', 'Admin/Category/remove', '删除', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('186', 'admin', '2', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('187', 'admin', '2', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('188', 'admin', '2', 'Admin/Database/index?type=export', '备份数据库', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('189', 'admin', '2', 'Admin/Database/export', '备份', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('190', 'admin', '2', 'Admin/Database/optimize', '优化表', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('191', 'admin', '2', 'Admin/Database/repair', '修复表', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('192', 'admin', '2', 'Admin/Database/index?type=import', '还原数据库', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('193', 'admin', '2', 'Admin/Database/import', '恢复', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('194', 'admin', '2', 'Admin/Database/del', '删除', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('195', 'admin', '2', 'Admin/other', '其他', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('196', 'admin', '2', 'Admin/Menu/add', '新增', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('197', 'admin', '2', 'Admin/Menu/edit', '编辑', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('198', 'admin', '2', 'Admin/Think/lists?model=article', '应用', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('199', 'admin', '2', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('200', 'admin', '2', 'Admin/Think/lists?model=config', '应用', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('201', 'admin', '2', 'Admin/Action/actionlog', '行为日志', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('202', 'admin', '2', 'Admin/User/updatePassword', '修改密码', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('203', 'admin', '2', 'Admin/User/updateNickname', '修改昵称', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('204', 'admin', '2', 'Admin/action/edit', '查看行为日志', '-1', '');
INSERT INTO `xk_auth_rule` VALUES ('206', 'admin', '1', 'Admin/think/edit', '编辑数据', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('207', 'admin', '1', 'Admin/Menu/import', '导入', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('208', 'admin', '1', 'Admin/Model/generate', '生成', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('209', 'admin', '1', 'Admin/Addons/addHook', '新增钩子', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('210', 'admin', '1', 'Admin/Addons/edithook', '编辑钩子', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('211', 'admin', '1', 'Admin/Article/sort', '文档排序', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('212', 'admin', '1', 'Admin/Config/sort', '排序', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('213', 'admin', '1', 'Admin/Menu/sort', '排序', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('214', 'admin', '1', 'Admin/Channel/sort', '排序', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('215', 'admin', '1', 'Admin/Category/operate/type/move', '移动', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('216', 'admin', '1', 'Admin/Category/operate/type/merge', '合并', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('217', 'admin', '1', 'Admin/article/index', '文档列表', '1', '');
INSERT INTO `xk_auth_rule` VALUES ('218', 'admin', '1', 'Admin/think/lists', '数据列表', '1', '');

-- ----------------------------
-- Table structure for xk_category
-- ----------------------------
DROP TABLE IF EXISTS `xk_category`;
CREATE TABLE `xk_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL DEFAULT '' COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL DEFAULT '' COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '列表绑定模型',
  `model_sub` varchar(100) NOT NULL DEFAULT '' COMMENT '子文档绑定模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  `groups` varchar(255) NOT NULL DEFAULT '' COMMENT '分组定义',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of xk_category
-- ----------------------------
INSERT INTO `xk_category` VALUES ('1', 'blog', '服务', '0', '0', '10', '', '', '', '', '', '', '', '2,3', '2', '2,1', '0', '0', '1', '0', '0', '1', '', '1379474947', '1419338668', '1', '0', '');
INSERT INTO `xk_category` VALUES ('2', 'top', '置顶', '1', '1', '10', '', '', '', '', '', '', '', '2', '2', '2,1,3', '0', '1', '1', '0', '0', '1', '', '1379475028', '1419810602', '1', '0', '');
INSERT INTO `xk_category` VALUES ('39', 'cs', '栏目', '0', '1', '10', '', '', '', '', '', '', '', '3', '3', '2', '0', '1', '1', '0', '0', '', null, '1418697134', '1419339600', '1', '0', '');
INSERT INTO `xk_category` VALUES ('40', 'fenzhan', '分站点', '0', '99', '10', '', '', '', '', '', '', '', '2,3', '2,3', '2,1,3', '0', '1', '1', '0', '0', '', null, '1418700406', '1419339554', '1', '0', '');
INSERT INTO `xk_category` VALUES ('41', 'yongchang', '永昌站', '40', '0', '10', '', '', '', '', '', '', '', '2,3', '2,3', '2', '0', '1', '1', '0', '0', '', null, '1418700441', '1418704290', '1', '0', '');
INSERT INTO `xk_category` VALUES ('42', 'shuiyingchangdao', '水映长岛', '40', '0', '10', '', '', '', '', '', '', '', '2,3', '2,3', '2,1,3', '0', '1', '1', '0', '0', '', null, '1418700557', '1418700557', '1', '0', '');
INSERT INTO `xk_category` VALUES ('43', 'wenyilu', '文艺路社区', '40', '0', '10', '', '', '', '', '', '', '', '2,3', '2,3', '2,1,3', '0', '1', '1', '0', '0', '', null, '1418700583', '1418700583', '1', '0', '');
INSERT INTO `xk_category` VALUES ('44', 'jingkangyuan', '金康园社区', '40', '0', '10', '', '', '', '', '', '', '', '3', '', '2,1,3', '0', '1', '1', '0', '0', '', null, '1418700595', '1418700595', '1', '0', '');
INSERT INTO `xk_category` VALUES ('45', 'caiyuanjian', '彩云间中心', '40', '0', '10', '', '', '', '', '', '', '', '', '', '', '0', '1', '1', '0', '0', '', null, '1418700611', '1418700611', '1', '0', '');
INSERT INTO `xk_category` VALUES ('46', 'jingshejiaoxiang', '金色交响中心', '40', '0', '10', '', '', '', '', '', '', '', '', '', '', '0', '1', '1', '0', '0', '', null, '1418700623', '1418700623', '1', '0', '');
INSERT INTO `xk_category` VALUES ('47', 'shuling', '书林社区', '40', '0', '10', '', '', '', '', '', '', '', '', '', '', '0', '1', '1', '0', '0', '', null, '1418700633', '1418700633', '1', '0', '');
INSERT INTO `xk_category` VALUES ('48', 'xinghuiyuan', '星汇园社区', '40', '0', '10', '', '', '', '', '', '', '', '', '', '', '0', '1', '1', '0', '0', '', null, '1418700649', '1418700649', '1', '0', '');
INSERT INTO `xk_category` VALUES ('49', 'deyuan', '德缘社区', '40', '0', '10', '', '', '', '', '', '', '', '', '', '', '0', '1', '1', '0', '0', '', null, '1418700658', '1418700658', '1', '0', '');
INSERT INTO `xk_category` VALUES ('50', 'shenggaodacheng', '盛高大城社区', '40', '0', '10', '', '', '', '', '', '', '', '', '', '', '0', '1', '1', '0', '0', '', null, '1418700676', '1418700676', '1', '0', '');
INSERT INTO `xk_category` VALUES ('51', 'zhongminglu', '忠明路社区', '40', '0', '10', '', '', '', '', '', '', '', '', '', '', '0', '1', '1', '0', '0', '', null, '1418700685', '1418700685', '1', '0', '');
INSERT INTO `xk_category` VALUES ('52', 'jiaoling', '茭菱社区', '40', '0', '10', '', '', '', '', '', '', '', '', '', '', '0', '1', '1', '0', '0', '', null, '1418700698', '1418700698', '1', '0', '');
INSERT INTO `xk_category` VALUES ('53', 'xiyuanbeilu', '西园北路社区', '40', '0', '10', '', '', '', '', '', '', '', '', '', '', '0', '1', '1', '0', '0', '', null, '1418700710', '1418700710', '1', '0', '');
INSERT INTO `xk_category` VALUES ('54', 'jl-cs', '测试', '52', '0', '10', '', '', '', '', '', '', '', '', '', '', '0', '1', '1', '0', '0', '', null, '1418718088', '1418718088', '1', '0', '');
INSERT INTO `xk_category` VALUES ('55', 'yc-cs', '测试', '41', '0', '10', '', '', '', '', '', '', '', '', '', '', '0', '1', '1', '0', '0', '', null, '1418718107', '1418718107', '1', '0', '');
INSERT INTO `xk_category` VALUES ('56', 'fwzn', '服务指南', '1', '0', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419304011', '1419304571', '1', '0', '');
INSERT INTO `xk_category` VALUES ('57', 'dzdt', '电子地图', '1', '0', '10', '', '', '', '', '', '', '', '', '', '', '0', '1', '1', '0', '0', '', null, '1419304025', '1419304025', '1', '0', '');
INSERT INTO `xk_category` VALUES ('58', 'zzyy', '转诊预约', '1', '0', '10', '', '', '', '', '', '', '', '', '', '', '0', '1', '1', '0', '0', '', null, '1419304041', '1419304041', '1', '0', '');
INSERT INTO `xk_category` VALUES ('59', 'fwgg', '服务公告', '1', '0', '10', '', '', '', '', '', '', '', '', '', '', '0', '1', '1', '0', '0', '', null, '1419304056', '1419304056', '1', '0', '');
INSERT INTO `xk_category` VALUES ('60', 'jgdq', '机构大全', '1', '0', '10', '', '', '', '', '', '', '', '', '', '', '0', '1', '1', '0', '0', '', null, '1419304069', '1419304069', '1', '0', '');
INSERT INTO `xk_category` VALUES ('74', 'jkdafw', '健康档案服务', '70', '4', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419338842', '1419344593', '1', '0', '');
INSERT INTO `xk_category` VALUES ('78', 'sgkx', '社管快讯', '77', '1', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419338963', '1419344604', '1', '0', '');
INSERT INTO `xk_category` VALUES ('104', 'xzyd', '下载园地', '102', '2', '10', '', '', '', '', '', '', '', '3', '3', '2', '0', '1', '1', '0', '0', '', null, '1419339689', '1419344693', '1', '0', '');
INSERT INTO `xk_category` VALUES ('64', 'xxqk', '信息期刊', '1', '0', '10', '', '', '', '', '', '', '', '', '', '', '0', '1', '1', '0', '0', '', null, '1419304139', '1419304139', '1', '0', '');
INSERT INTO `xk_category` VALUES ('105', 'sjqk', '市级期刊', '102', '3', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419339723', '1419344694', '1', '0', '');
INSERT INTO `xk_category` VALUES ('106', 'qxqk', '区县期刊', '102', '4', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419339755', '1419344696', '1', '0', '');
INSERT INTO `xk_category` VALUES ('83', 'jkfxb', '健康风向标', '77', '6', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419339139', '1419344634', '1', '0', '');
INSERT INTO `xk_category` VALUES ('107', 'wlpx', '网络培训', '102', '5', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419339797', '1419344698', '1', '0', '');
INSERT INTO `xk_category` VALUES ('69', 'sqwsdjt', '社区卫生大家谈', '1', '0', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419304272', '1419809690', '1', '0', '');
INSERT INTO `xk_category` VALUES ('70', 'bmfw', '便民服务', '39', '1', '10', '', '', '', '', '', '', '', '2', '2', '', '0', '1', '1', '0', '0', '', null, '1419338712', '1419339570', '1', '0', '');
INSERT INTO `xk_category` VALUES ('71', 'jgssdq', '机构搜索大全', '70', '1', '10', '', '', '', '', '', '', '', '2', '2', '', '0', '1', '1', '0', '0', '', null, '1419338739', '1419344578', '1', '0', '');
INSERT INTO `xk_category` VALUES ('72', 'sqwsdzdt', '社区卫生电子地图', '70', '2', '10', '', '', '', '', '', '', '', '2', '2', '', '0', '1', '1', '0', '0', '', null, '1419338759', '1419344582', '1', '0', '');
INSERT INTO `xk_category` VALUES ('73', 'jtyssfw', '家庭医生式服务', '70', '3', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419338799', '1419344588', '1', '0', '');
INSERT INTO `xk_category` VALUES ('75', 'zzyyfw', '转诊预约服务', '70', '5', '10', '', '', '', '', '', '', '', '2', '2', '', '0', '1', '1', '0', '0', '', null, '1419338885', '1419344597', '1', '0', '');
INSERT INTO `xk_category` VALUES ('76', 'etyfbjfw', '儿童预防保健服务', '70', '6', '10', '', '', '', '', '', '', '', '2', '2', '', '0', '1', '1', '0', '0', '', null, '1419338907', '1419344598', '1', '0', '');
INSERT INTO `xk_category` VALUES ('77', 'zxfw', '资讯服务', '39', '2', '10', '', '', '', '', '', '', '', '2', '2', '', '0', '1', '1', '0', '0', '', null, '1419338922', '1419339569', '1', '0', '');
INSERT INTO `xk_category` VALUES ('79', 'jcdt', '基层动态', '77', '2', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419338985', '1419344606', '1', '0', '');
INSERT INTO `xk_category` VALUES ('80', 'mtbd', '媒体报道', '77', '3', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419339015', '1419344613', '1', '0', '');
INSERT INTO `xk_category` VALUES ('81', 'tzgg', '通知公告', '77', '4', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419339056', '1419344611', '1', '0', '');
INSERT INTO `xk_category` VALUES ('82', 'jcfwgg', '基层服务公告', '77', '5', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419339074', '1419344632', '1', '0', '');
INSERT INTO `xk_category` VALUES ('84', 'wsbdsqws', '我身边的社区卫生', '77', '7', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419339168', '1419344624', '1', '0', '');
INSERT INTO `xk_category` VALUES ('85', 'tjxx', '统计信息', '77', '8', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419339204', '1419344640', '1', '0', '');
INSERT INTO `xk_category` VALUES ('86', 'rsxx', '人事信息', '77', '9', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419339232', '1419344643', '1', '0', '');
INSERT INTO `xk_category` VALUES ('87', 'yqbg', '舆情报告', '77', '10', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419339251', '1419344645', '1', '0', '');
INSERT INTO `xk_category` VALUES ('88', 'zcfg', '政策法规', '39', '3', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419339276', '1419339581', '1', '0', '');
INSERT INTO `xk_category` VALUES ('89', 'gjjfg', '国家级法规', '88', '1', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419339301', '1419344656', '1', '0', '');
INSERT INTO `xk_category` VALUES ('90', 'kmsfg', '昆明市法规', '88', '2', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419339324', '1419344657', '1', '0', '');
INSERT INTO `xk_category` VALUES ('91', 'ygdt', '医改动态', '88', '3', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419339355', '1419344658', '1', '0', '');
INSERT INTO `xk_category` VALUES ('92', 'zcjd', '政策解读', '88', '4', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419339374', '1419344658', '1', '0', '');
INSERT INTO `xk_category` VALUES ('93', 'jkzs', '健康知识', '39', '4', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419339393', '1419339579', '1', '0', '');
INSERT INTO `xk_category` VALUES ('94', 'jbyf', '疾病预防', '93', '1', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419339409', '1419344665', '1', '0', '');
INSERT INTO `xk_category` VALUES ('95', 'fybj', '妇幼保健', '93', '2', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419339430', '1419344666', '1', '0', '');
INSERT INTO `xk_category` VALUES ('96', 'lnbj', '老年保健', '93', '3', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419339448', '1419344667', '1', '0', '');
INSERT INTO `xk_category` VALUES ('97', 'zyzy', '中医中药', '93', '4', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419339468', '1419344674', '1', '0', '');
INSERT INTO `xk_category` VALUES ('98', 'jkdjt', '健康大讲堂', '93', '5', '10', '', '', '', '', '', '', '', '3', '3', '2', '0', '1', '1', '0', '0', '', null, '1419339487', '1419875176', '1', '0', '');
INSERT INTO `xk_category` VALUES ('99', 'jsws', '精神卫生', '93', '6', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419339509', '1419344680', '1', '0', '');
INSERT INTO `xk_category` VALUES ('100', 'kffw', '康复服务', '93', '7', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419339527', '1419344684', '1', '0', '');
INSERT INTO `xk_category` VALUES ('101', 'jkxzs', '健康小知识', '93', '8', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419339546', '1419344686', '1', '0', '');
INSERT INTO `xk_category` VALUES ('102', 'sgfw', '社管服务', '39', '5', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419339628', '1419339628', '1', '0', '');
INSERT INTO `xk_category` VALUES ('103', 'gzzl', '工作专栏', '102', '1', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419339651', '1419344692', '1', '0', '');
INSERT INTO `xk_category` VALUES ('108', 'sgyjq', '社管一家亲', '102', '6', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419339815', '1419344699', '1', '0', '');
INSERT INTO `xk_category` VALUES ('109', 'hdjl', '互动交流', '39', '6', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419339838', '1419339865', '1', '0', '');
INSERT INTO `xk_category` VALUES ('110', 'jgjs', '机构介绍', '39', '7', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419339887', '1419339901', '1', '0', '');
INSERT INTO `xk_category` VALUES ('112', 'jczl', '精彩专栏', '39', '8', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419340053', '1419344574', '1', '0', '');
INSERT INTO `xk_category` VALUES ('113', 'zt', '专题', '0', '98', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419801576', '1419801589', '1', '0', '');
INSERT INTO `xk_category` VALUES ('114', 'mxbfzjtbjjh', '慢性病防治家庭保健计划', '118', '1', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419801629', '1419801785', '1', '8', '');
INSERT INTO `xk_category` VALUES ('115', 'sbqsqwsrcpygz', '十百千社区卫生人才培养工作', '118', '2', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419801711', '1419801784', '1', '9', '');
INSERT INTO `xk_category` VALUES ('116', 'jtyssfw1', '家庭医生式服务', '118', '3', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419801770', '1419801797', '1', '10', '');
INSERT INTO `xk_category` VALUES ('117', 'sqwshzjl', '社区卫生合作交流', '113', '0', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419861361', '1419861361', '1', '0', '');
INSERT INTO `xk_category` VALUES ('118', 'twzt', '图文专题', '113', '0', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419861600', '1419861600', '1', '0', '');
INSERT INTO `xk_category` VALUES ('119', 'jgsfzx', '京港示范中心', '117', '1', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419861800', '1419861813', '1', '12', '');
INSERT INTO `xk_category` VALUES ('120', 'jmsls', '京蒙手拉手', '117', '2', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419861847', '1419861856', '1', '13', '');
INSERT INTO `xk_category` VALUES ('121', 'jjdkbf', '京晋对口帮扶', '117', '0', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419861903', '1419861903', '1', '14', '');
INSERT INTO `xk_category` VALUES ('122', 'zjfc', '专家风采', '113', '0', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419865302', '1419865302', '1', '0', '');
INSERT INTO `xk_category` VALUES ('123', 'gwlb', '岗位练兵', '113', '0', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419876335', '1419876335', '1', '0', '');

-- ----------------------------
-- Table structure for xk_channel
-- ----------------------------
DROP TABLE IF EXISTS `xk_channel`;
CREATE TABLE `xk_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xk_channel
-- ----------------------------
INSERT INTO `xk_channel` VALUES ('5', '0', '电子地图', '/Home/Article/lists/category/dzdt', '3', '1419304846', '1419305005', '1', '0');
INSERT INTO `xk_channel` VALUES ('4', '0', '服务指南', '/Home/Article/lists/category/fwzn', '2', '1419304621', '1419304636', '1', '0');
INSERT INTO `xk_channel` VALUES ('6', '0', '转诊预约', '/Home/Article/lists/category/zzyy', '4', '1419304865', '1419305115', '1', '0');
INSERT INTO `xk_channel` VALUES ('7', '0', '服务公告', '/Home/Article/lists/category/fwgg', '5', '1419304883', '1419305120', '1', '0');
INSERT INTO `xk_channel` VALUES ('8', '0', '机构大全', '/Home/Article/lists/category/jgdq', '6', '1419304896', '1419305125', '1', '0');
INSERT INTO `xk_channel` VALUES ('9', '0', '健康风向标', '/Home/Article/lists/category/jkfxb', '7', '1419304914', '1419305130', '1', '0');
INSERT INTO `xk_channel` VALUES ('10', '0', '家庭医生式服务', '/Home/Article/lists/category/jtyssfw', '9', '1419304943', '1419305136', '1', '0');
INSERT INTO `xk_channel` VALUES ('11', '0', '社管快讯', '/Home/Article/lists/category/sgkx', '10', '1419304989', '1419304989', '1', '0');
INSERT INTO `xk_channel` VALUES ('12', '0', '工作专栏', '/Home/Article/lists/category/gzzl', '11', '1419305019', '1419305144', '1', '0');
INSERT INTO `xk_channel` VALUES ('13', '0', '信息期刊', '/Home/Article/lists/category/xxqk', '12', '1419305037', '1419306056', '1', '0');
INSERT INTO `xk_channel` VALUES ('14', '0', '下载园地', '/Home/Article/lists/category/xzyd', '13', '1419305056', '1419305153', '1', '0');
INSERT INTO `xk_channel` VALUES ('15', '0', '网络培训', '/Home/Article/lists/category/wlpx', '14', '1419305072', '1419305159', '1', '0');
INSERT INTO `xk_channel` VALUES ('16', '0', '社管一家亲', '/Home/Article/lists/category/sgyjq', '15', '1419305085', '1419305164', '1', '0');
INSERT INTO `xk_channel` VALUES ('17', '0', '社区卫生大家谈', '/Home/Article/lists/category/sqwsdjt', '16', '1419305102', '1419305169', '1', '0');

-- ----------------------------
-- Table structure for xk_config
-- ----------------------------
DROP TABLE IF EXISTS `xk_config`;
CREATE TABLE `xk_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xk_config
-- ----------------------------
INSERT INTO `xk_config` VALUES ('1', 'WEB_SITE_TITLE', '1', '网站标题', '1', '', '网站标题前台显示标题', '1378898976', '1379235274', '1', '新康公共医疗网站', '0');
INSERT INTO `xk_config` VALUES ('2', 'WEB_SITE_DESCRIPTION', '2', '网站描述', '1', '', '网站搜索引擎描述', '1378898976', '1379235841', '1', '新康公共医疗网站', '1');
INSERT INTO `xk_config` VALUES ('3', 'WEB_SITE_KEYWORD', '2', '网站关键字', '1', '', '网站搜索引擎关键字', '1378898976', '1381390100', '1', '新康,新康公共医疗,新康公共医疗网站,新康公共卫生,昆明新康,云南新康', '8');
INSERT INTO `xk_config` VALUES ('4', 'WEB_SITE_CLOSE', '4', '关闭站点', '1', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1379235296', '1', '1', '1');
INSERT INTO `xk_config` VALUES ('9', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '2');
INSERT INTO `xk_config` VALUES ('10', 'WEB_SITE_ICP', '1', '网站备案号', '1', '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', '1378900335', '1419437049', '1', '云ICP备00001234号', '9');
INSERT INTO `xk_config` VALUES ('11', 'DOCUMENT_POSITION', '3', '文档推荐位', '2', '', '文档推荐位，推荐到多个位置KEY值相加即可', '1379053380', '1379235329', '1', '1:列表推荐\r\n2:频道推荐\r\n4:首页推荐', '3');
INSERT INTO `xk_config` VALUES ('12', 'DOCUMENT_DISPLAY', '3', '文档可见性', '2', '', '文章可见性仅影响前台显示，后台不收影响', '1379056370', '1379235322', '1', '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', '4');
INSERT INTO `xk_config` VALUES ('13', 'COLOR_STYLE', '4', '后台色系', '1', 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', '1379122533', '1379235904', '1', 'default_color', '10');
INSERT INTO `xk_config` VALUES ('20', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1384418383', '1', '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', '4');
INSERT INTO `xk_config` VALUES ('21', 'HOOKS_TYPE', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '6');
INSERT INTO `xk_config` VALUES ('22', 'AUTH_CONFIG', '3', 'Auth配置', '4', '', '自定义Auth.class.php类配置', '1379409310', '1379409564', '1', 'AUTH_ON:1\r\nAUTH_TYPE:2', '8');
INSERT INTO `xk_config` VALUES ('23', 'OPEN_DRAFTBOX', '4', '是否开启草稿功能', '2', '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', '1379484332', '1379484591', '1', '1', '1');
INSERT INTO `xk_config` VALUES ('24', 'DRAFT_AOTOSAVE_INTERVAL', '0', '自动保存草稿时间', '2', '', '自动保存草稿的时间间隔，单位：秒', '1379484574', '1386143323', '1', '60', '2');
INSERT INTO `xk_config` VALUES ('25', 'LIST_ROWS', '0', '后台每页记录数', '2', '', '后台数据每页显示记录数', '1379503896', '1380427745', '1', '10', '10');
INSERT INTO `xk_config` VALUES ('26', 'USER_ALLOW_REGISTER', '4', '是否允许用户注册', '3', '0:关闭注册\r\n1:允许注册', '是否开放用户注册', '1379504487', '1379504580', '1', '0', '3');
INSERT INTO `xk_config` VALUES ('27', 'CODEMIRROR_THEME', '4', '预览插件的CodeMirror主题', '4', '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', '1379814385', '1384740813', '1', 'ambiance', '3');
INSERT INTO `xk_config` VALUES ('28', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '路径必须以 / 结尾', '1381482411', '1381482411', '1', './Data/', '5');
INSERT INTO `xk_config` VALUES ('29', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '7');
INSERT INTO `xk_config` VALUES ('30', 'DATA_BACKUP_COMPRESS', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '9');
INSERT INTO `xk_config` VALUES ('31', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '10');
INSERT INTO `xk_config` VALUES ('32', 'DEVELOP_MODE', '4', '开启开发者模式', '4', '0:关闭\r\n1:开启', '是否开启开发者模式', '1383105995', '1383291877', '1', '1', '11');
INSERT INTO `xk_config` VALUES ('33', 'ALLOW_VISIT', '3', '不受限控制器方法', '0', '', '', '1386644047', '1386644741', '1', '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', '0');
INSERT INTO `xk_config` VALUES ('34', 'DENY_VISIT', '3', '超管专限控制器方法', '0', '', '仅超级管理员可访问的控制器方法', '1386644141', '1386644659', '1', '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', '0');
INSERT INTO `xk_config` VALUES ('35', 'REPLY_LIST_ROWS', '0', '回复列表每页条数', '2', '', '', '1386645376', '1387178083', '1', '10', '0');
INSERT INTO `xk_config` VALUES ('36', 'ADMIN_ALLOW_IP', '2', '后台允许访问IP', '4', '', '多个用逗号分隔，如果不配置表示不限制IP访问', '1387165454', '1387165553', '1', '', '12');
INSERT INTO `xk_config` VALUES ('37', 'SHOW_PAGE_TRACE', '4', '是否显示页面Trace', '4', '0:关闭\r\n1:开启', '是否显示页面Trace信息', '1387165685', '1387165685', '1', '0', '1');
INSERT INTO `xk_config` VALUES ('38', 'XK_SUB_ROOT_CAT', '0', '子站目录', '4', '', '输入子站分类的id ', '1418721456', '1419436544', '1', '40', '0');
INSERT INTO `xk_config` VALUES ('39', 'XK_HOST_UNIT', '1', '主办单位', '1', '', '主办单位', '1418807730', '1419872586', '1', '新康医疗', '0');
INSERT INTO `xk_config` VALUES ('40', 'XK_SERVICE_TEL', '1', '服务热线', '1', '', '服务热线', '1418808214', '1419872594', '1', '1234576', '0');
INSERT INTO `xk_config` VALUES ('41', 'XK_SUB_BANNER_CAT', '0', '栏目', '4', '', '栏目', '1419340233', '1419436568', '1', '39', '0');
INSERT INTO `xk_config` VALUES ('42', 'XK_INTRO_CAT', '0', '介绍栏目', '4', '', '介绍栏目', '1419340410', '1419436578', '1', '110', '0');
INSERT INTO `xk_config` VALUES ('43', 'XK_EMAIL', '1', '邮箱', '1', '', '邮箱', '1419436657', '1419872602', '1', 'xk@xk.net', '0');
INSERT INTO `xk_config` VALUES ('44', 'XK_FAX', '1', '传真', '1', '', '传真', '1419436678', '1419872610', '1', '123456', '0');
INSERT INTO `xk_config` VALUES ('45', 'XK_LINK_ADDRESS', '1', '联系地址', '1', '', '联系地址', '1419436707', '1419872617', '1', '昆明新康医疗', '0');
INSERT INTO `xk_config` VALUES ('46', 'XK_LINK_TEL', '1', '联系电话', '1', '', '联系电话', '1419436731', '1419872624', '1', '1111111', '0');
INSERT INTO `xk_config` VALUES ('47', 'XK_POSTCODE', '1', '邮编', '1', '', '邮编', '1419436895', '1419872630', '1', '650000', '0');
INSERT INTO `xk_config` VALUES ('48', 'XK_BLOCK_1_1', '0', '置顶分类', '0', '', '置顶分类', '1419437882', '1419863562', '1', '2', '0');
INSERT INTO `xk_config` VALUES ('49', 'XK_BLOCK_1_2', '1', '焦点文章栏目', '4', '', '焦点文章栏目', '1419783916', '1419863475', '1', '78,79,103', '0');
INSERT INTO `xk_config` VALUES ('50', 'XK_BLOCK_2_1', '1', '基层服务公告目录', '4', '', '基层服务公告目录', '1419800517', '1419864407', '1', '82', '0');
INSERT INTO `xk_config` VALUES ('51', 'XK_BLOCK_3_1', '0', '专题服务栏目', '4', '', '专题服务栏目', '1419801915', '1419864929', '1', '118', '0');
INSERT INTO `xk_config` VALUES ('52', 'XK_BLOCK_2_2', '1', '中间图1栏目', '0', '', '中间图1栏目', '1419803183', '1419864569', '1', '91,92,80', '0');
INSERT INTO `xk_config` VALUES ('53', 'XK_BLOCK_2_3', '0', '社区卫生交流合作栏目', '0', '', '社区卫生交流合作栏目', '1419809801', '1419864982', '1', '117', '0');
INSERT INTO `xk_config` VALUES ('55', 'XK_BLOCK_4_1', '0', '社区卫生大家谈专栏', '0', '', '社区卫生大家谈专栏', '1419865133', '1419865133', '1', '69', '0');
INSERT INTO `xk_config` VALUES ('56', 'XK_BLOCK_4_2', '0', '专家风采专栏', '4', '', '专家风采专栏', '1419865263', '1419865323', '1', '122', '0');
INSERT INTO `xk_config` VALUES ('57', 'XK_BLOCK_4_3', '2', '快捷服务', '4', '', '快捷服务', '1419867305', '1419871127', '1', '机构大全,271,www.baidu.com;\r\n电子地图,257,map.baidu.com;\r\n家医服务,59,www.baidu.com;\r\n便民查询,337,www.baidu.com;\r\n药品采购,59,www.baidu.com;\r\n继续教育,341,www.baidu.com;\r\n疾控上报,285,www.baidu.com;\r\n信息报送,288,www.baidu.com;\r\n', '0');
INSERT INTO `xk_config` VALUES ('58', 'XK_BLOCK_5_1', '0', '服务指南', '0', '', '服务指南', '1419871563', '1419871563', '1', '56', '0');
INSERT INTO `xk_config` VALUES ('59', 'XK_BLOCK_5_2', '1', '老年人保健;疾病预防;中医中药', '0', '', '老年人保健;疾病预防;中医中药', '1419871824', '1419871824', '1', '96,94,97', '0');
INSERT INTO `xk_config` VALUES ('60', 'XK_BLOCK_5_3', '0', '健康大讲堂', '4', '', '健康大讲堂', '1419872677', '1419872677', '1', '98', '0');
INSERT INTO `xk_config` VALUES ('61', 'XK_BLOCK_6_1', '0', '图片新闻', '0', '', '图片新闻', '1419876347', '1419876347', '1', '84,108,123', '0');
INSERT INTO `xk_config` VALUES ('62', 'XK_BLOCK_7_1', '2', '友情链接', '4', '', '友情链接', '1419878999', '1419878999', '1', '国家卫生和计划生育委员会,nhfpc.jpg,www.nhfpc.gov.cn;\r\n国家卫生和计划生育委员会,nhfpc.jpg,www.nhfpc.gov.cn;\r\n国家卫生和计划生育委员会,nhfpc.jpg,www.nhfpc.gov.cn;\r\n国家卫生和计划生育委员会,nhfpc.jpg,www.nhfpc.gov.cn;\r\n国家卫生和计划生育委员会,nhfpc.jpg,www.nhfpc.gov.cn;\r\n国家卫生和计划生育委员会,nhfpc.jpg,www.nhfpc.gov.cn;\r\n国家卫生和计划生育委员会,nhfpc.jpg,www.nhfpc.gov.cn;\r\n国家卫生和计划生育委员会,nhfpc.jpg,www.nhfpc.gov.cn;\r\n国家卫生和计划生育委员会,nhfpc.jpg,www.nhfpc.gov.cn;', '0');

-- ----------------------------
-- Table structure for xk_document
-- ----------------------------
DROP TABLE IF EXISTS `xk_document`;
CREATE TABLE `xk_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `group_id` smallint(3) unsigned NOT NULL COMMENT '所属分组',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';

-- ----------------------------
-- Records of xk_document
-- ----------------------------
INSERT INTO `xk_document` VALUES ('1', '1', '', 'OneThink1.1开发版发布', '2', '0', '期待已久的OneThink最新版发布', '0', '0', '2', '2', '0', '0', '1', '1', '0', '0', '9', '0', '0', '0', '1406001360', '1418697252', '-1');
INSERT INTO `xk_document` VALUES ('2', '2', '', '1', '40', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1418702853', '1418702853', '1');
INSERT INTO `xk_document` VALUES ('4', '1', '', '中心介绍', '110', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1419339968', '1419339968', '1');
INSERT INTO `xk_document` VALUES ('5', '1', '', '社区卫生服务中心', '110', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '1', '1419339988', '1419339988', '1');
INSERT INTO `xk_document` VALUES ('6', '1', '', '社区卫生服务站', '110', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '2', '0', '0', '3', '1419340009', '1419340009', '1');
INSERT INTO `xk_document` VALUES ('7', '1', '', '服务指南', '110', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1419340023', '1419340023', '1');
INSERT INTO `xk_document` VALUES ('8', '1', '', '置顶1', '2', '0', '', '0', '0', '2', '2', '0', '0', '4', '1', '0', '0', '0', '0', '0', '0', '1419437559', '1419437559', '1');
INSERT INTO `xk_document` VALUES ('9', '1', '', '置顶2', '2', '0', '', '0', '0', '2', '2', '0', '0', '5', '1', '0', '0', '0', '0', '0', '0', '1419437610', '1419437610', '1');
INSERT INTO `xk_document` VALUES ('10', '1', '', '置顶3', '2', '0', '', '0', '0', '2', '2', '0', '0', '6', '1', '0', '0', '1', '0', '0', '0', '1419437623', '1419437623', '1');
INSERT INTO `xk_document` VALUES ('11', '1', '', '置顶4', '2', '0', '', '0', '0', '2', '2', '0', '0', '7', '1', '0', '0', '6', '0', '0', '0', '1419437636', '1419437636', '1');
INSERT INTO `xk_document` VALUES ('12', '1', '', '置顶5', '2', '0', '', '0', '0', '2', '2', '0', '0', '6', '1', '0', '0', '5', '0', '0', '0', '1419437640', '1419810614', '1');
INSERT INTO `xk_document` VALUES ('13', '1', '', '社管快讯：1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1', '78', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1419786548', '1419786548', '1');
INSERT INTO `xk_document` VALUES ('14', '1', '', '社管快讯：2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2', '78', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '3', '0', '0', '0', '1419786557', '1419786557', '1');
INSERT INTO `xk_document` VALUES ('15', '1', '', '社管快讯：3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3', '78', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419786566', '1419786566', '1');
INSERT INTO `xk_document` VALUES ('16', '1', '', '社管快讯：4社管快讯4社管快讯4社管快讯4社管快讯4社管快讯4', '78', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '4', '0', '0', '0', '1419786583', '1419786583', '1');
INSERT INTO `xk_document` VALUES ('17', '1', '', '社管快讯：5社管快讯5社管快讯5社管快讯5社管快讯5社管快讯5社管快讯5社管快讯5', '78', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '80', '0', '0', '0', '1419786593', '1419786593', '1');
INSERT INTO `xk_document` VALUES ('18', '1', '', '社管快讯：6社管快讯6社管快讯6社管快讯6社管快讯6社管快讯6社管快讯6社管快讯6社管快讯6社管快讯6社管快讯6社管快讯6社管快讯6社管快讯6', '78', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '77', '0', '0', '0', '1419786602', '1419786602', '1');
INSERT INTO `xk_document` VALUES ('19', '1', '', '基层动态1基层动态1基层动态1基层动态1基层动态1基层动态1基层动态1基层动态1', '79', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '4', '0', '0', '0', '1419788849', '1419788849', '1');
INSERT INTO `xk_document` VALUES ('20', '1', '', '基层动态2基层动态2基层动态2基层动态2基层动态2基层动态2基层动态2', '79', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '2', '0', '0', '0', '1419788860', '1419788860', '1');
INSERT INTO `xk_document` VALUES ('21', '1', '', '基层动态3333基层动态3333基层动态3333基层动态3333基层动态3333', '79', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1419788869', '1419788869', '1');
INSERT INTO `xk_document` VALUES ('22', '1', '', '基层动态4基层动态4基层动态4基层动态4基层动态4基层动态4基层动态4基层动态4基层动态4基层动态4基层动态4基层动态4', '79', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '2', '0', '0', '0', '1419788880', '1419788880', '1');
INSERT INTO `xk_document` VALUES ('23', '1', '', '基层动态5基层动态5基层动态5基层动态5基层动态5基层动态5基层动态5基层动态5基层动态5基层动态5基层动态5基层动态5基层动态5基层动态5基层动态5', '79', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1419788891', '1419788891', '1');
INSERT INTO `xk_document` VALUES ('24', '1', '', '基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6', '79', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '2', '0', '0', '0', '1419788901', '1419788901', '1');
INSERT INTO `xk_document` VALUES ('25', '1', '', '工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1', '103', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419788931', '1419788931', '1');
INSERT INTO `xk_document` VALUES ('26', '1', '', '工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2', '103', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419788941', '1419788941', '1');
INSERT INTO `xk_document` VALUES ('27', '1', '', '工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3', '103', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419788949', '1419788949', '1');
INSERT INTO `xk_document` VALUES ('28', '1', '', '工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4', '103', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419788959', '1419788959', '1');
INSERT INTO `xk_document` VALUES ('29', '1', '', '工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5', '103', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419788969', '1419788969', '1');
INSERT INTO `xk_document` VALUES ('30', '1', '', '工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6', '103', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1419788979', '1419788979', '1');
INSERT INTO `xk_document` VALUES ('31', '1', '', '基层服务1', '82', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419800571', '1419800571', '1');
INSERT INTO `xk_document` VALUES ('32', '1', '', '基层服务2', '82', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419800579', '1419800579', '1');
INSERT INTO `xk_document` VALUES ('33', '1', '', '基层服务333333333333', '82', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419800588', '1419800588', '1');
INSERT INTO `xk_document` VALUES ('34', '1', '', '基层服务44444444', '82', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419800594', '1419800594', '1');
INSERT INTO `xk_document` VALUES ('35', '1', '', '基层服务555555555555', '82', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419800605', '1419800605', '1');
INSERT INTO `xk_document` VALUES ('36', '1', '', '基层服务666666666666666', '82', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1419800616', '1419800616', '1');
INSERT INTO `xk_document` VALUES ('37', '1', '', '基层服务777777777777777777', '82', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '2', '0', '0', '0', '1419800637', '1419800637', '1');
INSERT INTO `xk_document` VALUES ('38', '1', '', '基层服务88888888888888888', '82', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '9', '0', '0', '0', '1419800640', '1419808822', '1');
INSERT INTO `xk_document` VALUES ('39', '1', '', '媒体报道1', '80', '0', '', '0', '0', '2', '2', '0', '0', '11', '1', '0', '0', '0', '0', '0', '0', '1419806280', '1419806773', '1');
INSERT INTO `xk_document` VALUES ('40', '1', '', '媒体报道2', '80', '0', '', '0', '0', '2', '2', '0', '0', '11', '1', '0', '0', '0', '0', '0', '0', '1419806280', '1419806762', '1');
INSERT INTO `xk_document` VALUES ('41', '1', '', '媒体报道333333333333333', '80', '0', '', '0', '0', '2', '2', '0', '0', '11', '1', '0', '0', '3', '0', '0', '0', '1419806340', '1419808282', '1');
INSERT INTO `xk_document` VALUES ('42', '1', '', '媒体报道4444444444444', '80', '0', '', '0', '0', '2', '2', '0', '0', '11', '1', '0', '0', '0', '0', '0', '0', '1419806340', '1419806745', '1');
INSERT INTO `xk_document` VALUES ('43', '1', '', '媒体报道55555555555555555', '80', '0', '', '0', '0', '2', '2', '0', '0', '11', '1', '0', '0', '0', '0', '0', '0', '1419806340', '1419806730', '1');
INSERT INTO `xk_document` VALUES ('44', '1', '', '媒体报道66666666', '80', '0', '', '0', '0', '2', '2', '0', '0', '11', '1', '0', '0', '1', '0', '0', '0', '1419806340', '1419806585', '1');
INSERT INTO `xk_document` VALUES ('45', '1', '', '社区卫生1', '69', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419809705', '1419809705', '1');
INSERT INTO `xk_document` VALUES ('46', '1', '', '社区卫生2', '69', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419809714', '1419809714', '1');
INSERT INTO `xk_document` VALUES ('47', '1', '', '社区卫生3', '69', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419809722', '1419809722', '1');
INSERT INTO `xk_document` VALUES ('48', '1', '', '社区卫生4', '69', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419809729', '1419809729', '1');
INSERT INTO `xk_document` VALUES ('49', '1', '', '社区卫生5', '69', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1419809737', '1419809737', '1');
INSERT INTO `xk_document` VALUES ('50', '1', '', '社区卫生6', '69', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419809744', '1419809744', '1');
INSERT INTO `xk_document` VALUES ('51', '1', '', '社区卫生7', '69', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419809933', '1419809933', '1');
INSERT INTO `xk_document` VALUES ('52', '1', '', '社区卫生8', '69', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419809943', '1419809943', '1');
INSERT INTO `xk_document` VALUES ('53', '1', '', '专家风采111111111111', '122', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419865368', '1419865368', '1');
INSERT INTO `xk_document` VALUES ('54', '1', '', '专家风采222222222222222', '122', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419865376', '1419865376', '1');
INSERT INTO `xk_document` VALUES ('55', '1', '', '专家风采333333333333', '122', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419865384', '1419865384', '1');
INSERT INTO `xk_document` VALUES ('56', '1', '', '专家风采44444444444', '122', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419865392', '1419865392', '1');
INSERT INTO `xk_document` VALUES ('57', '1', '', '专家风采555', '122', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419865401', '1419865401', '1');
INSERT INTO `xk_document` VALUES ('58', '1', '', '专家风采6666', '122', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '3', '0', '0', '0', '1419865409', '1419865409', '1');
INSERT INTO `xk_document` VALUES ('59', '1', '', '服务指南1', '56', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419871596', '1419871596', '1');
INSERT INTO `xk_document` VALUES ('60', '1', '', '服务指南222222', '56', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419871603', '1419871603', '1');
INSERT INTO `xk_document` VALUES ('61', '1', '', '服务指南333333333', '56', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419871611', '1419871611', '1');
INSERT INTO `xk_document` VALUES ('62', '1', '', '服务指南444444444444', '56', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419871618', '1419871618', '1');
INSERT INTO `xk_document` VALUES ('63', '1', '', '服务指南555555555', '56', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1419871629', '1419871629', '1');
INSERT INTO `xk_document` VALUES ('64', '1', '', '服务指南666666666666', '56', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1419871635', '1419871635', '1');
INSERT INTO `xk_document` VALUES ('65', '1', '', '服务指南777777777777777', '56', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1419871644', '1419871644', '1');
INSERT INTO `xk_document` VALUES ('66', '1', '', '服务指南88888888', '56', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '2', '0', '0', '0', '1419871657', '1419871657', '1');
INSERT INTO `xk_document` VALUES ('67', '1', '', '疾病预防11111', '94', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1419871858', '1419871858', '1');
INSERT INTO `xk_document` VALUES ('68', '1', '', '疾病预防2222', '94', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1419871867', '1419871867', '1');
INSERT INTO `xk_document` VALUES ('69', '1', '', '疾病预防33333', '94', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1419871875', '1419871875', '1');
INSERT INTO `xk_document` VALUES ('70', '1', '', '疾病预防4444444', '94', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1419871883', '1419871883', '1');
INSERT INTO `xk_document` VALUES ('71', '1', '', '疾病预防55555555555', '94', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1419871893', '1419871893', '1');
INSERT INTO `xk_document` VALUES ('72', '1', '', '疾病预防6666666', '94', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1419871902', '1419871902', '1');
INSERT INTO `xk_document` VALUES ('73', '1', '', '老年保健11111111111111', '96', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419871920', '1419871920', '1');
INSERT INTO `xk_document` VALUES ('74', '1', '', '老年保健22222222222222', '96', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419871928', '1419871928', '1');
INSERT INTO `xk_document` VALUES ('75', '1', '', '老年保健33333333333333', '96', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419871935', '1419871935', '1');
INSERT INTO `xk_document` VALUES ('76', '1', '', '老年保健4444444444444', '96', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419871942', '1419871942', '1');
INSERT INTO `xk_document` VALUES ('77', '1', '', '老年保健5555555555555', '96', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419871949', '1419871949', '1');
INSERT INTO `xk_document` VALUES ('78', '1', '', '老年保健666666666666666666666666', '96', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '2', '0', '0', '0', '1419871956', '1419871956', '1');
INSERT INTO `xk_document` VALUES ('79', '1', '', '中医中药11111111111111', '97', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419872084', '1419872084', '1');
INSERT INTO `xk_document` VALUES ('80', '1', '', '中医中药2222222222', '97', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419872090', '1419872090', '1');
INSERT INTO `xk_document` VALUES ('81', '1', '', '中医中药3333333333', '97', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419872100', '1419872100', '1');
INSERT INTO `xk_document` VALUES ('82', '1', '', '中医中药44444444444444', '97', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419872107', '1419872107', '1');
INSERT INTO `xk_document` VALUES ('83', '1', '', '中医中药555555555555555', '97', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419872116', '1419872116', '1');
INSERT INTO `xk_document` VALUES ('84', '1', '', '中医中药56666666666666666', '97', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419872124', '1419872124', '1');
INSERT INTO `xk_document` VALUES ('85', '1', '', '健康大讲堂', '98', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419873126', '1419873126', '-1');
INSERT INTO `xk_document` VALUES ('87', '1', '', '健康大讲堂', '98', '0', '', '0', '0', '3', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419873963', '1419873963', '1');
INSERT INTO `xk_document` VALUES ('88', '1', '', '我身边11111111111111', '84', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419876941', '1419876941', '1');
INSERT INTO `xk_document` VALUES ('89', '1', '', '我身边222222222222222', '84', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419876947', '1419876947', '1');
INSERT INTO `xk_document` VALUES ('90', '1', '', '我身边3333333333', '84', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419876953', '1419876953', '1');
INSERT INTO `xk_document` VALUES ('91', '1', '', '我身边45444444444444444444444444', '84', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419876960', '1419876960', '1');
INSERT INTO `xk_document` VALUES ('92', '1', '', '我身边5555555555', '84', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419876967', '1419876967', '1');
INSERT INTO `xk_document` VALUES ('93', '1', '', '我身边66666666666666666', '84', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419876974', '1419876974', '1');
INSERT INTO `xk_document` VALUES ('94', '1', '', '我身边77777777777', '84', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419876980', '1419876980', '1');
INSERT INTO `xk_document` VALUES ('95', '1', '', '岗位练兵11111111111111', '123', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419877353', '1419877353', '1');
INSERT INTO `xk_document` VALUES ('96', '1', '', '岗位练兵22222222222222', '123', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419877359', '1419877359', '1');
INSERT INTO `xk_document` VALUES ('97', '1', '', '我身边的社区卫生我身边的社区卫生我身边的社区卫生', '84', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419878439', '1419878439', '1');
INSERT INTO `xk_document` VALUES ('98', '1', '', '我身边的社区卫生我身边的社区卫生我身边的社区卫生我身边的社区卫生我身边的社区卫生我身边的社区卫生我身边的社区卫生', '84', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419878446', '1419878446', '1');
INSERT INTO `xk_document` VALUES ('99', '1', '', '社管', '78', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419889528', '1419889528', '1');
INSERT INTO `xk_document` VALUES ('100', '1', '', '社管', '78', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419889532', '1419889532', '1');
INSERT INTO `xk_document` VALUES ('101', '1', '', '社管', '78', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419889537', '1419889537', '1');
INSERT INTO `xk_document` VALUES ('102', '1', '', '社管', '78', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419889542', '1419889542', '1');
INSERT INTO `xk_document` VALUES ('103', '1', '', '社管', '78', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419889547', '1419889547', '1');
INSERT INTO `xk_document` VALUES ('104', '1', '', '社管', '78', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419889552', '1419889552', '1');
INSERT INTO `xk_document` VALUES ('105', '1', '', '社管', '78', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1419889556', '1419889556', '1');
INSERT INTO `xk_document` VALUES ('106', '1', '', '社管', '78', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419889561', '1419889561', '1');

-- ----------------------------
-- Table structure for xk_document_article
-- ----------------------------
DROP TABLE IF EXISTS `xk_document_article`;
CREATE TABLE `xk_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

-- ----------------------------
-- Records of xk_document_article
-- ----------------------------
INSERT INTO `xk_document_article` VALUES ('1', '0', '<h1>\r\n	OneThink1.1开发版发布&nbsp;\r\n</h1>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong> \r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href=\"http://www.onethink.cn/download.html\" target=\"_blank\">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href=\"http://document.onethink.cn/\" target=\"_blank\">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013~2014</strong> \r\n</p>', '', '0');
INSERT INTO `xk_document_article` VALUES ('2', '0', '1', '', '0');
INSERT INTO `xk_document_article` VALUES ('4', '0', '中心介绍', '', '0');
INSERT INTO `xk_document_article` VALUES ('5', '0', '社区卫生服务中心', '', '0');
INSERT INTO `xk_document_article` VALUES ('6', '0', '社区卫生服务站', '', '0');
INSERT INTO `xk_document_article` VALUES ('7', '0', '服务指南', '', '0');
INSERT INTO `xk_document_article` VALUES ('8', '0', '置顶1', '', '0');
INSERT INTO `xk_document_article` VALUES ('9', '0', '2', '', '0');
INSERT INTO `xk_document_article` VALUES ('10', '0', '3', '', '0');
INSERT INTO `xk_document_article` VALUES ('11', '0', '4', '', '0');
INSERT INTO `xk_document_article` VALUES ('12', '0', '5', '', '0');
INSERT INTO `xk_document_article` VALUES ('13', '0', '社管快讯：1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1社管快讯1', '', '0');
INSERT INTO `xk_document_article` VALUES ('14', '0', '社管快讯：2社管快社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2社管快讯2', '', '0');
INSERT INTO `xk_document_article` VALUES ('15', '0', '社管快讯：3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3社管快讯3', '', '0');
INSERT INTO `xk_document_article` VALUES ('16', '0', '社管快讯：4社管快讯4社管快讯4社管快讯4社管快讯4社管快讯4社管快讯4社管快讯4社管快讯4社管快讯4社管快讯4社管快讯4社管快讯4社管快讯4社管快讯4社管快讯4社管快讯4社管快讯4社管快讯4社管快讯4社管快讯4社管快讯4社管快讯4社管快讯4社管快讯4社管快讯4社管快讯4社管快讯4社管快讯4社管快讯4社管快讯4社管快讯4社管快讯4社管快讯4社管快讯4社管快讯4社管快讯4', '', '0');
INSERT INTO `xk_document_article` VALUES ('17', '0', '社管快讯：5社管快讯5社管快讯5社管快讯5社管快讯5社管快讯5社管快讯5社管快讯5社管快讯5社管快讯5社管快讯5社管快讯5社管快讯5社管快讯5社管快讯5社管快讯5社管快讯5社管快讯5社管快讯5社管快讯5社管快讯5社管快讯5', '', '0');
INSERT INTO `xk_document_article` VALUES ('18', '0', '社管快讯：6社管快讯6社管快讯6社管快讯6社管快讯6社管快讯6社管快讯6社管快讯6社管快讯6社管快讯6社管快讯6社管快讯6社管快讯6社管快讯6社管快讯6社管快讯6社管快讯6社管快讯6', '', '0');
INSERT INTO `xk_document_article` VALUES ('19', '0', '基层动态1基层动态1基层动态1基层动态1基层动态1基层动态1基层动态1基层动态1基层动态1基层动态1基层动态1基层动态1基层动态1', '', '0');
INSERT INTO `xk_document_article` VALUES ('20', '0', '基层动态2基层动态2基层动态2基层动态2基层动态2基层动态2基层动态2基层动态2基层动态2基层动态2基层动态2基层动态2基层动态2基层动态2基层动态2基层动态2基层动态2基层动态2基层动态2', '', '0');
INSERT INTO `xk_document_article` VALUES ('21', '0', '基层动态3333基层动态3333基层动态3333基层动态3333基层动态3333基层动态3333基层动态3333基层动态3333基层动态3333基层动态3333基层动态3333基层动态3333基层动态3333', '', '0');
INSERT INTO `xk_document_article` VALUES ('22', '0', '基层动态4基层动态4基层动态4基层动态4基层动态4基层动态4基层动态4基层动态4基层动态4基层动态4基层动态4基层动态4基层动态4基层动态4基层动态4基层动态4基层动态4基层动态4基层动态4基层动态4基层动态4基层动态4基层动态4基层动态4基层动态4', '', '0');
INSERT INTO `xk_document_article` VALUES ('23', '0', '基层动态5基层动态5基层动态5基层动态5基层动态5基层动态5基层动态5基层动态5基层动态5基层动态5基层动态5基层动态5基层动态5基层动态5基层动态5基层动态5基层动态5基层动态5基层动态5基层动态5基层动态5基层动态5基层动态5基层动态5基层动态5基层动态5', '', '0');
INSERT INTO `xk_document_article` VALUES ('24', '0', '基层动态6基层动态基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6基层动态6', '', '0');
INSERT INTO `xk_document_article` VALUES ('25', '0', '工作专栏1工作专栏1工作专栏工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1工作专栏1', '', '0');
INSERT INTO `xk_document_article` VALUES ('26', '0', '工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2工作专栏2', '', '0');
INSERT INTO `xk_document_article` VALUES ('27', '0', '工作专栏3工作专栏3工工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3工作专栏3', '', '0');
INSERT INTO `xk_document_article` VALUES ('28', '0', '工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4工作专栏4', '', '0');
INSERT INTO `xk_document_article` VALUES ('29', '0', '工作专栏5工作工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5工作专栏5', '', '0');
INSERT INTO `xk_document_article` VALUES ('30', '0', '工作专栏6工作专栏6工工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6工作专栏6', '', '0');
INSERT INTO `xk_document_article` VALUES ('31', '0', '基层服务1基层服务1基层服务1基层服务1基层服务1基层服务1', '', '0');
INSERT INTO `xk_document_article` VALUES ('32', '0', '基层服务2222222222222222222222', '', '0');
INSERT INTO `xk_document_article` VALUES ('33', '0', '基层服务13333333333333333', '', '0');
INSERT INTO `xk_document_article` VALUES ('34', '0', '444444444444444444444444444', '', '0');
INSERT INTO `xk_document_article` VALUES ('35', '0', '555555555555555555555', '', '0');
INSERT INTO `xk_document_article` VALUES ('36', '0', '6666666666666666666', '', '0');
INSERT INTO `xk_document_article` VALUES ('37', '0', '7777777777777777777777777777', '', '0');
INSERT INTO `xk_document_article` VALUES ('38', '0', '<span>基层服务88888888888888888基层服务88888888888888888基层服务88888888888888888基层服务88888888888888888</span><span>基层服务88888888888888888基层服务88888888888888888基层服务88888888888888888基层服务88888888888888888</span><span>基层服务88888888888888888基层服务88888888888888888基层服务88888888888888888基层服务88888888888888888</span><span>基层服务88888888888888888基层服务88888888888888888基层服务88888888888888888基层服务88888888888888888</span><span>基层服务88888888888888888基层服务88888888888888888基层服务88888888888888888基层服务88888888888888888</span><span>基层服务88888888888888888基层服务88888888888888888基层服务88888888888888888基层服务88888888888888888</span><span>基层服务88888888888888888基层服务88888888888888888基层服务88888888888888888基层服务88888888888888888</span><span>基层服务88888888888888888基层服务88888888888888888基层服务88888888888888888基层服务88888888888888888</span><span>基层服务88888888888888888基层服务88888888888888888基层服务88888888888888888基层服务88888888888888888</span><span>基层服务88888888888888888基层服务88888888888888888基层服务88888888888888888基层服务88888888888888888</span><span>基层服务88888888888888888基层服务88888888888888888基层服务88888888888888888基层服务88888888888888888</span><span>基层服务88888888888888888基层服务88888888888888888基层服务88888888888888888基层服务88888888888888888</span><span>基层服务88888888888888888基层服务88888888888888888基层服务88888888888888888基层服务88888888888888888</span><span>基层服务88888888888888888基层服务88888888888888888基层服务88888888888888888基层服务88888888888888888</span>', '', '0');
INSERT INTO `xk_document_article` VALUES ('39', '0', '媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1', '', '0');
INSERT INTO `xk_document_article` VALUES ('40', '0', '媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1', '', '0');
INSERT INTO `xk_document_article` VALUES ('41', '0', '<span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333<span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333<span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333<span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span>媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道133333333333333</span><span></span>', '', '0');
INSERT INTO `xk_document_article` VALUES ('42', '0', '媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1媒体报道1444444444444', '', '0');
INSERT INTO `xk_document_article` VALUES ('43', '0', '媒体报道55555555555555555媒体报道55555555555555555媒体报道55555555555555555媒体报道55555555555555555媒体报道55555555555555555媒体报道55555555555555555媒体报道55555555555555555媒体报道55555555555555555媒体报道55555555555555555媒体报道55555555555555555媒体报道55555555555555555媒体报道55555555555555555媒体报道55555555555555555', '', '0');
INSERT INTO `xk_document_article` VALUES ('44', '0', '666666666666666666666666666666', '', '0');
INSERT INTO `xk_document_article` VALUES ('45', '0', '社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1', '', '0');
INSERT INTO `xk_document_article` VALUES ('46', '0', '2222222222222222222222222222222', '', '0');
INSERT INTO `xk_document_article` VALUES ('47', '0', '社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1', '', '0');
INSERT INTO `xk_document_article` VALUES ('48', '0', '社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1', '', '0');
INSERT INTO `xk_document_article` VALUES ('49', '0', '社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1', '', '0');
INSERT INTO `xk_document_article` VALUES ('50', '0', '社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1社区卫生1', '', '0');
INSERT INTO `xk_document_article` VALUES ('51', '0', '社区卫生7社区卫生7社区卫生7社区卫生7社区卫生7社区卫生7社区卫生7社区卫生7社区卫生7社区卫生7社区卫生7社区卫生7社区卫生7社区卫生7', '', '0');
INSERT INTO `xk_document_article` VALUES ('52', '0', '社区卫生8社区卫生8社区卫生8社区卫生8社区卫生8社区卫生8社区卫生8社区卫生8社区卫生8社区卫生8社区卫生8社区卫生8', '', '0');
INSERT INTO `xk_document_article` VALUES ('53', '0', '1专家风采111111111111111', '', '0');
INSERT INTO `xk_document_article` VALUES ('54', '0', '专家风采2222222222222222222', '', '0');
INSERT INTO `xk_document_article` VALUES ('55', '0', '专家风采333333333333333', '', '0');
INSERT INTO `xk_document_article` VALUES ('56', '0', '专家风采44444444444444', '', '0');
INSERT INTO `xk_document_article` VALUES ('57', '0', '专家风采5555', '', '0');
INSERT INTO `xk_document_article` VALUES ('58', '0', '专家风采6666', '', '0');
INSERT INTO `xk_document_article` VALUES ('59', '0', '11111111111', '', '0');
INSERT INTO `xk_document_article` VALUES ('60', '0', '2服务指南服务指南服务指南服务指南服务指南服务指南服务指南服务指南服务指南服务指南服务指南服务指南', '', '0');
INSERT INTO `xk_document_article` VALUES ('61', '0', '服务指南333333333333', '', '0');
INSERT INTO `xk_document_article` VALUES ('62', '0', '服务指南服务指南服务指南服务指南服务指南服务指南服务指南服务指南服务指南服务指南服务指南服务指南服务指南服务指南服务指南', '', '0');
INSERT INTO `xk_document_article` VALUES ('63', '0', '服务指南服务指南服务指南服务指南555555555555555555555服务指南服务指南服务指南服务指南', '', '0');
INSERT INTO `xk_document_article` VALUES ('64', '0', '666666666666666666666666666', '', '0');
INSERT INTO `xk_document_article` VALUES ('65', '0', '服务指南7777777777777777', '', '0');
INSERT INTO `xk_document_article` VALUES ('66', '0', '8888888888888888888888888888', '', '0');
INSERT INTO `xk_document_article` VALUES ('67', '0', '疾病预防11111疾病预防11111疾病预防11111疾病预防11111疾病预防11111疾病预防11111疾病预防11111疾病预防11111疾病预防11111疾病预防11111疾病预防11111', '', '0');
INSERT INTO `xk_document_article` VALUES ('68', '0', '疾病预防2222疾病预防2222疾病预防2222疾病预防2222疾病预防2222疾病预防2222疾病预防2222疾病预防2222疾病预防2222疾病预防2222疾病预防2222疾病预防2222疾病预防2222疾病预防2222疾病预防2222', '', '0');
INSERT INTO `xk_document_article` VALUES ('69', '0', '疾病预防33333疾病预防33333疾病预防33333疾病预防33333疾病预防33333疾病预防33333疾病预防33333疾病预防33333疾病预防33333疾病预防33333疾病预防33333疾病预防33333疾病预防33333疾病预防33333疾病预防33333疾病预防33333', '', '0');
INSERT INTO `xk_document_article` VALUES ('70', '0', '疾病预防4444444疾病预防4444444疾病预防4444444疾病预防4444444疾病预防4444444疾病预防4444444疾病预防4444444疾病预防4444444疾病预防4444444疾病预防4444444疾病预防4444444疾病预防4444444疾病预防4444444疾病预防4444444疾病预防4444444疾病预防4444444疾病预防4444444疾病预防4444444疾病预防4444444', '', '0');
INSERT INTO `xk_document_article` VALUES ('71', '0', '疾病预防55555555555疾病预防55555555555疾病预防55555555555疾病预防55555555555疾病预防55555555555疾病预防55555555555疾病预防55555555555疾病预防55555555555疾病预防55555555555疾病预防55555555555疾病预防55555555555疾病预防55555555555疾病预防55555555555疾病预防55555555555疾病预防55555555555', '', '0');
INSERT INTO `xk_document_article` VALUES ('72', '0', '疾病预防6666666疾病预防6666666疾病预防6666666疾病预防6666666疾病预防6666666疾病预防6666666疾病预防6666666疾病预防6666666疾病预防6666666疾病预防6666666疾病预防6666666疾病预防6666666疾病预防6666666疾病预防6666666疾病预防6666666疾病预防6666666疾病预防6666666疾病预防6666666疾病预防6666666疾病预防6666666疾病预防6666666疾病预防6666666疾病预防6666666疾病预防6666666疾病预防6666666疾病预防6666666', '', '0');
INSERT INTO `xk_document_article` VALUES ('73', '0', '<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>', '', '0');
INSERT INTO `xk_document_article` VALUES ('74', '0', '<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>', '', '0');
INSERT INTO `xk_document_article` VALUES ('75', '0', '<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>', '', '0');
INSERT INTO `xk_document_article` VALUES ('76', '0', '<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>', '', '0');
INSERT INTO `xk_document_article` VALUES ('77', '0', '<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>', '', '0');
INSERT INTO `xk_document_article` VALUES ('78', '0', '<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/96.html\">老年保健</a>\r\n</h2>', '', '0');
INSERT INTO `xk_document_article` VALUES ('79', '0', '<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>', '', '0');
INSERT INTO `xk_document_article` VALUES ('80', '0', '<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>', '', '0');
INSERT INTO `xk_document_article` VALUES ('81', '0', '<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>', '', '0');
INSERT INTO `xk_document_article` VALUES ('82', '0', '<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>', '', '0');
INSERT INTO `xk_document_article` VALUES ('83', '0', '<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>', '', '0');
INSERT INTO `xk_document_article` VALUES ('84', '0', '<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/Article/index/cate_id/97.html\">中医中药</a>\r\n</h2>', '', '0');
INSERT INTO `xk_document_article` VALUES ('85', '0', '', '', '0');
INSERT INTO `xk_document_article` VALUES ('88', '0', '111111111111111111111111111111111111111', '', '0');
INSERT INTO `xk_document_article` VALUES ('89', '0', '222222222222222', '', '0');
INSERT INTO `xk_document_article` VALUES ('90', '0', '33333333333333333333', '', '0');
INSERT INTO `xk_document_article` VALUES ('91', '0', '44444444444444444444444444', '', '0');
INSERT INTO `xk_document_article` VALUES ('92', '0', '55555555555555555555555', '', '0');
INSERT INTO `xk_document_article` VALUES ('93', '0', '666666666666666666666666', '', '0');
INSERT INTO `xk_document_article` VALUES ('94', '0', '77777777777777777777', '', '0');
INSERT INTO `xk_document_article` VALUES ('95', '0', '岗位练兵岗位练兵岗位练兵岗位练兵岗位练兵岗位练兵岗位练兵岗位练兵岗位练兵岗位练兵岗位练兵岗位练兵11111', '', '0');
INSERT INTO `xk_document_article` VALUES ('96', '0', '2222222222222222222', '', '0');
INSERT INTO `xk_document_article` VALUES ('97', '0', '<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/84.html\">我身边的社区卫生</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/84.html\">我身边的社区卫生</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/84.html\">我身边的社区卫生</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/84.html\">我身边的社区卫生</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/84.html\">我身边的社区卫生</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/84.html\">我身边的社区卫生</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/84.html\">我身边的社区卫生</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/84.html\">我身边的社区卫生</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/84.html\">我身边的社区卫生</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/84.html\">我身边的社区卫生</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/84.html\">我身边的社区卫生</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/84.html\">我身边的社区卫生</a>\r\n</h2>', '', '0');
INSERT INTO `xk_document_article` VALUES ('98', '0', '<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/84.html\">我身边的社区卫生</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/84.html\">我身边的社区卫生</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/84.html\">我身边的社区卫生</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/84.html\">我身边的社区卫生</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/84.html\">我身边的社区卫生</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/84.html\">我身边的社区卫生</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/84.html\">我身边的社区卫生</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/84.html\">我身边的社区卫生</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/84.html\">我身边的社区卫生</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/84.html\">我身边的社区卫生</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/84.html\">我身边的社区卫生</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/84.html\">我身边的社区卫生</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/84.html\">我身边的社区卫生</a>\r\n</h2>\r\n<h2 style=\"font-size:20px;font-weight:400;color:#445566;font-family:\'microsoft yahei\', Helvetica, Tahoma, Arial, sans-serif;background-color:#F6F6F6;\">\r\n	<a href=\"/onethink/admin.php?s=/article/index/cate_id/84.html\">我身边的社区卫生</a>\r\n</h2>', '', '0');
INSERT INTO `xk_document_article` VALUES ('99', '0', '社管', '', '0');
INSERT INTO `xk_document_article` VALUES ('100', '0', '社管', '', '0');
INSERT INTO `xk_document_article` VALUES ('101', '0', '社管', '', '0');
INSERT INTO `xk_document_article` VALUES ('102', '0', '社管', '', '0');
INSERT INTO `xk_document_article` VALUES ('103', '0', '社管', '', '0');
INSERT INTO `xk_document_article` VALUES ('104', '0', '社管', '', '0');
INSERT INTO `xk_document_article` VALUES ('105', '0', '社管', '', '0');
INSERT INTO `xk_document_article` VALUES ('106', '0', '社管', '', '0');

-- ----------------------------
-- Table structure for xk_document_download
-- ----------------------------
DROP TABLE IF EXISTS `xk_document_download`;
CREATE TABLE `xk_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- ----------------------------
-- Records of xk_document_download
-- ----------------------------
INSERT INTO `xk_document_download` VALUES ('87', '0', '如何预防糖尿病', '', '1', '0', '4858310');

-- ----------------------------
-- Table structure for xk_file
-- ----------------------------
DROP TABLE IF EXISTS `xk_file`;
CREATE TABLE `xk_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '远程地址',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Records of xk_file
-- ----------------------------
INSERT INTO `xk_file` VALUES ('1', '1~1.mp4', '54a18e98f280e.mp4', '2014-12-30/', 'mp4', 'application/octet-stream', '4858310', '7fca378b8ac9a325e443000cb0d29a3f', '5b94960d56f46276dbffb7a761bbb5b6b06332ea', '0', '', '1419873944');

-- ----------------------------
-- Table structure for xk_hooks
-- ----------------------------
DROP TABLE IF EXISTS `xk_hooks`;
CREATE TABLE `xk_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xk_hooks
-- ----------------------------
INSERT INTO `xk_hooks` VALUES ('1', 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '1', '0', '', '1');
INSERT INTO `xk_hooks` VALUES ('2', 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', '1', '0', 'ReturnTop', '1');
INSERT INTO `xk_hooks` VALUES ('3', 'documentEditForm', '添加编辑表单的 扩展内容钩子', '1', '0', 'Attachment', '1');
INSERT INTO `xk_hooks` VALUES ('4', 'documentDetailAfter', '文档末尾显示', '1', '0', 'Attachment,SocialComment', '1');
INSERT INTO `xk_hooks` VALUES ('5', 'documentDetailBefore', '页面内容前显示用钩子', '1', '0', '', '1');
INSERT INTO `xk_hooks` VALUES ('6', 'documentSaveComplete', '保存文档数据后的扩展钩子', '2', '0', 'Attachment', '1');
INSERT INTO `xk_hooks` VALUES ('7', 'documentEditFormContent', '添加编辑表单的内容显示钩子', '1', '0', 'Editor', '1');
INSERT INTO `xk_hooks` VALUES ('8', 'adminArticleEdit', '后台内容编辑页编辑器', '1', '1378982734', 'EditorForAdmin', '1');
INSERT INTO `xk_hooks` VALUES ('13', 'AdminIndex', '首页小格子个性化显示', '1', '1382596073', 'SiteStat,SystemInfo,DevTeam', '1');
INSERT INTO `xk_hooks` VALUES ('14', 'topicComment', '评论提交方式扩展钩子。', '1', '1380163518', 'Editor', '1');
INSERT INTO `xk_hooks` VALUES ('16', 'app_begin', '应用开始', '2', '1384481614', '', '1');
INSERT INTO `xk_hooks` VALUES ('17', 'UploadImages', '上传图片', '1', '1419300976', '', '1');

-- ----------------------------
-- Table structure for xk_member
-- ----------------------------
DROP TABLE IF EXISTS `xk_member`;
CREATE TABLE `xk_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of xk_member
-- ----------------------------
INSERT INTO `xk_member` VALUES ('1', 'admin', '0', '0000-00-00', '', '40', '29', '0', '1418696913', '0', '1419861117', '1');
INSERT INTO `xk_member` VALUES ('2', '永昌', '0', '0000-00-00', '', '10', '18', '0', '0', '0', '1418721129', '1');

-- ----------------------------
-- Table structure for xk_menu
-- ----------------------------
DROP TABLE IF EXISTS `xk_menu`;
CREATE TABLE `xk_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xk_menu
-- ----------------------------
INSERT INTO `xk_menu` VALUES ('1', '首页', '0', '1', 'Index/index', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('2', '内容', '0', '2', 'Article/index', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('3', '文档列表', '2', '0', 'article/index', '1', '', '内容', '0', '1');
INSERT INTO `xk_menu` VALUES ('4', '新增', '3', '0', 'article/add', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('5', '编辑', '3', '0', 'article/edit', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('6', '改变状态', '3', '0', 'article/setStatus', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('7', '保存', '3', '0', 'article/update', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('8', '保存草稿', '3', '0', 'article/autoSave', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('9', '移动', '3', '0', 'article/move', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('10', '复制', '3', '0', 'article/copy', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('11', '粘贴', '3', '0', 'article/paste', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('12', '导入', '3', '0', 'article/batchOperate', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('13', '回收站', '2', '0', 'article/recycle', '1', '', '内容', '0', '1');
INSERT INTO `xk_menu` VALUES ('14', '还原', '13', '0', 'article/permit', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('15', '清空', '13', '0', 'article/clear', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('16', '用户', '0', '3', 'User/index', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('17', '用户信息', '16', '0', 'User/index', '0', '', '用户管理', '0', '1');
INSERT INTO `xk_menu` VALUES ('18', '新增用户', '17', '0', 'User/add', '0', '添加新用户', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('19', '用户行为', '16', '0', 'User/action', '0', '', '行为管理', '0', '1');
INSERT INTO `xk_menu` VALUES ('20', '新增用户行为', '19', '0', 'User/addaction', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('21', '编辑用户行为', '19', '0', 'User/editaction', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('22', '保存用户行为', '19', '0', 'User/saveAction', '0', '\"用户->用户行为\"保存编辑和新增的用户行为', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('23', '变更行为状态', '19', '0', 'User/setStatus', '0', '\"用户->用户行为\"中的启用,禁用和删除权限', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('24', '禁用会员', '19', '0', 'User/changeStatus?method=forbidUser', '0', '\"用户->用户信息\"中的禁用', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('25', '启用会员', '19', '0', 'User/changeStatus?method=resumeUser', '0', '\"用户->用户信息\"中的启用', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('26', '删除会员', '19', '0', 'User/changeStatus?method=deleteUser', '0', '\"用户->用户信息\"中的删除', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('27', '权限管理', '16', '0', 'AuthManager/index', '0', '', '用户管理', '0', '1');
INSERT INTO `xk_menu` VALUES ('28', '删除', '27', '0', 'AuthManager/changeStatus?method=deleteGroup', '0', '删除用户组', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('29', '禁用', '27', '0', 'AuthManager/changeStatus?method=forbidGroup', '0', '禁用用户组', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('30', '恢复', '27', '0', 'AuthManager/changeStatus?method=resumeGroup', '0', '恢复已禁用的用户组', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('31', '新增', '27', '0', 'AuthManager/createGroup', '0', '创建新的用户组', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('32', '编辑', '27', '0', 'AuthManager/editGroup', '0', '编辑用户组名称和描述', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('33', '保存用户组', '27', '0', 'AuthManager/writeGroup', '0', '新增和编辑用户组的\"保存\"按钮', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('34', '授权', '27', '0', 'AuthManager/group', '0', '\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('35', '访问授权', '27', '0', 'AuthManager/access', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('36', '成员授权', '27', '0', 'AuthManager/user', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('37', '解除授权', '27', '0', 'AuthManager/removeFromGroup', '0', '\"成员授权\"列表页内的解除授权操作按钮', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('38', '保存成员授权', '27', '0', 'AuthManager/addToGroup', '0', '\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('39', '分类授权', '27', '0', 'AuthManager/category', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('40', '保存分类授权', '27', '0', 'AuthManager/addToCategory', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('41', '模型授权', '27', '0', 'AuthManager/modelauth', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('42', '保存模型授权', '27', '0', 'AuthManager/addToModel', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('43', '扩展', '0', '7', 'Addons/index', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('44', '插件管理', '43', '1', 'Addons/index', '0', '', '扩展', '0', '1');
INSERT INTO `xk_menu` VALUES ('45', '创建', '44', '0', 'Addons/create', '0', '服务器上创建插件结构向导', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('46', '检测创建', '44', '0', 'Addons/checkForm', '0', '检测插件是否可以创建', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('47', '预览', '44', '0', 'Addons/preview', '0', '预览插件定义类文件', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('48', '快速生成插件', '44', '0', 'Addons/build', '0', '开始生成插件结构', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('49', '设置', '44', '0', 'Addons/config', '0', '设置插件配置', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('50', '禁用', '44', '0', 'Addons/disable', '0', '禁用插件', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('51', '启用', '44', '0', 'Addons/enable', '0', '启用插件', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('52', '安装', '44', '0', 'Addons/install', '0', '安装插件', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('53', '卸载', '44', '0', 'Addons/uninstall', '0', '卸载插件', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('54', '更新配置', '44', '0', 'Addons/saveconfig', '0', '更新插件配置处理', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('55', '插件后台列表', '44', '0', 'Addons/adminList', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('56', 'URL方式访问插件', '44', '0', 'Addons/execute', '0', '控制是否有权限通过url访问插件控制器方法', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('57', '钩子管理', '43', '2', 'Addons/hooks', '0', '', '扩展', '0', '1');
INSERT INTO `xk_menu` VALUES ('58', '模型管理', '68', '3', 'Model/index', '0', '', '系统设置', '0', '1');
INSERT INTO `xk_menu` VALUES ('59', '新增', '58', '0', 'model/add', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('60', '编辑', '58', '0', 'model/edit', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('61', '改变状态', '58', '0', 'model/setStatus', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('62', '保存数据', '58', '0', 'model/update', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('63', '属性管理', '68', '0', 'Attribute/index', '1', '网站属性配置。', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('64', '新增', '63', '0', 'Attribute/add', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('65', '编辑', '63', '0', 'Attribute/edit', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('66', '改变状态', '63', '0', 'Attribute/setStatus', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('67', '保存数据', '63', '0', 'Attribute/update', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('68', '系统', '0', '4', 'Config/group', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('69', '网站设置', '68', '1', 'Config/group', '0', '', '系统设置', '0', '1');
INSERT INTO `xk_menu` VALUES ('70', '配置管理', '68', '4', 'Config/index', '0', '', '系统设置', '0', '1');
INSERT INTO `xk_menu` VALUES ('71', '编辑', '70', '0', 'Config/edit', '0', '新增编辑和保存配置', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('72', '删除', '70', '0', 'Config/del', '0', '删除配置', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('73', '新增', '70', '0', 'Config/add', '0', '新增配置', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('74', '保存', '70', '0', 'Config/save', '0', '保存配置', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('75', '菜单管理', '68', '5', 'Menu/index', '0', '', '系统设置', '0', '1');
INSERT INTO `xk_menu` VALUES ('76', '导航管理', '68', '6', 'Channel/index', '0', '', '系统设置', '0', '1');
INSERT INTO `xk_menu` VALUES ('77', '新增', '76', '0', 'Channel/add', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('78', '编辑', '76', '0', 'Channel/edit', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('79', '删除', '76', '0', 'Channel/del', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('80', '分类管理', '68', '2', 'Category/index', '0', '', '系统设置', '0', '1');
INSERT INTO `xk_menu` VALUES ('81', '编辑', '80', '0', 'Category/edit', '0', '编辑和保存栏目分类', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('82', '新增', '80', '0', 'Category/add', '0', '新增栏目分类', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('83', '删除', '80', '0', 'Category/remove', '0', '删除栏目分类', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('84', '移动', '80', '0', 'Category/operate/type/move', '0', '移动栏目分类', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('85', '合并', '80', '0', 'Category/operate/type/merge', '0', '合并栏目分类', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('86', '备份数据库', '68', '0', 'Database/index?type=export', '0', '', '数据备份', '0', '1');
INSERT INTO `xk_menu` VALUES ('87', '备份', '86', '0', 'Database/export', '0', '备份数据库', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('88', '优化表', '86', '0', 'Database/optimize', '0', '优化数据表', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('89', '修复表', '86', '0', 'Database/repair', '0', '修复数据表', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('90', '还原数据库', '68', '0', 'Database/index?type=import', '0', '', '数据备份', '0', '1');
INSERT INTO `xk_menu` VALUES ('91', '恢复', '90', '0', 'Database/import', '0', '数据库恢复', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('92', '删除', '90', '0', 'Database/del', '0', '删除备份文件', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('93', '其他', '0', '5', 'other', '1', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('96', '新增', '75', '0', 'Menu/add', '0', '', '系统设置', '0', '1');
INSERT INTO `xk_menu` VALUES ('98', '编辑', '75', '0', 'Menu/edit', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('106', '行为日志', '16', '0', 'Action/actionlog', '0', '', '行为管理', '0', '1');
INSERT INTO `xk_menu` VALUES ('108', '修改密码', '16', '0', 'User/updatePassword', '1', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('109', '修改昵称', '16', '0', 'User/updateNickname', '1', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('110', '查看行为日志', '106', '0', 'action/edit', '1', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('112', '新增数据', '58', '0', 'think/add', '1', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('113', '编辑数据', '58', '0', 'think/edit', '1', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('114', '导入', '75', '0', 'Menu/import', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('115', '生成', '58', '0', 'Model/generate', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('116', '新增钩子', '57', '0', 'Addons/addHook', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('117', '编辑钩子', '57', '0', 'Addons/edithook', '0', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('118', '文档排序', '3', '0', 'Article/sort', '1', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('119', '排序', '70', '0', 'Config/sort', '1', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('120', '排序', '75', '0', 'Menu/sort', '1', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('121', '排序', '76', '0', 'Channel/sort', '1', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('122', '数据列表', '58', '0', 'think/lists', '1', '', '', '0', '1');
INSERT INTO `xk_menu` VALUES ('123', '审核列表', '3', '0', 'Article/examine', '1', '', '', '0', '1');

-- ----------------------------
-- Table structure for xk_model
-- ----------------------------
DROP TABLE IF EXISTS `xk_model`;
CREATE TABLE `xk_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text COMMENT '属性列表（表的字段）',
  `attribute_alias` varchar(255) NOT NULL DEFAULT '' COMMENT '属性别名定义',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='文档模型表';

-- ----------------------------
-- Records of xk_model
-- ----------------------------
INSERT INTO `xk_model` VALUES ('1', 'document', '基础文档', '0', '', '1', '{\"1\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\"]}', '1:基础', '', '', '', '', '', 'id:编号\r\ntitle:标题:[EDIT]\r\ntype:类型\r\nupdate_time:最后更新\r\nstatus:状态\r\nview:浏览\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '0', '', '', '1383891233', '1384507827', '1', 'MyISAM');
INSERT INTO `xk_model` VALUES ('2', 'article', '文章', '1', '', '1', '{\"1\":[\"3\",\"24\",\"2\",\"5\"],\"2\":[\"9\",\"13\",\"19\",\"10\",\"12\",\"16\",\"17\",\"26\",\"20\",\"14\",\"11\",\"25\"]}', '1:基础,2:扩展', '', '', '', '', '', '', '0', '', '', '1383891243', '1387260622', '1', 'MyISAM');
INSERT INTO `xk_model` VALUES ('3', 'download', '下载', '1', '', '1', '{\"1\":[\"3\",\"28\",\"30\",\"32\",\"2\",\"5\",\"31\"],\"2\":[\"13\",\"10\",\"27\",\"9\",\"12\",\"16\",\"17\",\"19\",\"11\",\"20\",\"14\",\"29\"]}', '1:基础,2:扩展', '', '', '', '', '', '', '0', '', '', '1383891252', '1387260449', '1', 'MyISAM');

-- ----------------------------
-- Table structure for xk_picture
-- ----------------------------
DROP TABLE IF EXISTS `xk_picture`;
CREATE TABLE `xk_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xk_picture
-- ----------------------------
INSERT INTO `xk_picture` VALUES ('1', '/Uploads/Picture/2014-12-16/548f9a20c3a7b.gif', '', '5a2a2e3f31335f0757876d18d49fea3b', 'a4d8bc286700bada5a3793cdbcb8ffd6a489a38e', '1', '1418697248');
INSERT INTO `xk_picture` VALUES ('2', '/Uploads/Picture/2014-12-23/5498d0a553bde.jpg', '', '85f2032e5332f4641e63cb9ddb59ba55', 'eee819cf76ecfe10dacd6ef6902fd9bb81b34728', '1', '1419301029');
INSERT INTO `xk_picture` VALUES ('3', '/Uploads/Picture/2014-12-23/5498d16a143b0.jpg', '', 'c6eb5edbc86840209f16631eca5b73ca', '5e8a55fe93942052be6beca5909d672bdf514e09', '1', '1419301226');
INSERT INTO `xk_picture` VALUES ('4', '/Uploads/Picture/2014-12-25/549ae5f508b3e.jpg', '', '3965d918c3fe0fdd8437b80d392a5757', '95959c7c8a478aef6ead5eae9b87a37c0fd16ed1', '1', '1419437556');
INSERT INTO `xk_picture` VALUES ('5', '/Uploads/Picture/2014-12-25/549ae629f2e7f.jpg', '', '4a2b7424c9d2a7ede6299d894950ea10', '3892dc745ef1ac929c78e0fc0e40cc94daaaea79', '1', '1419437609');
INSERT INTO `xk_picture` VALUES ('6', '/Uploads/Picture/2014-12-25/549ae636417eb.jpg', '', '2098818e970268edd1475032618fbd64', '2bdd6ef3377ddd0499c6069db07daffdfe857765', '1', '1419437622');
INSERT INTO `xk_picture` VALUES ('7', '/Uploads/Picture/2014-12-25/549ae6422889b.jpg', '', 'ed5b552d18c093d93f5556496d5e3c2e', '4e02362aa8813b4997087bbe9bae9a40eee205f9', '1', '1419437634');
INSERT INTO `xk_picture` VALUES ('8', '/Uploads/Picture/2014-12-29/54a0742da2aa9.jpg', '', '0f5e17e3da62e9ce5bce39fc809417e2', '5912152f63b74b9c8b2bf76bdaa2a044d045bf11', '1', '1419801645');
INSERT INTO `xk_picture` VALUES ('9', '/Uploads/Picture/2014-12-29/54a0746d0bdf2.jpg', '', '3071fb279ee449ef23cefb8f01a10a0d', '99fa705debcad92dfc90b4289b30b2ccfdaef566', '1', '1419801709');
INSERT INTO `xk_picture` VALUES ('10', '/Uploads/Picture/2014-12-29/54a074c359181.jpg', '', '567342b051360fbdeee78df8f540205d', 'f930712f0bd5b1c758911a55cbaccaa26a7fb34e', '1', '1419801795');
INSERT INTO `xk_picture` VALUES ('11', '/Uploads/Picture/2014-12-29/54a087768bb02.jpg', '', '41354f3362aad686a33eadf64164b139', 'df5d9cfe5c5d0fcd8d76afa6ebb49686e3d4cd9e', '1', '1419806582');
INSERT INTO `xk_picture` VALUES ('12', '/Uploads/Picture/2014-12-29/54a15f266a42e.jpg', '', '56655f310f1bd69d176cd5d4d2747507', '5bb9ea97fbbf00671164b395e4206806ac4650da', '1', '1419861798');
INSERT INTO `xk_picture` VALUES ('13', '/Uploads/Picture/2014-12-29/54a15f558184c.jpg', '', '5cdd8daff61bfd3b7bdbf721d95497b0', 'd2f7cc9d7bf2c24e66456908db9daf2dbbdbd350', '1', '1419861845');
INSERT INTO `xk_picture` VALUES ('14', '/Uploads/Picture/2014-12-29/54a15f8d06fe5.jpg', '', '6c02f411953d4bce82c6c395e3a8af99', 'e7df2bf1e847bad4f15e002b3c36701cb61d4c22', '1', '1419861900');

-- ----------------------------
-- Table structure for xk_ucenter_admin
-- ----------------------------
DROP TABLE IF EXISTS `xk_ucenter_admin`;
CREATE TABLE `xk_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of xk_ucenter_admin
-- ----------------------------

-- ----------------------------
-- Table structure for xk_ucenter_app
-- ----------------------------
DROP TABLE IF EXISTS `xk_ucenter_app`;
CREATE TABLE `xk_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL DEFAULT '' COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL DEFAULT '' COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表';

-- ----------------------------
-- Records of xk_ucenter_app
-- ----------------------------

-- ----------------------------
-- Table structure for xk_ucenter_member
-- ----------------------------
DROP TABLE IF EXISTS `xk_ucenter_member`;
CREATE TABLE `xk_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL DEFAULT '' COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of xk_ucenter_member
-- ----------------------------
INSERT INTO `xk_ucenter_member` VALUES ('1', 'admin', 'd0c6f4b0f87326f401e07381239f0881', 'payallmoney@163.com', '', '1418696913', '0', '1419861117', '0', '1418696913', '1');
INSERT INTO `xk_ucenter_member` VALUES ('2', '永昌', '95319c648de8c9bc823143a97214f945', '1@1.com', '', '1418700952', '0', '1418721129', '0', '1418700952', '1');

-- ----------------------------
-- Table structure for xk_ucenter_setting
-- ----------------------------
DROP TABLE IF EXISTS `xk_ucenter_setting`;
CREATE TABLE `xk_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';

-- ----------------------------
-- Records of xk_ucenter_setting
-- ----------------------------

-- ----------------------------
-- Table structure for xk_url
-- ----------------------------
DROP TABLE IF EXISTS `xk_url`;
CREATE TABLE `xk_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表';

-- ----------------------------
-- Records of xk_url
-- ----------------------------

-- ----------------------------
-- Table structure for xk_userdata
-- ----------------------------
DROP TABLE IF EXISTS `xk_userdata`;
CREATE TABLE `xk_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xk_userdata
-- ----------------------------
