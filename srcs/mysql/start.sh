#!bin/sh

echo "switching to default runlevel..."
openrc default &> /dev/null
echo "seting up mariadb..."
rc-service mariadb setup &> /dev/null
echo "starting mariadb..."
rc-service mariadb start &> /dev/null
#create database wordpress and mysql user with access to created database
mysql -u root < tmp/database.sql
#fills database (sql file obtained exported from phpmyadmin, after wordpress was configured with one admin and two users. Line 13 added to set the database to wordpress)
mysql -u root < tmp/wordpress.sql
echo "all set !"
tail -f /dev/null