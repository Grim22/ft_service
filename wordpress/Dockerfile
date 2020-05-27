FROM alpine

# NGINX: pas à installer dans ce container !!
# ici installé pour test
# donc ensuite supprimer les lignes en rapport avec nginx


RUN apk add --no-cache nginx
#packages indiqués sur la page https://wiki.alpinelinux.org/wiki/WordPress + php7-fpm (n'est pas dans la liste mais nécessaire à nginx)
RUN apk add --no-cache lighttpd php7-fpm php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN apk add --no-cache php7-session php7-mbstring php7-zlib php7-opcache
#pour lancer le "built in web serveur php" php -S 0.0.0.0:5050 -t [root des fichiers]
RUN apk add --no-cache php7
RUN mkdir -p /run/nginx
COPY wordpress /var/www/localhost/htdocs 
COPY default.conf /etc/nginx/conf.d

RUN chown nginx:nginx /var/www/localhost/htdocs/
RUN chmod 777 /var/www/localhost/htdocs/

COPY start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh

ENTRYPOINT ["/usr/local/bin/start.sh", "-g", "daemon off;"]

#se connecter à la database sql "wordpress" avec les id suivants: (définis dans le database.sql de mysql)
#db_name= wordpress
#username= user
#password= password
#host = mysql (c'est à dire le "service" appelé mysql défini dans mysql.yaml, qui permet d'accéder au container mysql)

##update: étapes de connection réalisée directement: fichier wp-config.php dans le dossier wp qui contient les infos de connection à la db


