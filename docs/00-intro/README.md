# Lab 00 - Setup

## Objetivo
Levantar un cluster local con Kind y verificar conectividad.

## Pasos
```bash
./platform/scripts/kind-up.sh
kubectl get nodes -o wide