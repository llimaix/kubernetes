# ☸️ Arquitectura de Kubernetes

## 📘 Introducción
Kubernetes (K8s) es una plataforma **open-source** para la **orquestación de contenedores**, diseñada para automatizar el despliegue, escalado y administración de aplicaciones.  
Su arquitectura se divide en dos grandes bloques: el **Control Plane (Plano de Control)** y los **Nodos (Workers)**.

---

## 📑 Tabla de Contenidos
- [Control Plane (Plano de Control)](#-control-plane-plano-de-control)
  - [API Server](#api-server)
  - [Controller Manager](#controller-manager)
  - [Scheduler](#scheduler)
  - [etcd](#etcd)
  - [Kubernetes DNS](#kubernetes-dns)
  - [Cloud Controller Manager](#cloud-controller-manager)
- [Nodos (Worker Nodes)](#-nodos-worker-nodes)
  - [Kubelet](#kubelet)
  - [Kube Proxy](#kube-proxy)
  - [Container Runtime](#container-runtime)
- [Flujo de Comunicación](#-flujo-de-comunicación)
- [Conclusión](#-conclusión)

---

## 🧩 Control Plane (Plano de Control)

El **Control Plane** actúa como el cerebro del clúster.  
Toma decisiones globales sobre el estado, supervisa los nodos y gestiona la comunicación entre los componentes.

### 🧱 API Server
- Expone la **API RESTful** que sirve como punto de entrada al clúster.  
- Valida, autentica y procesa las peticiones (`kubectl`, paneles, controladores internos).  
- Interactúa con **etcd** para leer o escribir el estado deseado del clúster.

---

### ⚙️ Controller Manager
Componente que agrupa diferentes controladores encargados de mantener el estado deseado del sistema.

**Controladores principales:**
- **Node Controller:** Supervisa la disponibilidad y el estado de los nodos.  
- **Replication Controller:** Garantiza que el número de pods activos coincida con el deseado.  
- **Endpoints Controller:** Crea y actualiza los objetos `Endpoints`, conectando servicios con pods.  
- **Service Account & Token Controller:** Administra las cuentas de servicio y sus tokens de acceso.

---

### 🗓 Scheduler
- Decide **en qué nodo** se ejecutará cada pod.  
- Evalúa recursos disponibles, afinidades, taints y políticas para balancear la carga.  
- Su meta es optimizar el uso de recursos y mantener un sistema eficiente.

---

### 🗃 etcd
- Base de datos **clave-valor distribuida** que almacena el **estado completo** del clúster.  
- Es el **punto de verdad** del sistema: guarda configuraciones, pods, nodos, servicios, etc.  
- Es crítico para la **recuperación** y **persistencia** del clúster.

---

### 🌐 Kubernetes DNS
- Asigna nombres DNS a los servicios y pods.  
- Permite la **resolución interna de nombres**, facilitando la comunicación dentro del clúster.

---

### ☁️ Cloud Controller Manager
- Interactúa con las APIs de los **proveedores cloud** (AWS, GCP, Azure, etc.).  
- Gestiona recursos como balanceadores de carga, volúmenes persistentes y direcciones IP públicas.  
- Permite que Kubernetes sea **agnóstico de la nube** y portable entre entornos.

---

## ⚙️ Nodos (Worker Nodes)

Los **nodos** son las máquinas (físicas o virtuales) que ejecutan los contenedores.  
Cada nodo incluye servicios para mantener los **pods** en funcionamiento y comunicarse con el **Control Plane**.

---

### 🧩 Kubelet
- Es un **agente** que corre en cada nodo.  
- Se asegura de que los **pods asignados** estén activos y saludables.  
- Actúa como un mensajero entre el nodo y el **API Server**, informando su estado y respondiendo órdenes.

---

### 🔗 Kube Proxy
- Gestiona las **reglas de red** internas del clúster.  
- Facilita la conectividad entre servicios y pods (usando `iptables` o `ipvs`).  
- Permite el **balanceo de carga interno** y la comunicación entre los distintos componentes.

---

### 🐳 Container Runtime
- Software responsable de **ejecutar los contenedores**.  
- Kubernetes soporta múltiples runtimes:
  - **Docker** (en versiones antiguas)
  - **containerd**
  - **CRI-O**
- Cada nodo puede ejecutar varios pods, y cada pod puede tener múltiples contenedores.

```plaintext
Nodo
 ├── Kubelet
 ├── Kube Proxy
 ├── Runtime (Docker / containerd / CRI-O)
 │    ├── Pod 1
 │    │    ├── Contenedor A
 │    │    └── Contenedor B
 │    └── Pod 2
 │         └── Contenedor C
