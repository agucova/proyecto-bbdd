<?php
require 'vendor/autoload.php';

$templates = new League\Plates\Engine("templates/");

// Get user if logged in
session_start();
$user = isset($_SESSION['user']) ? $_SESSION['user'] : null;

// If user is not logged in, redirect to login page
if (!$user) {
    header('Location: login.php');
    exit;
}

echo $templates->render('pasajero', ["user" => $user]);
