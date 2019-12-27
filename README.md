# Spring vs GCP


generate api key 
gcloud auth application-default login


Credentials saved to file: [/tmp/tmp.dG9nLliG41/application_default_credentials.json]






cluster info :  gcloud container clusters get-credentials  spring-boot-cluster  --zone europe-north1-a

gcloud config set project [PROJECT_ID]

clone the repo !!!

tiago_sllater@cloudshell:~/Spring-Boot-GCP (perceptive-day-252709)$ gcloud app deploy ./src/main/appengine/app.yaml


connect mysql : mysql -h mysql -u your_user -D your_database -pyour_password



create secret : 

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


 # DOCKER 
 
docker build -t  gcr.io/perceptive-day-252709/springbootgcp:v1
docker build -t gcr.io//springbootdb-java:v1 .

docker run -ti --rm -p 8080:8080 gcr.io//springbootdb-java:v1

gcloud docker -- push gcr.io//springbootdb-java:v1
 

kubectl run [deployment name] --image=gcr.io/perceptive-day-252709/springbootgcp:latest --port 8080

kubectl get pods
kubectl get deployment

kubectl exec -ti [pod name -> secretenv] env

kubectl expose deployment [deployment name] --type=LoadBalancer --port 80 --target-port 8080