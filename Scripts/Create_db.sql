-- Лабораторная работа 5. Программная реализация БД «Basketball School»
-- СУБД: MySQL / MariaDB (XAMPP)
-- Скрипт создаёт учебную БД basketball_school и заполняет её тестовыми данными.
CREATE DATABASE basketball_school
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;
USE basketball_school;

-- 1. Создание таблиц.
CREATE TABLE age_categories (
    age_category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL,
    min_age INT NOT NULL,
    max_age INT NOT NULL
) ENGINE=InnoDB;

CREATE TABLE trainers (
    trainer_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    specialization VARCHAR(100) NOT NULL,
    hire_date DATE NOT NULL
) ENGINE=InnoDB;

CREATE TABLE halls (
    hall_id INT AUTO_INCREMENT PRIMARY KEY,
    hall_name VARCHAR(60) NOT NULL,
    address VARCHAR(150) NOT NULL,
    capacity INT NOT NULL
) ENGINE=InnoDB;

CREATE TABLE training_types (
    training_type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(60) NOT NULL,
    description VARCHAR(255) NULL
) ENGINE=InnoDB;

CREATE TABLE `groups` (
    group_id INT AUTO_INCREMENT PRIMARY KEY,
    group_name VARCHAR(50) NOT NULL,
    max_athletes INT NOT NULL,
    created_date DATE NOT NULL,
    age_category_id INT NOT NULL,
    trainer_id INT NOT NULL
) ENGINE=InnoDB;

CREATE TABLE athletes (
    athlete_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    birth_date DATE NOT NULL,
    phone VARCHAR(20) NULL,
    parent_full_name VARCHAR(100) NOT NULL,
    parent_phone VARCHAR(20) NOT NULL,
    admission_date DATE NOT NULL,
    group_id INT NOT NULL
) ENGINE=InnoDB;

CREATE TABLE trainings (
    training_id INT AUTO_INCREMENT PRIMARY KEY,
    training_date DATE NOT NULL,
    start_time TIME NOT NULL,
    duration_minutes INT NOT NULL,
    training_status VARCHAR(30) NOT NULL,
    group_id INT NOT NULL,
    hall_id INT NOT NULL,
    training_type_id INT NOT NULL
) ENGINE=InnoDB;

CREATE TABLE attendance (
    training_id INT NOT NULL,
    athlete_id INT NOT NULL,
    attendance_status VARCHAR(30) NOT NULL,
    PRIMARY KEY (training_id, athlete_id)
) ENGINE=InnoDB;

-- 2. Изменение структуры таблицы.
-- Поле комментария добавляется после создания таблицы trainings.
ALTER TABLE trainings
    ADD COLUMN `comment` VARCHAR(255) NULL AFTER training_status;

-- 3. Создание внешних ключей и связей между таблицами.
ALTER TABLE `groups`
    ADD CONSTRAINT fk_groups_age_category
        FOREIGN KEY (age_category_id) REFERENCES age_categories(age_category_id),
    ADD CONSTRAINT fk_groups_trainer
        FOREIGN KEY (trainer_id) REFERENCES trainers(trainer_id);

ALTER TABLE athletes
    ADD CONSTRAINT fk_athletes_group
        FOREIGN KEY (group_id) REFERENCES `groups`(group_id);

ALTER TABLE trainings
    ADD CONSTRAINT fk_trainings_group
        FOREIGN KEY (group_id) REFERENCES `groups`(group_id),
    ADD CONSTRAINT fk_trainings_hall
        FOREIGN KEY (hall_id) REFERENCES halls(hall_id),
    ADD CONSTRAINT fk_trainings_type
        FOREIGN KEY (training_type_id) REFERENCES training_types(training_type_id);

ALTER TABLE attendance
    ADD CONSTRAINT fk_attendance_training
        FOREIGN KEY (training_id) REFERENCES trainings(training_id)
        ON DELETE CASCADE,
    ADD CONSTRAINT fk_attendance_athlete
        FOREIGN KEY (athlete_id) REFERENCES athletes(athlete_id)
        ON DELETE CASCADE;

-- Ограничения допустимых числовых значений.
ALTER TABLE age_categories
    ADD CONSTRAINT chk_age_categories_range
    CHECK (min_age BETWEEN 0 AND 99
       AND max_age BETWEEN 0 AND 99
       AND min_age <= max_age);

ALTER TABLE halls
    ADD CONSTRAINT chk_halls_capacity
    CHECK (capacity BETWEEN 1 AND 100);

ALTER TABLE `groups`
    ADD CONSTRAINT chk_groups_max_athletes
    CHECK (max_athletes BETWEEN 1 AND 40);

ALTER TABLE trainings
    ADD CONSTRAINT chk_trainings_duration
    CHECK (duration_minutes BETWEEN 30 AND 180);

-- 4. Вставка тестовых данных.
INSERT INTO age_categories (category_name, min_age, max_age) VALUES
    ('9-10 лет', 9, 10),
    ('11-12 лет', 11, 12),
    ('13-14 лет', 13, 14);

