# Declarativo vs Imperativo

## Objetivo
Entender cuándo usar `apply`, `create` y `replace`.

## Comparativa rápida
| Comando | Propósito | Comportamiento | Uso recomendado |
| --- | --- | --- | --- |
| `kubectl create` | Crear | Falla si existe | Creación puntual |
| `kubectl apply` | Crear/Actualizar | Idempotente | Gestión continua |
| `kubectl replace` | Reemplazar | Elimina y recrea | Cambios drásticos |

## Flujo recomendado
```bash
kubectl diff -f recurso.yaml
kubectl apply -f recurso.yaml --validate=true
```

## Ventajas del enfoque declarativo
- Versionable y reproducible.
- Facilita revisión de cambios.
- Ideal para GitOps.
