-- Base de datos para el INIFAP
CREATE DATABASE IF NOT EXISTS inifap_db;
USE inifap_db;

-- Tabla de Categorías (Áreas de investigación)
CREATE TABLE IF NOT EXISTS categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insertar algunas categorías de prueba
INSERT INTO categorias (nombre, descripcion) VALUES 
('Agrícola', 'Investigaciones relacionadas con cultivos'),
('Forestal', 'Investigaciones sobre bosques y madera'),
('Pecuaria', 'Investigaciones sobre ganado y animales');

-- Tabla de Folletos
CREATE TABLE IF NOT EXISTS folletos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descripcion TEXT,
    autor VARCHAR(150),
    anio_publicacion INT,
    pdf_url VARCHAR(255) NOT NULL,
    qr_url TEXT,
    id_categoria INT,
    activo BOOLEAN DEFAULT TRUE,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id) ON DELETE SET NULL
);

-- Tabla de Métricas (Para saber cuántas veces se escaneó un código)
CREATE TABLE IF NOT EXISTS metricas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_folleto INT NOT NULL,
    tipo_accion VARCHAR(50) NOT NULL, -- Ej: 'escaneo_qr', 'descarga', 'vista'
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_folleto) REFERENCES folletos(id) ON DELETE CASCADE
);
