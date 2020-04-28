FROM alpine

RUN apk update && apk add vim
RUN apk add openrc
#grafana package is in another repository: edge/testing. We need to add it to the list of reps
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk update
RUN apk add grafana

#RUN rc-service grafana start

#config file il located at etc/grafana.ini
