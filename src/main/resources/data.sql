SET MODE MYSQL;

DROP TABLE IF EXISTS `airplanes`;
CREATE TABLE `airplanes`
(
  `id`   int(11)     NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = UTF8;

/*!40000 ALTER TABLE `airplanes`
  DISABLE KEYS */;
INSERT INTO `airplanes`
VALUES (1, 'Boeing 737'),
       (2, 'Airbus A320'),
       (3, 'Careless');
/*!40000 ALTER TABLE `airplanes`
  ENABLE KEYS */;

DROP TABLE IF EXISTS `passport_data`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
CREATE TABLE `passport_data`
(
  `id`           int(11)      NOT NULL AUTO_INCREMENT,
  `series`       char(2)      NOT NULL,
  `number`       char(6)      NOT NULL,
  `birthdate`    date         NOT NULL,
  `birth_place`  varchar(45)  NOT NULL,
  `sex`          char(6)      NOT NULL,
  `issue_place`  varchar(45)  NOT NULL,
  `issue_date`   date         NOT NULL,
  `registration` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 26
  DEFAULT CHARSET = UTF8;

/*!40000 ALTER TABLE `passport_data`
  DISABLE KEYS */;
INSERT INTO `passport_data`
VALUES (2, 'AO', '432176', '1974-01-04', 'Бавлы', 'male', 'Бавлы', '1988-01-01',
        '195176, г. Бавлы, ул. Академическая, дом 9, квартира 97'),
       (3, 'AO', '432124', '1979-02-27', 'Сычевка', 'male', 'Сычевка', '1989-01-01',
        '431242, г. Сычевка, ул. Белореченская, дом 26, квартира 271'),
       (5, 'AO', '985760', '1978-04-09', 'Київ', 'female', 'Київ', '2000-01-01',
        '35391, Київська область, місто Київ, пл. Генерала Жадова, 14'),
       (6, 'AO', '456354', '1957-02-26', 'Херсон', 'female', 'Херсон', '1978-01-01',
        '07778, Херсонська область, місто Херсон, пл. Пацаєва, 05'),
       (7, 'AO', '988338', '1967-01-20', 'Хмельницьк', 'male', 'Хмельницьк', '1980-01-01',
        '98833, Хмельницька область, місто Хмельницьк, вул. Леніна, 91'),
       (8, 'AO', '761763', '1990-10-27', 'Запоріжжя', 'female', 'Запоріжжя', '2008-10-27',
        '76176, Запорізька область, місто Запоріжжя, пров. 40 років Перемоги, 29'),
       (9, 'AO', '684245', '1981-04-13', 'Тернопіль', 'male', 'Тернопіль', '1999-04-13',
        '06842, Тернопільська область, місто Тернопіль, пров. Пацаєва, 11'),
       (10, 'AO', '950190', '1988-09-03', 'Вінниця', 'female', 'Вінниця', '2006-09-03',
        '95019, Вінницька область, місто Вінниця, вул. Генерала Жадова, 81'),
       (14, 'AО', '111222', '2014-04-26', 'Россошь', 'female', 'Россошь', '1991-04-05',
        '353911, г. Россошь, ул. Языковский Переулок, дом 58, квартира 128'),
       (16, 'АО', '142101', '1968-10-17', 'Пушкино', 'male', 'Пушкино', '1984-10-17',
        '142101, г. Пушкино, ул. Бирюсинка, дом 85, квартира 40'),
       (17, 'АА', '396642', '1978-03-16', 'Поддубное', 'male', 'Поддубное', '1992-03-16',
        '396642, г. Поддубное, ул. Федеративный Проспект, дом 41, квартира 222'),
       (18, 'АА', '679504', '1968-09-09', 'Петропавловск-Камчатский', 'female', 'Петропавловск-Камчатский',
        '1984-09-09', '679504, г. Петропавловск-Камчатский, ул. Краснопресненская Набережная, дом 85, квартира 232');
/*!40000 ALTER TABLE `passport_data`
  ENABLE KEYS */;

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
CREATE TABLE `clients`
(
  `id`               int(11)     NOT NULL AUTO_INCREMENT,
  `last_name`        varchar(45) NOT NULL,
  `first_name`       varchar(45) NOT NULL,
  `patronymic`       varchar(45) NOT NULL,
  `passport_data_id` int(11)     NOT NULL,
  PRIMARY KEY (`id`),
  KEY `passport_data_id_fk_idx` (`passport_data_id`),
  CONSTRAINT `passport_data_id_fk` FOREIGN KEY (`passport_data_id`) REFERENCES `passport_data` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 37
  DEFAULT CHARSET = UTF8;

--
-- Dumping data for table `clients`
--

/*!40000 ALTER TABLE `clients`
  DISABLE KEYS */;
INSERT INTO `clients`
VALUES (2, 'Охота', 'Казимир', 'Васильевич', 2),
       (3, 'Ефимов', 'Боголюб', 'Вадимович', 3),
       (5, 'Панасюк', 'Діана', 'Михайлівна', 5),
       (6, 'Крамаренко', 'Наташа', 'Йосиповна', 6),
       (7, 'Броварчук', 'Михайло', 'Іванович', 7),
       (8, 'Кравченко', 'Діана', 'Борисівна', 8),
       (9, 'Павлюк', 'Олександр', 'Федорович', 9),
       (10, 'Панасюк', 'Оксана', 'Тарасівна', 10),
       (25, 'Воронец', 'Меланья', 'Робертовна', 14),
       (27, 'Тихомиров', 'Дементий', 'Альбертович', 16),
       (29, 'Кочеткова', 'Дарина', 'Григорьевна', 18);
/*!40000 ALTER TABLE `clients`
  ENABLE KEYS */;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
CREATE TABLE `countries`
(
  `id`   int(11)     NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = UTF8;

--
-- Dumping data for table `countries`
--

/*!40000 ALTER TABLE `countries`
  DISABLE KEYS */;
INSERT INTO `countries`
VALUES (1, 'Ukraine'),
       (2, 'USA'),
       (3, 'England');
/*!40000 ALTER TABLE `countries`
  ENABLE KEYS */;

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
CREATE TABLE `cities`
(
  `id`         int(11)     NOT NULL AUTO_INCREMENT,
  `name`       varchar(45) NOT NULL,
  `country_id` int(11)     NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id_fk_idx` (`country_id`),
  CONSTRAINT `country_id_fk` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  DEFAULT CHARSET = UTF8;

--
-- Dumping data for table `cities`
--

/*!40000 ALTER TABLE `cities`
  DISABLE KEYS */;
INSERT INTO `cities`
VALUES (1, 'Dnipro', 1),
       (2, 'Kyiv', 1),
       (3, 'Lviv', 1),
       (4, 'New-York', 2),
       (5, 'Boston', 2),
       (6, 'California', 2),
       (7, 'London', 3),
       (8, 'Oxford', 3),
       (9, 'Liverpool', 3);
/*!40000 ALTER TABLE `cities`
  ENABLE KEYS */;

--
-- Table structure for table `flights`
--

DROP TABLE IF EXISTS `flights`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
CREATE TABLE `flights`
(
  `id`                int(11) NOT NULL AUTO_INCREMENT,
  `departure_city_id` int(11) NOT NULL,
  `arrival_city_id`   int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `departure_city_id_fk_idx` (`departure_city_id`),
  KEY `arrival_city_id_fk_idx` (`arrival_city_id`),
  CONSTRAINT `arrival_city_id_fk` FOREIGN KEY (`arrival_city_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `departure_city_id_fk` FOREIGN KEY (`departure_city_id`) REFERENCES `cities` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 19
  DEFAULT CHARSET = UTF8;

--
-- Dumping data for table `flights`
--

/*!40000 ALTER TABLE `flights`
  DISABLE KEYS */;
INSERT INTO `flights`
VALUES (1, 1, 2),
       (2, 2, 1),
       (3, 1, 3),
       (4, 3, 1),
       (6, 3, 2),
       (7, 4, 2),
       (8, 2, 4),
       (9, 2, 5),
       (10, 5, 2),
       (11, 2, 6),
       (12, 6, 2),
       (13, 2, 7),
       (14, 7, 2),
       (15, 2, 8),
       (16, 8, 2),
       (17, 4, 6),
       (18, 6, 4);
/*!40000 ALTER TABLE `flights`
  ENABLE KEYS */;


DROP TABLE IF EXISTS `phones`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
CREATE TABLE `phones`
(
  `id`        int(11)     NOT NULL AUTO_INCREMENT,
  `phone`     varchar(45) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id_fk_idx` (`client_id`),
  CONSTRAINT `client_id_fk` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 38
  DEFAULT CHARSET = UTF8;

--
-- Dumping data for table `phones`
--

/*!40000 ALTER TABLE `phones`
  DISABLE KEYS */;
INSERT INTO `phones`
VALUES (3, '+38 (093) 346 2571', 2),
       (4, '+38 (093) 261 3745', 2),
       (5, '+38 (066) 165 3724', 3),
       (6, '+38 (066) 325 6417', 3),
       (7, '', 3),
       (9, '+38 (093) 317 5264', 5),
       (10, '+38 (093) 325 4167', 6),
       (11, '+38 (093) 371 6245', 6),
       (12, '+38 (095) 143 2765', 7),
       (13, '+38 (095) 537 6421', 8),
       (14, '+38 (068) 762 3154', 8),
       (15, '+38 (068) 741 5623', 9),
       (16, '+38 (068) 163 5274', 10),
       (21, '8 (913) 516-88-77', 25),
       (25, '8 (919) 125-48-33', 27),
       (26, '8 (969) 206-36-59', 27),
       (27, '8 (910) 266-57-81', 27),
       (29, '8 (949) 590-59-65', 29);
/*!40000 ALTER TABLE `phones`
  ENABLE KEYS */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
CREATE TABLE `roles`
(
  `id`        int(11)      NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = UTF8;

--
-- Dumping data for table `roles`
--

/*!40000 ALTER TABLE `roles`
  DISABLE KEYS */;
INSERT INTO `roles`
VALUES (1, 'ADMIN'),
       (2, 'USER');
/*!40000 ALTER TABLE `roles`
  ENABLE KEYS */;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
CREATE TABLE `schedule`
(
  `id`             int(11)        NOT NULL AUTO_INCREMENT,
  `flight_id`      int(11)        NOT NULL,
  `airplane_id`    int(11)        NOT NULL,
  `departure_date` datetime       NOT NULL,
  `time`           time           NOT NULL,
  `price`          decimal(10, 2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `flight_id_in_shedule_fk` (`flight_id`),
  KEY `airplane_id_in_shedule_fk` (`airplane_id`) /*!80000 INVISIBLE */,
  CONSTRAINT `airplane_id_in_shedule_fk` FOREIGN KEY (`airplane_id`) REFERENCES `airplanes` (`id`),
  CONSTRAINT `flight_id_fk` FOREIGN KEY (`flight_id`) REFERENCES `flights` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 17
  DEFAULT CHARSET = UTF8;

--
-- Dumping data for table `schedule`
--

/*!40000 ALTER TABLE `schedule`
  DISABLE KEYS */;
INSERT INTO `schedule`
VALUES (1, 1, 1, '2019-06-15 09:00:00', '01:00:00', 2000.00),
       (2, 9, 3, '2019-06-15 06:00:00', '16:06:00', 11000.00),
       (3, 2, 1, '2019-06-15 11:00:00', '01:00:00', 2000.00),
       (4, 17, 2, '2019-06-16 12:00:00', '08:20:00', 9000.00),
       (5, 7, 1, '2019-06-16 13:00:00', '01:10:00', 10000.00),
       (6, 1, 1, '2019-06-15 15:00:00', '01:30:00', 5000.00),
       (7, 12, 2, '2019-06-16 23:00:00', '16:10:00', 18000.00),
       (9, 6, 1, '2019-06-15 21:00:00', '02:00:00', 3000.68),
       (10, 8, 3, '2019-06-15 23:00:00', '15:00:00', 10000.00),
       (11, 4, 1, '2019-06-15 23:59:00', '02:00:00', 5000.00),
       (12, 1, 1, '2019-06-16 04:00:00', '01:12:00', 3000.00),
       (13, 2, 1, '2019-06-16 11:00:00', '01:12:00', 3000.00),
       (14, 1, 1, '2019-06-16 13:00:00', '01:12:00', 3000.00),
       (16, 6, 1, '2019-06-15 17:00:00', '01:20:00', 5000.00);
/*!40000 ALTER TABLE `schedule`
  ENABLE KEYS */;

--
-- Table structure for table `seats`
--

DROP TABLE IF EXISTS `seats`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
CREATE TABLE `seats`
(
  `id`          int(11) NOT NULL AUTO_INCREMENT,
  `airplane_id` int(11) NOT NULL,
  `seat_number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `airplane_id_fk_idx` (`airplane_id`),
  CONSTRAINT `airplane_id_fk` FOREIGN KEY (`airplane_id`) REFERENCES `airplanes` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 329
  DEFAULT CHARSET = UTF8;

--
-- Dumping data for table `seats`
--

/*!40000 ALTER TABLE `seats`
  DISABLE KEYS */;
INSERT INTO `seats`
VALUES (1, 1, 108),
       (2, 1, 1),
       (3, 1, 2),
       (4, 1, 3),
       (5, 1, 4),
       (6, 1, 5),
       (7, 1, 6),
       (8, 1, 7),
       (9, 1, 8),
       (10, 1, 9),
       (11, 1, 10),
       (12, 1, 11),
       (13, 1, 12),
       (14, 1, 13),
       (15, 1, 14),
       (16, 1, 15),
       (17, 1, 16),
       (18, 1, 17),
       (19, 1, 18),
       (20, 1, 19),
       (21, 1, 20),
       (22, 1, 21),
       (23, 1, 22),
       (24, 1, 23),
       (25, 1, 24),
       (26, 1, 25),
       (27, 1, 26),
       (28, 1, 27),
       (29, 1, 28),
       (30, 1, 29),
       (31, 1, 30),
       (32, 1, 31),
       (33, 1, 32),
       (34, 1, 33),
       (35, 1, 34),
       (36, 1, 35),
       (37, 1, 36),
       (38, 1, 37),
       (39, 1, 38),
       (40, 1, 39),
       (41, 1, 40),
       (42, 1, 41),
       (43, 1, 42),
       (44, 1, 43),
       (45, 1, 44),
       (46, 1, 45),
       (47, 1, 46),
       (48, 1, 47),
       (49, 1, 48),
       (50, 1, 49),
       (51, 1, 50),
       (52, 1, 51),
       (53, 1, 52),
       (54, 1, 53),
       (55, 1, 54),
       (56, 1, 55),
       (57, 1, 56),
       (58, 1, 57),
       (59, 1, 58),
       (60, 1, 59),
       (61, 1, 60),
       (62, 1, 61),
       (63, 1, 62),
       (64, 1, 63),
       (65, 1, 64),
       (66, 1, 65),
       (67, 1, 66),
       (68, 1, 67),
       (69, 1, 68),
       (70, 1, 69),
       (71, 1, 70),
       (72, 1, 71),
       (73, 1, 72),
       (74, 1, 73),
       (75, 1, 74),
       (76, 1, 75),
       (77, 1, 76),
       (78, 1, 77),
       (79, 1, 78),
       (80, 1, 79),
       (81, 1, 80),
       (82, 1, 81),
       (83, 1, 82),
       (84, 1, 83),
       (85, 1, 84),
       (86, 1, 85),
       (87, 1, 86),
       (88, 1, 87),
       (89, 1, 88),
       (90, 1, 89),
       (91, 1, 90),
       (92, 1, 91),
       (93, 1, 92),
       (94, 1, 93),
       (95, 1, 94),
       (96, 1, 95),
       (97, 1, 96),
       (98, 1, 97),
       (99, 1, 98),
       (100, 1, 99),
       (101, 1, 100),
       (102, 1, 101),
       (103, 1, 102),
       (104, 1, 103),
       (105, 1, 104),
       (106, 1, 105),
       (107, 1, 106),
       (108, 1, 107),
       (109, 2, 1),
       (110, 2, 2),
       (111, 2, 3),
       (112, 2, 4),
       (113, 2, 5),
       (114, 2, 6),
       (115, 2, 7),
       (116, 2, 8),
       (117, 2, 9),
       (118, 2, 10),
       (119, 2, 11),
       (120, 2, 12),
       (121, 2, 13),
       (122, 2, 14),
       (123, 2, 15),
       (124, 2, 16),
       (125, 2, 17),
       (126, 2, 18),
       (127, 2, 19),
       (128, 2, 20),
       (129, 2, 21),
       (130, 2, 22),
       (131, 2, 23),
       (132, 2, 24),
       (133, 2, 25),
       (134, 2, 26),
       (135, 2, 27),
       (136, 2, 28),
       (137, 2, 29),
       (138, 2, 30),
       (139, 2, 31),
       (140, 2, 32),
       (141, 2, 33),
       (142, 2, 34),
       (143, 2, 35),
       (144, 2, 36),
       (145, 2, 37),
       (146, 2, 38),
       (147, 2, 39),
       (148, 2, 40),
       (149, 2, 41),
       (150, 2, 42),
       (151, 2, 43),
       (152, 2, 44),
       (153, 2, 45),
       (154, 2, 46),
       (155, 2, 47),
       (156, 2, 48),
       (157, 2, 49),
       (158, 2, 50),
       (159, 2, 51),
       (160, 2, 52),
       (161, 2, 53),
       (162, 2, 54),
       (163, 2, 55),
       (164, 2, 56),
       (165, 2, 57),
       (166, 2, 58),
       (167, 2, 59),
       (168, 2, 60),
       (169, 2, 61),
       (170, 2, 62),
       (171, 2, 63),
       (172, 2, 64),
       (173, 2, 65),
       (174, 2, 66),
       (175, 2, 67),
       (176, 2, 68),
       (177, 2, 69),
       (178, 2, 70),
       (179, 2, 71),
       (180, 2, 72),
       (181, 2, 73),
       (182, 2, 74),
       (183, 2, 75),
       (184, 2, 76),
       (185, 2, 77),
       (186, 2, 78),
       (187, 2, 79),
       (188, 2, 80),
       (189, 2, 81),
       (190, 2, 82),
       (191, 2, 83),
       (192, 2, 84),
       (193, 2, 85),
       (194, 2, 86),
       (195, 2, 87),
       (196, 2, 88),
       (197, 2, 89),
       (198, 2, 90),
       (199, 3, 1),
       (200, 3, 2),
       (201, 3, 3),
       (202, 3, 4),
       (203, 3, 5),
       (204, 3, 6),
       (205, 3, 7),
       (206, 3, 8),
       (207, 3, 9),
       (208, 3, 10),
       (209, 3, 11),
       (210, 3, 12),
       (211, 3, 13),
       (212, 3, 14),
       (213, 3, 15),
       (214, 3, 16),
       (215, 3, 17),
       (216, 3, 18),
       (217, 3, 19),
       (218, 3, 20),
       (219, 3, 21),
       (220, 3, 22),
       (221, 3, 23),
       (222, 3, 24),
       (223, 3, 25),
       (224, 3, 26),
       (225, 3, 27),
       (226, 3, 28),
       (227, 3, 29),
       (228, 3, 30),
       (229, 3, 31),
       (230, 3, 32),
       (231, 3, 33),
       (232, 3, 34),
       (233, 3, 35),
       (234, 3, 36),
       (235, 3, 37),
       (236, 3, 38),
       (237, 3, 39),
       (238, 3, 40),
       (239, 3, 41),
       (240, 3, 42),
       (241, 3, 43),
       (242, 3, 44),
       (243, 3, 45),
       (244, 3, 46),
       (245, 3, 47),
       (246, 3, 48),
       (247, 3, 49),
       (248, 3, 50),
       (249, 3, 51),
       (250, 3, 52),
       (251, 3, 53),
       (252, 3, 54),
       (253, 3, 55),
       (254, 3, 56),
       (255, 3, 57),
       (256, 3, 58),
       (257, 3, 59),
       (258, 3, 60),
       (259, 3, 61),
       (260, 3, 62),
       (261, 3, 63),
       (262, 3, 64),
       (263, 3, 65),
       (264, 3, 66),
       (265, 3, 67),
       (266, 3, 68),
       (267, 3, 69),
       (268, 3, 70),
       (269, 3, 71),
       (270, 3, 72),
       (271, 3, 73),
       (272, 3, 74),
       (273, 3, 75),
       (274, 3, 76),
       (275, 3, 77),
       (276, 3, 78),
       (277, 3, 79),
       (278, 3, 80),
       (279, 3, 81),
       (280, 3, 82),
       (281, 3, 83),
       (282, 3, 84),
       (283, 3, 85),
       (284, 3, 86),
       (285, 3, 87),
       (286, 3, 88),
       (287, 3, 89),
       (288, 3, 90),
       (289, 3, 91),
       (290, 3, 92),
       (291, 3, 93),
       (292, 3, 94),
       (293, 3, 95),
       (294, 3, 96),
       (295, 3, 97),
       (296, 3, 98),
       (297, 3, 99),
       (298, 3, 100),
       (299, 3, 101),
       (300, 3, 102),
       (301, 3, 103),
       (302, 3, 104),
       (303, 3, 105),
       (304, 3, 106),
       (305, 3, 107),
       (306, 3, 108),
       (307, 3, 109),
       (308, 3, 110),
       (309, 3, 111),
       (310, 3, 112),
       (311, 3, 113),
       (312, 3, 114),
       (313, 3, 115),
       (314, 3, 116),
       (315, 3, 117),
       (316, 3, 118),
       (317, 3, 119),
       (318, 3, 120),
       (319, 3, 121),
       (320, 3, 122),
       (321, 3, 123),
       (322, 3, 124),
       (323, 3, 125),
       (324, 3, 126),
       (325, 3, 127),
       (326, 3, 128),
       (327, 3, 129),
       (328, 3, 130);
/*!40000 ALTER TABLE `seats`
  ENABLE KEYS */;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
CREATE TABLE `tickets`
(
  `id`         int(11)  NOT NULL AUTO_INCREMENT,
  `shedule_id` int(11)  NOT NULL,
  `client_id`  int(11)  NOT NULL,
  `seat_id`    int(11)  NOT NULL,
  `sale_date`  datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shedule_id_fk_idx` (`shedule_id`),
  KEY `client_id_in_ticket_fk_idx` (`client_id`),
  KEY `seat_id_if_idx` (`seat_id`),
  CONSTRAINT `client_id_in_ticket_fk` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `seat_id_if` FOREIGN KEY (`seat_id`) REFERENCES `seats` (`id`),
  CONSTRAINT `shedule_id_fk` FOREIGN KEY (`shedule_id`) REFERENCES `schedule` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 26
  DEFAULT CHARSET = UTF8;

--
-- Dumping data for table `tickets`
--

/*!40000 ALTER TABLE `tickets`
  DISABLE KEYS */;
INSERT INTO `tickets`
VALUES (2, 6, 8, 71, '2019-04-28 12:26:08'),
       (5, 9, 9, 18, '2019-04-28 14:38:22'),
       (6, 6, 7, 17, '2019-04-28 14:38:52'),
       (7, 7, 3, 172, '2019-04-28 14:39:22'),
       (8, 12, 8, 3, '2019-04-29 09:04:16'),
       (12, 11, 29, 12, '2019-04-30 06:50:55'),
       (15, 11, 6, 30, '2019-05-03 10:55:56'),
       (16, 7, 7, 113, '2019-05-04 04:05:00'),
       (18, 4, 29, 130, '2019-05-04 04:40:36'),
       (19, 4, 8, 141, '2019-05-04 04:52:05'),
       (20, 3, 29, 22, '2019-05-08 07:16:10'),
       (21, 1, 29, 32, '2019-05-08 07:19:11'),
       (22, 1, 3, 13, '2019-05-09 15:54:02'),
       (23, 1, 25, 19, '2019-05-09 16:14:36'),
       (25, 1, 5, 30, '2019-05-20 11:55:54');
/*!40000 ALTER TABLE `tickets`
  ENABLE KEYS */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
CREATE TABLE `users`
(
  `id`       int(11)      NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active`   tinyint(1)   NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 26
  DEFAULT CHARSET = UTF8;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users`
  DISABLE KEYS */;
INSERT INTO `users`
VALUES (1, 'admin', '$2a$08$ZKI9rcH4PRoB7a.wgrwwSOR6H63QETlGQefu.xGUBKaCWPCy6uJKy', 1),
       (23, 'u', '$2a$08$bZfyo6zzg4gWqOdAaocgH.pwDUU4JfUJWyYX4iWe9h5BoSTx6f3x2', 1),
       (24, 'a', '$2a$08$7MLLKvBwmxDq11e0uClap.rzGptw0tBa6cFNRkUgsWPaHvMe0eEMy', 1),
       (25, 'vova', '$2a$08$Gqnm7Lc9pnrFthZD2r2kz.PGs0jAkI4U0.mMAQtxM3JySQzscI2Q2', 1);
/*!40000 ALTER TABLE `users`
  ENABLE KEYS */;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
CREATE TABLE `users_roles`
(
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`),
  KEY `role_id_fk_idx` (`role_id`),
  CONSTRAINT `role_id_fk` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `user_id_roles_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = UTF8;

--
-- Dumping data for table `users_roles`
--

/*!40000 ALTER TABLE `users_roles`
  DISABLE KEYS */;
INSERT INTO `users_roles`
VALUES (1, 1),
       (24, 1),
       (23, 2),
       (25, 2);
/*!40000 ALTER TABLE `users_roles`
  ENABLE KEYS */;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2019-05-20 15:22:28
