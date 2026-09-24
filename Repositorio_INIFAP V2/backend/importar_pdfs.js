// importar_pdfs.js
// Recorre la carpeta backend/uploads/, registra cada PDF en la base de datos
// y genera su portada. Se puede ejecutar las veces que quieras: los PDFs que
// ya estaban registrados no se duplican.
//
// USO:   node importar_pdfs.js
//
// CÓMO DETECTA ÁREA Y FORMATO: por los nombres de las carpetas, igual que
// tu carpeta actual INIFAP/FOLLETOS:
//     uploads/FOLLETOS/FOLLETOS/Agricola/2022 Fitopatógenos....pdf
//             └ formato ┘        └ área ┘
// Formatos reconocidos: FOLLETOS, DESPLEGABLES, LIBRO TÉCNICO, PUBLICACIONES ESPECIALES
// Áreas reconocidas:    Agrícola, Pecuario, Forestal

const fs = require('fs');
const path = require('path');
const pool = require('./db');
const { generarPortada, CARPETA_PORTADAS } = require('./portadas');

const CARPETA_UPLOADS = path.join(__dirname, 'uploads');

// Quita acentos y pasa a mayúsculas para comparar nombres de carpetas
function normalizar(texto) {
    return texto.normalize('NFD').replace(/[\u0300-\u036f]/g, '').toUpperCase().trim();
}

// Lista todos los .pdf dentro de una carpeta (ignora carpetas ocultas como .git o .fr-XXXX)
function buscarPdfs(carpeta) {
    let resultado = [];
    for (const elemento of fs.readdirSync(carpeta, { withFileTypes: true })) {
        if (elemento.name.startsWith('.')) continue;
        const ruta = path.join(carpeta, elemento.name);
        if (elemento.isDirectory()) {
            resultado = resultado.concat(buscarPdfs(ruta));
        } else if (elemento.name.toLowerCase().endsWith('.pdf')) {
            resultado.push(ruta);
        }
    }
    return resultado;
}

// Palabras que se escriben con mayúscula inicial o completa cuando un título viene TODO EN MAYÚSCULAS.
// Agrega aquí las que veas mal escritas en el sitio (en minúsculas y sin acento no importa).
const NOMBRES_PROPIOS = ['durango', 'méxico', 'mexico', 'guadiana', 'santiago', 'papasquiaro', 'dimas', 'cruces',
    'poanas', 'canatlán', 'canatlan', 'guanaceví', 'guanacevi', 'indé', 'inde', 'nayar', 'pinus', 'sierra',
    'madre', 'occidental', 'valle', 'lázaro', 'lazaro', 'cárdenas', 'cardenas', 'cevamex', 'saltillo', 'karma',
    'yoda', 'reineke', 'norte', 'centro'];
const SIGLAS = ['inifap', 'umafor', 'sicremars', 'sifor', 'dgo', 'promaf', 'cevag', 'ggavat', 'spef', 'spis',
    'iso', 'une', 'en', 'ddr', 'masagro', 'pid', 'nod', 'fm', 'sab'];
const PALABRAS_MENORES = ['de', 'del', 'la', 'las', 'el', 'los', 'en', 'y', 'e', 'o', 'u', 'a', 'al', 'con', 'por',
    'para', 'un', 'una', 'sin', 'sobre', 'bajo', 'como', 'que', 'su', 'sus'];

function mayusculaInicial(palabra) {
    return palabra.charAt(0).toUpperCase() + palabra.slice(1);
}

// Pasa "PRODUCCIÓN DE PLANTA DE PINUS EN DURANGO" a "Producción de planta de Pinus en Durango"
function pasarATipoOracion(titulo) {
    const palabras = titulo.split(' ').map((palabra, i) => {
        const minuscula = palabra.toLowerCase();
        const soloLetras = normalizar(minuscula).replace(/[^A-Z0-9]/g, '').toLowerCase();
        if (/\d/.test(palabra)) return palabra;                       // H-376, 2000, etc.
        if (SIGLAS.includes(soloLetras) && !PALABRAS_MENORES.includes(soloLetras)) return palabra.toUpperCase();
        if (NOMBRES_PROPIOS.includes(soloLetras)) return mayusculaInicial(minuscula);
        return i === 0 ? mayusculaInicial(minuscula) : minuscula;
    });
    return palabras.join(' ');
}

// "2018 PRODUCCIÓN DE HUEVO CON GALLINAS.pdf" -> { anio: 2018, titulo: "Producción de huevo con gallinas" }
function limpiarNombre(nombreArchivo) {
    let titulo = nombreArchivo.replace(/\.pdf$/i, '');

    let anio = null;
    const coincidencia = titulo.match(/^\s*((?:19|20)\d{2})\s*/);
    if (coincidencia) {
        anio = parseInt(coincidencia[1], 10);
        titulo = titulo.slice(coincidencia[0].length);
    }

    titulo = titulo
        .replace(/\s*-\s*copia\s*$/i, '')   // " - copia"
        .replace(/\s*\(\d\)\s*$/, '')        // " (2)"
        .replace(/\s+/g, ' ')
        .replace(/[.\s]+$/, '')              // puntos finales
        .trim();

    // Quita la etiqueta de serie al final: "Folleto técnico 124", "Desplegable para productores 23", etc.
    // (el formato ya se elige en el sitio, así que el título queda más limpio)
    const sinSerie = titulo.replace(
        /[\s.]+(?:folleto|desplegable|libro|publicaci[oó]n)(?:\s+(?:t[eé]cnic[oa]|cient[ií]fic(?:io|o|a)|para productores|informativ[oa]|especial))?\s*\d+\s*$/i, '');
    if (sinSerie.length >= 15) titulo = sinSerie.replace(/[.\s]+$/, '');

    // Si el título viene todo en MAYÚSCULAS lo pasamos a "Tipo oración"
    const letras = titulo.replace(/[^A-Za-zÁÉÍÓÚÜÑáéíóúüñ]/g, '');
    const mayusculas = letras.replace(/[^A-ZÁÉÍÓÚÜÑ]/g, '');
    if (letras.length > 0 && mayusculas.length / letras.length > 0.5) {
        titulo = pasarATipoOracion(titulo);
    } else {
        titulo = mayusculaInicial(titulo);
    }

    return { anio, titulo };
}

