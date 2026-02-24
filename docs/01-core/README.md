# 01 - Core

## Objetivo
Dominar los objetos esenciales: Pods, labels/annotations y manifests limpios.

## Prerrequisitos
- Haber completado `docs/00-intro/README.md`.
- Cluster local listo.

## Conceptos clave
- **Pod**: contenedor(es) + configuración.
- **Labels/Selectors**: organización y selección de recursos.
- **Annotations**: metadata para herramientas/operaciones.
- **Namespace**: aislamiento lógico.
- **Manifests**: `apiVersion`, `kind`, `metadata`, `spec`.

## Ejemplo mínimo de Pod
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: web-pod
  labels:
    app: web
  annotations:
    owner: "labs"
spec:
  containers:
    - name: nginx
      image: nginx:1.25-alpine
      ports:
        - containerPort: 80
```

## Práctica guiada (sin aplicar aún)
1. Observa manifests existentes en `labs/01-pods/manifests/`.
2. Identifica labels, annotations y fields obligatorios.
3. Compara con `docs/01-core/labels-annotations.md`.

## Validaciones (cuando ejecutes el lab)
- El Pod debe estar en estado `Running`.
- Debes poder filtrar por label:

    kubectl get pods -l app=web

## Check rápido
- ¿Cuál es la diferencia entre label y annotation?
- ¿Qué campos son obligatorios en un manifest?

## Siguiente paso
Ir a `labs/01-pods/README.md` y luego `docs/02-workloads/README.md`.
