CREATE TABLE IF NOT EXISTS `web_news` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(24) NOT NULL DEFAULT 'UPDATE',
  `title` varchar(180) NOT NULL,
  `summary` varchar(500) NOT NULL DEFAULT '',
  `content` text NULL,
  `published` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`), KEY `published_created` (`published`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO `web_news` (`category`,`title`,`summary`) VALUES
('PROMOTION','Welcome to JUTI','เตรียมรับของรางวัลและกิจกรรมสำหรับผู้เล่นใหม่'),
('EVENT','Weekly Arena','รวมทีมแข่งขัน PvP และกิจกรรมหมุนเวียนประจำสัปดาห์'),
('UPDATE','Server Development','ติดตามการพัฒนา ปรับสมดุล และระบบใหม่ของเซิร์ฟเวอร์');
