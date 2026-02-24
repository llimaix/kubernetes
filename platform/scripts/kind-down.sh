#!/usr/bin/env bash
set -euo pipefail

CLUSTER_NAME="k8s-guide"
kind delete cluster --name "${CLUSTER_NAME}"