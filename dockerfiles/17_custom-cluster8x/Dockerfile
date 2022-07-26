# Certificate generation
FROM docker.elastic.co/elasticsearch/elasticsearch:8.2.2 as init-stage

ADD generate-certs.sh /usr/share/elasticsearch/

USER root
RUN chmod +x /usr/share/elasticsearch/generate-certs.sh
CMD ["/usr/share/elasticsearch/generate-certs.sh"]



# App Docker image
FROM docker.elastic.co/elasticsearch/elasticsearch:8.2.2
COPY --from=init-stage /usr/share/elasticsearch/config/ /usr/share/elasticsearch/config/