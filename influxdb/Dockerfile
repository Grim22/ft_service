FROM alpine

RUN apk add --no-cache openrc vim
RUN apk add --no-cache influxdb

COPY start.sh /tmp
RUN chmod +x /tmp/start.sh

ENTRYPOINT [ "/tmp/start.sh" ]

#config file: etc/influxdb.conf
