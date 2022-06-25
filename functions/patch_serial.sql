BEGIN;
	SELECT setval('aerodromo_id_seq', (SELECT MAX(id) FROM aerodromo));
    SELECT setval('aerolinea_id_seq', (SELECT MAX(id) FROM aerolinea));
    SELECT setval('avion_id_seq', (SELECT MAX(id) FROM avion));
    SELECT setval('pais_id_seq', (SELECT MAX(id) FROM pais));
    SELECT setval('ruta_id_seq', (SELECT MAX(id) FROM ruta));
    SELECT setval('trabajador_id_seq', (SELECT MAX(id) FROM trabajador));
    SELECT setval('vuelo_id_seq', (SELECT MAX(id) FROM vuelo));
END;