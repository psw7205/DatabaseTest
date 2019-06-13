-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: planner
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `board` (
  `board_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '게시물아이디',
  `author` int(11) DEFAULT NULL COMMENT '작성자',
  `title` text COMMENT '제목',
  `type` int(11) DEFAULT NULL COMMENT '라벨',
  `content` text COMMENT '내용',
  `regtime` varchar(45) DEFAULT NULL COMMENT '시간',
  PRIMARY KEY (`board_id`),
  KEY `FK_Board_type_Work_type_id` (`type`),
  KEY `FK_Board_author_User_member_id` (`author`),
  CONSTRAINT `FK_Board_author_User_member_id` FOREIGN KEY (`author`) REFERENCES `user` (`member_id`),
  CONSTRAINT `FK_Board_type_Work_type_id` FOREIGN KEY (`type`) REFERENCES `work_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='일정';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (5,1,'게시글',2,'게시글 내용 ~~','2019-06-13 16:51:54'),(7,2,'게시글',4,'게시글 내용 ~~','2019-06-13 16:47:11'),(10,1,'게시글',3,'게시글 내용 ~~','2019-06-13 04:02:14'),(15,3,'게시글',3,'게시글 내용 ~~','2019-06-13 04:29:12'),(16,1,'웹프 과제 마무리',2,'게시글 내용 ~~','2019-06-13 16:38:51');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '아이디',
  `work_id` int(11) DEFAULT NULL COMMENT '게시물아이디',
  `content` text COMMENT '내용',
  `author_id` int(11) DEFAULT NULL COMMENT '작성자아이디',
  PRIMARY KEY (`id`),
  KEY `FK_Comment_author_id_User_member_id` (`author_id`),
  KEY `FK_Comment_work_id_Board_board_id` (`work_id`),
  CONSTRAINT `FK_Comment_author_id_User_member_id` FOREIGN KEY (`author_id`) REFERENCES `user` (`member_id`),
  CONSTRAINT `FK_Comment_work_id_Board_board_id` FOREIGN KEY (`work_id`) REFERENCES `board` (`board_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='댓글';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (4,5,'댓글 샘플',1),(6,5,'댓글 샘플',1),(7,5,'댓글 샘플',1),(8,7,'댓글 샘플',2),(18,5,'댓글 샘플',2);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend`
--

DROP TABLE IF EXISTS `friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `friend` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '아이디',
  `mem_id` int(11) DEFAULT NULL COMMENT '사용자아이디',
  `friend_id` int(11) DEFAULT NULL COMMENT '친구아이디',
  PRIMARY KEY (`id`),
  KEY `FK_Friend_mem_id_User_member_id` (`mem_id`),
  KEY `FK_Friend_friend_id_User_member_id` (`friend_id`),
  CONSTRAINT `FK_Friend_friend_id_User_member_id` FOREIGN KEY (`friend_id`) REFERENCES `user` (`member_id`),
  CONSTRAINT `FK_Friend_mem_id_User_member_id` FOREIGN KEY (`mem_id`) REFERENCES `user` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='친구';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend`
--

LOCK TABLES `friend` WRITE;
/*!40000 ALTER TABLE `friend` DISABLE KEYS */;
INSERT INTO `friend` VALUES (1,1,2),(4,2,3),(6,1,3),(7,3,2),(8,5,1),(9,2,1);
/*!40000 ALTER TABLE `friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '사용자아이디',
  `username` varchar(45) NOT NULL COMMENT '닉네임',
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='회원';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'1@naver.com','57df6d827c155286dbb3a3d7aba5c123ab8a3546'),(2,'2@naver.com','57df6d827c155286dbb3a3d7aba5c123ab8a3546'),(3,'3@naver.com','57df6d827c155286dbb3a3d7aba5c123ab8a3546'),(4,'4@naver.com','57df6d827c155286dbb3a3d7aba5c123ab8a3546');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_type`
--

DROP TABLE IF EXISTS `work_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `work_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '아이디',
  `label` varchar(45) DEFAULT NULL COMMENT '내용',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='라벨종류';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_type`
--

LOCK TABLES `work_type` WRITE;
/*!40000 ALTER TABLE `work_type` DISABLE KEYS */;
INSERT INTO `work_type` VALUES (1,'매일'),(2,'매주'),(3,'매월'),(4,'월수금'),(5,'화목토');
/*!40000 ALTER TABLE `work_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-13 23:18:27
