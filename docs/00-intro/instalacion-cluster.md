# Instalación y tipos de clústeres

## Objetivo
Conocer las opciones de instalación y escoger la mejor para aprendizaje.

## Tipos de instalación
### Local (aprendizaje/desarrollo)
- **Kind**: cluster dentro de Docker, rápido y liviano.
- **Minikube**: cluster local con VM o contenedor, muy completo.
- **K3s / MicroK8s**: distribuciones ligeras.

### Automatizadas (on-prem / cloud)
- **Kubespray** (Ansible)
- **Kops** (AWS)
- **RKE** (Rancher)

### Managed (producción)
- **EKS**, **AKS**, **GKE**

## Recomendación para este repo
Usaremos **Kind** por rapidez y consistencia con `platform/scripts/`.

## Instalación rápida
### Kind (recomendado)
```bash
./platform/scripts/kind-up.sh
kubectl cluster-info
```

### Minikube (alternativa)
```bash
minikube start --driver=docker
kubectl config use-context minikube
```

## Check rápido
- ¿Cuál es la diferencia entre un cluster local y uno managed?
- ¿Cuándo preferirías Kind sobre Minikube?
