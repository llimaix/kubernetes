# Lab 03 - Services

## Objetivo
Crear un Service y validar conectividad interna.

## Archivos
- Manifests: `./manifests/service.yaml`

## Pasos
1. Asegúrate de tener Pods `app=web` (del lab anterior).
2. Aplicar el Service:

	kubectl apply -f ./manifests/service.yaml

3. Verificar endpoints:

	kubectl get endpoints web-svc

## Validaciones
- El Service debe tener `ClusterIP`.
- El selector debe apuntar a Pods existentes.

## Desafío extra
- Crea un segundo Service con otro nombre.

## Limpieza
	kubectl delete -f ./manifests/service.yaml
