#!/bin/bash

# Generate the certificates that will be injected into the cluster.
# The steps are taked from official documentation: https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#docker-file

set -x

# TODO complete next cmd
# docker run --rm -u root --name es-cert-gen -v $(pwd)/:/usr/share/elasticsearch/mount/ --entrypoint mount/certificate-gen.sh docker.elastic.co/elasticsearch/elasticsearch:8.2.2
echo "hello!"