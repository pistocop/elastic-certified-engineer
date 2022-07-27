# 17_custom-cluster8x
> Hacking around to learn how certificate and security work on elasticsearch 8.x

## Usage
- 

## Takeaways
- Elasticsearch password must be > 8 characters
- We can create the certificates externally and the inject them
  - The certificate creation could be done using a yml file as input
  - The certificates should be copied on specific folders reported on ENV variables, different per pod
  - [!] The problem is "be sure" on how the permissions and owners are set for those files
- The `elastic` password is set using the environment variables
- How create the certificates? follow the steps under "setup" phase of the [official docker-compose](https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#_prepare_the_environment)
- The `mycert/instances.yml` file is used by the 

## Problem
- [x] currently the cluster start with problems on the elastic password,
    - the certificates are correctly set because if we reset the password, the system correctly work
    - Warning: looks like we have bad permission configurated
      - ```
        elasticsearch@5fbc7b5c3754:~$ bin/elasticsearch-reset-password -u elastic
        WARNING: Owner of file [/usr/share/elasticsearch/config/users] used to be [root], but now is [elasticsearch]
        WARNING: Owner of file [/usr/share/elasticsearch/config/users_roles] used to be [root], but now is [elasticsearch]
        ```
  - Solution: the issue is due for the overwrite of Docker entrypoint, so launch Elasticsearch using `bash /usr/local/bin/docker-entrypoint.sh`
    - Notes:
      - If you run ES using `bash bin/elasticsearch` the code that set the default password from the environment variable isn't ran
    - For more information about the entrypoint bash script - [link](https://github.com/elastic/dockerfiles/blob/13fa45ddac4581d19f9276a0f194c6618e7934c6/elasticsearch/bin/docker-entrypoint.sh#L42)
    - The launcher use the `elasticsearch-keystore` program, official [doc](https://www.elastic.co/guide/en/elasticsearch/reference/current/elasticsearch-keystore.html)
  