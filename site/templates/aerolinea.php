<?php $this->layout('layout', ['title' => 'Entrega 3 BBDD - Grupo 27 y 44', 'description' => "Este es un proyecto de BBDD (IIC2413) que demuestra la capacidad de procesar datos, cargarlos a una base de datos, generar consultas complejas y mostrarlas en una página web."]) ?>

<h1>Panel de Control de Aerolínea</h1>
<p><b>Nombre:</b> <?= $airline["nombre"] ?></p>

<h2>Vuelos aprobados ✅</h2>
<table>
    <thead>
        <tr>
            <th>Código</th>
            <th>Fecha Salida</th>
            <th>Fecha Llegada</th>
            <th>Velocidad</th>
            <th>Altitud</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($approved as $flight): ?>
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

<h2>Vuelos rechazados ❌</h2>
<table>
    <thead>
        <tr>
            <th>Código</th>
            <th>Fecha Salida</th>
            <th>Fecha Llegada</th>
            <th>Velocidad</th>
            <th>Altitud</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($rejected as $flight): ?>
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