kubectl create namespace traffic-test
kubectl config set-context --current --namespace=traffic-test

kubectl run front-end-app --image=nginx --labels=role=front-end --port=80 --expose
kubectl run back-end-api-app --image=nginx --labels=role=back-end-api --port=80 --expose
kubectl run admin-front-end-app --image=nginx --labels=role=admin-front-end --port=80 --expose
kubectl run admin-back-end-api-app --image=nginx --labels=role=admin-back-end-api --port=80 --expose
