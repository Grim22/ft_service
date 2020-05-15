#!bin/sh

echo "switching to default runlevel..."
openrc default &> /dev/null
echo "starting influxdb and telegraf"
rc-service influxdb start &> /dev/null
#"restart" because didnt create the database with start alone...
rc-service telegraf restart &> /dev/null

echo "all set !"
tail -f /dev/null