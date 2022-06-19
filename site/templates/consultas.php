<?php $this->layout('layout', ['title' => 'Entrega 2 BBDD - Grupo 27', 'description' => "Este es un proyecto de BBDD (IIC2413) que demuestra la capacidad de procesar datos, cargarlos a una base de datos, generar consultas complejas y mostrarlas en una página web."]) ?>

<h1>Entrega 2 BBDD</h1>
<p>
    <b>👋 ¡Bienvenid@ a nuestra plataforma de vuelos!</b>
</p>

<details id="resumen-proyecto" open>
    <summary>Datos del proyecto</summary>
    <p>Este es un proyecto de BBDD (IIC2413) que demuestra la capacidad de procesar datos, cargarlos a una base de datos, generar consultas complejas y mostrarlas en una página web.</p>
    <p>
        El <b>procesamiento de datos</b> se hizo haciendo uso de algoritmos dinámicos escritos con
        <a href="https://julialang.org/">Julia</a> y usando <a href="https://github.com/fonsp/Pluto.jl">Pluto</a>.
    </p>

    <img src="https://imgs.xkcd.com/comics/data_pipeline.png" alt="Data Pipeline">

    <p></p>
    <button onclick="window.location.href='static/notebook.html'">👉 Ver notebook</button>
    <p></p>

    <p>
        Para el <b>back-end</b> utilizamos PHP + PDO, actuando a modo de API de consultas.
    </p>
    <p>
        Para el <b>front-end</b> utilizamos una página estática generada por templates de <a href=" https://platesphp.com/">Plates</a>, estilos desclasados con <a href="https://watercss.kognise.dev/">Water.css</a> y JavaScript moderno para consumir la API.
    </p>

</details>

<p>
    Aquí podrás buscar información sobre vuelos, aerolineas, aeropuertos y más. También podrás realizar reservas y comprar pasajes para ti y más personas. Actualmente la página está en construcción, pero por ahora puedes realizar las siguientes consultas a nuestra base de datos:
</p>

<h2>Consultas Disponibles</h2>

<h3>Consulta 1: Vuelos pendientes 🛫</h3>
<blockquote>
    Muestre todos los vuelos pendientes de ser aprobados por la DGAC.
</blockquote>
<button id="boton-vuelos-pendientes">Solicitar</button>
<div id="vuelos-pendientes"></div>

<h3>Consulta 2: Vuelos aceptados ✅</h3>
<blockquote>
    Dado un código ICAO de un aérodromo ingresado por el usuario y una aerolínea. seleccionada por el usuario, liste todos los vuelos aceptados de dicha aerolínea que tienen como destino el aeródromo.
</blockquote>

<p><b>Tip: </b>Prueba con el código ICAO <code>PVOW</code> y la aerolínea <code>LATAM ECUADOR</code>.</p>

<!-- Ask for the ICAO code and select the airline -->
<form id="form-vuelos-aceptados">
    <label for="icao">Código ICAO</label>
    <input type="text" id="icao" name="icao" required maxlength="4" />
    <label for="id_aerolinea">Aerolínea</label>
    <select class="id_aerolinea" id="id_aerolinea" name="id_aerolinea" required>
        <option value="">Seleccione una aerolínea</option>
    </select>
    <button id="boton-vuelos-aceptados">Solicitar</button>
</form>
<div id="vuelos-aceptados"></div>

<h3>Consulta 3: Tickets 📄</h3>
<blockquote>
    Dado un código de reserva ingresado por el usuario, liste los tickets asociados a esta junto a sus pasajeros y costos.
</blockquote>

<p><b>Tip: </b>Prueba con el código de reserva <code>XLE7933-4209</code>.</p>
<!-- Ask for the reservation code -->
<form id="form-tickets">
    <label for="codigo-reserva">Código de reserva</label>
    <input type="text" id="codigo-reserva" name="codigo-reserva" minlength="10" maxlength="14" required />
    <button id="boton-tickets">Solicitar</button>
</form>
<div id="tickets"></div>

<h3>Consulta 4: Cliente frecuente 👤🎖️</h3>
<blockquote>
    Por cada aerolinea, muestre al cliente que ha comprado la mayor cantidad de tickets.
</blockquote>
<button id="boton-clientes-frecuentes">Solicitar</button>
<div id="clientes-frecuentes"></div>

<h3>Consulta 5: Resumen de vuelos 📑 🛫</h3>
<blockquote>
    Al ingresar el nombre de una aerolínea, liste la cantidad de vuelos que tienen en cada uno de los estados.
</blockquote>
<p><b>Tip:</b> Prueba con la aerolínea <code>LATAM ECUADOR</code>.</p>
<!-- Get an airline name -->
<form id="form-resumen-vuelos">
    <label for="nombre-aerolinea">Nombre de la aerolínea</label>
    <input type="text" id="nombre-aerolinea" name="nombre-aerolinea" required />
    <button id="boton-resumen-vuelos">Solicitar</button>
</form>
<div id="resumen-vuelos"></div>

<h3>Consulta 6: Aerolínea estrella ✨</h3>
<blockquote>
    Muestre la aerolínea que tiene el mayor porcentaje de vuelos aceptados.
</blockquote>
<button id="boton-aerolinea-estrella">Solicitar</button>
<div id="aerolinea-estrella"></div>

<details>
    <summary>Little bobby tables, we call him...</summary>
    <img src="https://imgs.xkcd.com/comics/exploits_of_a_mom.png" alt="Exploits of a Mom">
</details>

<!-- Footer -->
<footer>
    <p>
        <b>¡Gracias por usar nuestra plataforma!</b>&nbsp; 🤝
    </p>
    <p>
        👥 &nbsp;<b>Trabajo de:</b> <a href="https://github.com/Artaudd">Nicolás Cañete</a> y <a href="https://github.com/agucova">Agustín Covarrubias</A>
    </p>
    <br>
</footer>
