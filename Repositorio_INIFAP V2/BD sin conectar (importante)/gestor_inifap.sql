-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 24-09-2026 a las 06:39:17
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
-- Base de datos: `gestor_inifap`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivos`
--

CREATE TABLE `archivos` (
  `id` int(11) NOT NULL,
  `subcategoria_id` int(11) NOT NULL,
  `nombre_archivo` varchar(255) NOT NULL,
  `ruta_completa` varchar(500) NOT NULL,
  `extension` varchar(20) NOT NULL,
  `fecha_registro` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `archivos`
--

INSERT INTO `archivos` (`id`, `subcategoria_id`, `nombre_archivo`, `ruta_completa`, `extension`, `fecha_registro`) VALUES
(1, 2, '1998 ANÁLISIS DEL ARRIME DE TROCERÍA CON MOTOGRÚA EN UNA EMPRESA FORESTAL (Estudio de caso) Folleto científicio 6.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/SIN ISBN/1998 ANÁLISIS DEL ARRIME DE TROCERÍA CON MOTOGRÚA EN UNA EMPRESA FORESTAL (Estudio de caso) Folleto científicio 6.pdf', 'pdf', '2026-09-24 04:02:06'),
(2, 2, '1998 Efecto de quemas controladas en la reducción de desperdicios forestales en Durango. Folleto Técnico 4.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/SIN ISBN/1998 Efecto de quemas controladas en la reducción de desperdicios forestales en Durango. Folleto Técnico 4.pdf', 'pdf', '2026-09-24 04:02:06'),
(3, 2, '1998 PRODUCCION DE PLANTA FORESTAL FOLLETO 10.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/SIN ISBN/1998 PRODUCCION DE PLANTA FORESTAL FOLLETO 10.pdf', 'pdf', '2026-09-24 04:02:06'),
(4, 2, '2022 LA DIVESIDAD DEL FRIJOL EN EL ESTADO DE DURANGO Folleto técnico 123.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2022 LA DIVESIDAD DEL FRIJOL EN EL ESTADO DE DURANGO Folleto técnico 123.pdf', 'pdf', '2026-09-24 04:02:07'),
(5, 2, '2013 Uso de fertilizantes orgánicos en manzano - copia.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2013 Uso de fertilizantes orgánicos en manzano - copia.pdf', 'pdf', '2026-09-24 04:02:07'),
(6, 2, '2001 Guía para el control químico de las plagas del manzano en Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2001 Guía para el control químico de las plagas del manzano en Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(7, 2, '2022 Fitopatógenos asociados del chile en Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2022 Fitopatógenos asociados del chile en Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(8, 2, '2013 Uso de fertilizantes orgánicos en manzano.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2013 Uso de fertilizantes orgánicos en manzano.pdf', 'pdf', '2026-09-24 04:02:07'),
(9, 2, '2018 Buenas prácticas agrícolas para la producción de especies hortícolas en Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2018 Buenas prácticas agrícolas para la producción de especies hortícolas en Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(10, 2, '2010 Pinto Saltillo fechas de siembra, fenología y rendimiento.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2010 Pinto Saltillo fechas de siembra, fenología y rendimiento.pdf', 'pdf', '2026-09-24 04:02:07'),
(11, 2, '2018 Producción de calabaza (Curcubita pepo L.) con abonado orgánico bajo invernadero.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2018 Producción de calabaza (Curcubita pepo L.) con abonado orgánico bajo invernadero.pdf', 'pdf', '2026-09-24 04:02:07'),
(12, 2, '2018 Importancia del desarrollo de nuevas variedades mejoradas de frijol para Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2018 Importancia del desarrollo de nuevas variedades mejoradas de frijol para Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(13, 2, '2014 TÉCNICAS DE COSECHA DE AGUA PARA LA PRODUCCION SOSTENIBLE DE FRIJOL EN DURANGO.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2014 TÉCNICAS DE COSECHA DE AGUA PARA LA PRODUCCION SOSTENIBLE DE FRIJOL EN DURANGO.pdf', 'pdf', '2026-09-24 04:02:07'),
(14, 2, '2022 Fitopatógenos asociados a la secadera del chiel en Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2022 Fitopatógenos asociados a la secadera del chiel en Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(15, 2, '2013 Transf. de tecnología en el cultivo de maíz en Durango, Dgo.,M´x. PROMAF 2012.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2013 Transf. de tecnología en el cultivo de maíz en Durango, Dgo.,M´x. PROMAF 2012.pdf', 'pdf', '2026-09-24 04:02:07'),
(16, 2, '2016 Uso eficiente de fertiilizantes granulados en maíz y frijol cultivados en Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2016 Uso eficiente de fertiilizantes granulados en maíz y frijol cultivados en Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(17, 2, '2008 Trigo temporal en Durango - copia.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2008 Trigo temporal en Durango - copia.pdf', 'pdf', '2026-09-24 04:02:07'),
(18, 2, '2006 KARMA, Nueva variedad de avena forrajera para temporal en Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2006 KARMA, Nueva variedad de avena forrajera para temporal en Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(19, 2, '2020 Pérdidas causadas por la virosis en el cultivo de chile del área de poanas, Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2020 Pérdidas causadas por la virosis en el cultivo de chile del área de poanas, Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(20, 2, '2020 Especies de mosquita blanca presentes en el área de Poanas, Durango..pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2020 Especies de mosquita blanca presentes en el área de Poanas, Durango..pdf', 'pdf', '2026-09-24 04:02:07'),
(21, 2, '2008 Practicas recomendadas para el manejo de tizón de fuego en sistemas de producción del estado de Durango, México Folleto cientifico 14.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2008 Practicas recomendadas para el manejo de tizón de fuego en sistemas de producción del estado de Durango, México Folleto cientifico 14.pdf', 'pdf', '2026-09-24 04:02:07'),
(22, 2, '2020 NOD 1, variedad mejorada de frijol negro opaco para el estado de Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2020 NOD 1, variedad mejorada de frijol negro opaco para el estado de Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(23, 2, '2020 La diversidad del frijol en el estado de Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2020 La diversidad del frijol en el estado de Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(24, 2, '2025 Efecto de la fertilización química sobre rendimiento y calidad de la nuez pecanera.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2025 Efecto de la fertilización química sobre rendimiento y calidad de la nuez pecanera.pdf', 'pdf', '2026-09-24 04:02:07'),
(25, 2, '2016 Predicción fenológica en cultivos agrícolas bajo tiempo térmico.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2016 Predicción fenológica en cultivos agrícolas bajo tiempo térmico.pdf', 'pdf', '2026-09-24 04:02:07'),
(26, 2, '2022 La diversidad del frijol en el estado de Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2022 La diversidad del frijol en el estado de Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(27, 2, '2003 Negro Vizcaya, nueva variedad de frijol negro brillante para el altiplano de México.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2003 Negro Vizcaya, nueva variedad de frijol negro brillante para el altiplano de México.pdf', 'pdf', '2026-09-24 04:02:07'),
(28, 2, '2012 Pinto Bravo variedad mejorada de frijol para el estado de Durango..pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2012 Pinto Bravo variedad mejorada de frijol para el estado de Durango..pdf', 'pdf', '2026-09-24 04:02:07'),
(29, 2, '2003 Tecnología para cultivar maíz de temporal con labranza de conservación en Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2003 Tecnología para cultivar maíz de temporal con labranza de conservación en Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(30, 2, '2000 negro altiplano y negro sahuatoba nuevas variedades de frijol para el altiplano de méxico..pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2000 negro altiplano y negro sahuatoba nuevas variedades de frijol para el altiplano de méxico..pdf', 'pdf', '2026-09-24 04:02:07'),
(31, 2, '2001 Producción de girasol de temporal para grano y combinado con maíz para ensilaje Durango.crdownload', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2001 Producción de girasol de temporal para grano y combinado con maíz para ensilaje Durango.crdownload', 'crdownload', '2026-09-24 04:02:07'),
(32, 2, '2016 Modelación del ciclo biológico del gusano cogollero en el estado de Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2016 Modelación del ciclo biológico del gusano cogollero en el estado de Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(33, 2, '2012 Producción de lechuga en un sistema de acuaponia.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2012 Producción de lechuga en un sistema de acuaponia.pdf', 'pdf', '2026-09-24 04:02:07'),
(34, 2, '2018 Producción orgánica de hortalizas en invernadero.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2018 Producción orgánica de hortalizas en invernadero.pdf', 'pdf', '2026-09-24 04:02:07'),
(35, 2, '2002 El clima y su efecto en el cultivo del manzano en Canatlán, Durango. Folleto técnico 18 - copia.crdownload', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2002 El clima y su efecto en el cultivo del manzano en Canatlán, Durango. Folleto técnico 18 - copia.crdownload', 'crdownload', '2026-09-24 04:02:07'),
(36, 2, '2014 Producción de frijol en áreas con diferente potencial productivo..pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2014 Producción de frijol en áreas con diferente potencial productivo..pdf', 'pdf', '2026-09-24 04:02:07'),
(37, 2, '2000 pinto mestizo y pinto bayacora nuevas variedades de frijol para el altiplano de méxico.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2000 pinto mestizo y pinto bayacora nuevas variedades de frijol para el altiplano de méxico.pdf', 'pdf', '2026-09-24 04:02:07'),
(38, 2, '2014 Control del tizón de fuego en manzano.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2014 Control del tizón de fuego en manzano.pdf', 'pdf', '2026-09-24 04:02:07'),
(39, 2, '2023 El cultivo de chile en Durango Sistemas de producción y rentabilidad.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2023 El cultivo de chile en Durango Sistemas de producción y rentabilidad.pdf', 'pdf', '2026-09-24 04:02:07'),
(40, 2, '2020 PERDIDAS CAUSADAS POR LA VIROSIS EN EL CULIVO DE CHILE Folleto técnico 108.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2020 PERDIDAS CAUSADAS POR LA VIROSIS EN EL CULIVO DE CHILE Folleto técnico 108.pdf', 'pdf', '2026-09-24 04:02:07'),
(41, 2, '2025 Mejoramiento genético de frijol sus protagonistas, variedades e impacto para la soberanía alimentaria en México.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2025 Mejoramiento genético de frijol sus protagonistas, variedades e impacto para la soberanía alimentaria en México.pdf', 'pdf', '2026-09-24 04:02:07'),
(42, 2, '2020 NOD 1, VARIEDAD MEJORADA DE FRIJOL NEGRO OPACO PARA EL ESTADO DE.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2020 NOD 1, VARIEDAD MEJORADA DE FRIJOL NEGRO OPACO PARA EL ESTADO DE.pdf', 'pdf', '2026-09-24 04:02:07'),
(43, 2, '2009 PINTO SALTILLO VARIEDAD MEJORADA DE FRIJOL PARA EL ESTADO DE DURANGO  Folleto técnico 36.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2009 PINTO SALTILLO VARIEDAD MEJORADA DE FRIJOL PARA EL ESTADO DE DURANGO  Folleto técnico 36.pdf', 'pdf', '2026-09-24 04:02:07'),
(44, 2, '2013  Técnicas de injertado enchapado lateral y fisura terminal en Pinus pseudostrobus Lindl..pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2013  Técnicas de injertado enchapado lateral y fisura terminal en Pinus pseudostrobus Lindl..pdf', 'pdf', '2026-09-24 04:02:07'),
(45, 2, '2020 PÉRDIDS CAUSADAS POR LA VIROSIS EN EL CULTIVO DE CHILE DEL ÁREA DE POANAS, DURANGO.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2020 PÉRDIDS CAUSADAS POR LA VIROSIS EN EL CULTIVO DE CHILE DEL ÁREA DE POANAS, DURANGO.pdf', 'pdf', '2026-09-24 04:02:07'),
(46, 2, '2023 Opciones de fertilización para incrementar el rendimiento de frijol en Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2023 Opciones de fertilización para incrementar el rendimiento de frijol en Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(47, 2, '2014 Producción de frijol en áreas con diferente potencial productivo. - copia.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2014 Producción de frijol en áreas con diferente potencial productivo. - copia.pdf', 'pdf', '2026-09-24 04:02:07'),
(48, 2, '2011 Pinto Coloso variedad mejorada de frijol para el estado de Durango..pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2011 Pinto Coloso variedad mejorada de frijol para el estado de Durango..pdf', 'pdf', '2026-09-24 04:02:07'),
(49, 2, '2005 EL CULTIVO DE MAIZ PARA GRANO BAJO RIEGO EN DURANGO Folleto para productores 19.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2005 EL CULTIVO DE MAIZ PARA GRANO BAJO RIEGO EN DURANGO Folleto para productores 19.pdf', 'pdf', '2026-09-24 04:02:07'),
(50, 2, '2006 CEVAMEX NUEVA VARIEDAD DE AVENA FORRAJERA PARA TEMPORAL EN DURANGO  Folleto técnico 24.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2006 CEVAMEX NUEVA VARIEDAD DE AVENA FORRAJERA PARA TEMPORAL EN DURANGO  Folleto técnico 24.pdf', 'pdf', '2026-09-24 04:02:07'),
(51, 2, '2023 EL CULTIVO DE CHILE EN DURANGO SISTEMAS DE PRODUCCIÓN Folleto técnico 124.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2023 EL CULTIVO DE CHILE EN DURANGO SISTEMAS DE PRODUCCIÓN Folleto técnico 124.pdf', 'pdf', '2026-09-24 04:02:07'),
(52, 2, '2009 VALIDACION DE TECNOLOGIAS AGRICOLAS EN LA SIERRA DEL ESTADO DE DURANGO Folleto para productores 23.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2009 VALIDACION DE TECNOLOGIAS AGRICOLAS EN LA SIERRA DEL ESTADO DE DURANGO Folleto para productores 23.pdf', 'pdf', '2026-09-24 04:02:07'),
(53, 2, '2018 Fluctuación poblacional del gusano cogollero(Spodoptera frugiperda) como herramienta útil para la toma de decisiones en el agroecosis.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2018 Fluctuación poblacional del gusano cogollero(Spodoptera frugiperda) como herramienta útil para la toma de decisiones en el agroecosis.pdf', 'pdf', '2026-09-24 04:02:07'),
(54, 2, '2017 Importancia del agua de riego para la producción sostenible de frijol en Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2017 Importancia del agua de riego para la producción sostenible de frijol en Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(55, 2, '2010 Validación de variedades de maíz en condiciones de temporal en la Sierra de Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2010 Validación de variedades de maíz en condiciones de temporal en la Sierra de Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(56, 2, '2007 PINTO DURANGO. NUEVA VARIEDAD DE FRIJOL PARA EL ALTIPLANO DE MEXICO Folleto técnico 31.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2007 PINTO DURANGO. NUEVA VARIEDAD DE FRIJOL PARA EL ALTIPLANO DE MEXICO Folleto técnico 31.pdf', 'pdf', '2026-09-24 04:02:07'),
(57, 2, '2017 Recomendaciones para  el control de gusano cogollero (Spodoptera frugiperda) en el cultivo de maíz.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2017 Recomendaciones para  el control de gusano cogollero (Spodoptera frugiperda) en el cultivo de maíz.pdf', 'pdf', '2026-09-24 04:02:07'),
(58, 2, '2018 Evaluación de insecticidas en el control del gusano cogollero (Spodoptera frugiperda en el cultivo de maíz en Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2018 Evaluación de insecticidas en el control del gusano cogollero (Spodoptera frugiperda en el cultivo de maíz en Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(59, 2, '2010 Pinto Saltillo fechas de siembra, fenología y rendimiento - copia.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2010 Pinto Saltillo fechas de siembra, fenología y rendimiento - copia.pdf', 'pdf', '2026-09-24 04:02:07'),
(60, 2, '2007 El cultivo de tomate en invernadero en Durango Folleto para productores 21.crdownload', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2007 El cultivo de tomate en invernadero en Durango Folleto para productores 21.crdownload', 'crdownload', '2026-09-24 04:02:07'),
(61, 2, '2007 Bacteriosis común y otras enfermedades del frijol en Durango. Folleto Técnico.crdownload', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2007 Bacteriosis común y otras enfermedades del frijol en Durango. Folleto Técnico.crdownload', 'crdownload', '2026-09-24 04:02:07'),
(62, 2, '2025 PID 2, Variedad de frijol de grano pinto para Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2025 PID 2, Variedad de frijol de grano pinto para Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(63, 2, '2020 Patógenos asociados con la virosis del chile en el estado de Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2020 Patógenos asociados con la virosis del chile en el estado de Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(64, 2, '2007 Bacteriosis común y otras enfermedades del frijol en Durango. Folleto Técnico - copia.crdownload', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2007 Bacteriosis común y otras enfermedades del frijol en Durango. Folleto Técnico - copia.crdownload', 'crdownload', '2026-09-24 04:02:07'),
(65, 2, '2017 Presencia de la paratrioza, Bactericera cockerelli (Sulc) en la zona productora de chile en Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2017 Presencia de la paratrioza, Bactericera cockerelli (Sulc) en la zona productora de chile en Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(66, 2, '2022 FITOPATÓGENOS ASOCIADOS A LA SECADERA DEL CHILE EN DURANGO Folleto técnico 122.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2022 FITOPATÓGENOS ASOCIADOS A LA SECADERA DEL CHILE EN DURANGO Folleto técnico 122.pdf', 'pdf', '2026-09-24 04:02:07'),
(67, 2, '2020 PID 1, Variedad mejorada de frijol pinto para el estado de Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2020 PID 1, Variedad mejorada de frijol pinto para el estado de Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(68, 2, '2008 Trigo temporal en Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2008 Trigo temporal en Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(69, 2, '2020 PID 1, VARIEDAD MEJORADA DE FRIJOL PINTO PARA EL ESTADO DE.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2020 PID 1, VARIEDAD MEJORADA DE FRIJOL PINTO PARA EL ESTADO DE.pdf', 'pdf', '2026-09-24 04:02:07'),
(70, 2, '2020 PATOGENOS ASOCIADOS CON LA VIROSIS DEL CHILE Folleto técnico 107.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2020 PATOGENOS ASOCIADOS CON LA VIROSIS DEL CHILE Folleto técnico 107.pdf', 'pdf', '2026-09-24 04:02:07'),
(71, 2, '2017 Muestreo de suelos.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2017 Muestreo de suelos.pdf', 'pdf', '2026-09-24 04:02:07'),
(72, 2, '2007 H376 Híbrido de maíz para producción de grano y forraje en riego en Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2007 H376 Híbrido de maíz para producción de grano y forraje en riego en Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(73, 2, '2000 Tecnología para aumentar la productividad del maíz en Durango. Folleto para productores.crdownload', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2000 Tecnología para aumentar la productividad del maíz en Durango. Folleto para productores.crdownload', 'crdownload', '2026-09-24 04:02:07'),
(74, 2, '2005 EL CULTIVO DEL MAIZ DE TEMPORAL EN DURANGO Folleto para productores 20.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2005 EL CULTIVO DEL MAIZ DE TEMPORAL EN DURANGO Folleto para productores 20.pdf', 'pdf', '2026-09-24 04:02:07'),
(75, 2, '2003 FM 2000, nueva variedad de frijol flor de mayo para el altiplano de México..pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Agricola/2003 FM 2000, nueva variedad de frijol flor de mayo para el altiplano de México..pdf', 'pdf', '2026-09-24 04:02:07'),
(76, 2, '2003 Factores que influyen en la calidad de brinzales y criterios para su evaluación en vivero.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2003 Factores que influyen en la calidad de brinzales y criterios para su evaluación en vivero.pdf', 'pdf', '2026-09-24 04:02:07'),
(77, 2, '2016 Establecimiento de plantaciones de mezquite con enfoque agroforestal en el norte centro de México.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2016 Establecimiento de plantaciones de mezquite con enfoque agroforestal en el norte centro de México.pdf', 'pdf', '2026-09-24 04:02:07'),
(78, 2, '2006 COLECTA DE SEMILLA FORESTAL EN EL GÉNERO PINUS FOLLETO 28.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2006 COLECTA DE SEMILLA FORESTAL EN EL GÉNERO PINUS FOLLETO 28.pdf', 'pdf', '2026-09-24 04:02:07'),
(79, 2, '2004 Manual para el establecimiento de sitios permanentes de investigación silvícola SPIS en bosques naturales.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2004 Manual para el establecimiento de sitios permanentes de investigación silvícola SPIS en bosques naturales.pdf', 'pdf', '2026-09-24 04:02:07'),
(80, 2, '2008 CRITERIOS PARA EVALUAR COMBUSTIBLES EN ÁRES FORESTALES FOLLETO 33.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2008 CRITERIOS PARA EVALUAR COMBUSTIBLES EN ÁRES FORESTALES FOLLETO 33.pdf', 'pdf', '2026-09-24 04:02:07'),
(81, 2, '2025 RECONSTRUCCIÓN DE RÉGIMENESD HISTÓRICOS DE INCENDIOS Y SU INFLUENCIA EN LA ESTRUCTURA DEL BOSQUE PARA EL MANEJOS  FORESTAL SUSTENTABLE.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2025 RECONSTRUCCIÓN DE RÉGIMENESD HISTÓRICOS DE INCENDIOS Y SU INFLUENCIA EN LA ESTRUCTURA DEL BOSQUE PARA EL MANEJOS  FORESTAL SUSTENTABLE.pdf', 'pdf', '2026-09-24 04:02:07'),
(82, 2, '2012 PRODUCCIÓN DE PINUS CEMBROIDES ZUXX EN VIVERO EN DIFERENTES SUSTRATOS Y ENVASES FOLLETO 54.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2012 PRODUCCIÓN DE PINUS CEMBROIDES ZUXX EN VIVERO EN DIFERENTES SUSTRATOS Y ENVASES FOLLETO 54.pdf', 'pdf', '2026-09-24 04:02:07'),
(83, 2, '2008 Cultivo de árboles de navidad en clima semiárido. - copia.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2008 Cultivo de árboles de navidad en clima semiárido. - copia.pdf', 'pdf', '2026-09-24 04:02:07'),
(84, 2, '2016 Establecimiento y monitoreo de una plantación de Pinus engelmannii Carr. en el suroeste de Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2016 Establecimiento y monitoreo de una plantación de Pinus engelmannii Carr. en el suroeste de Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(85, 2, '2013  Técnicas de injertado enchapado lateral y fisura terminal en Pinus pseudostrobus Lindl. - copia.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2013  Técnicas de injertado enchapado lateral y fisura terminal en Pinus pseudostrobus Lindl. - copia.pdf', 'pdf', '2026-09-24 04:02:07'),
(86, 2, '1998 ANÁLISIS DEL ARRIME DE TROCERÍA CON MOTOGRÚA EN UNA EMPRESA FORESTAL (Estudio de caso) Folleto científicio 6.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/1998 ANÁLISIS DEL ARRIME DE TROCERÍA CON MOTOGRÚA EN UNA EMPRESA FORESTAL (Estudio de caso) Folleto científicio 6.pdf', 'pdf', '2026-09-24 04:02:07'),
(87, 2, '2006 ESTABLECIMIENTO DE PLANTACIONES FORESTALES FOLLETO 26.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2006 ESTABLECIMIENTO DE PLANTACIONES FORESTALES FOLLETO 26.pdf', 'pdf', '2026-09-24 04:02:07'),
(88, 2, '2011 Modelos para la estimación de volúmen, biomasa y carbono en mezquite (prosopis laevigata) en la región norte centro de México.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2011 Modelos para la estimación de volúmen, biomasa y carbono en mezquite (prosopis laevigata) en la región norte centro de México.pdf', 'pdf', '2026-09-24 04:02:07'),
(89, 2, '2003 Diseño de hornos de carbonización más comúnes en México.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2003 Diseño de hornos de carbonización más comúnes en México.pdf', 'pdf', '2026-09-24 04:02:07'),
(90, 2, '2022 Producción de patrones de calidad de Pinus engelmanni Carriérre en vivero.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2022 Producción de patrones de calidad de Pinus engelmanni Carriérre en vivero.pdf', 'pdf', '2026-09-24 04:02:07'),
(91, 2, '2014 Diagramas de Manejo de Densidad con modelación de Regresión Frontera Estocástica para la mezcla de especies UMAFOR 1005 Santiago Papasquiaro.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2014 Diagramas de Manejo de Densidad con modelación de Regresión Frontera Estocástica para la mezcla de especies UMAFOR 1005 Santiago Papasquiaro.pdf', 'pdf', '2026-09-24 04:02:07'),
(92, 2, '2023 Escurrimiento fustal en árboles del género Pinus sp. Para bosques templados de Durango, México.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2023 Escurrimiento fustal en árboles del género Pinus sp. Para bosques templados de Durango, México.pdf', 'pdf', '2026-09-24 04:02:07'),
(93, 2, '2004 Pruebas de exactitud del modelo SICREMARS Versión 1.0 para Pinus cooperi Blanco en la Región de San Dimas, Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2004 Pruebas de exactitud del modelo SICREMARS Versión 1.0 para Pinus cooperi Blanco en la Región de San Dimas, Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(94, 2, '2025 PODAS DE FORMACIÓN ÁRBOLES DE NAVIDAD.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2025 PODAS DE FORMACIÓN ÁRBOLES DE NAVIDAD.pdf', 'pdf', '2026-09-24 04:02:07'),
(95, 2, '2015 Sistemas de producción de planta en los viveros forestales del estado de Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2015 Sistemas de producción de planta en los viveros forestales del estado de Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(96, 2, '1998 Efecto de quemas controladas en la reducción de desperdicios forestales en Durango. Folleto Técnico 4.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/1998 Efecto de quemas controladas en la reducción de desperdicios forestales en Durango. Folleto Técnico 4.pdf', 'pdf', '2026-09-24 04:02:07'),
(97, 2, '2020 Índices de densidad de rodales para bosques mezclados Un enfohgue nuevo para caracterizar la densidad y aplicación de aclareos.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2020 Índices de densidad de rodales para bosques mezclados Un enfohgue nuevo para caracterizar la densidad y aplicación de aclareos.pdf', 'pdf', '2026-09-24 04:02:07'),
(98, 2, '2009 Manual de operación del simulador forestal Durango SIFOR DGO VERSIÓN 1.0.crdownload', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2009 Manual de operación del simulador forestal Durango SIFOR DGO VERSIÓN 1.0.crdownload', 'crdownload', '2026-09-24 04:02:07'),
(99, 2, '2024 Fertilización con nitrógeno orgánico en especies forestales cultivadas en vivero.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2024 Fertilización con nitrógeno orgánico en especies forestales cultivadas en vivero.pdf', 'pdf', '2026-09-24 04:02:07'),
(100, 2, '2002 Determinación de la calidad de sitio para cuatro especies de pino en el P.P. Sierra del Nayar municipio de Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2002 Determinación de la calidad de sitio para cuatro especies de pino en el P.P. Sierra del Nayar municipio de Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(101, 2, '2012 Producción de planta del género Pinus.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2012 Producción de planta del género Pinus.pdf', 'pdf', '2026-09-24 04:02:07'),
(102, 2, '2014 Producción de planta de Agave durangensis en sistema de acolchado y riego por goteo.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2014 Producción de planta de Agave durangensis en sistema de acolchado y riego por goteo.pdf', 'pdf', '2026-09-24 04:02:07'),
(103, 2, '2000 Manual para elaborar carbón vegetal en horno metálico tipo CEVAG.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2000 Manual para elaborar carbón vegetal en horno metálico tipo CEVAG.pdf', 'pdf', '2026-09-24 04:02:07'),
(104, 2, '2002 Guía de densidad para P. cooperi Blanco en el SPF Cielito Azul San Miguel de cruces, Durango..pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2002 Guía de densidad para P. cooperi Blanco en el SPF Cielito Azul San Miguel de cruces, Durango..pdf', 'pdf', '2026-09-24 04:02:07'),
(105, 2, '2017  Criterios y pruebas para evaluar calidad fisiológica de semillas de pino.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2017  Criterios y pruebas para evaluar calidad fisiológica de semillas de pino.pdf', 'pdf', '2026-09-24 04:02:07'),
(106, 2, '1998 PRODUCCION DE PLANTA FORESTAL FOLLETO 10.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/1998 PRODUCCION DE PLANTA FORESTAL FOLLETO 10.pdf', 'pdf', '2026-09-24 04:02:07'),
(107, 2, '2023 Producción de planta y establecimiento de plantaciones comerciales de a.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2023 Producción de planta y establecimiento de plantaciones comerciales de a.pdf', 'pdf', '2026-09-24 04:02:07'),
(108, 2, '2012 RECOMENDACIONES PARA LA PRODUCCIÓN DE PLANTA DE MEZQUITE EN CONDICIONES DWE VIVERO FOLLETO 56.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2012 RECOMENDACIONES PARA LA PRODUCCIÓN DE PLANTA DE MEZQUITE EN CONDICIONES DWE VIVERO FOLLETO 56.pdf', 'pdf', '2026-09-24 04:02:07'),
(109, 2, '2018 Establecimiento de cultivos dendroenergéticos, una perspectiva para la producción de energía no convencional en Dgo.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2018 Establecimiento de cultivos dendroenergéticos, una perspectiva para la producción de energía no convencional en Dgo.pdf', 'pdf', '2026-09-24 04:02:07'),
(110, 2, '2022 Validación de ecuación dinámica para caracterizar la productividad forestal (2).pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2022 Validación de ecuación dinámica para caracterizar la productividad forestal (2).pdf', 'pdf', '2026-09-24 04:02:07'),
(111, 2, '2012 Identificación de hongos ectomicorrízicos en bosques de coníferas de los municipios de Pueblo Nuevo, San Dimad y Durango, Durango..pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2012 Identificación de hongos ectomicorrízicos en bosques de coníferas de los municipios de Pueblo Nuevo, San Dimad y Durango, Durango..pdf', 'pdf', '2026-09-24 04:02:07'),
(112, 2, '2025 EVALUACIÓN DE LA DIVERSIDAD ARBÓREA EN ECOSISTEMA DE BOSQUE TEMPLADO.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2025 EVALUACIÓN DE LA DIVERSIDAD ARBÓREA EN ECOSISTEMA DE BOSQUE TEMPLADO.pdf', 'pdf', '2026-09-24 04:02:07'),
(113, 2, '2013 Producción y trasplante de planta de Agave en vivero.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2013 Producción y trasplante de planta de Agave en vivero.pdf', 'pdf', '2026-09-24 04:02:07'),
(114, 2, '2007 PREDICCIÓN DEL CRECIMIENTO EN BOSQUES DE Pinus cooperi BLANCO MEDIANTE MODELOS DE REDES NEURONALES ARTIFICIALES. Folleto Científico 12.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2007 PREDICCIÓN DEL CRECIMIENTO EN BOSQUES DE Pinus cooperi BLANCO MEDIANTE MODELOS DE REDES NEURONALES ARTIFICIALES. Folleto Científico 12.pdf', 'pdf', '2026-09-24 04:02:07'),
(115, 2, '2012 Funciones de índice de sitio para Pinus durangensis Mtz. y Pinus arizonica Engelm en Santiago Papasquaro, Durango Folletotcnico52.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2012 Funciones de índice de sitio para Pinus durangensis Mtz. y Pinus arizonica Engelm en Santiago Papasquaro, Durango Folletotcnico52.pdf', 'pdf', '2026-09-24 04:02:07'),
(116, 2, '2011 Manual para la elaboración de carbón vegetal de mezquite en el norte-centro de México.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2011 Manual para la elaboración de carbón vegetal de mezquite en el norte-centro de México.pdf', 'pdf', '2026-09-24 04:02:07'),
(117, 2, '2010 PREDICCIÓN DE CRECIMIENTO Y ESTIMACIÓN DE VOLUMEN PARA PINUS DURANGENSIS MART Y PINUS ARIZONICA ENGELM EN SANTIAGO PAPASQUIARO DUANGO FOLLETO 46.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2010 PREDICCIÓN DE CRECIMIENTO Y ESTIMACIÓN DE VOLUMEN PARA PINUS DURANGENSIS MART Y PINUS ARIZONICA ENGELM EN SANTIAGO PAPASQUIARO DUANGO FOLLETO 46.pdf', 'pdf', '2026-09-24 04:02:07'),
(118, 2, '2006 MANUAL DE OPERACIÓN DEL SIMULADOR DE CRECIMIENTO MADERABLE PARA LA REGION DE SAN DIMAS, DURANGO SICREMARS VERSION 2.0 Folleto técnico 27.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2006 MANUAL DE OPERACIÓN DEL SIMULADOR DE CRECIMIENTO MADERABLE PARA LA REGION DE SAN DIMAS, DURANGO SICREMARS VERSION 2.0 Folleto técnico 27.pdf', 'pdf', '2026-09-24 04:02:07'),
(119, 2, '2002Producción de árboles de navidad en regiones semiáridas del norte de México. FOLLETO 17.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2002Producción de árboles de navidad en regiones semiáridas del norte de México. FOLLETO 17.pdf', 'pdf', '2026-09-24 04:02:07'),
(120, 2, '2009 MANUAL DE OPERACIÓN DEL SIMULADOR FORESTAL DURANGO SIFOR-DGO VERSION 1.0 Folleto técnico 35.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2009 MANUAL DE OPERACIÓN DEL SIMULADOR FORESTAL DURANGO SIFOR-DGO VERSION 1.0 Folleto técnico 35.pdf', 'pdf', '2026-09-24 04:02:07'),
(121, 2, '2024 Uso de núcleos semilleros de pastos para la recuperación de agostaderos degradados.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2024 Uso de núcleos semilleros de pastos para la recuperación de agostaderos degradados.pdf', 'pdf', '2026-09-24 04:02:07'),
(122, 2, '2004 NUEVOS MODELOS DE CRECIMIENTO PARA BOSQUES REGULARES E IRREGULARES DE PUNIS COOPERI BLANCO EN SAN MIGUEL DE CRUCES DURANGO FOLLETO 10.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2004 NUEVOS MODELOS DE CRECIMIENTO PARA BOSQUES REGULARES E IRREGULARES DE PUNIS COOPERI BLANCO EN SAN MIGUEL DE CRUCES DURANGO FOLLETO 10.pdf', 'pdf', '2026-09-24 04:02:07'),
(123, 2, '2006 EVALUACION DE TRES TAMAÑOS DE ENVASE EN LA PRODUCCIÓN DE PINUS DURANGENSIS MART EN VIVERO FOLLETO 11.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2006 EVALUACION DE TRES TAMAÑOS DE ENVASE EN LA PRODUCCIÓN DE PINUS DURANGENSIS MART EN VIVERO FOLLETO 11.pdf', 'pdf', '2026-09-24 04:02:07'),
(124, 2, '2013 Selección de árboles superiores del género Pinus..pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2013 Selección de árboles superiores del género Pinus..pdf', 'pdf', '2026-09-24 04:02:07'),
(125, 2, '2018 Establecimiento de plantaciones de maguey cenizo.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2018 Establecimiento de plantaciones de maguey cenizo.pdf', 'pdf', '2026-09-24 04:02:07'),
(126, 2, '2016 PRODUCCIÓN EN VIVERO DE PLÁNTULA DE GRAMÍNEAS NATIVAS PARA EL ESTABLECIMIENTO DE SEMILLEROS.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2016 PRODUCCIÓN EN VIVERO DE PLÁNTULA DE GRAMÍNEAS NATIVAS PARA EL ESTABLECIMIENTO DE SEMILLEROS.pdf', 'pdf', '2026-09-24 04:02:07'),
(127, 2, '2012 MANUAL PARA RECOLECCIÓN Y BENEFICIO DE HONGOS SILVESTRES ECTOMICORRÍZCOS EN DURANGO FOLLETO 51.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2012 MANUAL PARA RECOLECCIÓN Y BENEFICIO DE HONGOS SILVESTRES ECTOMICORRÍZCOS EN DURANGO FOLLETO 51.pdf', 'pdf', '2026-09-24 04:02:07'),
(128, 2, '2000 Guía Técnica para el manejo de la densidad en bosques naturales de Pinus cooperi y Pinus durangensis.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Forestal/2000 Guía Técnica para el manejo de la densidad en bosques naturales de Pinus cooperi y Pinus durangensis.pdf', 'pdf', '2026-09-24 04:02:07'),
(129, 2, '2018 PRODUCCIÓN DE HUEVO CON GALLINAS EN CONDICIONES DE PASTOREO.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2018 PRODUCCIÓN DE HUEVO CON GALLINAS EN CONDICIONES DE PASTOREO.pdf', 'pdf', '2026-09-24 04:02:07'),
(130, 2, '2016 Raciones para ganado bovino productor de carne.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2016 Raciones para ganado bovino productor de carne.pdf', 'pdf', '2026-09-24 04:02:07'),
(131, 2, '2012 Acuaponia, una tecnología para la producción de alimento mediante el uso eficiente.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2012 Acuaponia, una tecnología para la producción de alimento mediante el uso eficiente.pdf', 'pdf', '2026-09-24 04:02:07'),
(132, 2, '2007 Manejo de la carga animal en el agostadero.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2007 Manejo de la carga animal en el agostadero.pdf', 'pdf', '2026-09-24 04:02:07'),
(133, 2, '2017 Destete en el ganado bovino productor de carne.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2017 Destete en el ganado bovino productor de carne.pdf', 'pdf', '2026-09-24 04:02:07'),
(134, 2, '2015 paquete tecnológico para el cultivo de praderas irrigadas de clima templado.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2015 paquete tecnológico para el cultivo de praderas irrigadas de clima templado.pdf', 'pdf', '2026-09-24 04:02:07'),
(135, 2, '2018 Recomendaciones prácticas para el diseño y construcción de instalaciones para ganado bovino en corral - copia.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2018 Recomendaciones prácticas para el diseño y construcción de instalaciones para ganado bovino en corral - copia.pdf', 'pdf', '2026-09-24 04:02:07'),
(136, 2, '2014 Evaluación de estiércol, una herramienta para estimar la nutrición de ganado bovino.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2014 Evaluación de estiércol, una herramienta para estimar la nutrición de ganado bovino.pdf', 'pdf', '2026-09-24 04:02:07'),
(137, 2, '2019 Uso de glicerina residual en la alimentación de rumiantes.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2019 Uso de glicerina residual en la alimentación de rumiantes.pdf', 'pdf', '2026-09-24 04:02:07'),
(138, 2, '2010 Caracterización  de las Unidades de Producción Pecuarias del DDR 01 en el Estado de Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2010 Caracterización  de las Unidades de Producción Pecuarias del DDR 01 en el Estado de Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(139, 2, '2012 FUNCIONES DE ÍNDICE DE SITIO PARA PINUS DURANGENSIS MTZ Y PINUS ARIZONICA ENGELM EN SANTIAGO PAPASQUIARO FOLLETO 52.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2012 FUNCIONES DE ÍNDICE DE SITIO PARA PINUS DURANGENSIS MTZ Y PINUS ARIZONICA ENGELM EN SANTIAGO PAPASQUIARO FOLLETO 52.pdf', 'pdf', '2026-09-24 04:02:07'),
(140, 2, '2013 Uso del rodillo aereador para la recuperación de agostaderos en Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2013 Uso del rodillo aereador para la recuperación de agostaderos en Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(141, 2, '2014 Suplementación del ganado bovino productor de carne en Durango - copia.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2014 Suplementación del ganado bovino productor de carne en Durango - copia.pdf', 'pdf', '2026-09-24 04:02:07'),
(142, 2, '2004 ESTABLECIMIENTO Y OPERACIÓN DE GRANJAS PARA EL CULTIVO DE TRUCHA EN DURANGO Folleto técnico 23.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2004 ESTABLECIMIENTO Y OPERACIÓN DE GRANJAS PARA EL CULTIVO DE TRUCHA EN DURANGO Folleto técnico 23.pdf', 'pdf', '2026-09-24 04:02:07'),
(143, 2, '2014 Nutrición mineral en el ganado bovino.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2014 Nutrición mineral en el ganado bovino.pdf', 'pdf', '2026-09-24 04:02:07'),
(144, 2, '2013 Pasta proteica detoxificada de higuerilla en la alimentación animal.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2013 Pasta proteica detoxificada de higuerilla en la alimentación animal.pdf', 'pdf', '2026-09-24 04:02:07'),
(145, 2, '2009 HABITOS ALIMENTICIOS DEL BAGRE DE CANAL (ICTALURUS PUNCTATUS) EN LA PRESA LAZARO CARDENAS DEL MUNICIPIO DE INDE, DURANGO Folleto técnico 40.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2009 HABITOS ALIMENTICIOS DEL BAGRE DE CANAL (ICTALURUS PUNCTATUS) EN LA PRESA LAZARO CARDENAS DEL MUNICIPIO DE INDE, DURANGO Folleto técnico 40.pdf', 'pdf', '2026-09-24 04:02:07'),
(146, 2, '2017 Estrategias para afrontar la época seca en la ganadería de Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2017 Estrategias para afrontar la época seca en la ganadería de Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(147, 2, '2009 INCIDENCIA DE CONTRACAECUM SP. EN LOBINA (MICROPTERUS SALMOIDES) EN LA PRESA LAZARO CARDENAS DEL MUNICIPIO DE INDE, DURANGO Folleto técnico 39.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2009 INCIDENCIA DE CONTRACAECUM SP. EN LOBINA (MICROPTERUS SALMOIDES) EN LA PRESA LAZARO CARDENAS DEL MUNICIPIO DE INDE, DURANGO Folleto técnico 39.pdf', 'pdf', '2026-09-24 04:02:07'),
(148, 2, '2016 Productividad de especies forrajeras cultivadas bajo distinas condiciones de humedad en Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2016 Productividad de especies forrajeras cultivadas bajo distinas condiciones de humedad en Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(149, 2, '2016 Suplementación del ganado bovino productor de carne en durango..pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2016 Suplementación del ganado bovino productor de carne en durango..pdf', 'pdf', '2026-09-24 04:02:07'),
(150, 2, '2017 ENSILAJE Y HENIFICACIÓN TÉCNICAS PARA CONSERVACIÓN DE FORRAJE.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2017 ENSILAJE Y HENIFICACIÓN TÉCNICAS PARA CONSERVACIÓN DE FORRAJE.pdf', 'pdf', '2026-09-24 04:02:07'),
(151, 2, '2014 Suplementación del ganado bovino productor de carne en Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2014 Suplementación del ganado bovino productor de carne en Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(152, 2, '2015 Sistema de producción vaca-becerro en Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2015 Sistema de producción vaca-becerro en Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(153, 2, '2009 Comportamiento reproductivo de la lobina Micropterus salmoides en la presa lázaro cárdenas del municipio del indé, Durango..pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2009 Comportamiento reproductivo de la lobina Micropterus salmoides en la presa lázaro cárdenas del municipio del indé, Durango..pdf', 'pdf', '2026-09-24 04:02:07'),
(154, 2, '2017 Recomendaciones para la producción de grano y forraje de maíz bajo riego en Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2017 Recomendaciones para la producción de grano y forraje de maíz bajo riego en Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(155, 2, '2002 CULTIVO DE PECES EN CUERPOS DE AGUA TEMPORALES Y PERMANENTES FOLLETO 13.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2002 CULTIVO DE PECES EN CUERPOS DE AGUA TEMPORALES Y PERMANENTES FOLLETO 13.pdf', 'pdf', '2026-09-24 04:02:07'),
(156, 2, '2022 SAB 14,  Variedad de higuerilla para Durango y estados con ambiente similar.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2022 SAB 14,  Variedad de higuerilla para Durango y estados con ambiente similar.pdf', 'pdf', '2026-09-24 04:02:07'),
(157, 2, '2017 Alimentación del ganado bovino.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2017 Alimentación del ganado bovino.pdf', 'pdf', '2026-09-24 04:02:07'),
(158, 2, '2018 Recomendaciones para el manejo de parto en el ganado bovino - copia.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2018 Recomendaciones para el manejo de parto en el ganado bovino - copia.pdf', 'pdf', '2026-09-24 04:02:07'),
(159, 2, '2013 Detoxificación de pastas de higuerila y jatropha.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2013 Detoxificación de pastas de higuerila y jatropha.pdf', 'pdf', '2026-09-24 04:02:07'),
(160, 2, '2000 Resultados relevantes para el desarrollo y engorda de ganado bovino y ovino en praderas irrigadas de clima templado en Durango..pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2000 Resultados relevantes para el desarrollo y engorda de ganado bovino y ovino en praderas irrigadas de clima templado en Durango..pdf', 'pdf', '2026-09-24 04:02:07'),
(161, 2, '2013 Esquemas de crecimiento y desarrollo de bovinos productores de carne en Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2013 Esquemas de crecimiento y desarrollo de bovinos productores de carne en Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(162, 2, '2016 Recomendaciones para la producción de alfalfa en Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2016 Recomendaciones para la producción de alfalfa en Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(163, 2, '2000 ESTABLECIMIENTO DE PRADERAS IRRIGADAS PARA VALLE DEL GUADIANA,DURANGO Folleto pra productores 9.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2000 ESTABLECIMIENTO DE PRADERAS IRRIGADAS PARA VALLE DEL GUADIANA,DURANGO Folleto pra productores 9.pdf', 'pdf', '2026-09-24 04:02:07'),
(164, 2, '2018 Uso de pollinaza en la alimentación de rumiantes - copia.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2018 Uso de pollinaza en la alimentación de rumiantes - copia.pdf', 'pdf', '2026-09-24 04:02:07'),
(165, 2, '2013 Manual para el cultivo de peces en Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/FOLLETOS/Pecuario/2013 Manual para el cultivo de peces en Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(166, 6, '2005 BOSQUE MODELO DURANGO Publicación especial 22.pdf', '/home/dancerv/INIFAP/FOLLETOS/PUBLICACIONES ESPECIALES/Forestal/2005 BOSQUE MODELO DURANGO Publicación especial 22.pdf', 'pdf', '2026-09-24 04:02:07'),
(167, 6, '2006 EL SITIO PERMANENTE DE EXPERIMENTACIÓN FORESTAL SPEF CIELITO AZUL A 40 AÑOS DE SU ESTABLECIMIENTO PUBLICACIÓN ESPECIAL 23.pdf', '/home/dancerv/INIFAP/FOLLETOS/PUBLICACIONES ESPECIALES/Forestal/2006 EL SITIO PERMANENTE DE EXPERIMENTACIÓN FORESTAL SPEF CIELITO AZUL A 40 AÑOS DE SU ESTABLECIMIENTO PUBLICACIÓN ESPECIAL 23.pdf', 'pdf', '2026-09-24 04:02:07'),
(168, 6, '2009 Calidad de planta en los viveros forestales del estado de Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/PUBLICACIONES ESPECIALES/Forestal/2009 Calidad de planta en los viveros forestales del estado de Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(169, 6, '2009 PRODUCCIÓN DE PLANTA DEL GÉNERO PINUS EN VIVERO EN CLIMA TEMPLADO-FRÍO PUBLICACIÓN ESPECIAL 28.pdf', '/home/dancerv/INIFAP/FOLLETOS/PUBLICACIONES ESPECIALES/Forestal/2009 PRODUCCIÓN DE PLANTA DEL GÉNERO PINUS EN VIVERO EN CLIMA TEMPLADO-FRÍO PUBLICACIÓN ESPECIAL 28.pdf', 'pdf', '2026-09-24 04:02:07'),
(170, 6, '2005 BOSQUE MODELO DURANGO. Resultados en ordernamiento territorial, producción de planta, incendios forestales, sitios de investigación y elaboración de carbón. Publicación especial.crdownload', '/home/dancerv/INIFAP/FOLLETOS/PUBLICACIONES ESPECIALES/Forestal/2005 BOSQUE MODELO DURANGO. Resultados en ordernamiento territorial, producción de planta, incendios forestales, sitios de investigación y elaboración de carbón. Publicación especial.crdownload', 'crdownload', '2026-09-24 04:02:07'),
(171, 6, '2012 Funciones de índice de sitio para Pinus durangensis Mtz. y Pinus arizonica Engelm en Santiago Papasquaro, Durango Folletotcnico52.pdf', '/home/dancerv/INIFAP/FOLLETOS/PUBLICACIONES ESPECIALES/Forestal/2012 Funciones de índice de sitio para Pinus durangensis Mtz. y Pinus arizonica Engelm en Santiago Papasquaro, Durango Folletotcnico52.pdf', 'pdf', '2026-09-24 04:02:07'),
(172, 6, '2000 TECNOLOGIAS PARA AUMENTAR LA PRODUCTIVIDAD DE FRIJOL EN DURANGO Publicación especial 12.pdf', '/home/dancerv/INIFAP/FOLLETOS/PUBLICACIONES ESPECIALES/Agrícola/2000 TECNOLOGIAS PARA AUMENTAR LA PRODUCTIVIDAD DE FRIJOL EN DURANGO Publicación especial 12.pdf', 'pdf', '2026-09-24 04:02:07'),
(173, 6, '2000 TRANSFERENCIA DE TECNOLOGIA DE FRIJOL INIFAP DURANGO. SITIO PERMANENTE DE INNOVACION Y TRANSFERENCIA DE TECNOLOGIA AGRICOLA PARA LOS LLANOS DE DURANGO.pdf', '/home/dancerv/INIFAP/FOLLETOS/PUBLICACIONES ESPECIALES/Agrícola/2000 TRANSFERENCIA DE TECNOLOGIA DE FRIJOL INIFAP DURANGO. SITIO PERMANENTE DE INNOVACION Y TRANSFERENCIA DE TECNOLOGIA AGRICOLA PARA LOS LLANOS DE DURANGO.pdf', 'pdf', '2026-09-24 04:02:07'),
(174, 6, '2007 Trigo de riego en Durango Publicación especial 24.pdf', '/home/dancerv/INIFAP/FOLLETOS/PUBLICACIONES ESPECIALES/Agrícola/2007 Trigo de riego en Durango Publicación especial 24.pdf', 'pdf', '2026-09-24 04:02:07'),
(175, 6, '2002 Manual para establecer parcelas demostrativas agrícolas y pecuarias (1).pdf', '/home/dancerv/INIFAP/FOLLETOS/PUBLICACIONES ESPECIALES/Agrícola/2002 Manual para establecer parcelas demostrativas agrícolas y pecuarias (1).pdf', 'pdf', '2026-09-24 04:02:07'),
(176, 6, '2009 VALIDACION DE VARIEDADES Y LINEAS MEJORADAS DE FRIJOL EN DURANGO Publicación especial 27.pdf', '/home/dancerv/INIFAP/FOLLETOS/PUBLICACIONES ESPECIALES/Agrícola/2009 VALIDACION DE VARIEDADES Y LINEAS MEJORADAS DE FRIJOL EN DURANGO Publicación especial 27.pdf', 'pdf', '2026-09-24 04:02:07'),
(177, 6, '2008 Oportunidades de mercado para el frijol producido en Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/PUBLICACIONES ESPECIALES/Agrícola/2008 Oportunidades de mercado para el frijol producido en Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(178, 6, '2000 TRANSFERENCIA DE TECNOLOGIA DE FRIJOL EN EL ESTADO DE DURANGO Publicación especial 15.pdf', '/home/dancerv/INIFAP/FOLLETOS/PUBLICACIONES ESPECIALES/Agrícola/2000 TRANSFERENCIA DE TECNOLOGIA DE FRIJOL EN EL ESTADO DE DURANGO Publicación especial 15.pdf', 'pdf', '2026-09-24 04:02:07'),
(179, 6, '2024 Campo Experimental Valle del Guadiana 50 años de logro científicos y tecnológicos paa Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/PUBLICACIONES ESPECIALES/Agrícola/2024 Campo Experimental Valle del Guadiana 50 años de logro científicos y tecnológicos paa Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(180, 6, '2002 CONVERSIÓN PRODUCTIVA en áreas de temporal de alto y mediano potencial del estado de Durango ciclo P-V 2000.pdf', '/home/dancerv/INIFAP/FOLLETOS/PUBLICACIONES ESPECIALES/Agrícola/2002 CONVERSIÓN PRODUCTIVA en áreas de temporal de alto y mediano potencial del estado de Durango ciclo P-V 2000.pdf', 'pdf', '2026-09-24 04:02:07'),
(181, 6, '2002 Sistemas de producción de manzano y cultivos alternativos.pdf', '/home/dancerv/INIFAP/FOLLETOS/PUBLICACIONES ESPECIALES/Agrícola/2002 Sistemas de producción de manzano y cultivos alternativos.pdf', 'pdf', '2026-09-24 04:02:07'),
(182, 6, '2007 Trigo de riego en Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/PUBLICACIONES ESPECIALES/Agrícola/2007 Trigo de riego en Durango.pdf', 'pdf', '2026-09-24 04:02:07');
INSERT INTO `archivos` (`id`, `subcategoria_id`, `nombre_archivo`, `ruta_completa`, `extension`, `fecha_registro`) VALUES
(183, 6, '2006 Alternativas de producción con nuevas tecnológicas para las áreas de temporal en Durango..pdf', '/home/dancerv/INIFAP/FOLLETOS/PUBLICACIONES ESPECIALES/Agrícola/2006 Alternativas de producción con nuevas tecnológicas para las áreas de temporal en Durango..pdf', 'pdf', '2026-09-24 04:02:07'),
(184, 6, '2008 Análisis del mercado de la carne de bovino producida en México.pdf', '/home/dancerv/INIFAP/FOLLETOS/PUBLICACIONES ESPECIALES/Pecuario/2008 Análisis del mercado de la carne de bovino producida en México.pdf', 'pdf', '2026-09-24 04:02:07'),
(185, 6, '2007 CADENA AGROALIMENTARIA BOVINOS CARNE EN DURANGO DIAGNOSTICO Y PERSPECTIVAS DE MERCADO Publicación técnica 2.pdf', '/home/dancerv/INIFAP/FOLLETOS/PUBLICACIONES ESPECIALES/Pecuario/2007 CADENA AGROALIMENTARIA BOVINOS CARNE EN DURANGO DIAGNOSTICO Y PERSPECTIVAS DE MERCADO Publicación técnica 2.pdf', 'pdf', '2026-09-24 04:02:07'),
(186, 6, '2000 Estructura del GGAVAT CAMPO EXPERIMENTAL.pdf', '/home/dancerv/INIFAP/FOLLETOS/PUBLICACIONES ESPECIALES/Pecuario/2000 Estructura del GGAVAT CAMPO EXPERIMENTAL.pdf', 'pdf', '2026-09-24 04:02:07'),
(187, 6, '2006 Propuesta de rastreabilidad para bovinos de carne en Durango. Folleto técnico 6.crdownload', '/home/dancerv/INIFAP/FOLLETOS/PUBLICACIONES ESPECIALES/Pecuario/2006 Propuesta de rastreabilidad para bovinos de carne en Durango. Folleto técnico 6.crdownload', 'crdownload', '2026-09-24 04:02:07'),
(188, 6, '2009 DIAGNOSTICO DE LA ACTIVIDAD PESQUERA EN LA PRESA LAZARO CARDENAS DEL MUNICIPIO DE INDE, DURANGO. Publicación especial 29.pdf', '/home/dancerv/INIFAP/FOLLETOS/PUBLICACIONES ESPECIALES/Pecuario/2009 DIAGNOSTICO DE LA ACTIVIDAD PESQUERA EN LA PRESA LAZARO CARDENAS DEL MUNICIPIO DE INDE, DURANGO. Publicación especial 29.pdf', 'pdf', '2026-09-24 04:02:07'),
(189, 9, 'FOLLETOS.zip', '/home/dancerv/INIFAP/FOLLETOS/.fr-9VP9V3/FOLLETOS.zip', 'zip', '2026-09-24 04:02:07'),
(190, 10, '2007 ESTUDIO REGIONAL FORESTAL. CASO UMAFOR no.1001 GUANACAVI, DURANGO Libro técnico 2.pdf', '/home/dancerv/INIFAP/FOLLETOS/LIBRO TÉCNICO/Forestal/2007 ESTUDIO REGIONAL FORESTAL. CASO UMAFOR no.1001 GUANACAVI, DURANGO Libro técnico 2.pdf', 'pdf', '2026-09-24 04:02:07'),
(191, 10, '2012 PRODUCCIÓN DE PLANTA FORESTAL DEL SEMIARIDO EN CONDICONES PROTEGIDAS LIBRO TÉCNICO 9.pdf', '/home/dancerv/INIFAP/FOLLETOS/LIBRO TÉCNICO/Forestal/2012 PRODUCCIÓN DE PLANTA FORESTAL DEL SEMIARIDO EN CONDICONES PROTEGIDAS LIBRO TÉCNICO 9.pdf', 'pdf', '2026-09-24 04:02:07'),
(192, 10, '2012 SISTEMA VOLUMÉTRICO Y DE ÍNDICE DE SITIO DE ESPECIES DEL GÉNERO PINUS PARA LA UMAFOR 1005 SANTIAGO PAPASQUIARO EN DURANGO LIBRO CIENTIFICO 2.pdf', '/home/dancerv/INIFAP/FOLLETOS/LIBRO TÉCNICO/Forestal/2012 SISTEMA VOLUMÉTRICO Y DE ÍNDICE DE SITIO DE ESPECIES DEL GÉNERO PINUS PARA LA UMAFOR 1005 SANTIAGO PAPASQUIARO EN DURANGO LIBRO CIENTIFICO 2.pdf', 'pdf', '2026-09-24 04:02:07'),
(193, 10, '2012 Hongos silvestres ectomicorrízicos de bosques templados fríos de los municipios de Pueblo Nuevo, San Dimas y Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/LIBRO TÉCNICO/Forestal/2012 Hongos silvestres ectomicorrízicos de bosques templados fríos de los municipios de Pueblo Nuevo, San Dimas y Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(194, 10, '2012 PRODUCCION DE PLANTA FORESTAL DEL TEMPLADO-FRIO EN CONDICIONES PROTEGIDAS LIBRO TÉCNICO 10.pdf', '/home/dancerv/INIFAP/FOLLETOS/LIBRO TÉCNICO/Forestal/2012 PRODUCCION DE PLANTA FORESTAL DEL TEMPLADO-FRIO EN CONDICIONES PROTEGIDAS LIBRO TÉCNICO 10.pdf', 'pdf', '2026-09-24 04:02:07'),
(195, 10, '2012 CRITERIOS E INDICADORES PARA EVALUAR SUSTENTABILIDAD ENE LE ESTADO DE DURANGO LIBRO TÉCNICO 12.pdf', '/home/dancerv/INIFAP/FOLLETOS/LIBRO TÉCNICO/Forestal/2012 CRITERIOS E INDICADORES PARA EVALUAR SUSTENTABILIDAD ENE LE ESTADO DE DURANGO LIBRO TÉCNICO 12.pdf', 'pdf', '2026-09-24 04:02:07'),
(196, 10, '2011 Evaluación de plantaciones forestales en la Sierra Madre Occidental.pdf', '/home/dancerv/INIFAP/FOLLETOS/LIBRO TÉCNICO/Forestal/2011 Evaluación de plantaciones forestales en la Sierra Madre Occidental.pdf', 'pdf', '2026-09-24 04:02:07'),
(197, 10, '2007 Modelos biométricos que conforman a sicremars versión 2.0.pdf', '/home/dancerv/INIFAP/FOLLETOS/LIBRO TÉCNICO/Forestal/2007 Modelos biométricos que conforman a sicremars versión 2.0.pdf', 'pdf', '2026-09-24 04:02:07'),
(198, 10, '2011 Indicadores de calidad de planta en viveros forestales de la sierra madre occidental.pdf', '/home/dancerv/INIFAP/FOLLETOS/LIBRO TÉCNICO/Forestal/2011 Indicadores de calidad de planta en viveros forestales de la sierra madre occidental.pdf', 'pdf', '2026-09-24 04:02:07'),
(199, 10, '2005 Estadísticas climatológicas básicas del estado de Durango (período 1961-2003).pdf', '/home/dancerv/INIFAP/FOLLETOS/LIBRO TÉCNICO/Agrícola/2005 Estadísticas climatológicas básicas del estado de Durango (período 1961-2003).pdf', 'pdf', '2026-09-24 04:02:07'),
(200, 10, '2025 Mejoramiento genético de frijol sus protagonistas, variedades e impacto para la soberanía alimentaria en México.pdf', '/home/dancerv/INIFAP/FOLLETOS/LIBRO TÉCNICO/Agrícola/2025 Mejoramiento genético de frijol sus protagonistas, variedades e impacto para la soberanía alimentaria en México.pdf', 'pdf', '2026-09-24 04:02:07'),
(201, 10, '2012 Uso de biofertilizantes en la producción de grano y forraje en maíz en Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/LIBRO TÉCNICO/Agrícola/2012 Uso de biofertilizantes en la producción de grano y forraje en maíz en Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(202, 10, '2011 Situación agropecuaria y forestal en el estado de Durago.pdf', '/home/dancerv/INIFAP/FOLLETOS/LIBRO TÉCNICO/Agrícola/2011 Situación agropecuaria y forestal en el estado de Durago.pdf', 'pdf', '2026-09-24 04:02:07'),
(203, 10, '2012 Uso de biofertilizantes en la producción de firjol en el estado de Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/LIBRO TÉCNICO/Agrícola/2012 Uso de biofertilizantes en la producción de firjol en el estado de Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(204, 10, '2016 Estrategias para el uso integral de la higuerilla en México.pdf', '/home/dancerv/INIFAP/FOLLETOS/LIBRO TÉCNICO/Pecuario/2016 Estrategias para el uso integral de la higuerilla en México.pdf', 'pdf', '2026-09-24 04:02:07'),
(205, 13, '2015 Validación del Diagrama de Manejo de la Densidad basado en el Modelo de Yoda para las masas mezcladas de la UMAFOR 1005 Stgo. Papasquiaro y Anexos.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Forestal/2015 Validación del Diagrama de Manejo de la Densidad basado en el Modelo de Yoda para las masas mezcladas de la UMAFOR 1005 Stgo. Papasquiaro y Anexos.pdf', 'pdf', '2026-09-24 04:02:07'),
(206, 13, '2013 Muestreo de cargas combustibles forestales.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Forestal/2013 Muestreo de cargas combustibles forestales.pdf', 'pdf', '2026-09-24 04:02:07'),
(207, 13, '2014 Diagrama de manejo de la densidad basado en el modelo YODA para las masas mezcladas de la UMAFOR 1005 Stgo. Papasquiaro y Anexos.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Forestal/2014 Diagrama de manejo de la densidad basado en el modelo YODA para las masas mezcladas de la UMAFOR 1005 Stgo. Papasquiaro y Anexos.pdf', 'pdf', '2026-09-24 04:02:07'),
(208, 13, '2012 PRODUCCIÓN DE PLANTA DE PINO EN CONDICIONES PROTEGIDAS. Desplegable Técnica 49.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Forestal/2012 PRODUCCIÓN DE PLANTA DE PINO EN CONDICIONES PROTEGIDAS. Desplegable Técnica 49.pdf', 'pdf', '2026-09-24 04:02:07'),
(209, 13, '2006 ESTABLECIMIENTO DE PLANTACIONES PARA EL CULTIVO DE ÁRBOLES DE NAVIDAD EN CLIMA SEMIÁRIDO. Desplegable Técnica 7.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Forestal/2006 ESTABLECIMIENTO DE PLANTACIONES PARA EL CULTIVO DE ÁRBOLES DE NAVIDAD EN CLIMA SEMIÁRIDO. Desplegable Técnica 7.pdf', 'pdf', '2026-09-24 04:02:07'),
(210, 13, '2014 Validación del Sistema Volumétrico Exo-regional para UMAFOR 1005 Santiago Papasquiaro y anexos.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Forestal/2014 Validación del Sistema Volumétrico Exo-regional para UMAFOR 1005 Santiago Papasquiaro y anexos.pdf', 'pdf', '2026-09-24 04:02:07'),
(211, 13, '2012 La evaluación de la sustentabilidad del manejo de bosques en México. Desplegable técnico 1.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Forestal/2012 La evaluación de la sustentabilidad del manejo de bosques en México. Desplegable técnico 1.pdf', 'pdf', '2026-09-24 04:02:07'),
(212, 13, '2006 ESTUDIO REGIONAL PARA EL FORTALECIMIENTO DE LAS UNIDADES DE MANEJO FORESTAL EN LA REGIÓN DE GUANACEVÍ, DURANGO. Desplegable informativa 3.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Forestal/2006 ESTUDIO REGIONAL PARA EL FORTALECIMIENTO DE LAS UNIDADES DE MANEJO FORESTAL EN LA REGIÓN DE GUANACEVÍ, DURANGO. Desplegable informativa 3.pdf', 'pdf', '2026-09-24 04:02:07'),
(213, 13, '2001 PRODUCCIÓN DE ÁRBOLES DE NAVIDAD EN CONDICIONES DE CLIMA SEMIÁRDIO. Desplegable para productores 23.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Forestal/2001 PRODUCCIÓN DE ÁRBOLES DE NAVIDAD EN CONDICIONES DE CLIMA SEMIÁRDIO. Desplegable para productores 23.pdf', 'pdf', '2026-09-24 04:02:07'),
(214, 13, '2014 Validación de las ecuaciones de crecimiento en altura dominante e índice de sitio para la UMAFOR 1005 Stgo. Papasquiaro y Anexos (2).pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Forestal/2014 Validación de las ecuaciones de crecimiento en altura dominante e índice de sitio para la UMAFOR 1005 Stgo. Papasquiaro y Anexos (2).pdf', 'pdf', '2026-09-24 04:02:07'),
(215, 13, '2008 LAS QUEMAS CONTROLADAS EN LA PREVENCIÓN DE INCENDIOS FORESTALES. Desplegable para productores 41.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Forestal/2008 LAS QUEMAS CONTROLADAS EN LA PREVENCIÓN DE INCENDIOS FORESTALES. Desplegable para productores 41.pdf', 'pdf', '2026-09-24 04:02:07'),
(216, 13, '2005 Características de la planta y recomendaciones para su transporte al sitio de plantación.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Forestal/2005 Características de la planta y recomendaciones para su transporte al sitio de plantación.pdf', 'pdf', '2026-09-24 04:02:07'),
(217, 13, '2017 Producción de plántas de agave a raíz desnuda con acolchado.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Forestal/2017 Producción de plántas de agave a raíz desnuda con acolchado.pdf', 'pdf', '2026-09-24 04:02:07'),
(218, 13, '2017 Preacondicionamiento de planta forestal producida en condiciones protegidas (2).pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Forestal/2017 Preacondicionamiento de planta forestal producida en condiciones protegidas (2).pdf', 'pdf', '2026-09-24 04:02:07'),
(219, 13, '2004 GUÍA PARA LA PRODUCCIÓN DE PLANTA FORESTAL EN VIVERO. Desplegable para productores 32.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Forestal/2004 GUÍA PARA LA PRODUCCIÓN DE PLANTA FORESTAL EN VIVERO. Desplegable para productores 32.pdf', 'pdf', '2026-09-24 04:02:07'),
(220, 13, '2000 EVITE INCENDIOS FORESTALES MEDIANTE QUEMAS CONTROLADAS. Desplegable para productores 21.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Forestal/2000 EVITE INCENDIOS FORESTALES MEDIANTE QUEMAS CONTROLADAS. Desplegable para productores 21.pdf', 'pdf', '2026-09-24 04:02:07'),
(221, 13, '2017 Recolección de hongos ectomicorrízicos para inóculo en vivero (2).pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Forestal/2017 Recolección de hongos ectomicorrízicos para inóculo en vivero (2).pdf', 'pdf', '2026-09-24 04:02:07'),
(222, 13, '2012 SUSTRATOS EN LA PRODUCCIÓN DE PLANTA FORESTAL BAJO CONDICIONES PROTEGIDAS. Desplegable Técnico 50.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Forestal/2012 SUSTRATOS EN LA PRODUCCIÓN DE PLANTA FORESTAL BAJO CONDICIONES PROTEGIDAS. Desplegable Técnico 50.pdf', 'pdf', '2026-09-24 04:02:07'),
(223, 13, '2015 Bases técnicas sobre diseño de experimentos en viveros forestales.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Forestal/2015 Bases técnicas sobre diseño de experimentos en viveros forestales.pdf', 'pdf', '2026-09-24 04:02:07'),
(224, 13, '2014 Técnicas de producción de planta de pino en vivero.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Forestal/2014 Técnicas de producción de planta de pino en vivero.pdf', 'pdf', '2026-09-24 04:02:07'),
(225, 13, '2001 RED DE BOSQUES MODELO DURANGO Desplegable para productores 20.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Forestal/2001 RED DE BOSQUES MODELO DURANGO Desplegable para productores 20.pdf', 'pdf', '2026-09-24 04:02:07'),
(226, 13, '2005 PROGRAMA NACIONAL DE  MANEJO SUSTENTABLE DE RECURSOS FORESTALES . Desplegable informativo.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Forestal/2005 PROGRAMA NACIONAL DE  MANEJO SUSTENTABLE DE RECURSOS FORESTALES . Desplegable informativo.pdf', 'pdf', '2026-09-24 04:02:07'),
(227, 13, '2002 Selección y preparación del terreno para plantación de árboles de navidad. Desplegable para productores 25.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Forestal/2002 Selección y preparación del terreno para plantación de árboles de navidad. Desplegable para productores 25.pdf', 'pdf', '2026-09-24 04:02:07'),
(228, 13, '2010 Modelos matemáticos para predecir el crecimiento, como herramenta en el manejo de los recursos forestales maderables. Desplegable Técnico 45.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Forestal/2010 Modelos matemáticos para predecir el crecimiento, como herramenta en el manejo de los recursos forestales maderables. Desplegable Técnico 45.pdf', 'pdf', '2026-09-24 04:02:07'),
(229, 13, '2014 Diagrama de manejo de la densidad basado en el modelo de REINEKE para las masas mezcladas de la UMAFOR 1005 Santiado Papasquiaro y anexos.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Forestal/2014 Diagrama de manejo de la densidad basado en el modelo de REINEKE para las masas mezcladas de la UMAFOR 1005 Santiado Papasquiaro y anexos.pdf', 'pdf', '2026-09-24 04:02:07'),
(230, 13, '2004 NUEVOS MODELOS DE CRECIMIENTO PARA BOSQUES REGULARES E IRREGULARES DE PUNIS COOPERI BLANCO EN SAN MIGUEL DE CRUCES DURANGO FOLLETO 10.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Forestal/2004 NUEVOS MODELOS DE CRECIMIENTO PARA BOSQUES REGULARES E IRREGULARES DE PUNIS COOPERI BLANCO EN SAN MIGUEL DE CRUCES DURANGO FOLLETO 10.pdf', 'pdf', '2026-09-24 04:02:07'),
(231, 13, '2000 BOSQUE MODELO DURANGO Desplegable para productores 20.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Forestal/2000 BOSQUE MODELO DURANGO Desplegable para productores 20.pdf', 'pdf', '2026-09-24 04:02:07'),
(232, 13, '2014 Recomendaciones para la producción de planta de mezqute en vivero.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Forestal/2014 Recomendaciones para la producción de planta de mezqute en vivero.pdf', 'pdf', '2026-09-24 04:02:07'),
(233, 13, '2016 Bioestimulantes para el control de enfermedades fungosas en viveros forestales (2).pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Forestal/2016 Bioestimulantes para el control de enfermedades fungosas en viveros forestales (2).pdf', 'pdf', '2026-09-24 04:02:07'),
(234, 13, '2015 Transferencia de las ecuaciones de crecimiento en altura dominante e índice de Sitio para la UMAFOR 1005 Sgo. Papasquiaro y anexos.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Forestal/2015 Transferencia de las ecuaciones de crecimiento en altura dominante e índice de Sitio para la UMAFOR 1005 Sgo. Papasquiaro y anexos.pdf', 'pdf', '2026-09-24 04:02:07'),
(235, 13, '2014 Método para evaluar la calidad de planta del género Pinus en etapa de vivero.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Forestal/2014 Método para evaluar la calidad de planta del género Pinus en etapa de vivero.pdf', 'pdf', '2026-09-24 04:02:07'),
(236, 13, '2013 Beneficios del uso del rodillo aereador.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2013 Beneficios del uso del rodillo aereador.pdf', 'pdf', '2026-09-24 04:02:07'),
(237, 13, '2024 Uso de inductores de resistencia en el control de la marchitez del chile.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2024 Uso de inductores de resistencia en el control de la marchitez del chile.pdf', 'pdf', '2026-09-24 04:02:07'),
(238, 13, '2009 H-376 Híbrido de maíz para producción de grano y forraje en riego en Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2009 H-376 Híbrido de maíz para producción de grano y forraje en riego en Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(239, 13, '2015 Campo Experimental Valle del Guadiana del INIFAP en Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2015 Campo Experimental Valle del Guadiana del INIFAP en Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(240, 13, '2003 GUIA PARA CULTIVAR AVENA PARA GRANO CON LABRANZA DE CONSERVACION EN DURANGO Desplegable para productores 29.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2003 GUIA PARA CULTIVAR AVENA PARA GRANO CON LABRANZA DE CONSERVACION EN DURANGO Desplegable para productores 29.pdf', 'pdf', '2026-09-24 04:02:07'),
(241, 13, '2020 Validación comercial de variedades mejoradas de frijol desarrolladas en Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2020 Validación comercial de variedades mejoradas de frijol desarrolladas en Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(242, 13, '2014 Control biológico en plagas del nogal pecanero.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2014 Control biológico en plagas del nogal pecanero.pdf', 'pdf', '2026-09-24 04:02:07'),
(243, 13, '2005 Tizón común del frijol causado por Xanthomonas campestris pv. Phaseoli..pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2005 Tizón común del frijol causado por Xanthomonas campestris pv. Phaseoli..pdf', 'pdf', '2026-09-24 04:02:07'),
(244, 13, '2016 Criterios básicos en la agricultura de riego El monitoreo de la humedad del suelo.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2016 Criterios básicos en la agricultura de riego El monitoreo de la humedad del suelo.pdf', 'pdf', '2026-09-24 04:02:07'),
(245, 13, '2017 Monitor inteligente Aplicación móvil para la observación del funcionamiento de la red nacional de estaciones agrometereológicas.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2017 Monitor inteligente Aplicación móvil para la observación del funcionamiento de la red nacional de estaciones agrometereológicas.pdf', 'pdf', '2026-09-24 04:02:07'),
(246, 13, '2004 Pileteo. Práctica cultural para cosechar agua de lluvia y conservar el suelo.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2004 Pileteo. Práctica cultural para cosechar agua de lluvia y conservar el suelo.pdf', 'pdf', '2026-09-24 04:02:07'),
(247, 13, '2002 GUIA PARA CULTIVAR FRIJOL BAJO LABRANZA DE CONSERVACION EN DURANGO. Desplegable para productores 26.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2002 GUIA PARA CULTIVAR FRIJOL BAJO LABRANZA DE CONSERVACION EN DURANGO. Desplegable para productores 26.pdf', 'pdf', '2026-09-24 04:02:07'),
(248, 13, '2018 Recomendaciones agronómicas para la producción de lechuga orejona (Lactuca sativa L.).pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2018 Recomendaciones agronómicas para la producción de lechuga orejona (Lactuca sativa L.).pdf', 'pdf', '2026-09-24 04:02:07'),
(249, 13, '2015 Variedades para incrementar el rendimiento y calidad del frijol.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2015 Variedades para incrementar el rendimiento y calidad del frijol.pdf', 'pdf', '2026-09-24 04:02:07'),
(250, 13, '2018 Período óptimo para el control efectivo del gusano cogollero en maíz (2).pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2018 Período óptimo para el control efectivo del gusano cogollero en maíz (2).pdf', 'pdf', '2026-09-24 04:02:07'),
(251, 13, '2015 Sistema de gestión de calidad en la región norte centro del INIFAP (norma española UNE-EN-ISO 9001 2008).pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2015 Sistema de gestión de calidad en la región norte centro del INIFAP (norma española UNE-EN-ISO 9001 2008).pdf', 'pdf', '2026-09-24 04:02:07'),
(252, 13, '2006 Oportunidades de mercado para el frijol producido en el estado de Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2006 Oportunidades de mercado para el frijol producido en el estado de Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(253, 13, '2006 Importancia de la norma mexicana para la comercialización de frijol.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2006 Importancia de la norma mexicana para la comercialización de frijol.pdf', 'pdf', '2026-09-24 04:02:07'),
(254, 13, '2017 Formulación de dosis de fertilización en el cultivo de frijol.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2017 Formulación de dosis de fertilización en el cultivo de frijol.pdf', 'pdf', '2026-09-24 04:02:07'),
(255, 13, '2016 H-379 Híbrido de maíz para producir grano y forraje en la región norte centro de México.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2016 H-379 Híbrido de maíz para producir grano y forraje en la región norte centro de México.pdf', 'pdf', '2026-09-24 04:02:07'),
(256, 13, '2018 Manejo fitosanitario de cultivos hortícolas (2).pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2018 Manejo fitosanitario de cultivos hortícolas (2).pdf', 'pdf', '2026-09-24 04:02:07'),
(257, 13, '2005 Karma Nueva variedad de avena forrajera para temporal en Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2005 Karma Nueva variedad de avena forrajera para temporal en Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(258, 13, '2018 Importancia de la materia orgánica en el fortalecimiento de la fertilidad de suelos agrícolas en Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2018 Importancia de la materia orgánica en el fortalecimiento de la fertilidad de suelos agrícolas en Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(259, 13, '2016 Características morfológicas de tres clases comerciales de tuna cultivadas en el Valle del Guadiana, Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2016 Características morfológicas de tres clases comerciales de tuna cultivadas en el Valle del Guadiana, Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(260, 13, '2013 El control del tizón de fuego en el manzano.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2013 El control del tizón de fuego en el manzano.pdf', 'pdf', '2026-09-24 04:02:07'),
(261, 13, '2005 CEVAMEX NUEVA VARIEDAD DE AVENA FORRAJERA PARA TEMPORAL EN DURANGO Desplegable para productores 34.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2005 CEVAMEX NUEVA VARIEDAD DE AVENA FORRAJERA PARA TEMPORAL EN DURANGO Desplegable para productores 34.pdf', 'pdf', '2026-09-24 04:02:07'),
(262, 13, '2001 Labranza de conservación.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2001 Labranza de conservación.pdf', 'pdf', '2026-09-24 04:02:07'),
(263, 13, '2017 Establecimiento de trampas con feromona para el monitoreo y control del gusano cogollero (2).pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2017 Establecimiento de trampas con feromona para el monitoreo y control del gusano cogollero (2).pdf', 'pdf', '2026-09-24 04:02:07'),
(264, 13, '2023 Recomendaciones de dosis de fertilizantes en la producción de maíz para grano.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2023 Recomendaciones de dosis de fertilizantes en la producción de maíz para grano.pdf', 'pdf', '2026-09-24 04:02:07'),
(265, 13, '2009 PULGÓN GIGANTE de la corteza del nogal Longistigma caryae.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2009 PULGÓN GIGANTE de la corteza del nogal Longistigma caryae.pdf', 'pdf', '2026-09-24 04:02:07'),
(266, 13, '2005 Saltillo. Nueva variedad de frijol para el desarrollo de Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2005 Saltillo. Nueva variedad de frijol para el desarrollo de Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(267, 13, '2012 Variedades mejoradas de frijol para el estado de Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2012 Variedades mejoradas de frijol para el estado de Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(268, 13, '2005 Tizón del frijol causado por Xhantomonas campestris pv. Phaseoli..pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2005 Tizón del frijol causado por Xhantomonas campestris pv. Phaseoli..pdf', 'pdf', '2026-09-24 04:02:07'),
(269, 13, '2017 Establecimiento y manejo de huertos de traspatio para la producción de hortalizas (2).pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2017 Establecimiento y manejo de huertos de traspatio para la producción de hortalizas (2).pdf', 'pdf', '2026-09-24 04:02:07'),
(270, 13, '2004 El tizón de fuego en la zona frutícola de Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2004 El tizón de fuego en la zona frutícola de Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(271, 13, '2018 Insecticidas biológicos para el control del gusano cogollero en el cultivo de maíz.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2018 Insecticidas biológicos para el control del gusano cogollero en el cultivo de maíz.pdf', 'pdf', '2026-09-24 04:02:07'),
(272, 13, '2007 red de estaciones agroclimaticas del estado de Durango desplegable para productores 39.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2007 red de estaciones agroclimaticas del estado de Durango desplegable para productores 39.pdf', 'pdf', '2026-09-24 04:02:07'),
(273, 13, '2002 GUIA PARA CULTIVAR CEBADA MALTERA BAJO LABRANZA DE CONSERVACION EN DURANGO. Desplegable para productores  27.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2002 GUIA PARA CULTIVAR CEBADA MALTERA BAJO LABRANZA DE CONSERVACION EN DURANGO. Desplegable para productores  27.pdf', 'pdf', '2026-09-24 04:02:07'),
(274, 13, '2014 Técnicas de cosecha de agua para incrementar el rendimiento del frijol en Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2014 Técnicas de cosecha de agua para incrementar el rendimiento del frijol en Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(275, 13, '2018 Determinación de dósis nitrógeno en maíz usando el sensor Greenseeker.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2018 Determinación de dósis nitrógeno en maíz usando el sensor Greenseeker.pdf', 'pdf', '2026-09-24 04:02:07'),
(276, 13, '2022 Recomendaciones para el control de oomicetos (Pseudohongos) en el cultivo de chile.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2022 Recomendaciones para el control de oomicetos (Pseudohongos) en el cultivo de chile.pdf', 'pdf', '2026-09-24 04:02:07'),
(277, 13, '2013 PLATAFORMA MASAGRO Producción de Frijol de Temporal con diferentes Tecnologías.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2013 PLATAFORMA MASAGRO Producción de Frijol de Temporal con diferentes Tecnologías.pdf', 'pdf', '2026-09-24 04:02:07'),
(278, 13, '2022 Control biológico del damping off en plántulas de chile.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2022 Control biológico del damping off en plántulas de chile.pdf', 'pdf', '2026-09-24 04:02:07'),
(279, 13, '2014 Alternativas de producción de plántula de tomate en Durango (2).pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2014 Alternativas de producción de plántula de tomate en Durango (2).pdf', 'pdf', '2026-09-24 04:02:07'),
(280, 13, '2023 Uso de fertilizantes sólidos y líquidos para la producción de frijol en Durango.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2023 Uso de fertilizantes sólidos y líquidos para la producción de frijol en Durango.pdf', 'pdf', '2026-09-24 04:02:07'),
(281, 13, '2006 Pinto Saltillo. Sistema de manejo para optimizar su rendimiento..pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2006 Pinto Saltillo. Sistema de manejo para optimizar su rendimiento..pdf', 'pdf', '2026-09-24 04:02:07'),
(282, 13, '2004 El cultivo de Canola Brassica napus-B.rapa.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2004 El cultivo de Canola Brassica napus-B.rapa.pdf', 'pdf', '2026-09-24 04:02:07'),
(283, 13, '2007 Calidad comercial e industrial de frijol en México.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2007 Calidad comercial e industrial de frijol en México.pdf', 'pdf', '2026-09-24 04:02:07'),
(284, 13, '2016 Estimación de grados día D en cultivos agrícolas.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Agrícola/2016 Estimación de grados día D en cultivos agrícolas.pdf', 'pdf', '2026-09-24 04:02:07'),
(285, 13, '2015 Lectura de comedero en corrales de engorda.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Pecuario/2015 Lectura de comedero en corrales de engorda.pdf', 'pdf', '2026-09-24 04:02:07'),
(286, 13, '2018 ACIDOSIS RUMINAL EN EL GANADO BOVINO.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Pecuario/2018 ACIDOSIS RUMINAL EN EL GANADO BOVINO.pdf', 'pdf', '2026-09-24 04:02:07'),
(287, 13, '2006 Propuesta de rastreabilidad para bovinos de carne en Durango. Folleto técnico 6.crdownload', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Pecuario/2006 Propuesta de rastreabilidad para bovinos de carne en Durango. Folleto técnico 6.crdownload', 'crdownload', '2026-09-24 04:02:07'),
(288, 13, '2018 Recomendaciones sobre el uso, manejo y aplicación adecuada de medicamento en el ganado bovino.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Pecuario/2018 Recomendaciones sobre el uso, manejo y aplicación adecuada de medicamento en el ganado bovino.pdf', 'pdf', '2026-09-24 04:02:07'),
(289, 13, '2000 COMPORTAMIENTO PRODUCTIVO Y REPRODUCTIVO DE SEMENTALES EN EL ESTADO DE DURANGO Desplegable para productores 17.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Pecuario/2000 COMPORTAMIENTO PRODUCTIVO Y REPRODUCTIVO DE SEMENTALES EN EL ESTADO DE DURANGO Desplegable para productores 17.pdf', 'pdf', '2026-09-24 04:02:07'),
(290, 13, '2007 Calidad organoléptica de la carne de bovino (2).pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Pecuario/2007 Calidad organoléptica de la carne de bovino (2).pdf', 'pdf', '2026-09-24 04:02:07'),
(291, 13, '2016 INDUCCIÓN DE MICORRIZA EN PLANTAS DE PINO CON HONGOS DEL GÉNERO Russula.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Pecuario/2016 INDUCCIÓN DE MICORRIZA EN PLANTAS DE PINO CON HONGOS DEL GÉNERO Russula.pdf', 'pdf', '2026-09-24 04:02:07'),
(292, 13, '2016 Zona de fuga y punto de equilibrio en bovinos.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Pecuario/2016 Zona de fuga y punto de equilibrio en bovinos.pdf', 'pdf', '2026-09-24 04:02:07'),
(293, 13, '2016 PRODUCCIÓN DE MARALFALFA EN DURANGO.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Pecuario/2016 PRODUCCIÓN DE MARALFALFA EN DURANGO.pdf', 'pdf', '2026-09-24 04:02:07'),
(294, 13, '2006 Uso de la marca MÉXICO CALIDAD SUPREMA para comercializar mejor la carne de bovino. Desplegab le técnico 8.crdownload', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Pecuario/2006 Uso de la marca MÉXICO CALIDAD SUPREMA para comercializar mejor la carne de bovino. Desplegab le técnico 8.crdownload', 'crdownload', '2026-09-24 04:02:07'),
(295, 13, '2015 Riesgos del uso alimenticio, industrial y agropecuario de La Jatropha.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Pecuario/2015 Riesgos del uso alimenticio, industrial y agropecuario de La Jatropha.pdf', 'pdf', '2026-09-24 04:02:07'),
(296, 13, '2013 Componentes de importancia en la alimentación de bovinos (2).pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Pecuario/2013 Componentes de importancia en la alimentación de bovinos (2).pdf', 'pdf', '2026-09-24 04:02:07'),
(297, 13, '2005 Pruebas de comportamiento de sementales bovinos (2).pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Pecuario/2005 Pruebas de comportamiento de sementales bovinos (2).pdf', 'pdf', '2026-09-24 04:02:07'),
(298, 13, '2013 Requerimientos nutricionales de bovinos criados para producción de carne.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Pecuario/2013 Requerimientos nutricionales de bovinos criados para producción de carne.pdf', 'pdf', '2026-09-24 04:02:07'),
(299, 13, '2017 Aprovechamiento de residuos de actividades agropecuarios y forestales para la elaboración de compostas.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Pecuario/2017 Aprovechamiento de residuos de actividades agropecuarios y forestales para la elaboración de compostas.pdf', 'pdf', '2026-09-24 04:02:07'),
(300, 13, '2013 PLATAFORMA MASAGRO Producción de Grano y Forraje de Maíz en Temporal.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Pecuario/2013 PLATAFORMA MASAGRO Producción de Grano y Forraje de Maíz en Temporal.pdf', 'pdf', '2026-09-24 04:02:07'),
(301, 13, '2012 Prácticas alimenticias para el cultivo de tilapia.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Pecuario/2012 Prácticas alimenticias para el cultivo de tilapia.pdf', 'pdf', '2026-09-24 04:02:07'),
(302, 13, '2015 Tinas nutritivas para la suplementación del ganado (2).pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Pecuario/2015 Tinas nutritivas para la suplementación del ganado (2).pdf', 'pdf', '2026-09-24 04:02:07'),
(303, 13, '2016 Importancia de los escarabajos del estiércol (2).pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Pecuario/2016 Importancia de los escarabajos del estiércol (2).pdf', 'pdf', '2026-09-24 04:02:07'),
(304, 13, '2018 Alternativa de producción forrajera en Durango del mijo perla (pennisetum glaucum)Desplegable para productores.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Pecuario/2018 Alternativa de producción forrajera en Durango del mijo perla (pennisetum glaucum)Desplegable para productores.pdf', 'pdf', '2026-09-24 04:02:07'),
(305, 13, '2018 TIMPANISMO EN EL GANADO BOVINO.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Pecuario/2018 TIMPANISMO EN EL GANADO BOVINO.pdf', 'pdf', '2026-09-24 04:02:07'),
(306, 13, '2000 Acuacultura integral, una opción para el aprovechamiento de cuerpos de agua menores.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Pecuario/2000 Acuacultura integral, una opción para el aprovechamiento de cuerpos de agua menores.pdf', 'pdf', '2026-09-24 04:02:07'),
(307, 13, '2017 Recomendaciones para producir huevo con gallinas en pastoreo.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Pecuario/2017 Recomendaciones para producir huevo con gallinas en pastoreo.pdf', 'pdf', '2026-09-24 04:02:07'),
(308, 13, '2017 Determinación de materia seca utilizando microondas.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Pecuario/2017 Determinación de materia seca utilizando microondas.pdf', 'pdf', '2026-09-24 04:02:07'),
(309, 13, '2015 Evaluación de híbridos de maíz para grano y forraje bajo riego en Durango, en 2014.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Pecuario/2015 Evaluación de híbridos de maíz para grano y forraje bajo riego en Durango, en 2014.pdf', 'pdf', '2026-09-24 04:02:07'),
(310, 13, '2018 IMPORTANCIA DEL FÓSFORO EN LA NUTRICIÓN DEL GANADO BOVINO PRODUCTOR DE CARNE.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Pecuario/2018 IMPORTANCIA DEL FÓSFORO EN LA NUTRICIÓN DEL GANADO BOVINO PRODUCTOR DE CARNE.pdf', 'pdf', '2026-09-24 04:02:07'),
(311, 13, '2016 Recomendaciones para el bienestar del ganado bovino productor de carne.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Pecuario/2016 Recomendaciones para el bienestar del ganado bovino productor de carne.pdf', 'pdf', '2026-09-24 04:02:07'),
(312, 13, '2012 Diagnóstico de preñez, práctica elemental para incrementar la parición de bovinos.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Pecuario/2012 Diagnóstico de preñez, práctica elemental para incrementar la parición de bovinos.pdf', 'pdf', '2026-09-24 04:02:07'),
(313, 13, '2017 Recepción de ganado bovino en el corral de engorda.pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Pecuario/2017 Recepción de ganado bovino en el corral de engorda.pdf', 'pdf', '2026-09-24 04:02:07'),
(314, 13, '2016 Metodología para monitorear el crecimiento y caracterizar la calidad morfológica de pasto navajita producido en invernadero (2).pdf', '/home/dancerv/INIFAP/FOLLETOS/DESPLEGABLES/Pecuario/2016 Metodología para monitorear el crecimiento y caracterizar la calidad morfológica de pasto navajita producido en invernadero (2).pdf', 'pdf', '2026-09-24 04:02:07'),
(315, 16, 'PUBLICACIONES ESPECIALES.zip', '/home/dancerv/INIFAP/FOLLETOS/.fr-6WZ6V3/PUBLICACIONES ESPECIALES.zip', 'zip', '2026-09-24 04:02:07'),
(316, 17, 'LIBRO TÉCNICO.zip', '/home/dancerv/INIFAP/FOLLETOS/.fr-VFJJW3/LIBRO TÉCNICO.zip', 'zip', '2026-09-24 04:02:07'),
(317, 19, 'package.json', '/home/dancerv/INIFAP/Biblioteca_INIFAP/app-mobile/package.json', 'json', '2026-09-24 04:02:08'),
(318, 19, 'App.js', '/home/dancerv/INIFAP/Biblioteca_INIFAP/app-mobile/App.js', 'js', '2026-09-24 04:02:08'),
(319, 20, 'HEAD', '/home/dancerv/INIFAP/Biblioteca_INIFAP/.git/HEAD', 'desconocido', '2026-09-24 04:02:08'),
(320, 20, 'packed-refs', '/home/dancerv/INIFAP/Biblioteca_INIFAP/.git/packed-refs', 'desconocido', '2026-09-24 04:02:08'),
(321, 20, 'description', '/home/dancerv/INIFAP/Biblioteca_INIFAP/.git/description', 'desconocido', '2026-09-24 04:02:08'),
(322, 20, 'config', '/home/dancerv/INIFAP/Biblioteca_INIFAP/.git/config', 'desconocido', '2026-09-24 04:02:08'),
(323, 20, 'index', '/home/dancerv/INIFAP/Biblioteca_INIFAP/.git/index', 'desconocido', '2026-09-24 04:02:08'),
(324, 20, 'main', '/home/dancerv/INIFAP/Biblioteca_INIFAP/.git/refs/heads/main', 'desconocido', '2026-09-24 04:02:08'),
(325, 20, 'HEAD', '/home/dancerv/INIFAP/Biblioteca_INIFAP/.git/refs/remotes/origin/HEAD', 'desconocido', '2026-09-24 04:02:08'),
(326, 20, 'pre-merge-commit.sample', '/home/dancerv/INIFAP/Biblioteca_INIFAP/.git/hooks/pre-merge-commit.sample', 'sample', '2026-09-24 04:02:08'),
(327, 20, 'pre-receive.sample', '/home/dancerv/INIFAP/Biblioteca_INIFAP/.git/hooks/pre-receive.sample', 'sample', '2026-09-24 04:02:08'),
(328, 20, 'applypatch-msg.sample', '/home/dancerv/INIFAP/Biblioteca_INIFAP/.git/hooks/applypatch-msg.sample', 'sample', '2026-09-24 04:02:08'),
(329, 20, 'fsmonitor-watchman.sample', '/home/dancerv/INIFAP/Biblioteca_INIFAP/.git/hooks/fsmonitor-watchman.sample', 'sample', '2026-09-24 04:02:08'),
(330, 20, 'pre-commit.sample', '/home/dancerv/INIFAP/Biblioteca_INIFAP/.git/hooks/pre-commit.sample', 'sample', '2026-09-24 04:02:08'),
(331, 20, 'prepare-commit-msg.sample', '/home/dancerv/INIFAP/Biblioteca_INIFAP/.git/hooks/prepare-commit-msg.sample', 'sample', '2026-09-24 04:02:08'),
(332, 20, 'update.sample', '/home/dancerv/INIFAP/Biblioteca_INIFAP/.git/hooks/update.sample', 'sample', '2026-09-24 04:02:08'),
(333, 20, 'pre-rebase.sample', '/home/dancerv/INIFAP/Biblioteca_INIFAP/.git/hooks/pre-rebase.sample', 'sample', '2026-09-24 04:02:08'),
(334, 20, 'pre-applypatch.sample', '/home/dancerv/INIFAP/Biblioteca_INIFAP/.git/hooks/pre-applypatch.sample', 'sample', '2026-09-24 04:02:08'),
(335, 20, 'pre-push.sample', '/home/dancerv/INIFAP/Biblioteca_INIFAP/.git/hooks/pre-push.sample', 'sample', '2026-09-24 04:02:08'),
(336, 20, 'push-to-checkout.sample', '/home/dancerv/INIFAP/Biblioteca_INIFAP/.git/hooks/push-to-checkout.sample', 'sample', '2026-09-24 04:02:08'),
(337, 20, 'sendemail-validate.sample', '/home/dancerv/INIFAP/Biblioteca_INIFAP/.git/hooks/sendemail-validate.sample', 'sample', '2026-09-24 04:02:08'),
(338, 20, 'commit-msg.sample', '/home/dancerv/INIFAP/Biblioteca_INIFAP/.git/hooks/commit-msg.sample', 'sample', '2026-09-24 04:02:08'),
(339, 20, 'post-update.sample', '/home/dancerv/INIFAP/Biblioteca_INIFAP/.git/hooks/post-update.sample', 'sample', '2026-09-24 04:02:08'),
(340, 20, 'exclude', '/home/dancerv/INIFAP/Biblioteca_INIFAP/.git/info/exclude', 'desconocido', '2026-09-24 04:02:08'),
(341, 20, 'HEAD', '/home/dancerv/INIFAP/Biblioteca_INIFAP/.git/logs/HEAD', 'desconocido', '2026-09-24 04:02:08'),
(342, 20, 'main', '/home/dancerv/INIFAP/Biblioteca_INIFAP/.git/logs/refs/heads/main', 'desconocido', '2026-09-24 04:02:08'),
(343, 20, 'HEAD', '/home/dancerv/INIFAP/Biblioteca_INIFAP/.git/logs/refs/remotes/origin/HEAD', 'desconocido', '2026-09-24 04:02:08'),
(344, 20, 'pack-55417641280794b81824bad1cb7a9680c8895026.pack', '/home/dancerv/INIFAP/Biblioteca_INIFAP/.git/objects/pack/pack-55417641280794b81824bad1cb7a9680c8895026.pack', 'pack', '2026-09-24 04:02:08'),
(345, 20, 'pack-55417641280794b81824bad1cb7a9680c8895026.rev', '/home/dancerv/INIFAP/Biblioteca_INIFAP/.git/objects/pack/pack-55417641280794b81824bad1cb7a9680c8895026.rev', 'rev', '2026-09-24 04:02:08'),
(346, 20, 'pack-55417641280794b81824bad1cb7a9680c8895026.idx', '/home/dancerv/INIFAP/Biblioteca_INIFAP/.git/objects/pack/pack-55417641280794b81824bad1cb7a9680c8895026.idx', 'idx', '2026-09-24 04:02:08'),
(347, 29, 'tablas.sql', '/home/dancerv/INIFAP/Biblioteca_INIFAP/BD/tablas.sql', 'sql', '2026-09-24 04:02:08'),
(348, 30, 'app.js', '/home/dancerv/INIFAP/Biblioteca_INIFAP/backend/app.js', 'js', '2026-09-24 04:02:08'),
(349, 30, 'package.json', '/home/dancerv/INIFAP/Biblioteca_INIFAP/backend/package.json', 'json', '2026-09-24 04:02:08'),
(350, 30, 'index.html', '/home/dancerv/INIFAP/Biblioteca_INIFAP/backend/public/index.html', 'html', '2026-09-24 04:02:08'),
(351, 30, 'estilos.css', '/home/dancerv/INIFAP/Biblioteca_INIFAP/backend/public/estilos.css', 'css', '2026-09-24 04:02:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(18, 'Biblioteca_INIFAP'),
(1, 'FOLLETOS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategorias`
--

CREATE TABLE `subcategorias` (
  `id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `subcategorias`
--

INSERT INTO `subcategorias` (`id`, `categoria_id`, `nombre`) VALUES
(16, 1, '.fr-6WZ6V3'),
(9, 1, '.fr-9VP9V3'),
(17, 1, '.fr-VFJJW3'),
(13, 1, 'DESPLEGABLES'),
(2, 1, 'FOLLETOS'),
(1, 1, 'General'),
(10, 1, 'LIBRO TÉCNICO'),
(6, 1, 'PUBLICACIONES ESPECIALES'),
(20, 18, '.git'),
(19, 18, 'app-mobile'),
(30, 18, 'backend'),
(29, 18, 'BD'),
(18, 18, 'General');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `archivos`
--
ALTER TABLE `archivos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcategoria_id` (`subcategoria_id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_cat_sub` (`categoria_id`,`nombre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `archivos`
--
ALTER TABLE `archivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=352;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `archivos`
--
ALTER TABLE `archivos`
  ADD CONSTRAINT `archivos_ibfk_1` FOREIGN KEY (`subcategoria_id`) REFERENCES `subcategorias` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  ADD CONSTRAINT `subcategorias_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
