FROM alpine

RUN apk add --no-cache openrc vim

#grafana package is in another repository: edge/testing. We need to add it to the list of reps
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk add --no-cache grafana

COPY start.sh /tmp
RUN chmod +x /tmp/start.sh

ENTRYPOINT [ "/tmp/start.sh" ]

#docker run -dit --name grafana_cont -p 3000:3000 grafana


#config file located at etc/grafana.ini
#init script: /etc/init.d/grafana
#configuration file for init script: etc/conf.d/grafana
#data: /var/lib/grafana
    