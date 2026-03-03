# Restart Policies (Pod)

## Objetivo
Entender cómo Kubernetes reinicia contenedores según la política configurada.

## Políticas disponibles
- **Always**: reinicia siempre (por defecto).
- **OnFailure**: reinicia solo si el contenedor falla.
- **Never**: nunca reinicia.

## Ejemplo básico
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: ejemplo-restart
spec:
  restartPolicy: OnFailure
  containers:
    - name: busybox
      image: busybox:1.36
      command: ["sh", "-c", "echo boom && exit 1"]
```

## Uso recomendado
- `Always`: Deployments / ReplicaSets.
- `OnFailure`: Jobs.
- `Never`: debugging o pruebas puntuales.
