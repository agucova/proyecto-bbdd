<?php
require __DIR__ . '/../vendor/autoload.php';
require __DIR__ . "/../config/connection.php";

$query = $pdo27->query("SELECT
                    codigo,
                    fecha_salida,
                    fecha_llegada,
                    velocidad,
                    altitud
                    from vuelo
                    where estado = 'pendiente';");

$data = $query->fetchAll();

header('Content-Type: application/json');
echo json_encode($data, JSON_UNESCAPED_UNICODE + JSON_PRETTY_PRINT);
