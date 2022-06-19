<?php
require __DIR__ . '/../vendor/autoload.php';
require __DIR__ . "/../config/connection.php";

$query = $pdo27->query("SELECT
  aceptados.nombre_aerolinea as nombre_aerolinea,
  aceptados.n_vuelos as n_vuelos_aceptados,
  totales.n_vuelos as n_vuelos_totales,
  to_char((cast(aceptados.n_vuelos as float8)/cast(totales.n_vuelos as float8)) * 100, 'fm00D00%') as porcentaje_aceptados
from (
  select
    aerolinea.id as id_aerolinea,
    aerolinea.nombre as nombre_aerolinea,
    count(vuelo.id) as n_vuelos
  from
    aerolinea
    join vuelo on vuelo.id_aerolinea = aerolinea.id
  where
    vuelo.estado = 'aceptado'
  group by aerolinea.id
  ) as aceptados
  join (
    select
      aerolinea.id as id_aerolinea,
      aerolinea.nombre as nombre_aerolinea,
      count(vuelo.id) as n_vuelos
    from
      aerolinea
      join vuelo on vuelo.id_aerolinea = aerolinea.id
    group by aerolinea.id
    ) as totales on aceptados.id_aerolinea = totales.id_aerolinea
order by cast(aceptados.n_vuelos as float8)/cast(totales.n_vuelos as float8) desc
limit 1");

$data = $query->fetchAll();

header('Content-Type: application/json');
echo json_encode($data, JSON_UNESCAPED_UNICODE + JSON_PRETTY_PRINT);
