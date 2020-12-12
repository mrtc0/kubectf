# Mount me 2

## Red Challenge

Node の `/home/docker/mountme2` に flag があります。

```shell
❯ kubens mountme2

❯ kubectl get pods
NAME                      READY   STATUS    RESTARTS   AGE
victim-7c5745b4dc-42mx8   1/1     Running   0          53m

❯ kubectl exec -it victim-7c5745b4dc-42mx8 bash
I have no name!@victim-7c5745b4dc-42mx8:/$
```

<details>
<summary>Hint 1</summary>
hostPath マウントは Gatekeeper で禁止されています。
</details>

<details>
<summary>Hint 2</summary>
Namespace
</details>


## Blue Challenge

* Disable create privileged container with OPA
* Detect create privileged container with falco
