# Lab 01 - Pods

## Objetivo
Crear un Pod simple con labels y validar su estado.

## Archivos
- Manifests: `./manifests/pod.yaml`

## Pasos
1. Aplicar el manifest:

	kubectl apply -f ./manifests/pod.yaml

2. Verificar el Pod:

	kubectl get pods -l app=web

3. Inspeccionar detalles:

	kubectl describe pod web-pod

## Validaciones
- El Pod debe estar en `Running`.
- El label `app=web` debe existir.

## Desafío extra
- Cambia la imagen a otra versión y vuelve a aplicar.

## Limpieza
	kubectl delete -f ./manifests/pod.yaml
