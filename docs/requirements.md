# Requirements

## 1. Install minikube

see https://kubernetes.io/ja/docs/tasks/tools/install-minikube

## 2. Register Insecure Registry

Add Insecure Registry to Docker Engine on your local machine (e.g. On Mac, Preferences -> Docker Engine).

```json
{
  "insecure-registries": [
    "docker.for.mac.localhost:5000"
  ]
}
```

