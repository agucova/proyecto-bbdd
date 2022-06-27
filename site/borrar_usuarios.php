<?php
require 'vendor/autoload.php';
require 'config/connection.php';

$templates = new League\Plates\Engine("templates/");

// Drop all users
$query = $pdo27->query("DELETE FROM usuario");

// Check if query was successful
if(!$query) {
    http_response_code(500);
    echo $templates->render('error', [
        'error' => $pdo27->errorInfo()
    ]);
}

// Close all sessions
session_destroy();

// If no users were imported return to index with a message in the URI
header("Location: /?import=-1");

exit;