# Spring vs GCP


generate api key 
gcloud auth application-default login


Credentials saved to file: [/tmp/tmp.dG9nLliG41/application_default_credentials.json]






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


//////////////////////////////////////////////////////////////////////////////////////////////////
Follow the first 5 step given in this link

https://cloud.google.com/sql/docs/mysql/connect-container-engine

change database configuration in your application

hostname: 127.0.0.1
port: 3306 or your mysql port
username: proxyuser

should be same as link step - 3

mvn package -Dmaven.test.skip=true
Create File with name "Dockerfile" and below content

FROM openjdk:8
COPY target/SpringBootWithDB-0.0.1-SNAPSHOT.jar /app.jar
EXPOSE 8080/tcp
ENTRYPOINT ["java", "-jar", "/app.jar"]

docker build -t gcr.io//springbootdb-java:v1 .

docker run -ti --rm -p 8080:8080 gcr.io//springbootdb-java:v1

gcloud docker -- push gcr.io//springbootdb-java:v1

Follow the 6th step given in link and create yaml file

kubectl create -f cloudsql_deployment.yaml

run kubectl get deployment and copy name of deployment

kubectl expose deployment --type=LoadBalancer