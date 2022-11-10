#!/usr/bin/env bash

# Kibana configuration:
# https://www.elastic.co/guide/en/kibana/current/settings.html

# docker run --rm --name kib-01 -p 5601:5601 \
#             -e ELASTICSEARCH_SEARCH=https://localhost:9200 \
#             -e elasticsearch.username=kibana_system \
#             -e elasticsearch.password=changeme \
#             -e elasticsearch.ssl.verificationMode=none \
#             docker.elastic.co/kibana/kibana:8.5.0

docker run --rm --name kib-01 -p 5601:5601 \
            -e ELASTICSEARCH_SEARCH=https://localhost:9200 \
            -e elasticsearch.username=kibana_system \
            -e elasticsearch.password=changeme \
            -e elasticsearch.ssl.verificationMode=none \
            docker.elastic.co/kibana/kibana:8.5.0

