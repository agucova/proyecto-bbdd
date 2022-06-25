<?php $this->layout('layout', ['title' => 'Entrega 3 BBDD - Grupo 27 y 44', 'description' => "Este es un proyecto de BBDD (IIC2413) que demuestra la capacidad de procesar datos, cargarlos a una base de datos, generar consultas complejas y mostrarlas en una página web."]) ?>

<style>
    body {
        max-width: 1400px;
    }
</style>

<h1>Panel de Control Administrador DGAC</h1>

<h2>Propuestas de vuelo pendientes</h2>

<!-- Inputs para filtrar por fecha -->
<details>
    <summary>Filtrar por fecha</summary>
    <form id="filter-dates">
        <label for="start_date">Fecha inicio:</label>
        <input type="date" name="fecha_inicio" id="fecha_inicio">
        <label for="end_date">Fecha fin:</label>
        <input type="date" name="fecha_fin" id="fecha_fin">
        <input type="submit" value="Filtrar">
    </form>
</details>

<style>
#filter-dates {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
}
</style>

<table id="requests-table">
    <thead>
        <tr>
            <th>ID</th>
            <th>Estado</th>
            <th>Código</th>
            <th>Fecha Salida</th>
            <th>Fecha Llegada</th>
            <th>Aerodromo Salida</th>
            <th>Aerodromo Llegada</th>
            <th>Fecha Envío Propuesta</th>
            <th>Compañía Aérea</th>
            <th>Aeronave</th>
            <th>Aprobar</th>
            <th>Rechazar</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($proposals as $proposal) : ?>
            <tr>
                <td><?= $proposal["propuesta_vuelo_id"] ?></td>
                <td><?= $proposal["estado"] ?></td>
                <td><?= $proposal["codigo"] ?></td>
                <td><?= $proposal["fecha_salida"] ?></td>
                <td><?= $proposal["fecha_llegada"] ?></td>
                <td><?= $proposal["Aerodromo.aerodromo_salida_id"] ?></td>
                <td><?= $proposal["Aerodromo.aerodromo_llegada_id"] ?></td>
                <td><?= $proposal["fecha_envio_propuesta"] ?></td>
                <td><?= $proposal["Compania_Aerea.id_compania"] ?></td>
                <td><?= $proposal["Aeronave.id_aeronave"] ?></td>

                <!-- button with post method to accept or decline proposal --->
                <td>
                    <?php
                    $codigo = $proposal["codigo"];
                    echo "<a href=\"aceptar_propuesta.php?codigo={$codigo}\"> ✅ </a>"
                    ?>
                </td>
                <td>
                    <?php
                    $codigo = $proposal["codigo"];
                    echo "<a href=\"rechazar_propuesta.php?codigo={$codigo}\"> ❌ </a>"
                    ?>
                </td>
            </tr>
        <?php endforeach ?>
    </tbody>
</table>

<script>
    // Capture form submit event
    document.getElementById('filter-dates').addEventListener('submit', function(event) {
        // Stop form from submitting
        event.preventDefault();

        // Get form data
        let formData = new FormData(event.target);

        // Get start and end date
        let startDate = formData.get('fecha_inicio');
        let endDate = formData.get('fecha_fin');

        // Parse dates
        startDate = new Date(startDate);
        endDate = new Date(endDate);

        // Filter table by whether the flight operates between the start and end date
        let table = document.getElementById('requests-table');
        let rows = table.getElementsByTagName('tr');
        for (let i = 1; i < rows.length; i++) {
            // Skip first row (header)
            if (i == 0) {
                continue;
            }

            let row = rows[i];

            // Get departure and arrival date
            let departureDate = new Date(row.getElementsByTagName('td')[3].innerHTML);
            let arrivalDate = new Date(row.getElementsByTagName('td')[4].innerHTML);

            // Check if flight operates between start and end date
            if (departureDate <= endDate && arrivalDate >= startDate) {
                // Overlaps
                row.style.display = '';
            } else {
                // Doesn't overlap
                row.style.display = 'none';
            }
        }
    });
</script>