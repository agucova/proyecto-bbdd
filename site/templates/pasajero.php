<?php $this->layout('layout', ['title' => 'Entrega 3 BBDD - Reservas', 'description' => "Este es un proyecto de BBDD (IIC2413) que demuestra la capacidad de procesar datos, cargarlos a una base de datos, generar consultas complejas y mostrarlas en una página web."]) ?>


<h1 class="reserves-title">Reservas</h1>
<div class="user-info">
    <div><b>Iniciado sesión como:</b></div>
    <div class="user-name">👤 <?= $passenger->nombre ?></div>
    <div class="reserver-passport">🛂 <?= $passenger->pasaporte ?></div>
    <br />
    <!-- Search for new flights button -->
    <button class="search-button" onclick="window.location.href='buscar_vuelo.php'">
        🔎 Buscar nuevo vuelo
    </button>
    <button class="logout-button" type="button" onclick="window.location.href = 'logout.php'">🔐 Cerrar Sesión</button>
    <button class="button-centered" onclick="window.location.href='index.php'">
        🏠 Volver al inicio
    </button>
</div>

</br>
<!-- Table of reservations -->
<table class="reservations-table">
    <thead>
        <tr>
            <th>Reserva</th>
            <th>Vuelo</th>
            <th>Fecha</th>
            <th>Ver reserva</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($reservations as $reservation) : ?>
            <tr>
                <td><?= $reservation["codigo"] ?></td>

                <td>
                    <?= $reservation["tickets"][0]["codigo_vuelo"] ?>
                </td>
                <td>
                    <time datetime="<?= $reservation["tickets"][0]["fecha_salida"] ?>" class="flight-date">⏰ Cargando fecha...</time>
                </td>
                <td class="see-reservation-button">
                    <!-- Button for seeing the reservation -->
                    <a href="reserva.php?id=<?= $reservation["id"] ?>">↗️</a>
                </td>
            </tr>
        <?php endforeach ?>
    </tbody>
</table>

<script>
    // Scan for <time> tags and populate them with localized datetime strings
    document.querySelectorAll('time').forEach(function(time_element) {
        let datetime = new Date(time_element.getAttribute('datetime'));

        let timezone = datetime.getTimezoneOffset() / 60;
        if (timezone < 0) {
            timezone = '+' + timezone;
        } else {
            timezone = '-' + timezone;
        }

        time_element.innerHTML = " ⏰ " + datetime.toLocaleString({
            hour12: false
        }) + " GMT" + timezone;
    });
</script>
