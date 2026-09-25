# Repositorio de Publicaciones – INIFAP Campo Experimental Valle del Guadiana, Durango

Página web donde el visitante elige **área de interés → formato** y ve las publicaciones en PDF
(portada + título) con los botones **Ver** y **Descargar**. Incluye buscador por palabras clave y un
panel de administración para subir PDFs nuevos y generar su código QR.

**Stack (nivel TSU, el mismo del análisis):** MySQL · Node.js + Express (JavaScript puro) · HTML + CSS + JavaScript.
Sin TypeScript, sin Prisma, sin frameworks: consultas SQL directas con `mysql2`.

---

## Dónde va cada cosa

```text
Repositorio_INIFAP/
├── BD/
│   └── repositorio_inifap.sql     ← Base de datos (áreas, formatos, publicaciones)
│
└── backend/
    ├── app.js                     ← Servidor Express y todas las rutas /api
    ├── db.js                      ← Conexión a MySQL (usuario/contraseña aquí)
    ├── portadas.js                ← Saca la portada (1a página) de cada PDF
    ├── importar_pdfs.js           ← Registra en la BD todos los PDFs de la carpeta uploads/
    ├── package.json
    │
    ├── uploads/                   ← AQUÍ VAN LOS PDFs (ver "Cómo cargar los PDFs")
    │
    └── public/                    ← Lo que ve el navegador
        ├── index.html             ← Portal público (buscador, áreas, formatos, resultados)
        ├── admin.html             ← Panel para subir publicaciones nuevas
        ├── estilos.css            ← Colores y diseño (los colores están en :root)
        ├── js/
        │   ├── portal.js          ← Lógica del portal
        │   └── admin.js           ← Lógica del panel
        ├── img/
        │   ├── logo-inifap.png    ← LOGO OFICIAL INIFAP  (reemplazar)
        │   ├── logo-durango.png   ← LOGO GOBIERNO DE DURANGO (reemplazar)
        │   ├── area-agricola.jpg  ← Foto de la tarjeta Agrícola  (agregar)
        │   ├── area-pecuario.jpg  ← Foto de la tarjeta Pecuario  (agregar)
        │   └── area-forestal.jpg  ← Foto de la tarjeta Forestal  (agregar)
        └── portadas/              ← Se llena solo (imágenes generadas de los PDFs)
```

### Logos y fotos
* Los dos logos que trae el proyecto son **marcadores de posición**. Reemplaza `logo-inifap.png` y
  `logo-durango.png` por los archivos oficiales **con el mismo nombre** (si son .svg o .jpg, cambia el
  nombre en `index.html` y `admin.html`, en las líneas `<img class="logo ...">`).
* Mientras no existan las fotos de las áreas, las tarjetas se ven con un fondo guinda. Para usarlas, copia
  las 3 fotos a `public/img/` con los nombres de arriba (recomendado 800×600 px, horizontales).

---

## Puesta en marcha

1. **Base de datos:** en phpMyAdmin → *Importar* → `BD/repositorio_inifap.sql`
   (o `mysql -u root -p < BD/repositorio_inifap.sql`).
2. **Contraseña de MySQL:** si tu MySQL tiene contraseña, escríbela en `backend/db.js`.
3. **Dependencias:** dentro de `backend/` ejecuta `npm install`.
4. **Poppler** (para las portadas): `sudo apt install poppler-utils` (Linux).
   En Windows: descargar Poppler y agregar su carpeta `bin` al PATH.
5. **Cargar los PDFs** (siguiente sección) y ejecutar `node importar_pdfs.js`.
6. **Encender:** `node app.js` y abrir <http://localhost:3000>. Panel: <http://localhost:3000/admin.html>

## Cómo cargar los PDFs

Copia tu carpeta actual `INIFAP/FOLLETOS` **completa** dentro de `backend/uploads/`. Debe quedar así:

```text
backend/uploads/FOLLETOS/FOLLETOS/Agricola/2022 Fitopatógenos ....pdf
backend/uploads/FOLLETOS/DESPLEGABLES/Forestal/....pdf
backend/uploads/FOLLETOS/LIBRO TÉCNICO/Agrícola/....pdf
backend/uploads/FOLLETOS/PUBLICACIONES ESPECIALES/Pecuario/....pdf
```

`importar_pdfs.js` lee los nombres de las carpetas para saber el **formato** (FOLLETOS, DESPLEGABLES,
LIBRO TÉCNICO, PUBLICACIONES ESPECIALES) y el **área** (Agrícola, Pecuario, Forestal). Además:

* Toma el **año** del inicio del nombre del archivo y limpia el título (quita el año, "- copia", "(2)" y
  la etiqueta "Folleto técnico 124"; si venía TODO EN MAYÚSCULAS lo pasa a minúsculas).
* **Omite** lo que no es PDF (`.crdownload`, `.zip`, `.git`), los duplicados ("- copia") y los archivos
  que no estén dentro de una carpeta de área y formato (por ejemplo `SIN ISBN`). Te lo lista al final.
* Se puede ejecutar de nuevo cuando agregues PDFs: los que ya estaban no se duplican.
* Si algún título quedó mal escrito, corrígelo en phpMyAdmin (tabla `publicaciones`, columna `titulo`).

## Panel de administración

`admin.html` pide título, área, formato, año, PDF y una **clave**. La clave por defecto es `inifap2026`;
cámbiala en `app.js` (constante `CLAVE_ADMIN`) o con la variable de entorno `CLAVE_ADMIN`.
Al guardar genera la portada y un **QR** descargable. Para que el QR funcione desde otros celulares,
inicia el servidor con la dirección real: `BASE_URL=http://192.168.1.75:3000 node app.js`.

## Rutas del servidor (para explicar en la presentación)

| Ruta | Qué hace |
|---|---|
| `GET /api/areas` | Áreas con su total de publicaciones |
| `GET /api/formatos?area=1` | Formatos con su total (dentro del área elegida) |
| `GET /api/publicaciones?area=1&formato=2&q=frijol` | Lista filtrada (todos los filtros son opcionales) |
| `GET /descargar/:id` | Descarga el PDF con un nombre legible |
| `POST /api/publicaciones` | Sube una publicación nueva (panel admin) |
