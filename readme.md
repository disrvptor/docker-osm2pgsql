# docker-osm2pgsql

A Docker image with [osm2pgsql](https://github.com/openstreetmap/osm2pgsql), the tool for importing OpenStreetMap data into a Postgresql database. Intended to be used with [openfirmware/docker-postgres-osm](https://github.com/openfirmware/docker-postgres-osm).

## Build Instructions

Can be built from the Dockerfile:

    # docker build -t disrvptor/osm2pgsql github.com/disrvptor/docker-osm2pgsql.git

This currently builds osm2pgsql for Debian from a specific tag; see the Dockerfile for the specific version. Alternatively, specify the tag and download the image from the Docker Hub.

## Running osm2pgsql

Once the image is built, you can run a single-use container with osm2pgsql. Args will be passed to bash, so you will have access to environment variables in your run command.

    # docker run -it --rm disrvptor/osm2pgsql -c 'osm2pgsql -h'

When used with a postgres-osm container, it can import data directly into the database:

    # docker run -it --rm --link postgres-osm:pg -v ~/osm:/osm disrvptor/osm2pgsql -c 'osm2pgsql --create --slim --cache 2000 --database $PG_ENV_OSM_DB --username $PG_ENV_OSM_USER --host pg --port $PG_PORT_5432_TCP_PORT /osm/extract.osm.pbf'

For more information on running an import, please see TUTORIAL.markdown. If you have a particular scenario in mind, contact me and I will try to create a guide for that situation.

## Related Docker Images

* [Postgres-OSM Image](https://github.com/openfirmware/docker-postgres-osm)
* [Original Image](https://github.com/openfirmware/docker-osm2pgsql)
* [Postgres Image](https://registry.hub.docker.com/_/postgres/)
* [Postgres Image Repo](https://github.com/docker-library/postgres)

