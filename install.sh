#!/bin/bash
kubectl create secret generic gcr-json-key --from-file=credentials.json=./src/main/resources/serviceaccount.json
kubectl create secret generic mysqlcontainer --from-literal=username=james --from-literal=password=tpm1234
kubectl get secret  mysqlcontainer -o yaml > secret.yaml
kubectl apply  -f  secret.yaml
kubectl apply  -f  rbac.yaml
kubectl apply  -f  configmap.yaml
kubectl apply  -f  pod.yaml

kubectl patch serviceaccount  default -p '{"imagePullSecrets": [{"name": "mysqlcontainer"}]}'
kubectl get   serviceaccounts default -o yaml > serviceaccounts.yaml