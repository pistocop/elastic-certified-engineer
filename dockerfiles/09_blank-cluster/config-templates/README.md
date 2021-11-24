- Because change the `elasticsearch.yml` and `kibana.yml` files from a container change also the original file [1], we provide here the original configurations:
  - 3 nodes with 1 master (`es01`)


Note:
- [1] Copy file from host into container using docker-compose isn't implemented (yet), see:<br>
    - https://github.com/docker/compose/issues/5523