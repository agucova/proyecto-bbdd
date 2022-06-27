<?php $this->layout('layout', ['title' => 'Entrega 3 BBDD - Reserva exitosa', 'description' => "Este es un proyecto de BBDD (IIC2413) que demuestra la capacidad de procesar datos, cargarlos a una base de datos, generar consultas complejas y mostrarlas en una página web."]) ?>
<style>
    body{
        max-width: 1400px;
    }
</style>

<h1 class="reserves-title">Sobre tu reserva</h1>

<?php if ($new_reservation) : ?>
    <p>✅ Tu reserva fue creada exitosamente con el código <?= $reservation->codigo ?>.</p>
<?php endif ?>

<h2 class="reserve-title">Reserva <?= $reservation->codigo ?></h2>
<div class="ticket-grid">
    <?php foreach ($tickets as $ticket) : ?>
        <div class="ticket">
            <h4 class="ticket-title">
                Ticket
            </h4>
            <hr />
            <div class="ticket-content">
                <div class="ticket-header">
                    <div class="passenger-info">
                        <span class="passenger-name"><?= $ticket["nombre_pasajero"] ?></span>
                        <span class="passenger-passport"><?= $ticket["pasaporte"] ?></span>
                    </div>
                    <div class="ticket-info">
                        <span class="ticket-class">🎖️ <?= $ticket["clase"] ?></span>
                        <span class="ticket-seat"><?= $ticket["asiento"] ?> 💺</span>
                    </div>
                </div>
                <hr />
                <div class="flight-info">
                    <div>
                        <div>🛫</div>
                        <div class="flight-location"><?= $ticket["aeropuerto_origen"] ?>, <?= $ticket["pais_origen"] ?>.</div>
                        <time datetime="<?= $ticket["fecha_salida"] ?>" class="flight-date">⏰ Cargando fecha...</time>

                        <br></br>

                        <div>🛬</div>
                        <div class="flight-location"><?= $ticket["aeropuerto_destino"] ?>, <?= $ticket["pais_destino"] ?>.</div>
                        <time datetime="<?= $ticket["fecha_llegada"] ?>" class="flight-date">⏰ Cargando fecha...</time>
                    </div>
                </div>
                <hr />
                <div class="upgrade-status">
                    <? $comida_y_maleta = $ticket["comida_y_maleta"] ?>
                    <p class="ticket-food-and-luggage">
                        <? if ($comida_y_maleta) : ?>
                            Incluye comida y maleta
                        <? else : ?>
                            No incluye comida y maleta
                        <? endif ?>
                    </p>
                </div>
            </div>
        </div>
    <?php endforeach ?>
</div>

<button class="button-centered" onclick="window.location.href='pasajero.php'">
    Volver a mis reservas
</button>