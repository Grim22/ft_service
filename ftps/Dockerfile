#test
FROM alpine

#RUN apk add vim

RUN apk add --no-cache vsftpd
RUN apk add --no-cache openrc 

#pour ajouter la couche SSL, on créé un certificat et une key (avec openssl -> fait en amont) et on mentionne leur emplacement dans le fichier de configuration (vsftpd.conf)
COPY nginx-selfsigned.key /etc/vsftpd
COPY nginx-selfsigned.crt /etc/vsftpd
COPY vsftpd.conf /etc/vsftpd

#c'est ici (/var/ftp) que seront stockés les fichiers que l'on veut partager en ftp (mode anonymous) = configuré dans le .conf
RUN mkdir -p /var/ftp/pub
#c'est ici que seront uploadés les fichiers
RUN mkdir -p /var/ftp/incoming

#fichiers tests à uploader
RUN echo "test content" > /var/ftp/pub/file1.txt
RUN echo "another test" > /var/ftp/pub/file2.txt

#nobody correspond à l'user anonymous ?
RUN chown nobody:nobody /var/ftp/
#si on ne fait pas ca, on n'a pas les droits pour uploader les fichiers...
RUN chmod 777 /var/ftp/incoming/

COPY start.sh /tmp/
RUN chmod +x /tmp/start.sh

ENTRYPOINT [ "/tmp/start.sh" ]

#Accès au serveur ftp via filezilla (serveur ftp): permet de tester que le ssl marche bien
#via filezilla entrer MINIK_IP dans host et le port num: 30001
#laisser en mode "anonymous"
#pour tester l'upload de fichier, faire par filezilla et glisser le fichier dans upload
#Ou accès via navigateur: ftp://MINIK_IP:30001 (ne permet pas de tester le ssl)