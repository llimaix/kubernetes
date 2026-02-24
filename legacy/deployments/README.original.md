# Deployment: ¿Por qué lo necesitamos?

## La jerarquía simple:

### 🥫 Contenedor
El objeto inicial es un contenedor, el más básico.

### 📦 Pod  
Este contenedor está dentro de un envoltorio llamado **pod**.

### 🚀 Deployment
El pod por sí mismo no puede valerse, es decir:
- ❌ No sabe escalar
- ❌ No sabe replicarse  
- ❌ No sabe recuperarse ante una caída

**Para ello necesita estar dentro de un deployment.**

## ¿Qué hace el Deployment?

```yaml
# Sin Deployment: 1 pod frágil
apiVersion: v1
kind: Pod
metadata:
  name: mi-app
spec:
  containers:
  - name: nginx
    image: nginx
```

```yaml
# Con Deployment: 3 pods robustos
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mi-app
spec:
  replicas: 3  # ¡3 copias!
  selector:
    matchLabels:
      app: mi-app
  template:
    metadata:
      labels:
        app: mi-app
    spec:
      containers:
      - name: nginx
        image: nginx
```

## En resumen:

| Sin Deployment | Con Deployment |
|----------------|----------------|
| 1 pod | 3+ pods |
| Se cae → app muerta | Se cae → se auto-repara |
| No escala | Escala automáticamente |
| Actualizar = downtime | Actualizar sin downtime |

**Regla de oro**: En producción, **SIEMPRE** usa Deployments, nunca Pods solos.

---

## Creando un Deployment de forma imperativa

```bash
kubectl create deployment apache --image=httpd
```

Al momento de crear un deployment, Kubernetes crea automáticamente:
- 📋 El deployment
- 🔄 Un replicaset 
- 🥫 El pod

### Comandos útiles para verificar:

```bash
# Ver el deployment creado
kubectl get deployments

# Ver el replicaset creado automáticamente
kubectl get replicasets

# Ver el pod creado
kubectl get pods

# Ver todo junto
kubectl get all
```

> 💡 Puedes ver el YAML completo generado por este deployment en el archivo [`apache-deploy.yml`](apache-deploy.yml)