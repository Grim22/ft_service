FROM alpine

#edge repo for telegraf
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk add --no-cache influxdb
RUN apk add --no-cache telegraf
RUN apk add --no-cache openrc

COPY start.sh /tmp
COPY telegraf.conf /etc
RUN chmod +x /tmp/start.sh

ENTRYPOINT [ "/tmp/start.sh" ]

#INFLUXDB
#config file: etc/influxdb.conf
#files stored at /var/lib/influxdb
#to see default configuratitn settings , run: influxd config
#in config file: settings that are commented out are set to the internal system defaults. Uncommented settings override the internal defaults.


#TELEGRAPH
#config file: etc/telegraf.conf
#in config file, must specicy "input" (which data is gonna be stored. Default: CPU usage); and "output" (where to store the data. To select INFLUXDB, the corresponding lines have been uncommented)
#name of the created database: "telegraf"


#docker run -dit --name influxdb_cont -p 8086:8086 influxdb