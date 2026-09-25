// importar_desde_gestor.js
// -----------------------------------------------------------------------
// Conecta la BD vieja (gestor_inifap, la que trae el inventario real de
// 351 archivos) con la BD nueva que ya usa la página (repositorio_inifap).
// La migración que traía BD/repositorio_inifap.sql copiaba los datos "en
// crudo" (título = nombre del archivo, ruta = ruta absoluta del PC viejo),
// así que los títulos salían feos y los links a los PDF no iban a servir.
// Este script hace lo mismo que importar_pdfs.js (limpia el título, quita
// el año, detecta ÁREA y FORMATO) pero leyendo desde gestor_inifap en vez
// de leer archivos del disco.
//
// USO:
//   1) Importa las dos bases:  mysql -u root -p < "BD/repositorio_inifap.sql"
//                               mysql -u root -p < "BD sin conectar (importante)/gestor_inifap.sql"
//   2) node importar_desde_gestor.js
// -----------------------------------------------------------------------

const mysql = require('mysql2/promise');
const pool = require('./db'); // ya apunta a repositorio_inifap

// Quita acentos y pasa a mayúsculas, para comparar nombres sin pelear con la ortografía
function normalizar(texto) {
    return texto.normalize('NFD').replace(/[\u0300-\u036f]/g, '').toUpperCase().trim();
}

// Palabras/siglas para el título "Tipo Oración" cuando el nombre venía TODO EN MAYÚSCULAS
const NOMBRES_PROPIOS = ['durango', 'méxico', 'mexico', 'guadiana', 'santiago', 'papasquiaro', 'dimas', 'cruces',
    'poanas', 'canatlán', 'canatlan', 'guanaceví', 'guanacevi', 'indé', 'inde', 'nayar', 'pinus', 'sierra',
    'madre', 'occidental', 'valle', 'lázaro', 'lazaro', 'cárdenas', 'cardenas', 'cevamex', 'saltillo', 'karma',
    'yoda', 'reineke', 'norte', 'centro'];
const SIGLAS = ['inifap', 'umafor', 'sicremars', 'sifor', 'dgo', 'promaf', 'cevag', 'ggavat', 'spef', 'spis',
    'iso', 'une', 'en', 'ddr', 'masagro', 'pid', 'nod', 'fm', 'sab'];
const PALABRAS_MENORES = ['de', 'del', 'la', 'las', 'el', 'los', 'en', 'y', 'e', 'o', 'u', 'a', 'al', 'con', 'por',
    'para', 'un', 'una', 'sin', 'sobre', 'bajo', 'como', 'que', 'su', 'sus'];

function mayusculaInicial(p) { return p.charAt(0).toUpperCase() + p.slice(1); }

function pasarATipoOracion(titulo) {
    return titulo.split(' ').map((palabra, i) => {
        const minuscula = palabra.toLowerCase();
        const soloLetras = normalizar(minuscula).replace(/[^A-Z0-9]/g, '').toLowerCase();
        if (/\d/.test(palabra)) return palabra;
        if (SIGLAS.includes(soloLetras) && !PALABRAS_MENORES.includes(soloLetras)) return palabra.toUpperCase();
        if (NOMBRES_PROPIOS.includes(soloLetras)) return mayusculaInicial(minuscula);
        return i === 0 ? mayusculaInicial(minuscula) : minuscula;
    }).join(' ');
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
        .replace(/\s*-\s*copia\s*$/i, '')
        .replace(/\s*\(\d\)\s*$/, '')
        .replace(/\s+/g, ' ')
        .replace(/[.\s]+$/, '')
        .trim();
    // quita "Folleto técnico 124", "Desplegable ... 23", etc. al final del título
    const sinSerie = titulo.replace(
        /[\s.]+(?:folleto|desplegable|libro|publicaci[oó]n)(?:\s+(?:t[eé]cnic[oa]|cient[ií]fic(?:io|o|a)|para productores|informativ[oa]|especial))?\s*\d+\s*$/i, '');
    if (sinSerie.length >= 15) titulo = sinSerie.replace(/[.\s]+$/, '');
    const letras = titulo.replace(/[^A-Za-zÁÉÍÓÚÜÑáéíóúüñ]/g, '');
    const mayusculas = letras.replace(/[^A-ZÁÉÍÓÚÜÑ]/g, '');
    titulo = (letras.length > 0 && mayusculas.length / letras.length > 0.5)
        ? pasarATipoOracion(titulo)
        : mayusculaInicial(titulo);
    return { anio, titulo };
}

