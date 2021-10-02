#!/bin/sh

minikube start --vm-driver=virtualbox

eval $(minikube docker-env)
docker pull metallb/speaker:v0.8.2
docker pull metallb/controller:v0.8.2

docker build -t docker_img_nginx ./srcs/nginx

kubectl apply -f ./srcs/nginx/nginx.yaml

minikube addons enable metallb

kubectl apply -f ./srcs/metallb-config.yaml

minikube dashboard
