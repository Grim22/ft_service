#!/bin/sh
echo "Starting Nginx !"
nginx
echo "Starting Php"
/usr/sbin/php-fpm7

tail -f /dev/null
