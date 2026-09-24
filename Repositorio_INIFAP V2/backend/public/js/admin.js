// admin.js - Formulario para subir publicaciones nuevas (JavaScript puro)

const formulario = document.getElementById('formularioPublicacion');
const selectArea = document.getElementById('id_area');
const selectFormato = document.getElementById('id_formato');
const cajaError = document.getElementById('mensajeError');
const cajaResultado = document.getElementById('resultado');
const botonGuardar = document.getElementById('botonGuardar');

function llenarSelect(select, elementos) {
    elementos.forEach((elemento) => {
        const opcion = document.createElement('option');
        opcion.value = elemento.id;
        opcion.textContent = elemento.nombre;
        select.appendChild(opcion);
    });
}

function mostrarError(texto) {
    cajaError.textContent = texto;
    cajaError.classList.remove('oculto');
    cajaError.scrollIntoView({ behavior: 'smooth', block: 'center' });
}

// 1. Cargar áreas y formatos al abrir la página
document.addEventListener('DOMContentLoaded', async () => {
    try {
        const [areas, formatos] = await Promise.all([
            fetch('/api/areas').then((r) => r.json()),
            fetch('/api/formatos').then((r) => r.json())
        ]);
        llenarSelect(selectArea, areas);
        llenarSelect(selectFormato, formatos);
    } catch (error) {
        mostrarError('No se pudieron cargar las áreas y formatos. ¿Está encendido el servidor?');
    }
});

// 2. Enviar el formulario al servidor
formulario.addEventListener('submit', async (evento) => {
    evento.preventDefault();
    cajaError.classList.add('oculto');
    cajaResultado.classList.add('oculto');
    botonGuardar.disabled = true;
    botonGuardar.textContent = 'Guardando...';

    try {
        const respuesta = await fetch('/api/publicaciones', {
            method: 'POST',
            body: new FormData(formulario)
        });
        const datos = await respuesta.json();

        if (!respuesta.ok) {
            mostrarError(datos.error || 'No se pudo guardar la publicación');
            return;
        }

        document.getElementById('imagenQr').src = datos.qr;
        document.getElementById('botonDescargarQr').href = datos.qr;

        const figuraPortada = document.getElementById('figuraPortada');
        if (datos.portada) {
            document.getElementById('imagenPortada').src = datos.portada + '?t=' + Date.now();
            figuraPortada.classList.remove('oculto');
        } else {
            figuraPortada.classList.add('oculto');
        }

        cajaResultado.classList.remove('oculto');
        cajaResultado.scrollIntoView({ behavior: 'smooth', block: 'start' });

        // Se limpia el formulario pero se conservan la clave, el área y el formato
        const clave = document.getElementById('clave').value;
        const area = selectArea.value;
        const formato = selectFormato.value;
        formulario.reset();
        document.getElementById('clave').value = clave;
        selectArea.value = area;
        selectFormato.value = formato;
    } catch (error) {
        console.error(error);
        mostrarError('Ocurrió un error al enviar los datos. Revisa la conexión con el servidor.');
    } finally {
        botonGuardar.disabled = false;
        botonGuardar.textContent = 'Guardar y generar QR';
    }
});
