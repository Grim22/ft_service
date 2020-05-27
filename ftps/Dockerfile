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

#Accès au serveur ftp via filezilla (serveur ftp): permet de tester que le ssl marche bien
#via filezilla entrer MINIK_IP dans host et le port num: 30001
#laisser en mode "anonymous"
#Ou accès via navigateur: ftp://MINIK_IP:30001 (ne permet pas de tester le ssl)

#TODO: tester si on peut bien telecharger des fichiers (il faudra peut être modifier le .conf)