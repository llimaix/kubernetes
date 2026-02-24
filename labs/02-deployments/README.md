# Lab 02 - Deployments

## Objetivo
Crear un Deployment, escalar réplicas y validar rollout.

## Archivos
- Manifests: `./manifests/deployment.yaml`

## Pasos
1. Aplicar el Deployment:

	kubectl apply -f ./manifests/deployment.yaml

2. Revisar el estado:

	kubectl get deploy web-deploy

3. Escalar a 3 réplicas:

	kubectl scale deploy web-deploy --replicas=3

## Validaciones
- Debes ver 3 Pods `Running`.
- El rollout debe estar en `success`:

	kubectl rollout status deployment/web-deploy

## Desafío extra
- Cambia la imagen a `nginx:1.25` y observa el rollout.

## Limpieza
	kubectl delete -f ./manifests/deployment.yaml
