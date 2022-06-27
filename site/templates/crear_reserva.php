<?php $this->layout('layout', ['title' => 'Entrega 3 BBDD - Crear reserva', 'description' => "Este es un proyecto de BBDD (IIC2413) que demuestra la capacidad de procesar datos, cargarlos a una base de datos, generar consultas complejas y mostrarlas en una página web."]) ?>

<h1>Crear reserva</h1>
<!-- Print $flight for debugging -->
<?php var_dump($flight) ?>

<p>Estás reservando para el vuelo que va desde <?= $flight->aeropuerto_origen ?> a <?= $flight->aeropuerto_destino ?>.</p>

<!-- Format dates -->
<p><b>Fecha de Salida</b>: <?= $flight->fecha_salida ?></p>
<p><b>Fecha de Llegada</b>: <?= $flight->fecha_llegada ?></p>

<!-- Form for passenger passports (up to three) -->
<!-- Passports have the format LETTER + 8 DIGITS -->
<!-- ^[A-Z]\d{8}$ -->
<form action="crear_reserva.php?id=<?= $flight->id ?>" method="post">
    <div class="form-group">
        <label for="passport0">Pasaporte 1</label>
        <input type="text" class="form-control" id="passport0" name="passport0" pattern="^[A-Z]\d{8}$" min="9" max="9" required>
        <label for="passport2">Pasaporte 2</label>
        <input type="text" class="form-control" id="passport1" name="passport1" pattern="^[A-Z]\d{8}$" min="9" max="9">
        <label for="passport3">Pasaporte 3</label>
        <input type="text" class="form-control" id="passport2" name="passport2" pattern="^[A-Z]\d{8}$" min="9" max="9">
    </div>
    <button type=" submit" class="btn btn-primary">Reservar</button>
</form>