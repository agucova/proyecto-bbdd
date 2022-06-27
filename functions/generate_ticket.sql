create or replace function random_ticket_class()
returns varchar(20) as $$
declare
    n integer;
begin
    n := (SELECT floor(random() * 3 + 1)::int);
    IF n = 1 THEN
        return 'Ejecutiva';
    ELSIF n = 2 THEN
        return 'Economica';
    ELSE
        return 'Primera clase';
    END IF;
end;
$$ language plpgsql;

create or replace function generate_ticket(
    id_vuelo_ticket integer,
    id_reserva_ticket integer,
    pasaporte_pasajero varchar(40)
) returns void as $$

declare
    id_pasajero integer;
    id_ticket integer;
    asiento_ticket integer;
    clase varchar(20);
    comida_y_maleta boolean;
    contador integer;
    ticket RECORD;
    ticket_valido boolean := FALSE;

begin

    -- Encontrar id del pasajero
    id_pasajero := (SELECT id FROM pasajero WHERE pasaporte = pasaporte_pasajero);

    -- Setear id_ticket al maximo id + 1
    id_ticket := (SELECT MAX(id) FROM ticket) + 1;
    
    clase := (SELECT random_ticket_class());

    comida_y_maleta := (SELECT floor(random() * 2)::int);

    -- Buscar asiento vacio
    FOR contador IN 1..32
    LOOP
        IF EXISTS (SELECT id
                        FROM ticket
                        WHERE id_vuelo = id_vuelo_ticket
                        AND asiento = contador
                ) THEN
            INSERT INTO ticket(id, id_vuelo, id_reserva, id_pasajero, asiento, clase, comida_y_maleta)
            VALUES(id_ticket, id_vuelo_ticket, id_reserva_ticket, id_pasajero, contador, clase, comida_y_maleta);
            ticket_valido := TRUE;
        END IF;
    END LOOP;

    -- Si no hay asientos vacios entre el 1 y el 32, creamos un asiento
    -- extra para que el programa no falle
    IF NOT ticket_valido THEN
        asiento_ticket := (SELECT MAX(asiento) FROM ticket) + 1;
        INSERT INTO ticket(id, id_vuelo, id_reserva, id_pasajero, asiento, clase, comida_y_maleta)
            VALUES(id_ticket, id_vuelo_ticket, id_reserva_ticket, id_pasajero, asiento_ticket, clase, comida_y_maleta);
    END IF;
end;
$$ language plpgsql;