create or replace function generate_reservation(
    id_vuelo integer,
    id_reservante integer
) returns integer as $$

declare 
    codigo_vuelo varchar(20);
    id_reserva integer;
    codigo_reserva bpchar(12);

begin
    SELECT codigo INTO codigo_vuelo FROM vuelo WHERE id = id_vuelo LIMIT 1;
    id_reserva := (SELECT MAX(id) FROM reserva) + 1;
    codigo_reserva := CONCAT_WS('-', codigo_vuelo, id_reserva);
    INSERT INTO reserva(id, codigo, id_reservante) VALUES(id_reserva, codigo_reserva, id_reservante);
    RETURN id_reserva;
end;
$$ language plpgsql