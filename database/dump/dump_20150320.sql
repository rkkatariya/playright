-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: playright
-- ------------------------------------------------------
-- Server version	5.6.23-log

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
-- Table structure for table `pr_cvg_data`
--

DROP TABLE IF EXISTS `pr_cvg_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pr_cvg_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `News_Date` date DEFAULT NULL,
  `Newspaper` varchar(255) DEFAULT NULL,
  `Headline` varchar(255) DEFAULT NULL,
  `Edition` varchar(255) DEFAULT NULL,
  `Supplement` varchar(255) DEFAULT NULL,
  `Source` varchar(255) DEFAULT NULL,
  `Page_No` int(11) DEFAULT NULL,
  `Height` int(11) DEFAULT NULL,
  `Width` int(11) DEFAULT NULL,
  `Total_Article_Size` int(11) DEFAULT NULL,
  `Circulation_Figure` int(11) DEFAULT NULL,
  `Quantitative_AVE` decimal(12,2) DEFAULT NULL,
  `Image_Exists` varchar(5) DEFAULT NULL,
  `Journalist_Factor` int(11) NOT NULL,
  `Language` varchar(255) DEFAULT NULL,
  `Image` blob,
  PRIMARY KEY (`id`),
  KEY `Page_No_index` (`Page_No`),
  KEY `Height_index` (`Height`),
  KEY `Width_index` (`Width`),
  KEY `Total_Article_Size_index` (`Total_Article_Size`),
  KEY `Circulation_Figure_index` (`Circulation_Figure`),
  KEY `Journalist_Factor_index` (`Journalist_Factor`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pr_cvg_data`
--

