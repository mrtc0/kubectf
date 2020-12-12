#!/bin/bash

kubectl apply -Rf manifests/00_namespaces/
echo "✅ Create namespace"

kubectl apply -f manifests/gatekeeper/00_gatekeeper.yaml
kubectl apply -f manifests/gatekeeper/hostpath/00_template.yaml
echo "✅ Create Gatekeeper"

# mountme
minikube ssh -- mkdir -p /home/docker/mountme1
scp -o StrictHostKeyChecking=no -i $(minikube ssh-key) manifests/flags/mountme/FLAG.txt docker@$(minikube ip):/home/docker/mountme1/FLAG.txt

kubectl apply -f manifests/01_challenges/mountme/job-sa.yaml
kubectl apply -f manifests/01_challenges/mountme/victim.yaml

echo "✅ mountme OK"

# mountme2
minikube ssh -- mkdir -p /home/docker/mountme2
scp -o StrictHostKeyChecking=no -i $(minikube ssh-key) manifests/flags/mountme2/FLAG.txt docker@$(minikube ip):/home/docker/mountme2/FLAG.txt

kubectl apply -f manifests/01_challenges/mountme2/job-sa.yaml
kubectl apply -f manifests/01_challenges/mountme2/victim.yaml
echo "✅ mountme2 OK"

# treasure hunt
kubectl apply -f manifests/01_challenges/treasure-hunt/victim.yaml
kubectl apply -f manifests/01_challenges/treasure-hunt/docker-registry/secrets.yml
kubectl apply -f manifests/01_challenges/treasure-hunt/docker-registry/deployment.yml
kubectl apply -f manifests/01_challenges/treasure-hunt/docker-registry/registry-config.yml
kubectl apply -f manifests/01_challenges/treasure-hunt/docker-registry/service.yml

cd manifests/01_challenges/treasure-hunt/flag

while :
do
  kubectl get pods -n treasure-hunt | grep docker-registry | grep Running
  if [ $? = 0 ]; then
    break
  fi
  echo "🕒 Waiting for a pod to running..."
  sleep 5
done

kubectl -n treasure-hunt port-forward svc/docker-registry 5000 &
sleep 10

cat docker-registry-password | docker -D login --username ctf --password-stdin https://docker.for.mac.localhost:5000
docker build -t docker.for.mac.localhost:5000/flag/image:latest .
docker push docker.for.mac.localhost:5000/flag/image:latest
pkill -f 'kubectl -n treasure-hunt port-forward'
cd ../../../../

echo "✅ treasure-hunt OK"

# can you keep a secret?
minikube ssh -- sudo cat /var/lib/minikube/certs/etcd/ca.crt > manifests/01_challenges/can-you-keep-a-secret/ca.crt
minikube ssh -- sudo cat /var/lib/minikube/certs/etcd/healthcheck-client.key > manifests/01_challenges/can-you-keep-a-secret/healthcheck-client.key
minikube ssh -- sudo cat /var/lib/minikube/certs/etcd/healthcheck-client.crt > manifests/01_challenges/can-you-keep-a-secret/healthcheck-client.crt
kubectl -n can-you-keep-a-secret create secret generic etcd-credentials --from-file=ETCD_CA=manifests/01_challenges/can-you-keep-a-secret/ca.crt --from-file=ETCD_CRT=manifests/01_challenges/can-you-keep-a-secret/healthcheck-client.crt --from-file=ETCD_KEY=manifests/01_challenges/can-you-keep-a-secret/healthcheck-client.key

kubectl apply -f manifests/01_challenges/can-you-keep-a-secret/victim.yaml
kubectl apply -f manifests/01_challenges/can-you-keep-a-secret/flag.yaml
echo "✅ can you keep a secret? OK"

# sniff
kubectl apply -f manifests/01_challenges/sniff/service.yml
kubectl apply -f manifests/01_challenges/sniff/server.yaml
kubectl apply -f manifests/01_challenges/sniff/victim.yaml
kubectl apply -f manifests/01_challenges/sniff/client.yaml
echo "✅ sniff OK"

kubectl apply -f manifests/gatekeeper/hostpath/01_constraint.yaml
echo "✅ Create Gatekeeper Constraint"
echo "✅ All Done !!1"
