FROM alpine

# NGINX: pas à installer dans le container a priori: relier le container WP au container Nginx grace au docker compose
# donc supprimer les lignes en rapport avec nginx


#EXPOSE 80

#RUN apk add vim
#RUN apk add --no-cache nginx \
RUN apk add --no-cache	php-fpm \
	php-mysqli

#RUN mkdir -p /run/nginx
COPY wordpress /var/www/localhost/htdocs 
#COPY default.conf /etc/nginx/conf.d

#RUN chown nginx:nginx /var/www/localhost/htdocs/
#RUN chmod 777 /var/www/localhost/htdocs/

COPY start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh

ENTRYPOINT ["/usr/local/bin/start.sh", "-g", "daemon off;"]

#docker run --name wp_cont -dit -p 80:80 wordpress

