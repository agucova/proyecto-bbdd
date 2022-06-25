create or replace function random_ticket_class()
returns varchar(20) as $$

declare
    n integer;
begin
    n := SELECT floor(random() * 3 + 1)::int;
    IF n = 1 THEN
        return 'Ejecutiva';
    ELSE IF n = 2 THEN
        return 'Economica';
    ELSE
        return 'Primera clase';
    END IF;
end;
$$ language plpgsql;

create or replace function generate_ticket(
    id_vuelo integer,
    id_reserva integer,
    id_pasajero integer
) returns void as $$

declare
    id_ticket integer;
    asiento integer;
    clase varchar(20);
    comida_y_maleta boolean;
    contador integer;
    ticket RECORD;
    ticket_valido boolean := FALSE;

begin

    -- Setear id_ticket al maximo id + 1
    id_ticket := (SELECT MAX(id) FROM ticket) + 1;
    
    clase := random_ticket_class();

    comida_y_maleta := (SELECT floor(random() * 2)::int);

    -- Buscar asiento vacio
    for contador IN 1..32
    LOOP
        SELECT * INTO ticket FROM ticket WHERE id_vuelo = id_vuelo AND asiento = contador;
        IF ticket IS NULL THEN
            INSERT INTO ticket(id, id_vuelo, id_reserva, id_pasajero, asiento, clase, comida_y_maleta)
            VALUES(id_ticket, id_vuelo, id_reserva, id_pasajero, contador, clase, comida_y_maleta);
            ticket_valido := TRUE
        END IF;
    END LOOP;

    -- Si no hay asientos vacios entre el 1 y el 32, creamos un asiento
    -- extra para que el programa no falle
    IF NOT ticket_valido THEN
        asiento := (SELECT MAX(asiento) FROM ticket) + 1;
        INSERT INTO ticket(id, id_vuelo, id_reserva, id_pasajero, asiento, clase, comida_y_maleta)
            VALUES(id_ticket, id_vuelo, id_reserva, id_pasajero, asiento, clase, comida_y_maleta);
    END IF;
end;
$$ language plpgsql