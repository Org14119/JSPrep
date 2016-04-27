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
  PRIMARY KEY (`questionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_objectquestion` */

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_student` */

insert  into `tbl_student`(`studentID`,`studentEmail`,`studentPassword`,`studentName`,`studentGender`) values (1,'yytwz96@163.com','root123','杨越童',0);

/*Table structure for table `tbl_student_studenttestinfo` */

DROP TABLE IF EXISTS `tbl_student_studenttestinfo`;

CREATE TABLE `tbl_student_studenttestinfo` (
  `relationID` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `relationTime` datetime NOT NULL,
  `studentID` int(15) NOT NULL,
  `studentTestInfoID` int(15) NOT NULL,
  PRIMARY KEY (`relationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_student_studenttestinfo` */

/*Table structure for table `tbl_student_teacher` */

DROP TABLE IF EXISTS `tbl_student_teacher`;

CREATE TABLE `tbl_student_teacher` (
  `relationID` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `studentID` int(15) NOT NULL,
  `teacherID` int(15) NOT NULL,
  `relationDate` datetime DEFAULT NULL,
  `relationState` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`relationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_student_teacher` */

/*Table structure for table `tbl_studenttestinfo` */

DROP TABLE IF EXISTS `tbl_studenttestinfo`;

CREATE TABLE `tbl_studenttestinfo` (
  `studentTestInfoID` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `studentTestDate` datetime NOT NULL,
  `studentTestResult` int(5) NOT NULL,
  `studentTestCheckState` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`studentTestInfoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_studenttestinfo` */

/*Table structure for table `tbl_studenttestinfo_teacherquestionspace` */

DROP TABLE IF EXISTS `tbl_studenttestinfo_teacherquestionspace`;

CREATE TABLE `tbl_studenttestinfo_teacherquestionspace` (
  `relationID` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `relationTime` datetime DEFAULT NULL,
  `studentTestInfoID` int(15) DEFAULT NULL,
  `teacherQuestionSpaceID` int(15) DEFAULT NULL,
  PRIMARY KEY (`relationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_studenttestinfo_teacherquestionspace` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_teacher` */

/*Table structure for table `tbl_teacher_teacherquestionspace` */

DROP TABLE IF EXISTS `tbl_teacher_teacherquestionspace`;

CREATE TABLE `tbl_teacher_teacherquestionspace` (
  `relationID` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `teacherID` int(15) unsigned NOT NULL,
  `teacherQuestionSpaceID` int(15) unsigned NOT NULL,
  `relationDate` datetime NOT NULL,
  PRIMARY KEY (`relationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_teacher_teacherquestionspace` */

/*Table structure for table `tbl_teacherquestionspace` */

DROP TABLE IF EXISTS `tbl_teacherquestionspace`;

CREATE TABLE `tbl_teacherquestionspace` (
  `teacherQuestionSpaceID` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `teacherQuestionSpaceType` varchar(50) NOT NULL,
  `teacherQuestionSpaceState` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`teacherQuestionSpaceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_teacherquestionspace` */

/*Table structure for table `tbl_teacherquestionspace_objectquestion` */

DROP TABLE IF EXISTS `tbl_teacherquestionspace_objectquestion`;

CREATE TABLE `tbl_teacherquestionspace_objectquestion` (
  `relationID` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `objectQuestionID` int(15) NOT NULL,
  `relationTime` datetime NOT NULL,
  `questionSpaceID` int(15) NOT NULL,
  PRIMARY KEY (`relationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_teacherquestionspace_objectquestion` */

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

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
