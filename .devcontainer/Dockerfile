# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.238.1/containers/php/.devcontainer/base.Dockerfile

# [Choice] PHP version (use -bullseye variants on local arm64/Apple Silicon): 8, 8.1, 8.0, 7, 7.4, 7.3, 8-bullseye, 8.1-bullseye, 8.0-bullseye, 7-bullseye, 7.4-bullseye, 7.3-bullseye, 8-buster, 8.1-buster, 8.0-buster, 7-buster, 7.4-buster
ARG VARIANT="8.1-apache-bullseye"
FROM mcr.microsoft.com/vscode/devcontainers/php:0-${VARIANT}

# [Choice] Node.js version: none, lts/*, 16, 14, 12, 10
ARG NODE_VERSION="none"
RUN if [ "${NODE_VERSION}" != "none" ]; then su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"; fi

# Install micro
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends micro

# Install PostgreSQL
# Add PostgreSQL GPG key
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# Add PostgreSQL repo
RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

# Install PostgreSQL
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends postgresql-14 postgresql-client-14 postgresql-contrib-14

# Install PostgreSQL PDO driver
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends libpq-dev && docker-php-ext-install pgsql pdo pdo_pgsql

# Run the rest of the commands as the ``postgres`` user created by the ``postgres-14`` package when it was ``apt-get installed``
USER postgres

# Create the databases and users
RUN /etc/init.d/postgresql start && \
    createuser -s vscode && \
    psql --command "CREATE USER grupo27 WITH PASSWORD 'elcañete123';" && \
    psql --command "CREATE USER grupo44 WITH PASSWORD 'thedoors';" && \
    createdb -O grupo27 grupo27e3 && \
    createdb -O grupo44 grupo44e3

# Adjust PostgreSQL configuration so that remote connections to the
# database are possible.
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/14/main/pg_hba.conf

# And add ``listen_addresses`` to ``/etc/postgresql/14/main/postgresql.conf``
RUN echo "listen_addresses='*'" >> /etc/postgresql/14/main/postgresql.conf

# Expose the PostgreSQL port
EXPOSE 5432

# Add VOLUMEs to allow backup of config, logs and databases
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/`var/lib/postgresql"]

# Set the default command to run when starting the container
CMD ["/usr/lib/postgresql/14/bin/postgres", "-D", "/var/lib/postgresql/14/main", "-c", "config_file=/etc/postgresql/14/main/postgresql.conf"]

# Run on startup
USER root

RUN update-rc.d postgresql defaults 95 10
