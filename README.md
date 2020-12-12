# kubectf

# Requirements

* minikube
* kubectl
* Docker Engine
  * Add `{ "insecure-registries": ["docker.for.mac.localhost:5000"] }` to Docker configuration.

more information [docs/requirements.md](docs/requirements.md)

# Getting Started

```shell
$ minikube start --driver=virtualbox
$ ./setup.sh
```

# Rule

Assuming you've penetrated a vulnerable Pod, perform a privilege escalation and look for a Flag (a string of the format `k8sctf{...}` ).  
There is a victim pod in the namespace for each problem, and you enter into this pod to challenge the problem.  
No changes should be made to anifests. You should work within Pod as a attacker.

```shell
$ kubens mountme
❯ kubectl get pods
NAME                      READY   STATUS    RESTARTS   AGE
victim-7c5745b4dc-jxd5t   1/1     Running   0          14m

❯ kubectl exec -it victim-7c5745b4dc-jxd5t bash
I have no name!@victim-7c5745b4dc-jxd5t:/$
```

# Challenges

| Title | Difficulty | Description |
|:-----:|:---------:|:----------:|
| Mount me | 🔥 | [Link](manifests/01_challenges/mountme/README.md) |
| Can You Keep A Secret? | 🔥 | [Link](manifests/01_challenges/can-you-keep-a-secret/README.md) |
| Treasure Hunt | 🔥🔥 | [Link](manifests/01_challenges/treasure-hunt/README.md) |
| Mount me 2 | 🔥🔥 | [Link](manifests/01_challenges/mountme2/README.md) |
| Sniff | 🔥🔥 | [Link](manifests/01_challenges/sniff/README.md) |

# Writeups

TBD

