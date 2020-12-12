# Treasure Hunt

## Red Challenge

Find a flag.

```shell
❯ kubens treasure-hunt

❯ kubectl get pods
NAME                              READY   STATUS    RESTARTS   AGE
docker-registry-6b5b55b44-zgvxf   1/1     Running   0          42m
victim-68bcd4465f-q4pkb           1/1     Running   0          42m

❯ kubectl exec -it victim-68bcd4465f-q4pkb sh
/ #
```

<details>
<summary>Hint 1</summary>
Where are the Docker Registry credentials?
</details>

<details>
<summary>Hint 2</summary>
Overlayfs
</details>

## Blue Challenge

* Restricted access betweeen pods
* Detect access to Docker Registry with falco
