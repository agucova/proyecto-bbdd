<?php
    require("../config/connection.php");
    require("../vendor/autoload.php");

    $arguments = json_decode(file_get_contents('php://input'), true);
    // Check if the arguments are valid
    if (!isset($arguments["nombre_aerolinea"])) {
        http_response_code(400);
        echo json_encode(array("message" => "Invalid arguments"), JSON_UNESCAPED_UNICODE + JSON_PRETTY_PRINT);
        exit();
    }

    $nombre_aerolinea = $arguments['nombre_aerolinea'];

    $query = "SELECT
    vuelo.estado as estado_vuelo,
    count(vuelo.id) as n_vuelos
  from
    aerolinea
    join vuelo on vuelo.id_aerolinea = aerolinea.id
  where
    aerolinea.nombre ILIKE CONCAT('%', CAST(:nombre_aerolinea AS VARCHAR), '%')
  group by
    vuelo.estado
  ";
    $query = $pdo27->prepare($query);
    $query->bindparam(':nombre_aerolinea', $nombre_aerolinea, PDO::PARAM_STR);
    $query->execute();
    $data = $query->fetchAll();

    header('Content-Type: application/json');
    echo json_encode($data, JSON_UNESCAPED_UNICODE + JSON_PRETTY_PRINT);
?>
