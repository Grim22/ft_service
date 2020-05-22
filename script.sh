#!/bin/bash
minikube start --driver=virtualbox --extra-config=apiserver.service-node-port-range=10-35000
eval $(minikube docker-env)
#dashboard and ingress
minikube addons enable ingress
minikube addons enable dashboard
#cmd to access dashboard
minikube dashboard