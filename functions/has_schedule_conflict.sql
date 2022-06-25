create or replace function has_schedule_conflict(
    id_pasajero integer,
    fecha_salida timestamptz(6),
    fecha_llegada timestamptz(6)
) returns boolean as $$

declare
    ticket RECORD;
    vuelo RECORD;
begin
    for ticket IN (SELECT * FROM ticket WHERE id_pasajero = id_pasajero)
    LOOP
        vuelo := (SELECT * FROM vuelo WHERE id = fila.id_vuelo)
        IF (vuelo.fecha_salida <= fecha_llegada && vuelo.fecha_llegada >= fecha_salida) THEN
            return TRUE;
        END IF;
    END LOOP;
    return FALSE;

end;
$$ language plpgsql