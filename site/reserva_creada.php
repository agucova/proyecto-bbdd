<?php
require 'vendor/autoload.php';
require 'config/connection.php';

$templates = new League\Plates\Engine("templates/");

// Get user if logged in
session_start();
$user = isset($_SESSION['user']) ? $_SESSION['user'] : null;

// Check that it's logged in
if (!$user) {
    header('Location: login.php');
    exit;
}

// If user is not a passenger, redirect to home
if ($user['tipo'] != 'pasajero') {
    echo $templates->render('error', [
        'error' => 'Debes ser un pasajero para ver reservas.'
    ]);
    exit;
}

// Get reservation id from _GET, null if not set
$reservation_id =  isset($_GET['reservation-id']) ? $_GET['reservation-id'] : null;

// If reservation id is not set, show an error
if (!$reservation_id) {
    echo $templates->render('error', [
        'error' => 'No se entregó un ID de reserva.'
    ]);
    exit;
}

$query_reservation = $pdo27->prepare('SELECT * FROM reserva WHERE id = :reservation_id');
$query_reservation->execute([':reservation_id' => $reservation_id]);
$reservation = $query_reservation->fetchObject();

// If reservation not found show error
if (!$reservation) {
    http_response_code(404);
    echo $templates->render('error', [
        'error' => 'Reserva no encontrada.'
    ]);
    exit;
}

$query_ticket = $pdo27->prepare(
    "SELECT
          reserva.codigo as codigo_reserva,
          pasajero.nombre as nombre_pasajero,
          pasajero.pasaporte,
          ticket.asiento,
          ticket.clase,
          ticket.comida_y_maleta,
          costo.monto,
          aerodromo_origen.nombre as aeropuerto_origen,
          pais_origen.nombre as pais_origen,
          aerodromo_destino.nombre as aeropuerto_destino,
          pais_destino.nombre as pais_destino,
          vuelo.fecha_salida as fecha_salida,
          vuelo.fecha_llegada as fecha_llegada
        from
          ticket
          join vuelo on ticket.id_vuelo = vuelo.id
          join aerodromo aerodromo_origen on vuelo.id_origen = aerodromo_origen.id
          join ciudad ciudad_origen on aerodromo_origen.id_ciudad = ciudad_origen.id
          join pais pais_origen on ciudad_origen.id_pais = pais_origen.id
          join aerodromo aerodromo_destino on vuelo.id_destino = aerodromo_destino.id
          join ciudad ciudad_destino on aerodromo_destino.id_ciudad = ciudad_destino.id
          join pais pais_destino on ciudad_destino.id_pais = pais_destino.id
          join avion on vuelo.id_avion = avion.id
          join modelo on modelo.id = avion.id_modelo
          join ruta on vuelo.id_ruta = ruta.id
          join costo on costo.id_modelo = modelo.id and costo.id_ruta = ruta.id
          join pasajero on ticket.id_pasajero = pasajero.id
          join reserva on ticket.id_reserva = reserva.id
        where
          reserva.id = :reservation_id"
);

$query_ticket->execute([':reservation_id' => $reservation_id]);
$tickets = $query_ticket->fetchAll();

// If tickets not found show error
if (!$tickets) {
    http_response_code(404);
    echo $templates->render('error', [
        'error' => 'Tickets no encontrados.'
    ]);
    exit;
}

echo $templates->render('reserva_creada', ["reservation" => $reservation, "tickets" => $tickets, "new_reservation" => true]);
