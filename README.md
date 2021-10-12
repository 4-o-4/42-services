# services

<img src="https://upload.wikimedia.org/wikipedia/commons/6/67/Kubernetes_logo.svg" alt="Kubernetes logo" height="70" />

#### Install minikube
```bash
brew install minikube
export MINIKUBE_HOME=$HOME/goinfre
```

#### Kubectl
```bash
# Create a pod from a YAML file
kubectl create -f <yourfile.yaml>

# Get the pod
kubectl get pods

# Get shell in a pod
kubectl exec -it <pod name> -- /bin/sh

# Restart a deployment
kubectl rollout restart deployment <name>

# Delete a YAML file
kubectl delete -f <file.yaml>

# Delete deployment
kubectl delete deployment <your deployment>

# Launch minikube dashboard
minikube dashboard

# Get cluster external IP
minikube ip

# Reset Minikube VM
minikube delete
```

#### Ressources
- [Complete Intro to Containers](https://btholt.github.io/complete-intro-to-containers/)
- [Kubernetes NodePort vs LoadBalancer vs Ingress? When should I use what?](https://medium.com/google-cloud/kubernetes-nodeport-vs-loadbalancer-vs-ingress-when-should-i-use-what-922f010849e0)
- [Kubernetes Documentation](https://kubernetes.io/docs/home/)
- [How To Deploy a PHP Application with Kubernetes](https://www.digitalocean.com/community/tutorials/how-to-deploy-a-php-application-with-kubernetes-on-ubuntu-16-04-ru)
- [Deploy your first scaleable PHP/MySQL Web application in Kubernetes](https://faun.pub/deploy-your-first-scaleable-php-mysql-web-application-in-kubernetes-33ed7ab66595)
- [Understanding the HTTP 307 Temporary Redirect Status Code in Depth](https://kinsta.com/knowledgebase/307-redirect/)
