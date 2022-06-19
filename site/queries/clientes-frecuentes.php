<?php
require __DIR__ . '/../vendor/autoload.php';
require __DIR__ . "/../config/connection.php";

$query = $pdo27->query(
  "SELECT
    tickets_cliente.nombre_aerolinea,
    tickets_cliente.nombre_cliente,
    tickets_cliente.n_tickets
  from (
    select
      tickets_cliente.id_aerolinea as id_aerolinea,
      max(n_tickets) as n_tickets
    from (
      select
        aerolinea.id as id_aerolinea,
        count(ticket.id) as n_tickets
      from
          pasajero
          join reserva on reserva.id_reservante = pasajero.id
          join ticket on ticket.id_reserva = reserva.id
          join vuelo on vuelo.id = ticket.id_vuelo
          join aerolinea on aerolinea.id = vuelo.id_aerolinea
      group by
          pasajero.id, aerolinea.id
      ) as tickets_cliente
    group by
      tickets_cliente.id_aerolinea
  ) as max_tickets
  join (
    select
      aerolinea.id as id_aerolinea,
      aerolinea.nombre as nombre_aerolinea,
      pasajero.id as id_cliente,
      pasajero.nombre as nombre_cliente,
      count(ticket.id) as n_tickets
    from
      pasajero
      join reserva on reserva.id_reservante = pasajero.id
      join ticket on ticket.id_reserva = reserva.id
      join vuelo on vuelo.id = ticket.id_vuelo
      join aerolinea on aerolinea.id = vuelo.id_aerolinea
    group by
      pasajero.id, aerolinea.id
  ) as tickets_cliente
  on max_tickets.n_tickets = tickets_cliente.n_tickets
  and max_tickets.id_aerolinea = tickets_cliente.id_aerolinea
  order by tickets_cliente.n_tickets desc, nombre_aerolinea;");

$data = $query->fetchAll();

header('Content-Type: application/json');
echo json_encode($data, JSON_UNESCAPED_UNICODE + JSON_PRETTY_PRINT);
