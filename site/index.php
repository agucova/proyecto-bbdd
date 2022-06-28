<?php
require 'vendor/autoload.php';

$templates = new League\Plates\Engine("templates/");

// Get user if logged in
session_start();
$user = isset($_SESSION['user']) ? $_SESSION['user'] : null;

// If import in _GET, send the message to the template
$import = isset($_GET['import']) ? $_GET['import'] : null;
$users_imported = isset($_GET['import']) ? $_GET['users_imported'] : null;
$admin_errors = isset($_GET['admin_errors']) ? $_GET['admin_errors'] : null;
$airline_errors = isset($_GET['airline_errors']) ? $_GET['airline_errors'] : null;
$passenger_errors = isset($_GET['passenger_errors']) ? $_GET['passenger_errors'] : null;

echo $templates->render('inicio', ["user" => $user, "import" => $import, "users_imported" => $users_imported, "admin_errors" => $admin_errors, "airline_errors" => $airline_errors, "passenger_errors" => $passenger_errors]);
