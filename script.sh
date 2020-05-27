#!/bin/bash
minikube start --driver=virtualbox --extra-config=apiserver.service-node-port-range=10-35000
eval $(minikube docker-env)
#dashboard and ingress
minikube addons enable ingress
minikube addons enable dashboard
#cmd to access dashboard
minikube dashboard

#1) put minik_ip into a global variable
export MINIK_IP=$(minikube ip)
#2) set MINIK_IP where it needs to: 
#export MINIK_IP into an environment variable of grafana containers
#env variable will be used in grafana.ini
sed -i "s/\$MINIK_IP/$MINIK_IP/" grafana_deployment.yaml
#set MINIK_IP in vsftpd.conf
sed -i "s/\$MINIK_IP/$MINIK_IP/" ftps/vsftpd.conf