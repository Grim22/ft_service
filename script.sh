#!/bin/bash
minikube start --driver=virtualbox --extra-config=apiserver.service-node-port-range=10-35000
eval $(minikube docker-env)
