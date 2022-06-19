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

$query = $pdo27->prepare("SELECT
*
from vuelo
where estado = 'aceptado' and id_aerolinea = :id;");
$query->bindParam(':id', $user['id']);
$query->execute();
$approved = $query->fetchAll();

$query = $pdo27->prepare("SELECT
*
from vuelo
where estado = 'rechazado' and id_aerolinea = :id;");

$query->bindParam(':id', $user['id']);
$query->execute();
$rejected = $query->fetchAll();

echo $templates->render('aerolinea', [
    "airline" => $user, 
    "approved" => $approved, 
    "rejected" => $rejected
]);