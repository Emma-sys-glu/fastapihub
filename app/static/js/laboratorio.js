const API_URL = "/api/personas";

document.addEventListener("DOMContentLoaded", () => {
    cargarPersonas();
});

function mostrarMensaje(texto, tipo = "success") {
    const mensaje = document.getElementById("mensaje");

    mensaje.innerHTML = `
        <div class="alert alert-${tipo} alert-dismissible fade show" role="alert">
            ${texto}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    `;
}

function actualizarEndpoint(texto, clase = "endpoint-post") {
    const endpoint = document.getElementById("endpointActual");

    endpoint.className = clase;
    endpoint.innerText = texto;
}

function validarFormulario(persona) {
    if (!persona.nombre || !persona.apellido || !persona.edad || !persona.correo || !persona.ciudad) {
        mostrarMensaje("Todos los campos son obligatorios.", "danger");
        return false;
    }

    if (persona.edad <= 0) {
        mostrarMensaje("La edad debe ser mayor a 0.", "danger");
        return false;
    }

    if (!persona.correo.includes("@")) {
        mostrarMensaje("El correo no parece válido.", "danger");
        return false;
    }

    return true;
}

async function cargarPersonas() {
    const respuesta = await fetch(API_URL);
    const personas = await respuesta.json();

    const tabla = document.getElementById("tablaPersonas");
    tabla.innerHTML = "";

    personas.forEach(persona => {
        tabla.innerHTML += `
            <tr>
                <td>${persona.id}</td>
                <td>${persona.nombre} ${persona.apellido}</td>
                <td>${persona.edad}</td>
                <td>${persona.correo}</td>
                <td>${persona.ciudad}</td>
                <td>
                    <span class="endpoint-put">
                        PUT /api/personas/${persona.id}
                    </span>

                    <button class="btn btn-edit btn-sm ms-1" onclick='editarPersona(${JSON.stringify(persona)})'>
                        Editar
                    </button>

                    <span class="endpoint-delete ms-2">
                        DELETE /api/personas/${persona.id}
                    </span>

                    <button class="btn btn-delete btn-sm ms-1" onclick="eliminarPersona(${persona.id})">
                        Eliminar
                    </button>
                </td>
            </tr>
        `;
    });
}

async function guardarPersona() {
    const id = document.getElementById("personaId").value;

    const persona = {
        nombre: document.getElementById("nombre").value.trim(),
        apellido: document.getElementById("apellido").value.trim(),
        edad: parseInt(document.getElementById("edad").value),
        correo: document.getElementById("correo").value.trim(),
        ciudad: document.getElementById("ciudad").value.trim()
    };

    if (!validarFormulario(persona)) return;

    const metodo = id ? "PUT" : "POST";
    const url = id ? `${API_URL}/${id}` : API_URL;

    await fetch(url, {
        method: metodo,
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(persona)
    });

    mostrarMensaje(
        id ? "Persona actualizada correctamente." : "Persona registrada correctamente.",
        "success"
    );

    limpiarFormulario();
    cargarPersonas();
}

function editarPersona(persona) {
    document.getElementById("personaId").value = persona.id;
    document.getElementById("nombre").value = persona.nombre;
    document.getElementById("apellido").value = persona.apellido;
    document.getElementById("edad").value = persona.edad;
    document.getElementById("correo").value = persona.correo;
    document.getElementById("ciudad").value = persona.ciudad;

    actualizarEndpoint(
        `PUT /api/personas/${persona.id}`,
        "endpoint-put"
    );
}

async function eliminarPersona(id) {
    const confirmar = confirm("¿Seguro que deseas eliminar esta persona?");

    if (!confirmar) return;

    await fetch(`${API_URL}/${id}`, {
        method: "DELETE"
    });

    mostrarMensaje("Persona eliminada correctamente.", "warning");
    cargarPersonas();
}

function limpiarFormulario() {
    document.getElementById("personaId").value = "";
    document.getElementById("nombre").value = "";
    document.getElementById("apellido").value = "";
    document.getElementById("edad").value = "";
    document.getElementById("correo").value = "";
    document.getElementById("ciudad").value = "";

    actualizarEndpoint(
        "POST /api/personas",
        "endpoint-post"
    );
}