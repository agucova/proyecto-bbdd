<?php
require __DIR__ . '/../vendor/autoload.php';
require __DIR__ . "/../config/connection.php";

// Obtener todas las ciudades origen
$sql_origen = 'SELECT DISTINCT ciudad.nombre_ciudad, pais.nombre_pais
        FROM fpl_propuesta
        JOIN aerodromo on fpl_propuesta."Aerodromo.aerodromo_salida_id" = aerodromo.aerodromo_id
        JOIN ciudad on aerodromo."Ciudad.ciudad_id" = ciudad.ciudad_id
        JOIN pais on ciudad."pais.pais_id" = pais.pais_id;';
$query_origen = $pdo44->query($sql_origen);
$data_origen = $query_origen->fetchAll();

// Obtener todas las ciduades destino
$sql_destino = 'SELECT DISTINCT ciudad.nombre_ciudad, pais.nombre_pais
        FROM fpl_propuesta
        JOIN aerodromo on fpl_propuesta."Aerodromo.aerodromo_llegada_id" = aerodromo.aerodromo_id
        JOIN ciudad on aerodromo."Ciudad.ciudad_id" = ciudad.ciudad_id
        JOIN pais on ciudad."pais.pais_id" = pais.pais_id;';
$query_destino = $pdo44->query($sql_destino);
$data_destino = $query_destino->fetchAll();

// Guardar los resultados
$data = ["origin_cities" => $data_origen, "destination_cities" => $data_destino];

header('Content-Type: application/json');

echo json_encode($data, JSON_UNESCAPED_UNICODE + JSON_PRETTY_PRINT); 