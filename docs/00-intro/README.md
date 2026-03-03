# 00 - Intro

## Objetivo
Comprender qué es Kubernetes, cómo se organiza un cluster y cómo usar `kubectl` para explorar recursos.

## Prerrequisitos
- Docker instalado.
- `kubectl` y un cluster local (Kind o Minikube).

## Conceptos clave (muy básico)
- **Cluster**: conjunto de nodos que ejecutan workloads.
- **Control Plane**: API Server, Scheduler, Controller Manager, etcd.
- **Node**: máquina que ejecuta Pods.
- **Pod**: unidad mínima de ejecución.
- **Namespace**: segmentación lógica de recursos.

## Práctica guiada
1. Valida que el cluster responde.
2. Explora namespaces del sistema (`kube-system`, `default`).
3. Observa Pods en ejecución.

## Validaciones
- Debes ver al menos 1 nodo en estado `Ready`.
- `kube-system` debe mostrar pods de control plane (si es Kind).

## Check rápido (auto-evaluación)
- ¿Cuál es la diferencia entre Cluster y Node?
- ¿Qué problema resuelve un Namespace?
- ¿Qué hace el API Server?

## Siguiente paso
Ir a `docs/01-core/README.md` y luego `labs/00-setup/README.md`.

## Lecturas adicionales
- `docs/00-intro/arquitectura-k8s.md`
- `docs/00-intro/instalacion-cluster.md`
- `docs/00-intro/kubectl-cheatsheet.md`
- `docs/00-intro/minikube-cheatsheet.md` (opcional)

## Comandos esenciales (referencia rápida)
```bash
kubectl version --short
kubectl config current-context
kubectl get nodes -o wide
kubectl get namespaces
kubectl get pods -A