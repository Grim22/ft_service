#!bin/sh

echo "switching to default runlevel..."
openrc default &> /dev/null
echo "starting grafana..."

rc-service influxdb start -D &> /dev/null

echo "all set !"
tail -f /dev/null