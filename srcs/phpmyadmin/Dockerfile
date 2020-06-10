FROM alpine

RUN apk add --no-cache openrc

RUN apk add --no-cache php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

#PHPM files: download and put at the right place
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN rm phpMyAdmin-5.0.2-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.2-all-languages /var/tmp/phpmyadmin
RUN cp -R /var/tmp/phpmyadmin/* /var/tmp/
RUN rm -R /var/tmp/phpmyadmin/

#Init script
COPY start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh

#Php config file
COPY config.inc.php /var/tmp/config.inc.php

ENTRYPOINT ["/usr/local/bin/start.sh", "-g", "daemon off;"]

#PHP config modifié pour permettre la connection au serveur mysql
#cf https://docs.phpmyadmin.net/en/latest/config.html
#pour se connecter, utiliser le username et password definis dans database.sql:
#username: user
#passwd: password
#selectionner non pas localhost mais mysql