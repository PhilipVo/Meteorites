-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: stardatedb
-- ------------------------------------------------------
-- Server version	5.5.49-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` longtext,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` bigint(255) NOT NULL,
  `message_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_posts_users_idx` (`user_id`),
  KEY `fk_comments_messages1_idx` (`message_id`),
  CONSTRAINT `fk_comments_messages1` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_posts_users0` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `diameter` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'2016 NT38',28936636,545,'2016-09-06 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(2,'2016 PL1',46001504,1008,'2016-09-06 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(3,'2016 PR39',4407131,82,'2016-09-06 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(4,'2005 CL',21223324,518,'2016-09-06 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(5,'2013 RM21',37850972,113,'2016-09-06 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(6,'2015 YT',27528768,41,'2016-09-06 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(7,'2016 EK156',29610618,68,'2016-09-06 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(8,'2016 JN',16184071,121,'2016-09-06 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(9,'2016 PD1',5541774,97,'2016-09-06 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(10,'2016 PP26',29972022,264,'2016-09-06 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(11,'2004 BO41',9290529,1563,'2016-09-07 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(12,'2003 YP1',29135318,259,'2016-09-07 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(13,'2016 GD135',14461070,399,'2016-09-07 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(14,'2016 QB11',824229,41,'2016-08-31 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(15,'2000 VA45',38998940,1242,'2016-08-31 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(16,'2004 QA22',32253112,16,'2016-08-31 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(17,'2010 XX72',22270998,248,'2016-08-31 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(18,'2012 ES14',29466540,594,'2016-08-31 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(19,'2014 MX',44519412,90,'2016-08-31 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(20,'2015 JR1',28633170,36,'2016-08-31 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(21,'2016 PT',23024044,475,'2016-09-01 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(22,'2016 PU',14587868,277,'2016-09-01 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(23,'2016 PT38',7489235,112,'2016-09-01 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(24,'1999 YR14',5187339,900,'2016-09-01 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(25,'2012 GE',37542800,26,'2016-09-01 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(26,'2013 SN24',17232766,59,'2016-09-01 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(27,'2016 CO248',18808034,19,'2016-09-01 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(28,'2016 PE1',22074044,169,'2016-09-02 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(29,'2016 QA11',9608751,65,'2016-09-02 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(30,'2002 NP1',32797888,1795,'2016-09-02 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(31,'1998 SO',26151238,451,'2016-09-02 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(32,'2011 JV10',33684704,7,'2016-09-02 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(33,'2015 HB177',29809040,71,'2016-09-02 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(34,'2016 QZ1',5368976,157,'2016-09-02 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(35,'2016 PT8',6221500,94,'2016-09-03 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(36,'2012 PN',11417797,68,'2016-09-03 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(37,'2014 YS',45194424,75,'2016-09-03 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(38,'2016 CX247',41327448,179,'2016-09-03 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(39,'2016 PD2',4473076,70,'2016-09-03 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(40,'2001 QL142',38627364,1637,'2016-09-03 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(41,'2002 AE9',39406800,942,'2016-09-03 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(42,'2009 ES',4497115,472,'2016-09-03 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(43,'2009 SM',34786940,784,'2016-09-03 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07'),(44,'2012 YK',37459244,149,'2016-09-03 13:30:07','2016-09-01 13:30:07','2016-09-01 13:30:07');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` longtext,
  `location` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` bigint(255) NOT NULL,
  `event_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_posts_users_idx` (`user_id`),
  KEY `fk_posts_events1_idx` (`event_id`),
  CONSTRAINT `fk_posts_events1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_posts_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (107580133031457,'Donna Alacchdaaeabe Bushakstein','2016-08-31 22:54:34','2016-08-31 22:54:34');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_has_events`
--

DROP TABLE IF EXISTS `users_has_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_has_events` (
  `user_id` bigint(255) NOT NULL,
  `event_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`event_id`),
  KEY `fk_users_has_events_events1_idx` (`event_id`),
  KEY `fk_users_has_events_users1_idx` (`user_id`),
  CONSTRAINT `fk_users_has_events_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_events_events1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_has_events`
--

LOCK TABLES `users_has_events` WRITE;
/*!40000 ALTER TABLE `users_has_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_has_events` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-02  1:54:13
