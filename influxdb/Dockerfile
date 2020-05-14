FROM alpine

RUN apk add --no-cache openrc vim
RUN apk add --no-cache influxdb

COPY start.sh /tmp
RUN chmod +x /tmp/start.sh

ENTRYPOINT [ "/tmp/start.sh" ]

#config file: etc/influxdb.conf
#files stored at /var/lib/influxdb
#docker run -dit --name influxdb_cont -p 8086:8086 influxdb

#to see default configuration settings , run: influxd config
#in config file: settings that are commented out are set to the internal system defaults. Uncommented settings override the internal defaults.