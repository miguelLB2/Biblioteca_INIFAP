// portadas.js - Genera la imagen de portada (1a página del PDF) con pdftoppm.
// pdftoppm viene en el paquete "poppler":
//   Linux:   sudo apt install poppler-utils
//   Windows: descargar poppler y agregar su carpeta "bin" al PATH
const { execFile } = require('child_process');
const path = require('path');
const fs = require('fs');

const CARPETA_PORTADAS = path.join(__dirname, 'public', 'portadas');

// Devuelve '/portadas/<id>.jpg' o null si no se pudo generar
function generarPortada(rutaPdf, idPublicacion) {
    return new Promise((resolve) => {
        const salidaSinExtension = path.join(CARPETA_PORTADAS, String(idPublicacion));
        const argumentos = [
            '-jpeg', '-jpegopt', 'quality=82',
            '-f', '1', '-l', '1',            // solo la primera página
            '-scale-to-x', '480', '-scale-to-y', '-1',
            '-singlefile',
            rutaPdf, salidaSinExtension
        ];
        execFile('pdftoppm', argumentos, { timeout: 60000 }, (error) => {
            if (error || !fs.existsSync(salidaSinExtension + '.jpg')) {
                resolve(null);
            } else {
                resolve('/portadas/' + idPublicacion + '.jpg');
            }
        });
    });
}

module.exports = { generarPortada, CARPETA_PORTADAS };
