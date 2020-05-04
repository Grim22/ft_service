#!bin/sh

echo "switching to default runlevel..."
openrc default &> /dev/null
echo "seting up mariadb..."
/etc/init.d/mariadb setup &> /dev/null
echo "starting mariadb..."
rc-service mariadb start &> /dev/null
echo "all set !"
tail -f /dev/null