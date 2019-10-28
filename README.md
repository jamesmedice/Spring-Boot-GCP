# Spring vs GCP

cluster info :  gcloud container clusters get-credentials  spring-boot-cluster  --zone europe-north1-a

gcloud config set project [PROJECT_ID]

clone the repo !!!

tiago_sllater@cloudshell:~/Spring-Boot-GCP (perceptive-day-252709)$ gcloud app deploy ./src/main/appengine/app.yaml



run the script ./create 

kubectl exec -it mysql /bin/bash

root@mysql:/# mysql -u root -D mysql -proot_password


kubectl exec -it mysql-client /bin/ash 
 
mysql -h mysql -u your_user -D your_database -pyour_password


kubectl exec mysql -it -- env | grep MYSQL_ROOT_PASSWORD
 
 
kubectl exec mysql -it -- env | grep SECRETS_USER
 

kubectl exec mysql -it -- env | grep SECRETS_PASSWORD



kubectl get secret mysqlcontainer -o yaml
apiVersion: v1
data:
  password: dHBtMTIzNA==
  username: cm9vdA==
kind: Secret
metadata:
  annotations:
    kubectl.kubernetes.io/last-applied-configuration: |
      {"apiVersion":"v1","data":{"password":"dHBtMTIzNA==","username":"cm9vdA=="},"kind":"Secret","metadata":{"annotations":{},"creationTimestamp":"2019-10-22T11:58:08Z","name":"mysqlcontainer","namespace":"default","resourceVersion":"3278002","selfLink":"/api/v1/namespaces/default/secrets/mysqlcontainer","uid":"36f690da-f4c3-11e9-879e-42010aa6007f"},"type":"Opaque"}
  creationTimestamp: "2019-10-22T11:58:08Z"
  name: mysqlcontainer
  namespace: default
  resourceVersion: "3278007"
  selfLink: /api/v1/namespaces/default/secrets/mysqlcontainer
  uid: 36f690da-f4c3-11e9-879e-42010aa6007f
type: Opaque



mvn spring-boot:run -Dspring.cloud.kubernetes.secrets.paths=/api/v1/namespaces/default/secrets/mysqlcontainer

mvn spring-boot:run -Dspring.cloud.kubernetes.secrets.name=mysqlcontainer

mvn clean package appengine:deploy

mvn appengine:devserver

mvn appengine:run

mvn appengine:deploy