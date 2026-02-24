# 07 - GitOps

## Objetivo
Adoptar el enfoque declarativo con control de versiones y reconciliación automática.

## Prerrequisitos
- Haber completado `docs/06-observability/README.md`.
- Entender manifests limpios.

## Conceptos clave
- **Declarativo**: el repo describe el estado deseado.
- **Reconciliación**: un operador aplica cambios automáticamente.
- **Fuente de verdad**: Git es la única fuente de cambios.
- **Auditabilidad**: historial de cambios y revisiones.

## Práctica guiada (conceptual)
1. Revisa la estructura de `labs/` y `docs/`.
2. Identifica qué cambios serían “drift” si se modifican manualmente en el cluster.
3. Piensa cómo automatizarías el apply de manifests.

## Validaciones
- Los manifests no deben incluir `status` ni campos runtime.
- Los cambios pasan por revisión (pull request).

## Check rápido
- ¿Cuál es el rol de Argo CD o Flux?
- ¿Por qué Git es la fuente de verdad?

## Siguiente paso
Ir a `docs/08-production/README.md`.
