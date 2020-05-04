FROM alpine

RUN apk add --no-cache openrc
RUN apk add --no-cache mysql mysql-client

COPY start.sh /tmp
RUN chmod +x /tmp/start.sh

ENTRYPOINT [ "/tmp/start.sh" ]

#docker run -dit --name mysql_cont -p 3306:3306 mysql (run en mode detach, possibilité de bash a l'intérieur avec exec)