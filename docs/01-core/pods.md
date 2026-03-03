# Pods (concepto)

## Objetivo
Entender qué es un Pod, sus características y casos de uso.

## Conceptos clave
- Unidad mínima de despliegue en Kubernetes.
- Comparte IP, red y volúmenes entre contenedores.
- Ciclo de vida común para todos los contenedores del Pod.

## Casos de uso
- **App + sidecar** (logs, proxy, metrics).
- **App + helper** (migraciones, init).

## Ejemplo básico
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: mi-pod
spec:
  containers:
    - name: mi-app
      image: nginx:1.21
      ports:
        - containerPort: 80
```

## Nota
En la práctica se usan Deployments/DaemonSets para gestionar Pods.
