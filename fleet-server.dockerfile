FROM docker.elastic.co/beats/elastic-agent:8.1.0

EXPOSE 8220
EXPOSE 8200

ENV FLEET_ELASTICSEARCH_HOST: "http://elasticsearch.otel:9200"
ENV FLEET_SERVER_ENABLE: "1"
ENV FLEET_SERVER_HOST: "0.0.0.0"
ENV FLEET_SERVER_POLICY_ID: "${FLEET_SERVER_POLICY_ID:-fleet-server-apm-policy}"
ENV FLEET_SERVER_PORT: "8220"
ENV KIBANA_FLEET_HOST: "http://kibanaa.otel:5601"
ENV KIBANA_FLEET_SETUP: "1"
ENV FLEET_SERVER_INSECURE_HTTP: "1"
ENV FLEET_SERVER_ELASTICSEARCH_INSECURE: "1"

COPY ./environment /usr/share/elastic-agent/.bash_profile

ENTRYPOINT ["/bin/bash", "-l", "-c", "export && elastic-agent container -d *"]