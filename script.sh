#!/bin/bash
minikube start --driver=virtualbox --extra-config=apiserver.service-node-port-range=10-35000
eval $(minikube docker-env)
#dashboard and ingress
minikube addons enable ingress
minikube addons enable dashboard
#cmd to access dashboard
minikube dashboard

#1) put minik_ip into a global variable (used in grafana.ini)
export MINIK_IP=$(minikube ip)
#2) export MINIK_IP into an environment variable of grafana containers
#---->in influxdb_deployment, replacer les variables globales par leurs valeurs. puis apply le .YAML
envsubst < influxdb_deployment.yaml | kubectl apply -f -
#OU FAIRE
envsubst < influxdb_deployment.tmp > influxdb_deployment.yaml
#et faire apply dans un deuxième temps
#---->AUTRE option: utiliser SED:
sed -i "s/\$MINIK_IP/$MINIK_IP/" grafana_deployment.yaml