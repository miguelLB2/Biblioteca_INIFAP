// app.js - Servidor del Repositorio de Publicaciones INIFAP
const express = require('express');
const cors = require('cors');
const multer = require('multer');
const qrcode = require('qrcode');
const path = require('path');
const fs = require('fs');

const pool = require('./db');
const { generarPortada } = require('./portadas');

const app = express();
const puerto = process.env.PORT || 3000;

// Clave sencilla para el panel de administración (cámbiala antes de publicar el sitio)
const CLAVE_ADMIN = process.env.CLAVE_ADMIN || 'inifap2026';

const CARPETA_UPLOADS = path.join(__dirname, 'uploads');
const CARPETA_NUEVOS = path.join(CARPETA_UPLOADS, 'nuevos');
fs.mkdirSync(CARPETA_NUEVOS, { recursive: true });

// ---------------------------------------------------------------------
// Configuración básica
// ---------------------------------------------------------------------
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Página web (HTML/CSS/JS), portadas y PDFs
app.use(express.static(path.join(__dirname, 'public')));
app.use('/uploads', express.static(CARPETA_UPLOADS));

// Multer: guarda los PDFs nuevos que se suben desde admin.html
const almacenamiento = multer.diskStorage({
    destination: (req, file, cb) => cb(null, CARPETA_NUEVOS),
    // Nombre seguro (los acentos y espacios de los nombres originales dan problemas)
    filename: (req, file, cb) => cb(null, Date.now() + '.pdf')
});
const subirPdf = multer({
    storage: almacenamiento,
    limits: { fileSize: 100 * 1024 * 1024 }, // 100 MB
    fileFilter: (req, file, cb) => {
        cb(null, file.mimetype === 'application/pdf');
    }
});

// ---------------------------------------------------------------------
// Funciones de apoyo
// ---------------------------------------------------------------------

// '/uploads/FOLLETOS/Agrícola/mi archivo.pdf' con cada parte codificada para URL
function urlDelPdf(pdfRuta) {
    return '/uploads/' + pdfRuta.split('/').map(encodeURIComponent).join('/');
}

// Convierte una fila de la BD en el objeto que recibe la página
function armarPublicacion(fila) {
    return {
        id: fila.id,
        titulo: fila.titulo,
        anio: fila.anio,
        area: fila.area,
        formato: fila.formato,
        portada: fila.portada,
        ver: urlDelPdf(fila.pdf_ruta),
        descargar: '/descargar/' + fila.id
    };
}

// Evita que % y _ escritos por el visitante actúen como comodines de LIKE
function escaparLike(texto) {
    return texto.replace(/[\\%_]/g, '\\$&');
}

// ---------------------------------------------------------------------
// 1. Áreas de interés (con el total de publicaciones de cada una)
// ---------------------------------------------------------------------
app.get('/api/areas', async (req, res) => {
    try {
        const [filas] = await pool.query(`
            SELECT a.id, a.nombre, a.descripcion, a.imagen, COUNT(p.id) AS total
            FROM areas a
            LEFT JOIN publicaciones p ON p.id_area = a.id AND p.activo = 1
            GROUP BY a.id
            ORDER BY a.id
        `);
        res.json(filas);
    } catch (error) {
        console.error('Error al obtener áreas:', error);
        res.status(500).json({ error: 'Error al consultar la base de datos' });
    }
});

// ---------------------------------------------------------------------
// 2. Formatos (si viene ?area=ID, el total cuenta solo esa área)
// ---------------------------------------------------------------------
app.get('/api/formatos', async (req, res) => {
    try {
        const idArea = parseInt(req.query.area, 10);
        let condicionArea = '';
        const parametros = [];
        if (idArea) {
            condicionArea = 'AND p.id_area = ?';
            parametros.push(idArea);
        }
        const [filas] = await pool.query(`
            SELECT f.id, f.nombre, f.descripcion, COUNT(p.id) AS total
            FROM formatos f
            LEFT JOIN publicaciones p ON p.id_formato = f.id AND p.activo = 1 ${condicionArea}
            GROUP BY f.id
            ORDER BY f.id
        `, parametros);
        res.json(filas);
    } catch (error) {
        console.error('Error al obtener formatos:', error);
        res.status(500).json({ error: 'Error al consultar la base de datos' });
    }
});

