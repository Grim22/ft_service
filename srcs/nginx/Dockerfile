FROM alpine

RUN apk add --no-cache nginx
#pour pouvoir run nginx (particularité de alpine)
RUN mkdir -p /run/nginx

#modules php: a garder ?
RUN apk add --no-cache lighttpd php7-fpm php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

#Openssh
RUN apk add openrc
RUN apk add openssh
COPY sshd_config /etc/ssh/

#nginx conf and index
COPY default.conf /etc/nginx/conf.d
COPY index.html /var/lib/nginx/html/

#ssl
COPY nginx-selfsigned.key /etc/ssl/private
COPY nginx-selfsigned.crt /etc/ssl/certs

#c'est la commande "nginx" qui start nginx dans alpine
COPY start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh

COPY liveness.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/liveness.sh

ENTRYPOINT ["/usr/local/bin/start.sh", "-g", "daemon off;"]
#pour run run -dit --name nginx_cont -p 80:80 -p 443:443 nginx

#NGINX
#files (logs...): var/log/nginx
#config: etc/nginx

#SSH
#config at etc/ssh/sshd_config
#default root password: alpine
#listening on port 22 by default