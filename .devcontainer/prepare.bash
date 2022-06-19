#!/usr/bin/env bash
# Bash Strict mode
set -euo pipefail
IFS=$'\n\t'

# Start Postgres
sudo service postgresql start
# Load database tables from dumps
psql -d grupo27e3 -f dumps/grupo27.sql
psql -d grupo44e3 -f dumps/grupo44.sql
# Load stored functions
psql -d grupo27e3 -f functions/import_users.sql

# Composer install
cd site/ && composer install && cd ../

# Stop Postgres
sudo service postgresql stop

# Link web server files
sudo chmod a+x "$(pwd)/site" && sudo rm -rf /var/www/html && sudo ln -s "$(pwd)/site" /var/www/html