async function main() {
    // 1. Catálogos de la base de datos
    const [areas] = await pool.query('SELECT id, nombre FROM areas');
    const [formatos] = await pool.query('SELECT id, nombre FROM formatos');
    const idAreaPorNombre = {};
    areas.forEach((a) => { idAreaPorNombre[normalizar(a.nombre)] = a.id; });
    const idFormatoPorNombre = {};
    formatos.forEach((f) => { idFormatoPorNombre[normalizar(f.nombre)] = f.id; });

    // 2. Buscar PDFs. Los que dicen "copia" quedan al final para preferir el original.
    const archivos = buscarPdfs(CARPETA_UPLOADS).sort((a, b) => {
        const copiaA = /copia/i.test(a) ? 1 : 0;
        const copiaB = /copia/i.test(b) ? 1 : 0;
        return copiaA - copiaB || a.length - b.length || a.localeCompare(b);
    });
    console.log('PDFs encontrados en uploads/: ' + archivos.length);

    // 3. Clasificar cada PDF por las carpetas donde está
    const yaVistos = new Set();
    const sinClasificar = [];
    const repetidos = [];
    const paraProcesar = [];

    for (const rutaAbsoluta of archivos) {
        const relativa = path.relative(CARPETA_UPLOADS, rutaAbsoluta).split(path.sep);
        const nombreArchivo = relativa[relativa.length - 1];
        const carpetas = relativa.slice(0, -1).map(normalizar);

        // Se toma la carpeta más cercana al archivo que coincida
        let idArea = null;
        let idFormato = null;
        for (let i = carpetas.length - 1; i >= 0; i--) {
            if (idArea === null && idAreaPorNombre[carpetas[i]]) idArea = idAreaPorNombre[carpetas[i]];
            if (idFormato === null && idFormatoPorNombre[carpetas[i]]) idFormato = idFormatoPorNombre[carpetas[i]];
        }
        if (!idArea || !idFormato) {
            sinClasificar.push(relativa.join('/'));
            continue;
        }

        const { anio, titulo } = limpiarNombre(nombreArchivo);

        // Misma publicación repetida (original + "copia", etc.)
        const clave = [idArea, idFormato, anio, normalizar(titulo).replace(/[^A-Z0-9]/g, '')].join('|');
        if (yaVistos.has(clave)) {
            repetidos.push(relativa.join('/'));
            continue;
        }
        yaVistos.add(clave);

        paraProcesar.push({ rutaAbsoluta, pdfRuta: relativa.join('/'), titulo, anio, idArea, idFormato });
    }

    // 4. Guardar en la base de datos y generar portadas
    let nuevos = 0;
    let portadasNuevas = 0;
    let sinPortada = 0;

    for (let i = 0; i < paraProcesar.length; i++) {
        const p = paraProcesar[i];
        let idPublicacion;
        let portadaActual = null;

        const [existente] = await pool.query('SELECT id, portada FROM publicaciones WHERE pdf_ruta = ?', [p.pdfRuta]);
        if (existente.length > 0) {
            idPublicacion = existente[0].id;
            portadaActual = existente[0].portada;
        } else {
            const [resultado] = await pool.query(
                'INSERT INTO publicaciones (titulo, anio, id_area, id_formato, pdf_ruta) VALUES (?, ?, ?, ?, ?)',
                [p.titulo, p.anio, p.idArea, p.idFormato, p.pdfRuta]
            );
            idPublicacion = resultado.insertId;
            nuevos++;
        }

        // Generar portada si falta (o si se borró el archivo .jpg)
        const existeJpg = portadaActual && fs.existsSync(path.join(CARPETA_PORTADAS, idPublicacion + '.jpg'));
        if (!existeJpg) {
            const portada = await generarPortada(p.rutaAbsoluta, idPublicacion);
            if (portada) {
                await pool.query('UPDATE publicaciones SET portada = ? WHERE id = ?', [portada, idPublicacion]);
                portadasNuevas++;
            } else {
                sinPortada++;
            }
        }

        if ((i + 1) % 25 === 0 || i + 1 === paraProcesar.length) {
            console.log('  procesados ' + (i + 1) + ' de ' + paraProcesar.length + '...');
        }
    }

    // 5. Resumen
    console.log('\n===== RESUMEN =====');
    console.log('Publicaciones nuevas registradas: ' + nuevos);
    console.log('Portadas generadas:               ' + portadasNuevas);
    if (sinPortada > 0) {
        console.log('Sin portada:                      ' + sinPortada + '  (¿está instalado pdftoppm / poppler?)');
    }
    console.log('Repetidos omitidos:               ' + repetidos.length);
    if (sinClasificar.length > 0) {
        console.log('\nOmitidos por no tener carpeta de ÁREA y FORMATO (' + sinClasificar.length + '):');
        sinClasificar.forEach((r) => console.log('  - ' + r));
    }

    await pool.end();
}

main().catch((error) => {
    console.error('Error al importar:', error.message);
    process.exit(1);
});
