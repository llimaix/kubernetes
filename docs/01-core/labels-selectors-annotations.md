# Labels, Selectors y Annotations (Core)

## Labels
**Labels** son pares clave/valor usados para clasificar y **seleccionar** objetos.
Se usan para:
- Deployments/ReplicaSets (controlar Pods)
- Services (enrutar tráfico a Pods)
- NetworkPolicies, herramientas de observabilidad, etc.

### Convención recomendada (production-grade)
Usa el set estándar `app.kubernetes.io/*`:
- `app.kubernetes.io/name`
- `app.kubernetes.io/instance`
- `app.kubernetes.io/component`
- `app.kubernetes.io/part-of`
- `app.kubernetes.io/managed-by`

Ejemplo:
```yaml
metadata:
  labels:
    app.kubernetes.io/name: nginx
    app.kubernetes.io/part-of: k8s-guide
    env: dev
