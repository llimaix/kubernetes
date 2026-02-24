# 06 - Observability

## Objetivo
Aprender a diagnosticar problemas con logs, eventos y probes.

## Prerrequisitos
- Haber completado `docs/05-security/README.md`.
- Cluster local listo.

## Conceptos clave
- **Logs**: salida estándar del contenedor.
- **Events**: historial de eventos del cluster.
- **Describe**: vista completa de un recurso.
- **Probes**: readiness/liveness/startup.
- **Métricas**: CPU/memoria (si metrics-server está habilitado).

## Comandos esenciales
```bash
kubectl get pods
kubectl describe pod <pod>
kubectl logs <pod>
kubectl get events --sort-by=.metadata.creationTimestamp
```

## Práctica guiada
1. Usa `labs/05-crashloop` para provocar un fallo.
2. Analiza `describe`, `logs` y `events`.
3. Explica la causa del CrashLoop.

## Validaciones
- Debes identificar el error principal en `logs`.
- Debes ver eventos con `Back-off restarting failed container`.

## Check rápido
- ¿Qué diferencia hay entre `logs` y `events`?
- ¿Qué probe usarías para validar disponibilidad?

## Siguiente paso
Ir a `docs/07-gitops/README.md`.
