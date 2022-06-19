<?php
require 'vendor/autoload.php';
require 'config/connection.php';

$templates = new League\Plates\Engine("templates/");

// https://www.tutorialspoint.com/php/php_mysql_login.htm

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    // If the user is sending the form data
    // Process the form data
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Check if the user is in the database with bound parameters
    $query = $pdo27 -> prepare("SELECT * FROM usuario WHERE nombre = :username AND clave = :password");
    $query -> bindParam(':username', $username);
    $query -> bindParam(':password', $password);
    $query -> execute();
    $user = $query->fetch();
    if ($user) {
        // Session start
        session_start();

        // If the user is in the database, set the session
        $_SESSION['user'] = $user;
        if ($user['tipo'] == 'admin_dgac') {
            header("Location: dgac.php");
        } elseif ($user['tipo'] == 'compañia_aerea') {
            header("Location: aerolinea.php");
        }
        elseif ($user['tipo'] == 'pasajero') {
            header("Location: pasajero.php");
        }
        else {
            header("Location: index.php");
        }
    } else {
        // If the user is not in the database, redirect to the login page
        echo $templates->render('login', ["error" => "Usuario o contraseña incorrectos"]);
    }
} else {
    // Process 
    echo $templates->render('login', ["error" => ""]);
};