# Requirements

## 1. minikube のインストール

https://kubernetes.io/ja/docs/tasks/tools/install-minikube/ を参考に minikube をインストールします。

## 2. insecure registry の登録

手元の Docker for Mac の Docker Engine の設定に次の内容を追加します。  
アプリケーションバーから Docker を選択して Preferences -> Docker Engine で追加できます。

```json
{
  "insecure-registries": [
    "docker.for.mac.localhost:5000"
  ]
}
```

