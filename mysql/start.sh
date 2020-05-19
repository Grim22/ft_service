#!bin/sh

echo "switching to default runlevel..."
openrc default &> /dev/null
echo "seting up mariadb..."
rc-service mariadb setup &> /dev/null
echo "starting mariadb..."
rc-service mariadb start &> /dev/null
echo "creating database..."
mysql -u root < tmp/database.sql
echo "all set !"
tail -f /dev/null