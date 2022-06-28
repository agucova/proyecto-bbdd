<?php
require 'vendor/autoload.php';
require 'config/connection.php';

$templates = new League\Plates\Engine("templates/");

$query = $pdo27->query("SELECT
                    import_users()");

// The query returns the number of users imported successfully.
$result = $query->fetchObject()->import_users;
// Result is a string with 4 concatenated integers: number of users imported, admin errors, airline errors and passenger errors

$result = explode(",", $result);
$users_imported = $result[0];
$admin_errors = $result[1];
$airline_errors = $result[2];
$passenger_errors = $result[3];

if ($users_imported > 0) {
    $import = 1;
} else {
    $import = 0;
}

// If no users were imported return to index with a message in the URI
header("Location: index.php?import=$import&users_imported=$users_imported&admin_errors=$admin_errors&airline_errors=$airline_errors&passenger_errors=$passenger_errors");

exit;
