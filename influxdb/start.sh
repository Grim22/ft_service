#!bin/sh

echo "switching to default runlevel..."
openrc default &> /dev/null
echo "starting influxdb..."
rc-service influxdb start &> /dev/null

echo "all set !"
tail -f /dev/null