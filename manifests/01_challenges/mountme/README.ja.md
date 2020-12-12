# Mount me

## Red Challenge

フラグはノードの /home/docker/mount1 にあります。

```shell
$ kubens mountme
$ kubectl exec -it vicitm-7c5745b4dc-jxd5t bash
```

<details>
<summary>Hint 1</summary>
マウントされている ServiceAccount の権限は？
</details>

<details>
<summary>Hint 2</summary>
hostPath マウント
</details>

## Blue Challenge

* Disable hostPath mount with OPA 
* Detect hostPath mount with falco
