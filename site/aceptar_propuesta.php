<?php
require 'vendor/autoload.php';
require 'config/connection.php';

$templates = new League\Plates\Engine("templates/");

# PENDIENTE: ACTUALIZAR PDO44 Y PDO27 CON LO QUE RETORNA EL SP USADO PARA LA PDO44
# Quizas usar un puro procedimiento que sea "update_proposal" en vez de 2 para aceptar y rechazar

$query = $pdo44->query("SELECT
                    accept_proposal()");
$vuelo = $query->fetchAll();

echo $templates->render('dgac');
?>