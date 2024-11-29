-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-11-2024 a las 16:41:19
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `eduwebb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activities`
--

CREATE TABLE `activities` (
  `id` int(11) NOT NULL,
  `lesson_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `activities`
--

INSERT INTO `activities` (`id`, `lesson_id`, `title`, `description`) VALUES
(1, 1, 'Actividad 1: Crear una página en PHP', 'Actividad de práctica con PHP'),
(2, 2, 'Actividad 1: Crear un script en JS', 'Actividad de práctica con JavaScript'),
(3, 3, 'Actividad 1: Crear una página web con HTML y CSS', 'Actividad de práctica con HTML y CSS'),
(4, 4, 'Actividad 1: Optimización SEO básica', 'Actividad de práctica de SEO'),
(5, 5, 'Actividad 1: Investigación sobre Sociología', 'Actividad de investigación sobre Sociología');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(1, 'Programación', 'Cursos sobre desarrollo de software'),
(2, 'Diseño Web', 'Cursos de desarrollo frontend y diseño web'),
(3, 'Marketing Digital', 'Cursos sobre estrategias de marketing en línea'),
(4, 'Ciencias Sociales', 'Cursos sobre historia, geografía y otros temas sociales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `certificates`
--

CREATE TABLE `certificates` (
  `id` int(11) NOT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `certificate_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `certificates`
--

INSERT INTO `certificates` (`id`, `profile_id`, `course_id`, `certificate_date`) VALUES
(1, 1, 1, '2024-11-29 03:10:08'),
(2, 2, 2, '2024-11-29 03:10:08'),
(3, 3, 3, '2024-11-29 03:10:08'),
(4, 4, 4, '2024-11-29 03:10:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `courses`
--

INSERT INTO `courses` (`id`, `name`, `description`, `category_id`) VALUES
(1, 'Curso de PHP', 'Curso introductorio a PHP', 1),
(2, 'Curso de JavaScript', 'Curso de desarrollo web con JS', 1),
(3, 'Curso de HTML y CSS', 'Curso básico de desarrollo web', 2),
(4, 'Curso de SEO', 'Curso sobre optimización en motores de búsqueda', 3),
(5, 'Introducción a la Sociología', 'Conceptos básicos de la sociología', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `course_progress`
--

CREATE TABLE `course_progress` (
  `id` int(11) NOT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `progress` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `course_progress`
--

INSERT INTO `course_progress` (`id`, `profile_id`, `course_id`, `progress`) VALUES
(1, 1, 1, 75.50),
(2, 2, 2, 50.00),
(3, 3, 3, 80.00),
(4, 4, 4, 40.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluations`
--

CREATE TABLE `evaluations` (
  `id` int(11) NOT NULL,
  `lesson_id` int(11) DEFAULT NULL,
  `question` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `evaluations`
--

INSERT INTO `evaluations` (`id`, `lesson_id`, `question`, `answer`) VALUES
(1, 1, '¿Qué es PHP?', 'PHP es un lenguaje de programación de servidor'),
(2, 2, '¿Qué es JavaScript?', 'JavaScript es un lenguaje de programación para la web'),
(3, 3, '¿Qué es HTML?', 'HTML es el lenguaje de marcado para la web'),
(4, 4, '¿Qué es SEO?', 'SEO es la optimización para motores de búsqueda'),
(5, 5, '¿Qué es Sociología?', 'La sociología estudia la sociedad humana');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lessons`
--

CREATE TABLE `lessons` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `instructor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `lessons`
--

INSERT INTO `lessons` (`id`, `course_id`, `title`, `content`, `duration`, `instructor_id`) VALUES
(1, 1, 'Lección 1: Introducción a PHP', 'Contenido de la lección de PHP', 60, 3),
(2, 2, 'Lección 1: Introducción a JavaScript', 'Contenido de la lección de JS', 60, 2),
(3, 3, 'Lección 1: Fundamentos de HTML y CSS', 'Contenido de HTML y CSS', 45, 1),
(4, 4, 'Lección 1: Optimización SEO', 'Contenido de SEO', 50, 4),
(5, 5, 'Lección 1: Sociología Básica', 'Contenido de Sociología', 55, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `action_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `logs`
--

INSERT INTO `logs` (`id`, `profile_id`, `action`, `action_date`) VALUES
(1, 1, 'Se registró en el curso de PHP', '2024-11-29 03:10:08'),
(2, 2, 'Se registró en el curso de JavaScript', '2024-11-29 03:10:08'),
(3, 3, 'Completó la lección 1 de HTML y CSS', '2024-11-29 03:10:08'),
(4, 4, 'Completó el curso de Sociología', '2024-11-29 03:10:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `payments`
--

INSERT INTO `payments` (`id`, `profile_id`, `amount`, `payment_date`) VALUES
(1, 1, 100.00, '2024-11-29 03:10:08'),
(2, 2, 150.00, '2024-11-29 03:10:08'),
(3, 3, 50.00, '2024-11-29 03:10:08'),
(4, 4, 120.00, '2024-11-29 03:10:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profiles`
--

CREATE TABLE `profiles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `profiles`
--

INSERT INTO `profiles` (`id`, `name`, `email`, `password`, `role_id`) VALUES
(1, 'John Doe', 'john.doe@example.com', 'password123', 1),
(2, 'Jane Smith', 'jane.smith@example.com', 'password123', 2),
(3, 'Carlos López', 'carlos.lopez@example.com', 'password123', 3),
(4, 'Ana García', 'ana.garcia@example.com', 'password123', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `description`) VALUES
(1, 'Administrador'),
(2, 'Estudiante'),
(3, 'Profesor'),
(4, 'Coordinador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `translations`
--

CREATE TABLE `translations` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `translated_name` varchar(255) DEFAULT NULL,
  `translated_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `translations`
--

INSERT INTO `translations` (`id`, `course_id`, `language`, `translated_name`, `translated_description`) VALUES
(1, 1, 'es', 'Curso de PHP', 'Curso introductorio a PHP en español'),
(2, 2, 'es', 'Curso de JavaScript', 'Curso de desarrollo web con JavaScript en español'),
(3, 3, 'es', 'Curso de HTML y CSS', 'Curso básico de desarrollo web con HTML y CSS en español'),
(4, 4, 'es', 'Curso de SEO', 'Curso sobre optimización en motores de búsqueda en español'),
(5, 5, 'es', 'Introducción a la Sociología', 'Conceptos básicos de la sociología en español');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_id` (`lesson_id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profile_id` (`profile_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indices de la tabla `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indices de la tabla `course_progress`
--
ALTER TABLE `course_progress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profile_id` (`profile_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indices de la tabla `evaluations`
--
ALTER TABLE `evaluations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_id` (`lesson_id`);

--
-- Indices de la tabla `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `instructor_id` (`instructor_id`);

--
-- Indices de la tabla `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profile_id` (`profile_id`);

--
-- Indices de la tabla `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profile_id` (`profile_id`);

--
-- Indices de la tabla `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `course_progress`
--
ALTER TABLE `course_progress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `evaluations`
--
ALTER TABLE `evaluations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `activities_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`);

--
-- Filtros para la tabla `certificates`
--
ALTER TABLE `certificates`
  ADD CONSTRAINT `certificates_ibfk_1` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`id`),
  ADD CONSTRAINT `certificates_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Filtros para la tabla `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Filtros para la tabla `course_progress`
--
ALTER TABLE `course_progress`
  ADD CONSTRAINT `course_progress_ibfk_1` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`id`),
  ADD CONSTRAINT `course_progress_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Filtros para la tabla `evaluations`
--
ALTER TABLE `evaluations`
  ADD CONSTRAINT `evaluations_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`);

--
-- Filtros para la tabla `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `lessons_ibfk_2` FOREIGN KEY (`instructor_id`) REFERENCES `profiles` (`id`);

--
-- Filtros para la tabla `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`id`);

--
-- Filtros para la tabla `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`id`);

--
-- Filtros para la tabla `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `translations`
--
ALTER TABLE `translations`
  ADD CONSTRAINT `translations_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
