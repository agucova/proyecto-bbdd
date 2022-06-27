<?php
require 'vendor/autoload.php';
require "config/connection.php";

$templates = new League\Plates\Engine("templates/");

// Get user if logged in
session_start();
$user = isset($_SESSION['user']) ? $_SESSION['user'] : null;

// If user is not logged in, redirect to login page
if (!$user) {
    header('Location: login.php');
    exit;
}

// If user is not an airline, redirect to home
if ($user['tipo'] != 'compañia_aerea') {
    header('Location: index.php');
    exit;
}

$query = $pdo27->prepare("SELECT
vuelo.codigo AS codigo, fecha_salida, fecha_llegada, velocidad, altitud
from vuelo
join aerolinea on vuelo.id_aerolinea = aerolinea.id
where estado = 'aceptado' and aerolinea.codigo = :nombre;");
$query->bindParam(':nombre', $user['nombre']);
$query->execute();
$approved = $query->fetchAll();

$query = $pdo27->prepare("SELECT
vuelo.codigo AS codigo, fecha_salida, fecha_llegada, velocidad, altitud
from vuelo
join aerolinea on vuelo.id_aerolinea = aerolinea.id
where estado = 'rechazado' and aerolinea.codigo = :nombre;");

$query->bindParam(':nombre', $user['nombre']);
$query->execute();
$rejected = $query->fetchAll();

echo $templates->render('aerolinea', [
    "airline" => $user, 
    "approved" => $approved, 
    "rejected" => $rejected
]);