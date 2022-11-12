# 
> ES cluster with TSL security and Kibana connection from outside the ES cluster

## Warning
- [!] currently blocked on this error: " SSL configuration Keystore doesn't contain any PrivateKey entries where the associated certificate is a CA certificate"
    - Wait this issue will be resolved: https://github.com/elastic/elasticsearch/issues/89017

## Guide
- Generate certificates: `bash scripts/certgen-launcher.sh`
- Run the cluster: `docker-compose up`
- Test cluster is online: `curl -k --cacert ./certs/ca/ca.crt -u elastic:changeme https://localhost:9200/_cat/nodes\?v`
- Generate the Kibana token:
    ```
    $ docker exec -it 20_cluster8x-extenalkibana_es01_1 /bin/sh
    $ bin/elasticsearch-create-enrollment-token -s kibana
    ERROR: Unable to create an enrollment token. Elasticsearch node HTTP layer SSL configuration Keystore doesn't contain any PrivateKey entries where the associated certificate is a CA certificate
    ```
- Run the Kibana service: `bash scripts/kibana-run.sh`


## Notes
-