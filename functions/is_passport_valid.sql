create or replace function is_passport_valid(
    input_passport varchar(40)
) returns boolean as $$

declare
    pasajero RECORD;
    is_valid boolean;

begin
    SELECT * INTO pasajero FROM pasajero WHERE pasaporte = input_passport LIMIT 1;
    IF pasajero IS NULL THEN
        return FALSE;
    ELSE
        return TRUE;
    END IF;
end;
$$ language plpgsql