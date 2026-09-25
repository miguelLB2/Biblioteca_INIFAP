// db.js - Conexión a MySQL (se comparte entre app.js e importar_pdfs.js)
const mysql = require('mysql2/promise');

const pool = mysql.createPool({
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASSWORD || "12345",
    database: process.env.DB_NAME || 'repositorio_inifap', // Apunta a la nueva base de datos
    charset: 'utf8mb4',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

module.exports = pool;