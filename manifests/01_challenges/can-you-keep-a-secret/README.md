# Can You Keep A Secret?

The victim pod is for operating etcd on Kubernetes cluster.  
Flag is in `secret` in `kube-system` namespace.

```shell
$ kubens can-you-keep-a-secret
❯ kubectl get pods
NAME                      READY   STATUS    RESTARTS   AGE
victim-56958dffc6-8chjx   1/1     Running   0          27m
❯ kubectl exec -it victim-56958dffc6-8chjx sh
/ #
```

<details>
<summary>Hint 1</summary>
Network namespace is not isolated.
</details>

