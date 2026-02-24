# Labels y Annotations en Kubernetes

## Diferencias Principales

| Labels | Annotations |
|---------|-------------|
| ✅ Para seleccionar objetos | ❌ Solo información |
| ✅ Se usan en filtros | ❌ No se pueden filtrar |
| 📏 Máximo 63 caracteres | 📏 Hasta 262,144 caracteres |

## Labels
Las labels son pares clave-valor que se utilizan para organizar y seleccionar objetos.

**Casos de uso:**
- Filtrar pods: `kubectl get pods -l app=frontend`
- Seleccionar en servicios y deployments
- Organizar por entorno, versión, equipo

```yaml
apiVersion: v1
kind: Pod
metadata:
    name: web-server
    labels:
        app: frontend
        version: v1.0
        environment: production
spec:
    containers:
    - name: nginx
        image: nginx:1.20
```

## Annotations
Las annotations almacenan metadatos adicionales que no se usan para selección.

**Casos de uso:**
- Información para herramientas (Prometheus, Ingress)
- Documentación y contactos
- Historial de builds y deployments

```yaml
apiVersion: v1
kind: Service
metadata:
    name: web-service
    labels:
        app: frontend
    annotations:
        kubernetes.io/created-by: "admin-user"
        deployment.kubernetes.io/revision: "3"
        description: "Servicio web principal"
spec:
    selector:
        app: frontend
    ports:
    - port: 80
        targetPort: 8080
```

## Selector usando Labels
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
    name: frontend-deployment
spec:
    selector:
        matchLabels:
            app: frontend
    template:
        metadata:
            labels:
                app: frontend
                version: v1.0
        spec:
            containers:
            - name: web
                image: nginx:1.20
```