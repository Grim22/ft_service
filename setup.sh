#!/bin/bash

#for tips on how to run ft_services on 42 xubuntu VM: cf https://www.notion.so/Ft_services-VM-852d4f9b0d9a42c1a2de921e4a2ac417

#install openssh-client if not installed

docker ps &> /dev/null
if [ $? != 0 ]
then
	echo -e ">>>>>> user doesn't have permission on docker. Please run: \nsudo usermod -aG docker $(whoami) \nthen restart your terminal and run: \n newgrp docker"
	exit
fi

echo ">>>>>>>>> starting minikube"
minikube start --driver=docker --extra-config=apiserver.service-node-port-range=10-35000
#dashboard and ingress
minikube addons enable ingress
minikube addons enable dashboard

#1) put minik_ip into a global variable
#export MINIK_IP = $(minikube ip)

#above line does not work sometimes with driver=docker, as minikube ip would return 127.0.0.1. Corrected by using the line below to get the real minikube ip
export MINIK_IP="$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)"

cd srcs

## ATTENTION: vérifier que dans les endroits où l'on veut changer la minik_ip, l'ip n'est pas rentrée en dur 
#2) set MINIK_IP where it needs to: 
sed -i "s/\$MINIK_IP/$MINIK_IP/" nginx/index.html
sed -i "s/\$MINIK_IP/$MINIK_IP/" mysql/wordpress.sql

eval $(minikube docker-env)

## ATTENTION a bien lancer grafana APRES influxdb car grafana a besoin de connaitre l'IP du service influxdb (est exporté automatiquement dans les variables d'env)
echo ">>>>>>>>> buiding images"
services=(mysql wordpress phpmyadmin influxdb grafana nginx ftps)
for service in ${services[*]}
do
cd $service
docker build -t $service .
cd ..
done

echo ">>>>>>>>> starting deployment"
for service in ${services[*]}
do
kubectl apply -f $service.yaml
done
kubectl apply -f ingress.yaml

echo ">>>>>>>>>> access $MINIK_IP (minikube ip)"
#build images