INSERT INTO trainers (full_name, phone, specialization, hire_date) VALUES
    ('Иванов Сергей Петрович', '+79001234501', 'Техническая подготовка', '2021-08-20'),
    ('Кузнецов Андрей Викторович', '+79001234502', 'Физическая подготовка', '2020-09-01'),
    ('Смирнова Ольга Игоревна', '+79001234503', 'Тактическая подготовка', '2022-01-15');

INSERT INTO halls (hall_name, address, capacity) VALUES
    ('Большой спортивный зал', 'ул. Спортивная, д. 10', 60),
    ('Малый спортивный зал', 'ул. Спортивная, д. 10', 25);

INSERT INTO training_types (type_name, description) VALUES
    ('Техническая', 'Ведение мяча, передачи и броски'),
    ('Физическая', 'Развитие силы, скорости и выносливости'),
    ('Тактическая', 'Командные взаимодействия и разбор игровых ситуаций');

INSERT INTO `groups` (group_name, max_athletes, created_date, age_category_id, trainer_id) VALUES
    ('Юниоры 9-10', 16, '2024-09-01', 1, 1),
    ('Юниоры 11-12', 18, '2024-09-01', 2, 2),
    ('Старшая группа', 20, '2024-09-01', 3, 3);

INSERT INTO athletes
    (full_name, gender, birth_date, phone, parent_full_name, parent_phone, admission_date, group_id)
VALUES
    ('Петров Максим Андреевич', 'Мужской', '2015-04-12', '+79005550101', 'Петров Андрей Викторович', '+79005550111', '2024-09-05', 1),
    ('Соколова Анна Дмитриевна', 'Женский', '2015-10-03', NULL, 'Соколова Марина Викторовна', '+79005550112', '2024-09-07', 1),
    ('Волков Артём Сергеевич', 'Мужской', '2014-02-20', '+79005550103', 'Волков Сергей Николаевич', '+79005550113', '2024-09-03', 2),
    ('Орлова Елизавета Павловна', 'Женский', '2014-07-18', '+79005550104', 'Орлова Светлана Павловна', '+79005550114', '2024-09-10', 2),
    ('Морозов Кирилл Олегович', 'Мужской', '2013-05-09', '+79005550105', 'Морозов Олег Викторович', '+79005550115', '2024-09-02', 3),
    ('Белова Дарья Романовна', 'Женский', '2013-11-27', '+79005550106', 'Белова Ирина Романовна', '+79005550116', '2024-09-04', 3);

INSERT INTO trainings
    (training_date, start_time, duration_minutes, training_status, `comment`, group_id, hall_id, training_type_id)
VALUES
    ('2025-09-08', '16:00:00', 90, 'Проведена', 'Отработка ведения мяча', 1, 2, 1),
    ('2025-09-09', '17:30:00', 90, 'Проведена', 'Круговая физическая тренировка', 2, 1, 2),
    ('2025-09-10', '18:00:00', 90, 'Проведена', 'Командная игра 3 на 3', 3, 1, 3),
    ('2025-09-15', '16:00:00', 90, 'Запланирована', NULL, 1, 2, 1);

INSERT INTO attendance (training_id, athlete_id, attendance_status) VALUES
    (1, 1, 'Присутствовал'),
    (1, 2, 'Присутствовал'),
    (2, 3, 'Присутствовал'),
    (2, 4, 'Уважительная причина'),
    (3, 5, 'Присутствовал'),
    (3, 6, 'Отсутствовал');

-- 5. Изменение данных.
UPDATE athletes
SET phone = '+79005550102'
WHERE athlete_id = 2;

-- 6. Удаление тестовой записи.
INSERT INTO training_types (type_name, description)
VALUES ('Пробный вид', 'Временная запись для проверки DELETE');

DELETE FROM training_types
WHERE type_name = 'Пробный вид';

-- 7. Создание пользователей и назначение прав.
DROP USER IF EXISTS 'admin_school'@'localhost';
DROP USER IF EXISTS 'trainer_school'@'localhost';
DROP USER IF EXISTS 'manager_school'@'localhost';

CREATE USER 'admin_school'@'localhost' IDENTIFIED BY 'AdminSchool2026!';
CREATE USER 'trainer_school'@'localhost' IDENTIFIED BY 'TrainerSchool2026!';
CREATE USER 'manager_school'@'localhost' IDENTIFIED BY 'ManagerSchool2026!';

-- Администратор управляет всеми данными учебной БД.
GRANT ALL PRIVILEGES ON basketball_school.* TO 'admin_school'@'localhost';

-- Тренер просматривает данные и меняет только статус посещаемости.
GRANT SELECT ON basketball_school.* TO 'trainer_school'@'localhost';
GRANT UPDATE (attendance_status) ON basketball_school.attendance TO 'trainer_school'@'localhost';

-- Руководитель имеет доступ только на просмотр для получения отчётов.
GRANT SELECT ON basketball_school.* TO 'manager_school'@'localhost';

-- 8. Выгрузка метаданных всех итоговых таблиц.
DESCRIBE age_categories;
DESCRIBE trainers;
DESCRIBE halls;
DESCRIBE training_types;
DESCRIBE `groups`;
DESCRIBE athletes;
DESCRIBE trainings;
DESCRIBE attendance;