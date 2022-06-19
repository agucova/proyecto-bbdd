-- Funcion para generar un string random de cierto largo
create or replace function random_string(length integer) returns text as
$$
declare
    chars text[] := '{0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z}';
    result text := '';
    i integer := 0;
begin
    if length < 0 then
        raise exception 'Given length cannot be less than 0';
    end if;
    for i in 1..length loop
        result := result || chars[1+random()*(array_length(chars, 1)-1)];
    end loop;
    return result;
end;
$$ language plpgsql;

-- Function para generar contraseñas de pasajero combinando
-- nombre, pasaporte y un string random de la funcion random_string
create or replace function random_passenger_password(
    nombre varchar(150),
    pasaporte varchar(150)
) returns varchar(300) as $$
declare
    random_string_result text;
    slugified_name text;
begin
    random_string_result := random_string(5);
    -- Eliminamos espacios en blanco y los guiones
    slugified_name := lower(replace(nombre, ' ', '_'));
    return slugified_name || '_' || pasaporte || '_' || random_string_result;
end;
$$ language plpgsql;


create or replace function import_users()
returns void AS $$
declare
    fila record;
begin
-- Crear Usuario DGAC
if (select id from usuario WHERE nombre = 'DGAC' limit 1) is NULL then
    insert into usuario(nombre, clave, tipo) values('DGAC', 'admin', 'admin_dgac');
end if;

-- Crear usuarios de las compañías aéreas
for fila in (select * from aerolinea)
loop
    if (select id from usuario WHERE nombre = fila.codigo limit 1) is NULL then
        insert into usuario(nombre, clave, tipo) values(fila.codigo, random_string(10), 'compañia_aerea');
    end if;
end loop;

-- Crear usuarios de pasajeros
for fila in (select * from pasajero)
loop
    if (select id from usuario WHERE nombre = fila.pasaporte limit 1) is NULL then
        insert into usuario(nombre, clave, tipo) values(fila.pasaporte, random_passenger_password(fila.nombre, fila.pasaporte), 'pasajero');
    end if;
end loop;

end;
$$ language plpgsql;
