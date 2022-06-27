<?php
require 'vendor/autoload.php';
require 'config/connection.php';

$templates = new League\Plates\Engine("templates/");

// Get user if logged in
session_start();
$user = isset($_SESSION['user']) ? $_SESSION['user'] : null;

// If user is not logged in, redirect to login page
if (!$user) {
    header('Location: login.php');
    exit;
}

// If user is not a passenger, redirect to home
if ($user['tipo'] != 'pasajero') {
    header('Location: index.php');
    exit;
}

// Find passenger by their passport, which is the user's name
$queryPassenger = $pdo27->prepare('SELECT * FROM pasajero WHERE pasaporte = :pasaporte');
$queryPassenger->execute([
    'pasaporte' => $user["nombre"]
]);
$passenger = $queryPassenger->fetchObject();

// Find reservations made by the passenger
$queryReservations = $pdo27->prepare('SELECT * FROM reserva WHERE id_reservante = :id_pasajero');
$queryReservations->execute([
    'id_pasajero' => $passenger->id
]);
$reservations = $queryReservations->fetchAll();

// Find the tickets in each reservation
foreach ($reservations as $key => $reservation) {
    $queryTickets = $pdo27->prepare(
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
          vuelo.fecha_llegada as fecha_llegada,
          vuelo.codigo as codigo_vuelo
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
          reserva.id = :id_reserva");
    
    $queryTickets->execute([
        'id_reserva' => $reservation["id"]
    ]);
    $tickets = $queryTickets->fetchAll();
    $reservations[$key]["tickets"] = $tickets;
}

echo $templates->render('pasajero', ["passenger" => $passenger, "reservations" => $reservations]);
