# 03 - Networking

## Objetivo
Entender cómo se comunican los Pods y cómo exponer servicios dentro y fuera del cluster.

## Prerrequisitos
- Haber completado `docs/02-workloads/README.md`.
- Cluster local listo.

## Conceptos clave
- **Service**: IP estable para un conjunto de Pods.
- **ClusterIP**: acceso interno al cluster.
- **NodePort/LoadBalancer**: exposición externa (según entorno).
- **DNS interno**: resolución de `service.namespace.svc`.
- **Ingress**: routing HTTP (conceptual).
- **NetworkPolicy**: control de tráfico entre Pods.

## Ejemplo mínimo de Service
```yaml
apiVersion: v1
kind: Service
metadata:
  name: web-svc
spec:
  type: ClusterIP
  selector:
    app: web
  ports:
    - port: 80
      targetPort: 80
```

## Práctica guiada
1. Revisa `labs/03-services/manifests/`.
2. Asegúrate de que el Service seleccione los Pods correctos.
3. Identifica el nombre DNS del Service.

## Validaciones (cuando ejecutes el lab)
- El Service debe tener una `ClusterIP`.
- Debes poder ver endpoints:

    kubectl get endpoints web-svc

## Check rápido
- ¿Qué diferencia hay entre ClusterIP y NodePort?
- ¿Para qué sirve un selector en un Service?

## Siguiente paso
Ir a `labs/03-services/README.md` y luego `docs/04-storage/README.md`.
