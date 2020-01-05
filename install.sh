#!/bin/bash
kubectl create secret generic mysqlcontainer --from-literal=username=james --from-literal=password=tpm1234
kubectl create secret generic cloudsql-instance-credentials --from-file=credentials.json=../key.json