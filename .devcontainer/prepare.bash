#!/usr/bin/env bash

# Start Postgres
sudo service postgresql start
# Load database tables from dumps
psql -d grupo27e3 -f dumps/grupo27.sql
psql -d grupo44e3 -f dumps/grupo44.sql
# Load stored functions
psql -d grupo27e3 -f functions/drop_all_functions.sql
psql -d grupo27e3 -f functions/generate_reservation.sql
psql -d grupo27e3 -f functions/generate_ticket.sql
psql -d grupo27e3 -f functions/has_schedule_conflict.sql
psql -d grupo27e3 -f functions/is_passport_valid.sql
psql -d grupo27e3 -f functions/import_users.sql
# Patch broken serial generation of IDs
psql -d grupo27e3 -f functions/patch_serial.sql

# Composer install
cd site/ && composer install && cd ../

# Stop Postgres
sudo service postgresql stop

# Link web server files
sudo chmod a+x "$(pwd)/site" && sudo rm -rf /var/www/html && sudo ln -s "$(pwd)/site" /var/www/html
