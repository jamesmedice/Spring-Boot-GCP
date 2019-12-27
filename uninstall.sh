#!/bin/bash
kubectl delete secret mysqlcontainer
rm secret.yaml

kubectl delete -f configmap.yaml
kubectl delete -f pod.yaml
 