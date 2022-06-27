<?php $this->layout('layout', ['title' => 'Entrega 3 BBDD - Grupo 27 y 44', 'description' => "Este es un proyecto de BBDD (IIC2413) que demuestra la capacidad de procesar datos, cargarlos a una base de datos, generar consultas complejas y mostrarlas en una página web."]) ?>

<h1>Panel de Control de Aerolínea</h1>
<div class="user-info">
    <div><b>Iniciado sesión como:</b></div>
    <div class="user-name">👤 <?= $airline["nombre"] ?></div>
    <br />
    <button class="logout-button" type="button" onclick="window.location.href = 'logout.php'">🔐 Cerrar Sesión</button>
    <button class="button-centered" onclick="window.location.href='index.php'">
        🏠 Volver al inicio
    </button>
</div>

<h2>Vuelos aprobados ✅</h2>
<?php if (count($approved) == 0) : ?>
    <p>No hay vuelos aprobados</p>
<?php else : ?>
<table>
    <thead>
        <tr>
            <th>Código</th>
            <th>Fecha Salida</th>
            <th>Fecha Llegada</th>
            <th>Velocidad (km/h)</th>
            <th>Altitud (m)</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($approved as $flight) : ?>
            <tr>
                <td><?= $flight["codigo"] ?></td>
                <td><?= $flight["fecha_salida"] ?></td>
                <td><?= $flight["fecha_llegada"] ?></td>
                <td><?= $flight["velocidad"] ?></td>
                <td><?= $flight["altitud"] ?></td>
            </tr>
        <?php endforeach ?>
    </tbody>
</table>
<?php endif ?>

<h2>Vuelos rechazados ❌</h2>
<?php if (count($rejected) == 0) : ?>
    <p>No hay vuelos rechazados.</p>
<?php else : ?>
<table>
    <thead>
        <tr>
            <th>Código</th>
            <th>Fecha Salida</th>
            <th>Fecha Llegada</th>
            <th>Velocidad (km/h)</th>
            <th>Altitud (m)</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($rejected as $flight) : ?>
            <tr>
                <td><?= $flight["codigo"] ?></td>
                <td><?= $flight["fecha_salida"] ?></td>
                <td><?= $flight["fecha_llegada"] ?></td>
                <td><?= $flight["velocidad"] ?></td>
                <td><?= $flight["altitud"] ?></td>
            </tr>
        <?php endforeach ?>
    </tbody>
</table>
<?php endif ?>