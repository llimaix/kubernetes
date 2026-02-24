# 08 - Production

## Objetivo
Aplicar prácticas de producción: recursos, health checks y despliegues seguros.

## Prerrequisitos
- Haber completado `docs/07-gitops/README.md`.
- Entender Deployments y probes.

## Conceptos clave
- **Requests/Limits**: reserva y límite de CPU/Memoria.
- **Readiness/Liveness**: salud del servicio.
- **Rollout strategies**: `RollingUpdate`, `Recreate`.
- **Hardening**: mínimo privilegio, imágenes pequeñas.

## Ejemplo mínimo de recursos
```yaml
resources:
  requests:
    cpu: "100m"
    memory: "128Mi"
  limits:
    cpu: "250m"
    memory: "256Mi"
```

## Práctica guiada (conceptual)
1. Identifica en tus manifests dónde ubicar `resources`.
2. Define probes sencillas de HTTP o TCP.
3. Evalúa qué pasa cuando un rollout falla.

## Validaciones
- Los Pods deben tener requests y limits definidos.
- El rollout debe completar sin errores.

## Check rápido
- ¿Qué pasa si no defines limits?
- ¿Cuál es la diferencia entre readiness y liveness?
