FROM python:3.9-slim

ENV ELASTICSEARCH_HOST: http://elasticsearch:9200
ENV ELASTICSEARCH_USERNAME: "${KIBANA_ES_USER:-admin}"
ENV ELASTICSEARCH_PASSWORD: "${KIBANA_ES_PASS:-changeme}"

COPY ./fleet-server/init-fleet.py /tmp/init-fleet.py
COPY ./ /out

CMD pip install requests && python /tmp/init-fleet.py