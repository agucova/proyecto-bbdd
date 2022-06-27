<?php
require 'vendor/autoload.php';
require 'config/connection.php';

$templates = new League\Plates\Engine("templates/");

$query = $pdo27->query("SELECT
                    import_users()");

// The query returns the number of users imported successfully.
$users_imported = $query->fetchObject()->import_users;

// If no users were imported return to index with a message in the URI
header("Location: /?import=$users_imported");

exit;