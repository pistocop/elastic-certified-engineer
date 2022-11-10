# 19_cluster8x-nginx
> deploy Elasticsearch v8.X locally with certificates generation and injection

## Usage
- run `scripts/certgen-launcher.sh` to generate the certificates
- start the docker-composer
- Test the nginx ingress:
  - ```
    $ curl -XGET -u elastic:changeme http://localhost:80/es/
    {
      "name" : "es01",
      "cluster_name" : "docker-custom-cluster",
      ...
    
    $ curl -XGET -u elastic:changeme http://localhost:80/es/_cat/nodes
    172.24.0.2 25 89 31 3.38 2.19 1.28 cdfhilmrstw - es01
    172.24.0.4 16 87 33 3.38 2.19 1.28 cdfhilmrstw * es02
    172.24.0.5 25 87 31 3.38 2.19 1.28 cdfhilmrstw - es03  

    $ curl -XGET -u elastic:wrongpsw http://localhost:80/es/_cat/nodes
    {"error":{"root_cause":[{"type":"security_exception","reason":"unable to authenticate user [elastic] for REST request [/_cat/nodes]","header":{"WWW-Authenticate":["Basic realm=\"security\" charset=\"UTF-8\"","Bearer realm=\"security\"","ApiKey"]}}],"type":"security_exception","reason":"unable to authenticate user [elastic] for REST request [/_cat/nodes]","header":{"WWW-Authenticate":["Basic realm=\"security\" charset=\"UTF-8\"","Bearer realm=\"security\"","ApiKey"]}},"status":401}

    $ curl -XGET -u wrtongusr:changeme http://localhost:80/es/_cat/nodes
    {"error":{"root_cause":[{"type":"security_exception","reason":"unable to authenticate user [wrtongusr] for REST request [/_cat/nodes]","header":{"WWW-Authenticate":["Basic realm=\"security\" charset=\"UTF-8\"","Bearer realm=\"security\"","ApiKey"]}}],"type":"security_exception","reason":"unable to authenticate user [wrtongusr] for REST request [/_cat/nodes]","header":{"WWW-Authenticate":["Basic realm=\"security\" charset=\"UTF-8\"","Bearer realm=\"security\"","ApiKey"]}},"status":401}

    ```

## TODO
**High**
- [x] currently we have the following error, fix it:
  
  ```
  $ curl -XGET --cacert ./certs/ca/ca.crt -u elastic:changeme https://localhost:80/es/_cat/nodes
  > 

  # See the docker-compose logs:
  [...] 
  received plaintext http traffic on an https channel, closing connection
  [...] 
  ```
  - Fixed with this configuration: `proxy_pass https://es01:9200/;`

- [x] enable https connection to nginx
  - Documentation for nginx SSL: https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-16-04
    - WARNING: this cluster will be not tailored for strong security (e.g. no *strong Diffie-Hellman group*) - not all steps of the guide will be followed
- [ ] nginx build process require `certs` folder into `nginx` folder, how cope with it? how manage the folders scaffolding?
- [ ] make the program completed and automated
  - is possible to make the request with:
    - ```
      $ curl -XGET -k -u elastic:changeme --cacert /etc/ssl/certs/nginx-selfsigned.crt https://localhost/es/_cat/nodes
      ```
    - Build nginx with the certificates inside
- [ ] is possible to remove the `-k` for unsecure?
	- Try with generate the certificate with nginx host name?


**Low**
- [ ] use all security parameters
- [ ] How is possible that nginx make the connection in HTTPS without the correct certificate?
  - Use this configuration:
    ```
    # nginx.conf
    events {

    }

    http {
        server {
            listen 80;
            location /es/ {
                proxy_pass https://es01:9200/;
            }
        }
    }
    ```
