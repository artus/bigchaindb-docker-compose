#!/bin/bash

# Artus Vranken

if [ -f $HOME/bigchaindb_docker/.bigchaindb ]; then
	echo "Configuration already exists, skipping..."
else
	echo "Configuring bigchaindb-mongodb..."
	docker run -it --rm -v $HOME/bigchaindb_docker:/data --env BIGCHAINDB_DATABASE_HOST=172.17.0.1 artusvranken/alpine-bigchaindb -y configure mongodb
fi

echo "Done, starting up docker-compose..."

docker-compose up -d

docker-compose ps
