<?php
require 'vendor/autoload.php';
require 'config/connection.php';

$templates = new League\Plates\Engine("templates/");

# PENDIENTE: ACTUALIZAR PDO44 Y PDO27 CON LO QUE RETORNA EL SP USADO PARA LA PDO44
# Quizas usar un puro procedimiento que sea "update_proposal" en vez de 2 para aceptar y rechazar

// Actualizar el estado del vuelo en la BDD par (fpl_propuesta)
$stmt44 = $pdo44->prepare("UPDATE
                    fpl_propuesta SET estado = 'aceptado'
                    WHERE codigo = :codigo ");
$stmt44->execute(['codigo' => $_GET['codigo']]);

// Actualizar el estado del vuelo en la BDD par (fpl)
$stmt44 = $pdo44->prepare("UPDATE
                    fpl SET estado = 'aceptado'
                    WHERE codigo = :codigo ");
$stmt44->execute(['codigo' => $_GET['codigo']]);

// Obtener los datos del vuelo
$vuelo = $pdo44->prepare('SELECT 
                        compania_aerea.codigo_compania AS codigo_aerolinea,
                        "Aerodromo.aerodromo_salida_id" AS id_origen,
                        "Aerodromo.aerodromo_llegada_id" AS id_destino,
                        aeronave.codigo_aeronave AS codigo_avion,
                        "Ruta.ruta_id" AS id_ruta,
                        codigo,
                        fecha_salida,
                        fecha_llegada,
                        velocidad,
                        altitud,
                        estado
                        FROM fpl
                        JOIN compania_aerea ON fpl."Compania_Aerea.id_compania" = compania_aerea.id_compania
                        JOIN aeronave ON fpl."Aeronave.id_aeronave" = aeronave.id_aeronave
                        WHERE codigo = :codigo');
$vuelo->execute(['codigo' => $_GET['codigo']]);
$vuelo_result = $vuelo->fetchObject();

$valores_vuelo = array(
    "codigo_aerolinea" => $vuelo_result->codigo_aerolinea,
    "id_origen" => $vuelo_result->id_origen,
    "id_destino" => $vuelo_result->id_destino,
    "codigo_avion" => $vuelo_result->codigo_avion,
    "id_ruta" => $vuelo_result->id_ruta,
    "codigo" => $vuelo_result->codigo,
    "fecha_salida" => $vuelo_result->fecha_salida,
    "fecha_llegada" => $vuelo_result->fecha_llegada,
    "velocidad" => $vuelo_result->velocidad,
    "altitud" => $vuelo_result->altitud,
    "estado" => $vuelo_result->estado
);

// Buscar ids de avion y aerolinea asociados a los codigos
$id_avion = $pdo27->prepare('SELECT id FROM avion WHERE codigo = :codigo;');
$id_avion->execute(['codigo' => $valores_vuelo['codigo_avion']]);
$id_avion_result = $id_avion->fetchObject();

$id_aerolinea = $pdo27->prepare('SELECT id FROM aerolinea WHERE codigo = :codigo;');
$id_aerolinea->execute(['codigo' => $valores_vuelo['codigo_aerolinea']]);
$id_aerolinea_result = $id_aerolinea->fetchObject();

// Crear el vuelo en la BDD impar
$stmt27 = $pdo27->prepare("INSERT INTO vuelo(id_aerolinea, id_origen, id_destino, id_avion, id_ruta, codigo, fecha_salida, fecha_llegada, velocidad, altitud, estado) VALUES(
    :id_aerolinea,
    :id_origen,
    :id_destino,
    :id_avion,
    :id_ruta,
    :codigo,
    :fecha_salida,
    :fecha_llegada,
    :velocidad,
    :altitud,
    :estado
    );"
);
$stmt27->execute([
    "id_aerolinea" => $id_aerolinea_result->id,
    "id_origen" => $vuelo_result->id_origen,
    "id_destino" => $vuelo_result->id_destino,
    "id_avion" => $id_avion_result->id,
    "id_ruta" => $vuelo_result->id_ruta,
    "codigo" => $vuelo_result->codigo,
    "fecha_salida" => $vuelo_result->fecha_salida,
    "fecha_llegada" => $vuelo_result->fecha_llegada,
    "velocidad" => $vuelo_result->velocidad,
    "altitud" => $vuelo_result->altitud,
    "estado" => $vuelo_result->estado
]);

header("Location: dgac.php", true, 302);