-- =====================================================================
--  Repositorio de Publicaciones - INIFAP Campo Experimental Valle del
--  Guadiana, Durango
--  Base de datos: repositorio_inifap   (MySQL / MariaDB)
--
--  Cómo usarlo:
--    * phpMyAdmin: pestaña "Importar" -> elegir este archivo -> Continuar
--    * Terminal:   mysql -u root -p < repositorio_inifap.sql
--
--  Sustituye a la base "gestor_inifap" anterior (que solo era un
--  inventario de archivos). Aquí cada PDF queda clasificado por
--  ÁREA (Agrícola, Pecuario, Forestal) y por FORMATO (Folletos, etc.)
-- =====================================================================
SET NAMES utf8mb4;

-- 1. Crear y seleccionar la nueva base de datos
CREATE DATABASE IF NOT EXISTS repositorio_inifap
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE repositorio_inifap;

-- 2. Limpieza previa de tablas (en orden inverso a las llaves foráneas)
DROP TABLE IF EXISTS publicaciones;
DROP TABLE IF EXISTS formatos;
DROP TABLE IF EXISTS areas;

-- 3. Crear tabla de Áreas
CREATE TABLE areas (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  nombre      VARCHAR(50)  NOT NULL UNIQUE,
  descripcion VARCHAR(200) NOT NULL,
  imagen      VARCHAR(200) NULL
) ENGINE=InnoDB;

-- 4. Crear tabla de Formatos
CREATE TABLE formatos (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  nombre      VARCHAR(50)  NOT NULL UNIQUE,
  descripcion VARCHAR(200) NOT NULL
) ENGINE=InnoDB;

-- 5. Crear tabla de Publicaciones
CREATE TABLE publicaciones (
  id              INT AUTO_INCREMENT PRIMARY KEY,
  titulo          VARCHAR(500) NOT NULL,
  anio            SMALLINT     NULL,
  id_area         INT          NOT NULL,
  id_formato      INT          NOT NULL,
  pdf_ruta        VARCHAR(600) NOT NULL UNIQUE,
  portada         VARCHAR(200) NULL,
  activo          TINYINT(1)   NOT NULL DEFAULT 1,
  fecha_registro  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_pub_area    FOREIGN KEY (id_area)    REFERENCES areas(id),
  CONSTRAINT fk_pub_formato FOREIGN KEY (id_formato) REFERENCES formatos(id),
  INDEX idx_area_formato (id_area, id_formato)
) ENGINE=InnoDB;

-- 6. Insertar catálogos iniciales
INSERT INTO areas (id, nombre, descripcion, imagen) VALUES
  (1, 'Agrícola', 'Técnicas de cultivo, variedades y manejo de parcelas.', 'img/area-agricola.jpg'),
  (2, 'Pecuario', 'Ganado bovino, praderas, forrajes y acuacultura.', 'img/area-pecuario.jpg'),
  (3, 'Forestal', 'Bosques, viveros y manejo forestal de la Sierra Madre Occidental.', 'img/area-forestal.jpg');

INSERT INTO formatos (id, nombre, descripcion) VALUES
  (1, 'Desplegables', 'Documentos con formatos interactivos o plegables especiales.'),
  (2, 'Folletos', 'Guías impresas y material informativo general.'),
  (3, 'Libro técnico', 'Textos técnicos detallados y manuales de referencia.'),
  (4, 'Publicaciones especiales', 'Ediciones exclusivas y reportes de investigación específicos.');

-- 7. MIGRACIÓN AUTOMÁTICA DE DATOS DESDE gestor_inifap.archivos
INSERT IGNORE INTO repositorio_inifap.publicaciones (
    titulo,
    anio,
    id_area,
    id_formato,
    pdf_ruta,
    fecha_registro
)
SELECT 
    -- Título original del archivo
    A.nombre_archivo AS titulo,
    
    -- Extrae los primeros 4 dígitos del nombre si empieza por un año (ej. 1998, 2022)
    IF(A.nombre_archivo REGEXP '^[0-9]{4}', CAST(LEFT(A.nombre_archivo, 4) AS UNSIGNED), NULL) AS anio,
    
    -- Detección automática del Área según la ruta completa del archivo
    CASE 
        WHEN A.ruta_completa LIKE '%Agricola%' OR A.ruta_completa LIKE '%Agrícola%' THEN 1
        WHEN A.ruta_completa LIKE '%Pecuario%' THEN 2
        WHEN A.ruta_completa LIKE '%Forestal%' THEN 3
        ELSE 3 -- Asignación por defecto si no se detecta área en la ruta
    END AS id_area,
    
    -- Detección automática del Formato según la ruta completa del archivo
    CASE 
        WHEN A.ruta_completa LIKE '%DESPLEGABLES%' THEN 1
        WHEN A.ruta_completa LIKE '%LIBRO TÉCNICO%' OR A.ruta_completa LIKE '%LIBRO TECNICO%' THEN 3
        WHEN A.ruta_completa LIKE '%PUBLICACIONES ESPECIALES%' THEN 4
        ELSE 2 -- Asignación por defecto a 'Folletos'
    END AS id_formato,
    
    -- Ruta original del archivo
    A.ruta_completa AS pdf_ruta,
    
    -- Conserva la fecha de registro original
    A.fecha_registro
FROM gestor_inifap.archivos A
WHERE A.extension IN ('pdf', 'crdownload');