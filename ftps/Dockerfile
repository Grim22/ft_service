#test
FROM alpine

#RUN apk add vim

RUN apk add --no-cache vsftpd
RUN apk add --no-cache openrc 

#pour ajouter la couche SSL, on créé un certificat et une key (avec openssl -> fait en amont) et on mentionne leur emplacement dans le fichier de configuration (vsftpd.conf)
COPY nginx-selfsigned.key /etc/vsftpd
COPY nginx-selfsigned.crt /etc/vsftpd
COPY vsftpd.conf /etc/vsftpd

COPY start.sh /tmp
RUN chmod +x /tmp/start.sh

ENTRYPOINT [ "/tmp/start.sh" ]

#docker run -dit --name ftps_cont -p 21:21 ftps /bin/sh