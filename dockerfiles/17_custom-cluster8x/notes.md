# 17_custom-cluster8x
> Hacking around to learn how certificate and security work on elasticsearch 8.x


## Takeaways
- Elasticsearch password must be > 8 characters
- We can create the certificates externally and the inject them
  - The certificate creation could be done using a yml file as input
  - The certificates should be copied on specific folders reported on ENV variables, different per pod
  - [!] The problem is "be sure" on how the permissions and owners are set for those files
- The `elastic` password is set using the environment variables
- How create the certificates? follow the steps under "setup" phase of the [official docker-compose](https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#_prepare_the_environment)

## Problem
- [ ] currently the cluster start with problems on the elastic password,
    - the certificates are correctly set because if we reset the password, the system correctly work
    - Warning: looks like we have bad permission configurated
      - ```
        elasticsearch@5fbc7b5c3754:~$ bin/elasticsearch-reset-password -u elastic
        WARNING: Owner of file [/usr/share/elasticsearch/config/users] used to be [root], but now is [elasticsearch]
        WARNING: Owner of file [/usr/share/elasticsearch/config/users_roles] used to be [root], but now is [elasticsearch]
        ```