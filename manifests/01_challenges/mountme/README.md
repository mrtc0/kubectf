# Mount me

## Red Challenge

Flag is in /home/docker/mount1 directory at node.

```shell
$ kubens mountme
$ kubectl exec -it vicitm-7c5745b4dc-jxd5t bash
```

<details>
<summary>Hint 1</summary>
What are the privileges of the mounted ServiceAccount?
</details>

<details>
<summary>Hint 2</summary>
hostPath mount
</details>

## Blue Challenge

* Disable hostPath mount with OPA 
* Detect hostPath mount with falco
