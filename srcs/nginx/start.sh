#!/bin/sh
openrc default
rc-service sshd start

#on doit changer le mot de passe du root pour pouvoir se connecter à celui ci
echo "root:basile42" | chpasswd

nginx
/usr/sbin/php-fpm7

tail -f /dev/null
