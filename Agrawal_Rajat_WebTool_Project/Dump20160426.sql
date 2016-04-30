-- MySQL dump 10.13  Distrib 5.7.9, for Win32 (AMD64)
--
-- Host: localhost    Database: contacts
-- ------------------------------------------------------
-- Server version	5.7.9-log

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `categoryid` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `CommentId` int(11) NOT NULL AUTO_INCREMENT,
  `Comment` varchar(255) DEFAULT NULL,
  `DateOfComment` datetime DEFAULT NULL,
  `PostId` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  PRIMARY KEY (`CommentId`),
  KEY `FK8sesscuahqppiod84ysaa7gib` (`PostId`),
  KEY `FKkivweugp38biyda6u44veiu18` (`UserID`),
  CONSTRAINT `FK8sesscuahqppiod84ysaa7gib` FOREIGN KEY (`PostId`) REFERENCES `posts` (`PostId`),
  CONSTRAINT `FKkivweugp38biyda6u44veiu18` FOREIGN KEY (`UserID`) REFERENCES `userstable` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'Hello anybody online','2016-04-25 02:10:23',1,1),(3,'Hello...','2016-04-25 16:44:20',1,1);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `RelationId` int(11) NOT NULL AUTO_INCREMENT,
  `fromUser` int(11) DEFAULT NULL,
  `isAccepted` bit(1) DEFAULT NULL,
  `toUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`RelationId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (3,4,'\0',7);
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum`
--

DROP TABLE IF EXISTS `forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum` (
  `forumid` bigint(20) NOT NULL,
  `category` bigint(20) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  PRIMARY KEY (`forumid`),
  KEY `FKoeyhlae3tlpgycjcueduplc60` (`UserID`),
  KEY `FKc2p0sg8xwfmxllqj2hofv4xdc` (`category`),
  CONSTRAINT `FKc2p0sg8xwfmxllqj2hofv4xdc` FOREIGN KEY (`category`) REFERENCES `category` (`categoryid`),
  CONSTRAINT `FKoeyhlae3tlpgycjcueduplc60` FOREIGN KEY (`UserID`) REFERENCES `userstable` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum`
--

