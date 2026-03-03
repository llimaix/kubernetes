# kubectl Cheatsheet (básico)

## Configuración y contexto
```bash
kubectl config view
kubectl config get-contexts
kubectl config current-context
kubectl config use-context <contexto>
```

## Namespaces
```bash
kubectl get namespaces
kubectl create namespace <nombre>
kubectl config set-context --current --namespace=<namespace>
```

## Clúster
```bash
kubectl version --short
kubectl cluster-info
kubectl get nodes -o wide
```

## Pods
```bash
kubectl get pods
kubectl get pods -A
kubectl describe pod <pod>
kubectl logs <pod>
```

## Deployments
```bash
kubectl get deployments
kubectl create deployment <nombre> --image=<imagen>
kubectl rollout status deployment/<nombre>
```

## Servicios
```bash
kubectl get services
kubectl describe service <servicio>
kubectl expose deployment <nombre> --port=80 --type=ClusterIP
```

## YAML
```bash
kubectl apply -f archivo.yaml
kubectl diff -f archivo.yaml
kubectl delete -f archivo.yaml
```

## Tips
```bash
kubectl explain pod
kubectl api-resources
kubectl get events --sort-by=.metadata.creationTimestamp
```
