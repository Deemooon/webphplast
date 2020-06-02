-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 01 2020 г., 07:56
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `schedule_moiseenko`
--

-- --------------------------------------------------------

--
-- Структура таблицы `classroom_moiseenko`
--

CREATE TABLE `classroom_moiseenko` (
  `classroom_id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `day_moiseenko`
--

CREATE TABLE `day_moiseenko` (
  `day_id` tinyint(4) NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `day_moiseenko`
--

INSERT INTO `day_moiseenko` (`day_id`, `name`) VALUES
(1, 'Понедельник'),
(2, 'Вторник'),
(3, 'Среда'),
(4, 'Четверг'),
(5, 'Пятница'),
(6, 'Суббота');

-- --------------------------------------------------------

--
-- Структура таблицы `gender_moiseenko`
--

CREATE TABLE `gender_moiseenko` (
  `gender_id` tinyint(4) NOT NULL,
  `name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `gender_moiseenko`
--

INSERT INTO `gender_moiseenko` (`gender_id`, `name`) VALUES
(1, 'Мужской'),
(2, 'Женский');

-- --------------------------------------------------------

--
-- Структура таблицы `gruppa_moiseenko`
--

CREATE TABLE `gruppa_moiseenko` (
  `gruppa_id` int(11) NOT NULL,
  `name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `special_id` int(11) NOT NULL,
  `date_begin` date NOT NULL,
  `date_end` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `lesson_num_moiseenko`
--

CREATE TABLE `lesson_num_moiseenko` (
  `lesson_num_id` int(11) NOT NULL,
  `name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_lesson` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `lesson_num_moiseenko`
--

INSERT INTO `lesson_num_moiseenko` (`lesson_num_id`, `name`, `time_lesson`) VALUES
(1, '1 пара', '08:30:00'),
(2, '2 пара', '10:10:00'),
(3, '3 пара', '12:20:00'),
(4, '4 пара', '14:00:00'),
(5, '5 пара', '15:40:00');

-- --------------------------------------------------------

--
-- Структура таблицы `lesson_plan_moiseenko`
--

CREATE TABLE `lesson_plan_moiseenko` (
  `lesson_plan_id` int(11) NOT NULL,
  `gruppa_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `otdel_moiseenko`
--

CREATE TABLE `otdel_moiseenko` (
  `otdel_id` smallint(6) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `otdel_moiseenko`
--

INSERT INTO `otdel_moiseenko` (`otdel_id`, `name`, `active`) VALUES
(1, 'Программирование', 1),
(2, 'Общеобразовательные дисциплины', 1),
(3, 'Строительство', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `role_moiseenko`
--

CREATE TABLE `role_moiseenko` (
  `role_id` tinyint(4) NOT NULL,
  `sys_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `role_moiseenko`
--

INSERT INTO `role_moiseenko` (`role_id`, `sys_name`, `name`, `active`) VALUES
(1, 'admin', 'Администратор', 1),
(2, 'manager', 'Менеджер', 1),
(3, 'teacher', 'Преподаватель', 1),
(4, 'student', 'Студент', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `schedule_moiseenko`
--

CREATE TABLE `schedule_moiseenko` (
  `schedule_id` int(11) NOT NULL,
  `lesson_plan_id` int(11) NOT NULL,
  `day_id` tinyint(4) NOT NULL,
  `lesson_num_id` int(11) NOT NULL,
  `classroom_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `special_moiseenko`
--

CREATE TABLE `special_moiseenko` (
  `special_id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otdel_id` smallint(6) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `special_moiseenko`
--

INSERT INTO `special_moiseenko` (`special_id`, `name`, `otdel_id`, `active`) VALUES
(1, 'Информационные системы', 1, 1),
(2, 'Нефтегазовое дело', 2, 1),
(3, 'Строительство и эксплуатация зданий и сооружений', 3, 1),
(4, 'Электроснабжение', 3, 1),
(5, 'Вычислительная техника и программное обеспечение', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `student_moiseenko`
--

CREATE TABLE `student_moiseenko` (
  `user_id` bigint(20) NOT NULL,
  `gruppa_id` int(11) NOT NULL,
  `num_zach` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `subject_moiseenko`
--

CREATE TABLE `subject_moiseenko` (
  `subject_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otdel_id` smallint(6) NOT NULL,
  `hours` smallint(6) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `teacher_moiseenko`
--

CREATE TABLE `teacher_moiseenko` (
  `user_id` bigint(20) NOT NULL,
  `otdel_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `user_moiseenko`
--

CREATE TABLE `user_moiseenko` (
  `user_id` bigint(20) NOT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patronymic` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pass` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender_id` tinyint(4) NOT NULL,
  `birthday` date DEFAULT NULL,
  `role_id` tinyint(4) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `classroom_moiseenko`
--
ALTER TABLE `classroom_moiseenko`
  ADD PRIMARY KEY (`classroom_id`);

--
-- Индексы таблицы `day_moiseenko`
--
ALTER TABLE `day_moiseenko`
  ADD PRIMARY KEY (`day_id`);

--
-- Индексы таблицы `gender_moiseenko`
--
ALTER TABLE `gender_moiseenko`
  ADD PRIMARY KEY (`gender_id`);

--
-- Индексы таблицы `gruppa_moiseenko`
--
ALTER TABLE `gruppa_moiseenko`
  ADD PRIMARY KEY (`gruppa_id`),
  ADD KEY `FK_gruppa_moiseenko_special_moiseenko_special_id` (`special_id`);

--
-- Индексы таблицы `lesson_num_moiseenko`
--
ALTER TABLE `lesson_num_moiseenko`
  ADD PRIMARY KEY (`lesson_num_id`);

--
-- Индексы таблицы `lesson_plan_moiseenko`
--
ALTER TABLE `lesson_plan_moiseenko`
  ADD PRIMARY KEY (`lesson_plan_id`),
  ADD KEY `FK_lesson_plan_moiseenko_gruppa_moiseenko_gruppa_id` (`gruppa_id`),
  ADD KEY `FK_lesson_plan_moiseenko_subject_moiseenko_subject_id` (`subject_id`),
  ADD KEY `FK_lesson_plan_moiseenko` (`user_id`);

--
-- Индексы таблицы `otdel_moiseenko`
--
ALTER TABLE `otdel_moiseenko`
  ADD PRIMARY KEY (`otdel_id`);

--
-- Индексы таблицы `role_moiseenko`
--
ALTER TABLE `role_moiseenko`
  ADD PRIMARY KEY (`role_id`);

--
-- Индексы таблицы `schedule_moiseenko`
--
ALTER TABLE `schedule_moiseenko`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `FK_schedule_moiseenko_lesson_num_moiseenko_lesson_num_id` (`lesson_num_id`),
  ADD KEY `FK_schedule_moiseenko_lesson_plan_moiseenko_lesson_plan_id` (`lesson_plan_id`),
  ADD KEY `FK_schedule_moiseenko_classroom_moiseenko_classroom_id` (`classroom_id`),
  ADD KEY `FK_schedule_moiseenko_day_moiseenko_day_id` (`day_id`);

--
-- Индексы таблицы `special_moiseenko`
--
ALTER TABLE `special_moiseenko`
  ADD PRIMARY KEY (`special_id`),
  ADD KEY `FK_special_moiseenko_otdel_moiseenko_otdel_id` (`otdel_id`);

--
-- Индексы таблицы `student_moiseenko`
--
ALTER TABLE `student_moiseenko`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `FK_student_moiseenko_gruppa_moiseenko_gruppa_id` (`gruppa_id`);

--
-- Индексы таблицы `subject_moiseenko`
--
ALTER TABLE `subject_moiseenko`
  ADD PRIMARY KEY (`subject_id`),
  ADD KEY `FK_subject_moiseenko_otdel_moiseenko_otdel_id` (`otdel_id`);

--
-- Индексы таблицы `teacher_moiseenko`
--
ALTER TABLE `teacher_moiseenko`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `FK_teacher_moiseenko_otdel_moiseenko_otdel_id` (`otdel_id`);

--
-- Индексы таблицы `user_moiseenko`
--
ALTER TABLE `user_moiseenko`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `FK_user_moiseenko_gender_moiseenko_gender_id` (`gender_id`),
  ADD KEY `FK_user_moiseenko_role_moiseenko_role_id` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `classroom_moiseenko`
--
ALTER TABLE `classroom_moiseenko`
  MODIFY `classroom_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `day_moiseenko`
--
ALTER TABLE `day_moiseenko`
  MODIFY `day_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `gender_moiseenko`
--
ALTER TABLE `gender_moiseenko`
  MODIFY `gender_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `gruppa_moiseenko`
--
ALTER TABLE `gruppa_moiseenko`
  MODIFY `gruppa_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `lesson_num_moiseenko`
--
ALTER TABLE `lesson_num_moiseenko`
  MODIFY `lesson_num_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `lesson_plan_moiseenko`
--
ALTER TABLE `lesson_plan_moiseenko`
  MODIFY `lesson_plan_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `otdel_moiseenko`
--
ALTER TABLE `otdel_moiseenko`
  MODIFY `otdel_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `role_moiseenko`
--
ALTER TABLE `role_moiseenko`
  MODIFY `role_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `schedule_moiseenko`
--
ALTER TABLE `schedule_moiseenko`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `special_moiseenko`
--
ALTER TABLE `special_moiseenko`
  MODIFY `special_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `subject_moiseenko`
--
ALTER TABLE `subject_moiseenko`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user_moiseenko`
--
ALTER TABLE `user_moiseenko`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `lesson_plan_moiseenko`
--
ALTER TABLE `lesson_plan_moiseenko`
  ADD CONSTRAINT `FK_lesson_plan_moiseenko_gruppa_moiseenko_gruppa_id` FOREIGN KEY (`gruppa_id`) REFERENCES `gruppa_moiseenko` (`gruppa_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_lesson_plan_moiseenko_subject_moiseenko_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subject_moiseenko` (`subject_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_lesson_plan_moiseenko_teacher_moiseenko_user_id` FOREIGN KEY (`user_id`) REFERENCES `teacher_moiseenko` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `schedule_moiseenko`
--
ALTER TABLE `schedule_moiseenko`
  ADD CONSTRAINT `FK_schedule_moiseenko_classroom_moiseenko_classroom_id` FOREIGN KEY (`classroom_id`) REFERENCES `classroom_moiseenko` (`classroom_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_schedule_moiseenko_day_moiseenko_day_id` FOREIGN KEY (`day_id`) REFERENCES `day_moiseenko` (`day_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_schedule_moiseenko_lesson_num_moiseenko_lesson_num_id` FOREIGN KEY (`lesson_num_id`) REFERENCES `lesson_num_moiseenko` (`lesson_num_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_schedule_moiseenko_lesson_plan_moiseenko_lesson_plan_id` FOREIGN KEY (`lesson_plan_id`) REFERENCES `lesson_plan_moiseenko` (`lesson_plan_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `special_moiseenko`
--
ALTER TABLE `special_moiseenko`
  ADD CONSTRAINT `FK_special_moiseenko_otdel_moiseenko_otdel_id` FOREIGN KEY (`otdel_id`) REFERENCES `otdel_moiseenko` (`otdel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `student_moiseenko`
--
ALTER TABLE `student_moiseenko`
  ADD CONSTRAINT `FK_student_moiseenko_gruppa_moiseenko_gruppa_id` FOREIGN KEY (`gruppa_id`) REFERENCES `gruppa_moiseenko` (`gruppa_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_student_moiseenko_user_moiseenko_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_moiseenko` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `subject_moiseenko`
--
ALTER TABLE `subject_moiseenko`
  ADD CONSTRAINT `FK_subject_moiseenko_otdel_moiseenko_otdel_id` FOREIGN KEY (`otdel_id`) REFERENCES `otdel_moiseenko` (`otdel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `teacher_moiseenko`
--
ALTER TABLE `teacher_moiseenko`
  ADD CONSTRAINT `FK_teacher_moiseenko_user_moiseenko_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_moiseenko` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `user_moiseenko`
--
ALTER TABLE `user_moiseenko`
  ADD CONSTRAINT `FK_user_moiseenko_gender_moiseenko_gender_id` FOREIGN KEY (`gender_id`) REFERENCES `gender_moiseenko` (`gender_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_user_moiseenko_role_moiseenko_role_id` FOREIGN KEY (`role_id`) REFERENCES `role_moiseenko` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
