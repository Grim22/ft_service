#test
FROM alpine

RUN apk update && apk add vim

RUN apk add vsftpd
#RUN apk add openssl
#openrc: pour start/stop restart des process dans alpine
RUN apk add openrc --no-cache

#pour ajouter la couche SSL, on créé un certificat et une key (avec openssl) et on mentionne leur emplacement dans le fichier de configuration (vsftpd.conf)
COPY nginx-selfsigned.key /etc/vsftpd
COPY nginx-selfsigned.crt /etc/vsftpd
COPY vsftpd.conf /etc/vsftpd

#CMD ["rc-service", "vsftpd", "start"]
#lancer le container avec -it et bin/sh en CMD
#CMD rc-service vsftpd start && tail -F /dev/null