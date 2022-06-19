<?php
require __DIR__ . '/../vendor/autoload.php';
require __DIR__ . "/../config/connection.php";

$query = $pdo27->query("SELECT
                    id,
                    nombre
                    from aerolinea;");

$data = $query->fetchAll();

header('Content-Type: application/json');

echo json_encode($data, JSON_UNESCAPED_UNICODE + JSON_PRETTY_PRINT);
