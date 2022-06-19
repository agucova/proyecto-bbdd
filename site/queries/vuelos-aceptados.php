<?php
require __DIR__ . '/../vendor/autoload.php';
require __DIR__ . "/../config/connection.php";

$arguments = json_decode(file_get_contents('php://input'), true);
// Check if the arguments are valid
if (!isset($arguments["icao"]) || !isset($arguments["id_aerolinea"])) {
    http_response_code(400);
    echo json_encode(array("message" => "Invalid arguments"), JSON_UNESCAPED_UNICODE + JSON_PRETTY_PRINT);
    exit();
}
$icao = $arguments['icao'];
$id_aerolinea = $arguments['id_aerolinea'];

$query = $pdo->prepare(
  "SELECT
    aerodromo.icao,
    vuelo.codigo,
    estado,
    fecha_salida,
    fecha_llegada,
    velocidad,
    altitud
  from
    vuelo
    join aerodromo on vuelo.id_destino = aerodromo.id
    join aerolinea on vuelo.id_aerolinea = aerolinea.id
  where
    aerolinea.id = :id_aerolinea
    and aerodromo.icao ILIKE CONCAT('%', CAST(:icao AS VARCHAR), '%')
    and vuelo.estado = 'aceptado';
  ");
$query->bindparam(':id_aerolinea', $id_aerolinea, PDO::PARAM_INT);
$query->bindparam(':icao', $icao, PDO::PARAM_STR);
$query->execute();
$data = $query->fetchAll();

header('Content-Type: application/json');
echo json_encode($data, JSON_UNESCAPED_UNICODE + JSON_PRETTY_PRINT);
