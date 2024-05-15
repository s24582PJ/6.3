#!/bin/bash

network_name="my-network"

if [ ! "$(docker network ls | grep $network_name)" ]; then
  docker network create $network_name
fi

docker build -t my-postgres-db ./db

docker run --name my-postgres \
  --network=$network_name \
  -v "$(pwd)/db/data:/var/lib/postgresql/data" \
  -d my-postgres-db

cd app
docker build -t my-express-app .
docker run --name my-express-app-container --network=$network_name -p 3000:3000 -d my-express-app
cd ..

cd tests
docker build -t my-app-tests .
docker run --name my-app-tests-container --network=$network_name my-app-tests
cd ..
