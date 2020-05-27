#TODO:
# faire marcher wordpress au démarrage (phase d'instalation qui plante)
## probléme car php serveur un peu lent
## problemes de login logout... (rewrite ?)
## solution JN: copier la base de donnée sql une fois remplie, pour ne pas avoir à refaire l'instalation
## problème: erreur sur la BDD de mon coté

# script shell
# mettre les bases de données dans des pv, s'assurer qu'on les retrouve en cas de crash/redemarage
# tester telechargement de fichier sur serveur ftp
# acces a nginx via ssh
# dashboard grafana: 1 par service


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
#set MINIK_IP in wp-config.php 
A FAIRE