#!/bin/bash

#install openssh-client if not installed

minikube start --driver=virtualbox
eval $(minikube docker-env)
#dashboard and ingress
minikube addons enable ingress
minikube addons enable dashboard

#1) put minik_ip into a global variable
export MINIK_IP=$(minikube ip)

## ATTENTION: vérifier que dans les endroits où l'on veut changer la minik_ip, l'ip n'est pas rentrée en dur 
#2) set MINIK_IP where it needs to: 
#export MINIK_IP into an environment variable of grafana containers. Env variable will be used in grafana.ini
sed -i "s/\$MINIK_IP/$MINIK_IP/" grafana.yaml
#set MINIK_IP in vsftpd.conf
sed -i "s/\$MINIK_IP/$MINIK_IP/" ftps/vsftpd.conf
#set MINIK_IP in wp-config.php 
sed -i "s/\$MINIK_IP/$MINIK_IP/" wordpress/wp-config.php

#build images
cd mysql
docker build -t mysql .
cd ..