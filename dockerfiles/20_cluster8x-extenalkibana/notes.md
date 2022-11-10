# 
> Cluster

## Guide
- Generate certificates: `bash scripts/certgen-launcher.sh`
- Run the cluster: `docker-compose up`
- Test cluster is online: `curl -k --cacert ./certs/ca/ca.crt -u elastic:changeme https://localhost:9200/_cat/nodes\?v`


## Notes
- Set `xpack.security.enrollment.enabled`