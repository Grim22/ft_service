FROM alpine

RUN apk add --no-cache openrc
RUN apk add --no-cache mysql mysql-client

COPY start.sh /tmp
RUN chmod +x /tmp/start.sh

#les scripts sql pour parametrer wordpress (cf start.sh)
COPY database.sql /tmp
COPY wordpress.sql /tmp

#le fichier de configuration, auquel on a ajouté deux lignes pour permettre la connection aux db depuis n'importe quel client
COPY mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

ENTRYPOINT [ "/tmp/start.sh" ]

#docker run -dit --name mysql_cont -p 3306:3306 mysql (run en mode detach, possibilité de bash a l'intérieur avec exec)

#conf file: etc/my.cnf.d/mariad-server.cnf ou etc/my.cnf