create or replace function update_proposal(id_propuesta integer)
returns void as $$

declare
    -- propuesta record;
    -- vuelo record;
    update_statement TEXT;
    res TEXT;
    v_state   TEXT;
    v_msg     TEXT;
    v_detail  TEXT;
    v_hint    TEXT;
    v_context TEXT;
begin
    -- Conexión con dblink
    -- PERFORM dblink_connect('db27', 'dbname=grupo27e3 user=grupo27 password=elcañete123');
    PERFORM dblink_connect('db44', 'dbname=grupo44e3 user=grupo44 password=thedoors');

    -- Actualizar estado de la propuesta
    update_statement = 'update fpl_propuesta set estado = '''||aceptado||''' where propuesta_vuelo_id = '||id_propuesta||';';
    res := dblink_exec('db44', update_statement, true);
    RAISE INFO '%', res;
    PERFORM dblink_disconnect('db44');

    -- CÓDIGO AYUDANTIA
exception when others then -- Esta línea captura el error
     SELECT dblink_disconnect('db44'); -- Cerramos la conexión
    -- A continuación obtenemos el diagnóstico más detallado del posible error y mostramos en consola la información más relevante del mismo --
    get stacked diagnostics
        v_state   = returned_sqlstate,
        -- v_msg     = message_text,
        v_detail  = pg_exception_detail,
        v_hint    = pg_exception_hint,
        v_context = pg_exception_context;

    raise notice E'Got exception:
        state  : %
        detail : %
        hint   : %
        context: %', v_state, v_detail, v_hint, v_context;

    raise notice E'Got exception:
        SQLSTATE: % 
        SQLERRM: %', SQLSTATE, SQLERRM;     

    -- raise notice '%', message_text;
--


-- -- Actualizar estado del vuelo
-- update fpl set estado = 'aceptado' where "FPL_Propuesta.propuesta_vuelo_id" = id_propuesta;
end;
$$ language plpgsql;
