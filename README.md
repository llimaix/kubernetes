# Kubernetes Learning Path

Este repositorio es una guía práctica y reproducible para aprender Kubernetes con enfoque real de producción:
- conceptos claros (docs)
- laboratorios ejecutables (labs)
- validaciones y limpieza
- estándares GitOps-ready (manifests limpios, sin metadata runtime)

## Requisitos
- Docker
- kubectl
- kind (recomendado) o minikube

## Quickstart (Kind)
```bash
./platform/scripts/kind-up.sh
kubectl cluster-info