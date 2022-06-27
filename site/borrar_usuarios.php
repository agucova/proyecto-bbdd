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

// Log out user
session_start();

// Unset all of the session variables.
$_SESSION = array();

if (ini_get("session.use_cookies")) {
    $params = session_get_cookie_params();
    setcookie(
        session_name(),
        '',
        time() - 42000,
        $params["path"],
        $params["domain"],
        $params["secure"],
        $params["httponly"]
    );
}

// Finally, destroy the session.
session_destroy();

// If no users were imported return to index with a message in the URI
header("Location: /?import=-1");

exit;
