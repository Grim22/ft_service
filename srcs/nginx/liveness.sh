#!/bin/sh

pgrep nginx &> /dev/null
if [ $? != 0 ]
then
    echo "problem nginx"
	exit 1
fi
pgrep fpm &> /dev/null
if [ $? != 0 ]
then
    echo "problem php"
	exit 1
fi
pgrep ssh &> /dev/null 
if [ $? != 0 ]
then
    echo "problem ssh"
	exit 1
fi