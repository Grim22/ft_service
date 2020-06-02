FROM alpine

# # # fix work iconv library with alphine
# RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted gnu-libiconv
# ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php

#packages indiqués sur la page https://wiki.alpinelinux.org/wiki/WordPress
RUN apk add --no-cache php7 php7-fpm php7-opcache php7-gd php7-mysqli \
php7-zlib php7-curl php7-mbstring php7-json php7-session


#WP files: download and put at the right place
RUN wget https://wordpress.org/latest.tar.gz
RUN tar zxvf latest.tar.gz
RUN rm latest.tar.gz
RUN mv wordpress /var/tmp/
RUN cp -R /var/tmp/wordpress/* /var/tmp/
RUN rm -R /var/tmp/wordpress/
#COPY wp-config
COPY wp-config.php /var/tmp/

COPY start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh

ENTRYPOINT ["/usr/local/bin/start.sh"]


#se connecter à la database sql "wordpress" avec les id suivants: (définis dans le database.sql de mysql)
#db_name= wordpress
#username= user
#password= password
#host = mysql (c'est à dire le "service" appelé mysql défini dans mysql.yaml, qui permet d'accéder au container mysql)

##update: étapes de connection réalisée directement: fichier wp-config.php dans le dossier wp qui contient les infos de connection à la db