LOCK TABLES `pr_cvg_data` WRITE;
/*!40000 ALTER TABLE `pr_cvg_data` DISABLE KEYS */;
INSERT INTO `pr_cvg_data` VALUES (1,'2014-06-13','Bartaman','Kabaddi IPL','Kolkata',NULL,'Bureau',9,9,8,72,461462,156600.00,'Y',5,'English',NULL),(2,'2014-06-13','Dainik Statesman','Corporation will encourage kabaddi league','Kolkata',NULL,'Bureau',5,9,8,72,0,127764.00,'N',3,'English',NULL),(3,'2014-06-13','Hindustan Times','AKSHAY MAY BUY KABADDI TEAM SOON\n','Chandigarh','HT Chandigarh','Bureau',1,5,7,35,30000,85995.00,'N',2,'English',NULL),(4,'2014-06-13','Hindustan Times','AKSHAY MAY BUY KABADDITEAM SOON','Kolkata','HTCity','Bureau',1,8,8,64,107000,88857.60,'N',4,'English',NULL),(5,'2014-06-14','The Times of India','\nBoost to sporting enthusiasts, stadiums opened\n','Chennai',NULL,'Bureau',2,10,25,250,255000,873750.00,'N',1,'English',NULL),(6,'2014-06-16','www.dnaindia.com','Akshay Kumar buys a Kabbadi team!','Internet',NULL,'Bureau',0,0,0,0,0,10000.00,'Y',5,'Hindi',NULL),(7,'2014-06-17','DNA','AKSHAY BUYS A KABADDI TEAM!','Ahmedabad','After hrs','Bureau',1,7,6,42,157000,25200.00,'Y',1,'Hindi',NULL),(8,'2014-06-17','DNA','Akshay buys a Kabbadi team!\n','Mumbai','DNA After hrs.','Bureau',1,13,10,130,414000,2418000.00,'Y',5,'English',NULL),(9,'2014-06-17','DNA','Akshay buys a Kabbadi team!\n','Pune',NULL,'Bureau',1,10,10,100,80000,499200.00,'Y',4,'Marathi',NULL),(10,'2014-06-17','www.bollywoodlife.com','Akshay Kumar buys a team for World Kabaddi League','Internet',NULL,'Bureau',0,0,0,0,0,10000.00,'Y',4,'English',NULL),(11,'2014-06-17','www.hindustantimes.com','Abhishek Bachchan visits Jaipur in new role as kabbadi promoter','Internet',NULL,'Bureau',0,0,0,0,0,10000.00,'Y',3,'English',NULL),(12,'2014-06-18','Dainik Tribune','Akshay Kumar jumping in a field of Kabaddi','Delhi',NULL,'Bureau',10,15,15,225,30000,87750.00,'N',2,'English',NULL),(13,'2014-06-18','Dainik Tribune','Akshay Kumar lends glamour to kabaddi, buys a team','Chandigarh',NULL,'Bureau',10,11,12,132,30000,51480.00,'N',3,'English',NULL),(14,'2014-06-18','The Free Press Journal','Sports on Abhishek\'s mind','Mumbai',NULL,'Bureau',16,12,13,156,85000,93600.00,'N',4,'English',NULL),(15,'2014-06-18','Yashobhoomi','Abhishek Bachchan meets Raje, discusses Kabaddi league','Mumbai',NULL,'Bureau',10,5,12,60,10000,2340.00,'N',5,'Hindi',NULL),(16,'2014-06-19','ianslive.in','SPECIAL: Bollywood stars with a sports connection','Internet',NULL,'Bureau',0,0,0,0,0,10000.00,'N',1,'Hindi',NULL),(17,'2014-06-19','indiatimes.com','Abhishek Bachchan Gets Serious About Kabaddi','Internet',NULL,'Bureau',0,0,0,0,0,10000.00,'Y',3,'English',NULL),(18,'2014-06-19','indiatimes.com','Abhishek Bachchan Gets Serious About Kabaddi','Internet',NULL,'Bureau',0,0,0,0,0,10000.00,'Y',4,'English',NULL),(19,'2014-06-19','Lokmat','Akshay Kumar buys a Kabbadi team! ','Pune','Hello Pune','Bureau',5,12,12,144,0,71280.00,'N',5,'Marathi',NULL),(20,'2014-06-19','www.bangaloremirror.com','Kal, hug aur kal','Internet',NULL,'Bureau',0,0,0,0,0,10000.00,'N',3,'English',NULL),(21,'2014-06-19','www.mid-day.com','Beyond cricket: Bollywood celebs now back other sports','Internet',NULL,'Bureau',NULL,0,0,0,0,10000.00,'N',2,'English',NULL),(22,'2014-06-19','www.sportskeeda.com','India\'s celebrities finally start backing sports other than cricket\n','Internet',NULL,'Bureau',0,0,0,0,0,10000.00,'N',4,'English',NULL),(23,'2014-06-20','Absolute India','\nHu tu tu\'s\ngoing\nplaces','Mumbai',NULL,'Bureau',2,13,1,13,0,7020.00,'N',1,'English',NULL),(24,'2014-06-21','Deccan Chronicle','Pro kabaddi league set for big splash','Bangalore',NULL,'Bureau',13,21,4,84,250000,239148.00,'N',5,'Kannada',NULL),(25,'2014-06-21','The Hindu','\nAn air of excitement among players\n','Bangalore',NULL,'Bureau',18,11,12,132,100000,720720.00,'N',1,'Kannada',NULL),(26,'2014-06-21','The Times of India','Kabaddi\'s second coming','Bangalore',NULL,'Bureau',28,25,12,300,517568,2106000.00,'N',5,'Kannada',NULL),(27,'2014-06-23','The Hindu','\nThe kabbadi juggernaut gets going\n','Bangalore','Metro plus','ASHWIN ACHAL',4,24,25,600,100000,3276000.00,'N',4,'Kannada',NULL),(28,'2014-06-23','udayavanienglish.com','Pro Kabaddi League Launches #KabaddiStaminaChallenge On Facebook','Internet',NULL,'Bureau',0,0,0,0,0,10000.00,'N',4,'English',NULL),(29,'2014-06-24','Aapla Mahanagar','Abhishek love kabbadi','Mumbai',NULL,'Bureau',12,14,16,224,40000,34944.00,'N',3,'English',NULL),(30,'2014-06-24','Navakaal','Abhishek Bachchan Gets Serious About Kabaddi','Mumbai',NULL,'Bureau',5,10,12,120,127908,9360.00,'Y',2,'English',NULL),(31,'2014-06-25','in.yahoo.com','Pro Kabaddi League 2014: Exclusive interview with Bengaluru Bulls captain Manjit Chillar','Internet',NULL,'Bureau',NULL,0,0,0,0,10000.00,'Y',3,'English',NULL),(32,'2014-06-25','Screen','Serious about Kabaddi','Mumbai',NULL,'Bureau',62,15,25,375,10000,14625.00,'Y',4,'English',NULL),(33,'2014-06-26','business-standard.com','Pro Kabaddi league: Surjeet Singh to lead Bengal Warriors','Internet',NULL,'Bureau',0,0,0,0,0,10000.00,'Y',5,'English',NULL),(34,'2014-06-26','indiablooms.com','Big Bazaar unveils Kolkata Pro Kabaddi Team','Internet',NULL,'Bureau',0,0,0,0,0,10000.00,'Y',1,'English',NULL),(35,'2014-06-26','www.ptinews.com','Kolkata kabaddi franchise unveils team','Internet',NULL,'Bureau',0,0,0,0,0,10000.00,'Y',3,'English',NULL),(36,'2014-06-26','www.sportskeeda.com','Pro Kabaddi League 2014: Exclusive interview with Bengaluru Bulls captain Manjit Chillar','Internet',NULL,'Bureau',0,0,0,0,0,10000.00,'Y',4,'English',NULL),(37,'2014-06-27','Dainik Jagran','Kolkatas kabaddi team','Kolkata',NULL,'Bureau',4,10,14,140,220000,98280.00,'Y',2,'English',NULL);
/*!40000 ALTER TABLE `pr_cvg_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pr_entity_matrix`
--

DROP TABLE IF EXISTS `pr_entity_matrix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pr_entity_matrix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Commodity` varchar(255) NOT NULL,
  `Headline` int(11) DEFAULT '0',
  `Image` int(11) DEFAULT '0',
  `Article` int(11) DEFAULT '0',
  `Journalist_Factor` int(11) DEFAULT '0',
  `pr_cvg_data_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Headline_index` (`Headline`),
  KEY `Image_index` (`Image`),
  KEY `Article_index` (`Article`),
  KEY `Journalist_Factor_index` (`Journalist_Factor`),
  KEY `FK_COV_DATA_ID_idx` (`pr_cvg_data_id`),
  CONSTRAINT `FK_COV_DATA_ID` FOREIGN KEY (`pr_cvg_data_id`) REFERENCES `pr_cvg_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pr_entity_matrix`
--

LOCK TABLES `pr_entity_matrix` WRITE;
/*!40000 ALTER TABLE `pr_entity_matrix` DISABLE KEYS */;
INSERT INTO `pr_entity_matrix` VALUES (1,'Star Sports',0,1,4,5,1),(2,'Jaipur Pink Panthers',1,1,3,5,1),(3,'U Mumba',1,1,4,5,1),(4,'Pro Kabaddi League',0,1,5,5,1),(5,'Navneeth Gautham',0,1,2,5,1),(6,'U Mumba',0,2,4,NULL,2),(7,'Star Sports',1,0,1,NULL,2),(9,'Star Sports',0,2,0,0,33),(10,'Jaipur Pink Panthers',0,1,0,0,33),(11,'U Mumba',1,0,0,0,33),(12,'Pro Kabaddi League',0,0,1,0,33),(13,'Navneeth Gautham',2,0,1,0,33),(14,'U Mumba',1,2,3,0,34);
/*!40000 ALTER TABLE `pr_entity_matrix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pr_keyword`
--

DROP TABLE IF EXISTS `pr_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pr_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) NOT NULL,
  `is_deleted` varchar(255) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pr_keyword`
--

LOCK TABLES `pr_keyword` WRITE;
/*!40000 ALTER TABLE `pr_keyword` DISABLE KEYS */;
INSERT INTO `pr_keyword` VALUES (1,'Star Sports','N'),(2,'Jaipur Pink Panthers','N'),(3,'U Mumba','N'),(4,'Pro Kabaddi League','N'),(5,'Navneeth Gautham','N'),(6,'KW 003','Y'),(8,'New Keyword','Y');
/*!40000 ALTER TABLE `pr_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pr_settings`
--

DROP TABLE IF EXISTS `pr_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pr_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `status` varchar(32) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pr_settings`
--

LOCK TABLES `pr_settings` WRITE;
/*!40000 ALTER TABLE `pr_settings` DISABLE KEYS */;
INSERT INTO `pr_settings` VALUES (1,'FACTOR_HEADLINE','7','A'),(2,'FACTOR_IMAGE','5','A'),(3,'FACTOR_ARTICLE','2','A');
/*!40000 ALTER TABLE `pr_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `First_Name` varchar(255) DEFAULT NULL,
  `Address1` varchar(255) DEFAULT NULL,
  `Address2` varchar(255) DEFAULT NULL,
  `Address3` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `State` varchar(255) DEFAULT NULL,
  `Zip` varchar(255) DEFAULT NULL,
  `Country` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'rahulkk','Rahul','Katariya',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'rahulkk@yahoo.com',NULL,'katariya');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-20 11:12:35
