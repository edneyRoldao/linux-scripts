#!/bin/bash

echo "creating an ssh tunel to connect to abasteceai dev database"
docker run --rm -it -p 3309:3306 -v ~/workspace/abasteceai/files/:/external alpine /bin/sh -c "apk update && apk add openssh && ssh -f ubuntu@54.197.93.196 -L 0.0.0.0:3306:db.microservices.eai.services.dev:3306 -N -i /external/eai-bifrost-dev.pem && read"
