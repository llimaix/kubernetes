# 04 - Storage

## Objetivo
Comprender cómo persistir datos en Kubernetes con Volumes, PV y PVC.

## Prerrequisitos
- Haber completado `docs/03-networking/README.md`.
- Cluster local listo.

## Conceptos clave
- **Volume**: almacenamiento montado dentro de un Pod.
- **PV**: recurso que representa almacenamiento real.
- **PVC**: solicitud de almacenamiento por un Pod.
- **StorageClass**: define provisión dinámica.

## Ejemplo mínimo de PVC
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: app-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
```

## Práctica guiada
1. Investiga qué StorageClass hay disponible:

    kubectl get storageclass

2. Identifica cómo un Pod monta un PVC.

## Validaciones (cuando ejecutes labs futuros)
- El PVC debe pasar a estado `Bound`.

## Check rápido
- ¿Qué diferencia hay entre PV y PVC?
- ¿Qué significa ReadWriteOnce?

## Siguiente paso
Ir a `labs/06-storage/README.md` y luego `docs/05-security/README.md`.
