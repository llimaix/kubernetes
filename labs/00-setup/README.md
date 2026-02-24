# Lab 00 - Setup

## Objetivo
Preparar el entorno local y validar acceso al cluster.

## Requisitos
- Docker
- `kubectl`
- `kind` (recomendado) o `minikube`

## Pasos (Kind)
1. Crear cluster local:

	./platform/scripts/kind-up.sh

2. Verificar nodos:

	kubectl get nodes -o wide

## Validaciones
- Al menos un nodo `Ready`.
- `kubectl cluster-info` responde sin errores.

## Limpieza
Cuando termines la práctica completa:

	./platform/scripts/kind-down.sh
