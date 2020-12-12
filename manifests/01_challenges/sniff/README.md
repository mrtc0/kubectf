# Sniff

## Red Challenge

Find a flag.

```shell
$ kubectl get pods -n sniff
NAME                      READY   STATUS    RESTARTS   AGE
client-66b6f5cdcf-v5n9j   1/1     Running   0          3m24s
server-79b88f567-v4xsp    1/1     Running   0          3m26s
victim-cb9b4c946-d7vkq    1/1     Running   0          15m

$ kubectl exec -it victim-cb9b4c946-d7vkq bash
```

<details>
<summary>Hint 1</summary>
An HTTP request is being sent from the client to the server.
</details>

<details>
<summary>Hint 2</summary>
DNS Spoofing
</details>

## Blue Challenge

* Drop `CAP_NET_RAW`
* Add a OPA policy to validate `CAP_NET_RAW`
