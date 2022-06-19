<?php
require __DIR__ . '/../vendor/autoload.php';
require __DIR__ . "/../config/connection.php";

$arguments = json_decode(file_get_contents('php://input'), true);
// Check if the arguments are valid
if (!isset($arguments["codigo_reserva"])) {
    http_response_code(400);
    echo json_encode(array("message" => "Invalid arguments"), JSON_UNESCAPED_UNICODE + JSON_PRETTY_PRINT);
    exit();
}
$codigo_reserva = $arguments['codigo_reserva'];

$query = $pdo27->prepare(
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
    pais_destino.nombre as pais_destino
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
    reserva.codigo ILIKE CONCAT('%', CAST(:codigo_reserva AS VARCHAR), '%');");

$query->bindparam(':codigo_reserva', $codigo_reserva, PDO::PARAM_STR);
$query->execute();
$data = $query->fetchAll();

header('Content-Type: application/json');
echo json_encode($data, JSON_UNESCAPED_UNICODE + JSON_PRETTY_PRINT);
