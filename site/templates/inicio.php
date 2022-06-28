<?php $this->layout('layout', ['title' => 'Entrega 3 BBDD - Grupo 27 y 44', 'description' => "Este es un proyecto de BBDD (IIC2413) que demuestra la capacidad de procesar datos, cargarlos a una base de datos, generar consultas complejas y mostrarlas en una página web."]) ?>

<h1>Entrega 3 BBDD</h1>
<p>
    <b>👋 ¡Bienvenid@ a nuestra plataforma de vuelos!</b>
</p>

<details id="resumen-proyecto" open>
    <summary>Datos del proyecto</summary>
    <p>Este es un proyecto de BBDD (IIC2413) que demuestra la capacidad de procesar datos, cargarlos a una base de datos, generar consultas complejas y mostrarlas en una página web.</p>

    <img src="https://imgs.xkcd.com/comics/data_pipeline.png" alt="Data Pipeline">

    <p>
        <br />
        Para el <b>front-end</b> utilizamos una página estática generada por templates de <a href=" https://platesphp.com/">Plates</a> y estilos desclasados con <a href="https://watercss.kognise.dev/">Water.css</a>.
    </p>

</details>

<p>
    Aquí podrás buscar información sobre vuelos, aerolineas, aeropuertos y más. También podrás realizar reservas y comprar pasajes para ti y más personas.
</p>

</hr>
<!-- Boton de inicio de sesión / cerrado sesión -->
<?php if (empty($user)) : ?>
    <button type="button" onclick="window.location.href = 'login.php'">🔑 Iniciar Sesión</button>
<?php else : ?>
    <h3>Bienvenido <?= $user['nombre'] ?>! 👋</h3>
    <?php if ($user["tipo"] == "admin_dgac") : ?>
        <button type="button" onclick="window.location.href = 'dgac.php'">🔒 Ir al panel de administración</button>
    <?php elseif ($user["tipo"] == "compañia_aerea") : ?>
        <button type="button" onclick="window.location.href = 'aerolinea.php'">✈️ Ir a ver mis vuelos</button>
    <?php elseif ($user["tipo"] == "pasajero") : ?>
        <button type="button" onclick="window.location.href = 'pasajero.php'">📄 Ir a ver mis reservas</button>
    <?php endif ?>

    <button type="button" onclick="window.location.href = 'logout.php'">🔐 Cerrar Sesión</button>
<?php endif ?>

<hr />
<h2>Importación de Usuarios</h2>
<?php if (!is_null($import)) : ?>
    <p>
        <?php if ($import == 0) : ?>
            No se importaron nuevos usuarios.
        <?php elseif ($import == -1) : ?>
            Se borraron todos los usuarios exitosamente.
        <?php else : ?>
            Se importaron <?= $users_imported ?> usuarios exitosamente y se saltaron <?= $admin_errors ?> admins, <?= $airline_errors ?> aerolineas y <?= $passenger_errors ?> pasajeros que ya existían en la base de datos.
        <?php endif ?>
    </p>
<?php else : ?>
    <p>Puedes generar los usuarios a partir de la base de datos:</p>
<?php endif; ?>
<button type="button" onclick="window.location.href = 'importar_usuarios.php'">👥 Importar usuarios</button>
<button type="button" onclick="window.location.href = 'borrar_usuarios.php'">❌ Dropear usuarios</button>