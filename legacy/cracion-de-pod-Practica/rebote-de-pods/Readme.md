# Rebote de Pods en Kubernetes

## ¿Qué contiene esta carpeta?

Esta carpeta contiene ejemplos y configuraciones relacionadas con el comportamiento de rebote (restart) de pods en Kubernetes.

## ¿Cómo funciona el rebote de pods?

### Comportamiento por defecto

Por defecto, Kubernetes utiliza la política de reinicio `Always` para los pods, lo que significa:

- **restartPolicy: Always** - Los contenedores se reinician automáticamente si fallan
- Los pods se reinician en el mismo nodo donde estaban ejecutándose
- El tiempo entre reinicios aumenta exponencialmente (backoff): 10s, 20s, 40s, etc.
- Después de 5 minutos sin fallos, el timer se reinicia

### Políticas de reinicio disponibles

1. **Always** (por defecto)
    - Reinicia siempre que el contenedor termine
    - Usado en Deployments, DaemonSets, ReplicaSets

2. **OnFailure**
    - Solo reinicia si el contenedor falla (exit code != 0)
    - Útil para Jobs

3. **Never**
    - Nunca reinicia el contenedor
    - El pod queda en estado Failed/Succeeded

### Ejemplo básico

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: ejemplo-rebote
spec:
  restartPolicy: Always  # Por defecto
  containers:
  - name: mi-app
     image: nginx
```

El rebote de pods es fundamental para la autorecuperación y alta disponibilidad en clústeres de Kubernetes.



