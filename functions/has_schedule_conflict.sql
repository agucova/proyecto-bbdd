create or replace function has_schedule_conflict(
    pasaporte_pasajero varchar(40),
    id_vuelo integer
) returns boolean as $$

declare
    fecha_salida_vuelo timestamptz(6);
    fecha_llegada_vuelo timestamptz(6);
begin
    fecha_salida_vuelo := (SELECT fecha_salida FROM vuelo WHERE id = id_vuelo);
    fecha_llegada_vuelo := (SELECT fecha_llegada FROM vuelo WHERE id = id_vuelo);

    
    IF EXISTS (SELECT *
                FROM ticket
                    JOIN pasajero ON ticket.id_pasajero = pasajero.id
                    JOIN vuelo ON ticket.id_vuelo = vuelo.id
                WHERE pasajero.pasaporte = pasaporte_pasajero
                    AND (vuelo.fecha_salida <= fecha_salida_vuelo)
                    AND (vuelo.fecha_llegada >= fecha_llegada_vuelo)
                LIMIT 1) THEN
        return TRUE;
    ELSE
        return FALSE;
    END IF;
end;
$$ language plpgsql;