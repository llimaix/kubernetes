# Labels y Annotations

## Labels
Pares clave/valor para organizar y **seleccionar** objetos.

Usos:
- selectors (Service, Deployment)
- filtros por app/entorno/equipo
- agrupación lógica para operaciones

Ejemplo:
```yaml
metadata:
  labels:
    app: frontend
    env: dev
    version: v1
