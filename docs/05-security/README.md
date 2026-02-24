# 05 - Security

## Objetivo
Entender las bases de seguridad: identidades, permisos y secretos.

## Prerrequisitos
- Haber completado `docs/04-storage/README.md`.
- Cluster local listo.

## Conceptos clave
- **ServiceAccount**: identidad del Pod.
- **RBAC**: control de permisos con Roles/RoleBindings.
- **SecurityContext**: privilegios del contenedor.
- **Secret**: datos sensibles (evita hardcode).

## Ejemplo mínimo de Role
```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: pod-reader
  namespace: default
rules:
  - apiGroups: [""]
    resources: ["pods"]
    verbs: ["get", "list"]
```

## Práctica guiada
1. Revisa `labs/04-config-secrets/manifests/secret.yaml`.
2. Identifica cómo un Pod lee el Secret.
3. Discute qué permisos mínimos necesitaría ese Pod.

## Validaciones
- Los Secrets deben existir sin exponerse en logs.
- Revisa ServiceAccount en los Pods:

    kubectl get pod <pod> -o jsonpath='{.spec.serviceAccountName}'

## Check rápido
- ¿Por qué no debemos commitear secretos en texto plano?
- ¿Qué hace un RoleBinding?

## Siguiente paso
Ir a `docs/06-observability/README.md`.
