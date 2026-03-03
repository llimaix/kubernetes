# 02 - Workloads

## Objetivo
Entender cómo los controladores gestionan Pods y cómo hacer despliegues y rollbacks.

## Prerrequisitos
- Haber completado `docs/01-core/README.md`.
- Cluster local listo.

## Conceptos clave
- **Deployment**: declara el estado deseado y gestiona ReplicaSets.
- **ReplicaSet**: mantiene el número de Pods.
- **Rollout/Rollback**: actualizaciones controladas y reversión.
- **Job/CronJob**: tareas de ejecución finita y programada.

## Ejemplo mínimo de Deployment
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web-deploy
  labels:
    app: web
spec:
  replicas: 2
  selector:
    matchLabels:
      app: web
  template:
    metadata:
      labels:
        app: web
    spec:
      containers:
        - name: nginx
          image: nginx:1.25-alpine
          ports:
            - containerPort: 80
```

## Práctica guiada
1. Revisa `labs/02-deployments/manifests/deployment.yaml`.
2. Identifica `replicas`, `selector` y `template`.
3. Piensa qué pasaría si un Pod se cae.

## Validaciones (cuando ejecutes el lab)
- El Deployment debe crear 2 Pods `Running`.
- Debes poder ver el rollout:

    kubectl rollout status deployment/web-deploy

## Check rápido
- ¿Qué diferencia a un Deployment de un Pod?
- ¿Dónde se define la imagen del contenedor?

## Siguiente paso
Ir a `labs/02-deployments/README.md` y luego `docs/03-networking/README.md`.

## Lecturas adicionales
- `docs/02-workloads/deployments.md`
- `docs/02-workloads/restart-policies.md`
