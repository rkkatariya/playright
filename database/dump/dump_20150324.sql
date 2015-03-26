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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pr_cvg_data`
--

LOCK TABLES `pr_cvg_data` WRITE;
/*!40000 ALTER TABLE `pr_cvg_data` DISABLE KEYS */;
INSERT INTO `pr_cvg_data` VALUES (1,'2014-06-13','Bartaman','Kabaddi IPL','Kolkata',NULL,'Bureau',9,9,8,72,461462,156600.00,'Y',5,'English',NULL),(2,'2014-06-13','Dainik Statesman','Corporation will encourage kabaddi league','Kolkata',NULL,'Bureau',5,9,8,72,0,127764.00,'N',3,'English',NULL),(3,'2014-06-13','Hindustan Times','AKSHAY MAY BUY KABADDI TEAM SOON\n','Chandigarh','HT Chandigarh','Bureau',1,5,7,35,30000,85995.00,'N',2,'English',NULL),(4,'2014-06-13','Hindustan Times','AKSHAY MAY BUY KABADDITEAM SOON','Kolkata','HTCity','Bureau',1,8,8,64,107000,88857.60,'N',4,'English',NULL),(5,'2014-06-14','The Times of India','\nBoost to sporting enthusiasts, stadiums opened\n','Chennai',NULL,'Bureau',2,10,25,250,255000,873750.00,'N',1,'English',NULL),(6,'2014-06-16','www.dnaindia.com','Akshay Kumar buys a Kabbadi team!','Internet',NULL,'Bureau',0,0,0,0,0,10000.00,'Y',5,'Hindi',NULL),(7,'2014-06-17','DNA','AKSHAY BUYS A KABADDI TEAM!','Ahmedabad','After hrs','Bureau',1,7,6,42,157000,25200.00,'Y',1,'Hindi',NULL),(8,'2014-06-17','DNA','Akshay buys a Kabbadi team!\n','Mumbai','DNA After hrs.','Bureau',1,13,10,130,414000,2418000.00,'Y',5,'English',NULL),(9,'2014-06-17','DNA','Akshay buys a Kabbadi team!\n','Pune',NULL,'Bureau',1,10,10,100,80000,499200.00,'Y',4,'Marathi',NULL),(10,'2014-06-17','www.bollywoodlife.com','Akshay Kumar buys a team for World Kabaddi League','Internet',NULL,'Bureau',0,0,0,0,0,10000.00,'Y',4,'English',NULL),(11,'2014-06-17','www.hindustantimes.com','Abhishek Bachchan visits Jaipur in new role as kabbadi promoter','Internet',NULL,'Bureau',0,0,0,0,0,10000.00,'Y',3,'English',NULL),(12,'2014-06-18','Dainik Tribune','Akshay Kumar jumping in a field of Kabaddi','Delhi',NULL,'Bureau',10,15,15,225,30000,87750.00,'N',2,'English',NULL),(13,'2014-06-18','Dainik Tribune','Akshay Kumar lends glamour to kabaddi, buys a team','Chandigarh',NULL,'Bureau',10,11,12,132,30000,51480.00,'N',3,'English',NULL),(14,'2014-06-18','The Free Press Journal','Sports on Abhishek\'s mind','Mumbai',NULL,'Bureau',16,12,13,156,85000,93600.00,'N',4,'English',NULL),(15,'2014-06-18','Yashobhoomi','Abhishek Bachchan meets Raje, discusses Kabaddi league','Mumbai',NULL,'Bureau',10,5,12,60,10000,2340.00,'N',5,'Hindi',NULL),(16,'2014-06-19','ianslive.in','SPECIAL: Bollywood stars with a sports connection','Internet',NULL,'Bureau',0,0,0,0,0,10000.00,'N',1,'Hindi',NULL),(17,'2014-06-19','indiatimes.com','Abhishek Bachchan Gets Serious About Kabaddi','Internet',NULL,'Bureau',0,0,0,0,0,10000.00,'Y',3,'English',NULL),(18,'2014-06-19','indiatimes.com','Abhishek Bachchan Gets Serious About Kabaddi','Internet',NULL,'Bureau',0,0,0,0,0,10000.00,'Y',4,'English',NULL),(19,'2014-06-19','Lokmat','Akshay Kumar buys a Kabbadi team! ','Pune','Hello Pune','Bureau',5,12,12,144,0,71280.00,'N',5,'Marathi',NULL),(20,'2014-06-19','www.bangaloremirror.com','Kal, hug aur kal','Internet',NULL,'Bureau',0,0,0,0,0,10000.00,'N',3,'English',NULL),(21,'2014-06-19','www.mid-day.com','Beyond cricket: Bollywood celebs now back other sports','Internet',NULL,'Bureau',NULL,0,0,0,0,10000.00,'N',2,'English',NULL),(22,'2014-06-19','www.sportskeeda.com','India\'s celebrities finally start backing sports other than cricket\n','Internet',NULL,'Bureau',0,0,0,0,0,10000.00,'N',4,'English',NULL),(23,'2014-06-20','Absolute India','\nHu tu tu\'s\ngoing\nplaces','Mumbai',NULL,'Bureau',2,13,1,13,0,7020.00,'N',1,'English',NULL),(24,'2014-06-21','Deccan Chronicle','Pro kabaddi league set for big splash','Bangalore',NULL,'Bureau',13,21,4,84,250000,239148.00,'N',5,'Kannada',NULL),(25,'2014-06-21','The Hindu','\nAn air of excitement among players\n','Bangalore',NULL,'Bureau',18,11,12,132,100000,720720.00,'N',1,'Kannada',NULL),(26,'2014-06-21','The Times of India','Kabaddi\'s second coming','Bangalore',NULL,'Bureau',28,25,12,300,517568,2106000.00,'N',5,'Kannada',NULL),(27,'2014-06-23','The Hindu','\nThe kabbadi juggernaut gets going\n','Bangalore','Metro plus','ASHWIN ACHAL',4,24,25,600,100000,3276000.00,'N',4,'Kannada',NULL),(28,'2014-06-23','udayavanienglish.com','Pro Kabaddi League Launches #KabaddiStaminaChallenge On Facebook','Internet',NULL,'Bureau',0,0,0,0,0,10000.00,'N',4,'English',NULL),(29,'2014-06-24','Aapla Mahanagar','Abhishek love kabbadi','Mumbai',NULL,'Bureau',12,14,16,224,40000,34944.00,'N',3,'English',NULL),(30,'2014-06-24','Navakaal','Abhishek Bachchan Gets Serious About Kabaddi','Mumbai',NULL,'Bureau',5,10,12,120,127908,9360.00,'Y',2,'English',NULL),(31,'2014-06-25','in.yahoo.com','Pro Kabaddi League 2014: Exclusive interview with Bengaluru Bulls captain Manjit Chillar','Internet',NULL,'Bureau',NULL,0,0,0,0,10000.00,'Y',3,'English',NULL),(32,'2014-06-25','Screen','Serious about Kabaddi','Mumbai',NULL,'Bureau',62,15,25,375,10000,14625.00,'Y',4,'English',NULL),(33,'2014-06-26','business-standard.com','Pro Kabaddi league: Surjeet Singh to lead Bengal Warriors','Internet',NULL,'Bureau',0,0,0,0,0,10000.00,'Y',5,'English',NULL),(34,'2014-06-26','indiablooms.com','Big Bazaar unveils Kolkata Pro Kabaddi Team','Internet',NULL,'Bureau',0,0,0,0,0,10000.00,'Y',1,'English',NULL),(35,'2014-06-26','www.ptinews.com','Kolkata kabaddi franchise unveils team','Internet',NULL,'Bureau',0,0,0,0,0,10000.00,'Y',3,'English',NULL),(36,'2014-06-26','www.sportskeeda.com','Pro Kabaddi League 2014: Exclusive interview with Bengaluru Bulls captain Manjit Chillar','Internet',NULL,'Bureau',0,0,0,0,0,10000.00,'Y',4,'English',NULL),(37,'2014-06-27','Dainik Jagran','Kolkatas kabaddi team','Kolkata',NULL,'Bureau',4,10,14,140,220000,98280.00,'Y',2,'English',NULL),(58,'2015-03-21','times','india','bangalore','','',NULL,NULL,NULL,NULL,NULL,12.00,'Y',1,'English','����\0JFIF\0\0`\0`\0\0���Exif\0\0MM\0*\0\0\0\0;\0\0\0\0\0\0J�i\0\0\0\0\0\0P��\0\0\0\0\0\0��\0\0\0\0\0\0>\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Rahul\0\0�\0\0\0\0\0\0��\0\0\0\0\0\0���\0\0\0\079\0\0��\0\0\0\079\0\0�\0\0\0\0\0�\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\02015:03:16 16:14:57\02015:03:16 16:14:57\0\0\0R\0a\0h\0u\0l\0\0\0��http://ns.adobe.com/xap/1.0/\0<?xpacket begin=\'﻿\' id=\'W5M0MpCehiHzreSzNTczkc9d\'?>\r\n<x:xmpmeta xmlns:x=\"adobe:ns:meta/\"><rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"><rdf:Description rdf:about=\"uuid:faf5bdd5-ba3d-11da-ad31-d33d75182f1b\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\"/><rdf:Description rdf:about=\"uuid:faf5bdd5-ba3d-11da-ad31-d33d75182f1b\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\"><xmp:CreateDate>2015-03-16T16:14:57.785</xmp:CreateDate></rdf:Description><rdf:Description rdf:about=\"uuid:faf5bdd5-ba3d-11da-ad31-d33d75182f1b\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\"><dc:creator><rdf:Seq xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"><rdf:li>Rahul</rdf:li></rdf:Seq>\r\n			</dc:creator></rdf:Description></rdf:RDF></x:xmpmeta>\r\n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                            <?xpacket end=\'w\'?>��\0C\0\n\n		\n\Z\'!%\".\"%()+,+\Z /3/*2\'*+*��\0C\n	\n***************************************************��\0\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0�\nxS÷>�g��4�e�O��G����Ƥ�H�޵�\0�\r����O�\0��\0�����t���\0襭�Ɲ8r-K��,Dқ��}�o�C|1�\0B��\0�1�4���4����\0���*��;�[���}���\0�7��.i?��\0G�!��\0�sI�\0����٢�g���G�����o�C|1�\0B��\0�1�5��ȅ����x��\0���G?���\0=��p�[���}��H��V$����Z\ZG�4Io&Y4m=��v�P��y�D?�S����KE�\0����O�{8v��?���K�x_ð�����b�Yl��~��/��$t���Nh538͙\"Ks����y�p9�T�Ѥ�]QK1<\09<\Z��x��etѯrH+9���I�=F}���\\�����O��1��9=������f&��n!��|�Q�<������1��s\\�,n�{��K(`�Y���b\nI�`tⵛ��#\\�E��s�DOMߟ�?���F�g��9�o>\\��w��O���v�ӏ�|�\\�7�7?��������o�\0<#�\0�e��\0��\0���g��9�o>\\��w��O��ᑼ�5�t[ϗ9�D������xgk`����\0X����#��-������,V��)�AD`�Tuܽ9���;���g��9�o>\\��w��O��ᙢ������6�v�����a�����	��� ��`���_5��S�Yv����:lKv4�{��9����48*������֠���Ժ��}����/K%��m.�s��+{`�t��g��9�o>\\��w��O��ᑼ�5�t[ϗ9�D������xg��y������\0#�f�$`��^s�\0?��[�.|<��R^���Ƹ�)���	��M�\\ck���Ү�on%Ԭ4h��ٸXd�v�W�D1���c�������s��|��\"\'�������#x3�k�跟.s����������x\\����,�[Y������`���n��Ԯ�����a��Ob]|��\nJ�`�ֱ��nuK��-\"�	&w�?-F�,H\n�ox�s����q=7~t�����#\\�E��s�DOMߟ�?���t�,ew��2�76�my�}��������xG�\0|\n>�o�\0<#�\0�t\r���s��|��\"\'�������#x3�k�跟.s���������ζ�w�1��k��>��\0�m�\0����b��1NZr#r���������m��<F�΋y��8����?�O���<E7!���-�6�\r�F�N0ݎ9�Ko��\n���*�z˱��4,�.擄�������%�;Q�p��Oj��9�`�U�G�� }@���g��9�o>\\��w��O��ᑼ�5�t[ϗ9�D������xfcO��x����e�[�_��?�[����(�-�������7�<F�΋y��8����?�O�����s��|��\"\'�������:[����������y�Q_��ڇ�~\r�\0�A�\0�m���Z٬o�\0ȋ��\0�6��\0E-l��S�����\0x���\00��*�`��(\0���\0R��IQ�����z\0�Hԧ���V���\0�׬��k6�)���U���\0�����\'�Z\0��%XmVGݵ\\�Ks�ri�-Ѵ�;In�%q�vZ�!H���©1�<����bY�\'���0��dj�v��j7Ma{w���gl--^lJ�1(�A�~f��rE&솕�\0�4tZ������.<�2&	&��#�S�?�l/�\Z������.<�2&	&��#�S�?�l/�r���$������������y�q�r�Pv��l/$P,�|2J�Y�ߛ�[iћKg�7	w+`o1~f��rET������/��Q����_������2�� ��E-g�~�m7�Ze��o���(dl�,�?��\nrII�L[qM�2C�\"�^�)��\0�L��H��_ׯ�}�\0���(���O�hs,Z�򬌞c,6�LcN���S�:�́�曩��G�\Z!yt�̏�g��}��\0�G�ն\'�m���[��sI��\nj��}+��\ZU����,墘*�Un�m���`y���63{i���K�Gih��:<�w��U���B�ۀ��7v�������U���t�\07�z����Hh��ӟ2?8}��I�G�\0=�V؟�ޛ�x�H�n����y��36ݖ�~�,9>��k��lf��Q��B��&�-�ty��2	�A�c��\"��gk�����k6��Zo�l��DqH@&,�vm�������z_��ܿ��������N�S�^���l�U\"H����{�©��6\nx�[w�e{��A}j��\"Y�gB���C\0G�\0����izV�w�/Q�\'�O����\"��2�B�k1*O��\'Q��kt�W�U���SF��_?+���{Sz_�����z���ҵ�\ri�\ZkO*F��T�@z�e �+F���0�Ci��V�_رu�g;.w.��I�]������v�5�_Մ�!đs���_���\0���Hq$\\�/���>�\0��BK[�t�\r�jz��ZY�2�0\'�\0I�\0��2�:��<7���w�����\\�ç>�$��*ۼ�YT`@�F#u ��k:X����\Z�^8�+69!I$�$��ӷ�p{�QE��Ί(��?�O���\0\".��\0`����X�\r�\0�A�\0�m���Zٯ���/C����S��aEU��EPQ�����z����K����\0�O�G�-�?��\0�Y?��l?�S����KE�\0����O����?��+^	��Py�����?1Xڜ�\r��+�\"�,�p\0穫�k�N�mfچ�ej.��{�O8��2~c���x�1*��z���x�1*��z���U�5�3IhU�m,���p���?5������j\ZΙ����6�F���E�����]�d�\n\0�\'����L0����P\'����L0����S�	�8Ĩs�9��#��Dd�\'��a�?/מ�ר����d����:|���?�\0�bT9���\0���bT9���\0�����zV��.���؛����X���]�d�\n����ú\r�[������\"���e�2H�<�P��#�J�=0Þ��?1@�#�J�=0Þ��?1Y���A�K7����V�h�]Ƣ��2~l�t�3U�_�t���5�3M��z�yy,˜d ��y��`4��bT9���\0���bT9���\0��ʾ����-fԼC�Y�y�m%��q���̄��9�Z�w�h���}���%�٦�D��I����pO�%C��a�O���O�%C��a�O����@�q�P�s��G�*7���&O��Î~_�=G�Q������t�O��B\0	�8Ĩs�9��#�	�8Ĩs�9��#����l��BG���w1�=I��(�x�1*��z���x�1*��z���>�\0�Ί(��?�O���\0\".��\0`����X�\r�\0�A�\0�m���Zٯ���/C����S��aEU��EPQ�����z����K����\0�O�G�-�?��\0�Y?��l?�S����KE�\0����O���9�MgG��r���޹�WP���o��CCl������9�Ē�S,(�s�?�d�88���\0�T��V�?��I��\r;?���\\G��_Mou�{HE���y�tH�rZ?�rx�$��E.�0�8�������?8�|���(�����UK޽��\0���}�y[���\0�L��u������;8�}�w����h���4�&1�AL�fH��ӧ�}����$�.3����o���J<�Ǔ��/��N�H{�����P��H���5r��\n޼���ú6�i�z��#��L��*)��� ��\0y��YE$�V����m�W_։~����6�÷:E�����f���q�QCp�g�����9S��}JЭ��z�J��ْ�Q�?�\0��Φ��)��Qv�C���:E���>&mT��x,�PBV�	F#�?1��\r�����PZj��>-�m���a���͙L� ?y�h�Q�p:��M]4�\0��\0�kGu�Z��gxv+�</�Ũ��q�ĳ�� \r��5�Er|�l�ǖ)2A�\"�8N�)��\0�_L�fH��ӧ�}���(�#^xoO��.�˝.��J���H�T��_0�7!q���k�VW@����A �Z(Z+y���\0![�����aEP3�:(��8��>��o�����m�\0�R��cx7�D]����\0�)kf������|_��OW��QVsQ@G?���\0=�J��-�{��C��?�ʴ�_�����d�kY��\0�O�G�-�?��\0�Y?����\0���\0렭x!��C�p?�{���d��\0����\nڇ�B}(\0D1��c�q���(D1��c�q���)�Pb$�t�\0�\nb$�t�\0�\n}\0�C�:aG?�~B���$����|���=z{dX�Hq$\\�/���>�\0��@\0 �c �L(���P �c �L(���W1�kf�A�v�Ko�[U��c;�\0�6�>��#�+7��v\Z��5�������DK�#0�r�y��?u���a��i^�r��\\���_��܈\"�H1�\n8���\"�H1�\n8����C��7�!�G��ŵ�?h��7Εs�\\���9�Hc����1�������\0~�s��Ү~낱�Ñ�#5R�o~��v��>������\0�G��\"�H1�\n8���\"�H1�\n8����C��7�!�G��ŵ�?h��7Εs�\\���9��ó]\\x_K�Q]�gN`�(g��76���\0\"y���\0$�\0R��!�D�0����?!@�!�D�0����?!O�����1t:���E%�H?u*�\0/�8�OO�z��ȱL��H��_ׯ�}�\0���\0A�\"A��Q�O���A�\"A��Q�O�������u�&�º\Z]��쵭<\\��Hm��Y�ݵ��+��eI�[)���\"Io-�\\y@�!1�?\n����\0!=����XD1��c�q���(D1��c�q���)�P3�:(��8��>��o�����m�\0�R��cx7�D]����\0�)kf������|_��OW��QVsQ@G?���\0=�J��-�{��C��?�ʴ�_�����d�kY��\0�O�G�-�?��\0�Y?��A��?��+j�	��K�\0�Q�\0�AZ�D�J�A�g������\0��`�F0_�Y���~���\n�`��7����}M\0>�`�F0_�Y���~���\n�`��7����}M\0>�!đs���_���\0��\0�F0_�Y���~���x\0�4�?i����A���OW�օ����N�� ���M����q���-���jg���,�������n�y-�)�U�\n�`��7����}M�~=dooa���\0��h�^��6���^������Cyw��(�4m/VhU�m/Z���M�!�������hB�/Ǭ����?_S@�F0_�Y���~���*�\Z6��4\r�鶗�n�d&�����]�����L����#{{����!Q���F�������L����#{{����!Q���F�������$8�.q�����������#{{����o\0C����#s����:�\0^@+��:F�sƩ�Y^�ls��#D}T�$~~�!Q���F������B�/Ǭ����?_S@��!Q���F������B�/Ǭ����?_S@QE�������E��o�\0���k���\"�?�\r��\0�K[5����;��\0�*z��(����(��\0*9�\0Է��RTs�\0�o�ހ<��)���U���\0�����\'�Z͇�J�?�ih���7�z��ր6��i4��;0U!������+\Z��k�N�L}KP�-#D���Ho$��f2�#�G��)~V��r\ro��\0����\n�Q�Ε��2jPH��d�q$^b��oC����Rwj�j��Tr�����k���m��mF!ir�byD����/��+ey9�{y�l���偶������x1<�]��H�_�����]v��}#Zx���ɍCɞHw�z��oO�+�F��}#Zx���ɍCɞHw�z��oO�+�U-om/�o�k��t����?�����j~\Z�/�Wd�V�M\"�2SZ���\0UQ�\0����rm�RaL�fH��ӧ�}����$�.3����o���J9ۣX�����j�!�L����������p[x*r=h��F�..��2^YY��/-m���5�L�o_$a��Ts�V���+Z�Q��|wi�%���mN���H�����N�𦕩�+z�r,1v���J��eǚ:�~���+i��\0������Ø^%מ\Z���oue���U�-࿖6yJe�6���\0I�n��z��ey�]��\0e��]��W/\0i����7��.����[����[Q���_CsgG�Ԯm1s�H���\0OJ~��M#UX���\"�C������0`eS�9`{Ӗ���6�\0���Q���~��O�s���&�^�^Xo[j1K���%�ʹ��|��[+��5�x~�mO�Ze�����)�\\tf@O�jW��F��5���\Z��<�����0ޟ�6WڵUU*\0��\0�Si�e���_q6zy/���Ţ�*J\nd�2E�p��>S��о� ̑q�?�O���� ��9�K�]R��5�����;�wv���� �MY\Z�4���O���6�Ŷ�qld�D���������FI\'�=hZF���B��/��\01h��|gEW��\'�~\r�\0�A�\0�m���Z٬o�\0ȋ��\0�6��\0E-l��S�����\0x���\00��*�`��(\0���\0R��IQ�����z\0�Hԧ���V���\0�׬��k6�)���U���\0�����\'�Z\0߿�\0U�t�m��_��=���S�{ē���<�8I#R����Z�}�j:��qm����-?I�PY`�)V�2Vܭ��E�;I���E��\ZWv_�O��l1��?P�����O�~���/==��S���W�_6��I��}�T�qG\'�$�B��|���n�9��6�������	4�o�[꘎(��HB>�o�y|���?xb������������\0��\04w\"6��^z{{~��\0��?|�����ߩ��MQ���4�Kg���h������^�I�ي-I]����B�����>؊H�̃3��S���{���K�$��e�z�����C~���/==��S�F��s��Ooo��c�񤚅��6�a��X�x����s�썷�c��B��>������hW�6����k�����4{�m;R(��񙔎��$�E����6��^z{{~��\0��?|�����ߩ��5�j���@��5;O���t�lSs�\0)&�=v�r0Efx�^�4�ZXl�/-m���tO��ጻ�8eb��0���eI���ܮL_3����w6��^z{{~��\0��?|�����ߩ��{�������~��\ra�C�4�����\'��%տv<����w�k����m/P�I�%����O:I��#�V���ݬs��)�.�O�?�5������F��s��Ooo��`����B�����>��_�|E�iz��H��-�LGry�L$!z��<�v�c��1]v���\0k�\Z~����e�s����\r�֩Ŧ���\0��u�����؍�?|�����ߩ��RF�d��~�������=�X�Hq$\\�/���>�\0��D�l1��?P�����O�~���/==��S�?Ɠx��W��O�Y�F��F��GK\'�$�K-�,T.��]e��q�[M�s�+��\02p\0�\0}(Z��\0_ւz;�c��~�y�����l6��^z{{~������E�������E��o�\0���k���\"�?�\r��\0�K[5����;��\0�*z��(����(��\0*9�\0Է��RTs�\0�o�ހ<��)���U���\0�����\'�Z͇�J�?�ih���7�z��ր6��u��ͼ��Jv1^�G�K��j�{a$��f�6����|�ܭ��6\n�a�����\0����\n׀K�Θ������ǧ&�c�^��d6ח�`��U�dQ48��+`���\'�K������L�YʶL�&�g��l���Xd����C�>��\0_�zr/t>�C����ǧ\'��}��}������.�AV���n�8�@���T�T��%�.��}������^2�}p������NM�i�L��H��_ׯ�}�\0���	xˡ��o��=9���d?:���7M���׎Gq�6��W���mR{S�f���\ZZ����N\\	�|1�Z��hqk~�������խ��J��v��v���q�Z\0K�]��{�1���e���������M���o�i���E��5m%Y�l��Ԃ��lOЎ��sM�<+�|n���	�[k��h�ڢ�W܍�onSi��5��e���������K�]��{�1���������e��Ww�ZGh�.�N�η\\�&ެ@8e��\'�v��K�Cmyy�l,�[&E@3��r�\0��]�2pkp	xˡ��o��=9\0���\\!����cӓ}�\0����}�o������Լ!i~�m�/4�-���dȢhqnV�8+��N\rm�V���n�8�@���T�R�/t>�C����ǧ �C�>��\0_�zr\0�d�E�2��~S��?�\0K�]��{�1��n\'�!�Ѝ�\06�m�?^�r;�@3����\0k:��-�h-\Z0�)�A,��Ԍ�S�Zv�Ekm���F��T�R�/t>�C����ǧ �C�>��\0_�zr\0�)�K�]��{�1���e���������|mEW��\'�~\r�\0�A�\0�m���Z٬o�\0ȋ��\0�6��\0E-l��S�����\0x���\00��*�`��(\0���\0R��IQ�����z\0�Hԧ���V���\0�׬��k6�)���U���\0�����\'�Z\0�����R����Y�%�/������\\Z��l���Y7�J��?�l�ݎ>SZ\Z�f[/-[av��A��~�B��z�zw�`�}Ȓ���\n��S�]�7��򦓽����\0կ����.W��z����g\ZåE�K��]�՗~Ȕ�.�������5�iw��=��\0\"+�t�����J�����1��	��$��@��l;�k��;�<�����;O���]�[D�F����o���/��\Z��ܿ[��E%2A�\"�8N�)��\0�_L�fH��ӧ�}���_�~,����)�Kxn�+7�u�>T(���9��A��i5���X���~�i�z_���ݾ��!V]���\\����Ծ1���.�+�7N�ѹ�kx�)�RY��!X��9\0I�x*�Z���Ht�,m\"1*����\n��9m��}��b��������\0�7��-M��賁 �a�\\_��nP�cR��1���67��k �G�#�.�>���ֆ��I���a��!<\0p����������V6�^���F!�i�{��\0L�؈�1��ۦ)�υ�[��9�}SO����Q\r����/ݓ�>@�\0�29��ݻ���\0�%_K����\0��Xn���2_�k�Gio%���r��;��\\,JU�a��e��q��Z����k��/�aw�V]�\"R����,wc����S�:���^Yj�Y��Y-�����ʀ�\r�������A�G{��U���F=5Z�4�Ė�v�v͇z�q���p�4���/������Z�\0ח�\0m�m���Ǫ��z�\0���I��2�έT6p��}�����%�5�U���ngm���W6�L�fH��ӧ�}����$�.3����o���J9���þԦ�-��,����|�P��r��\'�@	���Ԟ�f���B�}h��5�Z��),�d�	��������8mm\"� E�8�@��\0\0p\0����rZ(���E�������E��o�\0���k���\"�?�\r��\0�K[5����;��\0�*z��(����(��\0*9�\0Է��RTs�\0�o�ހ<��)���U���\0�����\'�Z͇�J�?�ih���7�z��ր7��\0�G�\0]k�e�S�L`����C׌��\0�Q�\0�A[P�\0�O�\0\0��Q��{}!���ez�Ϸ����>�\0`2�A�>��_�z�/D�s���������ez�Ϸ����E#K�A�������zdsߧ��,S$8�.q�������\0^2�=p�����^\0e�(��}������\'^���n�ȓK��+뤷{��5��s\0ws�U#�H��߉.�u)���6=B[KQyv$��vDK	�6�;\0�r��u�����2�A�>��_�z�/D�s��������%f_�G��� �	��d��v���l�s���;G�����/�#�|z�K�g2\\�;`}�6|������XP������-v���\05��(2�A�>��_�z�/D�s��������%f_�G��� �	��d��v���l�s���;G�����CO���m�\\D��ު� �F����y\n��������\\9����C׀x� �ßoo��=x}�0x� �ßoo��=x�F�̃1�����O����O�X�Hq$\\�/���>�\0��@\0�ez�Ϸ����\0��Q��{}!����]��+�ԴmB�w���BQY��v����&�m��Fi��\r^2�=p�����^\0e�(��}�������R�:(��8��>��o�����m�\0�R��|gEz�̹R\\������*JXݷ���\0���(�������������\0Q�\'�\0l}�E|gEڟ������\0Q�\'�\0l}�Q�����z�ފ?�?���\0����?�O����ԧ���V���\0�׬��k�\n(������\0\0?�_���\0�?�c���\0�Q�\0�A[P�\0�O�|mEڟ������\0Q�\'�\0l}�E|gEڟ������\0Q�\'�\0l}�E|gEڟ������\0Q�\'�\0l}�L��H��_ׯ�}�\0�������S����\0�\0Q�#�\0$�\0폪|_c��	���i�N ���S{z��`�@X�9瓌z\Z�Y�5�ծu\rX����Y\\��΢��țP�ǚ�)ۜ�W˔Q����?�`�\0Q���\'g��}5?�5=,��ѳ�&ҡ���l��Rſd�[y��eN���\n\'𦧥��\Z6r��T:\\�m���X��B�o?�l�۞>a_2�M�׼w�__/7�X���m��O�y/���j\njzY�g*M�C����]<��~�T*����ʝ�����Z|zN�g�@KGi@��!T(�U���j�ێ�~�^l_�\"���o�z{�fQ_�S������\0�\0�_���\0�?�c��d�E�2��~S��?�|mEڟ������\0Q�\'�\0l}9�\0Z��HՍ��0j��&�$\Z��0��y���XǪ���uV��ge\r�fFXcTI\ZF r�K1�$�޾9���������E�\0�����\0�>̢�3�����?��\0Q�#�\0$�\0킊(�� ��');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pr_entity_matrix`
--

