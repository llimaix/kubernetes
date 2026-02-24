# Kubernetes Learning Path

Guía práctica y progresiva para aprender Kubernetes desde cero hasta nivel productivo. Incluye:
- conceptos claros y básicos en `docs/`
- laboratorios paso a paso en `labs/`
- validaciones, limpieza y buenas prácticas
- manifests limpios (GitOps-ready)

## ¿Cómo usar esta guía?
1. Lee cada módulo en `docs/` (explicación + checklist).
2. Ejecuta el lab correspondiente en `labs/`.
3. Valida resultados y limpia recursos.
4. Avanza al siguiente módulo.

## Ruta de aprendizaje (de bajo a alto nivel)
| Módulo | Enfoque | Lab |
| --- | --- | --- |
| 00 - Intro | Arquitectura, kubectl y namespaces | `labs/00-setup` |
| 01 - Core | Pods, labels, annotations, manifests | `labs/01-pods` |
| 02 - Workloads | Deployments, ReplicaSets, Jobs | `labs/02-deployments` |
| 03 - Networking | Services, DNS, Ingress, NetworkPolicy | `labs/03-services` |
| 04 - Storage | Volumes, PV/PVC, StorageClass | `labs/06-storage` |
| 05 - Security | RBAC, ServiceAccounts, Secrets | `labs/04-config-secrets` |
| 06 - Observability | Logs, events, probes | `labs/05-crashloop` |
| 07 - GitOps | Manifests limpios y control de cambios | (conceptual) |
| 08 - Production | Requests/limits, rollouts, hardening | (conceptual) |

## Requisitos
- Docker
- `kubectl`
- `kind` (recomendado) o `minikube`

## Quickstart (Kind)
```bash
./platform/scripts/kind-up.sh
kubectl cluster-info
```

## Convenciones de manifests
- Declarativos y reproducibles.
- Sin metadata runtime (`status`, `resourceVersion`, `uid`).
- Usar `labels` consistentes (`app`, `tier`, `env`).

## Validaciones y limpieza
- Valida con `kubectl get`, `describe`, `logs`.
- Limpia con `kubectl delete -f <manifests>` o `kubectl delete <tipo> <nombre>`.

## Estructura del repo
- `docs/`: teoría y conceptos por módulo.
- `labs/`: ejercicios prácticos y manifests.
- `platform/`: scripts para cluster local.

## Siguiente paso
Empieza en `docs/00-intro/README.md` y luego ejecuta `labs/00-setup/README.md`.