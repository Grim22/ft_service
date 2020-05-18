FROM alpine

RUN apk add --no-cache openrc vim

#grafana package is in another repository: edge/testing. We need to add it to the list of reps
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk add --no-cache grafana

COPY datasources.yml /usr/share/grafana/conf/provisioning/datasources/
COPY start.sh /tmp
RUN chmod +x /tmp/start.sh

ENTRYPOINT [ "/tmp/start.sh" ]

#port: 3000

#config file located at etc/grafana.ini
#default config: /usr/share/grafana/conf
#home_path: usr/share/grafana
#init script: /etc/init.d/grafana
#configuration file for init script: etc/conf.d/grafana

#user: admin
#pssword: admin
    