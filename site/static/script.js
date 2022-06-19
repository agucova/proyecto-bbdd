function cleanDataFromPHP(data) {
    // Delete all integer keys from each object in the array
    return data.map(row => {
        return Object.keys(row).reduce((obj, key) => {
            if (isNaN(key)) {
                obj[key] = row[key];
            }
            return obj;
        }, {});
    });
}

function arrayToTable(data) {
    const keys = [...data.reduce((all, obj) => {
        Object.keys(obj).forEach(key => all.add(key));
        return all;
    }, new Set())];

    const header = keys.map(key => `<th>${key}</th>`).join('')
    const tbody = data.map(row => keys.map(key => `<td>${row[key]}</td>`).join('')).map(row => `<tr>${row}</tr>`).join('')

    const table = `<details open><summary>Resultados de la consulta</summary>
        <table>
            <thead><tr>${header}</tr></thead>
            <tbody>${tbody}</body>
        </table>
        </details>`;


    return table;
}

function presentTable(data) {
    // If there are not results
    if (data.length === 0) {
        return `<p>No se encontraron resultados para esta búsqueda.</p>`;
    }

    return arrayToTable(data);
}

function cleanPendientes(data) {
    // Parse data
    data = cleanDataFromPHP(data);
    return data.map(row => {
        return {
            "Código": row.codigo,
            "Fecha de salida": new Date(row.fecha_salida).toLocaleDateString('es-CL'),
            "Fecha de llegada": new Date(row.fecha_llegada).toLocaleDateString('es-CL'),
            "Velocidad (kts)": row.velocidad,
            "Altitud (m)": row.altitud
        };
    });
}


function consultaVuelosPendientes(event) {
    const url = 'queries/vuelos-pendientes.php';
    fetch(url)
        .then(response => response.json())
        .then(data => {
            document.getElementById('vuelos-pendientes').innerHTML = presentTable(cleanPendientes(data));
        })
        .catch(error => console.error(error));
}

function cleanVuelosAceptados(data) {
    // Parse data
    data = cleanDataFromPHP(data);
    return data.map(row => {
        return {
            "ICAO": row.icao,
            "Código": row.codigo,
            "Estado": row.estado,
            "Fecha de Salida": new Date(row.fecha_salida).toLocaleDateString('es-CL'),
            "Fecha de Llegada": new Date(row.fecha_llegada).toLocaleDateString('es-CL'),
            "Velocidad (kts)": row.velocidad,
            "Altitud (m)": row.altitud
        };
    });
}

function consultaVuelosAceptados(event) {
    event.preventDefault();

    // Get id_aerolinea and icao from form
    const id_aerolinea = document.getElementById('id_aerolinea').value;
    console.debug(`id_aerolinea: ${id_aerolinea}`);
    const icao = document.getElementById('icao').value;

    const url = 'queries/vuelos-aceptados.php';
    // This time we need to POST the ICAO code and id_aerolinea to the PHP Server
    fetch(url, {
        method: 'POST',
        body: JSON.stringify({
            icao: icao,
            id_aerolinea: id_aerolinea
        })
    })
        .then(response => response.json())
        .then(data => {
            document.getElementById('vuelos-aceptados').innerHTML = presentTable(cleanVuelosAceptados(data));
        });
}

function cleanTickets(data) {
    // Parse data
    data = cleanDataFromPHP(data);
    return data.map(row => {
        return {
            "Reserva": row.codigo_reserva,
            "Pasajero": row.nombre_pasajero,
            "Asiento": row.asiento,
            "Clase": row.clase,
            "Comida y Maleta": row.comida_y_maleta,
            "Monto (CLP)": row.monto,
            "Aero. Origen": row.aeropuerto_origen,
            "País Origen": row.pais_origen,
            "Aero. Destino": row.aeropuerto_destino,
            "País Destino": row.pais_destino,
        };
    });
}

