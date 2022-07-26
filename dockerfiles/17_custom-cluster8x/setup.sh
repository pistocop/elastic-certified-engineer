#!/bin/bash

set -x

# es01
docker exec -u elasticsearch 17_custom-cluster8x_es01_1 mkdir -p /usr/share/elasticsearch/config/certs/ca/
docker exec -u elasticsearch 17_custom-cluster8x_es01_1 mkdir -p /usr/share/elasticsearch/config/certs/es01/

docker cp ./mycert/certs/ca/ca.crt 17_custom-cluster8x_es01_1:/usr/share/elasticsearch/config/certs/ca/
docker cp ./mycert/certs/es01 17_custom-cluster8x_es01_1:/usr/share/elasticsearch/config/certs/

docker exec -u root 17_custom-cluster8x_es01_1 chown -R root:elasticsearch /usr/share/elasticsearch/config/certs;
docker exec -u root 17_custom-cluster8x_es01_1 find /usr/share/elasticsearch/config/certs -type d -exec chmod 750 \{\} \;;
docker exec -u root 17_custom-cluster8x_es01_1 find /usr/share/elasticsearch/config/certs -type f -exec chmod 640 \{\} \;;


# es02
docker exec -u elasticsearch 17_custom-cluster8x_es02_1 mkdir -p /usr/share/elasticsearch/config/certs/ca/
docker exec -u elasticsearch 17_custom-cluster8x_es02_1 mkdir -p /usr/share/elasticsearch/config/certs/es02/

docker cp ./mycert/certs/ca/ca.crt 17_custom-cluster8x_es02_1:/usr/share/elasticsearch/config/certs/ca/
docker cp ./mycert/certs/es02 17_custom-cluster8x_es02_1:/usr/share/elasticsearch/config/certs/

docker exec -u root 17_custom-cluster8x_es02_1 chown -R root:elasticsearch /usr/share/elasticsearch/config/certs;
docker exec -u root 17_custom-cluster8x_es02_1 find /usr/share/elasticsearch/config/certs -type d -exec chmod 750 \{\} \;;
docker exec -u root 17_custom-cluster8x_es02_1 find /usr/share/elasticsearch/config/certs -type f -exec chmod 640 \{\} \;;


# es03
docker exec -u elasticsearch 17_custom-cluster8x_es03_1 mkdir -p /usr/share/elasticsearch/config/certs/ca/
docker exec -u elasticsearch 17_custom-cluster8x_es03_1 mkdir -p /usr/share/elasticsearch/config/certs/es03/

docker cp ./mycert/certs/ca/ca.crt 17_custom-cluster8x_es03_1:/usr/share/elasticsearch/config/certs/ca/
docker cp ./mycert/certs/es03 17_custom-cluster8x_es03_1:/usr/share/elasticsearch/config/certs/
                                                
docker exec -u root 17_custom-cluster8x_es03_1 chown -R root:elasticsearch /usr/share/elasticsearch/config/certs;
docker exec -u root 17_custom-cluster8x_es03_1 find /usr/share/elasticsearch/config/certs -type d -exec chmod 750 \{\} \;;
docker exec -u root 17_custom-cluster8x_es03_1 find /usr/share/elasticsearch/config/certs -type f -exec chmod 640 \{\} \;;
