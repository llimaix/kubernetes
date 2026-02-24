#!/usr/bin/env bash
set -euo pipefail

# ============================================================
# migrate_lessons.sh
# Repositorio solamente: copia desde ramas legacy -> estructura senior
# No kubectl, no ejecuciones de labs.
# ============================================================

BR_DEPLOY="origin/deployments"
BR_PODS="origin/cracion-de-pod-Practica"

DOCS_DIRS=(
  "docs/00-intro"
  "docs/01-core"
  "docs/02-workloads"
  "docs/03-networking"
  "docs/04-storage"
  "docs/05-security"
  "docs/06-observability"
  "docs/07-gitops"
  "docs/08-production"
)

LABS_DIRS=(
  "labs/00-setup"
  "labs/01-pods"
  "labs/02-deployments"
  "labs/03-services"
  "labs/04-config-secrets"
  "labs/05-crashloop"
)

log(){ printf "\n%s\n" "$*"; }
warn(){ printf "\nWARN: %s\n" "$*"; }
die(){ printf "\nERROR: %s\n" "$*"; exit 1; }

ensure_dir(){ mkdir -p "$1"; }

ensure_readme(){
  local target="$1"
  local title="$2"
  local body="$3"
  if [[ ! -f "$target" ]]; then
    cat > "$target" <<EOF
# $title

$body
EOF
  fi
}

safe_git_show(){
  # usage: safe_git_show <ref>:<path> <out>
  local refpath="$1"
  local out="$2"
  if git cat-file -e "$refpath" 2>/dev/null; then
    git show "$refpath" > "$out"
    return 0
  fi
  return 1
}

# ---- Pre-checks ----
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || die "Ejecuta esto dentro de un repo git."
git fetch origin --prune >/dev/null 2>&1 || warn "No pude hacer fetch (si ya tienes refs no pasa nada)."

git rev-parse --verify "$BR_DEPLOY" >/dev/null 2>&1 || warn "No existe $BR_DEPLOY (se copiará lo que se pueda)."
git rev-parse --verify "$BR_PODS"   >/dev/null 2>&1 || warn "No existe $BR_PODS (se copiará lo que se pueda)."

# ---- 1) Validar/crear estructura base ----
log "1) Validando/creando estructura base"

for d in "${DOCS_DIRS[@]}"; do ensure_dir "$d"; done
for d in "${LABS_DIRS[@]}"; do ensure_dir "$d"; done

ensure_dir "legacy/deployments"
ensure_dir "legacy/cracion-de-pod-Practica"

ensure_dir "labs/01-pods/manifests"
ensure_dir "labs/02-deployments/manifests"
ensure_dir "labs/03-services/manifests"
ensure_dir "labs/04-config-secrets/manifests"
ensure_dir "labs/05-crashloop/manifests"

# ---- 2) Docs README base ----
log "2) Rellenando docs/* con README base (si faltan)"

ensure_readme "docs/00-intro/README.md" "00 - Intro" \
"Contexto y prerequisitos para iniciar."

ensure_readme "docs/01-core/README.md" "01 - Core" \
"Conceptos esenciales: Pods, labels/selectors/annotations, namespaces."

ensure_readme "docs/02-workloads/README.md" "02 - Workloads" \
"Controladores: Deployments, ReplicaSets, Jobs (posterior)."

ensure_readme "docs/03-networking/README.md" "03 - Networking" \
"Services, DNS interno, Ingress (introducción), NetworkPolicies (básico)."

ensure_readme "docs/04-storage/README.md" "04 - Storage" \
"Volumes, PV/PVC, StorageClasses (concepto)."

ensure_readme "docs/05-security/README.md" "05 - Security" \
"ServiceAccounts, RBAC, SecurityContext, Secrets (buenas prácticas)."

ensure_readme "docs/06-observability/README.md" "06 - Observability" \
"Logs, events, probes, métricas (introducción)."

ensure_readme "docs/07-gitops/README.md" "07 - GitOps" \
"Principios GitOps y estructura de repo declarativa."

ensure_readme "docs/08-production/README.md" "08 - Production" \
"Patrones de producción: recursos, probes, rollout strategies, hardening."

# ---- 3) Labs README base ----
log "3) Rellenando labs/* con README base (si faltan)"

ensure_readme "labs/00-setup/README.md" "Lab 00 - Setup" \
"Preparación del entorno. (Ejecución se ve en fase práctica.)"

ensure_readme "labs/01-pods/README.md" "Lab 01 - Pods" \
"Manifests y explicación de Pods. (Ejecución se ve en fase práctica.)"

ensure_readme "labs/02-deployments/README.md" "Lab 02 - Deployments" \
"Manifests y explicación de Deployments. (Ejecución se ve en fase práctica.)"

ensure_readme "labs/03-services/README.md" "Lab 03 - Services" \
"Manifests y explicación de Services. (Ejecución se ve en fase práctica.)"

ensure_readme "labs/04-config-secrets/README.md" "Lab 04 - ConfigMaps & Secrets" \
"Manifests y explicación de config externa. (Ejecución se ve en fase práctica.)"

ensure_readme "labs/05-crashloop/README.md" "Lab 05 - CrashLoop" \
"Material base para caso CrashLoop. (Ejecución se ve en fase práctica.)"

# ---- 4) Copiar material original a legacy/ ----
log "4) Copiando material original a legacy/ (trazabilidad)"

safe_git_show "$BR_DEPLOY:README.md" "legacy/deployments/README.original.md" \
  || warn "No encontré README.md en $BR_DEPLOY"
safe_git_show "$BR_DEPLOY:apache-deploy.yml" "legacy/deployments/apache-deploy.generated.yaml" \
  || warn "No encontré apache-deploy.yml en $BR_DEPLOY"

safe_git_show "$BR_PODS:README.md" "legacy/cracion-de-pod-Practica/README.original.md" \
  || warn "No encontré README.md en $BR_PODS"
safe_git_show "$BR_PODS:labels-anotaciones.md" "legacy/cracion-de-pod-Practica/labels-anotaciones.original.md" \
  || warn "No encontré labels-anotaciones.md en $BR_PODS"
safe_git_show "$BR_PODS:nginx.yml" "legacy/cracion-de-pod-Practica/nginx.original.yaml" \
  || warn "No encontré nginx.yml en $BR_PODS"
safe_git_show "$BR_PODS:Dockerfile" "legacy/cracion-de-pod-Practica/Dockerfile.original" \
  || warn "No encontré Dockerfile en $BR_PODS"

# Nota: carpeta rebote-de-pods no se copia aquí (evita tar/archiving en macOS).
# Si quieres, la añadimos en una segunda iteración con un método portable.

# ---- 5) Publicar contenido base desde legacy -> estructura senior ----
log "5) Publicando contenido base (docs + labs/manifests) desde legacy branches"

# 5.1 Labels/Annotations doc
cat > "docs/01-core/labels-annotations.md" <<'EOF'
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