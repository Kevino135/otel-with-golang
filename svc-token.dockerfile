FROM python:3.9-slim

ENV ELASTICSEARCH_HOST: http://elasticsearch.otel:9200
ENV ELASTICSEARCH_USERNAME: "admin"
ENV ELASTICSEARCH_PASSWORD: "changeme"

COPY ./fleet-server/init-fleet.py /tmp/init-fleet.py
COPY ./ /out

CMD pip install requests && python /tmp/init-fleet.py