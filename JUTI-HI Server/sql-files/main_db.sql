/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 80030
Source Host           : localhost:3306
Source Database       : juti_db

Target Server Type    : MYSQL
Target Server Version : 80030
File Encoding         : 65001

Date: 2025-09-08 21:48:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for aa_common_config
-- ----------------------------
DROP TABLE IF EXISTS `aa_common_config`;
CREATE TABLE `aa_common_config` (
  `char_id` int unsigned NOT NULL,
  `stopmelee` tinyint(1) NOT NULL DEFAULT '0',
  `pickup_item_config` int unsigned NOT NULL DEFAULT '0',
  `aggressive_behavior` tinyint(1) NOT NULL DEFAULT '0',
  `autositregen_conf` tinyint(1) NOT NULL DEFAULT '0',
  `autositregen_maxhp` smallint unsigned NOT NULL DEFAULT '0',
  `autositregen_minhp` smallint unsigned NOT NULL DEFAULT '0',
  `autositregen_maxsp` smallint unsigned NOT NULL DEFAULT '0',
  `autositregen_minsp` smallint unsigned NOT NULL DEFAULT '0',
  `tp_use_teleport` tinyint(1) NOT NULL DEFAULT '0',
  `tp_use_flywing` tinyint(1) NOT NULL DEFAULT '0',
  `tp_min_hp` smallint unsigned NOT NULL DEFAULT '0',
  `tp_delay_nomobmeet` int unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `char_id` (`char_id`)
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of aa_common_config
-- ----------------------------

-- ----------------------------
-- Table structure for aa_items
-- ----------------------------
DROP TABLE IF EXISTS `aa_items`;
CREATE TABLE `aa_items` (
  `char_id` int unsigned NOT NULL,
  `type` smallint unsigned NOT NULL,
  `item_id` int unsigned NOT NULL,
  `min_hp` smallint unsigned NOT NULL DEFAULT '0',
  `min_sp` smallint unsigned NOT NULL DEFAULT '0',
  `delay` int unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `char_id` (`char_id`,`type`,`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of aa_items
-- ----------------------------

-- ----------------------------
-- Table structure for aa_mobs
-- ----------------------------
DROP TABLE IF EXISTS `aa_mobs`;
CREATE TABLE `aa_mobs` (
  `char_id` int unsigned NOT NULL,
  `mob_id` int unsigned NOT NULL,
  UNIQUE KEY `char_id` (`char_id`,`mob_id`)
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of aa_mobs
-- ----------------------------

-- ----------------------------
-- Table structure for aa_skills
-- ----------------------------
DROP TABLE IF EXISTS `aa_skills`;
CREATE TABLE `aa_skills` (
  `char_id` int unsigned NOT NULL,
  `type` smallint unsigned NOT NULL,
  `skill_id` smallint unsigned NOT NULL,
  `skill_lv` smallint unsigned NOT NULL DEFAULT '0',
  `min_hp` smallint unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `char_id` (`char_id`,`type`,`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of aa_skills
-- ----------------------------

-- ----------------------------
-- Table structure for acc_reg_num
-- ----------------------------
DROP TABLE IF EXISTS `acc_reg_num`;
CREATE TABLE `acc_reg_num` (
  `account_id` int unsigned NOT NULL DEFAULT '0',
  `key` varchar(32) NOT NULL DEFAULT '',
  `index` int unsigned NOT NULL DEFAULT '0',
  `value` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_id`,`key`,`index`),
  KEY `account_id` (`account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of acc_reg_num
-- ----------------------------

-- ----------------------------
-- Table structure for acc_reg_str
-- ----------------------------
DROP TABLE IF EXISTS `acc_reg_str`;
CREATE TABLE `acc_reg_str` (
  `account_id` int unsigned NOT NULL DEFAULT '0',
  `key` varchar(32) NOT NULL DEFAULT '',
  `index` int unsigned NOT NULL DEFAULT '0',
  `value` varchar(254) NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_id`,`key`,`index`),
  KEY `account_id` (`account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of acc_reg_str
-- ----------------------------

-- ----------------------------
-- Table structure for achievement
-- ----------------------------
DROP TABLE IF EXISTS `achievement`;
CREATE TABLE `achievement` (
  `char_id` int unsigned NOT NULL DEFAULT '0',
  `id` bigint unsigned NOT NULL,
  `count1` int unsigned NOT NULL DEFAULT '0',
  `count2` int unsigned NOT NULL DEFAULT '0',
  `count3` int unsigned NOT NULL DEFAULT '0',
  `count4` int unsigned NOT NULL DEFAULT '0',
  `count5` int unsigned NOT NULL DEFAULT '0',
  `count6` int unsigned NOT NULL DEFAULT '0',
  `count7` int unsigned NOT NULL DEFAULT '0',
  `count8` int unsigned NOT NULL DEFAULT '0',
  `count9` int unsigned NOT NULL DEFAULT '0',
  `count10` int unsigned NOT NULL DEFAULT '0',
  `completed` datetime DEFAULT NULL,
  `rewarded` datetime DEFAULT NULL,
  PRIMARY KEY (`char_id`,`id`),
  KEY `char_id` (`char_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of achievement
-- ----------------------------

-- ----------------------------
-- Table structure for auction
-- ----------------------------
DROP TABLE IF EXISTS `auction`;
CREATE TABLE `auction` (
  `auction_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `seller_id` int unsigned NOT NULL DEFAULT '0',
  `seller_name` varchar(30) NOT NULL DEFAULT '',
  `buyer_id` int unsigned NOT NULL DEFAULT '0',
  `buyer_name` varchar(30) NOT NULL DEFAULT '',
  `price` int unsigned NOT NULL DEFAULT '0',
  `buynow` int unsigned NOT NULL DEFAULT '0',
  `hours` smallint NOT NULL DEFAULT '0',
  `timestamp` int unsigned NOT NULL DEFAULT '0',
  `nameid` int unsigned NOT NULL DEFAULT '0',
  `item_name` varchar(50) NOT NULL DEFAULT '',
  `type` smallint NOT NULL DEFAULT '0',
  `refine` tinyint unsigned NOT NULL DEFAULT '0',
  `attribute` tinyint unsigned NOT NULL DEFAULT '0',
  `card0` int unsigned NOT NULL DEFAULT '0',
  `card1` int unsigned NOT NULL DEFAULT '0',
  `card2` int unsigned NOT NULL DEFAULT '0',
  `card3` int unsigned NOT NULL DEFAULT '0',
  `option_id0` smallint NOT NULL DEFAULT '0',
  `option_val0` smallint NOT NULL DEFAULT '0',
  `option_parm0` tinyint NOT NULL DEFAULT '0',
  `option_id1` smallint NOT NULL DEFAULT '0',
  `option_val1` smallint NOT NULL DEFAULT '0',
  `option_parm1` tinyint NOT NULL DEFAULT '0',
  `option_id2` smallint NOT NULL DEFAULT '0',
  `option_val2` smallint NOT NULL DEFAULT '0',
  `option_parm2` tinyint NOT NULL DEFAULT '0',
  `option_id3` smallint NOT NULL DEFAULT '0',
  `option_val3` smallint NOT NULL DEFAULT '0',
  `option_parm3` tinyint NOT NULL DEFAULT '0',
  `option_id4` smallint NOT NULL DEFAULT '0',
  `option_val4` smallint NOT NULL DEFAULT '0',
  `option_parm4` tinyint NOT NULL DEFAULT '0',
  `unique_id` bigint unsigned NOT NULL DEFAULT '0',
  `enchantgrade` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`auction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of auction
-- ----------------------------

-- ----------------------------
-- Table structure for bac_results
-- ----------------------------
DROP TABLE IF EXISTS `bac_results`;
CREATE TABLE `bac_results` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bet_round` int NOT NULL,
  `results` int NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of bac_results
-- ----------------------------

-- ----------------------------
-- Table structure for barter
-- ----------------------------
DROP TABLE IF EXISTS `barter`;
CREATE TABLE `barter` (
  `name` varchar(50) NOT NULL DEFAULT '',
  `index` smallint unsigned NOT NULL,
  `amount` smallint unsigned NOT NULL,
  PRIMARY KEY (`name`,`index`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of barter
-- ----------------------------

-- ----------------------------
-- Table structure for battle_pass_config
-- ----------------------------
DROP TABLE IF EXISTS `battle_pass_config`;
CREATE TABLE `battle_pass_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `chave` varchar(10) COLLATE tis620_bin NOT NULL,
  `logdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `char_name` varchar(30) COLLATE tis620_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=tis620 COLLATE=tis620_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of battle_pass_config
-- ----------------------------

-- ----------------------------
-- Table structure for battle_pass_reward
-- ----------------------------
DROP TABLE IF EXISTS `battle_pass_reward`;
CREATE TABLE `battle_pass_reward` (
  `chave` varchar(10) COLLATE tis620_bin NOT NULL,
  `item1` int DEFAULT NULL,
  `item2` int DEFAULT NULL,
  `item3` int DEFAULT NULL,
  `item4` int DEFAULT NULL,
  `item5` int DEFAULT NULL,
  `item6` int DEFAULT NULL,
  `item7` int DEFAULT NULL,
  `item8` int DEFAULT NULL,
  `item9` int DEFAULT NULL,
  `item10` int DEFAULT NULL,
  `item11` int DEFAULT NULL,
  `item12` int DEFAULT NULL,
  `item13` int DEFAULT NULL,
  `item14` int DEFAULT NULL,
  `item15` int DEFAULT NULL,
  `item16` int DEFAULT NULL,
  `item17` int DEFAULT NULL,
  `item18` int DEFAULT NULL,
  `item19` int DEFAULT NULL,
  `item20` int DEFAULT NULL,
  `item21` int DEFAULT NULL,
  `item22` int DEFAULT NULL,
  `item23` int DEFAULT NULL,
  `item24` int DEFAULT NULL,
  `item25` int DEFAULT NULL,
  `qtd1` smallint DEFAULT NULL,
  `qtd2` smallint DEFAULT NULL,
  `qtd3` smallint DEFAULT NULL,
  `qtd4` smallint DEFAULT NULL,
  `qtd5` smallint DEFAULT NULL,
  `qtd6` smallint DEFAULT NULL,
  `qtd7` smallint DEFAULT NULL,
  `qtd8` smallint DEFAULT NULL,
  `qtd9` smallint DEFAULT NULL,
  `qtd10` smallint DEFAULT NULL,
  `qtd11` smallint DEFAULT NULL,
  `qtd12` smallint DEFAULT NULL,
  `qtd13` smallint DEFAULT NULL,
  `qtd14` smallint DEFAULT NULL,
  `qtd15` smallint DEFAULT NULL,
  `qtd16` smallint DEFAULT NULL,
  `qtd17` smallint DEFAULT NULL,
  `qtd18` smallint DEFAULT NULL,
  `qtd19` smallint DEFAULT NULL,
  `qtd20` smallint DEFAULT NULL,
  `qtd21` smallint DEFAULT NULL,
  `qtd22` smallint DEFAULT NULL,
  `qtd23` smallint DEFAULT NULL,
  `qtd24` smallint DEFAULT NULL,
  `qtd25` smallint DEFAULT NULL,
  `bitem` int DEFAULT NULL,
  `bqtd` smallint DEFAULT NULL,
  `logdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `char_name` varchar(30) COLLATE tis620_bin NOT NULL,
  UNIQUE KEY `chave` (`chave`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=tis620 COLLATE=tis620_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of battle_pass_reward
-- ----------------------------

-- ----------------------------
-- Table structure for bet_banker
-- ----------------------------
DROP TABLE IF EXISTS `bet_banker`;
CREATE TABLE `bet_banker` (
  `id` int NOT NULL AUTO_INCREMENT,
  `acc_id` int NOT NULL,
  `char_id` int NOT NULL,
  `bet_round` int NOT NULL,
  `char_name` varchar(255) NOT NULL,
  `item_id` int NOT NULL,
  `bet_amount` int NOT NULL,
  `get_bet` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of bet_banker
-- ----------------------------

-- ----------------------------
-- Table structure for bet_bankerdouble
-- ----------------------------
DROP TABLE IF EXISTS `bet_bankerdouble`;
CREATE TABLE `bet_bankerdouble` (
  `id` int NOT NULL AUTO_INCREMENT,
  `acc_id` int NOT NULL,
  `char_id` int NOT NULL,
  `bet_round` int NOT NULL,
  `char_name` varchar(255) NOT NULL,
  `item_id` int NOT NULL,
  `bet_amount` int NOT NULL,
  `get_bet` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of bet_bankerdouble
-- ----------------------------

-- ----------------------------
-- Table structure for bet_bankernatural
-- ----------------------------
DROP TABLE IF EXISTS `bet_bankernatural`;
CREATE TABLE `bet_bankernatural` (
  `id` int NOT NULL AUTO_INCREMENT,
  `acc_id` int NOT NULL,
  `char_id` int NOT NULL,
  `bet_round` int NOT NULL,
  `char_name` varchar(255) NOT NULL,
  `item_id` int NOT NULL,
  `bet_amount` int NOT NULL,
  `get_bet` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of bet_bankernatural
-- ----------------------------

-- ----------------------------
-- Table structure for bet_draw
-- ----------------------------
DROP TABLE IF EXISTS `bet_draw`;
CREATE TABLE `bet_draw` (
  `id` int NOT NULL AUTO_INCREMENT,
  `acc_id` int NOT NULL,
  `char_id` int NOT NULL,
  `bet_round` int NOT NULL,
  `char_name` varchar(255) NOT NULL,
  `item_id` int NOT NULL,
  `bet_amount` int NOT NULL,
  `get_bet` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of bet_draw
-- ----------------------------

-- ----------------------------
-- Table structure for bet_ip
-- ----------------------------
DROP TABLE IF EXISTS `bet_ip`;
CREATE TABLE `bet_ip` (
  `id` int NOT NULL AUTO_INCREMENT,
  `char_id` int NOT NULL,
  `bet_round` int NOT NULL,
  `ip` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of bet_ip
-- ----------------------------

-- ----------------------------
-- Table structure for bet_player
-- ----------------------------
DROP TABLE IF EXISTS `bet_player`;
CREATE TABLE `bet_player` (
  `id` int NOT NULL AUTO_INCREMENT,
  `acc_id` int NOT NULL,
  `char_id` int NOT NULL,
  `bet_round` int NOT NULL,
  `char_name` varchar(255) NOT NULL,
  `item_id` int NOT NULL,
  `bet_amount` int NOT NULL,
  `get_bet` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of bet_player
-- ----------------------------

-- ----------------------------
-- Table structure for bet_playerdouble
-- ----------------------------
DROP TABLE IF EXISTS `bet_playerdouble`;
CREATE TABLE `bet_playerdouble` (
  `id` int NOT NULL AUTO_INCREMENT,
  `acc_id` int NOT NULL,
  `char_id` int NOT NULL,
  `bet_round` int NOT NULL,
  `char_name` varchar(255) NOT NULL,
  `item_id` int NOT NULL,
  `bet_amount` int NOT NULL,
  `get_bet` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of bet_playerdouble
-- ----------------------------

-- ----------------------------
-- Table structure for bet_playernatural
-- ----------------------------
DROP TABLE IF EXISTS `bet_playernatural`;
CREATE TABLE `bet_playernatural` (
  `id` int NOT NULL AUTO_INCREMENT,
  `acc_id` int NOT NULL,
  `char_id` int NOT NULL,
  `bet_round` int NOT NULL,
  `char_name` varchar(255) NOT NULL,
  `item_id` int NOT NULL,
  `bet_amount` int NOT NULL,
  `get_bet` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of bet_playernatural
-- ----------------------------

-- ----------------------------
-- Table structure for bonus_script
-- ----------------------------
DROP TABLE IF EXISTS `bonus_script`;
CREATE TABLE `bonus_script` (
  `char_id` int unsigned NOT NULL,
  `script` text NOT NULL,
  `tick` bigint NOT NULL DEFAULT '0',
  `flag` smallint unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `icon` smallint NOT NULL DEFAULT '-1',
  KEY `char_id` (`char_id`)
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of bonus_script
-- ----------------------------

-- ----------------------------
-- Table structure for buffet_time
-- ----------------------------
DROP TABLE IF EXISTS `buffet_time`;
CREATE TABLE `buffet_time` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `expire` timestamp NULL DEFAULT NULL,
  `type` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of buffet_time
-- ----------------------------

-- ----------------------------
-- Table structure for buyingstores
-- ----------------------------
DROP TABLE IF EXISTS `buyingstores`;
CREATE TABLE `buyingstores` (
  `id` int unsigned NOT NULL,
  `account_id` int unsigned NOT NULL,
  `char_id` int unsigned NOT NULL,
  `sex` enum('F','M') NOT NULL DEFAULT 'M',
  `map` varchar(20) NOT NULL,
  `x` smallint unsigned NOT NULL,
  `y` smallint unsigned NOT NULL,
  `title` varchar(80) NOT NULL,
  `limit` int unsigned NOT NULL,
  `body_direction` char(1) NOT NULL DEFAULT '4',
  `head_direction` char(1) NOT NULL DEFAULT '0',
  `sit` char(1) NOT NULL DEFAULT '1',
  `autotrade` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of buyingstores
-- ----------------------------

-- ----------------------------
-- Table structure for buyingstore_items
-- ----------------------------
DROP TABLE IF EXISTS `buyingstore_items`;
CREATE TABLE `buyingstore_items` (
  `buyingstore_id` int unsigned NOT NULL,
  `index` smallint unsigned NOT NULL,
  `item_id` int unsigned NOT NULL,
  `amount` smallint unsigned NOT NULL,
  `price` int unsigned NOT NULL,
  PRIMARY KEY (`buyingstore_id`,`index`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of buyingstore_items
-- ----------------------------

-- ----------------------------
-- Table structure for cart_inventory
-- ----------------------------
DROP TABLE IF EXISTS `cart_inventory`;
CREATE TABLE `cart_inventory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `char_id` int NOT NULL DEFAULT '0',
  `nameid` int unsigned NOT NULL DEFAULT '0',
  `amount` int NOT NULL DEFAULT '0',
  `equip` int unsigned NOT NULL DEFAULT '0',
  `identify` smallint NOT NULL DEFAULT '0',
  `refine` tinyint unsigned NOT NULL DEFAULT '0',
  `attribute` tinyint NOT NULL DEFAULT '0',
  `card0` int unsigned NOT NULL DEFAULT '0',
  `card1` int unsigned NOT NULL DEFAULT '0',
  `card2` int unsigned NOT NULL DEFAULT '0',
  `card3` int unsigned NOT NULL DEFAULT '0',
  `option_id0` smallint NOT NULL DEFAULT '0',
  `option_val0` smallint NOT NULL DEFAULT '0',
  `option_parm0` tinyint NOT NULL DEFAULT '0',
  `option_id1` smallint NOT NULL DEFAULT '0',
  `option_val1` smallint NOT NULL DEFAULT '0',
  `option_parm1` tinyint NOT NULL DEFAULT '0',
  `option_id2` smallint NOT NULL DEFAULT '0',
  `option_val2` smallint NOT NULL DEFAULT '0',
  `option_parm2` tinyint NOT NULL DEFAULT '0',
  `option_id3` smallint NOT NULL DEFAULT '0',
  `option_val3` smallint NOT NULL DEFAULT '0',
  `option_parm3` tinyint NOT NULL DEFAULT '0',
  `option_id4` smallint NOT NULL DEFAULT '0',
  `option_val4` smallint NOT NULL DEFAULT '0',
  `option_parm4` tinyint NOT NULL DEFAULT '0',
  `expire_time` int unsigned NOT NULL DEFAULT '0',
  `bound` tinyint unsigned NOT NULL DEFAULT '0',
  `unique_id` bigint unsigned NOT NULL DEFAULT '0',
  `enchantgrade` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `char_id` (`char_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of cart_inventory
-- ----------------------------

-- ----------------------------
-- Table structure for changelook
-- ----------------------------
DROP TABLE IF EXISTS `changelook`;
CREATE TABLE `changelook` (
  `char_id` int unsigned NOT NULL DEFAULT '0',
  `top` int unsigned NOT NULL DEFAULT '0',
  `mid` int unsigned NOT NULL DEFAULT '0',
  `low` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_id`,`top`,`mid`,`low`),
  KEY `char_id` (`char_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of changelook
-- ----------------------------

-- ----------------------------
-- Table structure for char
-- ----------------------------
DROP TABLE IF EXISTS `char`;
CREATE TABLE `char` (
  `char_id` int unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int unsigned NOT NULL DEFAULT '0',
  `char_num` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(30) NOT NULL DEFAULT '',
  `class` smallint unsigned NOT NULL DEFAULT '0',
  `base_level` smallint unsigned NOT NULL DEFAULT '1',
  `job_level` smallint unsigned NOT NULL DEFAULT '1',
  `base_exp` bigint unsigned NOT NULL DEFAULT '0',
  `job_exp` bigint unsigned NOT NULL DEFAULT '0',
  `zeny` int unsigned NOT NULL DEFAULT '0',
  `str` smallint unsigned NOT NULL DEFAULT '0',
  `agi` smallint unsigned NOT NULL DEFAULT '0',
  `vit` smallint unsigned NOT NULL DEFAULT '0',
  `int` smallint unsigned NOT NULL DEFAULT '0',
  `dex` smallint unsigned NOT NULL DEFAULT '0',
  `luk` smallint unsigned NOT NULL DEFAULT '0',
  `pow` smallint unsigned NOT NULL DEFAULT '0',
  `sta` smallint unsigned NOT NULL DEFAULT '0',
  `wis` smallint unsigned NOT NULL DEFAULT '0',
  `spl` smallint unsigned NOT NULL DEFAULT '0',
  `con` smallint unsigned NOT NULL DEFAULT '0',
  `crt` smallint unsigned NOT NULL DEFAULT '0',
  `max_hp` int unsigned NOT NULL DEFAULT '0',
  `hp` int unsigned NOT NULL DEFAULT '0',
  `max_sp` int unsigned NOT NULL DEFAULT '0',
  `sp` int unsigned NOT NULL DEFAULT '0',
  `max_ap` int unsigned NOT NULL DEFAULT '0',
  `ap` int unsigned NOT NULL DEFAULT '0',
  `status_point` int unsigned NOT NULL DEFAULT '0',
  `skill_point` int unsigned NOT NULL DEFAULT '0',
  `trait_point` int unsigned NOT NULL DEFAULT '0',
  `option` int NOT NULL DEFAULT '0',
  `karma` tinyint NOT NULL DEFAULT '0',
  `manner` smallint NOT NULL DEFAULT '0',
  `party_id` int unsigned NOT NULL DEFAULT '0',
  `guild_id` int unsigned NOT NULL DEFAULT '0',
  `pet_id` int unsigned NOT NULL DEFAULT '0',
  `homun_id` int unsigned NOT NULL DEFAULT '0',
  `elemental_id` int unsigned NOT NULL DEFAULT '0',
  `hair` tinyint unsigned NOT NULL DEFAULT '0',
  `hair_color` smallint unsigned NOT NULL DEFAULT '0',
  `clothes_color` smallint unsigned NOT NULL DEFAULT '0',
  `body` smallint unsigned NOT NULL DEFAULT '0',
  `weapon` smallint unsigned NOT NULL DEFAULT '0',
  `shield` smallint unsigned NOT NULL DEFAULT '0',
  `head_top` smallint unsigned NOT NULL DEFAULT '0',
  `head_mid` smallint unsigned NOT NULL DEFAULT '0',
  `head_bottom` smallint unsigned NOT NULL DEFAULT '0',
  `robe` smallint unsigned NOT NULL DEFAULT '0',
  `last_map` varchar(11) NOT NULL DEFAULT '',
  `last_x` smallint unsigned NOT NULL DEFAULT '53',
  `last_y` smallint unsigned NOT NULL DEFAULT '111',
  `last_instanceid` int unsigned NOT NULL DEFAULT '0',
  `save_map` varchar(11) NOT NULL DEFAULT '',
  `save_x` smallint unsigned NOT NULL DEFAULT '53',
  `save_y` smallint unsigned NOT NULL DEFAULT '111',
  `partner_id` int unsigned NOT NULL DEFAULT '0',
  `online` tinyint NOT NULL DEFAULT '0',
  `father` int unsigned NOT NULL DEFAULT '0',
  `mother` int unsigned NOT NULL DEFAULT '0',
  `child` int unsigned NOT NULL DEFAULT '0',
  `fame` int unsigned NOT NULL DEFAULT '0',
  `rename` smallint unsigned NOT NULL DEFAULT '0',
  `delete_date` int unsigned NOT NULL DEFAULT '0',
  `moves` int unsigned NOT NULL DEFAULT '0',
  `unban_time` int unsigned NOT NULL DEFAULT '0',
  `font` tinyint unsigned NOT NULL DEFAULT '0',
  `uniqueitem_counter` int unsigned NOT NULL DEFAULT '0',
  `sex` enum('M','F') NOT NULL,
  `hotkey_rowshift` tinyint unsigned NOT NULL DEFAULT '0',
  `hotkey_rowshift2` tinyint unsigned NOT NULL DEFAULT '0',
  `clan_id` int unsigned NOT NULL DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `title_id` int unsigned NOT NULL DEFAULT '0',
  `show_equip` tinyint unsigned NOT NULL DEFAULT '0',
  `inventory_slots` smallint NOT NULL DEFAULT '100',
  `body_direction` tinyint unsigned NOT NULL DEFAULT '0',
  `disable_call` tinyint unsigned NOT NULL DEFAULT '0',
  `point_pvp` int NOT NULL DEFAULT '0',
  `point_mvp` int NOT NULL DEFAULT '0',
  `point_emp` int NOT NULL DEFAULT '0',
  `point_gacha` int NOT NULL DEFAULT '0',
  `point_killgvg` int NOT NULL DEFAULT '0',
  `gacha_time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `punsuk_point` int NOT NULL DEFAULT '0',
  `HW` int NOT NULL DEFAULT '0',
  `HWTIME` datetime DEFAULT NULL,
  `HWCC` int NOT NULL DEFAULT '0',
  `HWTIMECC` datetime DEFAULT NULL,
  `HWDN` int unsigned NOT NULL DEFAULT '0',
  `HWTIMEDN` datetime DEFAULT NULL,
  PRIMARY KEY (`char_id`),
  UNIQUE KEY `name_key` (`name`),
  KEY `account_id` (`account_id`),
  KEY `party_id` (`party_id`),
  KEY `guild_id` (`guild_id`),
  KEY `online` (`online`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of char
-- ----------------------------

-- ----------------------------
-- Table structure for charlog
-- ----------------------------
DROP TABLE IF EXISTS `charlog`;
CREATE TABLE `charlog` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `char_msg` varchar(255) NOT NULL DEFAULT 'char select',
  `account_id` int NOT NULL DEFAULT '0',
  `char_num` tinyint NOT NULL DEFAULT '0',
  `name` varchar(23) NOT NULL DEFAULT '',
  `str` int unsigned NOT NULL DEFAULT '0',
  `agi` int unsigned NOT NULL DEFAULT '0',
  `vit` int unsigned NOT NULL DEFAULT '0',
  `int` int unsigned NOT NULL DEFAULT '0',
  `dex` int unsigned NOT NULL DEFAULT '0',
  `luk` int unsigned NOT NULL DEFAULT '0',
  `hair` tinyint NOT NULL DEFAULT '0',
  `hair_color` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of charlog
-- ----------------------------

-- ----------------------------
-- Table structure for char_configs
-- ----------------------------
DROP TABLE IF EXISTS `char_configs`;
CREATE TABLE `char_configs` (
  `world_name` varchar(32) NOT NULL,
  `account_id` int unsigned NOT NULL,
  `char_id` int unsigned NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`world_name`,`account_id`,`char_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of char_configs
-- ----------------------------

-- ----------------------------
-- Table structure for char_reg_num
-- ----------------------------
DROP TABLE IF EXISTS `char_reg_num`;
CREATE TABLE `char_reg_num` (
  `char_id` int unsigned NOT NULL DEFAULT '0',
  `key` varchar(32) NOT NULL DEFAULT '',
  `index` int unsigned NOT NULL DEFAULT '0',
  `value` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_id`,`key`,`index`),
  KEY `char_id` (`char_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of char_reg_num
-- ----------------------------

-- ----------------------------
-- Table structure for char_reg_str
-- ----------------------------
DROP TABLE IF EXISTS `char_reg_str`;
CREATE TABLE `char_reg_str` (
  `char_id` int unsigned NOT NULL DEFAULT '0',
  `key` varchar(32) NOT NULL DEFAULT '',
  `index` int unsigned NOT NULL DEFAULT '0',
  `value` varchar(254) NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_id`,`key`,`index`),
  KEY `char_id` (`char_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of char_reg_str
-- ----------------------------

-- ----------------------------
-- Table structure for clan
-- ----------------------------
DROP TABLE IF EXISTS `clan`;
CREATE TABLE `clan` (
  `clan_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(24) NOT NULL DEFAULT '',
  `master` varchar(24) NOT NULL DEFAULT '',
  `mapname` varchar(24) NOT NULL DEFAULT '',
  `max_member` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`clan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of clan
-- ----------------------------

-- ----------------------------
-- Table structure for clan_alliance
-- ----------------------------
DROP TABLE IF EXISTS `clan_alliance`;
CREATE TABLE `clan_alliance` (
  `clan_id` int unsigned NOT NULL DEFAULT '0',
  `opposition` int unsigned NOT NULL DEFAULT '0',
  `alliance_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(24) NOT NULL DEFAULT '',
  PRIMARY KEY (`clan_id`,`alliance_id`),
  KEY `alliance_id` (`alliance_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of clan_alliance
-- ----------------------------

-- ----------------------------
-- Table structure for club_member
-- ----------------------------
DROP TABLE IF EXISTS `club_member`;
CREATE TABLE `club_member` (
  `userid` varchar(23) NOT NULL,
  `account_id` int unsigned NOT NULL,
  `money` int unsigned NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of club_member
-- ----------------------------

-- ----------------------------
-- Table structure for club_member2
-- ----------------------------
DROP TABLE IF EXISTS `club_member2`;
CREATE TABLE `club_member2` (
  `id` int unsigned NOT NULL,
  `userid` varchar(23) NOT NULL,
  `account_id` int unsigned NOT NULL,
  `money` int unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of club_member2
-- ----------------------------

-- ----------------------------
-- Table structure for club_member3
-- ----------------------------
DROP TABLE IF EXISTS `club_member3`;
CREATE TABLE `club_member3` (
  `id` int unsigned NOT NULL,
  `userid` varchar(23) NOT NULL,
  `account_id` int unsigned NOT NULL,
  `money` int unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of club_member3
-- ----------------------------

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int unsigned NOT NULL DEFAULT '0',
  `nameid` int unsigned NOT NULL DEFAULT '0',
  `amount` smallint unsigned NOT NULL DEFAULT '0',
  `equip` int unsigned NOT NULL DEFAULT '0',
  `identify` smallint unsigned NOT NULL DEFAULT '0',
  `refine` tinyint unsigned NOT NULL DEFAULT '0',
  `attribute` tinyint unsigned NOT NULL DEFAULT '0',
  `card0` int unsigned NOT NULL DEFAULT '0',
  `card1` int unsigned NOT NULL DEFAULT '0',
  `card2` int unsigned NOT NULL DEFAULT '0',
  `card3` int unsigned NOT NULL DEFAULT '0',
  `option_id0` smallint NOT NULL DEFAULT '0',
  `option_val0` smallint NOT NULL DEFAULT '0',
  `option_parm0` tinyint NOT NULL DEFAULT '0',
  `option_id1` smallint NOT NULL DEFAULT '0',
  `option_val1` smallint NOT NULL DEFAULT '0',
  `option_parm1` tinyint NOT NULL DEFAULT '0',
  `option_id2` smallint NOT NULL DEFAULT '0',
  `option_val2` smallint NOT NULL DEFAULT '0',
  `option_parm2` tinyint NOT NULL DEFAULT '0',
  `option_id3` smallint NOT NULL DEFAULT '0',
  `option_val3` smallint NOT NULL DEFAULT '0',
  `option_parm3` tinyint NOT NULL DEFAULT '0',
  `option_id4` smallint NOT NULL DEFAULT '0',
  `option_val4` smallint NOT NULL DEFAULT '0',
  `option_parm4` tinyint NOT NULL DEFAULT '0',
  `expire_time` int unsigned NOT NULL DEFAULT '0',
  `bound` tinyint unsigned NOT NULL DEFAULT '0',
  `unique_id` bigint unsigned NOT NULL DEFAULT '0',
  `enchantgrade` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of collection
-- ----------------------------

-- ----------------------------
-- Table structure for db_roulette
-- ----------------------------
DROP TABLE IF EXISTS `db_roulette`;
CREATE TABLE `db_roulette` (
  `index` int NOT NULL DEFAULT '0',
  `level` smallint unsigned NOT NULL,
  `item_id` int unsigned NOT NULL,
  `amount` smallint unsigned NOT NULL DEFAULT '1',
  `flag` smallint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`index`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of db_roulette
-- ----------------------------

-- ----------------------------
-- Table structure for donate
-- ----------------------------
DROP TABLE IF EXISTS `donate`;
CREATE TABLE `donate` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(22) NOT NULL DEFAULT '0',
  `account_id` int NOT NULL DEFAULT '0',
  `amount` decimal(8,0) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of donate
-- ----------------------------

-- ----------------------------
-- Table structure for duckdig
-- ----------------------------
DROP TABLE IF EXISTS `duckdig`;
CREATE TABLE `duckdig` (
  `account_id` int NOT NULL,
  `point` int NOT NULL,
  `total_point` int NOT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of duckdig
-- ----------------------------

-- ----------------------------
-- Table structure for elemental
-- ----------------------------
DROP TABLE IF EXISTS `elemental`;
CREATE TABLE `elemental` (
  `ele_id` int unsigned NOT NULL AUTO_INCREMENT,
  `char_id` int NOT NULL,
  `class` mediumint unsigned NOT NULL DEFAULT '0',
  `mode` int unsigned NOT NULL DEFAULT '1',
  `hp` int unsigned NOT NULL DEFAULT '0',
  `sp` int unsigned NOT NULL DEFAULT '0',
  `max_hp` int unsigned NOT NULL DEFAULT '0',
  `max_sp` int unsigned NOT NULL DEFAULT '0',
  `atk1` mediumint unsigned NOT NULL DEFAULT '0',
  `atk2` mediumint unsigned NOT NULL DEFAULT '0',
  `matk` mediumint unsigned NOT NULL DEFAULT '0',
  `aspd` smallint unsigned NOT NULL DEFAULT '0',
  `def` smallint unsigned NOT NULL DEFAULT '0',
  `mdef` smallint unsigned NOT NULL DEFAULT '0',
  `flee` smallint unsigned NOT NULL DEFAULT '0',
  `hit` smallint unsigned NOT NULL DEFAULT '0',
  `life_time` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ele_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of elemental
-- ----------------------------

-- ----------------------------
-- Table structure for event_lv
-- ----------------------------
DROP TABLE IF EXISTS `event_lv`;
CREATE TABLE `event_lv` (
  `account_id` int unsigned NOT NULL,
  `status` tinyint unsigned NOT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of event_lv
-- ----------------------------

-- ----------------------------
-- Table structure for field_boss
-- ----------------------------
DROP TABLE IF EXISTS `field_boss`;
CREATE TABLE `field_boss` (
  `id` int NOT NULL,
  `char_id` int NOT NULL,
  `wavekills` int NOT NULL DEFAULT '0',
  `damage` int NOT NULL DEFAULT '0',
  `item1` varchar(23) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `amount1` varchar(23) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `received1` int NOT NULL DEFAULT '0',
  `item2` varchar(23) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `amount2` varchar(23) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `received2` int NOT NULL DEFAULT '0',
  `timetick` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of field_boss
-- ----------------------------

-- ----------------------------
-- Table structure for field_boss_guild
-- ----------------------------
DROP TABLE IF EXISTS `field_boss_guild`;
CREATE TABLE `field_boss_guild` (
  `id` int NOT NULL,
  `guild_id` int NOT NULL,
  `damage` int NOT NULL DEFAULT '0',
  `item` varchar(23) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `amount` varchar(23) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `received` int NOT NULL DEFAULT '0',
  `timetick` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of field_boss_guild
-- ----------------------------

-- ----------------------------
-- Table structure for field_boss_map
-- ----------------------------
DROP TABLE IF EXISTS `field_boss_map`;
CREATE TABLE `field_boss_map` (
  `id` int NOT NULL,
  `mapname` varchar(255) NOT NULL,
  `mapindex` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of field_boss_map
-- ----------------------------

-- ----------------------------
-- Table structure for friends
-- ----------------------------
DROP TABLE IF EXISTS `friends`;
CREATE TABLE `friends` (
  `char_id` int NOT NULL DEFAULT '0',
  `friend_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_id`,`friend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of friends
-- ----------------------------

-- ----------------------------
-- Table structure for gepard_block
-- ----------------------------
DROP TABLE IF EXISTS `gepard_block`;
CREATE TABLE `gepard_block` (
  `unique_id` int unsigned NOT NULL DEFAULT '0',
  `unban_time` datetime NOT NULL,
  `reason` varchar(50) NOT NULL,
  UNIQUE KEY `unique_id` (`unique_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of gepard_block
-- ----------------------------

-- ----------------------------
-- Table structure for gepard_block_log
-- ----------------------------
DROP TABLE IF EXISTS `gepard_block_log`;
CREATE TABLE `gepard_block_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` int unsigned NOT NULL DEFAULT '0',
  `block_time` datetime NOT NULL,
  `unban_time` datetime NOT NULL,
  `violator_name` varchar(24) NOT NULL,
  `violator_account_id` int NOT NULL,
  `initiator_name` varchar(24) NOT NULL,
  `initiator_account_id` int NOT NULL,
  `reason` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of gepard_block_log
-- ----------------------------

-- ----------------------------
-- Table structure for gepard_min_allowed_license_version
-- ----------------------------
DROP TABLE IF EXISTS `gepard_min_allowed_license_version`;
CREATE TABLE `gepard_min_allowed_license_version` (
  `version` int unsigned NOT NULL DEFAULT '2018033001'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of gepard_min_allowed_license_version
-- ----------------------------

-- ----------------------------
-- Table structure for gepard_reg_num
-- ----------------------------
DROP TABLE IF EXISTS `gepard_reg_num`;
CREATE TABLE `gepard_reg_num` (
  `unique_id` int unsigned NOT NULL DEFAULT '0',
  `key` varchar(32) CHARACTER SET tis620 COLLATE tis620_bin NOT NULL DEFAULT '',
  `index` int unsigned NOT NULL DEFAULT '0',
  `value` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`unique_id`,`key`,`index`),
  KEY `unique_id` (`unique_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of gepard_reg_num
-- ----------------------------

-- ----------------------------
-- Table structure for gepard_reg_str
-- ----------------------------
DROP TABLE IF EXISTS `gepard_reg_str`;
CREATE TABLE `gepard_reg_str` (
  `unique_id` int unsigned NOT NULL DEFAULT '0',
  `key` varchar(32) CHARACTER SET tis620 COLLATE tis620_bin NOT NULL DEFAULT '',
  `index` int unsigned NOT NULL DEFAULT '0',
  `value` varchar(254) NOT NULL DEFAULT '0',
  PRIMARY KEY (`unique_id`,`key`,`index`),
  KEY `unique_id` (`unique_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of gepard_reg_str
-- ----------------------------

-- ----------------------------
-- Table structure for gepard_report_log
-- ----------------------------
DROP TABLE IF EXISTS `gepard_report_log`;
CREATE TABLE `gepard_report_log` (
  `time` datetime NOT NULL,
  `unique_id` int unsigned NOT NULL DEFAULT '0',
  `account_id` int unsigned NOT NULL DEFAULT '0',
  `char_id` int unsigned NOT NULL DEFAULT '0',
  `char_name` varchar(24) NOT NULL,
  `report_str` varchar(120) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of gepard_report_log
-- ----------------------------

-- ----------------------------
-- Table structure for global_acc_reg_num
-- ----------------------------
DROP TABLE IF EXISTS `global_acc_reg_num`;
CREATE TABLE `global_acc_reg_num` (
  `account_id` int unsigned NOT NULL DEFAULT '0',
  `key` varchar(32) NOT NULL DEFAULT '',
  `index` int unsigned NOT NULL DEFAULT '0',
  `value` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_id`,`key`,`index`),
  KEY `account_id` (`account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of global_acc_reg_num
-- ----------------------------

-- ----------------------------
-- Table structure for global_acc_reg_str
-- ----------------------------
DROP TABLE IF EXISTS `global_acc_reg_str`;
CREATE TABLE `global_acc_reg_str` (
  `account_id` int unsigned NOT NULL DEFAULT '0',
  `key` varchar(32) NOT NULL DEFAULT '',
  `index` int unsigned NOT NULL DEFAULT '0',
  `value` varchar(254) NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_id`,`key`,`index`),
  KEY `account_id` (`account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of global_acc_reg_str
-- ----------------------------

-- ----------------------------
-- Table structure for guild
-- ----------------------------
DROP TABLE IF EXISTS `guild`;
CREATE TABLE `guild` (
  `guild_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(24) NOT NULL DEFAULT '',
  `char_id` int unsigned NOT NULL DEFAULT '0',
  `master` varchar(24) NOT NULL DEFAULT '',
  `guild_lv` tinyint unsigned NOT NULL DEFAULT '0',
  `connect_member` tinyint unsigned NOT NULL DEFAULT '0',
  `max_member` tinyint unsigned NOT NULL DEFAULT '0',
  `average_lv` smallint unsigned NOT NULL DEFAULT '1',
  `exp` bigint unsigned NOT NULL DEFAULT '0',
  `next_exp` bigint unsigned NOT NULL DEFAULT '0',
  `skill_point` tinyint unsigned NOT NULL DEFAULT '0',
  `mes1` varchar(60) NOT NULL DEFAULT '',
  `mes2` varchar(120) NOT NULL DEFAULT '',
  `emblem_len` int unsigned NOT NULL DEFAULT '0',
  `emblem_id` int unsigned NOT NULL DEFAULT '0',
  `emblem_data` blob,
  `last_master_change` datetime DEFAULT NULL,
  PRIMARY KEY (`guild_id`,`char_id`),
  UNIQUE KEY `guild_id` (`guild_id`),
  KEY `char_id` (`char_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of guild
-- ----------------------------

-- ----------------------------
-- Table structure for guildwar
-- ----------------------------
DROP TABLE IF EXISTS `guildwar`;
CREATE TABLE `guildwar` (
  `guildid` int unsigned NOT NULL DEFAULT '0',
  `guildname` varchar(30) NOT NULL DEFAULT '',
  `kill` int unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=tis620 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of guildwar
-- ----------------------------

-- ----------------------------
-- Table structure for guild_alliance
-- ----------------------------
DROP TABLE IF EXISTS `guild_alliance`;
CREATE TABLE `guild_alliance` (
  `guild_id` int unsigned NOT NULL DEFAULT '0',
  `opposition` int unsigned NOT NULL DEFAULT '0',
  `alliance_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(24) NOT NULL DEFAULT '',
  PRIMARY KEY (`guild_id`,`alliance_id`),
  KEY `alliance_id` (`alliance_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of guild_alliance
-- ----------------------------

-- ----------------------------
-- Table structure for guild_castle
-- ----------------------------
DROP TABLE IF EXISTS `guild_castle`;
CREATE TABLE `guild_castle` (
  `castle_id` int unsigned NOT NULL DEFAULT '0',
  `guild_id` int unsigned NOT NULL DEFAULT '0',
  `economy` int unsigned NOT NULL DEFAULT '0',
  `defense` int unsigned NOT NULL DEFAULT '0',
  `triggerE` int unsigned NOT NULL DEFAULT '0',
  `triggerD` int unsigned NOT NULL DEFAULT '0',
  `nextTime` int unsigned NOT NULL DEFAULT '0',
  `payTime` int unsigned NOT NULL DEFAULT '0',
  `createTime` int unsigned NOT NULL DEFAULT '0',
  `visibleC` int unsigned NOT NULL DEFAULT '0',
  `visibleG0` int unsigned NOT NULL DEFAULT '0',
  `visibleG1` int unsigned NOT NULL DEFAULT '0',
  `visibleG2` int unsigned NOT NULL DEFAULT '0',
  `visibleG3` int unsigned NOT NULL DEFAULT '0',
  `visibleG4` int unsigned NOT NULL DEFAULT '0',
  `visibleG5` int unsigned NOT NULL DEFAULT '0',
  `visibleG6` int unsigned NOT NULL DEFAULT '0',
  `visibleG7` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`castle_id`),
  KEY `guild_id` (`guild_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of guild_castle
-- ----------------------------

-- ----------------------------
-- Table structure for guild_emblems
-- ----------------------------
DROP TABLE IF EXISTS `guild_emblems`;
CREATE TABLE `guild_emblems` (
  `world_name` varchar(32) NOT NULL,
  `guild_id` int unsigned NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_data` blob,
  `version` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`world_name`,`guild_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of guild_emblems
-- ----------------------------

-- ----------------------------
-- Table structure for guild_expulsion
-- ----------------------------
DROP TABLE IF EXISTS `guild_expulsion`;
CREATE TABLE `guild_expulsion` (
  `guild_id` int unsigned NOT NULL DEFAULT '0',
  `account_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(24) NOT NULL DEFAULT '',
  `mes` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`guild_id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of guild_expulsion
-- ----------------------------

-- ----------------------------
-- Table structure for guild_member
-- ----------------------------
DROP TABLE IF EXISTS `guild_member`;
CREATE TABLE `guild_member` (
  `guild_id` int unsigned NOT NULL DEFAULT '0',
  `char_id` int unsigned NOT NULL DEFAULT '0',
  `exp` bigint unsigned NOT NULL DEFAULT '0',
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guild_id`,`char_id`),
  KEY `char_id` (`char_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of guild_member
-- ----------------------------

-- ----------------------------
-- Table structure for guild_position
-- ----------------------------
DROP TABLE IF EXISTS `guild_position`;
CREATE TABLE `guild_position` (
  `guild_id` int unsigned NOT NULL DEFAULT '0',
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `name` varchar(24) NOT NULL DEFAULT '',
  `mode` smallint unsigned NOT NULL DEFAULT '0',
  `exp_mode` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guild_id`,`position`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of guild_position
-- ----------------------------

-- ----------------------------
-- Table structure for guild_skill
-- ----------------------------
DROP TABLE IF EXISTS `guild_skill`;
CREATE TABLE `guild_skill` (
  `guild_id` int unsigned NOT NULL DEFAULT '0',
  `id` smallint unsigned NOT NULL DEFAULT '0',
  `lv` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guild_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of guild_skill
-- ----------------------------

-- ----------------------------
-- Table structure for guild_storage
-- ----------------------------
DROP TABLE IF EXISTS `guild_storage`;
CREATE TABLE `guild_storage` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `guild_id` int unsigned NOT NULL DEFAULT '0',
  `nameid` int unsigned NOT NULL DEFAULT '0',
  `amount` int unsigned NOT NULL DEFAULT '0',
  `equip` int unsigned NOT NULL DEFAULT '0',
  `identify` smallint unsigned NOT NULL DEFAULT '0',
  `refine` tinyint unsigned NOT NULL DEFAULT '0',
  `attribute` tinyint unsigned NOT NULL DEFAULT '0',
  `card0` int unsigned NOT NULL DEFAULT '0',
  `card1` int unsigned NOT NULL DEFAULT '0',
  `card2` int unsigned NOT NULL DEFAULT '0',
  `card3` int unsigned NOT NULL DEFAULT '0',
  `option_id0` smallint NOT NULL DEFAULT '0',
  `option_val0` smallint NOT NULL DEFAULT '0',
  `option_parm0` tinyint NOT NULL DEFAULT '0',
  `option_id1` smallint NOT NULL DEFAULT '0',
  `option_val1` smallint NOT NULL DEFAULT '0',
  `option_parm1` tinyint NOT NULL DEFAULT '0',
  `option_id2` smallint NOT NULL DEFAULT '0',
  `option_val2` smallint NOT NULL DEFAULT '0',
  `option_parm2` tinyint NOT NULL DEFAULT '0',
  `option_id3` smallint NOT NULL DEFAULT '0',
  `option_val3` smallint NOT NULL DEFAULT '0',
  `option_parm3` tinyint NOT NULL DEFAULT '0',
  `option_id4` smallint NOT NULL DEFAULT '0',
  `option_val4` smallint NOT NULL DEFAULT '0',
  `option_parm4` tinyint NOT NULL DEFAULT '0',
  `expire_time` int unsigned NOT NULL DEFAULT '0',
  `bound` tinyint unsigned NOT NULL DEFAULT '0',
  `unique_id` bigint unsigned NOT NULL DEFAULT '0',
  `enchantgrade` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `guild_id` (`guild_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of guild_storage
-- ----------------------------

-- ----------------------------
-- Table structure for guild_storage_log
-- ----------------------------
DROP TABLE IF EXISTS `guild_storage_log`;
CREATE TABLE `guild_storage_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `guild_id` int unsigned NOT NULL DEFAULT '0',
  `time` datetime NOT NULL,
  `char_id` int NOT NULL DEFAULT '0',
  `name` varchar(24) NOT NULL DEFAULT '',
  `nameid` int unsigned NOT NULL DEFAULT '0',
  `amount` int NOT NULL DEFAULT '1',
  `identify` smallint NOT NULL DEFAULT '0',
  `refine` tinyint unsigned NOT NULL DEFAULT '0',
  `attribute` tinyint unsigned NOT NULL DEFAULT '0',
  `card0` int unsigned NOT NULL DEFAULT '0',
  `card1` int unsigned NOT NULL DEFAULT '0',
  `card2` int unsigned NOT NULL DEFAULT '0',
  `card3` int unsigned NOT NULL DEFAULT '0',
  `option_id0` smallint NOT NULL DEFAULT '0',
  `option_val0` smallint NOT NULL DEFAULT '0',
  `option_parm0` tinyint NOT NULL DEFAULT '0',
  `option_id1` smallint NOT NULL DEFAULT '0',
  `option_val1` smallint NOT NULL DEFAULT '0',
  `option_parm1` tinyint NOT NULL DEFAULT '0',
  `option_id2` smallint NOT NULL DEFAULT '0',
  `option_val2` smallint NOT NULL DEFAULT '0',
  `option_parm2` tinyint NOT NULL DEFAULT '0',
  `option_id3` smallint NOT NULL DEFAULT '0',
  `option_val3` smallint NOT NULL DEFAULT '0',
  `option_parm3` tinyint NOT NULL DEFAULT '0',
  `option_id4` smallint NOT NULL DEFAULT '0',
  `option_val4` smallint NOT NULL DEFAULT '0',
  `option_parm4` tinyint NOT NULL DEFAULT '0',
  `expire_time` int unsigned NOT NULL DEFAULT '0',
  `unique_id` bigint unsigned NOT NULL DEFAULT '0',
  `bound` tinyint unsigned NOT NULL DEFAULT '0',
  `enchantgrade` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `guild_id` (`guild_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of guild_storage_log
-- ----------------------------

-- ----------------------------
-- Table structure for homunculus
-- ----------------------------
DROP TABLE IF EXISTS `homunculus`;
CREATE TABLE `homunculus` (
  `homun_id` int NOT NULL AUTO_INCREMENT,
  `char_id` int NOT NULL,
  `class` mediumint unsigned NOT NULL DEFAULT '0',
  `prev_class` mediumint NOT NULL DEFAULT '0',
  `name` varchar(24) NOT NULL DEFAULT '',
  `level` smallint NOT NULL DEFAULT '0',
  `exp` bigint unsigned NOT NULL DEFAULT '0',
  `intimacy` int NOT NULL DEFAULT '0',
  `hunger` smallint NOT NULL DEFAULT '0',
  `str` smallint unsigned NOT NULL DEFAULT '0',
  `agi` smallint unsigned NOT NULL DEFAULT '0',
  `vit` smallint unsigned NOT NULL DEFAULT '0',
  `int` smallint unsigned NOT NULL DEFAULT '0',
  `dex` smallint unsigned NOT NULL DEFAULT '0',
  `luk` smallint unsigned NOT NULL DEFAULT '0',
  `hp` int unsigned NOT NULL DEFAULT '0',
  `max_hp` int unsigned NOT NULL DEFAULT '0',
  `sp` int NOT NULL DEFAULT '0',
  `max_sp` int NOT NULL DEFAULT '0',
  `skill_point` smallint unsigned NOT NULL DEFAULT '0',
  `alive` tinyint NOT NULL DEFAULT '1',
  `rename_flag` tinyint NOT NULL DEFAULT '0',
  `vaporize` tinyint NOT NULL DEFAULT '0',
  `autofeed` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`homun_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of homunculus
-- ----------------------------

-- ----------------------------
-- Table structure for hotkey
-- ----------------------------
DROP TABLE IF EXISTS `hotkey`;
CREATE TABLE `hotkey` (
  `char_id` int NOT NULL,
  `hotkey` tinyint unsigned NOT NULL,
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `itemskill_id` int unsigned NOT NULL DEFAULT '0',
  `skill_lvl` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_id`,`hotkey`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of hotkey
-- ----------------------------

-- ----------------------------
-- Table structure for interlog
-- ----------------------------
DROP TABLE IF EXISTS `interlog`;
CREATE TABLE `interlog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `log` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of interlog
-- ----------------------------

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `char_id` int unsigned NOT NULL DEFAULT '0',
  `nameid` int unsigned NOT NULL DEFAULT '0',
  `amount` int unsigned NOT NULL DEFAULT '0',
  `equip` int unsigned NOT NULL DEFAULT '0',
  `identify` smallint NOT NULL DEFAULT '0',
  `refine` tinyint unsigned NOT NULL DEFAULT '0',
  `attribute` tinyint unsigned NOT NULL DEFAULT '0',
  `card0` int unsigned NOT NULL DEFAULT '0',
  `card1` int unsigned NOT NULL DEFAULT '0',
  `card2` int unsigned NOT NULL DEFAULT '0',
  `card3` int unsigned NOT NULL DEFAULT '0',
  `option_id0` smallint NOT NULL DEFAULT '0',
  `option_val0` smallint NOT NULL DEFAULT '0',
  `option_parm0` tinyint NOT NULL DEFAULT '0',
  `option_id1` smallint NOT NULL DEFAULT '0',
  `option_val1` smallint NOT NULL DEFAULT '0',
  `option_parm1` tinyint NOT NULL DEFAULT '0',
  `option_id2` smallint NOT NULL DEFAULT '0',
  `option_val2` smallint NOT NULL DEFAULT '0',
  `option_parm2` tinyint NOT NULL DEFAULT '0',
  `option_id3` smallint NOT NULL DEFAULT '0',
  `option_val3` smallint NOT NULL DEFAULT '0',
  `option_parm3` tinyint NOT NULL DEFAULT '0',
  `option_id4` smallint NOT NULL DEFAULT '0',
  `option_val4` smallint NOT NULL DEFAULT '0',
  `option_parm4` tinyint NOT NULL DEFAULT '0',
  `expire_time` int unsigned NOT NULL DEFAULT '0',
  `favorite` tinyint unsigned NOT NULL DEFAULT '0',
  `bound` tinyint unsigned NOT NULL DEFAULT '0',
  `unique_id` bigint unsigned NOT NULL DEFAULT '0',
  `equip_switch` int unsigned NOT NULL DEFAULT '0',
  `enchantgrade` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `char_id` (`char_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of inventory
-- ----------------------------

-- ----------------------------
-- Table structure for ipbanlist
-- ----------------------------
DROP TABLE IF EXISTS `ipbanlist`;
CREATE TABLE `ipbanlist` (
  `list` varchar(15) NOT NULL DEFAULT '',
  `btime` datetime NOT NULL,
  `rtime` datetime NOT NULL,
  `reason` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`list`,`btime`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of ipbanlist
-- ----------------------------

-- ----------------------------
-- Table structure for item_code_data
-- ----------------------------
DROP TABLE IF EXISTS `item_code_data`;
CREATE TABLE `item_code_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_code` varchar(255) NOT NULL,
  `reward_id1` int NOT NULL,
  `reward_amt1` int NOT NULL,
  `reward_id2` int NOT NULL,
  `reward_amt2` int NOT NULL,
  `reward_id3` int NOT NULL,
  `reward_amt3` int NOT NULL,
  `reward_id4` int NOT NULL,
  `reward_amt4` int NOT NULL,
  `reward_id5` int NOT NULL,
  `reward_amt5` int NOT NULL,
  `redeem_limit` int NOT NULL,
  `expire` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of item_code_data
-- ----------------------------

-- ----------------------------
-- Table structure for item_code_logs
-- ----------------------------
DROP TABLE IF EXISTS `item_code_logs`;
CREATE TABLE `item_code_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `char_id` int NOT NULL,
  `last_ip` varchar(100) NOT NULL,
  `last_unique_id` int NOT NULL,
  `item_code` varchar(255) NOT NULL,
  `redeem_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of item_code_logs
-- ----------------------------

-- ----------------------------
-- Table structure for item_db
-- ----------------------------
DROP TABLE IF EXISTS `item_db`;
CREATE TABLE `item_db` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `name_aegis` varchar(50) NOT NULL DEFAULT '',
  `name_english` varchar(100) NOT NULL DEFAULT '',
  `type` varchar(20) DEFAULT NULL,
  `subtype` varchar(20) DEFAULT NULL,
  `price_buy` mediumint unsigned DEFAULT NULL,
  `price_sell` mediumint unsigned DEFAULT NULL,
  `weight` smallint unsigned DEFAULT NULL,
  `attack` smallint unsigned DEFAULT NULL,
  `defense` smallint unsigned DEFAULT NULL,
  `range` tinyint unsigned DEFAULT NULL,
  `slots` tinyint unsigned DEFAULT NULL,
  `job_all` tinyint unsigned DEFAULT NULL,
  `job_acolyte` tinyint unsigned DEFAULT NULL,
  `job_alchemist` tinyint unsigned DEFAULT NULL,
  `job_archer` tinyint unsigned DEFAULT NULL,
  `job_assassin` tinyint unsigned DEFAULT NULL,
  `job_barddancer` tinyint unsigned DEFAULT NULL,
  `job_blacksmith` tinyint unsigned DEFAULT NULL,
  `job_crusader` tinyint unsigned DEFAULT NULL,
  `job_gunslinger` tinyint unsigned DEFAULT NULL,
  `job_hunter` tinyint unsigned DEFAULT NULL,
  `job_knight` tinyint unsigned DEFAULT NULL,
  `job_mage` tinyint unsigned DEFAULT NULL,
  `job_merchant` tinyint unsigned DEFAULT NULL,
  `job_monk` tinyint unsigned DEFAULT NULL,
  `job_ninja` tinyint unsigned DEFAULT NULL,
  `job_novice` tinyint unsigned DEFAULT NULL,
  `job_priest` tinyint unsigned DEFAULT NULL,
  `job_rogue` tinyint unsigned DEFAULT NULL,
  `job_sage` tinyint unsigned DEFAULT NULL,
  `job_soullinker` tinyint unsigned DEFAULT NULL,
  `job_stargladiator` tinyint unsigned DEFAULT NULL,
  `job_supernovice` tinyint unsigned DEFAULT NULL,
  `job_swordman` tinyint unsigned DEFAULT NULL,
  `job_taekwon` tinyint unsigned DEFAULT NULL,
  `job_thief` tinyint unsigned DEFAULT NULL,
  `job_wizard` tinyint unsigned DEFAULT NULL,
  `class_all` tinyint unsigned DEFAULT NULL,
  `class_normal` tinyint unsigned DEFAULT NULL,
  `class_upper` tinyint unsigned DEFAULT NULL,
  `class_baby` tinyint unsigned DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `location_head_top` tinyint unsigned DEFAULT NULL,
  `location_head_mid` tinyint unsigned DEFAULT NULL,
  `location_head_low` tinyint unsigned DEFAULT NULL,
  `location_armor` tinyint unsigned DEFAULT NULL,
  `location_right_hand` tinyint unsigned DEFAULT NULL,
  `location_left_hand` tinyint unsigned DEFAULT NULL,
  `location_garment` tinyint unsigned DEFAULT NULL,
  `location_shoes` tinyint unsigned DEFAULT NULL,
  `location_right_accessory` tinyint unsigned DEFAULT NULL,
  `location_left_accessory` tinyint unsigned DEFAULT NULL,
  `location_costume_head_top` tinyint unsigned DEFAULT NULL,
  `location_costume_head_mid` tinyint unsigned DEFAULT NULL,
  `location_costume_head_low` tinyint unsigned DEFAULT NULL,
  `location_costume_garment` tinyint unsigned DEFAULT NULL,
  `location_ammo` tinyint unsigned DEFAULT NULL,
  `location_shadow_armor` tinyint unsigned DEFAULT NULL,
  `location_shadow_weapon` tinyint unsigned DEFAULT NULL,
  `location_shadow_shield` tinyint unsigned DEFAULT NULL,
  `location_shadow_shoes` tinyint unsigned DEFAULT NULL,
  `location_shadow_right_accessory` tinyint unsigned DEFAULT NULL,
  `location_shadow_left_accessory` tinyint unsigned DEFAULT NULL,
  `weapon_level` tinyint unsigned DEFAULT NULL,
  `armor_level` tinyint unsigned DEFAULT NULL,
  `equip_level_min` tinyint unsigned DEFAULT NULL,
  `equip_level_max` tinyint unsigned DEFAULT NULL,
  `refineable` tinyint unsigned DEFAULT NULL,
  `view` smallint unsigned DEFAULT NULL,
  `alias_name` varchar(50) DEFAULT NULL,
  `flag_buyingstore` tinyint unsigned DEFAULT NULL,
  `flag_deadbranch` tinyint unsigned DEFAULT NULL,
  `flag_container` tinyint unsigned DEFAULT NULL,
  `flag_uniqueid` tinyint unsigned DEFAULT NULL,
  `flag_bindonequip` tinyint unsigned DEFAULT NULL,
  `flag_dropannounce` tinyint unsigned DEFAULT NULL,
  `flag_noconsume` tinyint unsigned DEFAULT NULL,
  `flag_dropeffect` varchar(20) DEFAULT NULL,
  `delay_duration` bigint unsigned DEFAULT NULL,
  `delay_status` varchar(30) DEFAULT NULL,
  `stack_amount` smallint unsigned DEFAULT NULL,
  `stack_inventory` tinyint unsigned DEFAULT NULL,
  `stack_cart` tinyint unsigned DEFAULT NULL,
  `stack_storage` tinyint unsigned DEFAULT NULL,
  `stack_guildstorage` tinyint unsigned DEFAULT NULL,
  `nouse_override` smallint unsigned DEFAULT NULL,
  `nouse_sitting` tinyint unsigned DEFAULT NULL,
  `trade_override` smallint unsigned DEFAULT NULL,
  `trade_nodrop` tinyint unsigned DEFAULT NULL,
  `trade_notrade` tinyint unsigned DEFAULT NULL,
  `trade_tradepartner` tinyint unsigned DEFAULT NULL,
  `trade_nosell` tinyint unsigned DEFAULT NULL,
  `trade_nocart` tinyint unsigned DEFAULT NULL,
  `trade_nostorage` tinyint unsigned DEFAULT NULL,
  `trade_noguildstorage` tinyint unsigned DEFAULT NULL,
  `trade_nomail` tinyint unsigned DEFAULT NULL,
  `trade_noauction` tinyint unsigned DEFAULT NULL,
  `script` text,
  `equip_script` text,
  `unequip_script` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UniqueAegisName` (`name_aegis`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of item_db
-- ----------------------------

-- ----------------------------
-- Table structure for item_db2
-- ----------------------------
DROP TABLE IF EXISTS `item_db2`;
CREATE TABLE `item_db2` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `name_aegis` varchar(50) DEFAULT NULL,
  `name_english` varchar(100) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `subtype` varchar(20) DEFAULT NULL,
  `price_buy` mediumint unsigned DEFAULT NULL,
  `price_sell` mediumint unsigned DEFAULT NULL,
  `weight` smallint unsigned DEFAULT NULL,
  `attack` smallint unsigned DEFAULT NULL,
  `defense` smallint unsigned DEFAULT NULL,
  `range` tinyint unsigned DEFAULT NULL,
  `slots` tinyint unsigned DEFAULT NULL,
  `job_all` tinyint unsigned DEFAULT NULL,
  `job_acolyte` tinyint unsigned DEFAULT NULL,
  `job_alchemist` tinyint unsigned DEFAULT NULL,
  `job_archer` tinyint unsigned DEFAULT NULL,
  `job_assassin` tinyint unsigned DEFAULT NULL,
  `job_barddancer` tinyint unsigned DEFAULT NULL,
  `job_blacksmith` tinyint unsigned DEFAULT NULL,
  `job_crusader` tinyint unsigned DEFAULT NULL,
  `job_gunslinger` tinyint unsigned DEFAULT NULL,
  `job_hunter` tinyint unsigned DEFAULT NULL,
  `job_knight` tinyint unsigned DEFAULT NULL,
  `job_mage` tinyint unsigned DEFAULT NULL,
  `job_merchant` tinyint unsigned DEFAULT NULL,
  `job_monk` tinyint unsigned DEFAULT NULL,
  `job_ninja` tinyint unsigned DEFAULT NULL,
  `job_novice` tinyint unsigned DEFAULT NULL,
  `job_priest` tinyint unsigned DEFAULT NULL,
  `job_rogue` tinyint unsigned DEFAULT NULL,
  `job_sage` tinyint unsigned DEFAULT NULL,
  `job_soullinker` tinyint unsigned DEFAULT NULL,
  `job_stargladiator` tinyint unsigned DEFAULT NULL,
  `job_supernovice` tinyint unsigned DEFAULT NULL,
  `job_swordman` tinyint unsigned DEFAULT NULL,
  `job_taekwon` tinyint unsigned DEFAULT NULL,
  `job_thief` tinyint unsigned DEFAULT NULL,
  `job_wizard` tinyint unsigned DEFAULT NULL,
  `class_all` tinyint unsigned DEFAULT NULL,
  `class_normal` tinyint unsigned DEFAULT NULL,
  `class_upper` tinyint unsigned DEFAULT NULL,
  `class_baby` tinyint unsigned DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `location_head_top` tinyint unsigned DEFAULT NULL,
  `location_head_mid` tinyint unsigned DEFAULT NULL,
  `location_head_low` tinyint unsigned DEFAULT NULL,
  `location_armor` tinyint unsigned DEFAULT NULL,
  `location_right_hand` tinyint unsigned DEFAULT NULL,
  `location_left_hand` tinyint unsigned DEFAULT NULL,
  `location_garment` tinyint unsigned DEFAULT NULL,
  `location_shoes` tinyint unsigned DEFAULT NULL,
  `location_right_accessory` tinyint unsigned DEFAULT NULL,
  `location_left_accessory` tinyint unsigned DEFAULT NULL,
  `location_costume_head_top` tinyint unsigned DEFAULT NULL,
  `location_costume_head_mid` tinyint unsigned DEFAULT NULL,
  `location_costume_head_low` tinyint unsigned DEFAULT NULL,
  `location_costume_garment` tinyint unsigned DEFAULT NULL,
  `location_ammo` tinyint unsigned DEFAULT NULL,
  `location_shadow_armor` tinyint unsigned DEFAULT NULL,
  `location_shadow_weapon` tinyint unsigned DEFAULT NULL,
  `location_shadow_shield` tinyint unsigned DEFAULT NULL,
  `location_shadow_shoes` tinyint unsigned DEFAULT NULL,
  `location_shadow_right_accessory` tinyint unsigned DEFAULT NULL,
  `location_shadow_left_accessory` tinyint unsigned DEFAULT NULL,
  `weapon_level` tinyint unsigned DEFAULT NULL,
  `armor_level` tinyint unsigned DEFAULT NULL,
  `equip_level_min` tinyint unsigned DEFAULT NULL,
  `equip_level_max` tinyint unsigned DEFAULT NULL,
  `refineable` tinyint unsigned DEFAULT NULL,
  `view` smallint unsigned DEFAULT NULL,
  `alias_name` varchar(50) DEFAULT NULL,
  `flag_buyingstore` tinyint unsigned DEFAULT NULL,
  `flag_deadbranch` tinyint unsigned DEFAULT NULL,
  `flag_container` tinyint unsigned DEFAULT NULL,
  `flag_uniqueid` tinyint unsigned DEFAULT NULL,
  `flag_bindonequip` tinyint unsigned DEFAULT NULL,
  `flag_dropannounce` tinyint unsigned DEFAULT NULL,
  `flag_noconsume` tinyint unsigned DEFAULT NULL,
  `flag_dropeffect` varchar(20) DEFAULT NULL,
  `delay_duration` bigint unsigned DEFAULT NULL,
  `delay_status` varchar(30) DEFAULT NULL,
  `stack_amount` smallint unsigned DEFAULT NULL,
  `stack_inventory` tinyint unsigned DEFAULT NULL,
  `stack_cart` tinyint unsigned DEFAULT NULL,
  `stack_storage` tinyint unsigned DEFAULT NULL,
  `stack_guildstorage` tinyint unsigned DEFAULT NULL,
  `nouse_override` smallint unsigned DEFAULT NULL,
  `nouse_sitting` tinyint unsigned DEFAULT NULL,
  `trade_override` smallint unsigned DEFAULT NULL,
  `trade_nodrop` tinyint unsigned DEFAULT NULL,
  `trade_notrade` tinyint unsigned DEFAULT NULL,
  `trade_tradepartner` tinyint unsigned DEFAULT NULL,
  `trade_nosell` tinyint unsigned DEFAULT NULL,
  `trade_nocart` tinyint unsigned DEFAULT NULL,
  `trade_nostorage` tinyint unsigned DEFAULT NULL,
  `trade_noguildstorage` tinyint unsigned DEFAULT NULL,
  `trade_nomail` tinyint unsigned DEFAULT NULL,
  `trade_noauction` tinyint unsigned DEFAULT NULL,
  `script` text,
  `equip_script` text,
  `unequip_script` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UniqueAegisName` (`name_aegis`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of item_db2
-- ----------------------------

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `account_id` int unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(23) NOT NULL DEFAULT '',
  `user_pass` varchar(32) NOT NULL DEFAULT '',
  `sex` enum('M','F','S') NOT NULL DEFAULT 'M',
  `email` varchar(39) NOT NULL DEFAULT '',
  `group_id` tinyint NOT NULL DEFAULT '0',
  `state` int unsigned NOT NULL DEFAULT '0',
  `unban_time` int unsigned NOT NULL DEFAULT '0',
  `expiration_time` int unsigned NOT NULL DEFAULT '0',
  `logincount` mediumint unsigned NOT NULL DEFAULT '0',
  `lastlogin` datetime DEFAULT NULL,
  `last_ip` varchar(100) NOT NULL DEFAULT '',
  `birthdate` date DEFAULT NULL,
  `character_slots` tinyint unsigned NOT NULL DEFAULT '0',
  `pincode` varchar(4) NOT NULL DEFAULT '',
  `pincode_change` int unsigned NOT NULL DEFAULT '0',
  `vip_time` int unsigned NOT NULL DEFAULT '0',
  `old_group` tinyint NOT NULL DEFAULT '0',
  `web_auth_token` varchar(17) DEFAULT NULL,
  `web_auth_token_enabled` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `web_auth_token_key` (`web_auth_token`),
  KEY `name` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES ('1', 'jnapsdasnlk', 'fqwefdgxcvdwr', 'S', 'athena@athena.com', '0', '0', '0', '0', '128', '2025-07-26 14:20:13', '45.91.133.191', null, '0', '', '0', '0', '0', null, '0');

-- ----------------------------
-- Table structure for mail
-- ----------------------------
DROP TABLE IF EXISTS `mail`;
CREATE TABLE `mail` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `send_name` varchar(30) NOT NULL DEFAULT '',
  `send_id` int unsigned NOT NULL DEFAULT '0',
  `dest_name` varchar(30) NOT NULL DEFAULT '',
  `dest_id` int unsigned NOT NULL DEFAULT '0',
  `title` varchar(45) NOT NULL DEFAULT '',
  `message` varchar(500) NOT NULL DEFAULT '',
  `time` int unsigned NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0',
  `zeny` int unsigned NOT NULL DEFAULT '0',
  `type` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of mail
-- ----------------------------

-- ----------------------------
-- Table structure for mail_attachments
-- ----------------------------
DROP TABLE IF EXISTS `mail_attachments`;
CREATE TABLE `mail_attachments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `index` smallint unsigned NOT NULL DEFAULT '0',
  `nameid` int unsigned NOT NULL DEFAULT '0',
  `amount` int unsigned NOT NULL DEFAULT '0',
  `refine` tinyint unsigned NOT NULL DEFAULT '0',
  `attribute` tinyint unsigned NOT NULL DEFAULT '0',
  `identify` smallint NOT NULL DEFAULT '0',
  `card0` int unsigned NOT NULL DEFAULT '0',
  `card1` int unsigned NOT NULL DEFAULT '0',
  `card2` int unsigned NOT NULL DEFAULT '0',
  `card3` int unsigned NOT NULL DEFAULT '0',
  `option_id0` smallint NOT NULL DEFAULT '0',
  `option_val0` smallint NOT NULL DEFAULT '0',
  `option_parm0` tinyint NOT NULL DEFAULT '0',
  `option_id1` smallint NOT NULL DEFAULT '0',
  `option_val1` smallint NOT NULL DEFAULT '0',
  `option_parm1` tinyint NOT NULL DEFAULT '0',
  `option_id2` smallint NOT NULL DEFAULT '0',
  `option_val2` smallint NOT NULL DEFAULT '0',
  `option_parm2` tinyint NOT NULL DEFAULT '0',
  `option_id3` smallint NOT NULL DEFAULT '0',
  `option_val3` smallint NOT NULL DEFAULT '0',
  `option_parm3` tinyint NOT NULL DEFAULT '0',
  `option_id4` smallint NOT NULL DEFAULT '0',
  `option_val4` smallint NOT NULL DEFAULT '0',
  `option_parm4` tinyint NOT NULL DEFAULT '0',
  `unique_id` bigint unsigned NOT NULL DEFAULT '0',
  `bound` tinyint unsigned NOT NULL DEFAULT '0',
  `enchantgrade` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`index`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of mail_attachments
-- ----------------------------

-- ----------------------------
-- Table structure for mapreg
-- ----------------------------
DROP TABLE IF EXISTS `mapreg`;
CREATE TABLE `mapreg` (
  `varname` varchar(32) NOT NULL,
  `index` int unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`varname`,`index`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of mapreg
-- ----------------------------

-- ----------------------------
-- Table structure for market
-- ----------------------------
DROP TABLE IF EXISTS `market`;
CREATE TABLE `market` (
  `name` varchar(50) NOT NULL DEFAULT '',
  `nameid` int unsigned NOT NULL,
  `price` int unsigned NOT NULL,
  `amount` int NOT NULL,
  `flag` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`,`nameid`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of market
-- ----------------------------

-- ----------------------------
-- Table structure for memo
-- ----------------------------
DROP TABLE IF EXISTS `memo`;
CREATE TABLE `memo` (
  `memo_id` int unsigned NOT NULL AUTO_INCREMENT,
  `char_id` int unsigned NOT NULL DEFAULT '0',
  `map` varchar(11) NOT NULL DEFAULT '',
  `x` smallint unsigned NOT NULL DEFAULT '0',
  `y` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`memo_id`),
  KEY `char_id` (`char_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of memo
-- ----------------------------

-- ----------------------------
-- Table structure for mercenary
-- ----------------------------
DROP TABLE IF EXISTS `mercenary`;
CREATE TABLE `mercenary` (
  `mer_id` int unsigned NOT NULL AUTO_INCREMENT,
  `char_id` int NOT NULL,
  `class` mediumint unsigned NOT NULL DEFAULT '0',
  `hp` int unsigned NOT NULL DEFAULT '0',
  `sp` int unsigned NOT NULL DEFAULT '0',
  `kill_counter` int NOT NULL,
  `life_time` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`mer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of mercenary
-- ----------------------------

-- ----------------------------
-- Table structure for mercenary_owner
-- ----------------------------
DROP TABLE IF EXISTS `mercenary_owner`;
CREATE TABLE `mercenary_owner` (
  `char_id` int NOT NULL,
  `merc_id` int NOT NULL DEFAULT '0',
  `arch_calls` int NOT NULL DEFAULT '0',
  `arch_faith` int NOT NULL DEFAULT '0',
  `spear_calls` int NOT NULL DEFAULT '0',
  `spear_faith` int NOT NULL DEFAULT '0',
  `sword_calls` int NOT NULL DEFAULT '0',
  `sword_faith` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of mercenary_owner
-- ----------------------------

-- ----------------------------
-- Table structure for merchant_configs
-- ----------------------------
DROP TABLE IF EXISTS `merchant_configs`;
CREATE TABLE `merchant_configs` (
  `world_name` varchar(32) NOT NULL,
  `account_id` int unsigned NOT NULL,
  `char_id` int unsigned NOT NULL,
  `store_type` tinyint unsigned NOT NULL DEFAULT '0',
  `data` longtext NOT NULL,
  PRIMARY KEY (`world_name`,`account_id`,`char_id`,`store_type`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of merchant_configs
-- ----------------------------

-- ----------------------------
-- Table structure for mob_db
-- ----------------------------
DROP TABLE IF EXISTS `mob_db`;
CREATE TABLE `mob_db` (
  `id` int unsigned NOT NULL,
  `name_aegis` varchar(24) NOT NULL,
  `name_english` text NOT NULL,
  `name_japanese` text,
  `level` smallint unsigned DEFAULT NULL,
  `hp` int unsigned DEFAULT NULL,
  `sp` mediumint unsigned DEFAULT NULL,
  `base_exp` int unsigned DEFAULT NULL,
  `job_exp` int unsigned DEFAULT NULL,
  `mvp_exp` int unsigned DEFAULT NULL,
  `attack` smallint unsigned DEFAULT NULL,
  `attack2` smallint unsigned DEFAULT NULL,
  `defense` smallint unsigned DEFAULT NULL,
  `magic_defense` smallint unsigned DEFAULT NULL,
  `str` smallint unsigned DEFAULT NULL,
  `agi` smallint unsigned DEFAULT NULL,
  `vit` smallint unsigned DEFAULT NULL,
  `int` smallint unsigned DEFAULT NULL,
  `dex` smallint unsigned DEFAULT NULL,
  `luk` smallint unsigned DEFAULT NULL,
  `attack_range` tinyint unsigned DEFAULT NULL,
  `skill_range` tinyint unsigned DEFAULT NULL,
  `chase_range` tinyint unsigned DEFAULT NULL,
  `size` varchar(24) DEFAULT NULL,
  `race` varchar(24) DEFAULT NULL,
  `racegroup_goblin` tinyint unsigned DEFAULT NULL,
  `racegroup_kobold` tinyint unsigned DEFAULT NULL,
  `racegroup_orc` tinyint unsigned DEFAULT NULL,
  `racegroup_golem` tinyint unsigned DEFAULT NULL,
  `racegroup_guardian` tinyint unsigned DEFAULT NULL,
  `racegroup_ninja` tinyint unsigned DEFAULT NULL,
  `racegroup_gvg` tinyint unsigned DEFAULT NULL,
  `racegroup_battlefield` tinyint unsigned DEFAULT NULL,
  `racegroup_treasure` tinyint unsigned DEFAULT NULL,
  `racegroup_biolab` tinyint unsigned DEFAULT NULL,
  `racegroup_manuk` tinyint unsigned DEFAULT NULL,
  `racegroup_splendide` tinyint unsigned DEFAULT NULL,
  `racegroup_scaraba` tinyint unsigned DEFAULT NULL,
  `racegroup_ogh_atk_def` tinyint unsigned DEFAULT NULL,
  `racegroup_ogh_hidden` tinyint unsigned DEFAULT NULL,
  `racegroup_bio5_swordman_thief` tinyint unsigned DEFAULT NULL,
  `racegroup_bio5_acolyte_merchant` tinyint unsigned DEFAULT NULL,
  `racegroup_bio5_mage_archer` tinyint unsigned DEFAULT NULL,
  `racegroup_bio5_mvp` tinyint unsigned DEFAULT NULL,
  `racegroup_clocktower` tinyint unsigned DEFAULT NULL,
  `racegroup_thanatos` tinyint unsigned DEFAULT NULL,
  `racegroup_faceworm` tinyint unsigned DEFAULT NULL,
  `racegroup_hearthunter` tinyint unsigned DEFAULT NULL,
  `racegroup_rockridge` tinyint unsigned DEFAULT NULL,
  `racegroup_werner_lab` tinyint unsigned DEFAULT NULL,
  `racegroup_temple_demon` tinyint unsigned DEFAULT NULL,
  `racegroup_illusion_vampire` tinyint unsigned DEFAULT NULL,
  `racegroup_malangdo` tinyint unsigned DEFAULT NULL,
  `element` varchar(24) DEFAULT NULL,
  `element_level` tinyint unsigned DEFAULT NULL,
  `walk_speed` smallint unsigned DEFAULT NULL,
  `attack_delay` smallint unsigned DEFAULT NULL,
  `attack_motion` smallint unsigned DEFAULT NULL,
  `damage_motion` smallint unsigned DEFAULT NULL,
  `damage_taken` smallint unsigned DEFAULT NULL,
  `ai` varchar(2) DEFAULT NULL,
  `class` varchar(50) DEFAULT NULL,
  `mode_canmove` tinyint unsigned DEFAULT NULL,
  `mode_looter` tinyint unsigned DEFAULT NULL,
  `mode_aggressive` tinyint unsigned DEFAULT NULL,
  `mode_assist` tinyint unsigned DEFAULT NULL,
  `mode_castsensoridle` tinyint unsigned DEFAULT NULL,
  `mode_norandomwalk` tinyint unsigned DEFAULT NULL,
  `mode_nocast` tinyint unsigned DEFAULT NULL,
  `mode_canattack` tinyint unsigned DEFAULT NULL,
  `mode_castsensorchase` tinyint unsigned DEFAULT NULL,
  `mode_changechase` tinyint unsigned DEFAULT NULL,
  `mode_angry` tinyint unsigned DEFAULT NULL,
  `mode_changetargetmelee` tinyint unsigned DEFAULT NULL,
  `mode_changetargetchase` tinyint unsigned DEFAULT NULL,
  `mode_targetweak` tinyint unsigned DEFAULT NULL,
  `mode_randomtarget` tinyint unsigned DEFAULT NULL,
  `mode_ignoremelee` tinyint unsigned DEFAULT NULL,
  `mode_ignoremagic` tinyint unsigned DEFAULT NULL,
  `mode_ignoreranged` tinyint unsigned DEFAULT NULL,
  `mode_mvp` tinyint unsigned DEFAULT NULL,
  `mode_ignoremisc` tinyint unsigned DEFAULT NULL,
  `mode_knockbackimmune` tinyint unsigned DEFAULT NULL,
  `mode_teleportblock` tinyint unsigned DEFAULT NULL,
  `mode_fixeditemdrop` tinyint unsigned DEFAULT NULL,
  `mode_detector` tinyint unsigned DEFAULT NULL,
  `mode_statusimmune` tinyint unsigned DEFAULT NULL,
  `mode_skillimmune` tinyint unsigned DEFAULT NULL,
  `mvpdrop1_item` varchar(50) DEFAULT NULL,
  `mvpdrop1_rate` smallint unsigned DEFAULT NULL,
  `mvpdrop1_option` varchar(50) DEFAULT NULL,
  `mvpdrop1_index` tinyint unsigned DEFAULT NULL,
  `mvpdrop2_item` varchar(50) DEFAULT NULL,
  `mvpdrop2_rate` smallint unsigned DEFAULT NULL,
  `mvpdrop2_option` varchar(50) DEFAULT NULL,
  `mvpdrop2_index` tinyint unsigned DEFAULT NULL,
  `mvpdrop3_item` varchar(50) DEFAULT NULL,
  `mvpdrop3_rate` smallint unsigned DEFAULT NULL,
  `mvpdrop3_option` varchar(50) DEFAULT NULL,
  `mvpdrop3_index` tinyint unsigned DEFAULT NULL,
  `drop1_item` varchar(50) DEFAULT NULL,
  `drop1_rate` smallint unsigned DEFAULT NULL,
  `drop1_nosteal` tinyint unsigned DEFAULT NULL,
  `drop1_option` varchar(50) DEFAULT NULL,
  `drop1_index` tinyint unsigned DEFAULT NULL,
  `drop2_item` varchar(50) DEFAULT NULL,
  `drop2_rate` smallint unsigned DEFAULT NULL,
  `drop2_nosteal` tinyint unsigned DEFAULT NULL,
  `drop2_option` varchar(50) DEFAULT NULL,
  `drop2_index` tinyint unsigned DEFAULT NULL,
  `drop3_item` varchar(50) DEFAULT NULL,
  `drop3_rate` smallint unsigned DEFAULT NULL,
  `drop3_nosteal` tinyint unsigned DEFAULT NULL,
  `drop3_option` varchar(50) DEFAULT NULL,
  `drop3_index` tinyint unsigned DEFAULT NULL,
  `drop4_item` varchar(50) DEFAULT NULL,
  `drop4_rate` smallint unsigned DEFAULT NULL,
  `drop4_nosteal` tinyint unsigned DEFAULT NULL,
  `drop4_option` varchar(50) DEFAULT NULL,
  `drop4_index` tinyint unsigned DEFAULT NULL,
  `drop5_item` varchar(50) DEFAULT NULL,
  `drop5_rate` smallint unsigned DEFAULT NULL,
  `drop5_nosteal` tinyint unsigned DEFAULT NULL,
  `drop5_option` varchar(50) DEFAULT NULL,
  `drop5_index` tinyint unsigned DEFAULT NULL,
  `drop6_item` varchar(50) DEFAULT NULL,
  `drop6_rate` smallint unsigned DEFAULT NULL,
  `drop6_nosteal` tinyint unsigned DEFAULT NULL,
  `drop6_option` varchar(50) DEFAULT NULL,
  `drop6_index` tinyint unsigned DEFAULT NULL,
  `drop7_item` varchar(50) DEFAULT NULL,
  `drop7_rate` smallint unsigned DEFAULT NULL,
  `drop7_nosteal` tinyint unsigned DEFAULT NULL,
  `drop7_option` varchar(50) DEFAULT NULL,
  `drop7_index` tinyint unsigned DEFAULT NULL,
  `drop8_item` varchar(50) DEFAULT NULL,
  `drop8_rate` smallint unsigned DEFAULT NULL,
  `drop8_nosteal` tinyint unsigned DEFAULT NULL,
  `drop8_option` varchar(50) DEFAULT NULL,
  `drop8_index` tinyint unsigned DEFAULT NULL,
  `drop9_item` varchar(50) DEFAULT NULL,
  `drop9_rate` smallint unsigned DEFAULT NULL,
  `drop9_nosteal` tinyint unsigned DEFAULT NULL,
  `drop9_option` varchar(50) DEFAULT NULL,
  `drop9_index` tinyint unsigned DEFAULT NULL,
  `drop10_item` varchar(50) DEFAULT NULL,
  `drop10_rate` smallint unsigned DEFAULT NULL,
  `drop10_nosteal` tinyint unsigned DEFAULT NULL,
  `drop10_option` varchar(50) DEFAULT NULL,
  `drop10_index` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_aegis` (`name_aegis`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of mob_db
-- ----------------------------

-- ----------------------------
-- Table structure for mob_db2
-- ----------------------------
DROP TABLE IF EXISTS `mob_db2`;
CREATE TABLE `mob_db2` (
  `id` int unsigned NOT NULL,
  `name_aegis` varchar(24) DEFAULT NULL,
  `name_english` text,
  `name_japanese` text,
  `level` smallint unsigned DEFAULT NULL,
  `hp` int unsigned DEFAULT NULL,
  `sp` mediumint unsigned DEFAULT NULL,
  `base_exp` int unsigned DEFAULT NULL,
  `job_exp` int unsigned DEFAULT NULL,
  `mvp_exp` int unsigned DEFAULT NULL,
  `attack` smallint unsigned DEFAULT NULL,
  `attack2` smallint unsigned DEFAULT NULL,
  `defense` smallint unsigned DEFAULT NULL,
  `magic_defense` smallint unsigned DEFAULT NULL,
  `str` smallint unsigned DEFAULT NULL,
  `agi` smallint unsigned DEFAULT NULL,
  `vit` smallint unsigned DEFAULT NULL,
  `int` smallint unsigned DEFAULT NULL,
  `dex` smallint unsigned DEFAULT NULL,
  `luk` smallint unsigned DEFAULT NULL,
  `attack_range` tinyint unsigned DEFAULT NULL,
  `skill_range` tinyint unsigned DEFAULT NULL,
  `chase_range` tinyint unsigned DEFAULT NULL,
  `size` varchar(24) DEFAULT NULL,
  `race` varchar(24) DEFAULT NULL,
  `racegroup_goblin` tinyint unsigned DEFAULT NULL,
  `racegroup_kobold` tinyint unsigned DEFAULT NULL,
  `racegroup_orc` tinyint unsigned DEFAULT NULL,
  `racegroup_golem` tinyint unsigned DEFAULT NULL,
  `racegroup_guardian` tinyint unsigned DEFAULT NULL,
  `racegroup_ninja` tinyint unsigned DEFAULT NULL,
  `racegroup_gvg` tinyint unsigned DEFAULT NULL,
  `racegroup_battlefield` tinyint unsigned DEFAULT NULL,
  `racegroup_treasure` tinyint unsigned DEFAULT NULL,
  `racegroup_biolab` tinyint unsigned DEFAULT NULL,
  `racegroup_manuk` tinyint unsigned DEFAULT NULL,
  `racegroup_splendide` tinyint unsigned DEFAULT NULL,
  `racegroup_scaraba` tinyint unsigned DEFAULT NULL,
  `racegroup_ogh_atk_def` tinyint unsigned DEFAULT NULL,
  `racegroup_ogh_hidden` tinyint unsigned DEFAULT NULL,
  `racegroup_bio5_swordman_thief` tinyint unsigned DEFAULT NULL,
  `racegroup_bio5_acolyte_merchant` tinyint unsigned DEFAULT NULL,
  `racegroup_bio5_mage_archer` tinyint unsigned DEFAULT NULL,
  `racegroup_bio5_mvp` tinyint unsigned DEFAULT NULL,
  `racegroup_clocktower` tinyint unsigned DEFAULT NULL,
  `racegroup_thanatos` tinyint unsigned DEFAULT NULL,
  `racegroup_faceworm` tinyint unsigned DEFAULT NULL,
  `racegroup_hearthunter` tinyint unsigned DEFAULT NULL,
  `racegroup_rockridge` tinyint unsigned DEFAULT NULL,
  `racegroup_werner_lab` tinyint unsigned DEFAULT NULL,
  `racegroup_temple_demon` tinyint unsigned DEFAULT NULL,
  `racegroup_illusion_vampire` tinyint unsigned DEFAULT NULL,
  `racegroup_malangdo` tinyint unsigned DEFAULT NULL,
  `element` varchar(24) DEFAULT NULL,
  `element_level` tinyint unsigned DEFAULT NULL,
  `walk_speed` smallint unsigned DEFAULT NULL,
  `attack_delay` smallint unsigned DEFAULT NULL,
  `attack_motion` smallint unsigned DEFAULT NULL,
  `damage_motion` smallint unsigned DEFAULT NULL,
  `damage_taken` smallint unsigned DEFAULT NULL,
  `ai` varchar(2) DEFAULT NULL,
  `class` varchar(50) DEFAULT NULL,
  `mode_canmove` tinyint unsigned DEFAULT NULL,
  `mode_looter` tinyint unsigned DEFAULT NULL,
  `mode_aggressive` tinyint unsigned DEFAULT NULL,
  `mode_assist` tinyint unsigned DEFAULT NULL,
  `mode_castsensoridle` tinyint unsigned DEFAULT NULL,
  `mode_norandomwalk` tinyint unsigned DEFAULT NULL,
  `mode_nocast` tinyint unsigned DEFAULT NULL,
  `mode_canattack` tinyint unsigned DEFAULT NULL,
  `mode_castsensorchase` tinyint unsigned DEFAULT NULL,
  `mode_changechase` tinyint unsigned DEFAULT NULL,
  `mode_angry` tinyint unsigned DEFAULT NULL,
  `mode_changetargetmelee` tinyint unsigned DEFAULT NULL,
  `mode_changetargetchase` tinyint unsigned DEFAULT NULL,
  `mode_targetweak` tinyint unsigned DEFAULT NULL,
  `mode_randomtarget` tinyint unsigned DEFAULT NULL,
  `mode_ignoremelee` tinyint unsigned DEFAULT NULL,
  `mode_ignoremagic` tinyint unsigned DEFAULT NULL,
  `mode_ignoreranged` tinyint unsigned DEFAULT NULL,
  `mode_mvp` tinyint unsigned DEFAULT NULL,
  `mode_ignoremisc` tinyint unsigned DEFAULT NULL,
  `mode_knockbackimmune` tinyint unsigned DEFAULT NULL,
  `mode_teleportblock` tinyint unsigned DEFAULT NULL,
  `mode_fixeditemdrop` tinyint unsigned DEFAULT NULL,
  `mode_detector` tinyint unsigned DEFAULT NULL,
  `mode_statusimmune` tinyint unsigned DEFAULT NULL,
  `mode_skillimmune` tinyint unsigned DEFAULT NULL,
  `mvpdrop1_item` varchar(50) DEFAULT NULL,
  `mvpdrop1_rate` smallint unsigned DEFAULT NULL,
  `mvpdrop1_option` varchar(50) DEFAULT NULL,
  `mvpdrop1_index` tinyint unsigned DEFAULT NULL,
  `mvpdrop2_item` varchar(50) DEFAULT NULL,
  `mvpdrop2_rate` smallint unsigned DEFAULT NULL,
  `mvpdrop2_option` varchar(50) DEFAULT NULL,
  `mvpdrop2_index` tinyint unsigned DEFAULT NULL,
  `mvpdrop3_item` varchar(50) DEFAULT NULL,
  `mvpdrop3_rate` smallint unsigned DEFAULT NULL,
  `mvpdrop3_option` varchar(50) DEFAULT NULL,
  `mvpdrop3_index` tinyint unsigned DEFAULT NULL,
  `drop1_item` varchar(50) DEFAULT NULL,
  `drop1_rate` smallint unsigned DEFAULT NULL,
  `drop1_nosteal` tinyint unsigned DEFAULT NULL,
  `drop1_option` varchar(50) DEFAULT NULL,
  `drop1_index` tinyint unsigned DEFAULT NULL,
  `drop2_item` varchar(50) DEFAULT NULL,
  `drop2_rate` smallint unsigned DEFAULT NULL,
  `drop2_nosteal` tinyint unsigned DEFAULT NULL,
  `drop2_option` varchar(50) DEFAULT NULL,
  `drop2_index` tinyint unsigned DEFAULT NULL,
  `drop3_item` varchar(50) DEFAULT NULL,
  `drop3_rate` smallint unsigned DEFAULT NULL,
  `drop3_nosteal` tinyint unsigned DEFAULT NULL,
  `drop3_option` varchar(50) DEFAULT NULL,
  `drop3_index` tinyint unsigned DEFAULT NULL,
  `drop4_item` varchar(50) DEFAULT NULL,
  `drop4_rate` smallint unsigned DEFAULT NULL,
  `drop4_nosteal` tinyint unsigned DEFAULT NULL,
  `drop4_option` varchar(50) DEFAULT NULL,
  `drop4_index` tinyint unsigned DEFAULT NULL,
  `drop5_item` varchar(50) DEFAULT NULL,
  `drop5_rate` smallint unsigned DEFAULT NULL,
  `drop5_nosteal` tinyint unsigned DEFAULT NULL,
  `drop5_option` varchar(50) DEFAULT NULL,
  `drop5_index` tinyint unsigned DEFAULT NULL,
  `drop6_item` varchar(50) DEFAULT NULL,
  `drop6_rate` smallint unsigned DEFAULT NULL,
  `drop6_nosteal` tinyint unsigned DEFAULT NULL,
  `drop6_option` varchar(50) DEFAULT NULL,
  `drop6_index` tinyint unsigned DEFAULT NULL,
  `drop7_item` varchar(50) DEFAULT NULL,
  `drop7_rate` smallint unsigned DEFAULT NULL,
  `drop7_nosteal` tinyint unsigned DEFAULT NULL,
  `drop7_option` varchar(50) DEFAULT NULL,
  `drop7_index` tinyint unsigned DEFAULT NULL,
  `drop8_item` varchar(50) DEFAULT NULL,
  `drop8_rate` smallint unsigned DEFAULT NULL,
  `drop8_nosteal` tinyint unsigned DEFAULT NULL,
  `drop8_option` varchar(50) DEFAULT NULL,
  `drop8_index` tinyint unsigned DEFAULT NULL,
  `drop9_item` varchar(50) DEFAULT NULL,
  `drop9_rate` smallint unsigned DEFAULT NULL,
  `drop9_nosteal` tinyint unsigned DEFAULT NULL,
  `drop9_option` varchar(50) DEFAULT NULL,
  `drop9_index` tinyint unsigned DEFAULT NULL,
  `drop10_item` varchar(50) DEFAULT NULL,
  `drop10_rate` smallint unsigned DEFAULT NULL,
  `drop10_nosteal` tinyint unsigned DEFAULT NULL,
  `drop10_option` varchar(50) DEFAULT NULL,
  `drop10_index` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_aegis` (`name_aegis`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of mob_db2
-- ----------------------------

-- ----------------------------
-- Table structure for mob_skill_db
-- ----------------------------
DROP TABLE IF EXISTS `mob_skill_db`;
CREATE TABLE `mob_skill_db` (
  `MOB_ID` smallint NOT NULL,
  `INFO` text NOT NULL,
  `STATE` text NOT NULL,
  `SKILL_ID` smallint NOT NULL,
  `SKILL_LV` tinyint NOT NULL,
  `RATE` smallint NOT NULL,
  `CASTTIME` mediumint NOT NULL,
  `DELAY` int NOT NULL,
  `CANCELABLE` text NOT NULL,
  `TARGET` text NOT NULL,
  `CONDITION` text NOT NULL,
  `CONDITION_VALUE` text,
  `VAL1` mediumint DEFAULT NULL,
  `VAL2` mediumint DEFAULT NULL,
  `VAL3` mediumint DEFAULT NULL,
  `VAL4` mediumint DEFAULT NULL,
  `VAL5` mediumint DEFAULT NULL,
  `EMOTION` text,
  `CHAT` text
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of mob_skill_db
-- ----------------------------

-- ----------------------------
-- Table structure for mob_skill_db2
-- ----------------------------
DROP TABLE IF EXISTS `mob_skill_db2`;
CREATE TABLE `mob_skill_db2` (
  `MOB_ID` smallint NOT NULL,
  `INFO` text NOT NULL,
  `STATE` text NOT NULL,
  `SKILL_ID` smallint NOT NULL,
  `SKILL_LV` tinyint NOT NULL,
  `RATE` smallint NOT NULL,
  `CASTTIME` mediumint NOT NULL,
  `DELAY` int NOT NULL,
  `CANCELABLE` text NOT NULL,
  `TARGET` text NOT NULL,
  `CONDITION` text NOT NULL,
  `CONDITION_VALUE` text,
  `VAL1` mediumint DEFAULT NULL,
  `VAL2` mediumint DEFAULT NULL,
  `VAL3` mediumint DEFAULT NULL,
  `VAL4` mediumint DEFAULT NULL,
  `VAL5` mediumint DEFAULT NULL,
  `EMOTION` text,
  `CHAT` text
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of mob_skill_db2
-- ----------------------------

-- ----------------------------
-- Table structure for ownladder
-- ----------------------------
DROP TABLE IF EXISTS `ownladder`;
CREATE TABLE `ownladder` (
  `guild_id` int NOT NULL,
  `name` varchar(24) NOT NULL DEFAULT '',
  `currentown` int DEFAULT '0',
  `highestown` int DEFAULT '0',
  `owntime` datetime DEFAULT NULL,
  PRIMARY KEY (`guild_id`),
  KEY `highestown` (`highestown`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of ownladder
-- ----------------------------

-- ----------------------------
-- Table structure for party
-- ----------------------------
DROP TABLE IF EXISTS `party`;
CREATE TABLE `party` (
  `party_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(24) NOT NULL DEFAULT '',
  `exp` tinyint unsigned NOT NULL DEFAULT '0',
  `item` tinyint unsigned NOT NULL DEFAULT '0',
  `leader_id` int unsigned NOT NULL DEFAULT '0',
  `leader_char` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`party_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of party
-- ----------------------------

-- ----------------------------
-- Table structure for party_bookings
-- ----------------------------
DROP TABLE IF EXISTS `party_bookings`;
CREATE TABLE `party_bookings` (
  `world_name` varchar(32) NOT NULL,
  `account_id` int unsigned NOT NULL,
  `char_id` int unsigned NOT NULL,
  `char_name` varchar(23) NOT NULL,
  `purpose` smallint unsigned NOT NULL DEFAULT '0',
  `assist` tinyint unsigned NOT NULL DEFAULT '0',
  `damagedealer` tinyint unsigned NOT NULL DEFAULT '0',
  `healer` tinyint unsigned NOT NULL DEFAULT '0',
  `tanker` tinyint unsigned NOT NULL DEFAULT '0',
  `minimum_level` smallint unsigned NOT NULL,
  `maximum_level` smallint unsigned NOT NULL,
  `comment` varchar(255) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`world_name`,`account_id`,`char_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of party_bookings
-- ----------------------------

-- ----------------------------
-- Table structure for pet
-- ----------------------------
DROP TABLE IF EXISTS `pet`;
CREATE TABLE `pet` (
  `pet_id` int unsigned NOT NULL AUTO_INCREMENT,
  `class` mediumint unsigned NOT NULL DEFAULT '0',
  `name` varchar(24) NOT NULL DEFAULT '',
  `account_id` int unsigned NOT NULL DEFAULT '0',
  `char_id` int unsigned NOT NULL DEFAULT '0',
  `level` smallint unsigned NOT NULL DEFAULT '0',
  `egg_id` int unsigned NOT NULL DEFAULT '0',
  `equip` int unsigned NOT NULL DEFAULT '0',
  `intimate` smallint unsigned NOT NULL DEFAULT '0',
  `hungry` smallint unsigned NOT NULL DEFAULT '0',
  `rename_flag` tinyint unsigned NOT NULL DEFAULT '0',
  `incubate` int unsigned NOT NULL DEFAULT '0',
  `autofeed` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`pet_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of pet
-- ----------------------------

-- ----------------------------
-- Table structure for punsuk
-- ----------------------------
DROP TABLE IF EXISTS `punsuk`;
CREATE TABLE `punsuk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `amount` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of punsuk
-- ----------------------------

-- ----------------------------
-- Table structure for punsuk_obt
-- ----------------------------
DROP TABLE IF EXISTS `punsuk_obt`;
CREATE TABLE `punsuk_obt` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `bank_id` varchar(250) NOT NULL,
  `bank_name` varchar(250) NOT NULL,
  `bank_choice` varchar(250) NOT NULL,
  `status` varchar(250) NOT NULL,
  `amount` int unsigned NOT NULL,
  `added_time` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of punsuk_obt
-- ----------------------------

-- ----------------------------
-- Table structure for pvpladder
-- ----------------------------
DROP TABLE IF EXISTS `pvpladder`;
CREATE TABLE `pvpladder` (
  `char_id` int NOT NULL,
  `name` varchar(24) NOT NULL DEFAULT '',
  `streaks` int DEFAULT '0',
  `kills` int DEFAULT '0',
  `deaths` int DEFAULT '0',
  `streaktime` datetime DEFAULT NULL,
  PRIMARY KEY (`char_id`),
  KEY `kills` (`kills`),
  KEY `streaks` (`streaks`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of pvpladder
-- ----------------------------

-- ----------------------------
-- Table structure for quest
-- ----------------------------
DROP TABLE IF EXISTS `quest`;
CREATE TABLE `quest` (
  `char_id` int unsigned NOT NULL DEFAULT '0',
  `quest_id` int unsigned NOT NULL,
  `state` enum('0','1','2') NOT NULL DEFAULT '0',
  `time` int unsigned NOT NULL DEFAULT '0',
  `count1` mediumint unsigned NOT NULL DEFAULT '0',
  `count2` mediumint unsigned NOT NULL DEFAULT '0',
  `count3` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_id`,`quest_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of quest
-- ----------------------------

-- ----------------------------
-- Table structure for sales
-- ----------------------------
DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nameid` int unsigned NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `amount` int NOT NULL,
  `rentalTime` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of sales
-- ----------------------------

-- ----------------------------
-- Table structure for sales_limited_acc
-- ----------------------------
DROP TABLE IF EXISTS `sales_limited_acc`;
CREATE TABLE `sales_limited_acc` (
  `sales_id` int NOT NULL,
  `account_id` int NOT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`sales_id`,`account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of sales_limited_acc
-- ----------------------------

-- ----------------------------
-- Table structure for sc_data
-- ----------------------------
DROP TABLE IF EXISTS `sc_data`;
CREATE TABLE `sc_data` (
  `account_id` int unsigned NOT NULL,
  `char_id` int unsigned NOT NULL,
  `type` smallint unsigned NOT NULL,
  `tick` bigint NOT NULL,
  `val1` int NOT NULL DEFAULT '0',
  `val2` int NOT NULL DEFAULT '0',
  `val3` int NOT NULL DEFAULT '0',
  `val4` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of sc_data
-- ----------------------------

-- ----------------------------
-- Table structure for skill
-- ----------------------------
DROP TABLE IF EXISTS `skill`;
CREATE TABLE `skill` (
  `char_id` int unsigned NOT NULL DEFAULT '0',
  `id` smallint unsigned NOT NULL DEFAULT '0',
  `lv` tinyint unsigned NOT NULL DEFAULT '0',
  `flag` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of skill
-- ----------------------------

-- ----------------------------
-- Table structure for skillcooldown
-- ----------------------------
DROP TABLE IF EXISTS `skillcooldown`;
CREATE TABLE `skillcooldown` (
  `account_id` int unsigned NOT NULL,
  `char_id` int unsigned NOT NULL,
  `skill` smallint unsigned NOT NULL DEFAULT '0',
  `tick` bigint NOT NULL,
  PRIMARY KEY (`char_id`,`skill`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of skillcooldown
-- ----------------------------

-- ----------------------------
-- Table structure for skill_homunculus
-- ----------------------------
DROP TABLE IF EXISTS `skill_homunculus`;
CREATE TABLE `skill_homunculus` (
  `homun_id` int NOT NULL,
  `id` int NOT NULL,
  `lv` smallint NOT NULL,
  PRIMARY KEY (`homun_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of skill_homunculus
-- ----------------------------

-- ----------------------------
-- Table structure for storage
-- ----------------------------
DROP TABLE IF EXISTS `storage`;
CREATE TABLE `storage` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int unsigned NOT NULL DEFAULT '0',
  `nameid` int unsigned NOT NULL DEFAULT '0',
  `amount` smallint unsigned NOT NULL DEFAULT '0',
  `equip` int unsigned NOT NULL DEFAULT '0',
  `identify` smallint unsigned NOT NULL DEFAULT '0',
  `refine` tinyint unsigned NOT NULL DEFAULT '0',
  `attribute` tinyint unsigned NOT NULL DEFAULT '0',
  `card0` int unsigned NOT NULL DEFAULT '0',
  `card1` int unsigned NOT NULL DEFAULT '0',
  `card2` int unsigned NOT NULL DEFAULT '0',
  `card3` int unsigned NOT NULL DEFAULT '0',
  `option_id0` smallint NOT NULL DEFAULT '0',
  `option_val0` smallint NOT NULL DEFAULT '0',
  `option_parm0` tinyint NOT NULL DEFAULT '0',
  `option_id1` smallint NOT NULL DEFAULT '0',
  `option_val1` smallint NOT NULL DEFAULT '0',
  `option_parm1` tinyint NOT NULL DEFAULT '0',
  `option_id2` smallint NOT NULL DEFAULT '0',
  `option_val2` smallint NOT NULL DEFAULT '0',
  `option_parm2` tinyint NOT NULL DEFAULT '0',
  `option_id3` smallint NOT NULL DEFAULT '0',
  `option_val3` smallint NOT NULL DEFAULT '0',
  `option_parm3` tinyint NOT NULL DEFAULT '0',
  `option_id4` smallint NOT NULL DEFAULT '0',
  `option_val4` smallint NOT NULL DEFAULT '0',
  `option_parm4` tinyint NOT NULL DEFAULT '0',
  `expire_time` int unsigned NOT NULL DEFAULT '0',
  `bound` tinyint unsigned NOT NULL DEFAULT '0',
  `unique_id` bigint unsigned NOT NULL DEFAULT '0',
  `enchantgrade` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of storage
-- ----------------------------

-- ----------------------------
-- Table structure for tharakan_monster
-- ----------------------------
DROP TABLE IF EXISTS `tharakan_monster`;
CREATE TABLE `tharakan_monster` (
  `char_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(30) NOT NULL DEFAULT '',
  `monster` varchar(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tharakan_monster
-- ----------------------------

-- ----------------------------
-- Table structure for tharakan_monster2
-- ----------------------------
DROP TABLE IF EXISTS `tharakan_monster2`;
CREATE TABLE `tharakan_monster2` (
  `char_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(30) NOT NULL DEFAULT '',
  `monster` varchar(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tharakan_monster2
-- ----------------------------

-- ----------------------------
-- Table structure for user_configs
-- ----------------------------
DROP TABLE IF EXISTS `user_configs`;
CREATE TABLE `user_configs` (
  `world_name` varchar(32) NOT NULL,
  `account_id` int unsigned NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`world_name`,`account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of user_configs
-- ----------------------------

-- ----------------------------
-- Table structure for vendings
-- ----------------------------
DROP TABLE IF EXISTS `vendings`;
CREATE TABLE `vendings` (
  `id` int unsigned NOT NULL,
  `account_id` int unsigned NOT NULL,
  `char_id` int unsigned NOT NULL,
  `sex` enum('F','M') NOT NULL DEFAULT 'M',
  `map` varchar(20) NOT NULL,
  `x` smallint unsigned NOT NULL,
  `y` smallint unsigned NOT NULL,
  `title` varchar(80) NOT NULL,
  `body_direction` char(1) NOT NULL DEFAULT '4',
  `head_direction` char(1) NOT NULL DEFAULT '0',
  `sit` char(1) NOT NULL DEFAULT '1',
  `extended_vending_item` int unsigned NOT NULL DEFAULT '0',
  `autotrade` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of vendings
-- ----------------------------

-- ----------------------------
-- Table structure for vending_items
-- ----------------------------
DROP TABLE IF EXISTS `vending_items`;
CREATE TABLE `vending_items` (
  `vending_id` int unsigned NOT NULL,
  `index` smallint unsigned NOT NULL,
  `cartinventory_id` int unsigned NOT NULL,
  `amount` smallint unsigned NOT NULL,
  `price` int unsigned NOT NULL,
  PRIMARY KEY (`vending_id`,`index`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of vending_items
-- ----------------------------

-- ----------------------------
-- Table structure for vip_storage
-- ----------------------------
DROP TABLE IF EXISTS `vip_storage`;
CREATE TABLE `vip_storage` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int unsigned NOT NULL DEFAULT '0',
  `nameid` int unsigned NOT NULL DEFAULT '0',
  `amount` smallint unsigned NOT NULL DEFAULT '0',
  `equip` int unsigned NOT NULL DEFAULT '0',
  `identify` smallint unsigned NOT NULL DEFAULT '0',
  `refine` tinyint unsigned NOT NULL DEFAULT '0',
  `attribute` tinyint unsigned NOT NULL DEFAULT '0',
  `card0` int unsigned NOT NULL DEFAULT '0',
  `card1` int unsigned NOT NULL DEFAULT '0',
  `card2` int unsigned NOT NULL DEFAULT '0',
  `card3` int unsigned NOT NULL DEFAULT '0',
  `option_id0` smallint unsigned NOT NULL DEFAULT '0',
  `option_val0` smallint unsigned NOT NULL DEFAULT '0',
  `option_parm0` tinyint unsigned NOT NULL DEFAULT '0',
  `option_id1` smallint unsigned NOT NULL DEFAULT '0',
  `option_val1` smallint unsigned NOT NULL DEFAULT '0',
  `option_parm1` tinyint unsigned NOT NULL DEFAULT '0',
  `option_id2` smallint unsigned NOT NULL DEFAULT '0',
  `option_val2` smallint unsigned NOT NULL DEFAULT '0',
  `option_parm2` tinyint unsigned NOT NULL DEFAULT '0',
  `option_id3` smallint unsigned NOT NULL DEFAULT '0',
  `option_val3` smallint unsigned NOT NULL DEFAULT '0',
  `option_parm3` tinyint unsigned NOT NULL DEFAULT '0',
  `option_id4` smallint unsigned NOT NULL DEFAULT '0',
  `option_val4` smallint unsigned NOT NULL DEFAULT '0',
  `option_parm4` tinyint unsigned NOT NULL DEFAULT '0',
  `expire_time` int unsigned NOT NULL DEFAULT '0',
  `bound` tinyint unsigned NOT NULL DEFAULT '0',
  `unique_id` bigint unsigned NOT NULL DEFAULT '0',
  `enchantgrade` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of vip_storage
-- ----------------------------

-- ----------------------------
-- Table structure for world_boss
-- ----------------------------
DROP TABLE IF EXISTS `world_boss`;
CREATE TABLE `world_boss` (
  `id` int NOT NULL,
  `char_id` int NOT NULL,
  `wavekills` int NOT NULL DEFAULT '0',
  `damage` int NOT NULL DEFAULT '0',
  `item1` varchar(23) DEFAULT NULL,
  `amount1` varchar(23) DEFAULT NULL,
  `received1` int NOT NULL DEFAULT '0',
  `item2` varchar(23) DEFAULT NULL,
  `amount2` varchar(23) DEFAULT NULL,
  `received2` int NOT NULL DEFAULT '0',
  `timetick` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of world_boss
-- ----------------------------

-- ----------------------------
-- Table structure for world_boss_guild
-- ----------------------------
DROP TABLE IF EXISTS `world_boss_guild`;
CREATE TABLE `world_boss_guild` (
  `id` int NOT NULL,
  `guild_id` int NOT NULL,
  `damage` int NOT NULL DEFAULT '0',
  `item` varchar(50) DEFAULT NULL,
  `amount` varchar(50) DEFAULT NULL,
  `received` int NOT NULL DEFAULT '0',
  `timetick` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of world_boss_guild
-- ----------------------------

-- ----------------------------
-- Table structure for world_boss_state
-- ----------------------------
DROP TABLE IF EXISTS `world_boss_state`;
CREATE TABLE `world_boss_state` (
  `id` int NOT NULL,
  `mapname` varchar(255) NOT NULL,
  `mapindex` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of world_boss_state
-- ----------------------------
