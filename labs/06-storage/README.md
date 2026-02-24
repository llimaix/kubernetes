# Lab 06 - Storage

## Objetivo
Crear un PVC y montarlo en un Pod para persistir datos.

## Archivos
- Manifests: `./manifests/pvc.yaml`, `./manifests/pod.yaml`

## Pasos
1. Crear el PVC:

    kubectl apply -f ./manifests/pvc.yaml

2. Verificar el estado:

    kubectl get pvc

3. Crear el Pod:

    kubectl apply -f ./manifests/pod.yaml

4. Escribir un archivo de prueba:

    kubectl exec -it storage-pod -- sh -c 'echo hola > /data/hello.txt'

## Validaciones
- El PVC debe quedar en `Bound`.
- El archivo `hello.txt` debe existir:

    kubectl exec -it storage-pod -- cat /data/hello.txt

## Desafío extra
- Borra el Pod y créalo de nuevo para validar persistencia.

## Limpieza
    kubectl delete -f ./manifests/pod.yaml
    kubectl delete -f ./manifests/pvc.yaml
