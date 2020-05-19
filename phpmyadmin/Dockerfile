FROM alpine

RUN apk add --no-cache openrc
#RUN apk add vim
RUN apk add --no-cache nginx
#packages indiqués sur la page https://wiki.alpinelinux.org/wiki/Phpmyadmin + php-session (dixit JN) et php7-fpm (pour nginx)
RUN apk add --no-cache lighttpd php-session php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

RUN apk add --no-cache php7-fpm

#NGINX
RUN mkdir -p /run/nginx
COPY default.conf /etc/nginx/conf.d

#Website file index
RUN chown nginx:nginx /var/www/localhost/htdocs/
RUN chmod 777 /var/www/localhost/htdocs/

#PHPM files: download and put at the right place
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN rm phpMyAdmin-5.0.2-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.2-all-languages /var/www/localhost/htdocs/phpmyadmin
RUN cp -R /var/www/localhost/htdocs/phpmyadmin/* /var/www/localhost/htdocs/
RUN rm -R /var/www/localhost/htdocs/phpmyadmin/

#Init script
COPY start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh

#Php config file
COPY config.inc.php /var/www/localhost/htdocs/config.inc.php

ENTRYPOINT ["/usr/local/bin/start.sh", "-g", "daemon off;"]

#PHP config modifié pour permettre la connection au serveur mysql
#cf https://docs.phpmyadmin.net/en/latest/config.html
#pour se connecter, utiliser le username et password definis dans database.sql:
#username: user
#passwd: password
#selectionner non pas localhost mais mysql