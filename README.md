# Tips on Elastic Certified Engineer Exam

![outline full mapping](./artwork/outline.png)

Relationships among `Elastic Training Lessons`, `Elastic Exam Objectives`, and `Elastic Docs`

## Presentations
[📝 Tips on Elastic Certified Engineer Exam (Chinese Version)](Tips%20on%20Elastic%20Certified%20Engineer%20Exam%20-%20CN.pdf)

[📝 Tips on Elastic Certified Engineer Exam (English Version)](Tips%20on%20Elastic%20Certified%20Engineer%20Exam%20-%20EN.pdf)

## Self-Learning Path
[📝 Reorder Exam Objectives (XLSX Version)](./outline/outline.xlsx)

[📝 Reorder Exam Objectives (PDF Version)](./outline/outline.pdf)
## Docker Environments

| File                        | Description
| ---                         | --
| `single_node.yml`           | simple node env
| `node_role.yml `            | cluster and node role env
| `elastic_security.yml`      | elastic stack security env
| `backup_and_recovery.yml`   | backup and recovery env
| `cross_cluster_search.yml`  | cross cluster search env
| `shard_allocation.yml`      | shard allocation env

## How to Use

Startup a testing environment in foreground:

```
docker-compose -f your_config_file.yml up
```

Or Startup a testing environment in background:

```
docker-compose -f your_config_file.yml up -d
```

Shutdown a testing environment:

```
docker-compose -f your_config_file.yml down
```
Or Shutdown a test environment and delete all data:

```
docker-compose -f your_config_file.yml down -v
```

### Common issues
- Error `bootstrap check failure [1] of [1]: max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]
  - Increase the virtual memory areas - 🔗[stackoverflow](https://stackoverflow.com/a/51448773):
    ```
        # Change for current session: 
        $ sysctl -w vm.max_map_count=262144

        # Tip: modify the /etc/sysctl.conf for permanent changes
    ```
  - Official Elasticsearch tutorial - [docs](https://www.elastic.co/guide/en/elasticsearch/reference/7.13/docker.html#docker-compose-file)

- Error `ERROR: for <node_name>  Cannot create container for service <node_name>: not a directory`
  - You are probably on WSL: reboot your pc, prune (`docker volume prune`) the volumes and try again
- Error `FileNotFoundError: [Errno 2] No such file or directory` 
  - If you are on WSL and have just added a new volume:
    - Cut the container section that use the volume, but keep the volume creation
    - Run the docker-compose command
    - Paste the container section again
    - Run the docker-compose command
  - If you are on WSL and you are sure the code is correct:
    - Restart the docker desktop app
    - Close all WSL window instances
    - Reopen a WSL and clear all containers and volumes
    - Try again

## TODO
- [x] Review `rerun` script with teardown resources after `ctrl + c` exit command
