#!/bin/bash
docker kill $(docker ps -q)
docker build -t hub714/modwsgi .
docker run -d -i -p 80:80 hub714/modwsgi
CONID=$(docker ps | grep modwsgi | awk '{print $1}')
docker exec -it $CONID /bin/bash
