create type tipo_usuario as enum ('admin_dgac', 'compañia_aerea', 'pasajero');

BEGIN;
drop table if exists usuario;
create table usuario (
    id integer primary key generated always as identity,
    nombre varchar(150) not null,
    clave varchar(300) not null,
    tipo tipo_usuario not null
);
END;
