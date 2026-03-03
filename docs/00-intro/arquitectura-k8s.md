# Arquitectura de Kubernetes (Resumen)

## Objetivo
Entender los componentes principales del Control Plane y los nodos para tener un mapa mental del cluster.

## Control Plane
- **API Server**: punto de entrada; valida y expone la API.
- **Controller Manager**: mantiene el estado deseado (replicas, endpoints, etc.).
- **Scheduler**: decide en qué nodo se ejecuta cada Pod.
- **etcd**: base de datos clave-valor con el estado del cluster.
- **DNS**: resolución interna de servicios.
- **Cloud Controller Manager**: integración con proveedores cloud.

## Nodos (Worker)
- **Kubelet**: agente que ejecuta Pods y reporta al API Server.
- **Kube Proxy**: reglas de red y balanceo interno.
- **Runtime**: ejecuta contenedores (containerd, CRI-O).

## Flujo mental rápido
1. Declaras estado deseado (manifest).
2. API Server valida y guarda en etcd.
3. Scheduler decide el nodo.
4. Kubelet ejecuta el Pod.
5. Controladores reconcilian si hay drift.

## Check rápido
- ¿Cuál es la función principal del API Server?
- ¿Qué componente decide el nodo destino?
- ¿Dónde se guarda el estado del cluster?
