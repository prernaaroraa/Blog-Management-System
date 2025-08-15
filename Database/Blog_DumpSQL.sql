/*
SQLyog Trial v13.1.8 (64 bit)
MySQL - 8.0.37 : Database - blog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`blog` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `blog`;

/*Table structure for table `blog` */

DROP TABLE IF EXISTS `blog`;

CREATE TABLE `blog` (
  `blogid` int NOT NULL AUTO_INCREMENT,
  `content` text,
  `title` text,
  `category` text,
  `userid` int DEFAULT NULL,
  PRIMARY KEY (`blogid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `blog` */

insert  into `blog`(`blogid`,`content`,`title`,`category`,`userid`) values 
(18,'The Bombay High Court on Tuesday ordered the release of the minor accused in the Pune Porsche crash case and allowed a habeas corpus plea seeking the quashing of remand orders sending him to an observation home.','Pune Porsche crash case','Nature',17),
(19,'It wasnt even a year into my first full-time job as a tech journalist when I decided to get an iPad. My dad asked why I wanted an iPad instead of a Mac. I was convinced the first-generation iPad Air was the device I wanted. I still remember walking into a Croma store. It was my go-to writing machine, a device to watch movies and play gamesI traveled with it everywhere. I still have it, and it still works. Since then, I have reviewed almost all iPads and used various accessories, from Apple and other brands. I know the iPad inside and out; I am both its biggest supporter and critic.','Why I am calling the new iPad Air M2','Technology',17),
(20,'This snack recipe blends the delicate richness of paneer marinated and grilled to perfection, encased within soft taco shells. The marriage of smokey, creamy paneer and the zesty freshness of salsa creates an irresistible fusion.','Cornitos Grilled Paneer Tacos with Salsa Dip Recipe','Food',18),
(21,'Craving something lip-smacking but don\'t want to spend hours in the kitchen making a dish? Then we have the perfect dish for you. Prepared in less than 15 minutes, this yummy paneer dish can be either served as a main dish','Paneer Chilli Dry Recipe','Food',18);

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `commentid` int NOT NULL AUTO_INCREMENT,
  `blogid` int DEFAULT NULL,
  `userid` int DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`commentid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `comment` */

insert  into `comment`(`commentid`,`blogid`,`userid`,`comment`) values 
(5,9,2,'LL'),
(6,9,2,'HELLO'),
(12,11,1,'hi'),
(13,13,2,'GG');

/*Table structure for table `userinfo` */

DROP TABLE IF EXISTS `userinfo`;

CREATE TABLE `userinfo` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `username` text,
  `password` text,
  `email` text,
  `firstname` text,
  `lastname` text,
  `contact` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `userinfo` */

insert  into `userinfo`(`ID`,`username`,`password`,`email`,`firstname`,`lastname`,`contact`) values 
(5,'admin','admin123','admin@gmail.com','admin','admin','admin'),
(17,'shivam0','12','shivam@gmail.com','shivam','tyagi','9057591718'),
(18,'tanishq07','12','tanishq@gmail.com','tanishq','chouhan','8103942742');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
