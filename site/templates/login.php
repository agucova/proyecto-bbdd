<?php $this->layout('layout', ['title' => 'Entrega 3 BBDD - Login', 'description' => "Este es un proyecto de BBDD (IIC2413) que demuestra la capacidad de procesar datos, cargarlos a una base de datos, generar consultas complejas y mostrarlas en una página web."]) ?>

<h1>Iniciar sesión 🔐</h1>
<p>Para iniciar sesión, rellena el siguiente formulario:</p>
<cite><b>Tip:</b> El nombre de usuario es sensible a el uso de mayúsculas.</cite>
<!-- Formulario de inicio de sesión -->
<form action="login.php" method="post">
    <p><?= $error ?></p>
    <label for="username">Usuario</label>
    <input type="text" name="username" id="username" ?>
    <label for="password">Contraseña</label>
    <input type="password" name="password" id="password">
    <input type="submit" value="Iniciar sesión">
</form>