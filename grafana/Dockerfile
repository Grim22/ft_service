FROM alpine:latest

RUN apk add --no-cache libc6-compat

RUN wget https://dl.grafana.com/oss/release/grafana-7.0.1.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.0.1.linux-amd64.tar.gz \
&& rm grafana-7.0.1.linux-amd64.tar.gz

COPY defaults.ini /grafana-7.0.1/conf
# COPY ./grafana.db ./grafana-7.0.1/data/

COPY start.sh /usr/local/bin/
COPY datasources.yml /grafana-7.0.1/conf/provisioning/datasources/
COPY dashboards.yaml /grafana-7.0.1/conf/provisioning/dashboards/
COPY docker-dashboard.json /grafana-7.0.1/data/

RUN chmod +x /usr/local/bin/start.sh

EXPOSE 3000

ENTRYPOINT ["start.sh"]