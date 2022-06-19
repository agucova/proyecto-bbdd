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
        Para el <b>back-end</b> utilizamos PHP + PDO, actuando a modo de API de consultas.
    </p>
    <p>
        Para el <b>front-end</b> utilizamos una página estática generada por templates de <a href=" https://platesphp.com/">Plates</a>, estilos desclasados con <a href="https://watercss.kognise.dev/">Water.css</a> y JavaScript moderno para consumir la API.
    </p>

</details>

<p>
    Aquí podrás buscar información sobre vuelos, aerolineas, aeropuertos y más. También podrás realizar reservas y comprar pasajes para ti y más personas.
</p>

<!-- Boton de inicio de sesión / cerrado sesión -->
<?php if (empty($user)) : ?>
    <button type="button" onclick="window.location.href = 'login.php'">Iniciar Sesión</button>
<?php else : ?>
    <p>Bienvenido <?= $user['nombre'] ?>! 👋</p>
    <button type="button" onclick="window.location.href = 'logout.php'">Cerrar Sesión</button>
<?php endif ?>
<button type="button" onclick="window.location.href = 'importar.php'">Importar usuarios</button>