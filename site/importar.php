<?php
require 'vendor/autoload.php';
require 'config/connection.php';

$query = $pdo27->query("SELECT
                    import_users()");
$data = $query->fetchAll();

header("Location: index.php");