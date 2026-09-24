// portal.js - Lógica del portal público (JavaScript puro, sin librerías)
//
// Flujo: 1) Área de interés  ->  2) Formato  ->  3) Publicaciones (Ver / Descargar)
// La dirección de la página guarda en qué paso vas, por eso funciona el botón
// "Atrás" del navegador y se pueden compartir enlaces:
//     index.html                              -> elegir área
//     index.html#area=1                       -> elegir formato de esa área
//     index.html#area=1&formato=2             -> publicaciones
//     index.html#q=frijol                     -> búsqueda en todo el repositorio
//     index.html#area=1&formato=2&q=frijol    -> búsqueda dentro de esa lista

const vista = document.getElementById('vista');
const formBuscador = document.getElementById('formBuscador');
const campoBusqueda = document.getElementById('campoBusqueda');

const PUBLICACIONES_POR_PAGINA = 24;

// Catálogos que se piden una sola vez al servidor
let areas = [];
let formatosPorArea = {};   // { '0': [...todos], '1': [...con total del área 1] }

// ---------------------------------------------------------------------
// Utilidades
// ---------------------------------------------------------------------

// Evita que un título con < > & rompa el HTML
function esc(texto) {
    return String(texto ?? '')
        .replace(/&/g, '&amp;')
        .replace(/</g, '&lt;')
        .replace(/>/g, '&gt;')
        .replace(/"/g, '&quot;');
}

async function pedir(ruta) {
    const respuesta = await fetch(ruta);
    if (!respuesta.ok) throw new Error('Error ' + respuesta.status);
    return respuesta.json();
}

function textoTotal(n) {
    return n === 1 ? '1 publicación' : n + ' publicaciones';
}

function leerFiltros() {
    const p = new URLSearchParams(location.hash.slice(1));
    return {
        area: parseInt(p.get('area'), 10) || null,
        formato: parseInt(p.get('formato'), 10) || null,
        q: (p.get('q') || '').trim()
    };
}

function hashDe(filtros) {
    const p = new URLSearchParams();
    if (filtros.area) p.set('area', filtros.area);
    if (filtros.formato) p.set('formato', filtros.formato);
    if (filtros.q) p.set('q', filtros.q);
    const texto = p.toString();
    return texto ? '#' + texto : '#';
}

async function obtenerFormatos(idArea) {
    const clave = idArea || 0;
    if (!formatosPorArea[clave]) {
        formatosPorArea[clave] = await pedir('/api/formatos' + (idArea ? '?area=' + idArea : ''));
    }
    return formatosPorArea[clave];
}

// ---------------------------------------------------------------------
// Íconos de cada formato (SVG en línea, colores institucionales)
// ---------------------------------------------------------------------
const ICONOS_FORMATO = {
    'Desplegables': `
        <svg class="formato-icono" viewBox="0 0 120 120" fill="none" stroke="#611232" stroke-width="3" stroke-linejoin="round" aria-hidden="true">
            <path d="M8 40 L28 48 L28 98 L8 90Z" fill="#dcc6ce"/>
            <path d="M28 48 L48 40 L48 90 L28 98Z" fill="#f4eaed"/>
            <path d="M48 40 L68 48 L68 98 L48 90Z" fill="#dcc6ce"/>
            <path d="M68 48 L88 40 L88 90 L68 98Z" fill="#f4eaed"/>
            <path d="M88 40 L108 48 L108 98 L88 90Z" fill="#dcc6ce"/>
            <path d="M34 60 L42 57 M34 70 L42 67 M34 80 L42 77" stroke-linecap="round"/>
            <path d="M74 66 L82 69 M74 76 L82 79" stroke-linecap="round"/>
        </svg>`,
    'Folletos': `
        <svg class="formato-icono" viewBox="0 0 120 120" fill="none" stroke="#611232" stroke-width="3" stroke-linejoin="round" aria-hidden="true">
            <rect x="8" y="26" width="38" height="70" rx="3" fill="#f4eaed" transform="rotate(-8 27 61)"/>
            <rect x="74" y="26" width="38" height="70" rx="3" fill="#dcc6ce" transform="rotate(8 93 61)"/>
            <rect x="40" y="20" width="40" height="80" rx="3" fill="#ffffff"/>
            <rect x="40" y="70" width="40" height="30" rx="0" fill="#9b2247" stroke="none"/>
            <rect x="40" y="20" width="40" height="80" rx="3"/>
            <path d="M48 34 H72 M48 44 H72 M48 54 H64" stroke-linecap="round"/>
        </svg>`,
    'Libro técnico': `
        <svg class="formato-icono" viewBox="0 0 120 120" fill="none" stroke="#611232" stroke-width="3" stroke-linejoin="round" aria-hidden="true">
            <path d="M30 14 H92 A6 6 0 0 1 98 20 V96 A6 6 0 0 1 92 102 H30Z" fill="#f4eaed"/>
            <path d="M30 14 A12 12 0 0 0 18 26 V90 A12 12 0 0 0 30 102Z" fill="#9b2247"/>
            <path d="M22 96 H92 A6 6 0 0 0 98 90" />
            <rect x="46" y="28" width="38" height="24" rx="2" fill="#ffffff"/>
            <path d="M52 36 H78 M52 44 H70" stroke-linecap="round"/>
            <path d="M46 68 H84 M46 78 H84 M46 88 H70" stroke-linecap="round"/>
        </svg>`,
    'Publicaciones especiales': `
        <svg class="formato-icono" viewBox="0 0 120 120" fill="none" stroke="#611232" stroke-width="3" stroke-linejoin="round" aria-hidden="true">
            <rect x="34" y="20" width="62" height="82" rx="4" fill="#dcc6ce"/>
            <rect x="26" y="14" width="62" height="82" rx="4" fill="#f4eaed"/>
            <rect x="18" y="8" width="62" height="82" rx="4" fill="#ffffff"/>
            <path d="M28 24 H56 M28 34 H56" stroke-linecap="round"/>
            <path d="M49 46 L54.5 57.5 L67 59.2 L58 68 L60.2 80.4 L49 74.5 L37.8 80.4 L40 68 L31 59.2 L43.5 57.5Z" fill="#9b2247"/>
        </svg>`
};
const ICONO_FORMATO_GENERICO = ICONOS_FORMATO['Folletos'];

const ICONO_PDF = `
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
        <path d="M14 3H7a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V8z"/><path d="M14 3v5h5"/><path d="M9 13h6M9 17h4"/>
    </svg>`;
const ICONO_OJO = `
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
        <path d="M1.5 12S5.5 5 12 5s10.5 7 10.5 7-4 7-10.5 7S1.5 12 1.5 12z"/><circle cx="12" cy="12" r="3"/>
    </svg>`;
const ICONO_DESCARGA = `
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
        <path d="M12 3v12"/><path d="M7 11l5 5 5-5"/><path d="M4 20h16"/>
    </svg>`;

// ---------------------------------------------------------------------
// Ruta de navegación (migas de pan)
// ---------------------------------------------------------------------
function dibujarRuta(pasos) {
    // pasos: [{ texto, hash }]  (el último no lleva hash)
    const partes = pasos.map((paso) =>
        paso.hash !== undefined
            ? `<a href="${paso.hash}">${esc(paso.texto)}</a>`
            : `<span class="actual" aria-current="page">${esc(paso.texto)}</span>`
    );
    return `<nav class="ruta" aria-label="Ruta de navegación">${partes.join('<span class="separador" aria-hidden="true">›</span>')}</nav>`;
}

// ---------------------------------------------------------------------
// PASO 1: elegir área de interés
// ---------------------------------------------------------------------
function dibujarAreas() {
    const tarjetas = areas.map((area) => `
        <a class="tarjeta-area" href="#area=${area.id}">
            <span class="area-foto" style="--foto: url('${esc(area.imagen || '')}')">
                <span class="area-nombre">${esc(area.nombre)}</span>
            </span>
            <span class="area-descripcion">${esc(area.descripcion)}</span>
            <span class="area-total">${textoTotal(area.total)}</span>
        </a>`).join('');

    vista.innerHTML = `
        <h2 class="titulo-seccion" tabindex="-1">Selecciona área de interés</h2>
        <p class="subtitulo-seccion">Elige el tema para ver los formatos disponibles.</p>
        <div class="rejilla-areas">${tarjetas}</div>`;
}

// ---------------------------------------------------------------------
// PASO 2: elegir formato
// ---------------------------------------------------------------------
async function dibujarFormatos(area) {
    const formatos = await obtenerFormatos(area.id);

    const tarjetas = formatos.map((formato) => `
        <a class="tarjeta-formato ${formato.total === 0 ? 'vacia' : ''}" href="#area=${area.id}&formato=${formato.id}">
            <h3>${esc(formato.nombre)}</h3>
            ${ICONOS_FORMATO[formato.nombre] || ICONO_FORMATO_GENERICO}
            <p>${esc(formato.descripcion)}</p>
            <span class="formato-total">${textoTotal(formato.total)}</span>
        </a>`).join('');

    vista.innerHTML = `
        ${dibujarRuta([{ texto: 'Inicio', hash: '#' }, { texto: area.nombre }])}
        <h2 class="titulo-seccion" tabindex="-1">Selecciona el tipo de formato que busca</h2>
        <p class="subtitulo-seccion">Área: <strong>${esc(area.nombre)}</strong></p>
        <div class="rejilla-formatos">${tarjetas}</div>`;
}

// ---------------------------------------------------------------------
// PASO 3: publicaciones (portada, título, Ver y Descargar)
// ---------------------------------------------------------------------
function tarjetaPublicacion(pub, mostrarOrigen) {
    const anio = pub.anio ? String(pub.anio) : 'Sin año';
    const meta = mostrarOrigen ? `${anio} – ${pub.area}, ${pub.formato}` : anio;

    const imagenPortada = pub.portada
        ? `<img src="${esc(pub.portada)}" alt="Portada de ${esc(pub.titulo)}" loading="lazy"
                onerror="this.parentNode.innerHTML = portadaVacia('${esc(pub.anio || '')}')">`
        : portadaVacia(pub.anio);

    return `
        <article class="tarjeta-publicacion">
            <a class="portada" href="${esc(pub.ver)}" target="_blank" rel="noopener" tabindex="-1" aria-hidden="true">
                ${imagenPortada}
            </a>
            <div class="publicacion-cuerpo">
                <h3 class="publicacion-titulo" title="${esc(pub.titulo)}">${esc(pub.titulo)}</h3>
                <p class="publicacion-meta">${esc(meta)}</p>
                <div class="publicacion-acciones">
                    <a class="boton" href="${esc(pub.ver)}" target="_blank" rel="noopener"
                       aria-label="Ver ${esc(pub.titulo)}">${ICONO_OJO} Ver</a>
                    <a class="boton boton-borde" href="${esc(pub.descargar)}"
                       aria-label="Descargar ${esc(pub.titulo)}">${ICONO_DESCARGA} Descargar</a>
                </div>
            </div>
        </article>`;
}

// Se usa también desde el atributo onerror de la imagen
function portadaVacia(anio) {
    return `<div class="portada-vacia">${ICONO_PDF}<strong>${esc(anio || 'PDF')}</strong></div>`;
}

async function dibujarResultados(filtros, area, formato) {
    vista.innerHTML = '<p class="mensaje-estado">Cargando publicaciones...</p>';

    const parametros = new URLSearchParams();
    if (filtros.area) parametros.set('area', filtros.area);
    if (filtros.formato) parametros.set('formato', filtros.formato);
    if (filtros.q) parametros.set('q', filtros.q);
    const publicaciones = await pedir('/api/publicaciones?' + parametros.toString());

    // Migas de pan
    const pasos = [{ texto: 'Inicio', hash: '#' }];
    if (area) {
        const hashArea = hashDe({ area: area.id });
        if (formato || filtros.q) pasos.push({ texto: area.nombre, hash: hashArea });
        else pasos.push({ texto: area.nombre });
    }
    if (formato) {
        if (filtros.q) pasos.push({ texto: formato.nombre, hash: hashDe({ area: filtros.area, formato: filtros.formato }) });
        else pasos.push({ texto: formato.nombre });
    }
    if (filtros.q) pasos.push({ texto: 'Búsqueda: ' + filtros.q });

    // Título
    let titulo;
    if (formato && area) titulo = formato.nombre + ' de ' + area.nombre.toLowerCase();
    else if (area) titulo = 'Publicaciones de ' + area.nombre.toLowerCase();
    else titulo = 'Resultados de la búsqueda';

    const mostrarOrigen = !(area && formato);
    let cuerpo;

    if (publicaciones.length === 0) {
        const volver = area ? hashDe({ area: area.id }) : '#';
        cuerpo = `
            <div class="mensaje-estado">
                <strong>No hay publicaciones con estos criterios</strong>
                Prueba con otra palabra clave o cambia de formato.
                <br><a class="boton" href="${volver}">Volver a elegir</a>
            </div>`;
        vista.innerHTML = `
            ${dibujarRuta(pasos)}
            <h2 class="titulo-seccion" tabindex="-1">${esc(titulo)}</h2>
            ${cuerpo}`;
        return;
    }

    vista.innerHTML = `
        ${dibujarRuta(pasos)}
        <h2 class="titulo-seccion" tabindex="-1">${esc(titulo)}</h2>
        <p class="subtitulo-seccion">${textoTotal(publicaciones.length)}</p>
        <div class="rejilla-publicaciones" id="rejillaPublicaciones"></div>
        <div id="zonaMostrarMas"></div>`;

    const rejilla = document.getElementById('rejillaPublicaciones');
    const zonaMas = document.getElementById('zonaMostrarMas');
    let mostradas = 0;

    function mostrarMas() {
        const siguientes = publicaciones.slice(mostradas, mostradas + PUBLICACIONES_POR_PAGINA);
        rejilla.insertAdjacentHTML('beforeend', siguientes.map((p) => tarjetaPublicacion(p, mostrarOrigen)).join(''));
        mostradas += siguientes.length;

        if (mostradas < publicaciones.length) {
            zonaMas.innerHTML = `<button type="button" class="boton boton-borde mostrar-mas">
                Mostrar más (${publicaciones.length - mostradas} restantes)</button>`;
            zonaMas.querySelector('button').addEventListener('click', mostrarMas);
        } else {
            zonaMas.innerHTML = '';
        }
    }
    mostrarMas();
}

// ---------------------------------------------------------------------
// Decide qué paso dibujar según la dirección (#...)
// ---------------------------------------------------------------------
async function mostrarPagina() {
    const filtros = leerFiltros();
    const area = areas.find((a) => a.id === filtros.area) || null;
    if (filtros.area && !area) filtros.area = null;

    let formato = null;
    if (filtros.formato) {
        const formatos = await obtenerFormatos(0);
        formato = formatos.find((f) => f.id === filtros.formato) || null;
        if (!formato) filtros.formato = null;
    }

    // Buscador: refleja lo que se está buscando y en qué contexto
    campoBusqueda.value = filtros.q;
    if (area && formato) campoBusqueda.placeholder = 'Buscar en esta lista...';
    else if (area) campoBusqueda.placeholder = 'Buscar en ' + area.nombre + '...';
    else campoBusqueda.placeholder = 'Buscador (ingresa palabras clave...)';

    try {
        if (!filtros.q && !area) {
            dibujarAreas();
        } else if (!filtros.q && area && !formato) {
            await dibujarFormatos(area);
        } else {
            await dibujarResultados(filtros, area, formato);
        }
    } catch (error) {
        console.error(error);
        vista.innerHTML = `
            <div class="mensaje-estado">
                <strong>No se pudo cargar la información</strong>
                Revisa que el servidor esté encendido y vuelve a intentarlo.
                <br><a class="boton" href="#" onclick="location.reload()">Reintentar</a>
            </div>`;
        return;
    }

    // Llevar al inicio de la lista y dar foco al título (útil para lectores de pantalla)
    const titulo = vista.querySelector('.titulo-seccion');
    if (titulo) titulo.focus({ preventScroll: true });
    window.scrollTo({ top: 0 });
}

// El buscador respeta el área/formato en que estás
formBuscador.addEventListener('submit', (evento) => {
    evento.preventDefault();
    const filtros = leerFiltros();
    filtros.q = campoBusqueda.value.trim();
    location.hash = hashDe(filtros);
});

window.addEventListener('hashchange', mostrarPagina);

// Inicio
(async function iniciar() {
    try {
        areas = await pedir('/api/areas');
    } catch (error) {
        console.error(error);
        vista.innerHTML = `
            <div class="mensaje-estado">
                <strong>No se pudo conectar con el servidor</strong>
                Enciende el servidor (node app.js) y recarga la página.
            </div>`;
        return;
    }
    mostrarPagina();
})();
