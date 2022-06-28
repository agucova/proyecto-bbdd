<?php
require 'vendor/autoload.php';
require 'config/connection.php';

$templates = new League\Plates\Engine("templates/");

// https://www.tutorialspoint.com/php/php_mysql_login.htm

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

// Find passenger by their passport, which is the user's name
$queryPassenger = $pdo27->prepare('SELECT * FROM pasajero WHERE pasaporte = :pasaporte');
$queryPassenger->execute([
    'pasaporte' => $user["nombre"]
]);
$passenger = $queryPassenger->fetchObject();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Process form data
    $origin = $_POST['origin-city'];
    $destination = $_POST['destination-city'];
    $departure_date = $_POST['departure-date'];

    // Separate city and country from origin and destination
    $origin_city = explode(', ', $origin)[0];
    $origin_country = explode(', ', $origin)[1];
    $destination_city = explode(', ', $destination)[0];
    $destination_country = explode(', ', $destination)[1];

    // Find approved flights that match the search criteria
    $search_query = $pdo27->prepare("SELECT vuelo.id as id, fecha_salida, fecha_llegada, origen.nombre as aeropuerto_origen, destino.nombre as aeropuerto_destino, monto, modelo.codigo as modelo
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
            where vuelo.estado = 'aceptado'
            and ciudad_origen.nombre = :origin_city
            and pais_origen.nombre = :origin_country
            and ciudad_destino.nombre = :destination_city
            and pais_destino.nombre = :destination_country
            and vuelo.fecha_salida::date = to_date(:departure_date, 'YYYY-MM-DD');
        ");
    $search_query->bindparam(':origin_city', $origin_city);
    $search_query->bindparam(':origin_country', $origin_country);
    $search_query->bindparam(':destination_city', $destination_city);
    $search_query->bindparam(':destination_country', $destination_country);
    // Check if departure date is valid
    if (!preg_match('/^\d{4}-\d{2}-\d{2}$/', $departure_date)) {
        $error = 'Fecha de salida inválida';
        // Render the template with the error
        echo $templates->render('buscar_vuelo', [
            'passenger' => $passenger,
            'results' => null,
            'error' => $error,
            'origin-city' => $origin,
            'destination-city' => $destination,
            'departure-date' => $departure_date
        ]);
        exit;
    } else {
        $search_query->bindparam(':departure_date', $departure_date);
    }
    $search_query->execute();
    $results = $search_query->fetchAll();

    // Return results
    echo $templates->render('buscar_vuelo', [
        'passenger' => $passenger,
        'results' => $results,
        'error' => null,
        'origin-city' => $origin,
        'destination-city' => $destination,
        'departure-date' => $departure_date
    ]);


} else {
    // Default search form 
    echo $templates->render('buscar_vuelo', [
        'passenger' => $passenger,
        'results' => null,
        'error' => null,
        'origin-city' => "",
        'destination-city' => "",
        'departure-date' => ""
    ]);
};
