<?php $this->layout('layout', ['title' => 'Entrega 3 BBDD - Buscar vuelos', 'description' => "Este es un proyecto de BBDD (IIC2413) que demuestra la capacidad de procesar datos, cargarlos a una base de datos, generar consultas complejas y mostrarlas en una página web."]) ?>

<style>
    body {
        text-align: center;
    }

    /* Center all non-submit input and selects, along with their labels */
    input,
    select {
        display: block;
        margin-left: auto;
        margin-right: auto;
        margin-bottom: 20px;
    }
</style>

<h1>🔍 Buscar vuelos</h1>
<div class="user-info">
    <div><b>Iniciado sesión como:</b></div>
    <div class="user-name">👤 <?= $passenger->nombre ?></div>
    <div class="reserver-passport">🛂 <?= $passenger->pasaporte ?></div>
    <br />
    <button class="logout-button" type="button" onclick="window.location.href = 'logout.php'">🔐 Cerrar Sesión</button>
    <button class="button-centered" onclick="window.location.href='pasajero.php'">
        📄 Volver a mis reservas
    </button>
</div>

<!-- If $error is not null, display the search error -->

<?php if ($error != null) : ?>
    <p>
        <b>Error al buscar:</b> <?= $error ?>
    </p>
<?php endif; ?>
<!-- Search flights by origin city, destination city and departure date -->
<form action="buscar_vuelo.php" method="post">
    <label for="origin-city">Ciudad de origen:</label>
    <select name="origin-city" id="origin-city" required>
        <!-- Auto-filled -->
    </select>
    <label for="destination-city">Ciudad de destino:</label>
    <select name="destination-city" id="destination-city" required>
        <!-- Auto-filled -->
    </select>
    <label for="departure-date">Fecha de salida:</label>
    <input type="date" name="departure-date" id="departure-date" value="2022-06-25" required>
    <input type="submit" value="🔍 Buscar vuelos">
</form>

<?php if (!is_null($results)) : ?>
    <br />
    <hr />
    <h2>Resultados</h2>
<?php endif ?>

<!-- If $results is not null, display the results in a table -->
<?php if (!is_null($results) && !empty($results)) : ?>
    <table>
        <thead>
            <tr>
                <th>Aeropuerto de origen</th>
                <th>Fecha de salida</th>
                <th>Aeropuerto de destino</th>
                <th>Fecha de llegada</th>
                <th>Precio</th>
                <th>Modelo</th>
                <th>Reservar</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($results as $result) : ?>
                <!-- Debug: print result -->
                <?php // var_dump($result)
                ?>
                <tr>
                    <td><?= $result['aeropuerto_origen'] ?></td>
                    <!-- Format as localized datetime -->
                    <td><?= date('d/m/Y H:i', strtotime($result['fecha_salida'])) ?></td>
                    <td><?= $result['aeropuerto_destino'] ?></td>
                    <!-- Format as localized datetime -->
                    <td><?= date('d/m/Y H:i', strtotime($result['fecha_llegada'])) ?></td>
                    <!-- Format as Chilean pesos (CLP) -->
                    <td>$<?= number_format($result['monto'], 0, ',', '.') ?></td>
                    <!-- Plane model -->
                    <td><?= $result['modelo'] ?></td>
                    <td>
                        <button>
                            <a href="crear_reserva.php?id=<?= $result['id'] ?>">Reservar</a>
                        </button>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
<?php endif; ?>

<!-- If there are no results, show a message -->
<?php if (!is_null($results) && empty($results)) : ?>
    <p>No se encontraron vuelos.</p>
<?php endif; ?>

<script>
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

    // Load origin and destination cities from API
    function loadCities() {
        fetch('queries/ciudades.php')
            .then(response => response.json())
            .then(cities => {
                let origin_cities = cleanDataFromPHP(cities['origin_cities']);
                let destination_cities = cleanDataFromPHP(cities['destination_cities']);

                let origin_city_select = document.getElementById('origin-city');
                let destination_city_select = document.getElementById('destination-city');

                origin_cities.forEach(city => {
                    let option = document.createElement('option');
                    option.value = city["nombre_ciudad"] + ", " + city["nombre_pais"];
                    option.innerText = city['nombre_ciudad'] + ", " + city['nombre_pais'];
                    if (city['nombre_ciudad'] == 'Ibiza') {
                        option.selected = true;
                    }
                    origin_city_select.appendChild(option);
                });

                destination_cities.forEach(city => {
                    let option = document.createElement('option');
                    option.value = city["nombre_ciudad"] + ", " + city["nombre_pais"];
                    option.innerText = city['nombre_ciudad'] + ", " + city['nombre_pais'];
                    if (city['nombre_ciudad'] == 'Hong Kong') {
                        option.selected = true;
                    }
                    destination_city_select.appendChild(option);
                });
            });
    }
    loadCities();
</script>