-- MySQL dump 10.13  Distrib 8.0.46, for macos15 (arm64)
--
-- Host: localhost    Database: basketball_school
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `age_categories`
--

DROP TABLE IF EXISTS `age_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `age_categories` (
  `age_category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_age` int NOT NULL,
  `max_age` int NOT NULL,
  PRIMARY KEY (`age_category_id`),
  CONSTRAINT `chk_age_categories_range` CHECK (((`min_age` between 0 and 99) and (`max_age` between 0 and 99) and (`min_age` <= `max_age`)))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `age_categories`
--

LOCK TABLES `age_categories` WRITE;
/*!40000 ALTER TABLE `age_categories` DISABLE KEYS */;
INSERT INTO `age_categories` VALUES (1,'9-10 лет',9,10),(2,'11-12 лет',11,12),(3,'13-14 лет',13,14);
/*!40000 ALTER TABLE `age_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `athletes`
--

DROP TABLE IF EXISTS `athletes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `athletes` (
  `athlete_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_full_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admission_date` date NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`athlete_id`),
  KEY `fk_athletes_group` (`group_id`),
  CONSTRAINT `fk_athletes_group` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `athletes`
--

LOCK TABLES `athletes` WRITE;
/*!40000 ALTER TABLE `athletes` DISABLE KEYS */;
INSERT INTO `athletes` VALUES (1,'Петров Максим Андреевич','Мужской','2015-04-12','+79005550101','Петров Андрей Викторович','+79005550111','2024-09-05',1),(2,'Соколова Анна Дмитриевна','Женский','2015-10-03','+79005550102','Соколова Марина Викторовна','+79005550112','2024-09-07',1),(3,'Волков Артём Сергеевич','Мужской','2014-02-20','+79005550103','Волков Сергей Николаевич','+79005550113','2024-09-03',2),(4,'Орлова Елизавета Павловна','Женский','2014-07-18','+79005550104','Орлова Светлана Павловна','+79005550114','2024-09-10',2),(5,'Морозов Кирилл Олегович','Мужской','2013-05-09','+79005550105','Морозов Олег Викторович','+79005550115','2024-09-02',3),(6,'Белова Дарья Романовна','Женский','2013-11-27','+79005550106','Белова Ирина Романовна','+79005550116','2024-09-04',3),(7,'Фёдоров Илья Романович','Мужской','2015-06-14','+79005550107','Фёдоров Роман Сергеевич','+79005550117','2024-09-08',1),(8,'Крылова София Максимовна','Женский','2015-01-25','+79005550108','Крылова Оксана Викторовна','+79005550118','2024-09-11',1),(9,'Захаров Денис Олегович','Мужской','2014-09-06','+79005550109','Захаров Олег Павлович','+79005550119','2024-09-06',2),(10,'Васильева Мария Сергеевна','Женский','2014-03-29','+79005550110','Васильева Наталья Игоревна','+79005550120','2024-09-12',2),(11,'Громов Егор Алексеевич','Мужской','2013-08-17','+79005550121','Громов Алексей Владимирович','+79005550122','2024-09-09',3),(12,'Никитина Полина Денисовна','Женский','2013-02-11','+79005550123','Никитина Ирина Павловна','+79005550124','2024-09-13',3),(13,'Лебедев Михаил Аркадьевич','Мужской','2015-09-19','+79005550125','Лебедев Аркадий Михайлович','+79005550126','2024-09-14',1),(14,'Попова Виктория Ильинична','Женский','2014-05-22','+79005550127','Попова Елена Сергеевна','+79005550128','2024-09-15',2),(15,'Карпов Арсений Дмитриевич','Мужской','2013-12-04','+79005550129','Карпов Дмитрий Олегович','+79005550130','2024-09-16',3);
/*!40000 ALTER TABLE `athletes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `training_id` int NOT NULL,
  `athlete_id` int NOT NULL,
  `attendance_status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`training_id`,`athlete_id`),
  KEY `fk_attendance_athlete` (`athlete_id`),
  CONSTRAINT `fk_attendance_athlete` FOREIGN KEY (`athlete_id`) REFERENCES `athletes` (`athlete_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_attendance_training` FOREIGN KEY (`training_id`) REFERENCES `trainings` (`training_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,1,'Присутствовал'),(1,2,'Присутствовал'),(1,7,'Присутствовал'),(1,8,'Уважительная причина'),(1,13,'Присутствовал'),(2,3,'Присутствовал'),(2,4,'Уважительная причина'),(2,9,'Присутствовал'),(2,10,'Присутствовал'),(2,14,'Присутствовал'),(3,5,'Присутствовал'),(3,6,'Отсутствовал'),(3,11,'Присутствовал'),(3,12,'Отсутствовал'),(3,15,'Присутствовал'),(5,1,'Присутствовал'),(5,2,'Присутствовал'),(5,7,'Отсутствовал'),(5,8,'Присутствовал'),(5,13,'Присутствовал'),(6,1,'Присутствовал'),(6,2,'Уважительная причина'),(6,7,'Присутствовал'),(6,8,'Присутствовал'),(6,13,'Уважительная причина'),(7,3,'Присутствовал'),(7,4,'Уважительная причина'),(7,9,'Присутствовал'),(7,10,'Отсутствовал'),(7,14,'Уважительная причина'),(8,3,'Присутствовал'),(8,4,'Присутствовал'),(8,9,'Уважительная причина'),(8,10,'Присутствовал'),(8,14,'Присутствовал'),(9,5,'Присутствовал'),(9,6,'Присутствовал'),(9,11,'Уважительная причина'),(9,12,'Присутствовал'),(9,15,'Присутствовал'),(10,5,'Присутствовал'),(10,6,'Отсутствовал'),(10,11,'Присутствовал'),(10,12,'Присутствовал'),(10,15,'Уважительная причина'),(13,1,'Присутствовал'),(13,2,'Присутствовал'),(13,7,'Уважительная причина'),(13,8,'Присутствовал'),(13,13,'Присутствовал'),(14,1,'Присутствовал'),(14,2,'Отсутствовал'),(14,7,'Присутствовал'),(14,8,'Присутствовал'),(14,13,'Присутствовал'),(15,3,'Присутствовал'),(15,4,'Присутствовал'),(15,9,'Отсутствовал'),(15,10,'Присутствовал'),(15,14,'Присутствовал'),(16,3,'Уважительная причина'),(16,4,'Присутствовал'),(16,9,'Присутствовал'),(16,10,'Присутствовал'),(16,14,'Присутствовал'),(17,5,'Присутствовал'),(17,6,'Присутствовал'),(17,11,'Отсутствовал'),(17,12,'Присутствовал'),(17,15,'Присутствовал'),(18,5,'Уважительная причина'),(18,6,'Присутствовал'),(18,11,'Присутствовал'),(18,12,'Присутствовал'),(18,15,'Присутствовал');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `group_id` int NOT NULL AUTO_INCREMENT,
  `group_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_athletes` int NOT NULL,
  `created_date` date NOT NULL,
  `age_category_id` int NOT NULL,
  `trainer_id` int NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `fk_groups_age_category` (`age_category_id`),
  KEY `fk_groups_trainer` (`trainer_id`),
  CONSTRAINT `fk_groups_age_category` FOREIGN KEY (`age_category_id`) REFERENCES `age_categories` (`age_category_id`),
  CONSTRAINT `fk_groups_trainer` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`),
  CONSTRAINT `chk_groups_max_athletes` CHECK ((`max_athletes` between 1 and 40))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Юниоры 9-10',16,'2024-09-01',1,1),(2,'Юниоры 11-12',18,'2024-09-01',2,2),(3,'Старшая группа',20,'2024-09-01',3,3);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `halls`
--

DROP TABLE IF EXISTS `halls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `halls` (
  `hall_id` int NOT NULL AUTO_INCREMENT,
  `hall_name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` int NOT NULL,
  PRIMARY KEY (`hall_id`),
  CONSTRAINT `chk_halls_capacity` CHECK ((`capacity` between 1 and 100))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `halls`
--

LOCK TABLES `halls` WRITE;
/*!40000 ALTER TABLE `halls` DISABLE KEYS */;
INSERT INTO `halls` VALUES (1,'Большой спортивный зал','ул. Спортивная, д. 10',60),(2,'Малый спортивный зал','ул. Спортивная, д. 10',25);
/*!40000 ALTER TABLE `halls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainers`
--

DROP TABLE IF EXISTS `trainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainers` (
  `trainer_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `specialization` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hire_date` date NOT NULL,
  PRIMARY KEY (`trainer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainers`
--

LOCK TABLES `trainers` WRITE;
/*!40000 ALTER TABLE `trainers` DISABLE KEYS */;
INSERT INTO `trainers` VALUES (1,'Иванов Сергей Петрович','+79001234501','Техническая подготовка','2021-08-20'),(2,'Кузнецов Андрей Викторович','+79001234502','Физическая подготовка','2020-09-01'),(3,'Смирнова Ольга Игоревна','+79001234503','Тактическая подготовка','2022-01-15');
/*!40000 ALTER TABLE `trainers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_types`
--

DROP TABLE IF EXISTS `training_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `training_types` (
  `training_type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`training_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_types`
--

LOCK TABLES `training_types` WRITE;
/*!40000 ALTER TABLE `training_types` DISABLE KEYS */;
INSERT INTO `training_types` VALUES (1,'Техническая','Ведение мяча, передачи и броски'),(2,'Физическая','Развитие силы, скорости и выносливости'),(3,'Тактическая','Командные взаимодействия и разбор игровых ситуаций');
/*!40000 ALTER TABLE `training_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainings`
--

DROP TABLE IF EXISTS `trainings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainings` (
  `training_id` int NOT NULL AUTO_INCREMENT,
  `training_date` date NOT NULL,
  `start_time` time NOT NULL,
  `duration_minutes` int NOT NULL,
  `training_status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_id` int NOT NULL,
  `hall_id` int NOT NULL,
  `training_type_id` int NOT NULL,
  PRIMARY KEY (`training_id`),
  KEY `fk_trainings_hall` (`hall_id`),
  KEY `fk_trainings_type` (`training_type_id`),
  KEY `idx_trainings_group_date` (`group_id`,`training_date`),
  CONSTRAINT `fk_trainings_group` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`),
  CONSTRAINT `fk_trainings_hall` FOREIGN KEY (`hall_id`) REFERENCES `halls` (`hall_id`),
  CONSTRAINT `fk_trainings_type` FOREIGN KEY (`training_type_id`) REFERENCES `training_types` (`training_type_id`),
  CONSTRAINT `chk_trainings_duration` CHECK ((`duration_minutes` between 30 and 180))
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainings`
--

LOCK TABLES `trainings` WRITE;
/*!40000 ALTER TABLE `trainings` DISABLE KEYS */;
INSERT INTO `trainings` VALUES (1,'2025-09-08','16:00:00',90,'Проведена','Отработка ведения мяча',1,2,1),(2,'2025-09-09','17:30:00',90,'Проведена','Круговая физическая тренировка',2,1,2),(3,'2025-09-10','18:00:00',90,'Проведена','Командная игра 3 на 3',3,1,3),(4,'2025-09-15','16:00:00',90,'Отменена','Тренировка отменена',1,2,1),(5,'2025-09-10','16:00:00',90,'Проведена','Передачи в движении',1,2,1),(6,'2025-09-17','16:00:00',90,'Проведена','Упражнения на скорость',1,2,2),(7,'2025-09-12','17:30:00',90,'Проведена','Броски с разных дистанций',2,1,1),(8,'2025-09-19','17:30:00',90,'Проведена','Защита и командные действия',2,1,3),(9,'2025-09-14','18:00:00',90,'Проведена','Развитие выносливости',3,1,2),(10,'2025-09-21','18:00:00',90,'Проведена','Ведение мяча и обводка',3,1,1),(11,'2025-09-23','17:30:00',90,'Отменена','Тренировка отменена',2,1,3),(12,'2025-09-24','18:00:00',90,'Отменена','Тренировка отменена',3,1,1),(13,'2025-09-22','16:00:00',90,'Проведена','Броски после ведения мяча',1,2,1),(14,'2025-09-29','16:00:00',90,'Проведена','Игра в защите',1,2,3),(15,'2025-09-24','17:30:00',90,'Проведена','Силовая подготовка',2,1,2),(16,'2025-09-29','17:30:00',90,'Проведена','Передачи и командное взаимодействие',2,1,1),(17,'2025-09-25','18:00:00',90,'Проведена','Тактические упражнения',3,1,3),(18,'2025-09-30','18:00:00',90,'Проведена','Скоростная подготовка',3,1,2);
/*!40000 ALTER TABLE `trainings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_training_schedule`
--

DROP TABLE IF EXISTS `vw_training_schedule`;
/*!50001 DROP VIEW IF EXISTS `vw_training_schedule`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_training_schedule` AS SELECT 
 1 AS `group_id`,
 1 AS `group_name`,
 1 AS `training_date`,
 1 AS `start_time`,
 1 AS `hall_name`,
 1 AS `training_type`,
 1 AS `training_status`,
 1 AS `status_explanation`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'basketball_school'
--

--
-- Final view structure for view `vw_training_schedule`
--

/*!50001 DROP VIEW IF EXISTS `vw_training_schedule`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_training_schedule` AS select `tr`.`group_id` AS `group_id`,`g`.`group_name` AS `group_name`,`tr`.`training_date` AS `training_date`,`tr`.`start_time` AS `start_time`,`h`.`hall_name` AS `hall_name`,`tt`.`type_name` AS `training_type`,`tr`.`training_status` AS `training_status`,(case when (`tr`.`training_status` = 'Проведена') then 'Тренировка состоялась' when (`tr`.`training_status` = 'Отменена') then 'Тренировка отменена' else 'Ожидается проведение' end) AS `status_explanation` from (((`trainings` `tr` join `groups` `g` on((`tr`.`group_id` = `g`.`group_id`))) join `halls` `h` on((`tr`.`hall_id` = `h`.`hall_id`))) join `training_types` `tt` on((`tr`.`training_type_id` = `tt`.`training_type_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-14  8:50:43
