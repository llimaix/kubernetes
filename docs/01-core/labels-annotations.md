# Labels y Annotations

## Diferencias principales
| Labels | Annotations |
| --- | --- |
| ✅ Para seleccionar objetos | ❌ Solo información |
| ✅ Se usan en filtros | ❌ No se pueden filtrar |
| 📏 Máx 63 caracteres | 📏 Hasta 256 KB |

## Labels
Pares clave/valor para organizar y **seleccionar** objetos.

Usos:
- Selectors (Service, Deployment)
- Filtros por app/entorno/equipo
- Agrupación lógica para operaciones

Ejemplo:
```yaml
metadata:
  labels:
    app: frontend
    env: dev
    version: v1
```

## Annotations
Metadata adicional para herramientas o contexto operativo.

Usos:
- Información para herramientas (Prometheus, Ingress)
- Documentación y contactos
- Historial de builds y deployments

Ejemplo:
```yaml
metadata:
  annotations:
    owner: "team-platform"
    description: "Servicio web principal"
```

## Selector con labels
```yaml
spec:
  selector:
    matchLabels:
      app: frontend
```
