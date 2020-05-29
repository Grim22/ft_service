#!/bin/bash

#install openssh-client if not installed

echo ">>>>>>>>> starting minikube"
#minikube start --driver=virtualbox
eval $(minikube docker-env)
#dashboard and ingress
minikube addons enable ingress
minikube addons enable dashboard

#1) put minik_ip into a global variable
export MINIK_IP=$(minikube ip)

## ATTENTION: vérifier que dans les endroits où l'on veut changer la minik_ip, l'ip n'est pas rentrée en dur 
#2) set MINIK_IP where it needs to: 
#in grafana.ini
sed -i "s/\$MINIK_IP/$MINIK_IP/" grafana/grafana.ini
#set MINIK_IP in vsftpd.conf
sed -i "s/\$MINIK_IP/$MINIK_IP/" ftps/vsftpd.conf
#set MINIK_IP in wp-config.php 
sed -i "s/\$MINIK_IP/$MINIK_IP/" wordpress/wp-config.php

echo ">>>>>>>>> buiding images"
services=(influxdb mysql wordpress grafana nginx ftps phpmyadmin)
for service in ${services[*]}
do
cd $service
docker build -t $service .
cd ..
done

echo ">>>>>>>>> starting deployment"
for service in ${services[*]}
do
kubectl apply -f $service.deployment
done
kubectl apply -f ingress.yaml


#build images
