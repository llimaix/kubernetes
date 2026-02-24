# Instrucciones de Despliegue en Kubernetes

## Desplegar Pod desde YAML Declarativo

```bash
kubectl apply -f pod.yaml
```

### ¿Por qué usar `kubectl apply`?

**Ventajas del comando `apply`:**
- ✅ **Idempotente**: Puedes ejecutarlo múltiples veces sin problemas
- ✅ **Actualizaciones**: Detecta cambios y actualiza recursos existentes
- ✅ **Gestión de configuración**: Mantiene el estado deseado vs actual
- ✅ **Rollbacks**: Facilita volver a versiones anteriores
- ✅ **CI/CD friendly**: Perfecto para pipelines automatizados

### Diferencias entre comandos de despliegue

| Comando | Propósito | Comportamiento | Caso de uso |
|---------|-----------|----------------|-------------|
| `kubectl create` | **Crear** recursos nuevos | ❌ Falla si el recurso existe | Creación inicial única |
| `kubectl apply` | **Aplicar** configuración | ✅ Crea o actualiza según sea necesario | Gestión continua |
| `kubectl replace` | **Reemplazar** recurso completo | ⚠️ Elimina y recrea el recurso | Cambios drásticos |

#### Ejemplos comparativos:

```bash
# CREATE - Solo funciona la primera vez
kubectl create -f pod.yaml
kubectl create -f pod.yaml  # ❌ Error: already exists

# APPLY - Siempre funciona
kubectl apply -f pod.yaml
kubectl apply -f pod.yaml   # ✅ Sin cambios o actualiza diferencias

# REPLACE - Reemplaza completamente
kubectl replace -f pod.yaml  # ⚠️ Elimina el pod actual y crea uno nuevo
```

### Flujo recomendado para producción:

```bash
# 1. Aplicar configuración
kubectl apply -f pod.yaml

# 2. Verificar cambios antes de aplicar
kubectl diff -f pod.yaml

# 3. Aplicar con validación
kubectl apply -f pod.yaml --validate=true

# 4. Aplicar solo en dry-run (simulación)
kubectl apply -f pod.yaml --dry-run=client
```

## Crear Servicio Load Balancer (Imperativo)

```bash
kubectl expose pod <nombre-pod> --type=LoadBalancer --port=<puerto> --target-port=<puerto-destino>
```

### Alternativa Declarativa (Recomendada):

En lugar del comando imperativo, es mejor usar un archivo YAML:

```yaml
# service.yaml
apiVersion: v1
kind: Service
metadata:
  name: mi-servicio
spec:
  selector:
    app: mi-app
  ports:
    - port: 80
      targetPort: 8080
  type: LoadBalancer
```

```bash
# Aplicar el servicio declarativamente
kubectl apply -f service.yaml
```

**Ventajas del enfoque declarativo:**
- 📝 **Versionable**: Se puede versionar en Git
- 🔄 **Reproducible**: Mismo resultado en cualquier entorno
- 👥 **Colaborativo**: El equipo puede revisar cambios
- 🛡️ **Auditable**: Historial completo de cambios

## Verificar Despliegue

```bash
# Verificar estado del pod
kubectl get pods

# Verificar estado del servicio
kubectl get services

# Obtener IP externa (puede tomar algunos minutos)
kubectl get services --watch

# Verificar descripción detallada
kubectl describe pod <nombre-pod>
kubectl describe service <nombre-servicio>

# Ver logs del pod
kubectl logs <nombre-pod>

# Verificar eventos del cluster
kubectl get events --sort-by=.metadata.creationTimestamp
```

## Acceder a la Aplicación

Una vez que se asigne la IP externa, accede a tu aplicación en:
```
http://<ip-externa>:<puerto>
```

### Métodos alternativos de acceso:

```bash
# 1. Port Forward (desarrollo local)
kubectl port-forward pod/<nombre-pod> 8080:80
# Acceder en: http://localhost:8080

# 2. NodePort (testing en cluster)
kubectl expose pod <nombre-pod> --type=NodePort --port=80
# Acceder en: http://<node-ip>:<node-port>

# 3. Ingress (producción con dominio)
kubectl apply -f ingress.yaml
# Acceder en: http://mi-dominio.com
```

## Limpieza de Recursos

```bash
# Eliminar usando los mismos archivos YAML
kubectl delete -f pod.yaml
kubectl delete -f service.yaml

# O eliminar por nombre
kubectl delete pod <nombre-pod>
kubectl delete service <nombre-servicio>

# Eliminar todo con una etiqueta específica
kubectl delete all -l app=mi-app
```