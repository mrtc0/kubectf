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

Pod の一つに侵入することができたという想定で、権限昇格を行って `k8sctf{...}` というフォーマットの文字列(flag)を探し出します。  
各問題の namespace に victim- プレフィックスのついた名前を持つ Pod がいますので、その Pod に入って問題に取り組んでください。

```shell
$ kubens mountme
❯ kubectl get pods
NAME                      READY   STATUS    RESTARTS   AGE
victim-7c5745b4dc-jxd5t   1/1     Running   0          14m

❯ kubectl exec -it victim-7c5745b4dc-jxd5t bash
I have no name!@victim-7c5745b4dc-jxd5t:/$
```

以下細かい点です。

* このリポジトリの中には答えである flag が入っているので、真面目に問題を解きたいひとは見ないようにしてください。
* クラスタ管理者という立場ではなく、victim という Pod に何らかの手段で侵入できた攻撃者という立場で取り組んでください。
  * なので manifest の変更等は禁止です。victim Pod の中から実行可能な範囲のみで取り組んでください。

# Challenges

| Title | Difficulty | Description |
|:-----:|:---------:|:----------:|
| Mount me | 🔥 | [Link](manifests/01_challenges/mountme/README.md) |
| Can You Keep A Secret? | 🔥 | [Link](manifests/01_challenges/can-you-keep-a-secret/README.md) |
| Treasure Hunt | 🔥🔥 | [Link](manifests/01_challenges/treasure-hunt/README.md) |
| Mount me 2 | 🔥🔥 | [Link](manifests/01_challenges/mountme2/README.md) |
| Sniff | 🔥🔥 | [Link](manifests/01_challenges/sniff/README.md) |

# Writeups

2020 年年末に公開します
