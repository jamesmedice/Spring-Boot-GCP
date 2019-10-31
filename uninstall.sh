#!/bin/bash
kubectl delete deployment catalogservice 
kubectl delete secret mysqlcontainer
kubectl delete secret gcr-json-key

kubectl delete -f configmap.yaml
kubectl delete -f pod.yaml
kubectl delete -f rbac.yaml

kubectl delete svc invoice
rm secret.yaml

 