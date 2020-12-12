# Requirements

## 1. Create a cluster

```shell
$ minikube start --driver=virtualbox
```

## 2. Setup challenges

```shell
$ ./setup.sh
```

Make sure you have the following namespace.

```
❯ kubectl get ns
NAME                    STATUS   AGE
can-you-keep-a-secret   Active   13m
default                 Active   14m
kube-node-lease         Active   14m
kube-public             Active   14m
kube-system             Active   14m
mountme                 Active   13m
mountme2                Active   13m
treasure-hunt           Active   13m
```
