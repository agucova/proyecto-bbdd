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

// If user is not a DGAC admin, redirect to home
if ($user['tipo'] != 'admin_dgac') {
    header('Location: index.php');
    exit;
}

$query = $pdo44->prepare("SELECT *
FROM fpl_propuesta
WHERE estado='pendiente';");

$query->execute();
$proposals = $query->fetchAll();

echo $templates->render('dgac', [
    "admin" => $user,
    "proposals" => $proposals
]);