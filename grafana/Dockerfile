FROM alpine

RUN apk add --no-cache openrc vim

#grafana package is in another repository: edge/testing. We need to add it to the list of reps
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk add --no-cache grafana

COPY datasources.yml /usr/share/grafana/conf/provisioning/datasources/

#commenté car ne marche pas et fait planter le container
#bien prendre comme json celui obtenu en allant dans les settings depuis la GUI Grafana, après avoir importé le dashboard souhaité avec son uid
#a chaque fois cela sort un nombre d'"iterations" différent (ligne 20 du json)
#le container se lance bien, avec le graph (re-copier le json si ne marche pas), mais le dashboard fait tout planter au bout d'un moment
#COPY dashboard.yml /usr/share/grafana/conf/provisioning/dashboards/
#COPY docker-dashboard.json /usr/share/grafana/conf/provisioning/dashboards

#fichier de configuration configuré pour que grafana fonctionne en reverse proxy derrière nginx
#on n'a qu'un partie de settings: les autres sont set par défaut
COPY grafana.ini /etc/grafana.ini

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

#ajouter et configuer ce dashboard (spécial docker):
#https://grafana.com/grafana/dashboards/10585
    