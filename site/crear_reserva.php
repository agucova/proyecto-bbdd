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

// If user is not a passenger, redirect to home
if ($user['tipo'] != 'pasajero') {
    header('Location: index.php');
    exit;
}

// If the request is a get, show the form
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $query = $pdo27->prepare("SELECT vuelo.id as id, fecha_salida, fecha_llegada, origen.nombre as aeropuerto_origen, destino.nombre as aeropuerto_destino, monto, modelo.codigo as modelo
                from vuelo
                        join avion on vuelo.id_avion = avion.id
                        join modelo on avion.id_modelo = modelo.id
                        join ruta on vuelo.id_ruta = ruta.id
                        join aerodromo origen on vuelo.id_origen = origen.id
                        join aerodromo destino on vuelo.id_destino = destino.id
                        join ciudad ciudad_origen on origen.id_ciudad = ciudad_origen.id
                        join ciudad ciudad_destino on destino.id_ciudad = ciudad_destino.id
                        join pais pais_origen on ciudad_origen.id_pais = pais_origen.id
                        join pais pais_destino on ciudad_destino.id_pais = pais_destino.id
                        join costo on modelo.id = costo.id_modelo and ruta.id = costo.id_ruta
                where vuelo.id = :id;
            ");
    $query->execute([':id' => $_GET['id']]);
    $flight = $query->fetchObject();

    echo $templates->render('crear_reserva', [
        "flight" => $flight
    ]);
}

elseif ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Create reservation using the data from the form
    // with the three passports
    $flight_id = $_GET['id'];
    $passport0 = $_POST['passport0'];
    $passport1 = $_POST['passport1'];
    $passport2 = $_POST['passport2'];

    // Check that a flight id was given
    if (empty($flight_id)) {
        http_response_code(400);
        echo $templates->render('error', [
            'error' => 'No se entregó un ID de vuelo.'
        ]);
        exit;
    }

    // Convert flight id to integer, return on error
    $flight_id = intval($flight_id);
    if ($flight_id === 0) {
        http_response_code(400);
        echo $templates->render('error', [
            'error' => 'El ID del vuelo no es un número o es inválido.'
        ]);
        exit;
    }

    // Validate that there is at least one passport that is not empty
    if (empty($passport0) && empty($passport1) && empty($passport2)) {
        http_response_code(400);
        echo $templates->render('error', [
            'error' => 'Debes ingresar al menos un pasaporte.'
        ]);
        exit;
    }

    $passports = [];
    // Push the passports that are defined to the array
    foreach ([$passport0, $passport1, $passport2] as $passport) {
        if (!empty($passport)) {
            $passports[] = $passport;
        }
    }
    // Check that each passport has the format LETTER + 9 DIGITS
    foreach ($passports as $passport) {
        if (!preg_match('/^[A-Z]{1}[0-9]{8}$/', $passport)) {
            http_response_code(400);
            echo $templates->render('error', [
                'error' => 'Un pasaporte no tiene el formato correcto.'
            ]);
            exit;
        }
    }

    // Check that each passport exists in database
    foreach ($passports as $passport) {
        $query = $pdo27->prepare("SELECT is_passport_valid(:passport);");
        $query->execute([':passport' => $passport]);
        $is_valid = $query->fetchObject();

        if (!$is_valid){
            http_response_code(404);
            echo $templates->render('error', [
                'error' => 'Uno de los pasaportes no existe en la base de datos.'
            ]);
            exit;
        }
        // Check for a scheduling conflict for the passenger and the flight
        $query = $pdo27->prepare("SELECT has_schedule_conflict(:passport, :flight_id);");
        $query->execute([':passport' => $passport, ':flight_id' => $flight_id]);
        $has_conflict = $query->fetchObject()->has_schedule_conflict;

        if ($has_conflict) {
            http_response_code(400);
            echo $templates->render('error', [
                'error' => 'Uno de los pasajeros tiene un conflicto de horario con otro vuelo.'
            ]);
            exit;
        }
    }

    // Generate reservation
    $query = $pdo27->prepare("SELECT generate_reservation(:flight_id, :passport);");
    $query->execute([':flight_id' => $flight_id, ':passport' => $passport]);
    $reservation_id = $query->fetchObject()->generate_reservation;
    
    // Generate tickets
    foreach ($passports as $passport) {
        $query = $pdo27->prepare("SELECT generate_ticket(:flight_id, :reservation_id, :passport);");
        $query->execute([':flight_id' => $flight_id, ':reservation_id' => $reservation_id, ':passport' => $passport]);
    }

    // Redirect to the reservation page
    header('Location: reserva_creada.php?reservation-id=' . $reservation_id);
}
