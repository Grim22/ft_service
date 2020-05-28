FROM alpine

#packages indiqués sur la page https://wiki.alpinelinux.org/wiki/WordPress
RUN apk add --no-cache lighttpd php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
#autres packages au cas ou...
RUN apk add --no-cache php7-session php7-mbstring php7-zlib php7-opcache

#pour lancer le "built in web serveur php" php -S 0.0.0.0:5050 -t [root des fichiers]
RUN apk add --no-cache php7

#WP files: download and put at the right place
RUN wget https://wordpress.org/latest.tar.gz
RUN tar zxvf latest.tar.gz
RUN rm latest.tar.gz
RUN mv wordpress /var/www/localhost/htdocs/wordpress
RUN cp -R /var/www/localhost/htdocs/wordpress/* /var/www/localhost/htdocs/
RUN rm -R /var/www/localhost/htdocs/wordpress/
#COPY wp-config
COPY wp-config.php /var/www/localhost/htdocs/

COPY start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh

ENTRYPOINT ["/usr/local/bin/start.sh"]


#se connecter à la database sql "wordpress" avec les id suivants: (définis dans le database.sql de mysql)
#db_name= wordpress
#username= user
#password= password
#host = mysql (c'est à dire le "service" appelé mysql défini dans mysql.yaml, qui permet d'accéder au container mysql)

##update: étapes de connection réalisée directement: fichier wp-config.php dans le dossier wp qui contient les infos de connection à la db


