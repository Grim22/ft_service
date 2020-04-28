FROM alpine

RUN apk update && apk add nginx vim
#pour pouvoir run nginx (particularité de alpine)
RUN mkdir -p /run/nginx

COPY default.conf /etc/nginx/conf.d
COPY nginx-selfsigned.key /etc/ssl/private
COPY nginx-selfsigned.crt /etc/ssl/certs

#c'est la commande "nginx" qui start nginx dans alpine
CMD ["nginx", "-g", "daemon off;"]

#pour run run -dit --name nginx_cont -p 80:80 -p ?:? nginx
