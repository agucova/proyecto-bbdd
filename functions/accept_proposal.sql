create or replace function accept_proposal(id_propuesta integer)
returns record as $$

declare
    propuesta record;
    vuelo record;
begin

    -- Actualizar estado de la propuesta
    update fpl_propuesta set estado = 'aceptado' where propuesta_vuelo_id = id_propuesta;

    -- Actualizar estado del vuelo
    update fpl set estado = 'aceptado' where "FPL_Propuesta.propuesta_vuelo_id" = id_propuesta;

    vuelo := (select * from fpl where "FPL_Propuesta.propuesta_vuelo_id" = id_propuesta);

    return vuelo;
end;
$$ language plpgsql;
