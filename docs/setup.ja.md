# Requirements

## 1. クラスタの構築

```shell
$ minikube start --driver=virtualbox
```

## 2. 問題の登録

```shell
$ ./setup.sh
```

特にエラーもなく、次のような namespace が作成されていれば OK です。

```shell
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