LOCK TABLES `forum` WRITE;
/*!40000 ALTER TABLE `forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `InboxId` int(11) NOT NULL AUTO_INCREMENT,
  `DateOfMessage` datetime DEFAULT NULL,
  `isRead` bit(1) DEFAULT NULL,
  `Message` varchar(255) DEFAULT NULL,
  `fromUser` int(11) DEFAULT NULL,
  `toUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`InboxId`),
  KEY `FK4i611rg6d2t47r600el5pnqyu` (`fromUser`),
  KEY `FKqph81xnsoskafqm01i08k0nv9` (`toUser`),
  CONSTRAINT `FK4i611rg6d2t47r600el5pnqyu` FOREIGN KEY (`fromUser`) REFERENCES `userstable` (`UserID`),
  CONSTRAINT `FKqph81xnsoskafqm01i08k0nv9` FOREIGN KEY (`toUser`) REFERENCES `userstable` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'2016-04-26 05:14:36','\0','Hello',1,4),(2,'2016-04-26 05:15:16','\0','How are you.',1,4),(3,'2016-04-26 05:15:29','\0','Thanks alot for accepting my request.',1,4),(4,'2016-04-26 05:18:42','\0','Hello',4,1),(5,'2016-04-26 07:11:50','\0','',1,4),(6,'2016-04-26 07:27:48','\0','Hello',4,1);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `NotificationId` int(11) NOT NULL AUTO_INCREMENT,
  `isSeen` bit(1) DEFAULT NULL,
  `Notification` varchar(255) DEFAULT NULL,
  `fromUser` int(11) DEFAULT NULL,
  `PostId` int(11) DEFAULT NULL,
  `toUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`NotificationId`),
  KEY `FK5lux98i2ee03ig073ne0k7y33` (`fromUser`),
  KEY `FK3ymc3e2akwsedkn6unx96thga` (`PostId`),
  KEY `FKeo0d6mmf6gehowum1vu7w611j` (`toUser`),
  CONSTRAINT `FK3ymc3e2akwsedkn6unx96thga` FOREIGN KEY (`PostId`) REFERENCES `posts` (`PostId`),
  CONSTRAINT `FK5lux98i2ee03ig073ne0k7y33` FOREIGN KEY (`fromUser`) REFERENCES `userstable` (`UserID`),
  CONSTRAINT `FKeo0d6mmf6gehowum1vu7w611j` FOREIGN KEY (`toUser`) REFERENCES `userstable` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,'\0','Rajat Agrawal commented on your post',1,1,1),(2,'\0','Rajat Agrawal commented on your post',1,1,1),(3,'\0','Rajat Agrawal commented on your post',1,1,1),(4,'\0','Rajat Agrawal liked your post',1,1,1),(5,'\0','Rajat Agrawal liked your post',1,1,1),(6,'\0','Rajat Agrawal liked your post',1,1,1),(7,'\0','Rajat Agrawal liked your post',1,1,1),(9,'\0','Rajat Agrawal commented on your post',1,1,1),(10,'\0','Shweta Agrawal commented on your post',2,1,1),(11,'\0','Shweta Agrawal liked your post',2,1,1);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `PostId` int(11) NOT NULL AUTO_INCREMENT,
  `DateOfPost` datetime DEFAULT NULL,
  `Likes` int(11) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  PRIMARY KEY (`PostId`),
  KEY `FKbwph6cu9gbjwl1ldbw277ww5n` (`UserID`),
  CONSTRAINT `FKbwph6cu9gbjwl1ldbw277ww5n` FOREIGN KEY (`UserID`) REFERENCES `userstable` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'2016-04-25 01:19:27',5,'Hello!!!',1),(2,'2016-04-26 07:20:27',0,'Good Morning Pune!!!',1);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_comments`
--

DROP TABLE IF EXISTS `posts_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts_comments` (
  `Posts_PostId` int(11) NOT NULL,
  `comments_CommentId` int(11) NOT NULL,
  UNIQUE KEY `UK_43xoi17kv7o6an2lj0iojbxcj` (`comments_CommentId`),
  KEY `FKfmhtecdr3f81gm52nsb07cqvs` (`Posts_PostId`),
  CONSTRAINT `FKfmhtecdr3f81gm52nsb07cqvs` FOREIGN KEY (`Posts_PostId`) REFERENCES `posts` (`PostId`),
  CONSTRAINT `FKfvqvis0oai0e1o0d8429w9cnd` FOREIGN KEY (`comments_CommentId`) REFERENCES `comments` (`CommentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_comments`
--

LOCK TABLES `posts_comments` WRITE;
/*!40000 ALTER TABLE `posts_comments` DISABLE KEYS */;
INSERT INTO `posts_comments` VALUES (1,1),(1,3);
/*!40000 ALTER TABLE `posts_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_notification`
--

DROP TABLE IF EXISTS `posts_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts_notification` (
  `Posts_PostId` int(11) NOT NULL,
  `notifications_NotificationId` int(11) NOT NULL,
  UNIQUE KEY `UK_coj6n452io4l571hhpuwb80ol` (`notifications_NotificationId`),
  KEY `FKswcaff6ehkpmt12vcpf56cet4` (`Posts_PostId`),
  CONSTRAINT `FK6g6lfrhygcaj05qycxpu88lis` FOREIGN KEY (`notifications_NotificationId`) REFERENCES `notification` (`NotificationId`),
  CONSTRAINT `FKswcaff6ehkpmt12vcpf56cet4` FOREIGN KEY (`Posts_PostId`) REFERENCES `posts` (`PostId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_notification`
--

LOCK TABLES `posts_notification` WRITE;
/*!40000 ALTER TABLE `posts_notification` DISABLE KEYS */;
INSERT INTO `posts_notification` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,9),(1,10),(1,11);
/*!40000 ALTER TABLE `posts_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount`
--

DROP TABLE IF EXISTS `useraccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount` (
  `password` varchar(255) DEFAULT NULL,
  `registerDate` date DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `UserID` int(11) NOT NULL,
  PRIMARY KEY (`UserID`),
  CONSTRAINT `FKifkwaydb9n7jt9tjbiaeljdve` FOREIGN KEY (`UserID`) REFERENCES `userstable` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount`
--

LOCK TABLES `useraccount` WRITE;
/*!40000 ALTER TABLE `useraccount` DISABLE KEYS */;
INSERT INTO `useraccount` VALUES ('Dec-2012','2016-04-24','user','ragraw26',1),('12345','2016-04-26','user','shweta22',2),('121212','2016-04-24','admin','rrsingh',3),('12345','2016-04-26','user','ssingh',4),('12345','2016-04-26','user','ragraw2',5),('121212','2016-04-26','user','vivek07',6),('1234567','2016-04-26','user','priyank',7);
/*!40000 ALTER TABLE `useraccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userstable`
--

DROP TABLE IF EXISTS `userstable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userstable` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `AboutMe1` longtext NOT NULL,
  `AboutMe2` longtext NOT NULL,
  `ActivityLevel` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  `AppearanceImportance` varchar(100) NOT NULL,
  `BodyType` varchar(200) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `Cuisine` varchar(255) NOT NULL,
  `Custody` varchar(100) NOT NULL,
  `DOBday` int(11) NOT NULL,
  `DOBmonth` int(11) NOT NULL,
  `DOByear` int(11) NOT NULL,
  `DrinkingHabits` varchar(50) NOT NULL,
  `EducationLevel` varchar(200) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `EntertainmentLocation` varchar(255) NOT NULL,
  `Ethnicity` varchar(100) NOT NULL,
  `EyeColor` varchar(50) NOT NULL,
  `FileLocation` varchar(100) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `GrewUpIn` varchar(100) NOT NULL,
  `HairColor` varchar(40) NOT NULL,
  `Headline` longtext NOT NULL,
  `Height` int(11) NOT NULL,
  `IdealRelationshipEssay` longtext NOT NULL,
  `IncomeLevel` varchar(100) NOT NULL,
  `IntelligenceImportance` varchar(50) NOT NULL,
  `Languages` varchar(255) NOT NULL,
  `lastLoginDate` date DEFAULT NULL,
  `LearnFromThePastEssay` longtext NOT NULL,
  `LeisureActivity` varchar(255) NOT NULL,
  `MaritalStatus` varchar(100) NOT NULL,
  `MoreChildrenFlag` varchar(50) NOT NULL,
  `Music` varchar(255) NOT NULL,
  `Occupation` varchar(255) NOT NULL,
  `OccupationDescription` varchar(255) NOT NULL,
  `PerfectFirstDateEssay` longtext NOT NULL,
  `PerfectMatchEssay` longtext NOT NULL,
  `PersonalityTrait` varchar(255) NOT NULL,
  `PhysicalActivity` varchar(255) NOT NULL,
  `PoliticalOrientation` varchar(100) NOT NULL,
  `PostalCode` varchar(10) NOT NULL,
  `Reading` varchar(255) NOT NULL,
  `RelationshipType` varchar(255) NOT NULL,
  `Religion` varchar(100) NOT NULL,
  `RelocateFlag` varchar(20) NOT NULL,
  `SeekingGender` varchar(10) NOT NULL,
  `SmokingHabits` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `StudiesEmphasis` varchar(255) NOT NULL,
  `UserName` varchar(20) NOT NULL,
  `UserPassword` varchar(20) NOT NULL,
  `UserfullName` varchar(255) NOT NULL,
  `Weight` int(11) NOT NULL,
  `ZodiacSign` varchar(20) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userstable`
--

LOCK TABLES `userstable` WRITE;
/*!40000 ALTER TABLE `userstable` DISABLE KEYS */;
INSERT INTO `userstable` VALUES (1,'x','xxx','xxx',25,'xx','x','Boston','US','x','xx',22,12,1989,'x','xxx','rajat22_agr@yahoo.co.in','x','x','x','img/1.jpeg','Male','India','xxx','Love Live Life!!!!!!',6,'x','x','xx','xxx','2016-04-26','x','xxxx','x','xxx','xx','x','xx','xxxx','Female','x','xx','x','02115','x','x','x','xx','Female','xx','MA','x','ragraw26','Dec-2012','Rajat Agrawal',78,'Libra'),(2,'X','XXXX','X',26,'X','X','Boston','US','X','X',12,12,1990,'XX','XXXX','ss@gmail.com','XX','X','X','img/1.jpeg','Female','India','XXXXX','Live Fast Die Young!!!!!!',6,'X','X','X','XXX','2016-04-24','X','XXXX','XX','X','X','X','X','XX','XXXX','XX','X','XX','02115','X','X','XX','X','MAle','X','MA','X','shweta22','12345','Shweta Agrawal',60,'XXX'),(3,'x','x','x',21,'x','x','XXX','xxxx','x','xx',12,12,2001,'xx','xxxx','rrsingh@gmail.com','x','x','x','img/4.jpeg','Male','xxxx','xxxxx','Admin',7,'xxxxxx','x','xx','x','2016-04-24','xxxxxx','xxxxx','xx','x','x','x','x','xxxxxx','xxxxx','x','x','x','248001','x','xxxx','x','x','Female','x','xxxx','x','rrsingh','121212','Rohit Singh',89,'x'),(4,'xxxxxxxxxxxxxxxxxx','xxxxxxxxxxxxxxxxxxx','xxxxxxxxxxxx',22,'xxxxxxxxxxxxx','xxxxxxxxxxxxx','Boston','US','xxxxxxxxxxxxxxxxx','x',12,12,22,'xxx','xxxxxxx','ss@gmail.com','xxxxxxxxxxx','x','xxxxxxxxxxxx','img/default.jpeg','Female','India','xxxxxxxxxxxx','LIve Fast..Die Young',6,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','xxxxxxxxxxxx','xxxxxxxxxxxxxx','xxxx','2016-04-26','xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','xxxxxxxxxx','x','x','xxxxxxxxxxx','xxxxxxxxxxx','xxxxxxxxxxxxxxxx','xxxxxxxxxxxxxxx','Male','xxxxxxxxxxxxxxxx','xxxxxxxxxxxxxxxx','xxxxxxxxxxxx','02115','xxxxxxxxxxxxx','x','x','xxxxxxxxxxxx','MAle','x','MA','xxxxxxxxxx','ssingh','12345','Swati Singh',60,'xxxxx'),(5,'x','x','x',26,'x','xxx','Boston','US','xxxx','xx',1,12,1,'x','xxxxxxxxxxxxx','rajat@gmail.com','x','x','xx','img/default.jpeg','Male','Boston','xxx','xxxx',6,'xxxxxxxxxxxxxxxx','x','x','xxxx','2016-04-26','x','xxxx','xxxx','x','x','x','x','x','xxxxxxxxxxxxxxx','x','x','x','02115','x','x','x','x','Female','x','MA','x','ragraw2','12345','123456',78,'Libra'),(6,'x','x','xxx',22,'x','x','Boston','US','x','x',12,12,2016,'xx','xxx','vivek@gmail.com','x','x','x','img/default.jpg','Male','Boston','xxxx','Learn More ',7,'xx','x','x','x','2016-04-26','x','xxxx','xx','x','xx','x','x','x','xxxxx','x','x','x','02215','x','xx','xx','xx','Female','x','MA','x','vivek07','121212','Vivek Kumar',80,'xxx'),(7,'x','x','xx',22,'x','x','Boston','US','xx','x',22,12,1990,'x','xxx','agrawal.p@gmail.com','x','x','x','img/default.jpg','Male','Boston','xxxx','Priyank Agrawal',7,'x','xxx','x','x','2016-04-26','x','xxx','x','x','x','x','x','x','xxxxx','x','x','x','02115','x','x','x','x','Female','x','MA','x','priyank','1234567','Priyank 123',68,'xxxxxx');
/*!40000 ALTER TABLE `userstable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'contacts'
--

--
-- Dumping routines for database 'contacts'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-26  7:56:17
