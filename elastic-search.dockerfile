FROM docker.elastic.co/elasticsearch/elasticsearch:8.1.0

EXPOSE 9200

ENV ES_JAVA_OPTS="-Xms1g -Xmx1g"
ENV network.host=
ENV transport.host=127.0.0.1
ENV http.host=0.0.0.0
ENV cluster.routing.allocation.disk.threshold_enabled=false
ENV discovery.type=single-node
ENV xpack.security.authc.anonymous.roles=remote_monitoring_collector
ENV xpack.security.authc.realms.file.file1.order=0
ENV xpack.security.authc.realms.native.native1.order=1
ENV xpack.security.enabled=true
ENV xpack.license.self_generated.type=trial
ENV xpack.security.authc.token.enabled=true
ENV xpack.security.authc.api_key.enabled=true
ENV logger.org.elasticsearch=${ES_LOG_LEVEL:-error}
ENV action.destructive_requires_name=false

COPY ./fleet-server/elasticsearch/roles.yml /usr/share/elasticsearch/config/roles.yml
COPY ./fleet-server/elasticsearch/users /usr/share/elasticsearch/config/users
COPY ./fleet-server/elasticsearch/users_roles /usr/share/elasticsearch/config/users_roles

