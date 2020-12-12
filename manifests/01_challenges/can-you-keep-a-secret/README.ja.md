# Can You Keep A Secret?

victim Pod は Kubernetes クラスタの etcd を操作するための Pod です。  
`kube-system` に flag という secret があるので、それを取得してください。

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
Network Namespace が分離されていないということは...?
</details>
