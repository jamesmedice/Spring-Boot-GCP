#!/bin/bash
kubectl create secret generic mysqlcontainer --from-literal=username=james --from-literal=password=tpm1234
kubectl get secret  mysqlcontainer -o yaml > secret.yaml
kubectl apply  -f  secret.yaml

kubectl create secret generic cloudsql-instance-credentials --from-file=credentials.json=../key.json
