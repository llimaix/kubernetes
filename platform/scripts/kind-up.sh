#!/usr/bin/env bash
set -euo pipefail

CLUSTER_NAME="k8s-guide"
CONFIG_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/kind/kind-config.yaml"

if kind get clusters | grep -q "^${CLUSTER_NAME}$"; then
  echo "Kind cluster '${CLUSTER_NAME}' ya existe."
  exit 0
fi

kind create cluster --name "${CLUSTER_NAME}" --config "${CONFIG_PATH}"
kubectl cluster-info