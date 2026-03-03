# Minikube Cheatsheet

## Instalación rápida
### macOS (Homebrew)
```bash
brew install minikube
```

### Linux (Debian/Ubuntu)
```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

## Ciclo de vida
```bash
minikube start
minikube status
minikube stop
minikube delete
```

## Servicios
```bash
kubectl create deployment hello-minikube --image=kicbase/echo-server:1.0
kubectl expose deployment hello-minikube --type=NodePort --port=8080
minikube service hello-minikube
```

## Addons y debugging
```bash
minikube addons list
minikube addons enable dashboard
minikube dashboard
minikube logs
minikube ssh
```
