# Lab 04 - ConfigMaps & Secrets

## Objetivo
Usar ConfigMaps y Secrets para inyectar configuración en un Pod.

## Archivos
- Manifests: `./manifests/configmap.yaml`, `./manifests/secret.yaml`, `./manifests/pod.yaml`

## Pasos
1. Crear ConfigMap y Secret:

	kubectl apply -f ./manifests/configmap.yaml
	kubectl apply -f ./manifests/secret.yaml

2. Crear el Pod que consume ambos:

	kubectl apply -f ./manifests/pod.yaml

3. Verificar variables de entorno:

	kubectl exec -it config-pod -- env | grep APP_

## Validaciones
- Debe existir la variable `APP_MODE`.
- El Secret no debe mostrarse en claro en `kubectl get secret`.

## Desafío extra
- Monta el ConfigMap como volumen.

## Limpieza
	kubectl delete -f ./manifests/pod.yaml
	kubectl delete -f ./manifests/secret.yaml
	kubectl delete -f ./manifests/configmap.yaml
