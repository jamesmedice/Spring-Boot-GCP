#!/bin/bash
kubectl delete secret mysqlcontainer
rm secret.yaml

kubectl delete -f deployment.yaml
 