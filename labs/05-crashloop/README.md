# Lab 05 - CrashLoop

## Objetivo
Provocar un CrashLoopBackOff y aprender a diagnosticarlo.

## Archivos
- Manifests: `./manifests/crashloop-pod.yaml`, `./manifests/restart-always.yaml`, `./manifests/restart-onfailure.yaml`, `./manifests/restart-never.yaml`

## Pasos
1. Aplicar el manifest:

	kubectl apply -f ./manifests/crashloop-pod.yaml

2. Esperar el error:

	kubectl get pods -w

3. Investigar:

	kubectl describe pod crash-pod
	kubectl logs crash-pod

## Validaciones
- El Pod debe entrar en `CrashLoopBackOff`.
- Debes identificar el error en los logs.

## Desafío extra
- Corrige el comando para que quede `Running`.
- Prueba las tres políticas de reinicio y compara resultados.

## Limpieza
	kubectl delete -f ./manifests/crashloop-pod.yaml