LOCK TABLES `pr_entity_matrix` WRITE;
/*!40000 ALTER TABLE `pr_entity_matrix` DISABLE KEYS */;
INSERT INTO `pr_entity_matrix` VALUES (1,'Star Sports',0,1,4,5,1),(2,'Jaipur Pink Panthers',1,1,3,5,1),(3,'U Mumba',1,1,4,5,1),(4,'Pro Kabaddi League',0,1,5,5,1),(5,'Navneeth Gautham',0,1,2,5,1),(6,'U Mumba',0,2,4,NULL,2),(7,'Star Sports',1,0,1,NULL,2),(9,'Star Sports',0,2,0,0,33),(10,'Jaipur Pink Panthers',0,1,0,0,33),(11,'U Mumba',1,0,0,0,33),(12,'Pro Kabaddi League',0,0,1,0,33),(13,'Navneeth Gautham',2,0,1,0,33),(14,'U Mumba',1,2,3,0,34),(15,'Jaipur Pink Panthers',2,4,1,0,36),(16,'wfreee',0,0,0,0,34);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pr_keyword`
--

LOCK TABLES `pr_keyword` WRITE;
/*!40000 ALTER TABLE `pr_keyword` DISABLE KEYS */;
INSERT INTO `pr_keyword` VALUES (1,'Star Sports','N'),(2,'Jaipur Pink Panthers','N'),(3,'U Mumba','N'),(4,'Pro Kabaddi League','N'),(5,'Navneeth Gautham','N'),(6,'KW 003','Y'),(8,'New Keyword','Y'),(9,'wfreee','Y');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pr_settings`
--

LOCK TABLES `pr_settings` WRITE;
/*!40000 ALTER TABLE `pr_settings` DISABLE KEYS */;
INSERT INTO `pr_settings` VALUES (1,'FACTOR_HEADLINE','5','A'),(2,'FACTOR_IMAGE','7','A'),(3,'FACTOR_ARTICLE','2','A'),(4,'EMAIL_HOST','smtp.gmail.com','A'),(5,'EMAIL_PORT','587','A'),(6,'EMAIL_FROM','playrightreports@gmail.com','A'),(7,'EMAIL_PASSWORD','mynewpassword','A');
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

-- Dump completed on 2015-03-24 14:52:40
