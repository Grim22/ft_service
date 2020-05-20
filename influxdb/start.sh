#!bin/sh

echo "switching to default runlevel..."
openrc default &> /dev/null
echo "starting influxdb and telegraf"
rc-service influxdb start &> /dev/null
#"restart" because didnt create the database with start alone...
rc-service telegraf restart &> /dev/null

#correspond au socket vers docker-daemon (pour que telegraf ait accès à l'activité des containers)
chown root:root /var/run/docker.sock
chmod 666 /var/run/docker.sock
###comprendre pourquoi cela ne suffit pas de faire un chown root:root, en gardant le chmod initial (660)


echo "all set !"
tail -f /dev/null