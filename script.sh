#To point your shell to minikube's docker-daemon
eval $(minikube docker-env)

#lancer minikube avec cet argument pour permettre le node_port sur les ports < 30000
--extra-config=apiserver.service-node-port-range=10-35000