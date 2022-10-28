FROM docker.elastic.co/kibana/kibana:8.1.0

ENV ELASTICSEARCH_HOSTS="http://elasticsearch:9200"
ENV ELASTICSEARCH_USERNAME="${KIBANA_ES_USER:-kibana_system_user}"
ENV ELASTICSEARCH_PASSWORD="${KIBANA_ES_PASS:-changeme}"
ENV STATUS_ALLOWANONYMOUS="true"

EXPOSE 5601

COPY ./fleet-server/kibana/kibana.yml /usr/share/kibana/config/kibana.yml

