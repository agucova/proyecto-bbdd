<?php
require 'vendor/autoload.php';

$templates = new League\Plates\Engine("templates/");

echo $templates->render('consultas', []);
