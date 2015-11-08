# ************************************************************
# Sequel Pro SQL dump
# Version 4499
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.5.38)
# Database: Network_DB
# Generation Time: 2015-11-08 19:59:18 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table friends
# ------------------------------------------------------------

DROP TABLE IF EXISTS `friends`;

CREATE TABLE `friends` (
  `user` varchar(16) DEFAULT NULL,
  `friend` varchar(16) DEFAULT NULL,
  KEY `user` (`user`(6)),
  KEY `friend` (`friend`(6))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;

INSERT INTO `friends` (`user`, `friend`)
VALUES
	('tom','andrew'),
	('jeff','andrew'),
	('andrew','gf'),
	('jeff','gf'),
	('timmy','gf'),
	('tom','gf'),
	('ff','andrew'),
	('gf','andrew'),
	('ar','rf'),
	('as','rf'),
	('asdf','rf'),
	('bb','rf'),
	('eee','rf'),
	('ff','rf'),
	('fff','rf');

/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table members
# ------------------------------------------------------------

DROP TABLE IF EXISTS `members`;

CREATE TABLE `members` (
  `user` varchar(16) DEFAULT NULL,
  `pass` varchar(512) DEFAULT NULL,
  KEY `user` (`user`(6))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;

INSERT INTO `members` (`user`, `pass`)
VALUES
	('jeff','$2y$10$qI.4WA6ky2zbEnXRPaTGH.aktsi0Ct..ffNqHwIPtoKJx5AYXr8V2'),
	('tom','$2y$10$R5b3K9V7HGsdk6RoAcg4RO.Xlv9R5lnkmRaL/sYuziOTfPWjh.Ah.'),
	('andrew','02e0a999c50b1f88df7a8f5a04e1b76b35ea6a88'),
	('timmy','714f0731d7ff4ac3de2e9dfd7cf7ba1c4cb79cfa'),
	('gf','4ebb4595eab529e499b9b866707a956aee2bf4ab'),
	('ff','ed70c57d7564e994e7d5f6fd6967cea8b347efbc'),
	('fred','31017a722665e4afce586950f42944a6d331dabf'),
	('ar','23d8e0156062165ca3736e9f1e364d414e1d82d5'),
	('t','8efd86fb78a56a5145ed7739dcb00c78581c5375'),
	('tt','8c1017982b2032cc059203e3d83dd0ee2e7a86b3'),
	('tp','903a0bf658baaaa89463ba893c88ae9c0be5a9bb'),
	('bb','9a900f538965a426994e1e90600920aff0b4e8d2'),
	('fff','f6949a8c7d5b90b4a698660bbfb9431503fbb995'),
	('as','df211ccdd94a63e0bcb9e6ae427a249484a49d60'),
	('jj','7323a5431d1c31072983a6a5bf23745b655ddf59'),
	('asdf','3da541559918a808c2402bba5012f6c60b27661c'),
	('eee','637a81ed8e8217bb01c15c67c39b43b0ab4e20f1'),
	('sdaf','sdaf'),
	('rf','22ee0097135072451429b5ac45630d52779cd49b'),
	('jjj','c84c766f873ecedf75aa6cf35f1e305e095fec83');

/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table messages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `auth` varchar(16) DEFAULT NULL,
  `recip` varchar(16) DEFAULT NULL,
  `pm` char(1) DEFAULT NULL,
  `time` int(10) unsigned DEFAULT NULL,
  `message` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `auth` (`auth`(6)),
  KEY `recip` (`recip`(6))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;

INSERT INTO `messages` (`id`, `auth`, `recip`, `pm`, `time`, `message`)
VALUES
	(1,'andrew','andrew','0',1446950200,'Hello there!'),
	(2,'gf','andrew','1',1446955331,'Test'),
	(3,'fred','tom','0',1447000376,'Hi Tom!'),
	(4,'rf','tom','0',1447008516,'Hi Tom! nice to meet you!');

/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table profiles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `profiles`;

CREATE TABLE `profiles` (
  `user` varchar(16) DEFAULT NULL,
  `text` varchar(4096) DEFAULT NULL,
  KEY `user` (`user`(6))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;

INSERT INTO `profiles` (`user`, `text`)
VALUES
	('andrew','Just here to Help People out!');

/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
