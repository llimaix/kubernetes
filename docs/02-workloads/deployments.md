# Deployments (por qué y cómo)

## Objetivo
Comprender por qué los Deployments son esenciales para disponibilidad y escalado.

## ¿Por qué no usar Pods sueltos?
- No hay auto-reparación.
- No hay escalado automático.
- Actualizaciones implican downtime.

## Con Deployment
- ReplicaSets mantienen el número de Pods.
- Rollouts y rollbacks controlados.

## Ejemplo comparativo
```yaml
# Pod frágil
apiVersion: v1
kind: Pod
metadata:
  name: mi-app
spec:
  containers:
    - name: nginx
      image: nginx
```

```yaml
# Deployment robusto
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mi-app
spec:
  replicas: 3
  selector:
    matchLabels:
      app: mi-app
  template:
    metadata:
      labels:
        app: mi-app
    spec:
      containers:
        - name: nginx
          image: nginx
```

## Comandos útiles
```bash
kubectl create deployment mi-app --image=nginx
kubectl get deployments
kubectl get replicasets
kubectl rollout status deployment/mi-app
```
