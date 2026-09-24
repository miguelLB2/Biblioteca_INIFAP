const express = require('express');
const cors = require('cors');
const multer = require('multer');
const qrcode = require('qrcode');
const mysql = require('mysql2/promise');
const path = require('path');

const app = express();
const port = 3000;

// Configuración básica de Express
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Servir archivos estáticos (HTML/CSS y PDFs subidos)
app.use(express.static(path.join(__dirname, 'public')));
app.use('/uploads', express.static(path.join(__dirname, 'uploads')));

// Configuración de Multer para guardar los PDFs
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'uploads/');
    },
    filename: (req, file, cb) => {
        const uniqueName = Date.now() + '-' + file.originalname;
        cb(null, uniqueName);
    }
});
const upload = multer({ storage: storage });

// Conexión a la base de datos MySQL (Configura tus credenciales aquí)
const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '', // Cambia esto por tu contraseña de XAMPP/MySQL
    database: 'inifap_db',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

// 1. RUTA: Obtener todos los folletos para mostrarlos en la App Móvil
app.get('/api/folletos', async (req, res) => {
    try {
        const [rows] = await pool.query(`
            SELECT f.*, c.nombre as categoria_nombre 
            FROM folletos f
            LEFT JOIN categorias c ON f.id_categoria = c.id
            WHERE f.activo = 1
        `);
        res.json(rows);
    } catch (error) {
        console.error("Error al obtener folletos:", error);
        res.status(500).json({ error: 'Error al consultar la base de datos' });
    }
});

// 2. RUTA: Obtener las categorías (Para el formulario HTML)
app.get('/api/categorias', async (req, res) => {
    try {
        const [rows] = await pool.query('SELECT * FROM categorias');
        res.json(rows);
    } catch (error) {
        res.status(500).json({ error: 'Error al obtener categorías' });
    }
});

// 3. RUTA: Subir un nuevo folleto desde el Panel de Administración Web
app.post('/api/folletos', upload.single('archivoPdf'), async (req, res) => {
    try {
        const { titulo, descripcion, autor, anio, id_categoria } = req.body;
        
        if (!req.file) {
            return res.status(400).json({ error: 'Debes subir un archivo PDF' });
        }

        const pdfUrl = '/uploads/' + req.file.filename;

        // A. Insertar el folleto en la base de datos
        const [result] = await pool.query(
            'INSERT INTO folletos (titulo, descripcion, autor, anio_publicacion, pdf_url, id_categoria) VALUES (?, ?, ?, ?, ?, ?)',
            [titulo, descripcion, autor, anio, pdfUrl, id_categoria]
        );

        const idNuevoFolleto = result.insertId;

        // B. Generar el Código QR
        // En un proyecto real, IP_SERVIDOR debería ser tu IP pública o dominio
        const urlParaElQr = `http://localhost:3000${pdfUrl}`; 
        
        const qrBase64 = await qrcode.toDataURL(urlParaElQr, {
            color: { dark: '#004d40', light: '#ffffff' } // Verde INIFAP
        });

        // C. Actualizar el registro con el QR
        await pool.query('UPDATE folletos SET qr_url = ? WHERE id = ?', [qrBase64, idNuevoFolleto]);

        res.json({ 
            mensaje: 'Folleto guardado correctamente', 
            id: idNuevoFolleto,
            qr: qrBase64 
        });

    } catch (error) {
        console.error("Error al guardar folleto:", error);
        res.status(500).json({ error: 'Error en el servidor al guardar el folleto' });
    }
});

app.listen(port, () => {
    console.log(`Servidor Node.js corriendo en http://localhost:${port}`);
});