function consultaTickets(event) {
    event.preventDefault();

    // Get reservation code
    const codigo_reserva = document.getElementById('codigo-reserva').value;

    const url = 'queries/tickets.php';
    // This time we need to POST the reservation code to the PHP Server
    fetch(url, {
        method: 'POST',
        body: JSON.stringify({
            codigo_reserva: codigo_reserva
        })
    })
        .then(response => response.json())
        .then(data => {
            document.getElementById('tickets').innerHTML = presentTable(cleanTickets(data));
        }
        );
}

function cleanClientesFrecuentes (data) {
    // Parse data
    data = cleanDataFromPHP(data);
    return data.map(row => {
        return {
            "Aerolínea": row.nombre_aerolinea,
            "Cliente": row.nombre_cliente,
            "Número de Tickets": row.n_tickets
        };
    });
}

function consultaClientesFrecuentes() {
    const url = 'queries/clientes-frecuentes.php';
    fetch(url)
        .then(response => response.json())
        .then(data => {
            document.getElementById('clientes-frecuentes').innerHTML = presentTable(cleanClientesFrecuentes(data));
        });
}
let capitalize = s => s.replace(/./, c => c.toUpperCase())

function cleanResumenVuelos(data) {
    // Parse data
    data = cleanDataFromPHP(data);
    return data.map(row => {
        return {
            "Estado de Vuelo": capitalize(row.estado_vuelo),
            "Vuelos": row.n_vuelos
        };
    });
}

function consultaResumenVuelos(event) {
    event.preventDefault();

    // Get airline
    const nombre_aerolinea = document.getElementById('nombre-aerolinea').value;

    const url = 'queries/resumen-vuelos.php';

    fetch(url, {
        method: 'POST',
        body: JSON.stringify({
            nombre_aerolinea: nombre_aerolinea
        })
    })
        .then(response => response.json())
        .then(data => {
            document.getElementById('resumen-vuelos').innerHTML = presentTable(cleanResumenVuelos(data));
        }
        );
}


function cleanAerolineaEstrella(data) {
    // Parse data
    data = cleanDataFromPHP(data);
    return data.map(row => {
        return {
            "Aerolínea": row.nombre_aerolinea,
            "Vuelos Aceptados": row.n_vuelos_aceptados,
            "Vuelos Totales": row.n_vuelos_totales,
            "Porcentaje de Aceptación": row.porcentaje_aceptados
        };
    });
}

function consultaAerolineaEstrella() {
    const url = 'queries/aerolinea-estrella.php';
    fetch(url)
        .then(response => response.json())
        .then(data => {
            document.getElementById('aerolinea-estrella').innerHTML = presentTable(cleanAerolineaEstrella(data));
        });
}

// Load select data
function populateAirlines() {
    const url = 'queries/aerolineas.php';
    fetch(url)
        .then(response => response.json())
        .then(data => {
            // Get all with the 'id_aerolinea' class
            const selects = document.getElementsByClassName('id_aerolinea');
            // For each select, add an option for each airline
            for (const select of selects) {
                data.forEach(airline => {
                    const option = document.createElement('option');
                    option.value = airline.id;
                    option.text = airline.nombre;
                    select.add(option);
                });
            }

        });
}

// Load select data
populateAirlines();

// Wire up button with queries
document.getElementById('boton-vuelos-pendientes').addEventListener('click', consultaVuelosPendientes);
document.getElementById('boton-clientes-frecuentes').addEventListener('click', consultaClientesFrecuentes);
document.getElementById('boton-aerolinea-estrella').addEventListener('click', consultaAerolineaEstrella);
// On form submit
document.getElementById('form-vuelos-aceptados').addEventListener('submit', consultaVuelosAceptados);
document.getElementById('form-tickets').addEventListener('submit', consultaTickets);
document.getElementById('form-resumen-vuelos').addEventListener('submit', consultaResumenVuelos);
