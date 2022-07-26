# 16_cluster8x
> Cluster from original documentation:
> https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#_prepare_the_environment


## Notes
- (?) Problem: the [documentation](https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#_prepare_the_environment) sey certificate is under `es01:/usr/share/elasticsearch/config/certs/http_ca.crt .`
  - But actually it is under `curl --cacert /usr/share/elasticsearch/config/certs/ca/ca.crt -u elastic https://localhost:9200`