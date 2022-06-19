<?php
require 'vendor/autoload.php';

$templates = new League\Plates\Engine("templates/");
// Get user if logged in
session_start();
$user = isset($_SESSION['user']) ? $_SESSION['user'] : null;


echo $templates->render('inicio', ["user" => $user]);
