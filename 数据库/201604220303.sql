/*
SQLyog v10.2 
MySQL - 5.6.27-log : Database - onlinestudydb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`onlinestudydb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `onlinestudydb`;

/*Table structure for table `tbl_objectanswerinfo` */

DROP TABLE IF EXISTS `tbl_objectanswerinfo`;

CREATE TABLE `tbl_objectanswerinfo` (
  `answerInfoID` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `testID` int(15) unsigned NOT NULL,
  `questionID` int(15) unsigned NOT NULL,
  `studentAnswer` int(2) unsigned NOT NULL,
  `answerScore` int(5) unsigned NOT NULL DEFAULT '0',
  `answerTime` datetime DEFAULT NULL,
  `isChecked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`answerInfoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_objectanswerinfo` */

/*Table structure for table `tbl_objectquestion` */

DROP TABLE IF EXISTS `tbl_objectquestion`;

CREATE TABLE `tbl_objectquestion` (
  `questionID` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `questionContent` varchar(300) NOT NULL,
  `answer1` varchar(300) DEFAULT NULL,
  `answer2` varchar(300) DEFAULT NULL,
  `answer3` varchar(300) DEFAULT NULL,
  `answer4` varchar(300) DEFAULT NULL,
  `trueAnswer` tinyint(2) NOT NULL DEFAULT '1',
  `questionAnalyze` varchar(300) DEFAULT NULL,
  `score` int(5) unsigned NOT NULL DEFAULT '1',
  `questionSpaceID` int(15) unsigned NOT NULL,
  PRIMARY KEY (`questionID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_objectquestion` */

insert  into `tbl_objectquestion`(`questionID`,`questionContent`,`answer1`,`answer2`,`answer3`,`answer4`,`trueAnswer`,`questionAnalyze`,`score`,`questionSpaceID`) values (13,'软件测试的目的是？','避免软件开发中的错误','发现软件开发中的错误','尽可能发现并排除软件中的潜藏的错误，提高软件的可靠性','修改软件中的错误',3,'略',10,9);

/*Table structure for table `tbl_student` */

DROP TABLE IF EXISTS `tbl_student`;

CREATE TABLE `tbl_student` (
  `studentID` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `studentEmail` varchar(50) NOT NULL,
  `studentPassword` varchar(50) NOT NULL,
  `studentName` varchar(50) DEFAULT NULL,
  `studentGender` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`studentID`,`studentEmail`),
  UNIQUE KEY `Unique` (`studentEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=2050 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_student` */

insert  into `tbl_student`(`studentID`,`studentEmail`,`studentPassword`,`studentName`,`studentGender`) values (2046,'zcp@test.com','123','周昌朋',0),(2047,'test1@test.com','123','测试学生1',0),(2048,'test2@test.com','123','测试学生2',1),(2049,'linux@test.com','123','linuxtest',0);

/*Table structure for table `tbl_student_teacher` */

DROP TABLE IF EXISTS `tbl_student_teacher`;

CREATE TABLE `tbl_student_teacher` (
  `studentID` int(15) NOT NULL,
  `teacherID` int(15) NOT NULL,
  `relationDate` datetime DEFAULT NULL,
  `relationState` tinyint(1) NOT NULL,
  `relationID` int(15) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`relationID`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_student_teacher` */

insert  into `tbl_student_teacher`(`studentID`,`teacherID`,`relationDate`,`relationState`,`relationID`) values (2046,11,'2016-04-21 00:00:00',1,58),(2048,12,'2016-04-21 00:00:00',1,59),(2048,11,'2016-04-21 00:00:00',1,60),(2046,12,'2016-04-21 00:00:00',1,61),(2046,13,'2016-04-22 00:00:00',0,62);

/*Table structure for table `tbl_subjectquestion` */

DROP TABLE IF EXISTS `tbl_subjectquestion`;

CREATE TABLE `tbl_subjectquestion` (
  `questionID` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `questionContent` varchar(300) NOT NULL,
  PRIMARY KEY (`questionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_subjectquestion` */

/*Table structure for table `tbl_teacher` */

DROP TABLE IF EXISTS `tbl_teacher`;

CREATE TABLE `tbl_teacher` (
  `teacherID` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `teacherEmail` varchar(50) NOT NULL,
  `teacherPassword` varchar(50) NOT NULL,
  `teacherName` varchar(50) DEFAULT NULL,
  `teacherGender` tinyint(1) DEFAULT NULL,
  `teacherPhone` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`teacherID`),
  UNIQUE KEY `teacherEmail` (`teacherEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_teacher` */

insert  into `tbl_teacher`(`teacherID`,`teacherEmail`,`teacherPassword`,`teacherName`,`teacherGender`,`teacherPhone`) values (11,'yytwz96@163.com','123','杨越童',0,'18240439508'),(12,'testTeacher1@test.com','123','测试老师1',0,'6660000'),(13,'testTeacher2@test.com','123','测试老师2',0,'6660000');

/*Table structure for table `tbl_teacherquestionspace` */

DROP TABLE IF EXISTS `tbl_teacherquestionspace`;

CREATE TABLE `tbl_teacherquestionspace` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `beginTime` datetime NOT NULL,
  `endTime` datetime NOT NULL,
  `teacherID` int(15) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_teacherquestionspace` */

insert  into `tbl_teacherquestionspace`(`id`,`type`,`name`,`beginTime`,`endTime`,`teacherID`) values (9,'Java','软件测试基础','2016-06-01 13:00:00','2016-06-01 13:00:03',11);

/*Table structure for table `tbl_teacherquestionspace_subjectquestion` */

DROP TABLE IF EXISTS `tbl_teacherquestionspace_subjectquestion`;

CREATE TABLE `tbl_teacherquestionspace_subjectquestion` (
  `questionSpaceID` int(15) NOT NULL,
  `subjectQuestionID` int(15) NOT NULL,
  `relationID` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `relationTime` datetime DEFAULT NULL,
  PRIMARY KEY (`relationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_teacherquestionspace_subjectquestion` */

/*Table structure for table `tbl_test` */

DROP TABLE IF EXISTS `tbl_test`;

CREATE TABLE `tbl_test` (
  `testID` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `testTime` datetime DEFAULT NULL,
  `isExam` tinyint(1) NOT NULL DEFAULT '0',
  `studentID` int(15) unsigned NOT NULL,
  `questionSpaceID` int(15) unsigned NOT NULL,
  `testScore` int(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`testID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_test` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
