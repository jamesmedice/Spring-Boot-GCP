#!/bin/bash
kubectl create secret generic mysqlcontainer --from-literal=username=james --from-literal=password=tpm1234
kubectl get secret  mysqlcontainer -o yaml > secret.yaml
kubectl apply  -f  secret.yaml
kubectl apply  -f  configmap.yaml
kubectl apply  -f  pod.yaml