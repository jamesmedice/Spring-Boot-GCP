# Spring vs GCP


run the script ./create 

kubectl exec -it mysql /bin/bash

root@mysql:/# mysql -u root -D mysql -proot_password


kubectl exec -it mysql-client /bin/ash 
 
mysql -h mysql -u your_user -D your_database -pyour_password


kubectl exec mysql -it -- env | grep MYSQL_ROOT_PASSWORD
 
 
kubectl exec mysql -it -- env | grep SECRETS_USER
 

kubectl exec mysql -it -- env | grep SECRETS_PASSWORD