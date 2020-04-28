FROM alpine

EXPOSE 80

RUN apk update
RUN apk add vim
RUN apk add nginx \
	php-fpm \
	php-mysqli

RUN mkdir -p /run/nginx
COPY wordpress /var/www/localhost/htdocs 
COPY default.conf /etc/nginx/conf.d
#RUN chown nginx:nginx /var/www/localhost/htdocs/
#RUN chmod 777 /var/www/localhost/htdocs/

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh", "-g", "daemon off;"]
#CMD ["/bin/sh", "-c", "/usr/sbin/php-fpm7; exec nginx -g 'daemon off;';"]
#docker run --name wp_cont -dit -p 80:80 wordpress