// subcategoria_id (tabla `subcategorias` de gestor_inifap) -> nombre del FORMATO
const FORMATO_POR_SUBCAT = { 13: 'Desplegables', 2: 'Folletos', 10: 'Libro técnico', 6: 'Publicaciones especiales' };

async function main() {
    // Conexión aparte solo para LEER la base vieja (gestor_inifap)
    const gestor = await mysql.createConnection({
        host: process.env.DB_HOST || 'localhost',
        user: process.env.DB_USER || 'root',
        password: process.env.DB_PASSWORD || '',
        database: process.env.DB_GESTOR || 'gestor_inifap',
        charset: 'utf8mb4'
    });

    const [areas] = await pool.query('SELECT id, nombre FROM areas');
    const idAreaPorNombre = {};
    areas.forEach((a) => { idAreaPorNombre[normalizar(a.nombre)] = a.id; });

    const [formatos] = await pool.query('SELECT id, nombre FROM formatos');
    const idFormatoPorNombre = {};
    formatos.forEach((f) => { idFormatoPorNombre[normalizar(f.nombre)] = f.id; });

    const [archivos] = await gestor.query('SELECT id, subcategoria_id, nombre_archivo, ruta_completa, extension FROM archivos');
    await gestor.end();

    let nuevos = 0, existentes = 0;
    const vistos = new Set();
    const omitidos = [];

    for (const r of archivos) {
        if ((r.extension || '').toLowerCase() !== 'pdf') { omitidos.push(r.nombre_archivo + ' (no es pdf)'); continue; }
        if (/SIN ISBN/i.test(r.ruta_completa)) { omitidos.push(r.nombre_archivo + ' (sin ISBN/sin clasificar)'); continue; }

        const nombreFormato = FORMATO_POR_SUBCAT[r.subcategoria_id];
        const idFormato = nombreFormato ? idFormatoPorNombre[normalizar(nombreFormato)] : null;
        if (!idFormato) { omitidos.push(r.nombre_archivo + ' (carpeta/subcategoría no reconocida)'); continue; }

        let idArea = null;
        if (/Agricola|Agr[ií]cola/i.test(r.ruta_completa)) idArea = idAreaPorNombre['AGRICOLA'];
        else if (/Pecuario/i.test(r.ruta_completa)) idArea = idAreaPorNombre['PECUARIO'];
        else if (/Forestal/i.test(r.ruta_completa)) idArea = idAreaPorNombre['FORESTAL'];
        if (!idArea) { omitidos.push(r.nombre_archivo + ' (no se detectó área)'); continue; }

        const { anio, titulo } = limpiarNombre(r.nombre_archivo);

        // ruta relativa a partir de "FOLLETOS/...", para que calce con backend/uploads/FOLLETOS/...
        const idx = r.ruta_completa.indexOf('/FOLLETOS/');
        const pdfRuta = idx >= 0 ? r.ruta_completa.slice(idx + 1) : r.nombre_archivo;

        const clave = [idArea, idFormato, anio, normalizar(titulo).replace(/[^A-Z0-9]/g, '')].join('|');
        if (vistos.has(clave)) { omitidos.push(r.nombre_archivo + ' (repetido)'); continue; }
        vistos.add(clave);

        const [existente] = await pool.query('SELECT id FROM publicaciones WHERE pdf_ruta = ?', [pdfRuta]);
        if (existente.length > 0) { existentes++; continue; }

        await pool.query(
            'INSERT INTO publicaciones (titulo, anio, id_area, id_formato, pdf_ruta) VALUES (?, ?, ?, ?, ?)',
            [titulo, anio, idArea, idFormato, pdfRuta]
        );
        nuevos++;
    }

    console.log('===== RESUMEN =====');
    console.log('Publicaciones nuevas registradas: ' + nuevos);
    console.log('Ya existían:                      ' + existentes);
    console.log('Omitidas:                         ' + omitidos.length);
    if (omitidos.length) console.log(omitidos.map((o) => '  - ' + o).join('\n'));
    console.log('\nRecuerda: falta copiar los PDF reales a backend/uploads/ con esa misma ruta,');
    console.log('y luego correr "node importar_pdfs.js" para generar las portadas.');

    await pool.end();
}

main().catch((e) => { console.error('Error:', e.message); process.exit(1); });
