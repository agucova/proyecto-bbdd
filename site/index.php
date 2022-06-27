<?php
require 'vendor/autoload.php';

$templates = new League\Plates\Engine("templates/");

// Get user if logged in
session_start();
$user = isset($_SESSION['user']) ? $_SESSION['user'] : null;

// If import in _GET, send the message to the template
$import = isset($_GET['import']) ? $_GET['import'] : null;

echo $templates->render('inicio', ["user" => $user, "import" => $import]);
