#!/bin/sh

pgrep telegraf &> /dev/null
if [ $? != 0 ]
then
    echo "problem telegraf"
	exit 1
fi
pgrep influxd &> /dev/null
if [ $? != 0 ]
then
    echo "problem influx"
	exit 1
fi