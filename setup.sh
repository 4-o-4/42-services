#!/bin/sh

# Colors
GREEN='\033[0;32m'
END='\033[0m'

export MINIKUBE_HOME=/Users/$USER/goinfre
rm -rf ~/goinfre/.minikube

rm -rf ~/Library/Containers/com.docker.docker
mkdir -p ~/goinfre/docker
ln -s ~/goinfre/docker ~/Library/Containers/com.docker.docker

minikube config set WantVirtualBoxDriverWarning false
minikube start --vm-driver=virtualbox

eval $(minikube docker-env)
docker pull metallb/speaker:v0.8.2
docker pull metallb/controller:v0.8.2

minikube addons enable metallb
minikube addons enable metrics-server

clear

kubectl apply -f ./srcs/metallb-config.yaml
echo "[+] metallb - ${GREEN}Done!${END}"

services() {
    docker build -t docker_img_$1 ./srcs/$1 > /dev/null 2>&1
    kubectl apply -f ./srcs/$1/$1.yaml > /dev/null 2>&1
    echo "[+] $1 - ${GREEN}Done!${END}"
}

names="nginx wordpress mysql phpmyadmin grafana influx ftps"

for name in $names; do
    services $name
done

minikube dashboard
