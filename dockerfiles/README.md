# Different ES architecture 
> Useful to study each characteristic of a ES cluster

**How to use**
- Run your docker daemon (e.g. on Windows: docker desktop app)
- Navigate with the CLI (e.g. on Windows: using the WSL) inside the folder of desired architecture
- Execute the cluster
  ```
    # [Tip] if you are on WSL:
    $ sudo sysctl -w vm.max_map_count=262144 # <-- required

    # Simple way
    $ bash rerun

    # Using docker-compose
    $ docker-compose up --build --force-recreate
    $ docker-compose down -v --remove-orphans
  ``` 

**Clusters**
- `single-node`
  - 1 node, 1 kibana - useful for fast test
- `multiple-nodes`
  - 5 nodes, 1 kibana
- `hot-warm-cold`
  - 3 nodes with custom roles, 1 kibana - useful to test the shard temperature management
- `snapshots-locals`
  - 3 nodes with custom roles and local folder mounted for snapshots, 1 kibana - useful to test backup system
- `multicluster`
  - 3 nodes divided in 2 clusters, 2 kibana (one for each cluster) - useful to test how manually connect a remote cluster
- `multicluster-configured`
  - 3 nodes divided in 2 clusters and already connected, 2 kibana (one for each cluster) - useful to test cross-cluster queries