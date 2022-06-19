<?php $this->layout('layout', ['title' => 'Entrega 3 BBDD - Grupo 27 y 44', 'description' => "Este es un proyecto de BBDD (IIC2413) que demuestra la capacidad de procesar datos, cargarlos a una base de datos, generar consultas complejas y mostrarlas en una página web."]) ?>

<h1>Panel de Control Administrador DGAC</h1>

<h2>Propuestas de vuelo pendientes</h2>
<table>
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
            <th></th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($proposals as $proposal): ?>
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
                    <a href="aceptar_propuesta.php" value="<?= $proposal["propuesta_vuelo_id"] ?>"> Aceptar </a>
                </td>
                <td>
                    <a href="rechazar_propuesta.php" value="<?= $proposal["propuesta_vuelo_id"] ?>"> Rechazar </a>
                </td>
            </tr>
        <?php endforeach ?>
    </tbody>
</table>