// ---------------------------------------------------------------------
// 3. Publicaciones: /api/publicaciones?area=1&formato=2&q=frijol
//    Todos los filtros son opcionales.
// ---------------------------------------------------------------------
app.get('/api/publicaciones', async (req, res) => {
    try {
        const idArea = parseInt(req.query.area, 10);
        const idFormato = parseInt(req.query.formato, 10);
        const texto = (req.query.q || '').toString().trim().slice(0, 100);

        const condiciones = ['p.activo = 1'];
        const parametros = [];

        if (idArea) {
            condiciones.push('p.id_area = ?');
            parametros.push(idArea);
        }
        if (idFormato) {
            condiciones.push('p.id_formato = ?');
            parametros.push(idFormato);
        }
        // Cada palabra clave debe aparecer en el título (o ser el año)
        texto.split(/\s+/).filter(Boolean).forEach((palabra) => {
            condiciones.push('(p.titulo LIKE ? OR CAST(p.anio AS CHAR) = ?)');
            parametros.push('%' + escaparLike(palabra) + '%', palabra);
        });

        const [filas] = await pool.query(`
            SELECT p.id, p.titulo, p.anio, p.pdf_ruta, p.portada,
                   a.nombre AS area, f.nombre AS formato
            FROM publicaciones p
            JOIN areas a ON a.id = p.id_area
            JOIN formatos f ON f.id = p.id_formato
            WHERE ${condiciones.join(' AND ')}
            ORDER BY p.anio DESC, p.titulo ASC
        `, parametros);

        res.json(filas.map(armarPublicacion));
    } catch (error) {
        console.error('Error al obtener publicaciones:', error);
        res.status(500).json({ error: 'Error al consultar la base de datos' });
    }
});

// ---------------------------------------------------------------------
// 4. Descargar el PDF (fuerza la descarga con un nombre legible)
// ---------------------------------------------------------------------
app.get('/descargar/:id', async (req, res) => {
    try {
        const [filas] = await pool.query(
            'SELECT titulo, anio, pdf_ruta FROM publicaciones WHERE id = ? AND activo = 1',
            [req.params.id]
        );
        if (filas.length === 0) {
            return res.status(404).send('Publicación no encontrada');
        }

        const rutaAbsoluta = path.resolve(CARPETA_UPLOADS, filas[0].pdf_ruta);
        // Seguridad: el archivo debe estar dentro de la carpeta uploads
        if (!rutaAbsoluta.startsWith(CARPETA_UPLOADS + path.sep) || !fs.existsSync(rutaAbsoluta)) {
            return res.status(404).send('El archivo PDF no está en el servidor');
        }

        const nombreLimpio = filas[0].titulo.replace(/[\\/:*?"<>|]/g, '').slice(0, 120);
        const prefijoAnio = filas[0].anio ? filas[0].anio + ' ' : '';
        res.download(rutaAbsoluta, prefijoAnio + nombreLimpio + '.pdf');
    } catch (error) {
        console.error('Error al descargar:', error);
        res.status(500).send('Error en el servidor');
    }
});

// ---------------------------------------------------------------------
// 5. Subir una publicación nueva (panel admin.html) y generar su QR
// ---------------------------------------------------------------------
app.post('/api/publicaciones', subirPdf.single('archivoPdf'), async (req, res) => {
    try {
        const { titulo, anio, id_area, id_formato, clave } = req.body;

        if (clave !== CLAVE_ADMIN) {
            if (req.file) fs.unlink(req.file.path, () => {});
            return res.status(401).json({ error: 'Clave de administrador incorrecta' });
        }
        if (!req.file) {
            return res.status(400).json({ error: 'Debes subir un archivo PDF' });
        }
        if (!titulo || !id_area || !id_formato) {
            fs.unlink(req.file.path, () => {});
            return res.status(400).json({ error: 'Faltan datos: título, área y formato son obligatorios' });
        }

        const pdfRuta = 'nuevos/' + req.file.filename;

        // A. Guardar en la base de datos
        const [resultado] = await pool.query(
            'INSERT INTO publicaciones (titulo, anio, id_area, id_formato, pdf_ruta) VALUES (?, ?, ?, ?, ?)',
            [titulo.trim(), anio || null, id_area, id_formato, pdfRuta]
        );
        const idNuevo = resultado.insertId;

        // B. Portada = primera página del PDF
        const portada = await generarPortada(req.file.path, idNuevo);
        if (portada) {
            await pool.query('UPDATE publicaciones SET portada = ? WHERE id = ?', [portada, idNuevo]);
        }

        // C. Código QR que apunta al PDF.
        //    Para que funcione desde otros celulares define BASE_URL (ej. http://192.168.1.75:3000)
        const baseUrl = process.env.BASE_URL || (req.protocol + '://' + req.get('host'));
        const urlPdf = baseUrl + urlDelPdf(pdfRuta);
        const qr = await qrcode.toDataURL(urlPdf, {
            width: 400,
            margin: 2,
            color: { dark: '#611232', light: '#ffffff' } // guinda institucional
        });

        res.json({ mensaje: 'Publicación guardada correctamente', id: idNuevo, portada, ver: urlPdf, qr });
    } catch (error) {
        console.error('Error al guardar publicación:', error);
        res.status(500).json({ error: 'Error en el servidor al guardar la publicación' });
    }
});

// Errores de Multer (archivo muy grande, etc.)
app.use((error, req, res, next) => {
    if (error instanceof multer.MulterError) {
        return res.status(400).json({ error: 'Error al subir el archivo: ' + error.message });
    }
    next(error);
});

app.listen(puerto, () => {
    console.log('Repositorio INIFAP corriendo en http://localhost:' + puerto);
    console.log('Panel de administración:     http://localhost:' + puerto + '/admin.html');
});
