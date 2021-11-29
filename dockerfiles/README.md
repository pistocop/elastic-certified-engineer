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
- `01_single-node`
  - 1 node, 1 kibana - useful for fast test
- `02_multiple-nodes`
  - 5 nodes, 1 kibana
- `03_hot-warm-cold`
  - 3 nodes with custom roles, 1 kibana - useful to test the shard temperature management
- `04_snapshots-locals`
  - 3 nodes with custom roles and local folder mounted for snapshots, 1 kibana - useful to test backup system
- `05_multicluster`
  - 3 nodes divided in 2 clusters, 2 kibana (one for each cluster), 2 networks with one node (c1n1) that is on both the networks - useful to test how manually connect a remote cluster
- `06_multicluster-configured`
  - 3 nodes divided in 2 clusters already connected, 2 kibana (one for each cluster), 1 network - useful to test cross-cluster queries
  - Tip: notice the `depends_on` parameter on the `docker-compose.yml` file
- `07_autorun_disabled`
  - 1 Kibana, 2 nodes: 1 is executed as master, the 2nd run without launch Elasticsearch - useful to stop and rerun ES instances
- `08_autorun-disabled-3nodes`
  - Same as `07_autorun_disabled` but with two nodes that doesn't launch Elasticsearch automatically - useful for test shard allocation
- `09_blank-cluster`
  - 1 Kibana, 3 nodes: cluster where each node don't automatically start it's service - useful to try and test different settings
- `10_cross-cluster`
  - 3 kibana, 4 nodes, 3 networks with `es01` that is on all the networks, 3 clusters, `es03m` and `es03d` autorun disabled - useful to test a cross cluster environment
- `11_blank-minicluster`
  - 1 kibana, 2 nodes, autorun disabled on ES nodes - useful to settings test (e.g. security)